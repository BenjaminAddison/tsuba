//! LIBRARY: the tone files in tones/ (find, filter by amp voicing, preview, apply, copy, delete under a cover),
//! saving the edit buffer as a tone, and backups of all five channels.

use std::collections::BTreeMap;
use std::path::PathBuf;
use std::time::{SystemTime, UNIX_EPOCH};

use eframe::egui::{pos2, vec2, Align2, Id, Key, Pos2, Rect, Stroke, Ui};
use katana::{Memory, Tone};
use serde_json::Value;

use crate::chain;
use crate::theme::*;
use crate::widgets::*;
use crate::{channel_label, store, App, CHANNELS, GAP};

#[derive(Default)]
pub struct State {
    query: String,
    filter: usize,
    pub sel: Option<usize>,
    backup: Option<Option<(PathBuf, BTreeMap<String, Tone>)>>,
}

const FILTERS: [&str; 7] = ["ALL", "CLEAN", "CRUNCH", "LEAD", "BROWN", "ACOUSTIC", "OTHER"];

/// The panel voicing a GT model sits closest to.
fn voicing(model: &str) -> usize {
    match model.to_uppercase().as_str() {
        "NATURAL CLEAN" | "JC-120" | "CLEAN TWIN" => 1,
        "COMBO CRUNCH" | "STACK CRUNCH" | "PRO CRUNCH" | "TWEED" | "DELUXE CRUNCH" | "VO DRIVE" | "MATCH DRIVE" | "BG DRIVE" | "MS1959 I" | "MS1959 I+II" => 2,
        "HIGAIN STACK" | "POWER DRIVE" | "EXTREME LEAD" | "CORE METAL" | "VO LEAD" | "BG LEAD" | "R-FIER VINTAGE" | "R-FIER MODERN" | "T-AMP LEAD" | "5150 DRIVE" => 3,
        "SLDN" => 4,
        "FULL RANGE" => 5,
        _ => 6,
    }
}

fn amp_of(app: &App, t: &Tone) -> String {
    let p = app.param("PREAMP A: TYPE");
    match t.params.get(&p.name) {
        Some(Value::String(s)) => s.to_uppercase(),
        Some(Value::Number(n)) => n.as_u64().and_then(|n| p.options.iter().find(|o| o.0 as u64 == n)).map_or(n.to_string(), |o| o.1.to_uppercase()),
        _ => "—".into(),
    }
}

/// The blocks the preview's chain row shows, with their effects-map keys.
const ROW: [(&str, &str); 12] = [
    ("PDL", "PEDAL_FX"), ("OD", "ODDS"), ("FX1", "FX1"), ("AMP", "PREAMP_A"), ("NS1", "NS1"), ("EQ", "EQ"),
    ("FX2", "FX2"), ("DLY1", "DELAY"), ("DLY2", "DELAY2"), ("REV", "REVERB"), ("S/R", "SEND_RETURN"), ("NS2", "NS2"),
];

fn block_on(app: &App, t: &Tone, key: &str) -> bool {
    if key == "PREAMP_A" {
        return true;
    }
    let Some(p) = chain::switch_param(app, key) else { return false };
    t.params.get(&p.name).is_some_and(|v| v == "ON" || v == 1)
}

fn num(t: &Tone, name: &str) -> Option<f64> {
    t.params.get(name).and_then(Value::as_f64)
}

fn age(path: &PathBuf) -> (u64, String) {
    let secs = std::fs::metadata(path).and_then(|m| m.modified()).ok().and_then(|t| t.duration_since(UNIX_EPOCH).ok()).map_or(0, |d| d.as_secs());
    let now = SystemTime::now().duration_since(UNIX_EPOCH).map_or(0, |d| d.as_secs());
    let d = now.saturating_sub(secs);
    let s = match d / 86400 {
        _ if secs == 0 => "—".into(),
        0 if d < 3600 => format!("{} MIN AGO", (d / 60).max(1)),
        0 => format!("{} H AGO", d / 3600),
        1 => "YESTERDAY".into(),
        n if n < 14 => format!("{n} DAYS AGO"),
        n => format!("{} WK AGO", n / 7),
    };
    (secs, s)
}

pub fn show(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let mut y = o.y;
    y += tones_unit(app, ui, pos2(o.x, y), w) + GAP;
    y += librarian_unit(app, ui, pos2(o.x, y), w) + GAP;
    y += backup_unit(app, ui, pos2(o.x, y), w);
    y - o.y
}

