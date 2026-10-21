//! Tsuba: an editor for the BOSS KATANA-50 MK1. Look: design/DESIGN.md. Protocol and data: the `katana` crate.

#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")] // no console window in release builds

mod editor;
mod effects;
mod monitor;
mod theme;
mod widgets;
mod worker;

use std::collections::BTreeMap;
use std::path::PathBuf;
use std::sync::mpsc::{Receiver, Sender};

use eframe::egui::{self, pos2, vec2, Align2, Color32, Id, Key, Modifiers, Rect, Sense, Stroke, StrokeKind, Ui};
use katana::catalog::Param;
use katana::sysex::{self, Addr};
use katana::{Catalog, Memory, Tone};
use theme::*;
use worker::{Cmd, Link, LogEntry, Update};

pub const VERSION: &str = "0.1";

/// Playable channels: slot, label, pip colour.
pub const CHANNELS: [(u8, &str, Color32); 5] =
    [(0, "PANEL", TEXT_3), (1, "A:CH1", SAND), (2, "A:CH2", STEEL), (5, "B:CH1", MUSTARD), (6, "B:CH2", CORAL)];

pub fn channel_label(slot: Option<u8>) -> &'static str {
    CHANNELS.iter().find(|c| Some(c.0) == slot).map_or("—", |c| c.1)
}

#[derive(Clone, Copy, PartialEq)]
pub enum Tab {
    Editor,
    Effects,
    Monitor,
}

pub struct App {
    pub cat: &'static Catalog,
    tx: Sender<Cmd>,
    rx: Receiver<Update>,
    pub link: Link,
    /// Edit-buffer image (what the amp plays now), kept in sync from the amp's pushes.
    pub mem: Memory,
    pub loaded: bool,
    /// Stored slots, rebased onto edit-buffer addresses.
    pub stored: BTreeMap<u8, Memory>,
    pub current: Option<u8>,
    pub log: Vec<LogEntry>,
    pub probe: Option<Result<Vec<u8>, String>>,
    pub tab: Tab,
    pub tones: Vec<(PathBuf, Tone)>,
    pub notice: Option<(String, f64)>,
    pub ed: editor::State,
    pub fx: effects::State,
    pub mon: monitor::State,
}

impl App {
    fn new(cc: &eframe::CreationContext) -> App {
        theme::install(&cc.egui_ctx);
        let args: Vec<String> = std::env::args().collect();
        let demo = args.iter().any(|a| a == "--demo");
        let (tx, rx) = if demo {
            // no amp: a channel pair nobody listens on
            let (tx, _) = std::sync::mpsc::channel();
            (tx, std::sync::mpsc::channel().1)
        } else {
            worker::spawn(cc.egui_ctx.clone())
        };
        let mut app = App {
            cat: Box::leak(Box::new(Catalog::load())),
            tx,
            rx,
            link: Link::Searching("starting".into()),
            mem: Memory::new(),
            loaded: false,
            stored: BTreeMap::new(),
            current: None,
            log: vec![],
            probe: None,
            tab: Tab::Editor,
            tones: vec![],
            notice: None,
            ed: Default::default(),
            fx: Default::default(),
            mon: Default::default(),
        };
        app.load_tones();
        if demo {
            app.demo();
        }
        app.tab = match args.iter().position(|a| a == "--tab").and_then(|i| args.get(i + 1)).map(String::as_str) {
            Some("effects") => Tab::Effects,
            Some("monitor") => Tab::Monitor,
            _ => Tab::Editor,
        };
        app
    }

