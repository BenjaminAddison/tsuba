//! CONTROL: the patch's 8 assigns (source → target, range, mode), the CTL/EXP pedal functions, footswitches for
//! the blocks the amp's own buttons and MIDI CCs switch, and the patch-wide level, tempo and key.
//! Assigns and pedal functions are untested on the 50 MK1 (no pedal yet, notes/TODO §5); their lists come from
//! Tone Studio (notes/ctl-map.json), filtered to what this firmware accepts.

use eframe::egui::{pos2, vec2, Align2, Id, Pos2, Rect, Sense, Stroke, Ui};
use katana::catalog::{Param, Target};

use crate::chain;
use crate::editor::{knob_param, set_step, steps};
use crate::graph;
use crate::theme::*;
use crate::widgets::*;
use crate::{patch_unit, App, Tab, GAP};

pub struct State {
    pub sel: usize,
    query: String,
    ctl: usize,
    func_open: bool,
}

impl Default for State {
    fn default() -> State {
        State { sel: 1, query: String::new(), ctl: 0, func_open: false }
    }
}

/// An assign as the matrix shows it.
pub struct Assign {
    pub n: usize,
    pub on: bool,
    pub source: String,
    pub target: Option<u32>,
    pub target_name: String,
    pub range: String,
    pub mode: String,
}

/// `ASSIGNn: FIELD` (one name in Tone Studio's map carries a stray suffix, so match the prefix).
pub fn aparam(app: &App, n: usize, field: &str) -> Option<&'static Param> {
    let want = format!("ASSIGN{n}: {field}");
    app.cat.get(&want).or_else(|| app.cat.params.iter().find(|p| p.name.starts_with(&want)))
}

/// Raw TARGET MIN/MAX range and the display of a raw value, for a target.
fn target_raw_range(t: &Target) -> (u32, u32) {
    let off = t.min.min(0) as f64;
    (((t.min as f64 - off) / t.step) as u32, ((t.max as f64 - off) / t.step) as u32)
}

fn target_value(t: &Target, raw: u32) -> String {
    let v = t.min.min(0) as f64 + raw as f64 * t.step;
    if t.max == 1 && t.min == 0 {
        return if raw == 0 { "OFF".into() } else { "ON".into() };
    }
    if t.step.fract() == 0.0 { format!("{}", v as i64) } else { format!("{v}") }
}

pub fn assigns(app: &App) -> Vec<Assign> {
    (1..=8)
        .map(|n| {
            let get = |f: &str| aparam(app, n, f).and_then(|p| app.raw(p));
            let on = get("ON/OFF") == Some(1);
            let source = aparam(app, n, "SOURCE").map_or("—".into(), |p| app.shown(p));
            let target = get("TARGET");
            let t = target.and_then(|v| app.cat.target(v));
            let target_name = t.map_or_else(|| target.map_or("—".into(), |v| format!("TARGET {v}")), |t| t.name.clone());
            let range = match (t, get("TARGET MIN"), get("TARGET MAX")) {
                (Some(t), Some(a), Some(b)) => format!("{}–{}", target_value(t, a), target_value(t, b)),
                _ => "—".into(),
            };
            let mode = aparam(app, n, "SOURCE MODE").map_or("—".into(), |p| app.shown(p));
            Assign { n, on, source, target, target_name, range, mode: mode.chars().take(3).collect() }
        })
        .collect()
}

/// The assign target that drives this parameter, by name.
pub fn target_for(app: &App, p: &Param) -> Option<&'static Target> {
    let cat: &'static katana::Catalog = app.cat;
    let norm = |s: &str| s.chars().filter(|c| c.is_ascii_alphanumeric()).collect::<String>().to_uppercase();
    let pn = norm(&p.name);
    cat.targets.iter().find(|t| norm(&t.name) == pn).or_else(|| {
        let (pb, pl) = p.name.split_once(": ")?;
        let pb = norm(pb);
        cat.targets.iter().find(|t| {
            t.name.split_once(": ").is_some_and(|(tb, tl)| {
                let tl = norm(tl);
                norm(tb) == pb && !tl.is_empty() && (norm(&p.label) == tl || norm(pl).ends_with(&tl))
            })
        })
    })
}

