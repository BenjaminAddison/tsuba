//! 02 EFFECTS: the signal chain (drag to reorder), the selected block's parameters, and the EQ's live frequency
//! response.

use std::collections::HashMap;

use eframe::egui::{emath::easing, pos2, vec2, Align2, Color32, Id, Pos2, Rect, Sense, Shape, Stroke, StrokeKind, Ui};
use katana::amp::CHAIN;
use katana::catalog::Param;
use katana::response::{self, Kind};
use katana::sysex;

use crate::editor::grid_height;
use crate::theme::*;
use crate::widgets::*;
use crate::worker::Cmd;
use crate::{store, App, Tab};

const SLIDE: f64 = 0.18; // chain reorder slide, ease-out
const DIV: u8 = 17;
const MXDV: u8 = 18;
const AMP: u8 = 2;

#[derive(Default)]
pub struct State {
    sel: Option<u8>,
    type_open: bool,
    page: usize,
    band: usize,
    drag: Option<(u8, usize)>,
    /// Per block: (from slot, to slot, start time) for the slide.
    anim: HashMap<u8, (f32, f32, f64)>,
}

/// UI name, category colour and effects-map blocks for each chain block ID (notes/07).
fn info(id: u8) -> (&'static str, Color32, &'static [&'static str]) {
    match id {
        0 => ("COMP", SAND, &["COMP"]),
        1 => ("SEND/RTN", SAND, &["SEND_RETURN"]),
        2 => ("AMP", INK, &["PREAMP_A"]),
        3 => ("AMP B", INK, &["PREAMP_B"]),
        4 => ("EQ", SAND, &["EQ"]),
        5 => ("MOD", STEEL, &["FX1"]),
        6 => ("FX", STEEL, &["FX2"]),
        7 => ("DELAY", MUSTARD, &["DELAY", "DELAY2"]),
        8 => ("CHORUS", STEEL, &["CHORUS"]),
        9 => ("REVERB", MUSTARD, &["REVERB"]),
        10 => ("ACCEL", CORAL, &["ACCEL_FX"]),
        11 => ("PEDAL FX", STEEL, &["PEDAL_FX"]),
        12 => ("FOOT VOL", SAND, &["FOOT_VOLUME"]),
        13 => ("NS", SAND, &["NS1"]),
        14 => ("NS 2", SAND, &["NS2"]),
        15 => ("BOOSTER", CORAL, &["ODDS"]),
        16 => ("USB OUT", SAND, &[]),
        _ => ("ROUTING", SAND, &[]),
    }
}

fn chain(app: &App) -> Option<[u8; 20]> {
    let base = sysex::lin(CHAIN);
    let v: Option<Vec<u8>> = (0..20).map(|i| app.mem.get(&(base + i)).copied()).collect();
    v?.try_into().ok()
}

/// The live (Ch A) path: the blocks between DIV and MXDV.
fn live_path(order: &[u8; 20]) -> (usize, usize) {
    match (order.iter().position(|&b| b == DIV), order.iter().position(|&b| b == MXDV)) {
        (Some(d), Some(m)) if d < m => (d + 1, m),
        _ => (0, 20),
    }
}

fn switch_param(app: &App, key: &str) -> Option<&'static Param> {
    app.cat.blocks.get(key)?.on.and_then(|a| app.cat.at(a))
}

fn type_param(app: &App, key: &str) -> Option<&'static Param> {
    app.cat.blocks.get(key)?.type_addr.and_then(|a| app.cat.at(a))
}

/// (on, locked) for a chain block. Blocks without a switch are always on.
fn block_state(app: &App, id: u8) -> (bool, bool) {
    let (_, _, keys) = info(id);
    match keys.first().and_then(|k| switch_param(app, k)) {
        Some(p) => (app.raw(p) == Some(1), p.is_locked()),
        None => (true, false),
    }
}

fn type_text(app: &App, id: u8) -> String {
    let (_, _, keys) = info(id);
    match keys.first().and_then(|k| type_param(app, k)) {
        Some(p) => app.shown(p),
        None if id == 16 => "TAP".into(),
        None => "—".into(),
    }
}