    /// `--demo`: a believable edit buffer without an amp (UI work on a machine with no KATANA): zeros, the
    /// standard chain, and the first tone in tones/.
    fn demo(&mut self) {
        let mut mem: Memory = self.cat.params.iter().flat_map(|p| (0..p.size as u32).map(|i| (sysex::lin(p.addr) + i, 0))).collect();
        store(&mut mem, katana::amp::CHAIN, &[17, 11, 15, 5, 2, 13, 12, 4, 1, 7, 6, 8, 9, 18, 0, 3, 10, 14, 19, 16]);
        store(&mut mem, [0x60, 0, 0, 0], b"Glass Clean     ");
        if let Some((_, t)) = self.tones.iter().find(|t| t.1.name.contains("Dreamy")).or(self.tones.first()) {
            for (a, d) in self.cat.encode_tone(t).0 {
                store(&mut mem, a, &d);
            }
        }
        self.link = Link::Online { dev: 0 };
        self.loaded = true;
        self.current = Some(2);
        for (slot, ..) in CHANNELS {
            self.stored.insert(slot, mem.clone());
        }
        self.mem = mem;
    }

    pub fn online(&self) -> bool {
        matches!(self.link, Link::Online { .. })
    }

    pub fn send(&self, c: Cmd) {
        let _ = self.tx.send(c);
    }

    pub fn param(&self, name: &str) -> &'static Param {
        self.cat.get(name).unwrap_or_else(|| panic!("no parameter {name}"))
    }

    pub fn raw(&self, p: &Param) -> Option<u32> {
        p.raw(&self.mem)
    }

    /// Display text of a parameter, uppercase, "—" when not loaded.
    pub fn shown(&self, p: &Param) -> String {
        match self.raw(p).map(|r| p.display(r)) {
            Some(serde_json::Value::String(s)) => s.to_uppercase(),
            Some(v) => v.to_string(),
            None => "—".into(),
        }
    }

    /// Change one parameter: the image updates now, the amp a tick later.
    pub fn set(&mut self, p: &Param, raw: u32) {
        if !self.online() || p.locked.is_some_and(|l| l != raw) {
            return;
        }
        let bytes = p.bytes(raw);
        store(&mut self.mem, p.addr, &bytes);
        self.send(Cmd::Write(p.addr, bytes));
    }

    pub fn patch_name(mem: &Memory) -> Option<String> {
        let base = sysex::lin([0x60, 0, 0, 0]);
        let b: Option<Vec<u8>> = (0..16).map(|i| mem.get(&(base + i)).copied()).collect();
        Some(String::from_utf8_lossy(&b?).trim().to_string())
    }

    /// Edit-buffer bytes that differ from the selected slot as stored.
    fn diff(&self) -> Vec<(Addr, Vec<u8>)> {
        let Some(st) = self.current.and_then(|s| self.stored.get(&s)) else { return vec![] };
        st.iter().filter(|(a, b)| self.mem.get(a).is_some_and(|m| m != *b)).map(|(a, b)| (sysex::addr(*a), vec![*b])).collect()
    }

    pub fn unsaved(&self) -> bool {
        self.online() && !self.diff().is_empty()
    }

    pub fn revert(&mut self) {
        let d = self.diff();
        for (a, b) in &d {
            store(&mut self.mem, *a, b);
        }
        self.send(Cmd::WriteMany(d));
    }

    pub fn write_to_amp(&mut self) {
        if let (true, Some(slot)) = (self.online(), self.current) {
            self.send(Cmd::Save(slot));
            self.stored.insert(slot, self.mem.clone());
            self.say(format!("WRITTEN TO {}", channel_label(Some(slot))));
        }
    }

    pub fn say(&mut self, s: String) {
        self.notice = Some((s, 0.0));
    }

    fn tones_dir() -> PathBuf {
        // the repo's tones/ when run from a checkout, else next to the executable
        let here = PathBuf::from("tones");
        if here.is_dir() {
            return here;
        }
        let dir = std::env::current_exe().ok().and_then(|p| p.parent().map(|d| d.join("tones"))).unwrap_or(here);
        let _ = std::fs::create_dir_all(&dir);
        dir
    }

    pub fn load_tones(&mut self) {
        let mut tones: Vec<(PathBuf, Tone)> = std::fs::read_dir(Self::tones_dir())
            .into_iter()
            .flatten()
            .flatten()
            .map(|e| e.path())
            .filter(|p| p.extension().is_some_and(|e| e == "json"))
            .filter_map(|p| Some((p.clone(), serde_json::from_str(&std::fs::read_to_string(&p).ok()?).ok()?)))
            .collect();
        tones.sort_by_key(|t| t.1.name.to_lowercase());
        self.tones = tones;
    }

    pub fn apply_tone(&mut self, i: usize) {
        if !self.online() {
            return self.say("AMP NOT CONNECTED".into());
        }
        let (writes, skipped) = self.cat.encode_tone(&self.tones[i].1);
        for (a, d) in &writes {
            store(&mut self.mem, *a, d);
        }
        self.send(Cmd::WriteMany(writes));
        let name = self.tones[i].1.name.to_uppercase();
        self.say(if skipped.is_empty() { format!("LOADED {name}") } else { format!("LOADED {name} · {} SKIPPED", skipped.len()) });
    }

    /// Save the edit buffer as a new tone file.
    pub fn save_tone(&mut self) {
        let name = Self::patch_name(&self.mem).filter(|n| !n.is_empty()).unwrap_or_else(|| "New tone".into());
        let stem: String = name.chars().map(|c| if c.is_ascii_alphanumeric() { c.to_ascii_lowercase() } else { '-' }).collect();
        let dir = Self::tones_dir();
        let path = (1..).map(|i| dir.join(if i == 1 { format!("{stem}.json") } else { format!("{stem}-{i}.json") }))
            .find(|p| !p.exists())
            .unwrap();
        let tone = self.cat.export(&self.mem, &name);
        match std::fs::write(&path, serde_json::to_string_pretty(&tone).unwrap()) {
            Ok(()) => self.say(format!("SAVED {}", path.file_name().unwrap().to_string_lossy().to_uppercase())),
            Err(e) => self.say(format!("SAVE FAILED: {e}")),
        }
        self.load_tones();
    }

    fn apply(&mut self, u: Update) {
        match u {
            Update::Link(l) => {
                if !matches!(l, Link::Online { .. }) {
                    self.loaded = false;
                    self.stored.clear();
                }
                self.link = l;
            }
            Update::EditBuffer(m) => {
                self.mem = m;
                self.loaded = true;
            }
            Update::Slot(s, m) => {
                self.stored.insert(s, m);
            }
            Update::Current(s) => self.current = Some(s),
            Update::Bytes(a, d) => {
                if a[0] == 0x60 {
                    store(&mut self.mem, a, &d);
                }
            }
            Update::Probe(r) => self.probe = Some(r),
            Update::Log(e) => {
                if !self.mon.paused {
                    self.log.push(e);
                    if self.log.len() > 5000 {
                        self.log.drain(..1000);
                    }
                }
            }
        }
    }
}