/// Point the first free assign at `target` (full range) and open it.
pub fn new_assign(app: &mut App, target: u32) {
    let free = (1..=8).find(|&n| aparam(app, n, "ON/OFF").and_then(|p| app.raw(p)) == Some(0)).unwrap_or(app.ctl.sel);
    if let Some(t) = app.cat.target(target) {
        let (lo, hi) = target_raw_range(t);
        for (f, v) in [("TARGET", target), ("TARGET MIN", lo), ("TARGET MAX", hi), ("ON/OFF", 1)] {
            if let Some(p) = aparam(app, free, f) {
                app.set(p, v);
            }
        }
        app.say(format!("A{free} → {}", t.name));
    }
    app.ctl.sel = free;
    app.tab = Tab::Control;
}

pub fn show(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let mut y = o.y;
    y += patch_unit(app, ui, pos2(o.x, y), w, false) + GAP;
    y += matrix_unit(app, ui, pos2(o.x, y), w) + GAP;
    y += pedals_unit(app, ui, pos2(o.x, y), w);
    y - o.y
}

fn matrix_unit(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let h = 340.0;
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 6);
    let list = assigns(app);
    let active = list.iter().filter(|a| a.on).count();
    let sel = app.ctl.sel.clamp(1, 8);
    header(ui.painter(), face, face.top() + 22.0, "ASSIGN · MATRIX", &format!("{active} OF 8 ACTIVE"), &format!("EDIT · A{sel}"), 3);
    let x0 = face.left() + 20.0;
    let top = face.top() + 46.0;
    let table_w = (face.width() * 0.5).min(660.0);
    // on/off keys + table
    let tr = Rect::from_min_size(pos2(x0 + 36.0, top), vec2(table_w, 8.0 * 27.0 + 40.0));
    let g = glass(ui, tr);
    let cols = [10.0, 40.0, 54.0, 180.0, 196.0, g.width() - 140.0, g.width() - 64.0];
    let p = ui.painter();
    for (i, h) in ["#", "", "SOURCE", "", "TARGET", "RANGE", "MODE"].iter().enumerate() {
        text(p, pos2(g.left() + cols[i], g.top() + 13.0), Align2::LEFT_CENTER, h, F::MonoB, 8.5, mix(lit(), BLACK, 0.4));
    }
    for (i, a) in list.iter().enumerate() {
        let ry = g.top() + 26.0 + i as f32 * 27.0;
        let row = Rect::from_min_size(pos2(g.left() + 2.0, ry), vec2(g.width() - 4.0, 26.0));
        let s = a.n == sel;
        if vfd_row(ui, row, Id::unique(("arow", a.n)), s).clicked() {
            app.ctl.sel = a.n;
        }
        let p = ui.painter();
        let dimmed = !a.on;
        let cy = row.center().y;
        row_text(p, pos2(g.left() + cols[0], cy), Align2::LEFT_CENTER, &format!("A{}", a.n), 11.0, s, dimmed, 30.0);
        row_text(p, pos2(g.left() + cols[1], cy), Align2::LEFT_CENTER, if a.on { "●" } else { "·" }, 11.0, s, dimmed, 12.0);
        row_text(p, pos2(g.left() + cols[2], cy), Align2::LEFT_CENTER, if a.on { &a.source } else { "—" }, 11.0, s, dimmed, 120.0);
        row_text(p, pos2(g.left() + cols[3], cy), Align2::LEFT_CENTER, "→", 11.0, s, true, 14.0);
        let tn = if a.on { a.target_name.as_str() } else { "UNASSIGNED" };
        row_text(p, pos2(g.left() + cols[4], cy), Align2::LEFT_CENTER, tn, 11.0, s, dimmed, cols[5] - cols[4] - 10.0);
        row_text(p, pos2(g.left() + cols[5], cy), Align2::LEFT_CENTER, if a.on { &a.range } else { "" }, 11.0, s, dimmed, 70.0);
        row_text(p, pos2(g.left() + cols[6], cy), Align2::LEFT_CENTER, if a.on { &a.mode } else { "—" }, 11.0, s, dimmed, 50.0);
        // on/off key
        if let Some(sw) = aparam(app, a.n, "ON/OFF") {
            let kr = Rect::from_min_size(pos2(x0, tr.top() + 5.0 + 26.0 + i as f32 * 27.0 + 4.0), vec2(22.0, 16.0));
            let resp = ui.interact(kr, Id::unique(("aon", a.n)), Sense::click());
            let face_r = keycap(ui.painter(), kr, Cap::Grey, a.on, resp.hovered());
            led_rect(ui.painter(), Rect::from_center_size(face_r.center(), vec2(10.0, 3.0)), 1.0, a.on);
            if resp.on_hover_text(format!("Assign {} on/off", a.n)).clicked() && app.online() {
                app.set(sw, !a.on as u32);
            }
        }
    }
    let ex = tr.right() + 36.0;
    groove(ui.painter(), ex - 18.0, top, face.bottom() - 18.0);
    edit_assign(app, ui, Rect::from_min_max(pos2(ex, top), pos2(face.right() - 20.0, face.bottom() - 18.0)), sel);
    h
}