pub fn show(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let x0 = o.x + 16.0;
    let full_w = w - 32.0;
    let ch = chain_panel(app, ui, pos2(x0, o.y + 16.0), full_w);
    let y = o.y + 16.0 + ch + 16.0;
    let pw = ((full_w - 16.0) * 0.56).floor();
    let h1 = params_panel(app, ui, pos2(x0, y), pw);
    let h2 = response_panel(app, ui, pos2(x0 + pw + 16.0, y), full_w - pw - 16.0);
    y - o.y + h1.max(h2) + 16.0
}

// --- chain ----------------------------------------------------------------------------------------------------

fn chain_panel(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let h = 31.0 + 16.0 + 96.0 + 14.0 + 14.0 + 16.0 + 1.0;
    let order = chain(app);
    let (a, b) = order.as_ref().map_or((0, 0), live_path);
    let seg: Vec<u8> = order.map_or(vec![], |o| o[a..b].to_vec());
    let hint = match app.fx.drag {
        Some((id, over)) => format!("DROP TO PLACE {} AT {:02}", info(id).0, over + 1),
        None if seg.is_empty() => "WAITING FOR THE AMP".into(),
        None => "DRAG TO REORDER · CLICK TO EDIT".into(),
    };
    let r = Rect::from_min_size(o, vec2(w, h));
    let body = panel(ui.painter(), r, 18.0, "SIGNAL CHAIN", 64.0, &hint, &format!("{} BLOCKS · IN → OUT", seg.len()));
    let y = body.top() + 16.0;
    let p = ui.painter();
    text(p, pos2(body.left() + 16.0, y + 48.0), Align2::LEFT_CENTER, "IN", F::Mono, 10.0, TEXT_3);
    text(p, pos2(body.right() - 16.0, y + 48.0), Align2::RIGHT_CENTER, "OUT", F::Mono, 10.0, TEXT_3);
    let (ax0, ax1) = (body.left() + 44.0, body.right() - 52.0);
    hline(p, ax0 - 8.0, ax1 + 8.0, y + 48.0, EDGE);
    legend(p, pos2(body.left() + 16.0, y + 96.0 + 14.0));
    if seg.is_empty() {
        return h;
    }
    if app.fx.sel.is_none_or(|s| !seg.contains(&s)) {
        app.fx.sel = seg.iter().copied().find(|&b| b == 4).or(seg.first().copied());
    }

    let n = seg.len();
    let sw = (ax1 - ax0 - (n - 1) as f32 * 6.0) / n as f32;
    let slot_x = |pos: f32| ax0 + pos * (sw + 6.0);
    let preview: Vec<u8> = match app.fx.drag {
        Some((id, over)) => {
            let mut v: Vec<u8> = seg.iter().copied().filter(|&b| b != id).collect();
            v.insert(over.min(v.len()), id);
            v
        }
        None => seg.clone(),
    };
    let now = ui.input(|i| i.time);
    let mut animating = false;
    let mut commit = None;
    // dragged block last so it draws on top
    let mut ids = seg.clone();
    ids.sort_by_key(|&id| app.fx.drag.is_some_and(|d| d.0 == id));
    for id in ids {
        let target = preview.iter().position(|&b| b == id).unwrap() as f32;
        let e = app.fx.anim.entry(id).or_insert((target, target, now));
        let eval = |e: &(f32, f32, f64)| {
            let t = (((now - e.2) / SLIDE) as f32).clamp(0.0, 1.0);
            e.0 + (e.1 - e.0) * easing::cubic_out(t)
        };
        if (e.1 - target).abs() > 1e-3 {
            *e = (eval(e), target, now);
        }
        let pos = eval(e);
        animating |= now - e.2 < SLIDE;
        let r = Rect::from_min_size(pos2(slot_x(pos), y), vec2(sw, 96.0));
        let resp = ui.interact(r, Id::unique(("block", id)), Sense::click_and_drag());
        if resp.drag_started() {
            app.fx.drag = Some((id, seg.iter().position(|&b| b == id).unwrap()));
        }
        if let (Some(d), true, Some(pt)) = (app.fx.drag.as_mut(), resp.dragged(), resp.interact_pointer_pos()) {
            d.1 = (((pt.x - ax0) / (sw + 6.0)).floor().max(0.0) as usize).min(n - 1);
        }
        if resp.drag_stopped() {
            commit = Some(id);
        }
        if resp.clicked() {
            app.fx.sel = Some(id);
            app.fx.type_open = false;
            app.fx.page = 0;
        }
        let dragging = app.fx.drag.is_some_and(|d| d.0 == id);
        let ghost = ui.ctx().animate_bool_with_time(Id::unique(("ghost", id)), dragging, 0.12);
        draw_block(app, ui, r, id, preview.iter().position(|&b| b == id).unwrap(), &resp, dragging, 1.0 - 0.55 * ghost);
    }
    if animating || app.fx.drag.is_some() {
        ui.ctx().request_repaint();
    }
    if let Some(id) = commit {
        if preview != seg {
            write_chain(app, a, b, &preview);
        }
        app.fx.drag = None;
        app.fx.sel = Some(id);
    }
    h
}

