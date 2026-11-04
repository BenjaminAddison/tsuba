//! EDITOR: patch memory | signal path (click a block to engage or bypass it) | preamp | response and master EQ.

use eframe::egui::{pos2, vec2, Align2, Id, Pos2, Rect, Sense, Stroke, Ui};
use katana::catalog::Param;

use crate::chain::{self, Mode};
use crate::graph::{self, Src};
use crate::theme::*;
use crate::widgets::*;
use crate::{patch_unit, display, App, Tab, GAP};

#[derive(Default)]
pub struct State {
    pub band: usize,
    pub src: Src,
    models_open: bool,
}

/// The panel's 5 amp types and the GT models they select (notes/07).
pub const QUICK: [(&str, u32); 5] = [("ACOUSTIC", 1), ("CLEAN", 8), ("CRUNCH", 11), ("LEAD", 24), ("BROWN", 23)];

pub fn show(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let mut y = o.y;
    y += patch_unit(app, ui, pos2(o.x, y), w, true) + GAP;
    y += path_unit(app, ui, pos2(o.x, y), w) + GAP;
    y += preamp_unit(app, ui, pos2(o.x, y), w) + GAP;
    y += response_unit(app, ui, pos2(o.x, y), w);
    y - o.y
}

fn path_unit(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let h = 128.0;
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 2);
    let (on, n) = chain::active_count(app);
    let sub = if n > 0 { format!("{on} OF {n} ACTIVE · CLICK TO ENGAGE · DRAG TO MOVE") } else { String::new() };
    header(ui.painter(), face, face.top() + 22.0, "SIGNAL PATH", &sub, "", 2);
    let row = Rect::from_min_max(pos2(face.left() + 20.0, face.top() + 50.0), pos2(face.right() - 20.0, face.top() + 82.0));
    if let Some(id) = chain::row(app, ui, row, Mode::Toggle) {
        app.chain.sel = Some(id);
        app.tab = Tab::Effects;
    }
    chain::legend(ui.painter(), face.right() - 20.0, face.bottom() - 16.0, false);
    h
}

/// Index and count for a parameter's knob/fader: list position for option lists, else raw offset.
pub fn steps(app: &App, p: &Param) -> (usize, usize, Option<usize>) {
    if p.options.is_empty() {
        let (lo, hi) = p.raw_range();
        let i = |r: u32| (r.clamp(lo, hi) - lo) as usize;
        (app.raw(p).map_or(0, i), (hi - lo + 1) as usize, app.stored_raw(p).map(i))
    } else {
        let i = |r: u32| p.options.iter().position(|o| o.0 == r);
        (app.raw(p).and_then(i).unwrap_or(0), p.options.len(), app.stored_raw(p).and_then(i))
    }
}

pub fn set_step(app: &mut App, p: &'static Param, i: usize) {
    if p.options.is_empty() {
        app.set(p, p.raw_range().0 + i as u32);
    } else if let Some(o) = p.options.get(i) {
        app.set(p, o.0);
    }
}

/// A parameter knob with its label row; `name` overrides the parameter's label.
pub fn knob_param(app: &mut App, ui: &Ui, o: Pos2, size: Size, name: &str, p: &'static Param) {
    let (idx, n, mem) = steps(app, p);
    let enabled = app.online() && app.raw(p).is_some() && !p.is_locked();
    let (new, resp) = knob(ui, o, Id::unique(("knob", p.addr)), size, idx, n, mem, enabled);
    if resp.drag_started() || resp.clicked() {
        app.touched = Some(p);
    }
    if let Some(i) = new {
        set_step(app, p, i);
    }
    let b = size.box_px();
    let value = match app.raw(p) {
        Some(r) if p.options.is_empty() && p.min >= 0 && p.max <= 120 => format!("{:>3}", p.number(r) as i64),
        Some(r) => display(p, r),
        None => "—".into(),
    };
    let resp = resp.on_hover_text(format!("{}{}", p.name, app.stored_raw(p).filter(|_| app.edited(p)).map_or(String::new(), |s| format!(" · memory {}", display(p, s)))));
    let _ = resp;
    let max_w = if size == Size::E { 92.0 } else { b + 40.0 };
    knob_label(ui.painter(), pos2(o.x + b / 2.0, o.y + b + 8.0), name, &value, app.edited(p), max_w);
}