fn edit_assign(app: &mut App, ui: &mut Ui, r: Rect, n: usize) {
    let p = ui.painter();
    let lx = r.left();
    let cx = lx + 90.0;
    let mut y = r.top() + 12.0;
    // SOURCE
    silk(p, pos2(lx, y), Align2::LEFT_CENTER, "SOURCE", F::Silk2, 9.0, SILK2);
    if let Some(sp) = aparam(app, n, "SOURCE") {
        let cur = app.raw(sp);
        let mut x = cx;
        let mut row = 0;
        for (raw, name) in sp.options.iter().filter(|o| o.0 < 10) {
            let label = name.replace(" PDL", "").replace("PEDAL", "PDL");
            let kw = text_w(ui.painter(), &label, F::Silk2, 8.5) + 18.0;
            if x + kw > r.right() {
                x = cx;
                row += 1;
            }
            let kr = Rect::from_min_size(pos2(x, y - 11.0 + row as f32 * 34.0), vec2(kw, 22.0));
            let on = cur == Some(*raw);
            if key(ui, kr, Id::unique(("src", raw)), &label, on, Some(on)).clicked() && app.online() {
                app.set(sp, *raw);
            }
            x += kw + 6.0;
        }
        // CC sources: a stepper
        let ccs: Vec<&(u32, String)> = sp.options.iter().filter(|o| o.0 >= 10).collect();
        let cc_i = cur.and_then(|c| ccs.iter().position(|o| o.0 == c));
        let label = cc_i.map_or("MIDI CC".to_string(), |i| ccs[i].1.clone());
        if x + 150.0 > r.right() {
            x = cx;
            row += 1;
        }
        let (step, _) = stepper(ui, Rect::from_min_size(pos2(x, y - 11.0 + row as f32 * 34.0), vec2(150.0, 22.0)), Id::unique("cc-step"), &label);
        if step != 0 && app.online() {
            let i = cc_i.map_or(0, |i| (i as i32 + step).clamp(0, ccs.len() as i32 - 1) as usize);
            app.set(sp, ccs[i].0);
        }
        y += 34.0 * (row + 1) as f32 + 10.0;
    }
    // TARGET: search + current
    let p = ui.painter();
    silk(p, pos2(lx, y), Align2::LEFT_CENTER, "TARGET", F::Silk2, 9.0, SILK2);
    let tp = aparam(app, n, "TARGET");
    let cur_t = tp.and_then(|p| app.raw(p)).and_then(|v| app.cat.target(v));
    let fr = Rect::from_min_size(pos2(cx, y - 14.0), vec2((r.right() - cx - 240.0).clamp(160.0, 330.0), 28.0));
    let resp = vfd_field(ui, fr, &mut app.ctl.query, &cur_t.map_or("search targets".into(), |t| t.name.clone()), "", 11.0);
    let q = app.ctl.query.trim().to_uppercase();
    let mut picked = None;
    if !q.is_empty() {
        let hits: Vec<&'static Target> = app.cat.targets.iter().filter(|t| t.name.to_uppercase().contains(&q) && !dead_target(&t.name)).take(6).collect();
        let lr = Rect::from_min_size(pos2(fr.left(), fr.bottom() + 4.0), vec2(fr.width(), hits.len().max(1) as f32 * 22.0 + 14.0));
        eframe::egui::Area::new(Id::unique("target-hits")).order(eframe::egui::Order::Foreground).fixed_pos(lr.min).show(ui.ctx(), |ui| {
            ui.allocate_rect(lr, Sense::hover());
            shadow(ui.painter(), lr, 5.0, 10.0, 20.0, rgba(0x000000D0));
            let g = glass(ui, lr);
            if hits.is_empty() {
                vfd(ui.painter(), pos2(g.left() + 8.0, g.center().y), Align2::LEFT_CENTER, "NO TARGET BY THAT NAME", F::Mono, 10.0);
            }
            for (i, t) in hits.iter().enumerate() {
                let row = Rect::from_min_size(pos2(g.left() + 2.0, g.top() + 2.0 + i as f32 * 22.0), vec2(g.width() - 4.0, 22.0));
                if vfd_row(ui, row, Id::unique(("hit", t.val)), false).clicked() {
                    picked = Some(*t);
                }
                row_text(ui.painter(), pos2(row.left() + 8.0, row.center().y), Align2::LEFT_CENTER, &t.name, 10.5, false, false, row.width() - 16.0);
            }
        });
        if resp.lost_focus() && ui.input(|i| i.key_pressed(eframe::egui::Key::Enter)) {
            picked = hits.first().copied();
        }
    }
    if let (Some(t), Some(tp)) = (picked, tp) {
        if app.online() {
            app.set(tp, t.val);
            let (lo, hi) = target_raw_range(t);
            for (f, v) in [("TARGET MIN", lo), ("TARGET MAX", hi)] {
                if let Some(p) = aparam(app, n, f) {
                    app.set(p, v);
                }
            }
        }
        app.ctl.query.clear();
    }
    // MIN / MAX knobs over the target's range
    let ky = y - 20.0;
    let kx = fr.right() + 22.0;
    if let Some(t) = cur_t {
        let (lo, hi) = target_raw_range(t);
        for (i, f) in ["TARGET MIN", "TARGET MAX"].into_iter().enumerate() {
            let Some(p) = aparam(app, n, f) else { continue };
            let at = pos2(kx + i as f32 * 100.0, ky);
            let raw = app.raw(p).unwrap_or(lo).clamp(lo, hi);
            let mem = app.stored_raw(p).map(|m| (m.clamp(lo, hi) - lo) as usize);
            let (new, _) = knob(ui, at, Id::unique(("tk", n, i)), Size::S, (raw - lo) as usize, (hi - lo + 1) as usize, mem, app.online());
            if let Some(v) = new {
                app.set(p, lo + v as u32);
            }
            let pp = ui.painter();
            silk(pp, pos2(at.x + 48.0, at.y + 14.0), Align2::LEFT_CENTER, if i == 0 { "MIN" } else { "MAX" }, F::Silk, 10.0, SILK);
            text(pp, pos2(at.x + 48.0, at.y + 30.0), Align2::LEFT_CENTER, &target_value(t, raw), F::Mono, 10.5, SILK2);
        }
    }
    y += 52.0;
    // MODE
    let p = ui.painter();
    silk(p, pos2(lx, y), Align2::LEFT_CENTER, "MODE", F::Silk2, 9.0, SILK2);
    if let Some(mp) = aparam(app, n, "SOURCE MODE") {
        let cur = app.raw(mp);
        for (i, (raw, name)) in mp.options.iter().enumerate() {
            let kr = Rect::from_min_size(pos2(cx + i as f32 * 84.0, y - 11.0), vec2(76.0, 22.0));
            let on = cur == Some(*raw);
            if key(ui, kr, Id::unique(("mode", i)), name, on, Some(on)).clicked() && app.online() {
                app.set(mp, *raw);
            }
        }
        silk(ui.painter(), pos2(cx + 186.0, y), Align2::LEFT_CENTER, "MOMENT FOLLOWS THE PEDAL · TOGGLE LATCHES", F::Silk2, 8.5, SILK3);
    }
    y += 44.0;
    // WAVE (for the WAVE PEDAL source)
    let p = ui.painter();
    silk(p, pos2(lx, y), Align2::LEFT_CENTER, "WAVE", F::Silk2, 9.0, SILK2);
    let rate = aparam(app, n, "WAVE RATE");
    let form = aparam(app, n, "WAVEFORM");
    if let Some(fp) = form {
        let v = app.raw(fp).unwrap_or(0);
        let (step, _) = stepper(ui, Rect::from_min_size(pos2(cx, y - 11.0), vec2(124.0, 22.0)), Id::unique("waveform"), &format!("{v}"));
        if step != 0 && app.online() {
            app.set(fp, (v as i32 + step).clamp(0, 2) as u32);
        }
    }
    if let Some(rp) = rate {
        let (idx, nn, mem) = steps(app, rp);
        let (new, _) = knob(ui, pos2(cx + 140.0, y - 21.0), Id::unique(("wrate", n)), Size::S, idx, nn.min(101), mem, app.online());
        if let Some(i) = new {
            set_step(app, rp, i);
        }
        let pp = ui.painter();
        silk(pp, pos2(cx + 188.0, y - 7.0), Align2::LEFT_CENTER, "RATE", F::Silk, 10.0, SILK);
        text(pp, pos2(cx + 188.0, y + 9.0), Align2::LEFT_CENTER, &app.shown(rp), F::Mono, 10.5, SILK2);
    }
    // the wave on glass
    let wr = Rect::from_min_max(pos2(cx + 250.0, y - 22.0), pos2(r.right(), y + 26.0));
    if wr.width() > 80.0 {
        let g = glass(ui, wr);
        let rate_v = rate.and_then(|p| app.raw(p)).unwrap_or(50) as f32;
        let shape = form.and_then(|p| app.raw(p)).unwrap_or(0);
        let cycles = 1.0 + rate_v / 25.0;
        let pts: Vec<Pos2> = (0..=120)
            .map(|i| {
                let t = i as f32 / 120.0;
                let ph = (t * cycles).fract();
                let v = match shape {
                    1 => 1.0 - 2.0 * (2.0 * ph - 1.0).abs(),
                    2 => (ph * std::f32::consts::TAU).sin(),
                    _ => 2.0 * ph - 1.0,
                };
                pos2(g.left() + 6.0 + t * (g.width() - 12.0), g.center().y - v * (g.height() / 2.0 - 6.0))
            })
            .collect();
        let pp = ui.painter();
        pp.line(pts.clone(), Stroke::new(5.0, alpha(led(), 0.15)));
        pp.line(pts, Stroke::new(1.6, lit()));
    }
}

