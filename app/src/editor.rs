//! 01 EDITOR: channels and tone library | patch label, actions, AMP panel | device and read-only panels.

use eframe::egui::{pos2, vec2, Align2, Id, Pos2, Rect, Stroke, Ui};
use katana::catalog::Param;

use crate::theme::*;
use crate::widgets::*;
use crate::worker::{Cmd, Link};
use crate::{channel_label, App, CHANNELS};

#[derive(Default)]
pub struct State {
    models_open: bool,
    search: String,
}

const MODEL_TILE: f32 = 190.0; // wide enough for "DELUXE CRUNCH"

/// The panel's 5 amp types and the GT models they select (notes/07).
const QUICK: [(&str, u32); 5] = [("ACOUSTIC", 1), ("CLEAN", 8), ("CRUNCH", 11), ("LEAD", 24), ("BROWN", 23)];

pub fn show(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let (left_w, gap) = (250.0, 16.0);
    let right_w = if w >= 1400.0 { 280.0 } else { 250.0 }; // room for the knobs at the minimum window width
    let x0 = o.x + 16.0;
    let center_w = w - 32.0 - left_w - right_w - 2.0 * gap;
    let y = o.y + 16.0;
    let h1 = left(app, ui, pos2(x0, y), left_w);
    let h2 = center(app, ui, pos2(x0 + left_w + gap, y), center_w);
    let h3 = right(app, ui, pos2(x0 + left_w + gap + center_w + gap, y), right_w);
    h1.max(h2).max(h3) + 32.0
}

// --- left: channels and library ---------------------------------------------------------------------------------

fn left(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let ch_h = 31.0 + 20.0 + 5.0 * 48.0 + 2.0 * 22.0 + 6.0 * 6.0 + 1.0;
    let r = Rect::from_min_size(o, vec2(w, ch_h));
    let body = panel(ui.painter(), r, 16.0, "CHANNELS", 40.0, "", "05");
    let mut y = body.top() + 10.0;
    let (x0, x1) = (body.left() + 10.0, body.right() - 10.0);
    for (i, (slot, label, pip)) in CHANNELS.into_iter().enumerate() {
        if i == 1 || i == 3 {
            bracket(ui.painter(), x0 + 2.0, x1 - 2.0, y + 8.0, if i == 1 { "BANK A" } else { "BANK B" }, LINE);
            y += 22.0 + 6.0;
        }
        let row = Rect::from_min_size(pos2(x0, y), vec2(x1 - x0, 48.0));
        let stored = app.stored.get(&slot);
        let name = stored.and_then(App::patch_name).unwrap_or_else(|| "—".into());
        let amp = stored.and_then(|m| app.param("PREAMP A: TYPE").raw(m)).map(|r| app.param("PREAMP A: TYPE").display(r));
        let amp = amp.and_then(|v| v.as_str().map(str::to_uppercase)).unwrap_or_default();
        if channel_row(ui, row, Id::unique(("ch", slot)), &name, &amp, label, pip, app.current == Some(slot)) && app.online() {
            app.send(Cmd::Select(slot));
        }
        y += 48.0 + 6.0;
    }

    // library
    let q = app.ed.search.to_lowercase();
    let shown: Vec<usize> = (0..app.tones.len())
        .filter(|&i| q.is_empty() || tone_tags(&app.tones[i].1).to_lowercase().contains(&q) || app.tones[i].1.name.to_lowercase().contains(&q))
        .collect();
    let lib_h = 31.0 + 10.0 + 16.0 + 44.0 + 10.0 + (shown.len().max(1) as f32) * 44.0 + 1.0 + 10.0 + 44.0 + 10.0 + 1.0;
    let r = Rect::from_min_size(pos2(o.x, o.y + ch_h + 16.0), vec2(w, lib_h));
    let meta = format!("{:02} TONES", app.tones.len());
    let body = panel(ui.painter(), r, 16.0, "LIBRARY", 0.0, "", &meta);
    let mut y = body.top() + 10.0;
    text(ui.painter(), pos2(x0, y), Align2::LEFT_TOP, "SEARCH", F::Mono, 10.0, TEXT_3);
    y += 16.0;
    let field = Rect::from_min_size(pos2(x0, y), vec2(x1 - x0, 44.0));
    text_field(ui, field, &mut app.ed.search, "NAME / AMP / FX", 12.0);
    y += 44.0 + 10.0;
    if shown.is_empty() {
        let msg = if app.tones.is_empty() { "NO TONES · DROP .JSON FILES HERE" } else { "NO MATCH" };
        text(ui.painter(), pos2(x0 + 2.0, y + 22.0), Align2::LEFT_CENTER, msg, F::Mono, 10.0, TEXT_3);
        hline(ui.painter(), x0, x1, y, LINE);
        y += 44.0;
    }
    let mut apply = None;
    for &i in &shown {
        let row = Rect::from_min_size(pos2(x0, y), vec2(x1 - x0, 44.0));
        let resp = ui.interact(row, Id::unique(("tone", i)), eframe::egui::Sense::click());
        let p = ui.painter();
        if resp.hovered() {
            p.rect_filled(row, 0.0, RAISED);
        }
        hline(p, x0, x1, y, LINE);
        let tags = tone_tags(&app.tones[i].1);
        let tr = text(p, pos2(x1 - 2.0, row.center().y), Align2::RIGHT_CENTER, &tags, F::Mono, 10.0, TEXT_3);
        let max = tr.left() - x0 - 12.0;
        text_max(p, pos2(x0 + 2.0, row.center().y), Align2::LEFT_CENTER, &app.tones[i].1.name.to_uppercase(), F::Mono, 12.0, INK, max);
        if resp.has_focus() {
            focus_ring(p, row, 0.0);
        }
        if resp.clicked() {
            apply = Some(i);
        }
        y += 44.0;
    }
    hline(ui.painter(), x0, x1, y, LINE);
    if let Some(i) = apply {
        app.apply_tone(i);
    }
    y += 1.0 + 10.0;
    let bw = (x1 - x0 - 6.0) / 2.0;
    if button(ui, Rect::from_min_size(pos2(x0, y), vec2(bw, 44.0)), Id::unique("import"), "IMPORT").clicked() {
        app.say("DROP .JSON TONE FILES ONTO THE WINDOW".into());
    }
    let nr = Rect::from_min_size(pos2(x0 + bw + 6.0, y), vec2(bw, 44.0));
    if app.loaded {
        if tile_primary(ui, nr, "+ NEW").clicked() {
            app.save_tone();
        }
    } else {
        disabled_button(ui, nr, "+ NEW");
    }
    ch_h + 16.0 + lib_h
}

