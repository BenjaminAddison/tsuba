//! MONITOR (dev view): what goes over the wire, decoded, with filters, capture control, rates, a byte-level frame
//! decode, the address map and an RQ1 probe. The probe only reads: raw writes can mute the amp.

use eframe::egui::{pos2, vec2, Align2, Id, Pos2, Rect, Stroke, Ui};
use katana::sysex::{self, checksum, hex, Addr};

use crate::theme::*;
use crate::widgets::*;
use crate::worker::{Cmd, Dir, Link, LogEntry};
use crate::{display, App, GAP};

pub struct State {
    pub paused: bool,
    /// TX, RX, edit (60/10), system (00), command (7F)
    filters: [bool; 5],
    sel: Option<usize>,
    addr: String,
    size: String,
    map_view: bool,
    since: f64,
}

impl Default for State {
    fn default() -> State {
        State { paused: false, filters: [true; 5], sel: None, addr: "60 00 00 00".into(), size: "16".into(), map_view: false, since: -1.0 }
    }
}

impl State {
    pub fn set_probe(&mut self, addr: &str, size: &str) {
        self.addr = addr.into();
        self.size = size.into();
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

fn counts(app: &App) -> [usize; 5] {
    let mut c = [0; 5];
    for e in &app.log {
        c[if e.dir == Dir::Tx { 0 } else { 1 }] += 1;
        c[match e.addr[0] {
            0x60 | 0x10 => 2,
            0x7F => 4,
            _ => 3,
        }] += 1;
    }
    c
}

fn time(t: f64) -> String {
    format!("{:02}:{:02}:{:06.3}", (t / 3600.0) as u32, (t / 60.0) as u32 % 60, t % 60.0)
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
        [0x60, 0, 7, 0x20] => "CHAIN".into(),
        [0x60, ..] => "EDIT BUFFER".into(),
        _ => String::new(),
    }
}

fn kind(e: &LogEntry) -> &'static str {
    match (e.dir, e.cmd, e.addr[0]) {
        (Dir::Rx, ..) => "RX",
        (_, 0x11, _) => "TX",
        (_, _, 0x60) | (_, _, 0x10) => "EDIT",
        (_, _, 0x7F) => "CMD",
        _ => "SYS",
    }
}

fn value(app: &App, e: &LogEntry) -> Option<String> {
    let p = app.cat.at(e.addr)?;
    (e.data.len() == p.size).then(|| display(p, sysex::decode_value(&e.data)))
}

fn decoded(app: &App, e: &LogEntry) -> String {
    let n = note(app, e);
    let n = if n.is_empty() { hex(&e.addr) } else { n };
    match (e.dir, e.cmd) {
        (Dir::Tx, 0x11) => format!("→ read {n} · {} B", sysex::decode_value(&e.data)),
        (d, _) => {
            let arrow = if d == Dir::Tx { "→" } else { "←" };
            match value(app, e) {
                Some(v) => format!("{arrow} {n} = {v}"),
                None if e.addr == [0x60, 0, 0, 0] && e.data.len() >= 16 => format!("{arrow} PATCH NAME = \"{}\"", String::from_utf8_lossy(&e.data[..16]).trim_end()),
                None => format!("{arrow} {n} · {} B", e.data.len()),
            }
        }
    }
}

fn frame(app: &App, e: &LogEntry) -> Vec<u8> {
    let dev = match app.link {
        Link::Online { dev } => dev,
        _ => 0,
    };
    if e.cmd == 0x11 { sysex::rq1(dev, e.addr, sysex::decode_value(&e.data)) } else { sysex::dt1(dev, e.addr, &e.data) }
}

pub fn show(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let mut y = o.y;
    y += show_unit(app, ui, pos2(o.x, y), w) + GAP;
    y += log_unit(app, ui, pos2(o.x, y), w);
    y - o.y
}

