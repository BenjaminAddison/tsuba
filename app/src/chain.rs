//! The signal path row shared by Editor (click toggles a block) and Effects (click selects it). Drag any block to
//! reorder the live path; the others slide to their new places, and dropping writes the whole chain.

use std::collections::HashMap;

use eframe::egui::{emath::easing, pos2, vec2, Align2, Color32, Id, Rect, Sense, Shape, Stroke, Ui};
use katana::amp::CHAIN;
use katana::catalog::Param;
use katana::sysex;

use crate::theme::*;
use crate::worker::Cmd;
use crate::{store, App};

const SLIDE: f64 = 0.18; // reorder slide, ease-out
pub const DIV: u8 = 17;
pub const MXDV: u8 = 18;
pub const AMP: u8 = 2;

#[derive(Default)]
pub struct State {
    pub sel: Option<u8>,
    drag: Option<(u8, usize)>,
    /// Per block: (from x, to x, start time) for the slide.
    anim: HashMap<u8, (f32, f32, f64)>,
}

#[derive(Clone, Copy, PartialEq)]
pub enum Mode {
    Toggle,
    Select,
}

/// Short name, full name and effects-map blocks for each chain block ID (notes/07).
pub fn info(id: u8) -> (&'static str, &'static str, &'static [&'static str]) {
    match id {
        0 => ("COMP", "COMPRESSOR", &["COMP"]),
        1 => ("S/R", "SEND / RETURN", &["SEND_RETURN"]),
        2 => ("AMP", "PREAMP A", &["PREAMP_A"]),
        3 => ("PRE B", "PREAMP B", &["PREAMP_B"]),
        4 => ("EQ", "EQ", &["EQ"]),
        5 => ("FX1", "FX 1", &["FX1"]),
        6 => ("FX2", "FX 2", &["FX2"]),
        7 => ("DLY", "DELAY", &["DELAY", "DELAY2"]),
        8 => ("CHORUS", "CHORUS", &["CHORUS"]),
        9 => ("REV", "REVERB", &["REVERB"]),
        10 => ("ACCEL", "ACCEL FX", &["ACCEL_FX"]),
        11 => ("PDL", "PEDAL FX", &["PEDAL_FX"]),
        12 => ("FV", "FOOT VOLUME", &["FOOT_VOLUME"]),
        13 => ("NS1", "NOISE SUPPRESSOR 1", &["NS1"]),
        14 => ("NS2", "NOISE SUPPRESSOR 2", &["NS2"]),
        15 => ("OD", "BOOSTER", &["ODDS"]),
        16 => ("USB", "USB OUT", &[]),
        17 => ("DIV", "DIVIDER", &[]),
        18 => ("MXDV", "CH A / CH B", &[]),
        _ => ("MIX", "MIXER", &[]),
    }
}

pub fn chain(app: &App) -> Option<[u8; 20]> {
    let base = sysex::lin(CHAIN);
    let v: Option<Vec<u8>> = (0..20).map(|i| app.mem.get(&(base + i)).copied()).collect();
    v?.try_into().ok()
}

/// The live (Ch A) path: the blocks between DIV and MXDV.
pub fn live_path(order: &[u8; 20]) -> (usize, usize) {
    match (order.iter().position(|&b| b == DIV), order.iter().position(|&b| b == MXDV)) {
        (Some(d), Some(m)) if d < m => (d + 1, m),
        _ => (0, 20),
    }
}

pub fn switch_param(app: &App, key: &str) -> Option<&'static Param> {
    app.cat.blocks.get(key)?.on.and_then(|a| app.cat.at(a))
}

pub fn type_param(app: &App, key: &str) -> Option<&'static Param> {
    app.cat.blocks.get(key)?.type_addr.and_then(|a| app.cat.at(a))
}

/// (on, locked) for a chain block. Blocks without a switch are always on.
pub fn block_state(app: &App, id: u8) -> (bool, bool) {
    if id == AMP {
        let p = app.param("PREAMP A: ON/OFF");
        return (app.raw(p) != Some(0), false);
    }
    let (_, _, keys) = info(id);
    match keys.first().and_then(|k| switch_param(app, k)) {
        Some(p) => (app.raw(p) == Some(1), p.is_locked()),
        None => (true, false),
    }
}

/// The line under a block: its type, or its key setting.
pub fn type_text(app: &App, id: u8) -> String {
    let (_, _, keys) = info(id);
    if block_state(app, id).1 {
        return "fixed".into();
    }
    let num = |n: &str| app.cat.get(n).map_or("—".into(), |p| app.shown(p));
    match id {
        13 => format!("THR {}", num("NS1: THRESHOLD")),
        14 => format!("THR {}", num("NS2: THRESHOLD")),
        12 => format!("LVL {}", num("FOOT VOLUME: LEVEL")),
        16 => "TAP".into(),
        _ => match keys.first().and_then(|k| type_param(app, k)) {
            Some(p) => app.shown(p),
            None => "—".into(),
        },
    }
}