fn write_chain(app: &mut App, a: usize, b: usize, seg: &[u8]) {
    let Some(mut order) = chain(app) else { return };
    order[a..b].copy_from_slice(seg);
    if app.online() {
        store(&mut app.mem, CHAIN, &order);
        app.send(Cmd::Chain(order));
    }
}

#[allow(clippy::too_many_arguments)]
fn draw_block(app: &App, ui: &Ui, r: Rect, id: u8, slot: usize, resp: &eframe::egui::Response, dragging: bool, alpha: f32) {
    let p = ui.painter();
    let (name, cat, _) = info(id);
    let (on, locked) = block_state(app, id);
    let selected = app.fx.sel == Some(id) && !dragging;
    let a = |c: Color32| c.gamma_multiply(alpha);
    let (fill, edge, fg, sub) = if dragging {
        (PANEL, ACCENT, INK, TEXT_2)
    } else if selected {
        (INK, INK, INK_ON, INK_SUB)
    } else if on && !locked {
        (PANEL, if resp.hovered() { INK } else { EDGE }, INK, TEXT_2)
    } else {
        (BG, if resp.hovered() { EDGE } else { LINE }, TEXT_3, TEXT_3)
    };
    cut_frame(p, r, 11.0, a(fill), a(edge));
    let (x0, x1) = (r.left() + 10.0, r.right() - 10.0);
    let nr = text(p, pos2(x0, r.top() + 10.0), Align2::LEFT_TOP, &format!("{:02}", slot + 1), F::Mono, 10.0, a(sub));
    for (cx, cy) in [(0.0, 0.0), (4.0, 0.0), (0.0, 4.0), (4.0, 4.0), (0.0, 8.0), (4.0, 8.0)] {
        p.rect_filled(Rect::from_min_size(pos2(nr.right() + 6.0 + cx, r.top() + 11.0 + cy), vec2(2.0, 2.0)), 0.0, a(sub));
    }
    if locked {
        lock_icon(p, pos2(x1 - 6.0, r.top() + 16.0), a(sub));
    }
    text_max(p, pos2(x0, r.top() + 36.0), Align2::LEFT_CENTER, name, F::Semi, 13.0, a(fg), x1 - x0);
    text_max(p, pos2(x0, r.top() + 55.0), Align2::LEFT_CENTER, &type_text(app, id), F::Mono, 10.0, a(sub), x1 - x0);
    let bar = Rect::from_min_max(pos2(x0, r.bottom() - 14.0), pos2(x1, r.bottom() - 10.0));
    if on && !locked {
        p.rect_filled(bar, 0.0, a(if selected && cat == INK { INK_ON } else { cat }));
    } else {
        let mut x = bar.left();
        while x < bar.right() {
            p.rect_filled(Rect::from_min_max(pos2(x, bar.top()), pos2((x + 2.0).min(bar.right()), bar.bottom())), 0.0, a(EDGE));
            x += 5.0;
        }
    }
    if resp.has_focus() {
        focus_ring(p, r, 11.0);
    }
}

