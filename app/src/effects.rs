//! EFFECTS: the signal path (click to select, drag to reorder), the selected block's settings, and the PARAMETER
//! panel: the touched parameter against memory, its CLI line, and the assigns that drive it.

use eframe::egui::{pos2, vec2, Align2, Id, Pos2, Rect, Shape, Stroke, Ui};
use katana::catalog::Param;
use katana::sysex;

use crate::chain::{self, Mode, AMP};
use crate::control;
use crate::editor::knob_param;
use crate::graph::{self, Src};
use crate::theme::*;
use crate::widgets::*;
use crate::{patch_unit, display, App, Tab, GAP};

#[derive(Default)]
pub struct State {
    page: usize,
    type_open: bool,
    pub band: usize,
    popup: Option<u32>,
}

pub fn show(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let mut y = o.y;
    y += patch_unit(app, ui, pos2(o.x, y), w, false) + GAP;
    y += path_unit(app, ui, pos2(o.x, y), w) + GAP;
    y += block_unit(app, ui, pos2(o.x, y), w);
    y - o.y
}

fn path_unit(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let h = 118.0;
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 2);
    header(ui.painter(), face, face.top() + 22.0, "SIGNAL PATH", "SELECT A BLOCK TO EDIT · DRAG TO MOVE · LED ENGAGES", "", 2);
    let row = Rect::from_min_max(pos2(face.left() + 20.0, face.top() + 50.0), pos2(face.right() - 20.0, face.top() + 82.0));
    if let Some(id) = chain::row(app, ui, row, Mode::Select) {
        if app.chain.sel != Some(id) {
            app.chain.sel = Some(id);
            app.fx.page = 0;
            app.fx.type_open = false;
        }
    }
    h
}

/// Parameters of the selected block's current page, in the amp's own panel order.
fn page_params(app: &App, key: &str) -> Vec<&'static Param> {
    let mut ps: Vec<&'static Param> = app.cat.block_params(key, &app.mem).into_iter().filter(|p| !p.is_locked()).collect();
    ps.sort_by_key(|p| sysex::lin(p.addr));
    ps
}

/// Option lists short enough to show as a row of keys.
fn as_keys(p: &Param) -> bool {
    !p.options.is_empty() && p.options.len() <= 4 && p.options.iter().all(|o| o.1.len() <= 9)
}

