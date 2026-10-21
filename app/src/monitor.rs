//! 03 MONITOR (dev view): what goes over the wire, decoded. The probe only reads (RQ1): raw writes can mute the amp.

use eframe::egui::{pos2, vec2, Align2, Color32, Id, Pos2, Rect, Sense, Stroke, StrokeKind, Ui};
use katana::sysex::{self, checksum, hex, Addr};

use crate::theme::*;
use crate::widgets::*;
use crate::worker::{Cmd, Dir, Link, LogEntry};
use crate::App;

pub struct State {
    pub paused: bool,
    /// TX, RX, patch (60/10), system (00), command (7F)
    filters: [bool; 5],
    sel: Option<usize>,
    addr: String,
    size: String,
}

impl Default for State {
    fn default() -> State {
        State { paused: false, filters: [true; 5], sel: None, addr: "60 00 00 51".into(), size: "1".into() }
    }
}

const FILTERS: [&str; 5] = ["TX", "RX", "EDIT", "SYS", "CMD"];

fn passes(f: &[bool; 5], e: &LogEntry) -> bool {
    let dir = if e.dir == Dir::Tx { f[0] } else { f[1] };
    let area = match e.addr[0] {
        0x60 | 0x10 => f[2],
        0x7F => f[4],
        _ => f[3],
    };
    dir && area
}

fn time(t: f64) -> String {
    format!("{:02}:{:06.3}", (t / 60.0) as u32, t % 60.0)
}

fn note(app: &App, e: &LogEntry) -> String {
    if let Some(p) = app.cat.at(e.addr) {
        return p.name.clone();
    }
    match e.addr {
        [0, 1, 0, 0] => "CURRENT PATCH".into(),
        [0x7F, 0, 0, 1] => "EDITOR MODE".into(),
        [0x7F, 0, 0, 0] => "COMM LEVEL".into(),
        [0x7F, 0, 1, 4] => "PATCH WRITE".into(),
        [0, 0, 4, 0x20..=0x29] => "KNOB POSITION".into(),
        [0, 0, 4, 0x10..=0x15] => "FX LED STATE".into(),
        [0x10, n, ..] => format!("STORED SLOT {n}"),
        [0x60, ..] => "EDIT BUFFER".into(),
        _ => String::new(),
    }
}

pub fn show(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let (lw, rw, gap) = (270.0, 290.0, 16.0);
    let x0 = o.x + 16.0;
    let cw = w - 32.0 - lw - rw - 2.0 * gap;
    let y = o.y + 16.0;
    let h1 = listener(app, ui, pos2(x0, y), lw);
    let h2 = log_and_decode(app, ui, pos2(x0 + lw + gap, y), cw);
    let h3 = map_and_probe(app, ui, pos2(x0 + lw + gap + cw + gap, y), rw);
    h1.max(h2).max(h3) + 32.0
}

fn rows(p: &eframe::egui::Painter, x0: f32, x1: f32, mut y: f32, items: &[(&str, String)]) -> f32 {
    for (k, v) in items {
        hline(p, x0, x1, y, LINE);
        text(p, pos2(x0, y + 13.5), Align2::LEFT_CENTER, k, F::Mono, 11.0, TEXT_3);
        text(p, pos2(x1, y + 13.5), Align2::RIGHT_CENTER, v, F::Mono, 11.0, INK);
        y += 27.0;
    }
    hline(p, x0, x1, y, LINE);
    y + 1.0
}