fn bracket(p: &eframe::egui::Painter, x0: f32, x1: f32, y: f32, label: &str) {
    let t = silk(p, pos2((x0 + x1) / 2.0, y), Align2::CENTER_CENTER, label, F::Silk2, 9.0, SILK2);
    let c = rgba(0xE8E4DC55);
    hline(p, x0, t.left() - 8.0, y, c);
    hline(p, t.right() + 8.0, x1, y, c);
    vline(p, x0, y, y + 6.0, c);
    vline(p, x1 - 1.0, y, y + 6.0, c);
}

fn preamp_unit(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let h = 242.0;
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 3);
    let rx = header(ui.painter(), face, face.top() + 22.0, "PREAMP · A", "", "", 3);
    // AMP on/off rocker in the header
    let on_p = app.param("PREAMP A: ON/OFF");
    let rr = Rect::from_min_size(pos2(rx - 30.0, face.top() + 13.0), vec2(42.0, 18.0));
    let amp_on = app.raw(on_p) != Some(0);
    if let Some(v) = rocker(ui, rr, Id::unique("amp-on"), amp_on, app.online()) {
        app.set(on_p, v as u32);
    }
    silk(ui.painter(), pos2(rr.left() - 10.0, rr.center().y), Align2::RIGHT_CENTER, "AMP", F::Silk, 10.0, SILK);

    let top = face.top() + 40.0;
    let x0 = face.left() + 20.0;
    // TYPE: the panel's 5-way selector, a stepper over all 26 models
    type_selector(app, ui, pos2(x0, top), 230.0);
    let g1 = x0 + 250.0;
    groove(ui.painter(), g1, top + 4.0, face.bottom() - 16.0);

    let level = [("GAIN", "PREAMP A: GAIN"), ("VOLUME", "PREAMP A: LEVEL")];
    let tone = [("BASS", "PREAMP A: BASS"), ("MIDDLE", "PREAMP A: MIDDLE"), ("TREBLE", "PREAMP A: TREBLE"), ("PRESENCE", "PREAMP A: PRESENCE")];
    let right_w = 300.0;
    let g2 = face.right() - 20.0 - right_w - 16.0;
    let avail = g2 - g1 - 32.0;
    let need = 2.0 * 92.0 + 4.0 * 74.0;
    let gap = ((avail - need) / 7.0).clamp(8.0, 40.0);
    let mut x = g1 + 16.0 + gap;
    let ky = top + 36.0;
    let lx0 = x;
    for (n, pn) in level {
        knob_param(app, ui, pos2(x, ky), Size::L, n, app.param(pn));
        x += 92.0 + gap;
    }
    bracket(ui.painter(), lx0 - 6.0, x - gap + 6.0, top + 14.0, "LEVEL");
    x += gap;
    let tx0 = x;
    for (n, pn) in tone {
        knob_param(app, ui, pos2(x, ky + 10.0), Size::M, n, app.param(pn));
        x += 74.0 + gap;
    }
    bracket(ui.painter(), tx0 - 6.0, x - gap + 6.0, top + 14.0, "TONE");
    groove(ui.painter(), g2, top + 4.0, face.bottom() - 16.0);

    // SOLO, BRIGHT, trims
    let sx = g2 + 30.0;
    let solo = app.param("PREAMP A: SOLO SW");
    let bright = app.param("PREAMP A: BRIGHT");
    for (i, (label, p)) in [("SOLO", solo), ("BRIGHT", bright)].into_iter().enumerate() {
        let kr = Rect::from_min_size(pos2(sx + i as f32 * 82.0, top + 22.0), vec2(70.0, 28.0));
        let on = app.raw(p) == Some(1);
        if key(ui, kr, Id::unique(("pa-key", label)), label, on, Some(on)).clicked() && app.online() {
            app.set(p, !on as u32);
        }
    }
    let ty = top + 76.0;
    for (i, (label, pn)) in [("SOLO LVL", "PREAMP A: SOLO LEVEL"), ("T-COMP", "PREAMP A: T-COMP")].into_iter().enumerate() {
        let kx = sx + i as f32 * 140.0;
        let p = app.param(pn);
        let (idx, n, mem) = steps(app, p);
        let (new, resp) = knob(ui, pos2(kx, ty), Id::unique(("knob", p.addr)), Size::S, idx, n, mem, app.online() && app.raw(p).is_some());
        if resp.drag_started() {
            app.touched = Some(p);
        }
        if let Some(i) = new {
            set_step(app, p, i);
        }
        let pp = ui.painter();
        let ed = app.edited(p);
        led_dot(pp, pos2(kx + 50.0, ty + 14.0), 5.0, ed);
        silk(pp, pos2(kx + 58.0, ty + 14.0), Align2::LEFT_CENTER, label, F::Silk, 10.0, SILK);
        let v = app.shown(p);
        if ed {
            vfd(pp, pos2(kx + 58.0, ty + 30.0), Align2::LEFT_CENTER, &v, F::Mono, 10.5);
        } else {
            text(pp, pos2(kx + 58.0, ty + 30.0), Align2::LEFT_CENTER, &v, F::Mono, 10.5, SILK2);
        }
    }
    let p = ui.painter();
    silk(p, pos2(sx, ty + 70.0), Align2::LEFT_CENTER, "DRAG · SHIFT FINE · DOUBLE-CLICK", F::Silk2, 9.0, SILK2);
    silk(p, pos2(sx, ty + 84.0), Align2::LEFT_CENTER, "RECALLS · LIT TICK MARKS MEMORY", F::Silk2, 9.0, SILK2);
    h
}