fn shown(app: &App) -> Vec<usize> {
    let q = app.lib.query.trim().to_lowercase();
    (0..app.tones.len())
        .filter(|&i| {
            let t = &app.tones[i].1;
            let amp = amp_of(app, t);
            (q.is_empty() || t.name.to_lowercase().contains(&q) || amp.to_lowercase().contains(&q) || t.description.to_lowercase().contains(&q))
                && (app.lib.filter == 0 || voicing(&amp) == app.lib.filter)
        })
        .collect()
}

fn tones_unit(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let h = 70.0;
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 1);
    let cy = face.center().y;
    let x0 = face.left() + 20.0;
    silk(ui.painter(), pos2(x0, cy), Align2::LEFT_CENTER, "TONES", F::Silk, 11.0, SILK);
    let fr = Rect::from_min_size(pos2(x0 + 76.0, cy - 15.0), vec2(280.0, 30.0));
    vfd_field(ui, fr, &mut app.lib.query, "name, amp or note", "FIND ▸", 11.0);
    let mut x = fr.right() + 22.0;
    let counts: Vec<usize> = (0..FILTERS.len())
        .map(|f| if f == 0 { app.tones.len() } else { app.tones.iter().filter(|t| voicing(&amp_of(app, &t.1)) == f).count() })
        .collect();
    for (i, f) in FILTERS.iter().enumerate() {
        if i > 0 && counts[i] == 0 {
            continue;
        }
        let label = format!("{f} {}", counts[i]);
        let kw = text_w(ui.painter(), &label, F::Silk2, 8.5) + 20.0;
        let kr = Rect::from_min_size(pos2(x, cy - 11.0), vec2(kw, 22.0));
        let on = app.lib.filter == i;
        if key(ui, kr, Id::unique(("filter", i)), &label, on, Some(on)).clicked() {
            app.lib.filter = i;
        }
        x += kw + 6.0;
    }
    // right: folder, import, save
    let ch = channel_label(app.current);
    let save = format!("SAVE {ch} AS TONE");
    let sw = text_w(ui.painter(), &save, F::Silk2, 9.0) + 28.0;
    let sr = Rect::from_min_size(pos2(face.right() - 20.0 - sw, cy - 12.0), vec2(sw, 24.0));
    if app.loaded {
        if key(ui, sr, Id::unique("save-tone"), &save, false, None).on_hover_text("Save the edit buffer as a new tone file").clicked() {
            app.save_tone();
        }
    } else {
        key_off(ui, sr, &save);
    }
    let ir = Rect::from_min_size(pos2(sr.left() - 10.0 - 76.0, cy - 12.0), vec2(76.0, 24.0));
    if key(ui, ir, Id::unique("import"), "IMPORT", false, None).on_hover_text("Drop .json tone files onto the window").clicked() {
        app.say("DROP .JSON TONE FILES ONTO THE WINDOW".into());
    }
    let dr = Rect::from_min_size(pos2(ir.left() - 10.0 - 76.0, cy - 12.0), vec2(76.0, 24.0));
    if key(ui, dr, Id::unique("folder"), "FOLDER", false, None).on_hover_text("Open the tones folder").clicked() {
        open_folder(&App::tones_dir());
        app.load_tones();
    }
    h
}

fn open_folder(dir: &PathBuf) {
    let opener = if cfg!(windows) { "explorer" } else if cfg!(target_os = "macos") { "open" } else { "xdg-open" };
    let _ = std::process::Command::new(opener).arg(dir).spawn();
}