fn listener(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let h = 31.0 + 16.0 + 200.0 + 10.0 + 4.0 * 27.0 + 1.0 + 12.0 + 16.0 + 44.0 + 12.0 + 44.0 + 14.0 + 1.0;
    let r = Rect::from_min_size(o, vec2(w, h));
    let (rec, rc) = if app.mon.paused { ("PAUSED", TEXT_3) } else { ("RECORDING", SAGE) };
    let body = panel(ui.painter(), r, 16.0, "LISTENER", 40.0, "", "");
    let p = ui.painter();
    text(p, pos2(r.right() - 26.0, o.y + 15.5), Align2::RIGHT_CENTER, rec, F::Mono, 10.0, rc);
    let c = pos2(body.center().x, body.top() + 16.0 + 100.0);
    let sweep = (app.log.len() % 360) as f32 * 0.07;
    radar(p, c, 100.0, sweep);
    text(p, c + vec2(8.0, -78.0), Align2::LEFT_TOP, &format!("{:03}", app.log.len() % 1000), F::Mono, 10.0, TEXT_2);
    let (x0, x1) = (body.left() + 14.0, body.right() - 14.0);
    let tx = app.log.iter().filter(|e| e.dir == Dir::Tx).count();
    let port = if matches!(app.link, Link::Online { .. }) { "KATANA" } else { "—" };
    let mut y = rows(p, x0, x1, body.top() + 16.0 + 200.0 + 10.0, &[
        ("PORT", port.into()),
        ("FRAMES TX", format!("{tx:04}")),
        ("FRAMES RX", format!("{:04}", app.log.len() - tx)),
        ("SHOWN", format!("{:04}", app.log.iter().filter(|e| passes(&app.mon.filters, e)).count())),
    ]);
    y += 12.0;
    text(p, pos2(x0, y), Align2::LEFT_TOP, "FILTER", F::Mono, 10.0, TEXT_3);
    y += 16.0;
    let fw = (x1 - x0 - 4.0 * 4.0) / 5.0;
    for (i, f) in FILTERS.iter().enumerate() {
        let fr = Rect::from_min_size(pos2(x0 + i as f32 * (fw + 4.0), y), vec2(fw, 44.0));
        if toggle(ui, fr, Id::unique(("filter", i)), f, app.mon.filters[i]).clicked() {
            app.mon.filters[i] ^= true;
        }
    }
    y += 44.0 + 12.0;
    let bw = (x1 - x0 - 6.0) / 2.0;
    let pr = Rect::from_min_size(pos2(x0, y), vec2(bw, 44.0));
    if button(ui, pr, Id::unique("pause"), if app.mon.paused { "   RESUME" } else { "   PAUSE" }).clicked() {
        app.mon.paused ^= true;
    }
    dot(ui.painter(), pos2(pr.left() + 22.0, pr.center().y), 8.0, if app.mon.paused { TEXT_3 } else { ACCENT });
    if button(ui, Rect::from_min_size(pos2(x0 + bw + 6.0, y), vec2(bw, 44.0)), Id::unique("export"), ".TXT ↓").clicked() {
        export(app);
    }
    h
}

fn export(app: &mut App) {
    let lines: Vec<String> = app.log.iter().map(|e| {
        let d = if e.dir == Dir::Tx { "TX" } else { "RX" };
        format!("{}  {d}  {}  {}  {}  {}", time(e.t), if e.cmd == 0x11 { "RQ1" } else { "DT1" }, hex(&e.addr), hex(&e.data), note(app, e))
    }).collect();
    let _ = std::fs::create_dir_all("logs");
    let secs = std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).map_or(0, |d| d.as_secs());
    let path = format!("logs/monitor-{secs}.txt");
    match std::fs::write(&path, lines.join("\n") + "\n") {
        Ok(()) => app.say(format!("EXPORTED {} ROWS TO {}", lines.len(), path.to_uppercase())),
        Err(e) => app.say(format!("EXPORT FAILED: {e}")),
    }
}

const LOG_ROWS: usize = 10;
const COLS: [f32; 6] = [84.0, 30.0, 34.0, 100.0, 80.0, 30.0];