fn tile_primary(ui: &Ui, r: Rect, label: &str) -> eframe::egui::Response {
    let resp = ui.interact(r, Id::unique(label), eframe::egui::Sense::click());
    let p = ui.painter();
    cut_fill(p, r, 8.0, INK);
    text(p, r.center(), Align2::CENTER_CENTER, label, F::Exp, 11.0, INK_ON);
    if resp.has_focus() {
        focus_ring(p, r, 8.0);
    }
    resp
}

/// Which blocks a tone switches on, for the library list ("DLY · REV").
fn tone_tags(t: &katana::Tone) -> String {
    const TAGS: [(&str, &str); 6] =
        [("OD/DS", "BOOST"), ("FX1", "MOD"), ("FX2", "FX"), ("DELAY", "DLY"), ("REVERB", "REV"), ("PEDAL FX", "PDL")];
    let on = |b: &str| t.params.get(&format!("{b}: ON/OFF")).is_some_and(|v| v == "ON" || v == 1);
    let tags: Vec<&str> = TAGS.iter().filter(|(b, _)| on(b)).map(|(_, s)| *s).collect();
    if tags.is_empty() { "DRY".into() } else { tags.join(" · ") }
}

#[allow(clippy::too_many_arguments)]
fn channel_row(ui: &Ui, r: Rect, id: Id, name: &str, amp: &str, label: &str, pip: eframe::egui::Color32, on: bool) -> bool {
    let resp = ui.interact(r, id, eframe::egui::Sense::click());
    let p = ui.painter();
    if on {
        cut_fill(p, r, 10.0, INK);
    } else {
        if resp.hovered() {
            cut_fill(p, r, 10.0, RAISED);
        }
        cut_outline(p, r, 10.0, LINE);
    }
    let (fg, sub) = if on { (INK_ON, INK_SUB) } else { (INK, TEXT_3) };
    p.rect_filled(Rect::from_min_size(pos2(r.left() + 10.0, r.center().y - 14.0), vec2(4.0, 28.0)), 0.0, pip);
    let lr = text(p, pos2(r.right() - 16.0, r.center().y), Align2::RIGHT_CENTER, label, F::Mono, 10.0, fg);
    let tx = r.left() + 24.0;
    let max = lr.left() - tx - 10.0;
    text_max(p, pos2(tx, r.center().y - 9.0), Align2::LEFT_CENTER, &name.to_uppercase(), F::Semi, 13.0, fg, max);
    text_max(p, pos2(tx, r.center().y + 9.0), Align2::LEFT_CENTER, amp, F::Mono, 10.0, sub, max);
    if resp.has_focus() {
        focus_ring(p, r, 10.0);
    }
    resp.clicked()
}

