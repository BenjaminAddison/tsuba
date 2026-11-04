//! Tsuba: an editor for the BOSS KATANA-50 MK1. Look: design/DESIGN.md ("Outboard"). Protocol and data: the
//! `katana` crate.

#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")] // no console window in release builds

mod chain;
mod control;
mod editor;
mod effects;
mod graph;
mod library;
mod monitor;
mod palette;
mod theme;
mod widgets;
mod worker;

use std::collections::{BTreeMap, HashMap, VecDeque};
use std::path::PathBuf;
use std::sync::mpsc::{Receiver, Sender};

use eframe::egui::{self, pos2, vec2, Align2, Id, Key, Modifiers, Rect, Sense, Ui};
use katana::catalog::Param;
use katana::sysex::{self, Addr};
use katana::{Catalog, Memory, Tone};
use theme::*;
use widgets::*;
use worker::{Cmd, Dir, Link, LogEntry, Update};

pub const VERSION: &str = "0.2";

/// Playable channels: slot, label.
pub const CHANNELS: [(u8, &str); 5] = [(0, "PANEL"), (1, "A:CH1"), (2, "A:CH2"), (5, "B:CH1"), (6, "B:CH2")];

pub fn channel_label(slot: Option<u8>) -> &'static str {
    CHANNELS.iter().find(|c| Some(c.0) == slot).map_or("—", |c| c.1)
}

#[derive(Clone, Copy, PartialEq)]
pub enum Tab {
    Editor,
    Effects,
    Control,
    Library,
    Monitor,
}

pub const TABS: [(Tab, &str); 5] =
    [(Tab::Editor, "EDITOR"), (Tab::Effects, "EFFECTS"), (Tab::Control, "CONTROL"), (Tab::Library, "LIBRARY"), (Tab::Monitor, "MONITOR")];

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
    /// Parameters that differ from the stored slot (this frame).
    pub changes: Vec<&'static Param>,
    /// The parameter last touched: the patch display and the Effects PARAMETER panel show it.
    pub touched: Option<&'static Param>,
    pub renaming: Option<String>,
    /// Ping round trip (ms), link drops, and when traffic last went each way (LED flicker, rates).
    pub rtt: Option<f32>,
    pub drops: u32,
    pub traffic: VecDeque<(f64, Dir)>,
    meter: Option<katana::audio::Meter>,
    meter_try: f64,
    pub meter_err: Option<String>,
    /// Smoothed USB output peaks, 0–1.
    pub level: [f32; 2],
    owner: HashMap<u32, &'static Param>,
    pub demo: bool,
    pub ed: editor::State,
    pub chain: chain::State,
    pub fx: effects::State,
    pub ctl: control::State,
    pub lib: library::State,
    pub mon: monitor::State,
    pub pal: palette::State,
}

impl App {
    fn new(cc: &eframe::CreationContext) -> App {
        if let Some(i) = load_lamp() {
            set_lamp(i);
        }
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
        let cat: &'static Catalog = Box::leak(Box::new(Catalog::load()));
        let owner = cat.params.iter().flat_map(|p| (0..p.size as u32).map(move |i| (sysex::lin(p.addr) + i, p))).collect();
        let mut app = App {
            cat,
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
            changes: vec![],
            touched: None,
            renaming: None,
            rtt: None,
            drops: 0,
            traffic: VecDeque::new(),
            meter: None,
            meter_try: -10.0,
            meter_err: None,
            level: [0.0; 2],
            owner,
            demo,
            ed: Default::default(),
            chain: Default::default(),
            fx: Default::default(),
            ctl: Default::default(),
            lib: Default::default(),
            mon: Default::default(),
            pal: Default::default(),
        };
        app.load_tones();
        if demo {
            app.demo();
        }
        app.tab = match args.iter().position(|a| a == "--tab").and_then(|i| args.get(i + 1)).map(String::as_str) {
            Some("effects") => Tab::Effects,
            Some("control") => Tab::Control,
            Some("library") => Tab::Library,
            Some("monitor") => Tab::Monitor,
            _ => Tab::Editor,
        };
        if let Some(q) = args.iter().position(|a| a == "--palette").and_then(|i| args.get(i + 1)) {
            app.pal.open_with(q);
        }
        app
    }