fn log_and_decode(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let shown: Vec<usize> = (0..app.log.len()).rev().filter(|&i| passes(&app.mon.filters, &app.log[i])).take(LOG_ROWS).collect();
    let log_h = 31.0 + 8.0 + 30.0 + LOG_ROWS as f32 * 36.0 + 12.0 + 1.0;
    let r = Rect::from_min_size(o, vec2(w, log_h));
    let meta = format!("{:04} ROWS", app.log.len());
    let body = panel(ui.painter(), r, 18.0, "SYSEX LOG", 64.0, "NEWEST FIRST", &meta);
    let (x0, x1) = (body.left() + 12.0, body.right() - 12.0);
    let mut y = body.top() + 8.0;
    let p = ui.painter();
    let mut cx = x0 + 10.0;
    for (i, hname) in ["TIME", "DIR", "CMD", "ADDRESS", "DATA", "SUM", "NOTE"].iter().enumerate() {
        text(p, pos2(cx, y + 15.0), Align2::LEFT_CENTER, hname, F::Mono, 10.0, TEXT_3);
        cx += COLS.get(i).copied().unwrap_or(0.0) + 12.0;
    }
    y += 30.0;
    hline(p, x0, x1, y - 1.0, EDGE);
    if shown.is_empty() {
        text(p, pos2(x0 + 10.0, y + 18.0), Align2::LEFT_CENTER, "NOTHING YET · TURN A KNOB ON THE AMP", F::Mono, 11.0, TEXT_3);
    }
    let sel = app.mon.sel.filter(|&s| s < app.log.len()).or(shown.first().copied());
    for &i in &shown {
        let row = Rect::from_min_size(pos2(x0, y), vec2(x1 - x0, 36.0));
        let resp = ui.interact(row, Id::unique(("logrow", i)), Sense::click());
        if resp.clicked() {
            app.mon.sel = Some(i);
        }
        let e = &app.log[i];
        let on = sel == Some(i);
        let p = ui.painter();
        if on {
            p.rect_filled(row, 0.0, INK);
        } else if resp.hovered() {
            p.rect_filled(row, 0.0, RAISED);
        }
        hline(p, x0, x1, y + 35.0, LINE);
        let (fg, dim) = if on { (INK_ON, INK_SUB) } else { (INK, TEXT_3) };
        let dirc = if on { INK_ON } else if e.dir == Dir::Tx { MUSTARD } else { STEEL };
        let sum = checksum(&[&e.addr[..], &e.data[..]].concat());
        let data = if e.data.len() > 3 { format!("{} …", hex(&e.data[..3])) } else { hex(&e.data) };
        let cells: [(String, Color32); 7] = [
            (time(e.t), dim),
            ((if e.dir == Dir::Tx { "TX" } else { "RX" }).into(), dirc),
            ((if e.cmd == 0x11 { "RQ1" } else { "DT1" }).into(), fg),
            (hex(&e.addr), fg),
            (data, fg),
            (format!("{sum:02X}"), fg),
            (note(app, e), dim),
        ];
        let mut cx = x0 + 10.0;
        for (ci, (s, c)) in cells.iter().enumerate() {
            let cw = COLS.get(ci).copied().unwrap_or(x1 - cx - 10.0);
            text_max(p, pos2(cx, y + 18.0), Align2::LEFT_CENTER, s, F::Mono, 11.0, *c, cw);
            cx += cw + 12.0;
        }
        if resp.has_focus() {
            focus_ring(p, row, 0.0);
        }
        y += 36.0;
    }

    // frame decode of the selected row
    let dy = o.y + log_h + 16.0;
    let dh = 31.0 + 16.0 + 44.0 + 22.0 + 14.0 + 1.0 + 12.0 + 20.0 + 16.0 + 1.0;
    let r = Rect::from_min_size(pos2(o.x, dy), vec2(w, dh));
    let Some(e) = sel.map(|i| app.log[i].clone()) else {
        panel(ui.painter(), r, 18.0, "FRAME DECODE", 0.0, "NO FRAME SELECTED", "");
        return log_h + 16.0 + dh;
    };
    let dev = match app.link {
        Link::Online { dev } => dev,
        _ => 0,
    };
    let body_bytes = [&e.addr[..], &e.data[..]].concat();
    let sum = checksum(&body_bytes);
    let groups: Vec<(String, &str, Color32, Color32, Color32)> = vec![
        ("F0".into(), "START", PANEL, EDGE, INK),
        ("41".into(), "ROLAND", PANEL, EDGE, INK),
        (format!("{dev:02X}"), "DEVICE", PANEL, EDGE, INK),
        ("00 00 00 33".into(), "MODEL", PANEL, EDGE, INK),
        (format!("{:02X}", e.cmd), if e.cmd == 0x11 { "RQ1" } else { "DT1" }, INK, INK, INK_ON),
        (hex(&e.addr), "ADDRESS", PANEL, STEEL, INK),
        (if e.data.len() > 8 { format!("{} …", hex(&e.data[..8])) } else { hex(&e.data) }, if e.cmd == 0x11 { "SIZE" } else { "DATA" }, CORAL, CORAL, INK_ON),
        (format!("{sum:02X}"), "SUM", MUSTARD, MUSTARD, INK_ON),
        ("F7".into(), "END", PANEL, EDGE, INK),
    ];
    let title = format!("{} · {}", if e.dir == Dir::Tx { "TX" } else { "RX" }, note(app, &e));
    let total = 12 + body_bytes.len();
    let body = panel(ui.painter(), r, 18.0, "FRAME DECODE", 0.0, &title, &format!("{total} BYTES"));
    let p = ui.painter();
    let (x0, x1) = (body.left() + 16.0, body.right() - 16.0);
    let weights: Vec<f32> = groups.iter().map(|g| (g.0.len() as f32 / 3.0).ceil().max(1.0)).collect();
    let unit = (x1 - x0 - (groups.len() - 1) as f32 * 4.0) / weights.iter().sum::<f32>();
    let mut x = x0;
    let y = body.top() + 16.0;
    for (g, wgt) in groups.iter().zip(&weights) {
        let bw = unit * wgt;
        let br = Rect::from_min_size(pos2(x, y), vec2(bw, 44.0));
        p.rect_filled(br, 0.0, g.2);
        p.rect_stroke(br, 0.0, Stroke::new(1.0, g.3), StrokeKind::Inside);
        text_max(p, br.center(), Align2::CENTER_CENTER, &g.0, F::SemiB, 15.0, g.4, bw - 8.0);
        text_max(p, pos2(x, y + 50.0), Align2::LEFT_TOP, g.1, F::Mono, 10.0, TEXT_2, bw);
        x += bw + 4.0;
    }
    let sy = y + 44.0 + 22.0 + 14.0;
    hline(p, x0, x1, sy, LINE);
    dot(p, pos2(x0 + 3.5, sy + 22.0), 7.0, SAGE);
    let t = text(p, pos2(x0 + 14.0, sy + 22.0), Align2::LEFT_CENTER, "CHECKSUM", F::Mono, 11.0, INK);
    let s: u32 = body_bytes.iter().map(|&b| b as u32).sum();
    let math = format!("(128 − {s} % 128) % 128 = {sum:02X}H, over address + {}", if e.cmd == 0x11 { "size" } else { "data" });
    text(p, pos2(t.right() + 16.0, sy + 22.0), Align2::LEFT_CENTER, &math, F::Mono, 11.0, TEXT_2);
    log_h + 16.0 + dh
}