fn block_unit(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let Some(id) = app.chain.sel else {
        let face = unit(ui, Rect::from_min_size(o, vec2(w, 120.0)), 5);
        header(ui.painter(), face, face.top() + 22.0, "BLOCK", "", "PARAMETER", 3);
        text(ui.painter(), face.center(), Align2::CENTER_CENTER, if app.online() { "READING THE CHAIN" } else { "WAITING FOR THE AMP" }, F::Mono, 11.0, SILK3);
        return 120.0;
    };
    let (_, full, keys) = chain::info(id);
    let page = app.fx.page.min(keys.len().saturating_sub(1));
    let bkey = keys.get(page).copied();
    let (on, locked) = chain::block_state(app, id);
    let params = bkey.map_or(vec![], |k| page_params(app, k));
    let (knobs, settings): (Vec<&'static Param>, Vec<&'static Param>) = params.iter().partition(|p| p.options.is_empty());
    let right_w = 330.0;

    // height: header, title row, page/type keys, then the visual beside the knobs, then settings
    let tparam = bkey.and_then(|k| chain::type_param(app, k));
    let types: Vec<(u32, String)> = tparam.map_or(vec![], |p| p.options.clone());
    let face_w = w - 2.0 * EAR;
    let left_w = face_w - 40.0 - right_w - 32.0;
    let vis_w = 340.0;
    let kcols = (((left_w - vis_w - 24.0) / 96.0).floor() as usize).max(1);
    let krows = knobs.len().div_ceil(kcols);
    let srows = settings.len().div_ceil(2);
    let body_h = (krows as f32 * 112.0).max(196.0) + srows as f32 * 58.0;
    let note = note_for(app, id, locked, keys.is_empty());
    let h = if note.is_some() { 330.0 } else { (44.0 + 52.0 + 50.0 + body_h + 24.0).max(330.0) };
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 5);
    let page_name = if keys.len() > 1 { format!("{full} {}", page + 1) } else { full.to_string() };
    header(ui.painter(), face, face.top() + 22.0, &format!("BLOCK · {page_name}"), "", "PARAMETER", 3);
    let x0 = face.left() + 20.0;
    let lx1 = x0 + left_w;
    groove(ui.painter(), lx1 + 16.0, face.top() + 44.0, face.bottom() - 18.0);

    // title row
    let ty = face.top() + 64.0;
    let p = ui.painter();
    let tr = silk(p, pos2(x0, ty), Align2::LEFT_CENTER, &page_name, F::Title, 20.0, SILK);
    let mut x = tr.right() + 16.0;
    if let Some(tp) = tparam {
        let cur = app.raw(tp);
        let i = cur.and_then(|c| types.iter().position(|t| t.0 == c));
        let label = format!("{}  {}", app.shown(tp), i.map_or(String::new(), |i| format!("{}/{}", i + 1, types.len())));
        let cw = text_w(p, &label, F::MonoB, 11.0) + 30.0;
        let cr = Rect::from_min_size(pos2(x, ty - 15.0), vec2(cw, 30.0));
        let resp = ui.interact(cr, Id::unique(("type-chip", tp.addr)), eframe::egui::Sense::click());
        let g = glass(ui, cr);
        vfd(ui.painter(), pos2(g.left() + 9.0, g.center().y), Align2::LEFT_CENTER, &label, F::MonoB, 11.0);
        if resp.clicked() && app.online() {
            app.fx.type_open = !app.fx.type_open;
        }
        let resp = resp.on_hover_text("Click for every type");
        if app.fx.type_open {
            let names: Vec<String> = types.iter().map(|t| t.1.clone()).collect();
            match option_popup(ui, Id::unique("types-popup"), resp.rect, &names, i, 200.0) {
                Some(Some(k)) => {
                    app.set(tp, types[k].0);
                    app.fx.type_open = false;
                }
                Some(None) => app.fx.type_open = false,
                None => {}
            }
        }
        x = cr.right() + 16.0;
    }
    let edited = params.iter().filter(|p| app.edited(p)).count();
    if note.is_none() {
        silk(ui.painter(), pos2(x, ty), Align2::LEFT_CENTER, &format!("{} PARAMS · {edited} EDITED", params.len()), F::Silk2, 9.0, SILK2);
    }

    // ON, MOVE, RESET (right of the left area)
    let order = chain::chain(app).unwrap_or([0; 20]);
    let (a, b) = chain::live_path(&order);
    let pos = order[a..b].iter().position(|&x| x == id).unwrap_or(0);
    let rx = lx1;
    let reset = Rect::from_min_size(pos2(rx - 64.0, ty - 12.0), vec2(64.0, 24.0));
    if edited > 0 && app.online() {
        if key(ui, reset, Id::unique("reset"), "RESET", false, None).on_hover_text("Put this block's settings back to memory").clicked() {
            app.revert_params(&params);
        }
    } else {
        key_off(ui, reset, "RESET");
    }
    let nr = Rect::from_min_size(pos2(reset.left() - 14.0 - 28.0, ty - 12.0), vec2(28.0, 24.0));
    let pr = Rect::from_min_size(pos2(nr.left() - 54.0 - 28.0, ty - 12.0), vec2(28.0, 24.0));
    for (r, dx) in [(pr, -1i32), (nr, 1)] {
        let target = pos as i32 + dx;
        if (0..(b - a) as i32).contains(&target) && app.online() {
            let tip = if dx < 0 { "Move earlier in the chain" } else { "Move later in the chain" };
            if icon_key(ui, r, Id::unique(("move", dx)), tip, |p, f, c| tri(p, f.center(), dx < 0, c)).clicked() {
                let mut seg = order[a..b].to_vec();
                seg.swap(pos, target as usize);
                chain::write_chain(app, a, b, &seg);
            }
        } else {
            key_off(ui, r, if dx < 0 { "◀" } else { "▶" });
        }
    }
    silk(ui.painter(), pos2((pr.right() + nr.left()) / 2.0, ty), Align2::CENTER_CENTER, "MOVE", F::Silk2, 9.0, SILK2);
    let onr = Rect::from_min_size(pos2(pr.left() - 18.0 - 66.0, ty - 12.0), vec2(66.0, 24.0));
    if locked {
        key_off(ui, onr, "FIXED");
    } else if key(ui, onr, Id::unique("block-on"), if on { "ON" } else { "OFF" }, on, Some(on)).on_hover_text("Engage or bypass").clicked() {
        chain::toggle(app, id);
    }

    // unit pages and type keys
    let mut ky = ty + 34.0;
    let mut kx = x0;
    if keys.len() > 1 {
        for (i, _) in keys.iter().enumerate() {
            let label = format!("{full} {}", i + 1);
            let kw = text_w(ui.painter(), &label, F::Silk2, 9.0) + 24.0;
            let kr = Rect::from_min_size(pos2(kx, ky), vec2(kw, 24.0));
            if key(ui, kr, Id::unique(("page", i)), &label, page == i, Some(page == i)).clicked() {
                app.fx.page = i;
                app.fx.type_open = false;
            }
            kx += kw + 8.0;
        }
        kx += 18.0;
    }
    if let Some(tp) = tparam.filter(|_| types.len() <= 9 && note.is_none()) {
        let cur = app.raw(tp);
        for (i, (raw, name)) in types.iter().enumerate() {
            let kw = text_w(ui.painter(), name, F::Silk2, 8.5) + 18.0;
            if kx + kw > lx1 {
                break;
            }
            let kr = Rect::from_min_size(pos2(kx, ky), vec2(kw, 24.0));
            let sel = cur == Some(*raw);
            if key(ui, kr, Id::unique(("tkey", i)), name, sel, Some(sel)).clicked() && app.online() {
                app.set(tp, *raw);
            }
            kx += kw + 6.0;
        }
    }
    ky += 40.0;
    hline(ui.painter(), x0, lx1, ky, rgba(0x00000060));
    hline(ui.painter(), x0, lx1, ky + 1.0, rgba(0xFFFFFF0C));
    let by = ky + 16.0;

    if let Some((title, help)) = note {
        let nr = Rect::from_min_size(pos2(x0, by), vec2(left_w.min(620.0), 120.0));
        let g = glass(ui, nr);
        let p = ui.painter();
        vfd(p, pos2(g.left() + 14.0, g.top() + 18.0), Align2::LEFT_CENTER, title, F::MonoB, 12.0);
        para(p, pos2(g.left() + 14.0, g.top() + 36.0), help, F::Mono, 11.0, mix(lit(), BLACK, 0.25), g.width() - 28.0, 17.0);
        if id == AMP {
            let br = Rect::from_min_size(pos2(x0, nr.bottom() + 18.0), vec2(150.0, 28.0));
            if key(ui, br, Id::unique("open-editor"), "OPEN EDITOR ▸", false, None).clicked() {
                app.tab = Tab::Editor;
            }
        }
    } else {
        // visual
        let vr = Rect::from_min_size(pos2(x0, by), vec2(vis_w, 196.0));
        visual(app, ui, vr, id, &params);
        // knobs
        let kx0 = vr.right() + 24.0;
        for (i, p) in knobs.iter().enumerate() {
            let (c, r) = (i % kcols, i / kcols);
            let at = pos2(kx0 + c as f32 * 96.0 + 16.0, by + r as f32 * 112.0 + 4.0);
            knob_param(app, ui, at, Size::E, &p.label, p);
        }
        // settings: key groups and steppers, two columns
        let sy = by + (krows as f32 * 112.0).max(196.0) + 18.0;
        let cw = (left_w - 24.0) / 2.0;
        for (i, p) in settings.iter().enumerate() {
            let at = pos2(x0 + (i % 2) as f32 * (cw + 24.0), sy + (i / 2) as f32 * 58.0);
            setting(app, ui, at, cw, p);
        }
    }

    // PARAMETER panel
    parameter_panel(app, ui, Rect::from_min_max(pos2(lx1 + 34.0, face.top() + 44.0), pos2(face.right() - 20.0, face.bottom() - 18.0)), &params);
    h
}