pub fn store(mem: &mut Memory, a: Addr, data: &[u8]) {
    let base = sysex::lin(a);
    mem.extend(data.iter().enumerate().map(|(i, &b)| (base + i as u32, b)));
}

impl eframe::App for App {
    fn ui(&mut self, ui: &mut Ui, _frame: &mut eframe::Frame) {
        while let Ok(u) = self.rx.try_recv() {
            self.apply(u);
        }
        let ctx = ui.ctx().clone();
        if ctx.input_mut(|i| i.consume_key(Modifiers::COMMAND, Key::S)) {
            self.write_to_amp();
        }
        let dropped: Vec<PathBuf> = ctx.input(|i| i.raw.dropped_files.iter().map(|f| f.path().to_path_buf()).filter(|p| !p.as_os_str().is_empty()).collect());
        if !dropped.is_empty() {
            let dir = Self::tones_dir();
            let n = dropped.iter().filter(|p| p.file_name().is_some_and(|f| std::fs::copy(p, dir.join(f)).is_ok())).count();
            self.load_tones();
            self.say(format!("IMPORTED {n} TONE FILE{}", if n == 1 { "" } else { "S" }));
        }
        if let Some((_, t)) = &mut self.notice {
            let now = ctx.input(|i| i.time);
            if *t == 0.0 {
                *t = now;
            }
            if now - *t > 4.0 {
                self.notice = None;
            } else {
                ctx.request_repaint_after(std::time::Duration::from_millis(250));
            }
        }

        let full = ui.max_rect();
        ui.painter().rect_filled(full, 0.0, BG);
        let top = app_bar(self, ui, full);
        let tabs_bottom = tabs(self, ui, full, top);
        let status_top = full.bottom() - 30.0;
        status_bar(self, ui, Rect::from_min_max(pos2(full.left(), status_top), full.max));

        let body = Rect::from_min_max(pos2(full.left(), tabs_bottom), pos2(full.right(), status_top));
        let mut content = ui.new_child(egui::UiBuilder::new().max_rect(body));
        egui::ScrollArea::vertical().id_salt(self.tab as u8).auto_shrink(false).show(&mut content, |ui| {
            let origin = ui.cursor().min;
            let w = ui.available_width();
            let h = match self.tab {
                Tab::Editor => editor::show(self, ui, origin, w),
                Tab::Effects => effects::show(self, ui, origin, w),
                Tab::Monitor => monitor::show(self, ui, origin, w),
            };
            ui.allocate_rect(Rect::from_min_size(origin, vec2(w, h)), Sense::hover());
        });
    }
}