/// What we know about each address area, 1–5 (notes/02, 07).
const MAP: [(&str, &str, u8); 8] = [
    ("00 01 00 00", "CURRENT PATCH", 5),
    ("60 00 00 00", "EDIT BUFFER", 5),
    ("10 0N 00 00", "USER SLOTS", 5),
    ("7F 00 00 01", "EDITOR MODE", 5),
    ("7F 00 01 04", "PATCH WRITE", 5),
    ("00 00 04 20", "KNOB POSITIONS", 4),
    ("00 00 00 00", "SYSTEM", 3),
    ("7F 00 05 00", "TUNER (NOT ON 50)", 1),
];

fn map_and_probe(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let mh = 31.0 + 4.0 + MAP.len() as f32 * 51.0 + 12.0 + 48.0 + 10.0 + 1.0;
    let r = Rect::from_min_size(o, vec2(w, mh));
    let confirmed = MAP.iter().filter(|m| m.2 == 5).count();
    let body = panel(ui.painter(), r, 16.0, "ADDRESS MAP", 0.0, "", &format!("{confirmed:02} / {:02} CONFIRMED", MAP.len()));
    let p = ui.painter();
    let (x0, x1) = (body.left() + 14.0, body.right() - 14.0);
    let mut y = body.top() + 4.0;
    for (addr, name, conf) in MAP {
        let (tag, tc) = match conf {
            5 => ("CONFIRMED", SAGE),
            3 | 4 => ("PARTIAL", MUSTARD),
            _ => ("GUESS", TEXT_3),
        };
        text(p, pos2(x0, y + 10.0), Align2::LEFT_TOP, addr, F::Mono, 11.0, INK);
        text(p, pos2(x1, y + 10.0), Align2::RIGHT_TOP, tag, F::Mono, 11.0, tc);
        text(p, pos2(x0, y + 36.0), Align2::LEFT_CENTER, name, F::Semi, 13.0, INK);
        for s in 0..5u8 {
            let sr = Rect::from_min_size(pos2(x1 - 58.0 + s as f32 * 12.0, y + 32.0), vec2(10.0, 8.0));
            p.rect_filled(sr, 0.0, if s < conf { INK } else { LINE });
        }
        y += 50.0;
        hline(p, x0, x1, y, LINE);
        y += 1.0;
    }
    para(p, pos2(x0, y + 12.0), "Confidence from the hardware tests in notes/07. Move one knob, watch one address, then confirm.", 10.0, TEXT_3, x1 - x0, 16.0);

    // probe (RQ1 only)
    let py = o.y + mh + 16.0;
    let ph = 31.0 + 14.0 + 2.0 * (16.0 + 44.0 + 10.0) + 30.0 + 10.0 + 44.0 + 10.0 + 44.0 + 14.0 + 1.0;
    let r = Rect::from_min_size(pos2(o.x, py), vec2(w, ph));
    let body = panel(ui.painter(), r, 16.0, "PROBE", 40.0, "", "RQ1 · READ-ONLY");
    let mut y = body.top() + 14.0;
    for (label, which) in [("ADDRESS", 0), ("SIZE (BYTES)", 1)] {
        text(ui.painter(), pos2(x0, y), Align2::LEFT_TOP, label, F::Mono, 10.0, TEXT_3);
        y += 16.0;
        let fr = Rect::from_min_size(pos2(x0, y), vec2(x1 - x0, 44.0));
        let s = if which == 0 { &mut app.mon.addr } else { &mut app.mon.size };
        text_field(ui, fr, s, "", 14.0);
        y += 44.0 + 10.0;
    }
    let addr: Option<Addr> = {
        let b: Vec<u8> = app.mon.addr.split_whitespace().filter_map(|x| u8::from_str_radix(x, 16).ok()).filter(|&b| b < 0x80).collect();
        b.try_into().ok()
    };
    let size: Option<u32> = app.mon.size.trim().parse().ok().filter(|&n| (1..=2048).contains(&n));
    let p = ui.painter();
    hline(p, x0, x1, y, LINE);
    let cs = match (addr, size) {
        (Some(a), Some(n)) => format!("{:02X}H · AUTO", checksum(&[&a[..], &sysex::addr(n)[..]].concat())),
        _ => "—".into(),
    };
    text(p, pos2(x0, y + 15.0), Align2::LEFT_CENTER, "CHECKSUM", F::Mono, 11.0, TEXT_3);
    text(p, pos2(x1, y + 15.0), Align2::RIGHT_CENTER, &cs, F::Mono, 11.0, INK);
    hline(p, x0, x1, y + 30.0, LINE);
    y += 30.0 + 10.0;
    let br = Rect::from_min_size(pos2(x0, y), vec2(x1 - x0, 44.0));
    match (addr, size, app.online()) {
        (Some(a), Some(n), true) => {
            if primary(ui, br, Id::unique("probe"), "READ", true).clicked() {
                app.probe = None;
                app.send(Cmd::Read(a, n));
            }
        }
        _ => disabled_button(ui, br, "READ"),
    }
    y += 44.0 + 10.0;
    let res = Rect::from_min_size(pos2(x0, y), vec2(x1 - x0, 44.0));
    let p = ui.painter();
    p.rect_filled(res, 0.0, BG);
    p.rect_stroke(res, 0.0, Stroke::new(1.0, LINE), StrokeKind::Inside);
    let out = match (&app.probe, addr) {
        (Some(Ok(d)), Some(a)) => {
            let val = app.cat.at(a).filter(|prm| prm.size <= d.len()).map(|prm| {
                let raw = sysex::decode_value(&d[..prm.size]);
                format!(" = {}", prm.display(raw))
            });
            format!("{}{}", hex(&d[..d.len().min(10)]), val.unwrap_or_default())
        }
        (Some(Err(e)), _) => e.to_uppercase(),
        _ => "NO READ YET".into(),
    };
    text_max(p, pos2(x0 + 10.0, res.center().y), Align2::LEFT_CENTER, &out, F::Mono, 12.0, INK, res.width() - 20.0);
    mh + 16.0 + ph
}