fn note_for(_app: &App, id: u8, locked: bool, no_keys: bool) -> Option<(&'static str, &'static str)> {
    if id == AMP {
        Some(("AMP SETTINGS LIVE ON THE EDITOR", "Model, gain, tone, solo and bright are on the Editor's PREAMP unit. Drag the AMP block to move it in the chain."))
    } else if locked {
        Some(("FIXED BY THE KATANA-50 FIRMWARE", "The firmware keeps this block switched off. It can still move in the chain. For chorus, use FX1 or FX2 with type CHORUS."))
    } else if no_keys {
        Some(("NO SETTINGS", "A routing point in the chain. It can still be moved."))
    } else {
        None
    }
}

/// A list setting: keys for short lists, else a stepper (click for the full list).
fn setting(app: &mut App, ui: &Ui, at: Pos2, w: f32, p: &'static Param) {
    let pp = ui.painter();
    let ed = app.edited(p);
    led_dot(pp, pos2(at.x + 2.5, at.y + 6.0), 5.0, ed);
    silk(pp, pos2(at.x + 10.0, at.y + 6.0), Align2::LEFT_CENTER, &p.label, F::Silk2, 9.0, SILK2);
    let cur = app.raw(p);
    let row = Rect::from_min_size(pos2(at.x, at.y + 18.0), vec2(w, 26.0));
    if as_keys(p) {
        let n = p.options.len() as f32;
        let kw = ((w - 6.0 * (n - 1.0)) / n).min(110.0);
        for (i, (raw, name)) in p.options.iter().enumerate() {
            let kr = Rect::from_min_size(pos2(row.left() + i as f32 * (kw + 6.0), row.top()), vec2(kw, 24.0));
            let sel = cur == Some(*raw);
            if key(ui, kr, Id::unique(("opt", p.addr, i)), name, sel, None).clicked() && app.online() {
                app.set(p, *raw);
            }
        }
    } else {
        let label = app.shown(p);
        let (step, open) = stepper(ui, Rect::from_min_size(row.min, vec2(w.min(260.0), 24.0)), Id::unique(("step", p.addr)), &label);
        if step != 0 && app.online() {
            graph::step_option(app, p, step);
        }
        if open && app.online() {
            app.fx.popup = if app.fx.popup == Some(sysex::lin(p.addr)) { None } else { Some(sysex::lin(p.addr)) };
        }
        if app.fx.popup == Some(sysex::lin(p.addr)) {
            let names: Vec<String> = p.options.iter().map(|o| o.1.clone()).collect();
            let i = cur.and_then(|c| p.options.iter().position(|o| o.0 == c));
            match option_popup(ui, Id::unique(("opt-popup", p.addr)), row, &names, i, 170.0) {
                Some(Some(k)) => {
                    app.set(p, p.options[k].0);
                    app.fx.popup = None;
                }
                Some(None) => app.fx.popup = None,
                None => {}
            }
        }
    }
}