fn show_unit(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let h = 70.0;
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 1);
    let cy = face.center().y + 2.0;
    let x0 = face.left() + 20.0;
    silk(ui.painter(), pos2(x0, cy), Align2::LEFT_CENTER, "SHOW", F::Silk, 11.0, SILK);
    let c = counts(app);
    let mut x = x0 + 70.0;
    for (i, f) in FILTERS.iter().enumerate() {
        let label = format!("{f} {}", c[i]);
        let kw = text_w(ui.painter(), &label, F::Silk2, 8.5) + 18.0;
        let kr = Rect::from_min_size(pos2(x, cy - 11.0), vec2(kw, 22.0));
        if key(ui, kr, Id::unique(("filter", i)), &label, app.mon.filters[i], Some(app.mon.filters[i])).clicked() {
            app.mon.filters[i] ^= true;
        }
        x += kw + 6.0;
    }
    x += 14.0;
    groove(ui.painter(), x, face.top() + 12.0, face.bottom() - 12.0);
    x += 22.0;
    silk(ui.painter(), pos2(x, cy), Align2::LEFT_CENTER, "CAPTURE", F::Silk, 11.0, SILK);
    x += 96.0;
    let now = ui.input(|i| i.time);
    if app.mon.since < 0.0 {
        app.mon.since = now;
    }
    let pr = Rect::from_min_size(pos2(x, cy - 12.0), vec2(64.0, 24.0));
    if key(ui, pr, Id::unique("pause"), "PAUSE", app.mon.paused, Some(app.mon.paused)).clicked() && !app.mon.paused {
        app.mon.paused = true;
    }
    let lr = Rect::from_min_size(pos2(pr.right() + 10.0, cy - 12.0), vec2(70.0, 24.0));
    let rec = !app.mon.paused;
    led_dot(ui.painter(), pos2(lr.center().x, lr.top() - 7.0), 5.0, rec);
    if key_cap(ui, lr, Id::unique("listen"), "LISTEN", rec, None, if rec { Cap::Red } else { Cap::Grey }).clicked() && app.mon.paused {
        app.mon.paused = false;
        app.mon.since = now;
    }
    let rr = Rect::from_min_size(pos2(lr.right() + 10.0, cy - 13.0), vec2(84.0, 26.0));
    let g = glass(ui, rr);
    let secs = if rec { (now - app.mon.since) as u64 } else { 0 };
    let label = if rec { format!("REC {} S", secs) } else { "PAUSED".into() };
    vfd(ui.painter(), g.center(), Align2::CENTER_CENTER, &label, F::MonoB, 9.5);

    // rates
    let tx = app.traffic_since(Dir::Tx, 1.0, now);
    let rx = app.traffic_since(Dir::Rx, 1.0, now);
    let sr = Rect::from_min_size(pos2(face.right() - 20.0 - 92.0, face.top() + 12.0), vec2(92.0, h - 24.0));
    let g = glass(ui, sr);
    vfd(ui.painter(), pos2(g.center().x, g.center().y - 7.0), Align2::CENTER_CENTER, &format!("{} MSG/S", tx + rx), F::MonoB, 10.0);
    vfd(ui.painter(), pos2(g.center().x, g.center().y + 8.0), Align2::CENTER_CENTER, &format!("{} DROPS", app.drops), F::MonoB, 9.0);
    let mx1 = sr.left() - 16.0;
    let mx0 = mx1 - 200.0;
    let p = ui.painter();
    for (i, (label, n)) in [("TX", tx), ("RX", rx)].into_iter().enumerate() {
        let my = face.top() + 20.0 + i as f32 * 16.0;
        silk(p, pos2(mx0 - 10.0, my), Align2::RIGHT_CENTER, label, F::Silk2, 8.5, SILK2);
        let lit_n = ((n as f32 / 60.0) * 20.0).ceil().min(20.0) as usize;
        segments(p, Rect::from_min_size(pos2(mx0, my - 3.0), vec2(200.0, 6.0)), 20, lit_n.saturating_sub(1), lit_n.checked_sub(1));
    }
    for (k, t) in ["0", "20", "40", "60 msg/s"].iter().enumerate() {
        let al = if k == 3 { Align2::RIGHT_CENTER } else { Align2::CENTER_CENTER };
        let x = if k == 3 { mx1 } else { mx0 + 200.0 * k as f32 / 3.0 };
        text(p, pos2(x, face.bottom() - 13.0), al, t, F::Mono, 8.0, SILK3);
    }
    h
}