// --- centre: patch label, actions, amp ---------------------------------------------------------------------------

fn center(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let p = ui.painter();
    let (x0, x1) = (o.x, o.x + w);
    let mut y = o.y;
    let ch = channel_label(app.current);
    let name = App::patch_name(&app.mem).filter(|n| !n.is_empty()).unwrap_or_else(|| "No amp".into());
    let ty = app.param("PREAMP A: TYPE");
    let model = app.shown(ty);

    // patch label
    hline(p, x0, x1, y, INK);
    y += 1.0;
    text(p, pos2(x0, y + 10.0), Align2::LEFT_TOP, "PATCH", F::Mono, 11.0, INK);
    text(p, pos2(x0, y + 25.0), Align2::LEFT_TOP, &format!("ID  KT50-{}", ch.replace(':', "")), F::Mono, 11.0, INK);
    barcode(p, pos2(x1 - 75.0, y + 12.0));
    y += 50.0;
    hline(p, x0, x1, y, EDGE);
    y += 1.0;
    let half = (w - 20.0) / 2.0;
    stripes(p, Rect::from_min_size(pos2(x0, y + 12.0), vec2(half, 76.0)), &STRIPES, 3.0);
    let tx = x0 + half + 20.0;
    let status = if !app.online() {
        "AMP NOT CONNECTED.\nPLUG IN THE KATANA OVER USB\nAND CLOSE TONE STUDIO."
    } else {
        "LIVE BUFFER / SYNCED TO AMP.\nEDITS STAY TEMPORARY UNTIL\nWRITTEN TO THE CHANNEL."
    };
    para(p, pos2(tx, y + 12.0), status, 11.0, INK, half, 17.0);
    icons(p, pos2(tx, y + 64.0));
    y += 100.0;
    hline(p, x0, x1, y, EDGE);
    y += 1.0;
    text_max(p, pos2(x0, y + 14.0), Align2::LEFT_TOP, &name, F::Display, 64.0, INK, w);
    y += 14.0 + 62.0;
    text(p, pos2(x0, y + 4.0), Align2::LEFT_TOP, &format!("CHANNEL / {ch}"), F::Mono, 18.0, INK);
    text(p, pos2(x1, y + 4.0), Align2::RIGHT_TOP, &format!("AMP / {model}"), F::Mono, 18.0, INK);
    y += 4.0 + 24.0 + 12.0;
    hline(p, x0, x1, y, INK);
    y += 1.0 + 16.0;

    // action strip
    let r = Rect::from_min_size(pos2(x0, y), vec2(w, 60.0));
    p.rect_filled(r, 0.0, PANEL);
    p.rect_stroke(r, 0.0, Stroke::new(1.0, LINE), eframe::egui::StrokeKind::Inside);
    let unsaved = app.unsaved();
    let (state, c) = if !app.online() {
        ("OFFLINE", TEXT_3)
    } else if !app.loaded {
        ("LOADING", MUSTARD)
    } else if unsaved {
        ("UNSAVED EDITS", ACCENT)
    } else {
        ("IN SYNC", SAGE)
    };
    dot(p, pos2(x0 + 17.5, r.center().y), 7.0, c);
    let sr = text(p, pos2(x0 + 28.0, r.center().y), Align2::LEFT_CENTER, state, F::Mono, 11.0, INK);
    if unsaved {
        text(p, pos2(sr.right() + 14.0, r.center().y), Align2::LEFT_CENTER, &format!("NOT YET WRITTEN TO {ch}"), F::Mono, 10.0, TEXT_3);
    }
    let wr = Rect::from_min_size(pos2(x1 - 8.0 - 190.0, y + 8.0), vec2(190.0, 44.0));
    let rr = Rect::from_min_size(pos2(wr.left() - 10.0 - 110.0, y + 8.0), vec2(110.0, 44.0));
    if unsaved {
        if button(ui, rr, Id::unique("revert"), "REVERT").clicked() {
            app.revert();
        }
    } else {
        disabled_button(ui, rr, "REVERT");
    }
    if app.online() && app.loaded {
        if primary(ui, wr, Id::unique("write"), "WRITE TO AMP", true).clicked() {
            app.write_to_amp();
        }
    } else {
        disabled_button(ui, wr, "WRITE TO AMP");
    }
    y += 60.0 + 16.0;

    y + amp_panel(app, ui, pos2(x0, y), w) - o.y
}