/// Engage or bypass a block (from a click on the Editor's row, a footswitch or the palette).
pub fn toggle(app: &mut App, id: u8) {
    if id == AMP {
        let p = app.param("PREAMP A: ON/OFF");
        let on = app.raw(p) != Some(0);
        app.set(p, !on as u32);
        return;
    }
    let (_, _, keys) = info(id);
    if let Some(p) = keys.first().and_then(|k| switch_param(app, k)).filter(|p| !p.is_locked()) {
        let on = app.raw(p) == Some(1);
        app.set(p, !on as u32);
    }
}

pub fn write_chain(app: &mut App, a: usize, b: usize, seg: &[u8]) {
    let Some(mut order) = chain(app) else { return };
    order[a..b].copy_from_slice(seg);
    if app.online() {
        store(&mut app.mem, CHAIN, &order);
        app.send(Cmd::Chain(order));
    }
}

fn block_w(p: &eframe::egui::Painter, id: u8) -> f32 {
    if id == AMP {
        72.0
    } else {
        (text_w(p, info(id).0, F::Silk2, 9.5) + 20.0).max(50.0)
    }
}

/// The row in `r`: IN → blocks → OUT. Returns the block clicked (Select mode) or double-clicked (Toggle mode).
pub fn row(app: &mut App, ui: &Ui, r: Rect, mode: Mode) -> Option<u8> {
    let p = ui.painter();
    let cy = r.top() + 16.0;
    let in_r = silk(p, pos2(r.left(), cy), Align2::LEFT_CENTER, "IN", F::Silk, 10.0, SILK);
    let out_r = silk(p, pos2(r.right(), cy), Align2::RIGHT_CENTER, "OUT", F::Silk, 10.0, SILK);
    let order = chain(app);
    let (a, b) = order.as_ref().map_or((0, 0), live_path);
    let seg: Vec<u8> = order.map_or(vec![], |o| o[a..b].to_vec());
    if seg.is_empty() {
        text(p, pos2(r.center().x, cy), Align2::CENTER_CENTER, if app.online() { "READING THE CHAIN" } else { "WAITING FOR THE AMP" }, F::Mono, 10.0, SILK3);
        return None;
    }
    if mode == Mode::Select && app.chain.sel.is_none_or(|s| !seg.contains(&s)) {
        app.chain.sel = seg.iter().copied().find(|&b| b == 7).or(seg.first().copied());
    }
    let (x0, x1) = (in_r.right() + 12.0, out_r.left() - 12.0);
    let widths: HashMap<u8, f32> = seg.iter().map(|&id| (id, block_w(p, id))).collect();
    let total: f32 = widths.values().sum();
    let gap = ((x1 - x0 - total) / (seg.len() + 1) as f32).max(8.0);
    let layout = |list: &[u8]| -> Vec<(u8, f32)> {
        let mut x = x0 + gap;
        list.iter().map(|&id| {
            let at = x;
            x += widths[&id] + gap;
            (id, at)
        }).collect()
    };
    let preview: Vec<u8> = match app.chain.drag {
        Some((id, over)) => {
            let mut v: Vec<u8> = seg.iter().copied().filter(|&b| b != id).collect();
            v.insert(over.min(v.len()), id);
            v
        }
        None => seg.clone(),
    };
    let target: HashMap<u8, f32> = layout(&preview).into_iter().collect();
    let now = ui.input(|i| i.time);
    let mut animating = false;
    let mut xs: HashMap<u8, f32> = HashMap::new();
    for &id in &seg {
        let t = target[&id];
        let e = app.chain.anim.entry(id).or_insert((t, t, now));
        let eval = |e: &(f32, f32, f64)| {
            let k = (((now - e.2) / SLIDE) as f32).clamp(0.0, 1.0);
            e.0 + (e.1 - e.0) * easing::cubic_out(k)
        };
        if (e.1 - t).abs() > 0.5 {
            *e = (eval(e), t, now);
        }
        xs.insert(id, eval(e));
        animating |= now - e.2 < SLIDE;
    }
    // bus arrows
    let arrow = |p: &eframe::egui::Painter, ax0: f32, ax1: f32| {
        if ax1 - ax0 > 6.0 {
            p.line_segment([pos2(ax0 + 2.0, cy), pos2(ax1 - 5.0, cy)], Stroke::new(1.0, rgba(0xE8E4DC70)));
            p.add(Shape::convex_polygon(vec![pos2(ax1 - 1.0, cy), pos2(ax1 - 5.0, cy - 2.5), pos2(ax1 - 5.0, cy + 2.5)], rgba(0xE8E4DC90), Stroke::NONE));
        }
    };
    let mut prev = in_r.right() + 4.0;
    for &id in &preview {
        arrow(p, prev, xs[&id] - 2.0);
        prev = xs[&id] + widths[&id] + 2.0;
    }
    arrow(p, prev, out_r.left() - 4.0);

    let mut clicked = None;
    let mut commit = None;
    let static_centers: Vec<(u8, f32)> = layout(&seg).into_iter().map(|(id, x)| (id, x + widths[&id] / 2.0)).collect();
    let mut ids = seg.clone();
    ids.sort_by_key(|&id| app.chain.drag.is_some_and(|d| d.0 == id)); // dragged block on top
    for id in ids {
        let br = Rect::from_min_size(pos2(xs[&id], cy - 16.0), vec2(widths[&id], 32.0));
        let resp = ui.interact(br, Id::unique(("block", id)), Sense::click_and_drag());
        if resp.drag_started() {
            app.chain.drag = Some((id, seg.iter().position(|&b| b == id).unwrap()));
        }
        if let (Some(d), true, Some(pt)) = (app.chain.drag.as_mut(), resp.dragged(), resp.interact_pointer_pos()) {
            d.1 = static_centers.iter().filter(|(o, cx)| *o != id && *cx < pt.x).count();
        }
        if resp.drag_stopped() {
            commit = Some(id);
        }
        let (on, locked) = block_state(app, id);
        let tip = format!("{} · {}{} · drag to move", info(id).1, type_text(app, id), if locked { " · fixed by the firmware" } else if on { "" } else { " · bypassed" });
        let resp = resp.on_hover_text(tip);
        match mode {
            Mode::Toggle => {
                if resp.double_clicked() {
                    clicked = Some(id);
                } else if resp.clicked() && !locked {
                    toggle(app, id);
                }
            }
            Mode::Select => {
                if resp.clicked() {
                    clicked = Some(id);
                }
            }
        }
        let dragging = app.chain.drag.is_some_and(|d| d.0 == id);
        let ghost = ui.ctx().animate_bool_with_time(Id::unique(("ghost", id)), dragging, 0.12);
        let selected = mode == Mode::Select && app.chain.sel == Some(id);
        draw_block(app, ui, br, id, on, locked, selected, resp.hovered(), dragging, 1.0 - 0.55 * ghost);
    }
    if animating || app.chain.drag.is_some() {
        ui.ctx().request_repaint();
    }
    if let Some(id) = commit {
        if preview != seg {
            write_chain(app, a, b, &preview);
        }
        app.chain.drag = None;
        if mode == Mode::Select {
            app.chain.sel = Some(id);
        }
    }
    clicked
}