    /// `--demo`: a believable edit buffer without an amp (UI work on a machine with no KATANA): zeros, the
    /// standard chain, and the first tone in tones/. The stored slots get the plain buffer, so the tone shows as edits.
    fn demo(&mut self) {
        let mut mem: Memory = self.cat.params.iter().flat_map(|p| (0..p.size as u32).map(|i| (sysex::lin(p.addr) + i, 0))).collect();
        // signed parameters at 0, and a few plausible settings
        for p in &self.cat.params {
            if p.min < 0 && p.options.is_empty() {
                store(&mut mem, p.addr, &p.bytes(((0.0 - p.min as f64) / p.step) as u32));
            }
        }
        let defaults = [
            ("PREAMP A: ON/OFF", "1"), ("PREAMP A: LEVEL", "50"), ("PATCH LEVEL", "100"), ("MASTER BPM", "120"),
            ("MASTER EQ: MID FREQ", "\"800Hz\""), ("MASTER EQ: MID Q", "\"1\""), ("MASTER EQ: LOW GAIN", "2"), ("MASTER EQ: HIGH GAIN", "1"),
            ("FOOT VOLUME: LEVEL", "100"), ("NS1: THRESHOLD", "35"), ("NS1: ON/OFF", "\"ON\""), ("PREAMP A: SOLO LEVEL", "65"),
        ];
        for (n, v) in defaults {
            if let Ok((a, d)) = self.cat.encode(n, &serde_json::from_str(v).unwrap()) {
                store(&mut mem, a, &d);
            }
        }
        store(&mut mem, katana::amp::CHAIN, &[17, 11, 15, 5, 2, 13, 12, 4, 1, 7, 6, 8, 9, 18, 0, 3, 10, 14, 19, 16]);
        store(&mut mem, [0x60, 0, 0, 0], b"Glass Clean     ");
        for (slot, ..) in CHANNELS {
            self.stored.insert(slot, mem.clone());
        }
        if let Some((_, t)) = self.tones.iter().find(|t| t.1.name.contains("Dreamy")).or(self.tones.first()) {
            for (a, d) in self.cat.encode_tone(t).0 {
                store(&mut mem, a, &d);
            }
        }
        let names = ["Panel", "Edge Of Breakup", "Glass Clean", "Brown Lead", "Ambient Swell"];
        for ((slot, ..), n) in CHANNELS.iter().zip(names) {
            let m = self.stored.get_mut(slot).unwrap();
            store(m, [0x60, 0, 0, 0], format!("{n:<16}").as_bytes());
            if *slot == 2 {
                *m = mem.clone();
            }
        }
        self.link = Link::Online { dev: 0 };
        self.rtt = Some(3.1);
        self.loaded = true;
        self.current = Some(2);
        // a few edits so the memory ticks and DIFF have something to show
        for (n, d) in [("PREAMP A: GAIN", 7i32), ("PREAMP A: TREBLE", 6), ("PREAMP A: PRESENCE", 7)] {
            let p = self.param(n);
            let r = p.raw(&mem).unwrap_or(0) as i32 + d;
            store(&mut mem, p.addr, &p.bytes(r.max(0) as u32));
        }
        // traffic for the Monitor to show
        let gain = self.param("PREAMP A: GAIN");
        let tre = self.param("PREAMP A: TREBLE");
        let fb = self.cat.get("DELAY: F.BACK").map(|p| p.addr).unwrap_or([0x60, 0, 5, 0x64]);
        let log: [(f64, Dir, u8, Addr, Vec<u8>); 12] = [
            (0.004, Dir::Tx, 0x12, [0x7F, 0, 0, 1], vec![1]),
            (0.019, Dir::Tx, 0x11, [0, 1, 0, 0], vec![0, 0, 0, 2]),
            (0.031, Dir::Rx, 0x12, [0, 1, 0, 0], vec![0, 2]),
            (0.046, Dir::Tx, 0x11, [0x60, 0, 0, 0], vec![0, 0, 0, 0x10]),
            (0.052, Dir::Rx, 0x12, [0x60, 0, 0, 0], b"Glass Clean     ".to_vec()),
            (0.071, Dir::Tx, 0x11, katana::amp::CHAIN, vec![0, 0, 0, 0x14]),
            (0.084, Dir::Rx, 0x12, katana::amp::CHAIN, vec![17, 11, 15, 5, 2, 13, 12, 4, 1, 7, 6, 8, 9, 18, 0, 3, 10, 14, 19, 16]),
            (73.882, Dir::Tx, 0x12, gain.addr, gain.bytes(42)),
            (73.901, Dir::Rx, 0x12, gain.addr, gain.bytes(42)),
            (74.206, Dir::Tx, 0x12, tre.addr, tre.bytes(51)),
            (75.040, Dir::Rx, 0x12, [0, 0, 4, 0x25], vec![58]),
            (98.090, Dir::Tx, 0x12, fb, vec![30]),
        ];
        self.log = log.into_iter().map(|(t, dir, cmd, addr, data)| LogEntry { t, dir, cmd, addr, data }).collect();
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

    /// The value stored in the current channel, when known.
    pub fn stored_raw(&self, p: &Param) -> Option<u32> {
        self.current.and_then(|s| self.stored.get(&s)).and_then(|m| p.raw(m))
    }

    pub fn edited(&self, p: &Param) -> bool {
        match (self.raw(p), self.stored_raw(p)) {
            (Some(a), Some(b)) => a != b,
            _ => false,
        }
    }

    /// Display text of a parameter, uppercase, "—" when not loaded.
    pub fn shown(&self, p: &Param) -> String {
        self.raw(p).map_or("—".into(), |r| display(p, r))
    }

    /// Change one parameter: the image updates now, the amp a tick later.
    pub fn set(&mut self, p: &'static Param, raw: u32) {
        self.touched = Some(p);
        if !self.online() || p.locked.is_some_and(|l| l != raw) {
            return;
        }
        let bytes = p.bytes(raw);
        store(&mut self.mem, p.addr, &bytes);
        self.send(Cmd::Write(p.addr, bytes));
    }

    /// Set a parameter by display value (a label or a number), as the palette and the CLI take them.
    pub fn set_text(&mut self, name: &str, v: &str) -> Result<String, String> {
        let p = self.cat.get(name).ok_or_else(|| format!("no parameter {name:?}"))?;
        let label = p.options.iter().find(|o| o.1.eq_ignore_ascii_case(v)).map(|o| serde_json::Value::String(o.1.clone()));
        let val = label.unwrap_or_else(|| serde_json::from_str(v).unwrap_or(serde_json::Value::String(v.into())));
        let (_, bytes) = self.cat.encode(name, &val)?;
        let raw = sysex::decode_value(&bytes);
        if !self.online() {
            return Err("amp not connected".into());
        }
        self.set(p, raw);
        Ok(format!("{} = {}", p.name, display(p, raw)))
    }

    pub fn patch_name(mem: &Memory) -> Option<String> {
        let base = sysex::lin([0x60, 0, 0, 0]);
        let b: Option<Vec<u8>> = (0..16).map(|i| mem.get(&(base + i)).copied()).collect();
        Some(String::from_utf8_lossy(&b?).trim_end().to_string())
    }

    pub fn rename(&mut self, name: &str) {
        let clean: String = name.chars().filter(|c| c.is_ascii() && !c.is_ascii_control()).take(16).collect();
        let bytes = format!("{clean:<16}").into_bytes();
        if self.online() {
            store(&mut self.mem, [0x60, 0, 0, 0], &bytes);
            self.send(Cmd::Write([0x60, 0, 0, 0], bytes));
        }
    }

    /// Edit-buffer bytes that differ from the selected slot as stored.
    fn diff(&self) -> Vec<(Addr, Vec<u8>)> {
        let Some(st) = self.current.and_then(|s| self.stored.get(&s)) else { return vec![] };
        st.iter().filter(|(a, b)| self.mem.get(a).is_some_and(|m| m != *b)).map(|(a, b)| (sysex::addr(*a), vec![*b])).collect()
    }

    pub fn unsaved(&self) -> bool {
        self.online() && !self.changes.is_empty()
    }

    pub fn revert(&mut self) {
        let d = self.diff();
        for (a, b) in &d {
            store(&mut self.mem, *a, b);
        }
        self.send(Cmd::WriteMany(d));
    }

    /// Put these parameters back to their stored values.
    pub fn revert_params(&mut self, ps: &[&'static Param]) {
        let Some(st) = self.current.and_then(|s| self.stored.get(&s)) else { return };
        let writes: Vec<(Addr, Vec<u8>)> = ps.iter().filter_map(|p| p.raw(st).map(|r| (p.addr, p.bytes(r)))).collect();
        for (a, d) in &writes {
            store(&mut self.mem, *a, d);
        }
        if self.online() {
            self.send(Cmd::WriteMany(writes));
        }
    }

    pub fn write_to_amp(&mut self) {
        if let (true, Some(slot)) = (self.online(), self.current) {
            self.send(Cmd::Save(slot));
            self.stored.insert(slot, self.mem.clone());
            self.say(format!("WRITTEN TO {}", channel_label(Some(slot))));
        }
    }

    pub fn select(&mut self, slot: u8) {
        if self.online() {
            self.send(Cmd::Select(slot));
            if self.demo {
                self.current = Some(slot);
                if let Some(m) = self.stored.get(&slot) {
                    self.mem = m.clone();
                }
            }
        }
    }

    pub fn say(&mut self, s: String) {
        self.notice = Some((s, 0.0));
    }

    pub fn tones_dir() -> PathBuf {
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

    /// Load a tone into the edit buffer (not saved: WRITE keeps it).
    pub fn apply(&mut self, tone: &Tone) {
        if !self.online() {
            return self.say("AMP NOT CONNECTED".into());
        }
        let (writes, skipped) = self.cat.encode_tone(tone);
        for (a, d) in &writes {
            store(&mut self.mem, *a, d);
        }
        self.send(Cmd::WriteMany(writes));
        let name = tone.name.to_uppercase();
        self.say(if skipped.is_empty() { format!("LOADED {name}") } else { format!("LOADED {name} · {} SKIPPED", skipped.len()) });
    }

    pub fn apply_tone(&mut self, i: usize) {
        let t = self.tones[i].1.clone();
        self.apply(&t);
    }

    fn file_stem(name: &str) -> String {
        name.chars().map(|c| if c.is_ascii_alphanumeric() { c.to_ascii_lowercase() } else { '-' }).collect()
    }

    /// Save the edit buffer as a new tone file.
    pub fn save_tone(&mut self) {
        let name = Self::patch_name(&self.mem).filter(|n| !n.is_empty()).unwrap_or_else(|| "New tone".into());
        let stem = Self::file_stem(&name);
        let dir = Self::tones_dir();
        let path = (1..).map(|i| dir.join(if i == 1 { format!("{stem}.json") } else { format!("{stem}-{i}.json") })).find(|p| !p.exists()).unwrap();
        let tone = self.cat.export(&self.mem, &name);
        match std::fs::write(&path, serde_json::to_string_pretty(&tone).unwrap()) {
            Ok(()) => self.say(format!("SAVED {}", path.file_name().unwrap().to_string_lossy().to_uppercase())),
            Err(e) => self.say(format!("SAVE FAILED: {e}")),
        }
        self.load_tones();
        self.lib.sel = self.tones.iter().position(|t| t.0 == path);
    }

    fn update(&mut self, u: Update, now: f64) {
        match u {
            Update::Link(l) => {
                if !matches!(l, Link::Online { .. }) {
                    if self.online() {
                        self.drops += 1;
                    }
                    self.loaded = false;
                    self.stored.clear();
                    self.rtt = None;
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
            Update::Rtt(ms) => self.rtt = Some(ms),
            Update::Log(e) => {
                self.traffic.push_back((now, e.dir));
                if !self.mon.paused {
                    self.log.push(e);
                    if self.log.len() > 5000 {
                        self.log.drain(..1000);
                    }
                }
            }
        }
    }

    /// The parameters behind the differing bytes.
    fn changed_params(&self) -> Vec<&'static Param> {
        let mut out: Vec<&'static Param> = vec![];
        for (a, _) in self.diff() {
            if let Some(p) = self.owner.get(&sysex::lin(a)) {
                if !out.iter().any(|q| std::ptr::eq(*q, *p)) {
                    out.push(p);
                }
            }
        }
        out
    }

    pub fn traffic_since(&self, dir: Dir, secs: f64, now: f64) -> usize {
        self.traffic.iter().filter(|t| t.1 == dir && now - t.0 <= secs).count()
    }

    fn poll_meter(&mut self, now: f64) {
        if !self.online() || self.demo {
            self.meter = None;
            if self.demo {
                // something believable to look at
                let t = now as f32;
                self.level = [0.55 + 0.12 * (t * 3.1).sin() * (t * 0.7).cos(), 0.5 + 0.1 * (t * 2.3).sin()];
            }
            return;
        }
        if self.meter.is_none() && now - self.meter_try > 5.0 {
            self.meter_try = now;
            match katana::audio::Meter::open() {
                Ok(m) => {
                    self.meter = Some(m);
                    self.meter_err = None;
                }
                Err(e) => self.meter_err = Some(e.to_string()),
            }
        }
        if let Some(m) = &self.meter {
            let pk = m.take_peaks();
            for (l, p) in self.level.iter_mut().zip(pk) {
                *l = p.max(*l * 0.9);
            }
        }
    }
}

/// Display text of a raw value, uppercase.
pub fn display(p: &Param, raw: u32) -> String {
    match p.display(raw) {
        serde_json::Value::String(s) => s.to_uppercase(),
        v => v.to_string(),
    }
}

pub fn store(mem: &mut Memory, a: Addr, data: &[u8]) {
    let base = sysex::lin(a);
    mem.extend(data.iter().enumerate().map(|(i, &b)| (base + i as u32, b)));
}

// --- lamp colour setting ----------------------------------------------------------------------------------------

fn lamp_file() -> Option<PathBuf> {
    let base = std::env::var_os("APPDATA")
        .or_else(|| std::env::var_os("XDG_CONFIG_HOME"))
        .map(PathBuf::from)
        .or_else(|| std::env::var_os("HOME").map(|h| PathBuf::from(h).join(".config")))?;
    Some(base.join("tsuba").join("lamp"))
}

fn load_lamp() -> Option<usize> {
    let s = std::fs::read_to_string(lamp_file()?).ok()?;
    LAMPS.iter().position(|l| l.0.eq_ignore_ascii_case(s.trim()))
}

pub fn choose_lamp(ctx: &egui::Context, i: usize) {
    set_lamp(i);
    theme::install_visuals(ctx);
    if let Some(f) = lamp_file() {
        let _ = std::fs::create_dir_all(f.parent().unwrap());
        let _ = std::fs::write(f, LAMPS[i].0);
    }
}

// --- the frame --------------------------------------------------------------------------------------------------

pub const GAP: f32 = 5.0;

impl eframe::App for App {
    fn ui(&mut self, ui: &mut Ui, _frame: &mut eframe::Frame) {
        let ctx = ui.ctx().clone();
        let now = ctx.input(|i| i.time);
        while let Ok(u) = self.rx.try_recv() {
            self.update(u, now);
        }
        while self.traffic.front().is_some_and(|t| now - t.0 > 2.0) {
            self.traffic.pop_front();
        }
        self.changes = if self.loaded { self.changed_params() } else { vec![] };
        self.poll_meter(now);

        if ctx.input_mut(|i| i.consume_key(Modifiers::COMMAND, Key::S)) {
            self.write_to_amp();
        }
        if ctx.input_mut(|i| i.consume_key(Modifiers::COMMAND, Key::K)) {
            self.pal.toggle();
        }
        let dropped: Vec<PathBuf> =
            ctx.input(|i| i.raw.dropped_files.iter().map(|f| f.path().to_path_buf()).filter(|p| !p.as_os_str().is_empty()).collect());
        if !dropped.is_empty() {
            let dir = Self::tones_dir();
            let n = dropped.iter().filter(|p| p.file_name().is_some_and(|f| std::fs::copy(p, dir.join(f)).is_ok())).count();
            self.load_tones();
            self.say(format!("IMPORTED {n} TONE FILE{}", if n == 1 { "" } else { "S" }));
        }
        if let Some((_, t)) = &mut self.notice {
            if *t == 0.0 {
                *t = now;
            }
            if now - *t > 4.0 {
                self.notice = None;
            }
        }
        // wake for what moves: LED flicker, meters, blinks, the notice expiring
        let mut next = (1.0 - (now * 1.9).fract()) / 1.9; // search cursor
        if let Some((_, t)) = self.notice {
            next = next.min((t + 4.0 - now).max(0.0));
        }
        if !self.traffic.is_empty() {
            next = next.min(0.05);
        }
        if self.unsaved() {
            next = next.min((1.0 - (now * 2.0).fract()) / 2.0);
        }
        if self.tab == Tab::Editor && (self.meter.is_some() || self.demo) {
            next = next.min(1.0 / 30.0);
        }
        ctx.request_repaint_after(std::time::Duration::from_secs_f64(next + 0.001));

        let full = ui.max_rect();
        rack_bg(ui.painter(), full);
        let inner = full.shrink2(vec2(12.0, 0.0));
        let top = Rect::from_min_size(pos2(inner.left(), full.top() + 10.0), vec2(inner.width(), 54.0));
        top_bar(self, ui, top);
        let status = Rect::from_min_max(pos2(inner.left(), full.bottom() - 10.0 - 40.0), pos2(inner.right(), full.bottom() - 10.0));
        status_bar(self, ui, status);

        let body = Rect::from_min_max(pos2(full.left(), top.bottom() + GAP), pos2(full.right(), status.top() - GAP));
        let mut content = ui.new_child(egui::UiBuilder::new().max_rect(body));
        content.set_clip_rect(body);
        egui::ScrollArea::vertical().id_salt(self.tab as u8).auto_shrink(false).show(&mut content, |ui| {
            let origin = ui.cursor().min;
            let w = ui.available_width();
            let o = pos2(origin.x + 12.0, origin.y + 6.0);
            let w = w - 24.0;
            let h = match self.tab {
                Tab::Editor => editor::show(self, ui, o, w),
                Tab::Effects => effects::show(self, ui, o, w),
                Tab::Control => control::show(self, ui, o, w),
                Tab::Library => library::show(self, ui, o, w),
                Tab::Monitor => monitor::show(self, ui, o, w),
            };
            ui.allocate_rect(Rect::from_min_size(origin, vec2(w + 24.0, h + 12.0)), Sense::hover());
        });
        palette::show(self, ui);
    }
}

/// Top unit: pilot lamp and device, the five mode keys, the search window (opens the palette) and help.
fn top_bar(app: &mut App, ui: &mut Ui, r: Rect) {
    let face = unit(ui, r, 0);
    let p = ui.painter();
    let cy = face.center().y;
    jewel(p, pos2(face.left() + 24.0, cy), 6.5, led(), app.online());
    silk(p, pos2(face.left() + 44.0, cy - 7.0), Align2::LEFT_CENTER, "KATANA-50 MK1", F::Silk, 11.5, SILK);
    let sub = match &app.link {
        Link::Online { dev } if !app.loaded => format!("DEV {dev:02X} · READING THE BUFFER"),
        Link::Online { dev } if app.stored.len() < CHANNELS.len() => format!("DEV {dev:02X} · READING SLOTS {}/5", app.stored.len()),
        Link::Online { dev } => format!("USB-MIDI · DEV {dev:02X} · {}", app.rtt.map_or("—".into(), |ms| format!("{ms:.1} ms"))),
        Link::Searching(why) => format!("SEARCHING · {}", why.to_uppercase()),
    };
    text_max(p, pos2(face.left() + 44.0, cy + 9.0), Align2::LEFT_CENTER, &sub, F::Mono, 9.0, SILK3, 170.0);
    groove(p, face.left() + 222.0, face.top() + 10.0, face.bottom() - 10.0);
    let mut x = face.left() + 238.0;
    for (tab, name) in TABS {
        let w = text_w(ui.painter(), name, F::Silk2, 9.5) + 28.0;
        let kr = Rect::from_min_size(pos2(x, cy - 10.0), vec2(w, 22.0));
        let on = app.tab == tab;
        if key(ui, kr, Id::unique(("tab", name)), name, on, Some(on)).clicked() {
            app.tab = tab;
        }
        x += w + 8.0;
    }
    // search window: opens the palette
    let help = Rect::from_min_size(pos2(face.right() - 20.0 - 26.0, cy - 11.0), vec2(26.0, 22.0));
    if key(ui, help, Id::unique("help"), "?", false, None).on_hover_text("Commands and shortcuts").clicked() {
        app.pal.open_with("help");
    }
    let p = ui.painter();
    let ck = silk(p, pos2(help.left() - 14.0, cy), Align2::RIGHT_CENTER, "CTRL K", F::Silk2, 9.0, SILK3);
    let sw = (face.width() * 0.2).clamp(200.0, 280.0).min(ck.left() - 14.0 - x);
    if sw > 120.0 {
        let sr = Rect::from_min_max(pos2(ck.left() - 14.0 - sw, face.top() + 8.0), pos2(ck.left() - 14.0, face.bottom() - 8.0));
        let resp = ui.interact(sr, Id::unique("search"), Sense::click());
        let g = glass(ui, sr);
        let p = ui.painter();
        let t = vfd(p, pos2(g.left() + 8.0, g.center().y), Align2::LEFT_CENTER, "SEARCH ▸", F::MonoB, 10.0);
        let blink = (ui.input(|i| i.time) * 1.9) as i64 % 2 == 0;
        if blink {
            p.rect_filled(Rect::from_min_size(pos2(t.right() + 6.0, g.center().y - 6.0), vec2(7.0, 12.0)), 0.0, lit());
        }
        text(p, pos2(t.right() + 18.0, g.center().y), Align2::LEFT_CENTER, "param or command", F::Mono, 10.0, mix(lit(), BLACK, 0.55));
        if resp.clicked() {
            app.pal.toggle();
        }
    }
}

/// The patch unit: channel keys, the dot-matrix name (double-click to rename), DIFF, REVERT and WRITE.
/// `big` is the Editor's version with bank labels and a two-line display. Returns its height.
pub fn patch_unit(app: &mut App, ui: &mut Ui, o: egui::Pos2, w: f32, big: bool) -> f32 {
    let h = if big { 160.0 } else { 70.0 };
    let face = unit(ui, Rect::from_min_size(o, vec2(w, h)), 1);
    let ch = channel_label(app.current);
    let name = App::patch_name(&app.mem).filter(|_| app.loaded).unwrap_or_else(|| if app.online() { "LOADING".into() } else { "NO AMP".into() });
    let changes = app.changes.len();
    let mut keys_y = face.center().y - 11.0;
    if big {
        header(ui.painter(), face, face.top() + 22.0, "PATCH MEMORY", "", "", 1);
        keys_y = face.top() + 92.0;
    } else {
        silk(ui.painter(), pos2(face.left() + 20.0, face.center().y), Align2::LEFT_CENTER, "PATCH", F::Silk, 11.0, SILK);
    }
    // channel keys
    let mut x = face.left() + if big { 20.0 } else { 96.0 };
    let groups: [(&str, &[usize]); 3] = [("LIVE", &[0]), ("BANK A", &[1, 2]), ("BANK B", &[3, 4])];
    for (gi, (label, idx)) in groups.iter().enumerate() {
        if big {
            silk(ui.painter(), pos2(x, keys_y - 36.0), Align2::LEFT_CENTER, label, F::Silk2, 9.0, SILK2);
        }
        for &i in *idx {
            let (slot, full) = CHANNELS[i];
            let short = if big && i > 0 { &full[2..] } else { full };
            let kw = if big { if i == 0 { 62.0 } else { 52.0 } } else { text_w(ui.painter(), full, F::Silk2, 9.0) + 24.0 };
            let kr = Rect::from_min_size(pos2(x, keys_y), vec2(kw, if big { 32.0 } else { 24.0 }));
            let on = app.current == Some(slot);
            let stored = app.stored.get(&slot);
            let tip = stored.and_then(App::patch_name).map(|n| {
                let amp = stored.and_then(|m| app.param("PREAMP A: TYPE").raw(m)).map(|r| display(app.param("PREAMP A: TYPE"), r)).unwrap_or_default();
                format!("{full} · {n} · {amp}")
            });
            let resp = key(ui, kr, Id::unique(("ch", slot)), short, on, Some(on));
            let resp = if let Some(t) = tip { resp.on_hover_text(t) } else { resp };
            if resp.clicked() && !on {
                app.select(slot);
            }
            x += kw + 6.0;
        }
        x += if big { 14.0 + if gi == 0 { 6.0 } else { 0.0 } } else { 0.0 };
    }
    // display
    let right_w = if big { 290.0 } else { 300.0 };
    let dx0 = x + if big { 18.0 } else { 16.0 };
    let dx1 = face.right() - 20.0 - right_w;
    let dr = if big {
        Rect::from_min_max(pos2(dx0, face.top() + 40.0), pos2(dx1.max(dx0 + 260.0), face.bottom() - 14.0))
    } else {
        Rect::from_min_max(pos2(dx0, face.top() + 16.0), pos2(dx1.max(dx0 + 200.0).min(dx0 + 400.0), face.bottom() - 16.0))
    };
    let resp = ui.interact(dr, Id::unique("patch-display"), Sense::click());
    let g = glass(ui, dr);
    if resp.double_clicked() && app.loaded && app.online() {
        app.renaming = Some(name.clone());
    }
    let p = ui.painter();
    if let Some(buf) = app.renaming.as_mut() {
        let row = Rect::from_min_max(pos2(g.left() + 12.0, g.center().y - 18.0), pos2(g.right() - 12.0, g.center().y + 18.0));
        let edit = egui::TextEdit::singleline(buf)
            .frame(egui::Frame::NONE)
            .font(F::Dot.id(if big { 34.0 } else { 22.0 }))
            .text_color(lit())
            .char_limit(16)
            .margin(vec2(0.0, 0.0))
            .desired_width(row.width());
        let r = ui.put(row, edit);
        r.request_focus();
        if ui.input(|i| i.key_pressed(Key::Enter)) {
            let n = buf.clone();
            app.renaming = None;
            app.rename(&n);
        } else if ui.input(|i| i.key_pressed(Key::Escape)) || r.lost_focus() {
            app.renaming = None;
        }
    } else if big {
        // annunciators
        // "A:CH1" splits into bank and channel; "PANEL" and "—" (unknown) have neither
        let (bank, chn) = ch.split_once(':').unwrap_or(("", ""));
        let mut ax = g.left() + 14.0;
        for (t, on) in [("PANEL", ch == "PANEL"), ("A", bank == "A"), ("B", bank == "B"), ("CH1", chn == "CH1"), ("CH2", chn == "CH2"), ("EDIT", changes > 0), ("MIDI", app.online()), ("MEM", changes == 0 && app.loaded)] {
            let r = if on { vfd(p, pos2(ax, g.top() + 14.0), Align2::LEFT_CENTER, t, F::MonoB, 8.5) } else { text(p, pos2(ax, g.top() + 14.0), Align2::LEFT_CENTER, t, F::MonoB, 8.5, dim()) };
            ax = r.right() + 12.0;
        }
        let len = name.chars().count();
        vfd(p, pos2(g.right() - 14.0, g.top() + 14.0), Align2::RIGHT_CENTER, &format!("{len:02}/16"), F::MonoB, 8.5);
        vfd_max(p, pos2(g.left() + 14.0, g.center().y - 2.0), Align2::LEFT_CENTER, &name.to_uppercase(), F::Dot, 32.0, g.width() - 28.0);
        let (l2a, l2b) = line2(app, ch, changes);
        let blink = changes > 0 && app.touched.is_none() && (ui.input(|i| i.time) * 2.0) as i64 % 2 == 0;
        let c2 = if blink { mix(lit(), BLACK, 0.55) } else { lit() };
        glow_text(p, pos2(g.left() + 14.0, g.bottom() - 15.0), Align2::LEFT_CENTER, &l2a, F::Mono, 12.0, f32::INFINITY, c2, 0.12);
        glow_text(p, pos2(g.right() - 14.0, g.bottom() - 15.0), Align2::RIGHT_CENTER, &l2b, F::Mono, 12.0, f32::INFINITY, c2, 0.12);
    } else {
        vfd(p, pos2(g.left() + 10.0, g.center().y), Align2::LEFT_CENTER, ch, F::MonoB, 8.5);
        vfd_max(p, pos2(g.left() + 58.0, g.center().y), Align2::LEFT_CENTER, &name.to_uppercase(), F::Dot, 21.0, g.width() - 110.0);
        let (t, on) = if changes > 0 { ("EDIT", true) } else { ("MEM", app.loaded) };
        if on {
            vfd(p, pos2(g.right() - 10.0, g.center().y), Align2::RIGHT_CENTER, t, F::MonoB, 8.5);
        }
    }
    if resp.hovered() && app.renaming.is_none() {
        resp.on_hover_text("Double-click to rename (16 characters)");
    }

    // right: DIFF, REVERT, WRITE
    let unsaved = app.unsaved();
    let rx1 = face.right() - 20.0;
    let ky = if big { face.top() + 88.0 } else { face.center().y - 12.0 };
    let kh = if big { 32.0 } else { 24.0 };
    let wr = Rect::from_min_size(pos2(rx1 - if big { 96.0 } else { 104.0 }, ky), vec2(if big { 96.0 } else { 104.0 }, kh));
    let can_write = app.online() && app.loaded && app.current.is_some();
    let wlabel = if big { ch.to_string() } else { format!("WRITE {ch}") };
    if can_write {
        let blink = unsaved && (ui.input(|i| i.time) * 2.0) as i64 % 2 == 0;
        if big {
            silk(ui.painter(), pos2(wr.right(), wr.top() - 15.0), Align2::RIGHT_CENTER, "WRITE", F::Silk, 10.0, SILK);
            led_bar(ui.painter(), pos2(wr.right() - 58.0, wr.top() - 15.0), unsaved && !blink);
        } else {
            led_bar(ui.painter(), pos2(wr.left() - 14.0, wr.center().y), unsaved && !blink);
        }
        if key_cap(ui, wr, Id::unique("write"), &wlabel, false, None, Cap::Red).on_hover_text("Write the edit buffer to the channel (Ctrl+S)").clicked() {
            app.write_to_amp();
        }
    } else {
        key_off(ui, wr, &wlabel);
    }
    let rvw = if big { 46.0 } else { 70.0 };
    let rv = Rect::from_min_size(pos2(wr.left() - if big { 24.0 } else { 26.0 } - rvw, ky), vec2(rvw, kh));
    if big {
        silk(ui.painter(), pos2(rv.center().x, rv.top() - 15.0), Align2::CENTER_CENTER, "REVERT", F::Silk2, 9.0, SILK2);
    }
    if unsaved {
        let resp = if big { icon_key(ui, rv, Id::unique("revert"), "Revert unsaved edits", icon_revert) } else { key(ui, rv, Id::unique("revert"), "REVERT", false, None) };
        if resp.clicked() {
            app.revert();
            app.touched = None;
        }
    } else {
        key_off(ui, rv, if big { "—" } else { "REVERT" });
    }
    let dg = Rect::from_min_size(pos2(rv.left() - 14.0 - 44.0, ky - 2.0), vec2(44.0, kh + 4.0));
    let p = ui.painter();
    if big {
        silk(p, pos2(dg.center().x, rv.top() - 15.0), Align2::CENTER_CENTER, "DIFF", F::Silk2, 9.0, SILK2);
    } else {
        silk(p, pos2(dg.left() - 10.0, dg.center().y), Align2::RIGHT_CENTER, "DIFF", F::Silk2, 9.0, SILK2);
    }
    let gg = glass(ui, dg);
    let dtext = if app.loaded { format!("{:02}", changes.min(99)) } else { "--".into() };
    vfd(ui.painter(), gg.center(), Align2::CENTER_CENTER, &dtext, F::Dot, if big { 20.0 } else { 15.0 });
    if changes > 0 {
        let list: Vec<String> = app.changes.iter().take(20).map(|p| format!("{} = {}", p.name, app.shown(p))).collect();
        ui.interact(dg, Id::unique("diff"), Sense::hover()).on_hover_text(list.join("\n"));
    }
    h
}

/// The display's second line: the touched parameter against memory, else the channel's state.
fn line2(app: &App, ch: &str, changes: usize) -> (String, String) {
    if !app.online() {
        return ("PLUG IN THE KATANA OVER USB".into(), "CLOSE TONE STUDIO".into());
    }
    if !app.loaded {
        return ("READING THE AMP".into(), String::new());
    }
    if let Some(p) = app.touched {
        let (v, s) = (app.raw(p), app.stored_raw(p));
        let a = format!("{}  {}", p.label.to_uppercase(), app.shown(p));
        let b = match (v, s) {
            (Some(v), Some(s)) if v != s => format!("{}{}  MEM {}", if v > s { "▲" } else { "▼" }, (p.number(v) - p.number(s)).abs(), display(p, s)),
            _ => "AT MEMORY".into(),
        };
        return (a, b);
    }
    if changes > 0 {
        (format!("{ch}  EDITED"), format!("{changes} CHANGE{} ▸ WRITE", if changes == 1 { "" } else { "S" }))
    } else {
        (format!("{ch}  STORED"), "IN SYNC".into())
    }
}

/// Bottom unit: MIDI lamps, traffic counters, a hint (or the latest notice) and the lamp colour.
fn status_bar(app: &mut App, ui: &mut Ui, r: Rect) {
    let face = unit(ui, r, 9);
    let now = ui.input(|i| i.time);
    let p = ui.painter();
    let cy = face.center().y;
    let mut x = face.left() + 20.0;
    x = silk(p, pos2(x, cy), Align2::LEFT_CENTER, "MIDI", F::Silk2, 9.0, SILK2).right() + 14.0;
    let recent = |d: Dir| app.traffic.iter().rev().take_while(|t| now - t.0 < 0.09).any(|t| t.1 == d);
    for (label, on) in [("IN", recent(Dir::Rx)), ("OUT", recent(Dir::Tx)), ("EDITOR MODE", app.online())] {
        led_dot(p, pos2(x + 3.0, cy), 5.0, on);
        x = silk(p, pos2(x + 10.0, cy), Align2::LEFT_CENTER, label, F::Silk2, 9.0, SILK2).right() + 14.0;
    }
    let tx = app.log.iter().filter(|e| e.dir == Dir::Tx).count();
    let rx = app.log.len() - tx;
    let counters = format!("TX {tx} · RX {rx} · ERR {}", app.drops);
    let cw = text_w(p, &counters, F::MonoB, 9.5) + 26.0;
    let cg = Rect::from_min_size(pos2(x + 6.0, cy - 11.0), vec2(cw, 22.0));
    let g = glass(ui, cg);
    vfd(ui.painter(), g.center(), Align2::CENTER_CENTER, &counters, F::MonoB, 9.5);
    // lamp colour jewels (right)
    let mut jx = face.right() - 20.0 - 8.0;
    for i in (0..LAMPS.len()).rev() {
        let c = pos2(jx, cy);
        let resp = ui.interact(Rect::from_center_size(c, vec2(22.0, 22.0)), Id::unique(("lamp", i)), Sense::click());
        jewel(ui.painter(), c, 5.0, LAMPS[i].1, lamp() == i);
        if lamp() == i {
            ui.painter().circle_stroke(c, 9.5, egui::Stroke::new(1.2, SILK2));
        }
        if resp.on_hover_text(format!("Lamp colour: {}", LAMPS[i].0.to_lowercase())).clicked() {
            choose_lamp(ui.ctx(), i);
        }
        jx -= 24.0;
    }
    let p = ui.painter();
    let lr = silk(p, pos2(jx - 6.0, cy), Align2::RIGHT_CENTER, "LAMP", F::Silk2, 9.0, SILK2);
    let max = lr.left() - 24.0 - cg.right() - 20.0;
    if let Some((msg, _)) = &app.notice {
        glow_text(p, pos2(lr.left() - 24.0, cy), Align2::RIGHT_CENTER, msg, F::MonoB, 10.0, max, lit(), 0.14);
    } else {
        let hint = match app.tab {
            Tab::Editor => "EDITS LIVE ON THE AMP UNTIL YOU WRITE OR CHANGE CHANNEL",
            Tab::Effects => "COMP, CHORUS, PRE B, DIVIDER AND MIXER ARE FIXED BY THE FIRMWARE",
            Tab::Control => "ASSIGNS AND PEDAL FUNCTIONS ARE STORED PER PATCH · NO TUNER ON THE 50 MK1",
            Tab::Library => "APPLYING A TONE REPLACES THE EDIT BUFFER · WRITE TO KEEP IT",
            Tab::Monitor => "ROLAND DT1 / RQ1 · MODEL 00 00 00 33",
        };
        let hint = if app.online() { hint.to_string() } else { "WAITING FOR THE AMP · IT CONNECTS BY ITSELF".to_string() };
        text_max(p, pos2(lr.left() - 24.0, cy), Align2::RIGHT_CENTER, &hint, F::Silk2, 9.0, SILK2, max);
    }
}

fn main() -> eframe::Result {
    let options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default()
            .with_title("Tsuba")
            .with_inner_size([1440.0, 940.0])
            .with_min_inner_size([1280.0, 720.0])
            .with_drag_and_drop(true),
        ..Default::default()
    };
    eframe::run_native("Tsuba", options, Box::new(|cc| Ok(Box::new(App::new(cc)))))
}