/// Outline icons beside the status text (decor).
fn icons(p: &eframe::egui::Painter, o: Pos2) {
    let s = Stroke::new(1.3, INK);
    let c = o + vec2(13.0, 13.0);
    p.circle_stroke(c, 9.5, s);
    let ell: Vec<Pos2> = (0..=24).map(|i| {
        let a = std::f32::consts::TAU * i as f32 / 24.0;
        c + vec2(4.0 * a.cos(), 9.5 * a.sin())
    }).collect();
    p.line(ell, s);
    p.line_segment([c - vec2(9.5, 0.0), c + vec2(9.5, 0.0)], s);
    let b = Rect::from_min_size(o + vec2(44.0, 3.0), vec2(18.0, 18.0));
    p.rect_stroke(b, 0.0, s, eframe::egui::StrokeKind::Inside);
    p.line(vec![b.min + vec2(4.5, 6.5), b.min + vec2(13.5, 6.5), b.min + vec2(11.0, 4.0)], s);
    p.line(vec![b.min + vec2(13.5, 11.5), b.min + vec2(4.5, 11.5), b.min + vec2(7.0, 14.0)], s);
    let e = o + vec2(98.0, 13.0);
    let ring: Vec<Pos2> = (0..=32).map(|i| {
        let a = std::f32::consts::TAU * i as f32 / 32.0;
        e + vec2(17.5 * a.cos(), 11.5 * a.sin())
    }).collect();
    p.line(ring, s);
    for dx in [-7.5, 0.0, 7.5] {
        p.circle_stroke(e + vec2(dx, 0.0), 3.5, s);
    }
}