fn log_unit(app: &mut App, ui: &mut Ui, o: Pos2, w: f32) -> f32 {
    let rows = 18;
    let h = 44.0 + 30.0 + rows as f32 * 25.0 + 30.0 + 56.0;
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 2);
    let shown: Vec<usize> = (0..app.log.len()).rev().filter(|&i| passes(&app.mon.filters, &app.log[i])).collect();
    let sub = format!("{} SHOWN · {} IN BUFFER · NEWEST FIRST", shown.len(), app.log.len());
    header(ui.painter(), face, face.top() + 22.0, "LOG", &sub, "DECODE", 3);
    let x0 = face.left() + 20.0;
    let dw = 450.0;
    let tw = face.width() - 40.0 - dw - 36.0;
    let tr = Rect::from_min_size(pos2(x0, face.top() + 42.0), vec2(tw, 30.0 + rows as f32 * 25.0 + 30.0));
    let g = glass(ui, tr);
    let cols = [28.0, 128.0, 186.0, (g.width() * 0.56).max(470.0)];
    let p = ui.painter();
    for (i, hname) in ["TIME", "KIND", "DECODED", "FRAME"].iter().enumerate() {
        text(p, pos2(g.left() + cols[i], g.top() + 14.0), Align2::LEFT_CENTER, hname, F::MonoB, 8.5, mix(lit(), BLACK, 0.4));
    }
    let sel = app.mon.sel.filter(|&s| s < app.log.len()).or(shown.first().copied());
    if shown.is_empty() {
        vfd(p, pos2(g.left() + 28.0, g.top() + 44.0), Align2::LEFT_CENTER, if app.online() { "NOTHING YET · TURN A KNOB ON THE AMP" } else { "WAITING FOR THE AMP" }, F::Mono, 11.0);
    }
    for (k, &i) in shown.iter().take(rows).enumerate() {
        let row = Rect::from_min_size(pos2(g.left() + 2.0, g.top() + 28.0 + k as f32 * 25.0), vec2(g.width() - 4.0, 24.0));
        let s = sel == Some(i);
        if vfd_row(ui, row, Id::unique(("log", i)), s).clicked() {
            app.mon.sel = Some(i);
        }
        let e = &app.log[i];
        let p = ui.painter();
        let cy = row.center().y;
        if s {
            row_text(p, pos2(g.left() + 10.0, cy), Align2::LEFT_CENTER, "▸", 11.0, true, false, 14.0);
        }
        row_text(p, pos2(g.left() + cols[0], cy), Align2::LEFT_CENTER, &time(e.t), 11.0, s, false, 96.0);
        let kd = kind(e);
        let kr = Rect::from_min_size(pos2(g.left() + cols[1], cy - 7.0), vec2(36.0, 14.0));
        p.rect_stroke(kr, 1.0, Stroke::new(1.0, if s { INV_TEXT } else { alpha(lit(), 0.7) }), eframe::egui::StrokeKind::Inside);
        row_text(p, kr.center(), Align2::CENTER_CENTER, kd, 8.5, s, false, 34.0);
        let dimmed = kd == "SYS";
        row_text(p, pos2(g.left() + cols[2], cy), Align2::LEFT_CENTER, &decoded(app, e), 11.0, s, dimmed, cols[3] - cols[2] - 12.0);
        let fr = frame(app, e);
        let fs = format!("{} ·· {}", hex(&fr[..3]), hex(&fr[6..]));
        row_text(p, pos2(g.left() + cols[3], cy), Align2::LEFT_CENTER, &fs, 10.5, s, true, g.width() - cols[3] - 10.0);
    }
    let p = ui.painter();
    let fy = g.bottom() - 13.0;
    p.extend(eframe::egui::Shape::dashed_line(&[pos2(g.left() + 8.0, fy - 13.0), pos2(g.right() - 8.0, fy - 13.0)], Stroke::new(1.0, alpha(led(), 0.25)), 2.0, 3.0));
    led_dot(p, pos2(g.left() + 14.0, fy), 5.0, !app.mon.paused);
    vfd(p, pos2(g.left() + 24.0, fy), Align2::LEFT_CENTER, if app.mon.paused { "PAUSED" } else { "LIVE" }, F::MonoB, 9.0);
    text(p, pos2(g.right() - 12.0, fy), Align2::RIGHT_CENTER, "CLICK A ROW TO DECODE IT", F::MonoB, 9.0, mix(lit(), BLACK, 0.35));
    let by = tr.bottom() + 16.0;
    if key(ui, Rect::from_min_size(pos2(x0, by), vec2(70.0, 26.0)), Id::unique("clear"), "CLEAR", false, None).clicked() {
        app.log.clear();
        app.mon.sel = None;
    }
    if key(ui, Rect::from_min_size(pos2(x0 + 82.0, by), vec2(132.0, 26.0)), Id::unique("export"), "EXPORT LOG .TXT", false, None).clicked() {
        export(app);
    }
    silk(ui.painter(), pos2(tr.right(), by + 13.0), Align2::RIGHT_CENTER, "KEEPS THE LAST 5,000 MESSAGES", F::Silk2, 9.0, SILK2);

    // right: decode / address map, then the probe
    let dx = tr.right() + 36.0;
    groove(ui.painter(), dx - 18.0, face.top() + 42.0, face.bottom() - 20.0);
    let rr = Rect::from_min_max(pos2(dx, face.top() + 42.0), pos2(face.right() - 20.0, face.bottom() - 20.0));
    for (i, label) in ["DECODE", "ADDR MAP"].iter().enumerate() {
        let kr = Rect::from_min_size(pos2(rr.left() + i as f32 * 86.0, rr.top() + 8.0), vec2(78.0, 22.0));
        let on = app.mon.map_view == (i == 1);
        if key(ui, kr, Id::unique(("view", i)), label, on, Some(on)).clicked() {
            app.mon.map_view = i == 1;
        }
    }
    let body = Rect::from_min_max(pos2(rr.left(), rr.top() + 44.0), pos2(rr.right(), rr.bottom() - 190.0));
    if app.mon.map_view {
        address_map(ui, body);
    } else if let Some(i) = sel {
        let e = app.log[i].clone();
        text(ui.painter(), pos2(rr.right(), rr.top() + 19.0), Align2::RIGHT_CENTER, &format!("row {}", time(e.t)), F::Mono, 9.5, SILK2);
        decode(app, ui, body, &e);
    }
    probe(app, ui, Rect::from_min_max(pos2(rr.left(), rr.bottom() - 176.0), rr.max));
    h
}