/// The 5-way AMP TYPE selector (ACOUSTIC … BROWN, as on the amp) and a stepper over all 26 models.
fn type_selector(app: &mut App, ui: &Ui, o: Pos2, w: f32) {
    let ty = app.param("PREAMP A: TYPE");
    let cur = app.raw(ty);
    let c = pos2(o.x + w / 2.0, o.y + 72.0);
    let pos = cur.and_then(|c| QUICK.iter().position(|q| q.1 == c));
    let enabled = app.online() && cur.is_some();
    // labels around
    let p = ui.painter();
    let ticks: Vec<Pos2> = (0..=40).map(|i| point(c, -90.0 + 180.0 * i as f32 / 40.0, 38.0)).collect();
    p.line(ticks, Stroke::new(1.0, rgba(0xE8E4DC33)));
    for (i, (label, raw)) in QUICK.into_iter().enumerate() {
        let a = -90.0 + 45.0 * i as f32;
        p.line_segment([point(c, a, 36.0), point(c, a, 42.0)], Stroke::new(1.3, rgba(0xE8E4DCA8)));
        let at = point(c, a, if i % 4 == 0 { 70.0 } else { 58.0 });
        let al = match i {
            0 => Align2::RIGHT_CENTER,
            4 => Align2::LEFT_CENTER,
            1 => Align2::RIGHT_BOTTOM,
            3 => Align2::LEFT_BOTTOM,
            _ => Align2::CENTER_BOTTOM,
        };
        let at = match i {
            0 => at + vec2(14.0, 0.0),
            4 => at - vec2(14.0, 0.0),
            _ => at,
        };
        let sel = pos == Some(i);
        let r = if sel { vfd(p, at, al, label, F::Silk, 9.0) } else { silk(p, at, al, label, F::Silk, 9.0, rgba(0xE8E4DCC8)) };
        let resp = ui.interact(r.expand(4.0), Id::unique(("quick", i)), Sense::click());
        if resp.clicked() && enabled {
            app.set(ty, raw);
        }
    }
    // the selector knob: 5 detents
    let kb = 74.0;
    let (new, resp) = {
        let o2 = c - vec2(kb / 2.0, kb / 2.0);
        // a 7-step knob (45° apart): detent i is step i + 1, −90° … +90°; step 0 = a model off the panel
        let idx = pos.map_or(0, |i| i + 1);
        let r = knob(ui, o2, Id::unique("amp-type"), Size::M, idx, 7, None, enabled);
        (r.0.map(|n| n.clamp(1, 5) - 1), r.1)
    };
    let _ = resp;
    if let Some(i) = new.filter(|&i| Some(i) != pos) {
        app.set(ty, QUICK[i].1);
    }
    let p = ui.painter();
    silk(p, pos2(c.x, c.y + 50.0), Align2::CENTER_CENTER, "TYPE", F::Silk2, 9.0, SILK2);
    // stepper: all 26 models
    let models: Vec<String> = ty.options.iter().map(|o| o.1.clone()).collect();
    let mi = cur.and_then(|c| ty.options.iter().position(|o| o.0 == c));
    let label = mi.map_or("—".into(), |i| format!("{:02} {}", ty.options[i].0, models[i].to_uppercase()));
    let sr = Rect::from_min_size(pos2(o.x + 6.0, c.y + 66.0), vec2(w - 12.0, 24.0));
    let (step, open) = stepper(ui, sr, Id::unique("model-stepper"), &label);
    if enabled {
        if step != 0 {
            let i = (mi.unwrap_or(0) as i32 + step).clamp(0, models.len() as i32 - 1) as usize;
            app.set(ty, ty.options[i].0);
        }
        if open {
            app.ed.models_open = !app.ed.models_open;
        }
    }
    silk(ui.painter(), pos2(c.x, sr.bottom() + 14.0), Align2::CENTER_CENTER, "26 MODELS · CLICK FOR THE LIST", F::Silk2, 8.5, SILK3);
    if app.ed.models_open {
        match option_popup(ui, Id::unique("models-popup"), sr, &models, mi, 210.0) {
            Some(Some(i)) => {
                app.set(ty, ty.options[i].0);
                app.ed.models_open = false;
            }
            Some(None) => app.ed.models_open = false,
            None => {}
        }
    }
}