/// Targets on blocks the 50 MK1 can't run.
pub fn dead_target(name: &str) -> bool {
    ["COMP:", "PREAMP B:", "CHORUS:", "ACCEL", "DIVIDER", "MIXER", "PRM_DIVIDER", "PRM_MIXER"].iter().any(|d| name.starts_with(d))
}

/// The CTL/EXP functions: (label, FUNC name, SRC MODE name).
const CTLS: [(&str, &str, Option<&str>); 6] = [
    ("ACCEL/CTL", "CTL/EXP: ACCEL/CTL: FUNC", Some("CTL/EXP: ACCEL/CTL: SRC MODE")),
    ("EXP SW", "CTL/EXP: EXP SW: FUNC", Some("CTL/EXP: EXP SW: SRC MODE")),
    ("SUB CTL1", "CTL/EXP: SUB CTL1: FUNC", Some("CTL/EXP: SUB CTL1: SRC MODE")),
    ("SUB CTL2", "CTL/EXP: SUB CTL2: FUNC", Some("CTL/EXP: SUB CTL2: SRC MODE")),
    ("EXP", "CTL/EXP: EXP: FUNC", None),
    ("SUB EXP", "CTL/EXP: SUB EXP: FUNC", None),
];

/// Footswitches: label, chain block, the MIDI CC that also switches it (notes/07).
const STOMPS: [(&str, u8, Option<u8>); 8] = [
    ("BOOSTER", 15, Some(16)),
    ("MOD", 5, None),
    ("FX", 6, Some(17)),
    ("DELAY", 7, None),
    ("REVERB", 9, Some(18)),
    ("PEDAL FX", 11, None),
    ("SEND/RTN", 1, Some(19)),
    ("NS", 13, None),
];