fn legend(p: &eframe::egui::Painter, o: Pos2) {
    let mut x = o.x;
    for (label, c) in [("DRIVE", CORAL), ("MODULATION", STEEL), ("TIME", MUSTARD), ("DYNAMICS · EQ · ROUTING", SAND), ("BYPASSED", EDGE)] {
        let sq = Rect::from_min_size(pos2(x, o.y + 3.0), vec2(8.0, 8.0));
        if label == "BYPASSED" {
            p.rect_filled(Rect::from_min_size(sq.min, vec2(2.0, 8.0)), 0.0, c);
            p.rect_filled(Rect::from_min_size(sq.min + vec2(5.0, 0.0), vec2(2.0, 8.0)), 0.0, c);
        } else {
            p.rect_filled(sq, 0.0, c);
        }
        let t = text(p, pos2(x + 14.0, o.y + 7.0), Align2::LEFT_CENTER, label, F::Mono, 10.0, TEXT_3);
        x = t.right() + 20.0;
    }
}

// --- parameters -------------------------------------------------------------------------------------------------

fn params_panel(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let Some(id) = app.fx.sel else {
        let r = Rect::from_min_size(o, vec2(w, 120.0));
        panel(ui.painter(), r, 18.0, "PARAMETERS", 0.0, "", "");
        return 120.0;
    };
    let (name, cat, keys) = info(id);
    let order = chain(app).unwrap_or([0; 20]);
    let (a, b) = live_path(&order);
    let pos = order[a..b].iter().position(|&x| x == id).unwrap_or(0);
    let meta = format!("POSITION {:02} / {:02}", pos + 1, b - a);
    let page = app.fx.page.min(keys.len().saturating_sub(1));
    let key = keys.get(page).copied();
    let (on, locked) = block_state(app, id);
    let mut params: Vec<&'static Param> = key.map_or(vec![], |k| app.cat.block_params(k, &app.mem)).into_iter().filter(|p| !p.is_locked()).collect();
    params.sort_by_key(|p| sysex::lin(p.addr)); // address order is the amp's own panel order
    let note = if id == AMP {
        Some(("AMP SETTINGS LIVE ON THE EDITOR TAB", "Drag the AMP block to move it in the chain. Select it to edit model, gain and EQ."))
    } else if locked {
        Some(("LOCKED ON THE KATANA-50", "The firmware keeps this block switched off. It can still move in the chain. For chorus, use MOD or FX with type CHORUS."))
    } else if keys.is_empty() {
        Some(("NO SETTINGS", "A routing point in the chain. It can still be moved."))
    } else {
        None
    };

    let tparam = key.and_then(|k| type_param(app, k));
    let types = tparam.map_or(vec![], |p| p.options.clone());
    let pages_h = if keys.len() > 1 { 64.0 + 16.0 } else { 0.0 };
    let grid_h = if app.fx.type_open && !types.is_empty() { 12.0 + grid_height(w - 34.0, types.len(), 150.0) } else { 0.0 };
    let rows = params.len().div_ceil(3);
    let params_h = if rows > 0 { 18.0 + rows as f32 * 64.0 + (rows - 1) as f32 * 18.0 } else { 0.0 };
    let body_h = match note {
        Some(_) => 120.0,
        None => pages_h + 50.0 + grid_h + params_h,
    };
    let h = 31.0 + 16.0 + body_h + 16.0 + 1.0;
    let r = Rect::from_min_size(o, vec2(w, h));
    let sub = format!("PARAMETERS / {:02}", params.len());
    let body = panel(ui.painter(), r, 18.0, name, 0.0, "", &meta);
    let p = ui.painter();
    let lw = text_w(p, name, F::Exp, 12.0) + 28.0;
    p.rect_filled(Rect::from_min_size(pos2(body.left() + lw + 8.0, body.top() - 19.0), vec2(8.0, 8.0)), 0.0, cat);
    text(p, pos2(body.left() + lw + 26.0, body.top() - 15.5), Align2::LEFT_CENTER, &sub, F::Mono, 10.0, TEXT_3);
    let (x0, x1) = (body.left() + 16.0, body.right() - 16.0);
    let mut y = body.top() + 16.0;

    if let Some((title, help)) = note {
        let nr = Rect::from_min_size(pos2(x0, y), vec2(x1 - x0, 120.0));
        dashed_rect(p, nr, EDGE);
        text(p, pos2(x0 + 14.0, y + 16.0), Align2::LEFT_TOP, title, F::Exp, 12.0, INK);
        para(p, pos2(x0 + 14.0, y + 38.0), help, 11.0, TEXT_2, x1 - x0 - 28.0, 17.0);
        if id == AMP {
            let br = Rect::from_min_size(pos2(x0 + 14.0, y + 120.0 - 44.0 - 10.0), vec2(160.0, 36.0));
            if button(ui, br, Id::unique("open-editor"), "OPEN EDITOR →").clicked() {
                app.tab = Tab::Editor;
            }
        }
        return h;
    }

    if keys.len() > 1 {
        let opts: Vec<String> = keys.iter().enumerate().map(|(i, _)| format!("{} {}", name, i + 1)).collect();
        if let Some(i) = segmented(ui, Rect::from_min_size(pos2(x0, y), vec2((x1 - x0) / 2.0, 64.0)), Id::unique("page"), "UNIT", &opts, page) {
            app.fx.page = i;
            app.fx.type_open = false;
        }
        y += 64.0 + 16.0;
    }

    // toolbar: switch, type, move
    let sw_w = 170.0;
    let mut tx = x0;
    if let Some(sp) = key.and_then(|k| switch_param(app, k)) {
        if let Some(v) = switch(ui, Rect::from_min_size(pos2(x0, y), vec2(sw_w, 50.0)), Id::unique(("sw", sp.addr)), on, !sp.is_locked()) {
            app.set(sp, v as u32);
        }
        tx += sw_w + 10.0;
    }
    let mx = x1 - 2.0 * 50.0 - 6.0;
    if let Some(tp) = tparam {
        let cur = app.raw(tp);
        let i = cur.and_then(|c| types.iter().position(|t| t.0 == c));
        let count = i.map_or("—".into(), |i| format!("{:02} / {:02}", i + 1, types.len()));
        let dd = Rect::from_min_max(pos2(tx, y), pos2(mx - 10.0, y + 50.0));
        if dropdown(ui, dd, Id::unique(("type", tp.addr)), "TYPE", &app.shown(tp), &count, app.fx.type_open).clicked() {
            app.fx.type_open = !app.fx.type_open;
        }
    }
    for (k, (dx, label)) in [(-1i32, "◀"), (1, "▶")].into_iter().enumerate() {
        let br = Rect::from_min_size(pos2(mx + k as f32 * 56.0, y), vec2(50.0, 50.0));
        let target = pos as i32 + dx;
        if (0..(b - a) as i32).contains(&target) {
            if move_button(ui, br, Id::unique(("move", k)), dx < 0, label).clicked() {
                let mut seg = order[a..b].to_vec();
                seg.swap(pos, target as usize);
                write_chain(app, a, b, &seg);
            }
        } else {
            dashed_rect(ui.painter(), br, LINE);
        }
    }
    y += 50.0;
    if app.fx.type_open {
        if let Some(tp) = tparam {
            let (gh, picked) = option_grid(ui, pos2(x0, y + 12.0), x1 - x0, Id::unique("types"), &types, app.raw(tp), 150.0);
            if let Some(raw) = picked {
                app.set(tp, raw);
                app.fx.type_open = false;
            }
            y += 12.0 + gh;
        }
    }

    y += 18.0;
    let cw = (x1 - x0 - 2.0 * 16.0) / 3.0;
    for (i, prm) in params.iter().enumerate() {
        let cell = Rect::from_min_size(pos2(x0 + (i % 3) as f32 * (cw + 16.0), y + (i / 3) as f32 * 82.0), vec2(cw, 64.0));
        param_control(app, ui, cell, prm);
    }
    h
}