fn export(app: &mut App) {
    let lines: Vec<String> = app
        .log
        .iter()
        .map(|e| {
            let d = if e.dir == Dir::Tx { "TX" } else { "RX" };
            format!("{}  {d}  {}  {}  {}  {}", time(e.t), if e.cmd == 0x11 { "RQ1" } else { "DT1" }, hex(&e.addr), hex(&e.data), note(app, e))
        })
        .collect();
    let _ = std::fs::create_dir_all("logs");
    let secs = std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).map_or(0, |d| d.as_secs());
    let path = format!("logs/monitor-{secs}.txt");
    match std::fs::write(&path, lines.join("\n") + "\n") {
        Ok(()) => app.say(format!("EXPORTED {} ROWS TO {}", lines.len(), path.to_uppercase())),
        Err(e) => app.say(format!("EXPORT FAILED: {e}")),
    }
}

fn decode(app: &mut App, ui: &Ui, r: Rect, e: &LogEntry) {
    let fr = frame(app, e);
    let gr = Rect::from_min_size(r.min, vec2(r.width(), 92.0));
    let g = glass(ui, gr);
    let p = ui.painter();
    // byte boxes: F0 41 dev | model | cmd | address | data | sum | F7
    let n_data = e.data.len().min(4);
    let mut groups: Vec<(Vec<u8>, &str, u8)> = vec![
        (vec![0xF0], "SOX", 0),
        (vec![0x41], "ROLAND", 0),
        (vec![fr[2]], "DEV", 0),
        (fr[3..7].to_vec(), "MODEL", 0),
        (vec![e.cmd], if e.cmd == 0x11 { "RQ1" } else { "DT1" }, 1),
        (e.addr.to_vec(), "ADDRESS", 2),
        (e.data[..n_data].to_vec(), if e.cmd == 0x11 { "SIZE" } else { "DATA" }, 3),
        (vec![fr[fr.len() - 2]], "SUM", 4),
        (vec![0xF7], "EOX", 0),
    ];
    if e.data.len() > n_data {
        groups[6].1 = "DATA …";
    }
    let total: usize = groups.iter().map(|g| g.0.len()).sum();
    let bw = ((g.width() - 20.0 - (groups.len() - 1) as f32 * 6.0) / total as f32).min(26.0);
    let mut x = g.left() + 10.0;
    for (bytes, label, role) in &groups {
        let gx = x;
        for b in bytes {
            let br = Rect::from_min_size(pos2(x, g.top() + 18.0), vec2(bw - 2.0, 26.0));
            if *role == 2 || *role == 3 {
                glow(p, br, 1.0, 6.0, alpha(led(), 0.3));
                p.rect_filled(br, 1.0, inv());
                text(p, br.center(), Align2::CENTER_CENTER, &format!("{b:02X}"), F::MonoB, 11.0, INV_TEXT);
            } else if *role == 1 || *role == 4 {
                vfd(p, br.center(), Align2::CENTER_CENTER, &format!("{b:02X}"), F::MonoB, 11.0);
            } else {
                text(p, br.center(), Align2::CENTER_CENTER, &format!("{b:02X}"), F::Mono, 11.0, mix(lit(), BLACK, 0.45));
            }
            x += bw;
        }
        let gx1 = x - 2.0;
        let c = alpha(lit(), 0.45);
        hline(p, gx, gx1, g.top() + 52.0, c);
        vline(p, gx, g.top() + 48.0, g.top() + 52.0, c);
        vline(p, gx1 - 1.0, g.top() + 48.0, g.top() + 52.0, c);
        let lc = if *role >= 2 { lit() } else { mix(lit(), BLACK, 0.4) };
        text_max(p, pos2((gx + gx1) / 2.0, g.top() + 64.0), Align2::CENTER_CENTER, label, F::MonoB, 7.5, lc, gx1 - gx + 8.0);
        x += 6.0;
    }
    // facts
    let body = [&e.addr[..], &e.data[..]].concat();
    let sum = checksum(&body);
    let s: u32 = body.iter().map(|&b| b as u32).sum();
    let addr_name = note(app, e);
    let mut facts = vec![
        ("COMMAND", if e.cmd == 0x11 { "RQ1 · data request".to_string() } else { "DT1 · data set".to_string() }),
        ("ADDRESS", format!("{}{}", hex(&e.addr), if addr_name.is_empty() { String::new() } else { format!(" → {addr_name}") })),
    ];
    if e.cmd == 0x11 {
        facts.push(("SIZE", format!("{} bytes", sysex::decode_value(&e.data))));
    } else {
        let v = value(app, e).map_or(String::new(), |v| format!(" → {v}"));
        facts.push(("VALUE", format!("{}{v}", if e.data.len() > 8 { format!("{} … ({} B)", hex(&e.data[..8]), e.data.len()) } else { hex(&e.data) })));
    }
    facts.push(("CHECKSUM", format!("{sum:02X} · valid · (128 − {s} mod 128) mod 128")));
    let p = ui.painter();
    let mut y = gr.bottom() + 20.0;
    for (k, v) in &facts {
        silk(p, pos2(r.left(), y), Align2::LEFT_CENTER, k, F::Silk2, 9.0, SILK2);
        text_max(p, pos2(r.left() + 96.0, y), Align2::LEFT_CENTER, v, F::Mono, 10.5, SILK, r.width() - 96.0);
        y += 21.0;
    }
    if let Some(&b) = e.data.first().filter(|_| e.cmd == 0x12) {
        silk(p, pos2(r.left(), y), Align2::LEFT_CENTER, "BITS", F::Silk2, 9.0, SILK2);
        for k in 0..7 {
            let on = b >> (6 - k) & 1 == 1;
            let c = pos2(r.left() + 100.0 + k as f32 * 11.0, y - 3.0);
            led_dot(p, c, 6.0, on);
            text(p, c + vec2(0.0, 11.0), Align2::CENTER_CENTER, &(6 - k).to_string(), F::Mono, 7.0, SILK3);
        }
        text(p, pos2(r.left() + 186.0, y - 3.0), Align2::LEFT_CENTER, &format!("{b:07b} · 7-bit"), F::Mono, 10.0, SILK2);
        y += 24.0;
    }
    let ky = y + 6.0;
    if key(ui, Rect::from_min_size(pos2(r.left(), ky), vec2(90.0, 26.0)), Id::unique("copy-hex"), "COPY HEX", false, None).clicked() {
        ui.ctx().copy_text(hex(&fr));
        app.say("COPIED THE FRAME".into());
    }
    let resend_ok = e.dir == Dir::Tx && e.cmd == 0x12 && e.addr[0] == 0x60 && app.online();
    let rr = Rect::from_min_size(pos2(r.left() + 102.0, ky), vec2(84.0, 26.0));
    if resend_ok {
        if key(ui, rr, Id::unique("resend"), "RESEND", false, None).on_hover_text("Write these bytes to the edit buffer again").clicked() {
            app.send(Cmd::Write(e.addr, e.data.clone()));
            crate::store(&mut app.mem, e.addr, &e.data);
        }
    } else {
        key_off(ui, rr, "RESEND");
    }
    silk(ui.painter(), pos2(r.right(), ky + 13.0), Align2::RIGHT_CENTER, "RESEND: OWN EDIT-BUFFER WRITES ONLY", F::Silk2, 8.5, SILK3);
}