fn librarian_unit(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let list = shown(app);
    let rows_vis = list.len().clamp(10, 14);
    let h = 44.0 + 30.0 + rows_vis as f32 * 29.0 + 34.0 + 30.0;
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 2);
    let dir = App::tones_dir();
    let sub = format!("{} OF {} FILES · {}", list.len(), app.tones.len(), dir.display().to_string().to_uppercase());
    header(ui.painter(), face, face.top() + 22.0, "LIBRARIAN", &sub, "PREVIEW", 3);
    let x0 = face.left() + 20.0;
    let pw = 500.0;
    let tw = face.width() - 40.0 - pw - 36.0;
    let tr = Rect::from_min_size(pos2(x0, face.top() + 42.0), vec2(tw, h - 42.0 - 20.0));
    let g = glass(ui, tr);
    let cols = [28.0, (g.width() * 0.42).max(200.0), (g.width() * 0.66).max(330.0), g.width() - 120.0];
    let p = ui.painter();
    for (i, hname) in ["NAME", "AMP", "CHAIN", "MODIFIED"].iter().enumerate() {
        text(p, pos2(g.left() + cols[i], g.top() + 14.0), Align2::LEFT_CENTER, hname, F::MonoB, 8.5, mix(lit(), BLACK, 0.4));
    }
    if app.lib.sel.is_none_or(|s| !list.contains(&s)) {
        app.lib.sel = list.first().copied();
    }
    // keyboard: arrows select, Enter applies (when no text field has focus)
    let typing = ui.ctx().memory(|m| m.focused().is_some());
    if !typing && !app.pal.open {
        let pos = app.lib.sel.and_then(|s| list.iter().position(|&i| i == s));
        let (up, down, enter) = ui.input(|i| (i.key_pressed(Key::ArrowUp), i.key_pressed(Key::ArrowDown), i.key_pressed(Key::Enter)));
        if let Some(pos) = pos {
            if up && pos > 0 {
                app.lib.sel = Some(list[pos - 1]);
            }
            if down && pos + 1 < list.len() {
                app.lib.sel = Some(list[pos + 1]);
            }
            if enter {
                app.apply_tone(list[pos]);
            }
        }
    }
    let first = app.lib.sel.and_then(|s| list.iter().position(|&i| i == s)).map_or(0, |p| p.saturating_sub(rows_vis - 1));
    let mut apply = None;
    for (k, &i) in list.iter().skip(first).take(rows_vis).enumerate() {
        let row = Rect::from_min_size(pos2(g.left() + 2.0, g.top() + 28.0 + k as f32 * 29.0), vec2(g.width() - 4.0, 28.0));
        let s = app.lib.sel == Some(i);
        let resp = vfd_row(ui, row, Id::unique(("tone", i)), s);
        if resp.clicked() {
            app.lib.sel = Some(i);
        }
        if resp.double_clicked() {
            apply = Some(i);
        }
        let t = &app.tones[i].1;
        let p = ui.painter();
        let cy = row.center().y;
        if s {
            row_text(p, pos2(g.left() + 10.0, cy), Align2::LEFT_CENTER, "▸", 11.0, s, false, 14.0);
        }
        row_text(p, pos2(g.left() + cols[0], cy), Align2::LEFT_CENTER, &t.name.to_uppercase(), 12.0, s, false, cols[1] - cols[0] - 12.0);
        row_text(p, pos2(g.left() + cols[1], cy), Align2::LEFT_CENTER, &amp_of(app, t), 11.0, s, false, cols[2] - cols[1] - 12.0);
        for (b, (_, key)) in ROW.iter().enumerate() {
            let on = block_on(app, t, key);
            let d = Rect::from_center_size(pos2(g.left() + cols[2] + 4.0 + b as f32 * 10.0, cy), vec2(6.0, 6.0));
            if s {
                p.rect_filled(d, 1.0, if on { INV_TEXT } else { rgba(0x170D0230) });
            } else if on {
                glow(p, d, 1.0, 4.0, alpha(led(), 0.4));
                p.rect_filled(d, 1.0, lit());
            } else {
                p.rect_filled(d, 1.0, mix(rgba(0x0B0704FF), led(), 0.18));
            }
        }
        row_text(p, pos2(g.left() + cols[3], cy), Align2::LEFT_CENTER, &age(&app.tones[i].0).1, 10.5, s, true, 110.0);
    }
    if list.is_empty() {
        let msg = if app.tones.is_empty() { "NO TONES YET · DROP .JSON FILES ON THE WINDOW" } else { "NOTHING MATCHES" };
        vfd(ui.painter(), pos2(g.left() + 14.0, g.top() + 46.0), Align2::LEFT_CENTER, msg, F::Mono, 11.0);
    }
    let p = ui.painter();
    let fy = g.bottom() - 13.0;
    p.extend(eframe::egui::Shape::dashed_line(&[pos2(g.left() + 8.0, fy - 13.0), pos2(g.right() - 8.0, fy - 13.0)], Stroke::new(1.0, alpha(led(), 0.25)), 2.0, 3.0));
    vfd(p, pos2(g.left() + 12.0, fy), Align2::LEFT_CENTER, &format!("{} FILES", app.tones.len()), F::MonoB, 9.0);
    text(p, pos2(g.right() - 12.0, fy), Align2::RIGHT_CENTER, "↑↓ SELECT · ENTER OR DOUBLE-CLICK APPLIES", F::MonoB, 9.0, mix(lit(), BLACK, 0.35));
    if let Some(i) = apply {
        app.apply_tone(i);
    }

    // preview
    let px = tr.right() + 36.0;
    groove(ui.painter(), px - 18.0, face.top() + 42.0, face.bottom() - 20.0);
    if let Some(i) = app.lib.sel.filter(|&i| i < app.tones.len()) {
        preview(app, ui, Rect::from_min_max(pos2(px, face.top() + 42.0), pos2(face.right() - 20.0, face.bottom() - 20.0)), i);
    }
    h
}