fn move_button(ui: &Ui, r: Rect, id: Id, left: bool, _label: &str) -> eframe::egui::Response {
    let resp = ui.interact(r, id, Sense::click());
    let p = ui.painter();
    p.rect_stroke(r, 0.0, Stroke::new(1.0, if resp.hovered() { INK } else { EDGE }), StrokeKind::Inside);
    let c = r.center();
    let pts = if left {
        vec![c + vec2(4.0, -5.0), c + vec2(4.0, 5.0), c + vec2(-4.0, 0.0)]
    } else {
        vec![c + vec2(-4.0, -5.0), c + vec2(4.0, 0.0), c + vec2(-4.0, 5.0)]
    };
    p.add(Shape::convex_polygon(pts, INK, Stroke::NONE));
    if resp.has_focus() {
        focus_ring(p, r, 0.0);
    }
    resp.on_hover_text(if left { "Move block earlier in chain" } else { "Move block later in chain" })
}

/// Short option lists become segmented buttons; everything else a tick slider.
fn param_control(app: &mut App, ui: &Ui, r: Rect, p: &'static Param) {
    let id = Id::unique(("param", p.addr));
    let label = p.label.to_uppercase();
    if !p.options.is_empty() && p.options.len() <= 4 && p.options.iter().all(|o| o.1.len() <= 8) {
        let opts: Vec<String> = p.options.iter().map(|o| o.1.to_uppercase()).collect();
        let sel = app.raw(p).and_then(|c| p.options.iter().position(|o| o.0 == c)).unwrap_or(usize::MAX);
        if let Some(i) = segmented(ui, r, id, &label, &opts, sel) {
            app.set(p, p.options[i].0);
        }
        return;
    }
    let value = app.shown(p);
    if p.options.is_empty() {
        let (lo, hi) = p.raw_range();
        let raw = app.raw(p).unwrap_or(lo).clamp(lo, hi);
        if let Some(i) = slider(ui, r, id, &label, &value, (raw - lo) as usize, (hi - lo + 1) as usize) {
            app.set(p, lo + i as u32);
        }
    } else {
        let sel = app.raw(p).and_then(|c| p.options.iter().position(|o| o.0 == c)).unwrap_or(0);
        if let Some(i) = slider(ui, r, id, &label, &value, sel, p.options.len()) {
            app.set(p, p.options[i].0);
        }
    }
}