fn amp_panel(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let ty = app.param("PREAMP A: TYPE");
    let models = ty.options.clone();
    let cur = app.raw(ty);
    let grid_h = if app.ed.models_open { 12.0 + grid_height(w - 34.0, models.len(), MODEL_TILE) } else { 0.0 };
    let h = 31.0 + 16.0 + 50.0 + grid_h + 12.0 + 44.0 + 20.0 + 152.0 + 16.0 + 1.0;
    let r = Rect::from_min_size(o, vec2(w, h));
    let body = panel(ui.painter(), r, 18.0, "AMP", 64.0, "", &format!("MODELS / {}", models.len()));
    let (x0, x1) = (body.left() + 16.0, body.right() - 16.0);
    let mut y = body.top() + 16.0;

    let pos = cur.and_then(|c| models.iter().position(|m| m.0 == c));
    let count = pos.map_or("—".into(), |i| format!("{:02} / {}", i + 1, models.len()));
    let dd = Rect::from_min_size(pos2(x0, y), vec2(x1 - x0, 50.0));
    if dropdown(ui, dd, Id::unique("model"), "MODEL", &app.shown(ty), &count, app.ed.models_open).clicked() {
        app.ed.models_open = !app.ed.models_open;
    }
    y += 50.0;
    if app.ed.models_open {
        let (gh, picked) = option_grid(ui, pos2(x0, y + 12.0), x1 - x0, Id::unique("models"), &models, cur, MODEL_TILE);
        if let Some(raw) = picked {
            app.set(ty, raw);
            app.ed.models_open = false;
        }
        y += 12.0 + gh;
    }
    y += 12.0;
    text(ui.painter(), pos2(x0, y + 22.0), Align2::LEFT_CENTER, "QUICK", F::Mono, 10.0, TEXT_3);
    let qx = x0 + 60.0;
    let qw = (x1 - qx - 4.0 * 6.0) / 5.0;
    for (i, (name, raw)) in QUICK.into_iter().enumerate() {
        let r = Rect::from_min_size(pos2(qx + i as f32 * (qw + 6.0), y), vec2(qw, 44.0));
        if tile(ui, r, Id::unique(("quick", i)), &format!("{:02}", i + 1), name, cur == Some(raw), 8.0, true).clicked() {
            app.set(ty, raw);
        }
    }
    y += 44.0 + 20.0;

    // knob groups: PREAMP | EQ / 3-BAND | POWER AMP. Each gets room for its knobs plus an equal share of the rest.
    type Group<'a> = (&'a str, &'a [(&'a str, &'a str)]);
    let groups: [Group; 3] = [
        ("PREAMP", &[("GAIN", "PREAMP A: GAIN"), ("VOLUME", "PREAMP A: LEVEL")]),
        ("EQ / 3-BAND", &[("BASS", "PREAMP A: BASS"), ("MIDDLE", "PREAMP A: MIDDLE"), ("TREBLE", "PREAMP A: TREBLE")]),
        ("POWER AMP", &[("PRESENCE", "PREAMP A: PRESENCE")]),
    ];
    let base = |n: usize, gi: usize| n as f32 * 112.0 + if gi == 1 { 36.0 } else { 18.0 };
    let need: f32 = groups.iter().enumerate().map(|(gi, g)| base(g.1.len(), gi)).sum();
    let extra = ((x1 - x0 - need) / 3.0).max(0.0);
    let mut gx = x0;
    for (gi, (label, knobs)) in groups.into_iter().enumerate() {
        let gw = base(knobs.len(), gi) + extra;
        let (l, r) = (gx + if gi > 0 { 18.0 } else { 0.0 }, gx + gw - if gi < 2 { 18.0 } else { 0.0 });
        if gi > 0 {
            vline(ui.painter(), gx, y, y + 152.0, LINE);
        }
        bracket(ui.painter(), l, r, y, label, EDGE);
        let n = knobs.len() as f32;
        let space = (r - l - n * 104.0) / n;
        for (ki, (kname, pname)) in knobs.iter().enumerate() {
            let kx = l + space / 2.0 + ki as f32 * (104.0 + space);
            knob_param(app, ui, pos2(kx, y + 24.0), kname, app.param(pname));
        }
        gx += gw;
    }
    h
}

fn knob_param(app: &mut App, ui: &Ui, at: Pos2, name: &str, p: &'static Param) {
    let (lo, hi) = p.raw_range();
    let raw = app.raw(p).unwrap_or(lo);
    let value = app.raw(p).map_or("—".into(), |r| format!("{:03}", p.number(r) as i64));
    if let Some(i) = knob(ui, at, Id::unique(("knob", p.addr)), name, &value, (raw - lo) as usize, (hi - lo + 1) as usize) {
        app.set(p, lo + i as u32);
    }
}

pub fn grid_height(w: f32, n: usize, min_w: f32) -> f32 {
    let cols = (((w - 20.0 + 4.0) / (min_w + 4.0)).floor() as usize).max(1);
    let rows = n.div_ceil(cols);
    20.0 + rows as f32 * 44.0 + rows.saturating_sub(1) as f32 * 4.0
}

// --- right: device ---------------------------------------------------------------------------------------------