fn app_bar(app: &App, ui: &Ui, full: Rect) -> f32 {
    let p = ui.painter();
    let (x, cy) = (full.left() + 16.0, full.top() + 22.0);
    let r = text(p, pos2(x, cy), Align2::LEFT_CENTER, "Tsuba", F::Display, 22.0, INK);
    text(p, pos2(r.right() + 2.0, r.top() + 2.0), Align2::LEFT_TOP, "™", F::Display, 9.0, INK);
    let mx = r.right() + 26.0;
    stripes(p, Rect::from_min_size(pos2(mx, cy - 7.0), vec2(20.0, 14.0)), &[CORAL, STEEL, MUSTARD, SAND], 2.0);
    text(p, pos2(mx + 34.0, cy), Align2::LEFT_CENTER, &format!("KATANA EDITOR / {VERSION}"), F::Mono, 11.0, TEXT_2);

    // LINK tag
    let (status, dotc) = match &app.link {
        Link::Online { .. } => ("USB-MIDI · KATANA-50 MK1", SAGE),
        Link::Searching(_) => ("SEARCHING FOR KATANA", MUSTARD),
    };
    let sw = text_w(p, status, F::Mono, 11.0);
    let tag = Rect::from_min_size(pos2(full.right() - 16.0 - (sw + 20.0 + 15.0 + 48.0), cy - 13.0), vec2(sw + 35.0 + 48.0, 26.0));
    p.rect_stroke(tag, 0.0, Stroke::new(1.0, EDGE), StrokeKind::Inside);
    let lr = Rect::from_min_size(tag.min, vec2(48.0, 26.0));
    p.rect_filled(lr, 0.0, INK);
    text(p, lr.center(), Align2::CENTER_CENTER, "LINK", F::Exp, 10.0, INK_ON);
    let t = text(p, pos2(lr.right() + 10.0, cy), Align2::LEFT_CENTER, status, F::Mono, 11.0, INK);
    dot(p, pos2(t.right() + 11.5, cy), 7.0, dotc);
    hline(p, full.left(), full.right(), full.top() + 44.0, LINE);
    full.top() + 45.0
}