fn pedals_unit(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let h = 264.0;
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 7);
    let p = ui.painter();
    let x0 = face.left() + 20.0;
    let ty = face.top() + 22.0;
    let lw = 390.0;
    let t = silk(p, pos2(x0, ty), Align2::LEFT_CENTER, "CTL · PEDALS", F::Silk, 11.0, SILK);
    rule(p, t.right() + 12.0, x0 + lw, ty);
    // CTL list
    let lr = Rect::from_min_size(pos2(x0, face.top() + 42.0), vec2(lw, 6.0 * 25.0 + 14.0));
    let g = glass(ui, lr);
    for (i, (label, func, mode)) in CTLS.iter().enumerate() {
        let row = Rect::from_min_size(pos2(g.left() + 2.0, g.top() + 4.0 + i as f32 * 25.0), vec2(g.width() - 4.0, 24.0));
        let s = app.ctl.ctl == i;
        if vfd_row(ui, row, Id::unique(("ctl", i)), s).clicked() {
            app.ctl.ctl = i;
            app.ctl.func_open = false;
        }
        let pp = ui.painter();
        let f = app.cat.get(func).map_or("—".into(), |p| app.shown(p));
        let m = mode.and_then(|m| app.cat.get(m)).map_or(if i >= 4 { "PEDAL".into() } else { "—".into() }, |p| app.shown(p).chars().take(3).collect::<String>());
        row_text(pp, pos2(row.left() + 10.0, row.center().y), Align2::LEFT_CENTER, label, 11.0, s, true, 90.0);
        row_text(pp, pos2(row.left() + 104.0, row.center().y), Align2::LEFT_CENTER, &f, 11.0, s, f == "OFF", 200.0);
        row_text(pp, pos2(row.right() - 10.0, row.center().y), Align2::RIGHT_CENTER, &m, 11.0, s, true, 60.0);
    }
    let (label, func, mode) = CTLS[app.ctl.ctl.min(5)];
    let sy = lr.bottom() + 20.0;
    silk(ui.painter(), pos2(x0, sy), Align2::LEFT_CENTER, label, F::Silk2, 9.0, SILK2);
    if let Some(fp) = app.cat.get(func) {
        let cur = app.raw(fp);
        let i = cur.and_then(|c| fp.options.iter().position(|o| o.0 == c));
        let sr = Rect::from_min_size(pos2(x0 + 80.0, sy - 11.0), vec2(200.0, 22.0));
        let (step, open) = stepper(ui, sr, Id::unique("func"), &app.shown(fp));
        if app.online() {
            if step != 0 {
                graph::step_option(app, fp, step);
            }
            if open {
                app.ctl.func_open = !app.ctl.func_open;
            }
        }
        if app.ctl.func_open {
            let names: Vec<String> = fp.options.iter().map(|o| o.1.clone()).collect();
            match option_popup(ui, Id::unique("func-popup"), sr, &names, i, 180.0) {
                Some(Some(k)) => {
                    app.set(fp, fp.options[k].0);
                    app.ctl.func_open = false;
                }
                Some(None) => app.ctl.func_open = false,
                None => {}
            }
        }
    }
    if let Some(mp) = mode.and_then(|m| app.cat.get(m)) {
        let cur = app.raw(mp);
        for (k, (raw, name)) in mp.options.iter().enumerate() {
            let kr = Rect::from_min_size(pos2(x0 + 292.0 + k as f32 * 50.0, sy - 11.0), vec2(46.0, 22.0));
            let on = cur == Some(*raw);
            if key(ui, kr, Id::unique(("ctlmode", k)), &name[..3], on, None).on_hover_text(name.as_str()).clicked() && app.online() {
                app.set(mp, *raw);
            }
        }
    }
    let pp = ui.painter();
    let note = if app.ctl.ctl == 4 { "THE 50 MK1 STORES OFF OR FOOT VOLUME HERE" } else { "FOR A FOOTSWITCH OR PEDAL ON THE CTL/EXP JACK" };
    silk(pp, pos2(x0, sy + 22.0), Align2::LEFT_CENTER, note, F::Silk2, 8.5, SILK3);

    // footswitches
    let mx0 = x0 + lw + 36.0;
    groove(ui.painter(), mx0 - 18.0, face.top() + 14.0, face.bottom() - 14.0);
    let mw = (face.width() - lw - 40.0 - 330.0 - 72.0).max(360.0);
    let pp = ui.painter();
    let t = silk(pp, pos2(mx0 + mw / 2.0, ty), Align2::CENTER_CENTER, "STOMP", F::Silk, 11.0, SILK);
    rule(pp, mx0, t.left() - 12.0, ty);
    rule(pp, t.right() + 12.0, mx0 + mw, ty);
    let step = mw / 4.0;
    for (i, (label, id, cc)) in STOMPS.iter().enumerate() {
        let c = pos2(mx0 + step * ((i % 4) as f32 + 0.5), face.top() + 82.0 + (i / 4) as f32 * 92.0);
        let (on, locked) = chain::block_state(app, *id);
        let ok = app.online() && !locked;
        if footswitch(ui, c, Id::unique(("stomp", id)), on, ok).on_hover_text(format!("{} {}", chain::info(*id).1, if on { "on" } else { "bypassed" })).clicked() {
            chain::toggle(app, *id);
        }
        let pp = ui.painter();
        silk(pp, pos2(c.x, c.y + 32.0), Align2::CENTER_CENTER, &cc.map_or(chain::type_text(app, *id), |n| format!("CC#{n}")), F::Silk2, 8.5, SILK3);
        let lc = if on { lit() } else { SILK };
        if on {
            vfd(pp, pos2(c.x, c.y + 46.0), Align2::CENTER_CENTER, label, F::Silk, 10.0);
        } else {
            silk(pp, pos2(c.x, c.y + 46.0), Align2::CENTER_CENTER, label, F::Silk, 10.0, lc);
        }
    }

    // patch-wide
    let rx0 = face.right() - 20.0 - 330.0;
    groove(ui.painter(), rx0 - 18.0, face.top() + 14.0, face.bottom() - 14.0);
    header_tail(ui.painter(), face, ty, rx0, "PATCH · GLOBAL", 4);
    let ky = face.top() + 50.0;
    knob_param(app, ui, pos2(rx0 + 10.0, ky), Size::E, "LEVEL", app.param("PATCH LEVEL"));
    knob_param(app, ui, pos2(rx0 + 110.0, ky), Size::E, "BPM", app.param("MASTER BPM"));
    let kp = app.param("MASTER KEY");
    let pp = ui.painter();
    silk(pp, pos2(rx0 + 196.0, ky + 12.0), Align2::LEFT_CENTER, "KEY", F::Silk2, 9.0, SILK2);
    let (stp, _) = stepper(ui, Rect::from_min_size(pos2(rx0 + 196.0, ky + 26.0), vec2(134.0, 22.0)), Id::unique("key"), &app.shown(kp));
    if stp != 0 && app.online() {
        graph::step_option(app, kp, stp);
    }
    let pp = ui.painter();
    silk(pp, pos2(rx0 + 196.0, ky + 66.0), Align2::LEFT_CENTER, "HARMONIST KEY", F::Silk2, 8.5, SILK3);
    let ny = face.bottom() - 40.0;
    silk(pp, pos2(rx0, ny), Align2::LEFT_CENTER, "PATCH LEVEL 0 IS SILENT · CC#80 SETS IT", F::Silk2, 8.5, SILK3);
    silk(pp, pos2(rx0, ny + 14.0), Align2::LEFT_CENTER, "BPM DRIVES TEMPO-SYNCED DELAY TIMES", F::Silk2, 8.5, SILK3);
    let _ = Stroke::NONE;
    h
}

fn header_tail(p: &eframe::egui::Painter, face: Rect, y: f32, x0: f32, title: &str, num: usize) {
    let s = format!("{num:02}");
    let w = text_w(p, &s, F::Mono, 9.0) + 12.0;
    let b = Rect::from_min_size(pos2(face.right() - 20.0 - w, y - 7.0), vec2(w, 14.0));
    rrect_stroke(p, b, 2.0, rgba(0xE8E4DC55));
    text(p, b.center(), Align2::CENTER_CENTER, &s, F::Mono, 9.0, SILK2);
    let t = silk(p, pos2(x0, y), Align2::LEFT_CENTER, title, F::Silk, 11.0, SILK);
    rule(p, t.right() + 12.0, b.left() - 12.0, y);
}