#[allow(clippy::too_many_arguments)]
fn draw_block(app: &App, ui: &Ui, r: Rect, id: u8, on: bool, locked: bool, selected: bool, hover: bool, dragging: bool, a: f32) {
    let p = ui.painter();
    let am = |c: Color32| c.gamma_multiply(a);
    if !locked {
        led_bar(p, pos2(r.center().x, r.top() - 9.0), on);
    }
    let cream = id == AMP || selected;
    let fg = if cream {
        rgba(0x151515FF)
    } else if on && !locked {
        SILK
    } else {
        SILK3
    };
    if cream {
        if selected {
            glow(p, r, 2.0, 10.0, am(alpha(led(), 0.25)));
        }
        vgrad(p, r, 2.0, am(rgba(0xF2EFE8FF)), am(rgba(0xD9D5CCFF)));
    } else if locked {
        dashed_rect(p, r, am(rgba(0xE8E4DC45)));
    } else {
        let s = if hover { 0xE8E4DCFF } else if on { 0xE8E4DCB8 } else { 0xE8E4DC45 };
        rrect_stroke(p, r, 2.0, am(rgba(s)));
    }
    if dragging {
        rrect_stroke(p, r.expand(1.0), 3.0, led());
    }
    let label = if id == AMP && !on { "AMP OFF" } else { info(id).0 };
    text(p, r.center(), Align2::CENTER_CENTER, label, F::Silk2, 9.5, am(fg));
    let tc = if selected { lit() } else { SILK3 };
    text_max(p, pos2(r.center().x, r.bottom() + 12.0), Align2::CENTER_CENTER, &type_text(app, id), F::Mono, 8.5, am(tc), r.width() + 24.0);
}

/// Legend under the row, right-aligned at `right`.
pub fn legend(p: &eframe::egui::Painter, right: f32, y: f32, select: bool) {
    let items: [(&str, u8); 4] = [("ACTIVE", 0), ("BYPASSED", 1), (if select { "SELECTED" } else { "AMP" }, 2), ("FIXED BY FIRMWARE", 3)];
    let mut x = right;
    for (label, kind) in items.iter().rev() {
        let t = silk(p, pos2(x, y), Align2::RIGHT_CENTER, label, F::Silk2, 9.0, SILK2);
        let sw = Rect::from_center_size(pos2(t.left() - 14.0, y), vec2(14.0, 9.0));
        match kind {
            0 => rrect_stroke(p, sw, 1.0, rgba(0xE8E4DCB8)),
            1 => rrect_stroke(p, sw, 1.0, rgba(0xE8E4DC45)),
            2 => vgrad(p, sw, 1.0, rgba(0xF2EFE8FF), rgba(0xD9D5CCFF)),
            _ => dashed_rect(p, sw, rgba(0xE8E4DC70)),
        }
        x = sw.left() - 18.0;
    }
}

pub fn active_count(app: &App) -> (usize, usize) {
    let Some(order) = chain(app) else { return (0, 0) };
    let (a, b) = live_path(&order);
    let seg = &order[a..b];
    let on = seg.iter().filter(|&&id| {
        let (on, locked) = block_state(app, id);
        on && !locked
    }).count();
    (on, seg.len())
}