/// What we know about each address area, 1–5 (notes/02, 07).
const MAP: [(&str, &str, u8); 9] = [
    ("00 01 00 00", "CURRENT PATCH", 5),
    ("60 00 00 00", "EDIT BUFFER", 5),
    ("10 0N 00 00", "USER SLOTS", 5),
    ("7F 00 00 01", "EDITOR MODE", 5),
    ("7F 00 01 04", "PATCH WRITE", 5),
    ("60 00 07 20", "FX CHAIN (20 B, WHOLE)", 5),
    ("00 00 04 20", "KNOB POSITIONS", 4),
    ("00 00 00 00", "SYSTEM", 3),
    ("7F 00 05 00", "TUNER (NOT ON 50)", 1),
];

fn address_map(ui: &Ui, r: Rect) {
    let g = glass(ui, r);
    let p = ui.painter();
    let rh = ((g.height() - 16.0) / MAP.len() as f32).min(30.0);
    for (i, (addr, name, conf)) in MAP.iter().enumerate() {
        let y = g.top() + 8.0 + rh * (i as f32 + 0.5);
        vfd(p, pos2(g.left() + 10.0, y), Align2::LEFT_CENTER, addr, F::MonoB, 10.0);
        vfd_max(p, pos2(g.left() + 110.0, y), Align2::LEFT_CENTER, name, F::Mono, 10.0, g.width() - 210.0);
        for s in 0..5u8 {
            let sr = Rect::from_min_size(pos2(g.right() - 70.0 + s as f32 * 12.0, y - 3.0), vec2(9.0, 6.0));
            if s < *conf {
                glow(p, sr, 1.0, 4.0, alpha(led(), 0.4));
                p.rect_filled(sr, 1.0, lit());
            } else {
                p.rect_filled(sr, 1.0, mix(rgba(0x0B0704FF), led(), 0.18));
            }
        }
    }
}