fn response_unit(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let h = 252.0;
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 4);
    let fw = face.width();
    let left_w = (fw * 0.52).floor();
    let p = ui.painter();
    let ly = face.top() + 22.0;
    let live = response_live(app);
    let tr = silk(p, pos2(face.left() + 20.0, ly), Align2::LEFT_CENTER, "RESPONSE", F::Silk, 11.0, SILK);
    led_dot(p, pos2(tr.right() + 16.0, ly), 5.0, live);
    let lr = silk(p, pos2(tr.right() + 25.0, ly), Align2::LEFT_CENTER, if live { "EQ LIVE" } else { "EQ OFF" }, F::Silk2, 9.0, SILK2);
    let mx = face.left() + left_w + 20.0;
    rule(p, lr.right() + 14.0, mx - 30.0, ly);
    groove(p, mx - 10.0, face.top() + 14.0, face.bottom() - 14.0);
    header_right(p, face, ly, "MASTER EQ · PATCH", 4, mx);

    // graph + source keys
    let gx0 = face.left() + 20.0;
    let gr = Rect::from_min_max(pos2(gx0, face.top() + 40.0), pos2(face.left() + left_w - 92.0, face.top() + 196.0));
    let mut band = app.ed.band;
    graph::graph(app, ui, gr, app.ed.src, &mut band);
    app.ed.band = band;
    let kx = gr.right() + 22.0;
    for (i, (label, src)) in [("EQ", Src::Eq), ("MASTER", Src::Master), ("BOTH", Src::Both)].into_iter().enumerate() {
        let kr = Rect::from_min_size(pos2(kx, gr.top() + 4.0 + i as f32 * 32.0), vec2(62.0, 24.0));
        let on = app.ed.src == src;
        led_rect(ui.painter(), Rect::from_center_size(pos2(kx - 10.0, kr.center().y), vec2(4.0, 12.0)), 1.0, on);
        if key(ui, kr, Id::unique(("src", i)), label, on, None).clicked() {
            app.ed.src = src;
            app.ed.band = 0;
        }
    }
    silk(ui.painter(), pos2(kx, gr.top() + 112.0), Align2::LEFT_CENTER, "4 DB / DIV", F::Silk2, 9.0, SILK2);
    silk(ui.painter(), pos2(kx, gr.top() + 128.0), Align2::LEFT_CENTER, "SCROLL = Q", F::Silk2, 9.0, SILK3);

    // band keys + readout
    if let Some(eq) = graph::active(app, app.ed.src) {
        let names: Vec<&str> = eq.bands.iter().map(|b| b.name).collect();
        let by = gr.bottom() + 16.0;
        let mut bx = gx0;
        let small = names.len() > 6;
        for (i, n) in names.iter().enumerate() {
            let label = match *n {
                "LOW CUT" => "LO CUT",
                "HIGH CUT" => "HI CUT",
                other => other,
            };
            let bw = text_w(ui.painter(), label, F::Silk2, 8.5) + if small { 14.0 } else { 20.0 };
            let kr = Rect::from_min_size(pos2(bx, by), vec2(bw, 22.0));
            let on = app.ed.band == i;
            if key(ui, kr, Id::unique(("band", i)), label, on, Some(on)).clicked() {
                app.ed.band = i;
            }
            bx += bw + 6.0;
        }
        let ro = graph::readout(app, app.ed.src, app.ed.band);
        let rw = (text_w(ui.painter(), &ro, F::Mono, 12.0) + 28.0).max(150.0);
        let rr = Rect::from_min_size(pos2((gr.right() - rw).max(bx + 10.0), by - 3.0), vec2(rw, 28.0));
        let g = glass(ui, rr);
        vfd(ui.painter(), pos2(g.right() - 10.0, g.center().y), Align2::RIGHT_CENTER, &ro, F::Mono, 12.0);
    }

    // master EQ faders
    let faders = [
        ("LOW", "MASTER EQ: LOW GAIN"),
        ("MID F", "MASTER EQ: MID FREQ"),
        ("MID Q", "MASTER EQ: MID Q"),
        ("MID", "MASTER EQ: MID GAIN"),
        ("HIGH", "MASTER EQ: HIGH GAIN"),
    ];
    let meter_w = 236.0;
    let fx1 = face.right() - 20.0 - meter_w - 24.0;
    let fstep = ((fx1 - mx) / faders.len() as f32).min(66.0);
    for (i, (label, pn)) in faders.into_iter().enumerate() {
        let p = app.param(pn);
        let cx = mx + fstep * (i as f32 + 0.5);
        let fr = Rect::from_center_size(pos2(cx, face.top() + 124.0), vec2(44.0, 132.0));
        let (idx, n, mem) = steps(app, p);
        if let Some(i) = fader(ui, fr, Id::unique(("fader", p.addr)), idx, n, mem) {
            set_step(app, p, i);
        }
        let pp = ui.painter();
        let v = app.raw(p).map_or("—".into(), |r| match p.display(r) {
            serde_json::Value::String(s) => s,
            v if p.options.is_empty() && p.min < 0 => format!("{:+}dB", v.as_f64().unwrap_or(0.0)).replace('-', "−"),
            v => v.to_string(),
        });
        let ed = app.edited(p);
        if ed {
            vfd(pp, pos2(cx, face.top() + 50.0), Align2::CENTER_CENTER, &v, F::Mono, 9.5);
        } else {
            text(pp, pos2(cx, face.top() + 50.0), Align2::CENTER_CENTER, &v, F::Mono, 9.5, SILK2);
        }
        silk(pp, pos2(cx, face.top() + 204.0), Align2::CENTER_CENTER, label, F::Silk2, 9.0, SILK2);
    }
    // USB out meter + what stays on the amp
    let vr = Rect::from_min_size(pos2(face.right() - 20.0 - meter_w, face.top() + 40.0), vec2(meter_w, 136.0));
    let lvl = app.level[0].max(app.level[1]);
    // dBFS −40…0 over the scale
    let frac = if lvl > 0.0 { ((20.0 * lvl.log10() + 40.0) / 40.0).clamp(0.0, 1.05) } else { 0.0 };
    let sub = if app.demo || app.meter_err.is_none() && app.online() { "USB OUT · dBFS" } else { "NO USB AUDIO" };
    vu(ui.painter(), vr, frac, "LEVEL", sub);
    let pp = ui.painter();
    let ry = vr.bottom() + 24.0;
    silk(pp, pos2(vr.left() + 4.0, ry), Align2::LEFT_CENTER, "MASTER · POWER", F::Silk2, 9.0, SILK2);
    silk(pp, pos2(vr.right(), ry), Align2::RIGHT_CENTER, "SET ON THE AMP", F::Silk2, 9.0, SILK3);
    let resp = ui.interact(Rect::from_min_size(pos2(vr.left(), ry - 8.0), vec2(vr.width(), 16.0)), Id::unique("onamp"), Sense::hover());
    resp.on_hover_text("MASTER and POWER CONTROL live on the amp's own panel: the editor can't read or change them. The meter shows the USB audio send (where the USB block sits in the chain), not the speaker volume.");
    h
}

fn header_right(p: &eframe::egui::Painter, face: Rect, y: f32, title: &str, num: usize, x0: f32) {
    let s = format!("{num:02}");
    let w = text_w(p, &s, F::Mono, 9.0) + 12.0;
    let b = Rect::from_min_size(pos2(face.right() - 20.0 - w, y - 7.0), vec2(w, 14.0));
    rrect_stroke(p, b, 2.0, rgba(0xE8E4DC55));
    text(p, b.center(), Align2::CENTER_CENTER, &s, F::Mono, 9.0, SILK2);
    let t = silk(p, pos2(b.left() - 12.0, y), Align2::RIGHT_CENTER, title, F::Silk, 11.0, SILK);
    rule(p, x0 + 10.0, t.left() - 12.0, y);
}

fn response_live(app: &App) -> bool {
    katana::response::eq(app.cat, &app.mem).is_some_and(|e| e.on)
}