fn preview(app: &mut App, ui: &mut Ui, r: Rect, i: usize) {
    let (path, t) = app.tones[i].clone();
    let nr = Rect::from_min_size(r.min, vec2(r.width().min(390.0), 56.0));
    let g = glass(ui, nr);
    vfd_max(ui.painter(), pos2(g.left() + 12.0, g.center().y), Align2::LEFT_CENTER, &t.name.to_uppercase(), F::Dot, 27.0, g.width() - 24.0);
    let p = ui.painter();
    let mut y = nr.bottom() + 20.0;
    let file = path.file_name().map_or(String::new(), |f| f.to_string_lossy().to_string());
    let amp = amp_of(app, &t);
    let model_i = app.param("PREAMP A: TYPE").options.iter().position(|o| o.1.eq_ignore_ascii_case(&amp));
    let rows = [
        ("FILE", file),
        ("NOTE", if t.description.is_empty() { "—".into() } else { t.description.clone() }),
        ("AMP", format!("{amp}{}", model_i.map_or(String::new(), |i| format!(" · MODEL {:02}", app.param("PREAMP A: TYPE").options[i].0)))),
        ("SAVED", age(&path).1),
    ];
    for (k, v) in rows {
        silk(p, pos2(r.left(), y), Align2::LEFT_CENTER, k, F::Silk2, 9.0, SILK2);
        text_max(p, pos2(r.left() + 80.0, y), Align2::LEFT_CENTER, &v, F::Mono, 10.5, SILK, r.width() - 80.0);
        y += 20.0;
    }
    y += 6.0;
    silk(p, pos2(r.left(), y), Align2::LEFT_CENTER, "CHAIN", F::Silk2, 9.0, SILK2);
    y += 18.0;
    let step = (r.width() / ROW.len() as f32).min(40.0);
    for (b, (label, key)) in ROW.iter().enumerate() {
        let cx = r.left() + step * (b as f32 + 0.5);
        let on = block_on(app, &t, key);
        led_bar(p, pos2(cx, y), on);
        text(p, pos2(cx, y + 13.0), Align2::CENTER_CENTER, label, F::Silk2, 7.5, if on { SILK } else { SILK3 });
    }
    y += 34.0;
    // preamp bars + EQ curve
    let bars = [("GAIN", "PREAMP A: GAIN"), ("VOLUME", "PREAMP A: LEVEL"), ("BASS", "PREAMP A: BASS"), ("MIDDLE", "PREAMP A: MIDDLE"), ("TREBLE", "PREAMP A: TREBLE"), ("PRESENCE", "PREAMP A: PRESENCE")];
    for (k, (label, name)) in bars.iter().enumerate() {
        let by = y + k as f32 * 20.0;
        let v = num(&t, name);
        silk(p, pos2(r.left(), by), Align2::LEFT_CENTER, label, F::Silk2, 8.5, SILK2);
        let n = (v.unwrap_or(0.0) / 100.0 * 14.0).round() as usize;
        segments(p, Rect::from_min_size(pos2(r.left() + 74.0, by - 3.5), vec2(140.0, 7.0)), 14, n.min(14), None);
        text(p, pos2(r.left() + 232.0, by), Align2::LEFT_CENTER, &v.map_or("—".into(), |v| format!("{v}")), F::Mono, 10.0, SILK2);
    }
    let er = Rect::from_min_max(pos2(r.left() + 262.0, y - 10.0), pos2(r.right(), y + 112.0));
    if er.width() > 120.0 {
        eq_preview(app, ui, er, &t);
    }
    // actions
    let ay = r.bottom() - 30.0;
    let ch = channel_label(app.current);
    let ar = Rect::from_min_size(pos2(r.left(), ay), vec2(130.0, 28.0));
    if app.online() && app.loaded {
        if key_cap(ui, ar, Id::unique("apply"), &format!("APPLY → {ch}"), false, None, Cap::Amber).on_hover_text("Load into the edit buffer (WRITE keeps it)").clicked() {
            app.apply_tone(i);
        }
    } else {
        key_off(ui, ar, "APPLY");
    }
    let cr = Rect::from_min_size(pos2(ar.right() + 10.0, ay), vec2(96.0, 28.0));
    if key(ui, cr, Id::unique("copy-json"), "COPY JSON", false, None).on_hover_text("Copy the tone file's text to share it").clicked() {
        ui.ctx().copy_text(serde_json::to_string_pretty(&t).unwrap_or_default());
        app.say(format!("COPIED {}", t.name.to_uppercase()));
    }
    let dr = Rect::from_min_size(pos2(r.right() - 100.0, ay), vec2(100.0, 28.0));
    let p = ui.painter();
    silk(p, pos2(dr.left() - 14.0, ay + 7.0), Align2::RIGHT_CENTER, "LIFT COVER", F::Silk2, 8.5, SILK2);
    silk(p, pos2(dr.left() - 14.0, ay + 21.0), Align2::RIGHT_CENTER, "TO DELETE", F::Silk2, 8.5, SILK2);
    if covered_key(ui, dr, Id::unique(("delete", i)), "DELETE", true) {
        match std::fs::remove_file(&path) {
            Ok(()) => app.say(format!("DELETED {}", t.name.to_uppercase())),
            Err(e) => app.say(format!("DELETE FAILED: {e}")),
        }
        app.load_tones();
    }
}