fn tabs(app: &mut App, ui: &Ui, full: Rect, top: f32) -> f32 {
    let (y, h) = (top + 6.0, 44.0);
    let mut x = full.left() + 16.0;
    for (i, (tab, name)) in [(Tab::Editor, "EDITOR"), (Tab::Effects, "EFFECTS"), (Tab::Monitor, "MONITOR")].into_iter().enumerate() {
        let p = ui.painter();
        let w = 14.0 + text_w(p, "00", F::Mono, 10.0) + 10.0 + text_w(p, name, F::Exp, 12.0) + 24.0;
        let r = Rect::from_min_size(pos2(x, y), vec2(w, h));
        let resp = ui.interact(r, Id::unique(("tab", i)), Sense::click());
        let p = ui.painter();
        let on = app.tab == tab;
        if on {
            cut_fill(p, r, 10.0, INK);
        } else {
            let c = if resp.hovered() { EDGE } else { LINE };
            p.line(vec![r.left_bottom(), r.left_top() + vec2(0.5, 0.5), r.right_top() + vec2(-0.5, 0.5), r.right_bottom()], Stroke::new(1.0, c));
        }
        let (fg, sub) = if on { (INK_ON, INK_ON) } else { (TEXT_2, TEXT_2) };
        let n = text(p, pos2(r.left() + 14.0, r.center().y), Align2::LEFT_CENTER, &format!("{:02}", i + 1), F::Mono, 10.0, sub);
        text(p, pos2(n.right() + 10.0, r.center().y), Align2::LEFT_CENTER, name, F::Exp, 12.0, fg);
        if resp.has_focus() {
            focus_ring(p, r, 10.0);
        }
        if resp.clicked() {
            app.tab = tab;
        }
        x += w + 4.0;
    }
    let p = ui.painter();
    let ch = format!("CHANNEL / {}", channel_label(app.current));
    text(p, pos2(full.right() - 20.0, y + h / 2.0), Align2::RIGHT_CENTER, &ch, F::Mono, 11.0, TEXT_3);
    if let Some((msg, _)) = &app.notice {
        let r = text(p, pos2(x + 20.0, y + h / 2.0), Align2::LEFT_CENTER, msg, F::Mono, 11.0, INK);
        dot(p, pos2(r.left() - 10.0, r.center().y), 6.0, ACCENT);
    }
    hline(p, full.left(), full.right(), y + h, LINE);
    y + h + 1.0
}

fn status_bar(app: &App, ui: &Ui, r: Rect) {
    let p = ui.painter();
    hline(p, r.left(), r.right(), r.top(), LINE);
    let cy = r.center().y;
    let right = text(p, pos2(r.right() - 16.0, cy), Align2::RIGHT_CENTER, &format!("CTRL+S / WRITE     TSUBA {VERSION}"), F::Mono, 10.0, TEXT_3);
    let (dotc, items) = match &app.link {
        Link::Online { dev } => (SAGE, vec![
            "ONLINE".to_string(),
            (if app.loaded { "BUFFER / SYNCED" } else { "BUFFER / LOADING" }).to_string(),
            format!("DEVICE ID / {dev:02X}H"),
            format!("SLOTS / {} OF 5", app.stored.len().min(5)),
        ]),
        Link::Searching(why) => (MUSTARD, vec!["SEARCHING".to_string(), why.to_uppercase()]),
    };
    dot(p, pos2(r.left() + 19.0, cy), 6.0, dotc);
    let mut x = r.left() + 28.0;
    for (i, s) in items.iter().enumerate() {
        let max = right.left() - 20.0 - x;
        let t = text_max(p, pos2(x, cy), Align2::LEFT_CENTER, s, F::Mono, 10.0, if i == 0 { INK } else { TEXT_3 }, max.max(0.0));
        x = t.right() + 20.0;
    }
}

fn main() -> eframe::Result {
    let options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default()
            .with_title("Tsuba")
            .with_inner_size([1440.0, 900.0])
            .with_min_inner_size([1340.0, 720.0]) // the AMP panel's six knobs need ~1340
            .with_drag_and_drop(true),
        ..Default::default()
    };
    eframe::run_native("Tsuba", options, Box::new(|cc| Ok(Box::new(App::new(cc)))))
}