fn right(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let p = ui.painter();
    let (meta, conn) = match &app.link {
        Link::Online { .. } => ("ONLINE", "CONNECTED"),
        Link::Searching(_) => ("SEARCHING", "NOT FOUND"),
    };
    let dev = match &app.link {
        Link::Online { dev } => format!("{dev:02X}H"),
        Link::Searching(_) => "—".into(),
    };
    let rows = [
        ("CONNECTION", "USB-MIDI".to_string()),
        ("DEVICE ID", dev),
        ("CHANNEL", channel_label(app.current).to_string()),
        ("BUFFER", if app.loaded { "SYNCED".into() } else { "—".into() }),
    ];
    let h = 31.0 + 140.0 + rows.len() as f32 * 27.0 + 13.0;
    let r = Rect::from_min_size(o, vec2(w, h));
    let body = panel(p, r, 16.0, "DEVICE", 40.0, "", meta);
    let rr = (w * 0.2).min(56.0); // radar radius: smaller in the narrow layout
    let rc = pos2(body.left() + 14.0 + rr, body.top() + 14.0 + 56.0);
    radar(p, rc, rr + 4.0, 0.87);
    let tx = rc.x + rr + 16.0;
    text(p, pos2(tx, rc.y - 18.0), Align2::LEFT_CENTER, "KATANA", F::Exp, 20.0, INK);
    text(p, pos2(tx, rc.y + 2.0), Align2::LEFT_CENTER, "50 / MK1", F::Mono, 12.0, INK);
    text(p, pos2(tx, rc.y + 18.0), Align2::LEFT_CENTER, conn, F::Mono, 10.0, TEXT_3);
    let mut y = body.top() + 140.0;
    for (i, (k, v)) in rows.iter().enumerate() {
        hline(p, body.left() + 14.0, body.right() - 14.0, y, LINE);
        text(p, pos2(body.left() + 14.0, y + 13.5), Align2::LEFT_CENTER, k, F::Mono, 11.0, TEXT_3);
        text(p, pos2(body.right() - 14.0, y + 13.5), Align2::RIGHT_CENTER, v, F::Mono, 11.0, INK);
        y += 27.0;
        if i == rows.len() - 1 {
            hline(p, body.left() + 14.0, body.right() - 14.0, y, LINE);
        }
    }

    // read-only: set on the amp's own panel
    let y = o.y + h + 16.0;
    let r = Rect::from_min_size(pos2(o.x, y), vec2(w, 0.0)); // height known once the note is laid out
    lock_icon(p, pos2(r.left() + 16.0, y + 15.0), TEXT_2);
    let t = text(p, pos2(r.left() + 28.0, y + 15.0), Align2::LEFT_CENTER, "ON THE AMP", F::Exp, 12.0, TEXT_2);
    let hdr = Rect::from_min_max(r.min, pos2(t.right() + 12.0, y + 30.0));
    p.extend(eframe::egui::Shape::dashed_line(&[hdr.right_top(), hdr.right_bottom()], Stroke::new(1.0, EDGE), 4.0, 3.0));
    p.extend(eframe::egui::Shape::dashed_line(&[pos2(r.left(), y + 30.5), pos2(r.right(), y + 30.5)], Stroke::new(1.0, EDGE), 4.0, 3.0));
    text(p, pos2(r.right() - 12.0, y + 15.0), Align2::RIGHT_CENTER, "READ-ONLY", F::Mono, 10.0, TEXT_3);
    let mut ry = y + 36.0;
    for (i, k) in ["POWER CONTROL", "MASTER"].into_iter().enumerate() {
        text(p, pos2(r.left() + 14.0, ry + 14.5), Align2::LEFT_CENTER, k, F::Mono, 11.0, TEXT_2);
        text(p, pos2(r.right() - 14.0, ry + 14.5), Align2::RIGHT_CENTER, "SET ON AMP", F::Mono, 11.0, TEXT_3);
        ry += 29.0;
        if i == 0 {
            p.extend(eframe::egui::Shape::dashed_line(&[pos2(r.left() + 14.0, ry), pos2(r.right() - 14.0, ry)], Stroke::new(1.0, LINE), 4.0, 3.0));
        }
    }
    let note = "These live on the amp's own panel. The editor can't read or change them.";
    let th = para(p, pos2(r.left() + 14.0, ry + 4.0), note, 10.0, TEXT_3, w - 28.0, 16.0);
    let rh = ry + 4.0 + th + 14.0 - y;
    dashed_rect(p, Rect::from_min_size(r.min, vec2(w, rh)), EDGE);
    h + 16.0 + rh
}