/// The tone's EQ (applied over the current buffer) as a curve on glass.
fn eq_preview(app: &App, ui: &Ui, r: Rect, t: &Tone) {
    let g = glass(ui, r);
    let p = ui.painter();
    let mut mem: Memory = app.mem.clone();
    if mem.is_empty() {
        mem = app.cat.params.iter().flat_map(|q| (0..q.size as u32).map(move |i| (katana::sysex::lin(q.addr) + i, 0))).collect();
    }
    for (a, d) in app.cat.encode_tone(t).0 {
        store(&mut mem, a, &d);
    }
    vfd(p, pos2(g.left() + 8.0, g.top() + 11.0), Align2::LEFT_CENTER, "EQ", F::MonoB, 8.5);
    text(p, pos2(g.right() - 8.0, g.top() + 11.0), Align2::RIGHT_CENTER, "±12 dB", F::MonoB, 8.5, mix(lit(), BLACK, 0.4));
    let Some(eq) = katana::response::eq(app.cat, &mem) else { return };
    let fx = |f: f64| g.left() + ((f / 20.0).log10() / 3.0) as f32 * g.width();
    let fy = |db: f64| g.center().y + 4.0 - (db.clamp(-14.0, 14.0) as f32) * (g.height() / 2.0 - 12.0) / 12.0;
    hline(p, g.left(), g.right(), fy(0.0).round(), alpha(led(), 0.25));
    let pts: Vec<Pos2> = (0..=120).map(|i| 20.0 * 1000f64.powf(i as f64 / 120.0)).map(|f| pos2(fx(f), fy(eq.db(f)))).collect();
    p.line(pts.clone(), Stroke::new(5.0, alpha(led(), 0.15)));
    p.line(pts, Stroke::new(1.6, if eq.on { lit() } else { mix(lit(), BLACK, 0.5) }));
    for (f, s) in [(50.0, "50"), (200.0, "200"), (1000.0, "1k"), (5000.0, "5k")] {
        text(p, pos2(fx(f), g.bottom() - 6.0), Align2::CENTER_BOTTOM, s, F::MonoB, 8.0, mix(lit(), BLACK, 0.4));
    }
    if !eq.on {
        vfd(p, pos2(g.right() - 8.0, g.bottom() - 10.0), Align2::RIGHT_CENTER, "EQ OFF", F::MonoB, 8.5);
    }
}

// --- backups ----------------------------------------------------------------------------------------------------

fn backups_dir() -> PathBuf {
    let tones = App::tones_dir();
    tones.parent().map_or(PathBuf::from("backups"), |p| if p.as_os_str().is_empty() { PathBuf::from("backups") } else { p.join("backups") })
}

/// The newest `tsuba-backup-*.json`: every channel as a tone.
fn latest_backup() -> Option<(PathBuf, BTreeMap<String, Tone>)> {
    let mut files: Vec<PathBuf> = std::fs::read_dir(backups_dir())
        .ok()?
        .flatten()
        .map(|e| e.path())
        .filter(|p| p.file_name().is_some_and(|f| f.to_string_lossy().starts_with("tsuba-backup-")))
        .collect();
    files.sort();
    let path = files.pop()?;
    let v: Value = serde_json::from_str(&std::fs::read_to_string(&path).ok()?).ok()?;
    let chans: BTreeMap<String, Tone> = serde_json::from_value(v.get("channels")?.clone()).ok()?;
    Some((path, chans))
}