/// What the block does, drawn on glass: delay repeats, the EQ curve, or every setting as a bar.
fn visual(app: &mut App, ui: &Ui, r: Rect, id: u8, params: &[&'static Param]) {
    if id == 4 {
        let mut band = app.fx.band;
        graph::graph(app, ui, r, Src::Eq, &mut band);
        app.fx.band = band;
        return;
    }
    let g = glass(ui, r);
    let p = ui.painter();
    let find = |s: &str| params.iter().find(|p| p.label.to_uppercase().contains(s)).copied();
    let num = |p: Option<&'static Param>| p.and_then(|p| app.raw(p).map(|r| p.number(r)));
    if id == 7 {
        if let (Some(t), Some(fb)) = (num(find("TIME")), num(find("BACK"))) {
            let lvl = num(find("EFFECT LEVEL")).unwrap_or(100.0) / 120.0;
            let fb = (fb / 100.0).min(0.99);
            let repeats = (1..=12).take_while(|n| lvl * fb.powi(*n - 1) > 0.04).count().max(1);
            let span = (t * (repeats as f64 + 1.0)).max(t * 2.0);
            let (x0, x1, y0, y1) = (g.left() + 22.0, g.right() - 16.0, g.top() + 34.0, g.bottom() - 26.0);
            let xf = |ms: f64| x0 + (ms / span) as f32 * (x1 - x0);
            hline(p, x0, x1, y1, alpha(led(), 0.35));
            let bar = |p: &eframe::egui::Painter, x: f32, a: f64| {
                let top = y1 - (y1 - y0) * a as f32;
                glow(p, Rect::from_min_max(pos2(x - 1.5, top), pos2(x + 1.5, y1)), 1.0, 6.0, alpha(led(), 0.4));
                p.rect_filled(Rect::from_min_max(pos2(x - 1.5, top), pos2(x + 1.5, y1)), 0.0, lit());
            };
            bar(p, xf(0.0), 1.0);
            let mut pts = vec![];
            for n in 1..=repeats {
                let a = lvl * fb.powi(n as i32 - 1);
                bar(p, xf(t * n as f64), a);
                pts.push(pos2(xf(t * n as f64), y1 - (y1 - y0) * a as f32));
            }
            if pts.len() > 1 {
                p.extend(Shape::dashed_line(&pts, Stroke::new(1.0, alpha(led(), 0.6)), 3.0, 3.0));
            }
            vfd(p, pos2(g.left() + 10.0, g.top() + 14.0), Align2::LEFT_CENTER, &format!("IMPULSE {t:.0}ms"), F::MonoB, 9.0);
            vfd(p, pos2(g.right() - 10.0, g.top() + 14.0), Align2::RIGHT_CENTER, &format!("{repeats} REPEATS"), F::MonoB, 9.0);
            vfd(p, pos2(x0, g.bottom() - 12.0), Align2::LEFT_CENTER, "0 ms", F::Mono, 8.5);
            vfd(p, pos2(x1, g.bottom() - 12.0), Align2::RIGHT_CENTER, &format!("{span:.0} ms"), F::Mono, 8.5);
            return;
        }
    }
    // every numeric setting as a 10-segment bar
    let nums: Vec<&&'static Param> = params.iter().filter(|p| p.options.is_empty()).collect();
    if nums.is_empty() {
        vfd(p, g.center(), Align2::CENTER_CENTER, "NO LEVELS ON THIS BLOCK", F::MonoB, 10.0);
        return;
    }
    let rows = nums.len().min(9);
    let rh = ((g.height() - 16.0) / rows as f32).min(22.0);
    for (i, q) in nums.iter().take(rows).enumerate() {
        let y = g.top() + 10.0 + rh * (i as f32 + 0.5);
        vfd_max(p, pos2(g.left() + 10.0, y), Align2::LEFT_CENTER, &q.label.to_uppercase(), F::Mono, 9.5, 120.0);
        let (lo, hi) = q.raw_range();
        let f = app.raw(q).map_or(0.0, |r| (r.saturating_sub(lo)) as f32 / (hi - lo).max(1) as f32);
        vfd_bar(p, Rect::from_min_size(pos2(g.left() + 136.0, y - 3.0), vec2(130.0, 6.0)), f, q.min < 0, false);
        vfd(p, pos2(g.right() - 10.0, y), Align2::RIGHT_CENTER, &app.shown(q), F::Mono, 9.5);
    }
}

fn parameter_panel(app: &mut App, ui: &mut Ui, r: Rect, params: &[&'static Param]) {
    let p = app.touched.filter(|t| params.iter().any(|q| std::ptr::eq(*q, *t))).or(params.first().copied());
    let gr = Rect::from_min_size(r.min, vec2(r.width(), 76.0));
    let g = glass(ui, gr);
    let pp = ui.painter();
    let Some(p) = p else {
        vfd(pp, g.center(), Align2::CENTER_CENTER, "NO PARAMETERS", F::MonoB, 11.0);
        return;
    };
    vfd_max(pp, pos2(g.left() + 12.0, g.top() + 16.0), Align2::LEFT_CENTER, &p.name.to_uppercase(), F::MonoB, 10.5, g.width() - 24.0);
    let v = app.shown(p);
    let vr = vfd(pp, pos2(g.left() + 12.0, g.bottom() - 20.0), Align2::LEFT_CENTER, &v, F::Dot, 24.0);
    if let Some(s) = app.stored_raw(p) {
        vfd(pp, pos2(vr.right() + 12.0, g.bottom() - 17.0), Align2::LEFT_CENTER, &format!("MEM {}", display(p, s)), F::MonoB, 9.0);
    }
    let range = if p.options.is_empty() { format!("{}…{}", p.min, p.max) } else { format!("{} CHOICES", p.options.len()) };
    vfd(pp, pos2(g.right() - 12.0, g.bottom() - 17.0), Align2::RIGHT_CENTER, &range, F::MonoB, 9.0);

    // CLI line
    let value = app.raw(p).map(|r| match p.display(r) {
        serde_json::Value::String(s) => format!("\"{s}\""),
        v => v.to_string(),
    });
    let cli = format!("set \"{}\" {}", p.name, value.unwrap_or_default());
    let cr = Rect::from_min_size(pos2(r.left(), gr.bottom() + 14.0), vec2(r.width() - 72.0, 30.0));
    let g = glass(ui, cr);
    vfd_max(ui.painter(), pos2(g.left() + 10.0, g.center().y), Align2::LEFT_CENTER, &format!("> {cli}"), F::Mono, 10.5, g.width() - 20.0);
    let kr = Rect::from_min_size(pos2(cr.right() + 10.0, cr.top() + 3.0), vec2(62.0, 24.0));
    if key(ui, kr, Id::unique("copy-cli"), "COPY", false, None).on_hover_text("Copy for the command bar (Ctrl+K)").clicked() {
        ui.ctx().copy_text(cli);
        app.say("COPIED".into());
    }
    let pp = ui.painter();
    let hy = cr.bottom() + 16.0;
    silk(pp, pos2(r.left(), hy), Align2::LEFT_CENTER, "TOUCH A KNOB TO LOAD IT HERE · THE SAME", F::Silk2, 9.0, SILK2);
    silk(pp, pos2(r.left(), hy + 14.0), Align2::LEFT_CENTER, "LINE WORKS IN THE COMMAND BAR", F::Silk2, 9.0, SILK2);

    // assigns that drive this parameter
    let ay = hy + 46.0;
    let t = silk(pp, pos2(r.left(), ay), Align2::LEFT_CENTER, "ASSIGNED CONTROLS", F::Silk, 10.0, SILK);
    rule(pp, t.right() + 12.0, r.right(), ay);
    let target = control::target_for(app, p);
    let list: Vec<control::Assign> = control::assigns(app).into_iter().filter(|a| a.on && target.is_some_and(|t| a.target == Some(t.val))).collect();
    let mut y = ay + 22.0;
    if list.is_empty() {
        let msg = if target.is_some() { "NONE ON THIS PATCH" } else { "NOT AN ASSIGN TARGET" };
        silk(pp, pos2(r.left(), y), Align2::LEFT_CENTER, msg, F::Silk2, 9.0, SILK3);
        y += 20.0;
    }
    for a in &list {
        led_dot(pp, pos2(r.left() + 3.0, y), 5.0, true);
        text(pp, pos2(r.left() + 12.0, y), Align2::LEFT_CENTER, &format!("A{}", a.n), F::MonoB, 10.0, SILK);
        text_max(pp, pos2(r.left() + 36.0, y), Align2::LEFT_CENTER, &format!("{} → {}", a.source, a.target_name), F::Mono, 9.5, SILK2, r.width() - 110.0);
        text(pp, pos2(r.right(), y), Align2::RIGHT_CENTER, &a.range, F::Mono, 9.5, SILK2);
        y += 20.0;
    }
    if let Some(t) = target {
        let kr = Rect::from_min_size(pos2(r.left(), y + 6.0), vec2(150.0, 26.0));
        if key(ui, kr, Id::unique("add-assign"), "+ ASSIGN CONTROL", false, None).clicked() {
            control::new_assign(app, t.val);
        }
    }
}