fn probe(app: &mut App, ui: &mut Ui, r: Rect) {
    let p = ui.painter();
    let t = silk(p, pos2(r.left(), r.top() + 8.0), Align2::LEFT_CENTER, "READ", F::Silk, 11.0, SILK);
    silk(p, pos2(t.right() + 12.0, r.top() + 8.0), Align2::LEFT_CENTER, "RQ1 · ASK THE AMP FOR BYTES", F::Silk2, 9.0, SILK2);
    let ly = r.top() + 30.0;
    silk(p, pos2(r.left(), ly), Align2::LEFT_CENTER, "ADDRESS", F::Silk2, 9.0, SILK2);
    silk(p, pos2(r.left() + 130.0, ly), Align2::LEFT_CENTER, "SIZE", F::Silk2, 9.0, SILK2);
    let ar = Rect::from_min_size(pos2(r.left(), ly + 10.0), vec2(118.0, 28.0));
    vfd_field(ui, ar, &mut app.mon.addr, "60 00 00 00", "", 11.0);
    let sr = Rect::from_min_size(pos2(r.left() + 130.0, ly + 10.0), vec2(56.0, 28.0));
    vfd_field(ui, sr, &mut app.mon.size, "16", "", 11.0);
    let addr: Option<Addr> = {
        let b: Vec<u8> = app.mon.addr.split_whitespace().filter_map(|x| u8::from_str_radix(x, 16).ok()).filter(|&b| b < 0x80).collect();
        b.try_into().ok()
    };
    let size: Option<u32> = app.mon.size.trim().parse().ok().filter(|&n| (1..=2048).contains(&n));
    let kr = Rect::from_min_size(pos2(r.left() + 198.0, ly + 12.0), vec2(70.0, 26.0));
    match (addr, size, app.online()) {
        (Some(a), Some(n), true) => {
            if key(ui, kr, Id::unique("probe"), "READ", false, None).clicked() {
                app.probe = None;
                app.send(Cmd::Read(a, n));
            }
        }
        _ => key_off(ui, kr, "READ"),
    }
    let p = ui.painter();
    let cs = match (addr, size) {
        (Some(a), Some(n)) => format!("sum {:02X}", checksum(&[&a[..], &sysex::addr(n)[..]].concat())),
        _ => "bad address or size".into(),
    };
    text(p, pos2(r.right(), ly + 25.0), Align2::RIGHT_CENTER, &cs, F::Mono, 9.5, SILK2);
    // result as a hex dump
    let dr = Rect::from_min_max(pos2(r.left(), ly + 50.0), r.max);
    let g = glass(ui, dr);
    let p = ui.painter();
    match (&app.probe, addr) {
        (Some(Ok(d)), Some(a)) => {
            let base = sysex::lin(a);
            let rows = ((g.height() - 10.0) / 18.0).floor() as usize;
            for (k, chunk) in d.chunks(8).take(rows.max(1)).enumerate() {
                let y = g.top() + 14.0 + k as f32 * 18.0;
                text(p, pos2(g.left() + 10.0, y), Align2::LEFT_CENTER, &hex(&sysex::addr(base + 8 * k as u32)), F::Mono, 10.0, mix(lit(), BLACK, 0.45));
                vfd(p, pos2(g.left() + 104.0, y), Align2::LEFT_CENTER, &hex(chunk), F::MonoB, 10.0);
                let ascii: String = chunk.iter().map(|&b| if (0x20..0x7F).contains(&b) { b as char } else { '·' }).collect();
                vfd(p, pos2(g.right() - 10.0, y), Align2::RIGHT_CENTER, &ascii, F::MonoB, 10.0);
            }
            if let Some(prm) = app.cat.at(a).filter(|prm| prm.size <= d.len()) {
                let raw = sysex::decode_value(&d[..prm.size]);
                vfd(p, pos2(g.right() - 10.0, g.bottom() - 10.0), Align2::RIGHT_CENTER, &format!("{} = {}", prm.name, display(prm, raw)), F::Mono, 9.5);
            }
        }
        (Some(Err(e)), _) => {
            vfd_max(p, pos2(g.left() + 10.0, g.center().y), Align2::LEFT_CENTER, &e.to_uppercase(), F::Mono, 10.0, g.width() - 20.0);
        }
        _ => {
            text(p, pos2(g.left() + 10.0, g.center().y), Align2::LEFT_CENTER, "NO READ YET", F::Mono, 10.0, mix(lit(), BLACK, 0.45));
        }
    }
}