fn backup_all(app: &mut App) {
    let chans: BTreeMap<String, Tone> = CHANNELS
        .iter()
        .filter_map(|(slot, label)| {
            let m = app.stored.get(slot)?;
            let name = App::patch_name(m).unwrap_or_default();
            Some((label.to_string(), app.cat.export(m, &name)))
        })
        .collect();
    if chans.len() < CHANNELS.len() {
        return app.say("STILL READING THE CHANNELS".into());
    }
    let secs = SystemTime::now().duration_since(UNIX_EPOCH).map_or(0, |d| d.as_secs());
    let dir = backups_dir();
    let _ = std::fs::create_dir_all(&dir);
    let path = dir.join(format!("tsuba-backup-{secs}.json"));
    let doc = serde_json::json!({ "tsuba_backup": 1, "made": secs, "channels": chans });
    match std::fs::write(&path, serde_json::to_string_pretty(&doc).unwrap()) {
        Ok(()) => app.say(format!("BACKED UP 5 CHANNELS TO {}", path.file_name().unwrap().to_string_lossy().to_uppercase())),
        Err(e) => app.say(format!("BACKUP FAILED: {e}")),
    }
    app.lib.backup = None;
}

fn backup_unit(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let h = 76.0;
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 4);
    let cy = face.center().y;
    let x0 = face.left() + 20.0;
    silk(ui.painter(), pos2(x0, cy), Align2::LEFT_CENTER, "BACKUP", F::Silk, 11.0, SILK);
    let br = Rect::from_min_size(pos2(x0 + 86.0, cy - 12.0), vec2(176.0, 24.0));
    let ready = app.online() && app.stored.len() >= CHANNELS.len();
    if ready {
        if key(ui, br, Id::unique("backup"), "BACK UP ALL CHANNELS", false, None).clicked() {
            backup_all(app);
        }
    } else {
        key_off(ui, br, "BACK UP ALL CHANNELS");
    }
    if app.lib.backup.is_none() {
        app.lib.backup = Some(latest_backup());
    }
    let last = app.lib.backup.clone().flatten();
    let label = last.as_ref().map_or("NO BACKUP YET".into(), |(p, _)| format!("LAST {} · {}", p.file_stem().unwrap_or_default().to_string_lossy(), age(p).1));
    let lw = (text_w(ui.painter(), &label, F::MonoB, 10.0) + 40.0).min(440.0);
    let lr = Rect::from_min_size(pos2(br.right() + 16.0, cy - 15.0), vec2(lw, 30.0));
    let g = glass(ui, lr);
    vfd_max(ui.painter(), pos2(g.left() + 10.0, g.center().y), Align2::LEFT_CENTER, &label, F::MonoB, 10.0, g.width() - 20.0);
    let rx = lr.right() + 34.0;
    groove(ui.painter(), rx - 18.0, face.top() + 12.0, face.bottom() - 12.0);
    let t = silk(ui.painter(), pos2(rx, cy), Align2::LEFT_CENTER, "LOAD FROM BACKUP", F::Silk, 11.0, SILK);
    let mut x = t.right() + 16.0;
    if let Some((_, chans)) = &last {
        for (slot, label) in CHANNELS {
            let Some(tone) = chans.get(label) else { continue };
            let kw = text_w(ui.painter(), label, F::Silk2, 9.0) + 22.0;
            let kr = Rect::from_min_size(pos2(x, cy - 12.0), vec2(kw, 24.0));
            let tip = format!("Load {label} ({}) from the backup into the edit buffer. WRITE keeps it.", tone.name);
            if app.online() && app.loaded {
                if key(ui, kr, Id::unique(("restore", slot)), label, false, None).on_hover_text(tip).clicked() {
                    let tone = tone.clone();
                    app.apply(&tone);
                }
            } else {
                key_off(ui, kr, label);
            }
            x += kw + 6.0;
        }
        silk(ui.painter(), pos2(x + 10.0, cy), Align2::LEFT_CENTER, "→ EDIT BUFFER", F::Silk2, 9.0, SILK3);
    } else {
        silk(ui.painter(), pos2(x, cy), Align2::LEFT_CENTER, "BACK UP FIRST", F::Silk2, 9.0, SILK3);
    }
    h
}