// --- frequency response -----------------------------------------------------------------------------------------

fn fmt_hz(f: f64) -> String {
    if f >= 1000.0 {
        format!("{} KHZ", (f / 100.0).round() / 10.0)
    } else {
        format!("{} HZ", f.round())
    }
}

fn response_panel(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let eq = response::eq(app.cat, &app.mem);
    let nb = eq.as_ref().map_or(6, |e| e.bands.len());
    let chip_rows = if nb > 6 { 2 } else { 1 };
    let gh = 260.0;
    let h = 31.0 + 16.0 + chip_rows as f32 * 48.0 + 8.0 + gh + 22.0 + 12.0 + 44.0 + 16.0 + 1.0;
    let r = Rect::from_min_size(o, vec2(w, h));
    let meta = match &eq {
        Some(e) if e.graphic => "EQ · GE-10",
        Some(_) => "EQ · PARAMETRIC",
        None => "EQ",
    };
    let body = panel(ui.painter(), r, 18.0, "FREQUENCY RESPONSE", 0.0, "", meta);
    let p = ui.painter();
    let lw = text_w(p, "FREQUENCY RESPONSE", F::Exp, 12.0) + 28.0;
    let live = eq.as_ref().is_some_and(|e| e.on);
    dot(p, pos2(body.left() + lw + 14.0, body.top() - 15.5), 6.0, if live { SAGE } else { TEXT_3 });
    text(p, pos2(body.left() + lw + 22.0, body.top() - 15.5), Align2::LEFT_CENTER, if live { "LIVE" } else { "EQ OFF" }, F::Mono, 10.0, if live { INK } else { TEXT_3 });
    let (x0, x1) = (body.left() + 16.0, body.right() - 16.0);
    let mut y = body.top() + 16.0;
    let Some(eq) = eq else {
        text(p, pos2(x0, y), Align2::LEFT_TOP, "WAITING FOR THE AMP", F::Mono, 10.0, TEXT_3);
        return h;
    };
    app.fx.band = app.fx.band.min(nb - 1);

    // band chips
    let per_row = nb.div_ceil(chip_rows);
    let cw = (x1 - x0 - (per_row - 1) as f32 * 4.0) / per_row as f32;
    for (i, b) in eq.bands.iter().enumerate() {
        let cr = Rect::from_min_size(pos2(x0 + (i % per_row) as f32 * (cw + 4.0), y + (i / per_row) as f32 * 48.0), vec2(cw, 44.0));
        if toggle(ui, cr, Id::unique(("band", i)), b.name, app.fx.band == i).clicked() {
            app.fx.band = i;
        }
    }
    y += chip_rows as f32 * 48.0 + 8.0;

    // graph
    let g = Rect::from_min_size(pos2(x0, y), vec2(x1 - x0, gh));
    let p = ui.painter();
    p.rect_filled(g, 0.0, BG);
    p.rect_stroke(g, 0.0, Stroke::new(1.0, EDGE), StrokeKind::Inside);
    let scale = (gh / 2.0 - 4.0) / 24.0;
    let fx = |f: f64| g.left() + ((f / 20.0).log10() / 3.0) as f32 * g.width();
    let fy = |db: f64| g.center().y - db as f32 * scale;
    let gp = p.with_clip_rect(g.shrink(1.0).intersect(p.clip_rect()));
    for f in [50.0, 100.0, 200.0, 500.0, 1000.0, 2000.0, 5000.0, 10000.0] {
        vline(&gp, fx(f).round(), g.top(), g.bottom(), GRID);
    }
    for d in [-18.0, -12.0, -6.0, 6.0, 12.0, 18.0] {
        hline(&gp, g.left(), g.right(), fy(d).round(), GRID);
    }
    gp.extend(Shape::dashed_line(&[pos2(g.left(), g.center().y), pos2(g.right(), g.center().y)], Stroke::new(1.0, EDGE), 3.0, 3.0));
    text(&gp, g.right_top() + vec2(-8.0, 8.0), Align2::RIGHT_TOP, "DRAG HANDLE · SCROLL FOR Q", F::Mono, 10.0, TEXT_3);
    for (s, d) in [("+12", 12.0), ("0 DB", 0.0), ("−12", -12.0)] {
        text(&gp, pos2(g.left() + 6.0, fy(d) - 3.0), Align2::LEFT_BOTTOM, s, F::Mono, 10.0, TEXT_3);
    }
    let freqs: Vec<f64> = (0..=240).map(|i| 20.0 * 1000f64.powf(i as f64 / 240.0)).collect();
    let curve = |db: &dyn Fn(f64) -> f64| freqs.iter().map(|&f| pos2(fx(f), fy(db(f).clamp(-30.0, 30.0)))).collect::<Vec<_>>();
    for (i, b) in eq.bands.iter().enumerate() {
        let c = if i == app.fx.band { INK } else { EDGE };
        gp.line(curve(&|f| b.db(f)), Stroke::new(1.2, if eq.on { c } else { LINE }));
    }
    gp.line(curve(&|f| eq.db(f)), Stroke::new(2.2, if eq.on { ACCENT } else { TEXT_3 }));

    // handles
    for (i, b) in eq.bands.iter().enumerate() {
        let cut = matches!(b.kind, Kind::LowCut | Kind::HighCut);
        let hx = match (b.freq, b.kind) {
            (Some(f), _) => fx(f),
            (None, Kind::LowCut) => g.left() + 6.0,
            (None, _) => g.right() - 6.0,
        };
        let hy = if cut { fy(if b.freq.is_some() { -3.0 } else { 0.0 }) } else { fy(b.gain_db) };
        let c = pos2(hx, hy.clamp(g.top() + 6.0, g.bottom() - 6.0));
        let resp = ui.interact(Rect::from_center_size(c, vec2(30.0, 30.0)), Id::unique(("handle", i)), Sense::click_and_drag());
        if resp.clicked() || resp.drag_started() {
            app.fx.band = i;
        }
        if let (true, Some(pt)) = (resp.dragged(), resp.interact_pointer_pos()) {
            if let Some(fp) = b.freq_param {
                let f = 20.0 * 10f64.powf(3.0 * ((pt.x - g.left()) / g.width()) as f64);
                let flat = (b.kind == Kind::LowCut && pt.x <= g.left() + 4.0) || (b.kind == Kind::HighCut && pt.x >= g.right() - 4.0);
                let best = fp.options.iter().filter(|o| (response::parse_hz(&o.1).is_none()) == flat).min_by(|x, y| {
                    let d = |o: &(u32, String)| response::parse_hz(&o.1).map_or(0.0, |h| (h / f).log10().abs());
                    d(x).total_cmp(&d(y))
                });
                if let Some(o) = best {
                    if app.raw(fp) != Some(o.0) {
                        app.set(fp, o.0);
                    }
                }
            }
            if let Some(gp_) = b.gain_param {
                let db = ((g.center().y - pt.y) / scale) as f64;
                let (lo, hi) = gp_.raw_range();
                let raw = (((db - gp_.number(0)) / gp_.step).round().max(0.0) as u32).clamp(lo, hi);
                if app.raw(gp_) != Some(raw) {
                    app.set(gp_, raw);
                }
            }
        }
        let sel = i == app.fx.band;
        let sq = Rect::from_center_size(c, vec2(10.0, 10.0));
        ui.painter().rect_filled(sq, 0.0, if sel { ACCENT } else { BG });
        ui.painter().rect_stroke(sq, 0.0, Stroke::new(1.0, if sel { ACCENT } else { INK }), StrokeKind::Inside);
    }
    // scroll over the graph steps the selected band's Q
    let gresp = ui.interact(g, Id::unique("graph"), Sense::hover());
    if let (true, Some(qp)) = (gresp.hovered(), eq.bands[app.fx.band].q_param) {
        let s = wheel(ui);
        if s != 0 {
            let cur = app.raw(qp).and_then(|c| qp.options.iter().position(|o| o.0 == c)).unwrap_or(0) as i32;
            let next = (cur + s).clamp(0, qp.options.len() as i32 - 1) as usize;
            app.set(qp, qp.options[next].0);
        }
    }
    y += gh + 6.0;
    let p = ui.painter();
    for (f, t) in [(20.0, "20"), (50.0, "50"), (100.0, "100"), (200.0, "200"), (500.0, "500"), (1000.0, "1K"), (2000.0, "2K"), (5000.0, "5K"), (10000.0, "10K"), (20000.0, "20K")] {
        let al = if f == 20.0 { Align2::LEFT_TOP } else if f == 20000.0 { Align2::RIGHT_TOP } else { Align2::CENTER_TOP };
        text(p, pos2(fx(f), y), al, t, F::Mono, 10.0, TEXT_3);
    }
    y += 16.0 + 12.0;

    // readout
    let b = &eq.bands[app.fx.band];
    hline(p, x0, x1, y, LINE);
    let freq = match (b.freq_param, b.freq) {
        (Some(_), None) => "FLAT".into(),
        (_, Some(f)) if b.freq_param.is_some() || eq.graphic => fmt_hz(f),
        _ => "SHELF".into(),
    };
    let gain = if matches!(b.kind, Kind::LowCut | Kind::HighCut) { "—".into() } else { format!("{:+} DB", b.gain_db).replace('-', "−") };
    let (ql, qv) = match b.kind {
        Kind::LowCut | Kind::HighCut => ("SLOPE", "12 DB/OCT".to_string()),
        _ if b.q_param.is_some() => ("Q", format!("{}", b.q)),
        _ => ("Q", "—".into()),
    };
    let mut x = x0;
    for (k, v) in [("BAND", b.name.to_string()), ("FREQ", freq), ("GAIN", gain), (ql, qv)] {
        let kr = text(p, pos2(x, y + 22.0), Align2::LEFT_CENTER, k, F::Mono, 10.0, TEXT_3);
        let vr = text(p, pos2(kr.right() + 8.0, y + 22.0), Align2::LEFT_CENTER, &v, F::ExpB, 13.0, INK);
        x = vr.right() + 20.0;
    }
    h
}
