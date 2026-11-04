//! The one thread that talks to the amp. The UI sends `Cmd`s and gets `Update`s; nothing on the UI thread ever
//! waits on MIDI. Connects (and reconnects) by itself, loads the edit buffer then the stored slots, coalesces
//! rapid writes (a dragged knob) so the amp sees at most one DT1 per parameter per tick.

use std::sync::mpsc::{channel, Receiver, RecvTimeoutError, Sender};
use std::thread;
use std::time::{Duration, Instant};

use eframe::egui;
use katana::amp::{rebase, slot_area, EDIT_BUFFER, SLOTS};
use katana::sysex::Addr;
use katana::{Katana, Memory};

pub enum Cmd {
    Write(Addr, Vec<u8>),
    /// Bulk write (a tone, a revert), paced like Tone Studio.
    WriteMany(Vec<(Addr, Vec<u8>)>),
    Chain([u8; 20]),
    Select(u8),
    Save(u8),
    /// Monitor probe: a plain RQ1, never a write.
    Read(Addr, u32),
}

#[derive(Clone, PartialEq)]
pub enum Link {
    Searching(String),
    Online { dev: u8 },
}

#[derive(Clone, Copy, PartialEq)]
pub enum Dir {
    Tx,
    Rx,
}

#[derive(Clone)]
pub struct LogEntry {
    pub t: f64,
    pub dir: Dir,
    /// 0x11 RQ1 or 0x12 DT1.
    pub cmd: u8,
    pub addr: Addr,
    /// DT1 data, or the 4 size bytes of an RQ1.
    pub data: Vec<u8>,
}

pub enum Update {
    Link(Link),
    EditBuffer(Memory),
    /// A stored slot, rebased onto edit-buffer addresses.
    Slot(u8, Memory),
    Current(u8),
    /// Bytes the amp pushed (knob moves, channel changes, write echoes).
    Bytes(Addr, Vec<u8>),
    Probe(Result<Vec<u8>, String>),
    Log(LogEntry),
    /// Round trip of the last liveness ping, in ms.
    Rtt(f32),
}

pub fn spawn(ctx: egui::Context) -> (Sender<Cmd>, Receiver<Update>) {
    let (cmd_tx, cmd_rx) = channel();
    let (up_tx, up_rx) = channel();
    thread::Builder::new()
        .name("katana".into())
        .spawn(move || run(cmd_rx, up_tx, ctx))
        .expect("spawn worker");
    (cmd_tx, up_rx)
}

struct Out {
    tx: Sender<Update>,
    ctx: egui::Context,
    t0: Instant,
}

impl Out {
    fn send(&self, u: Update) {
        let _ = self.tx.send(u);
        self.ctx.request_repaint();
    }

    fn log(&self, dir: Dir, cmd: u8, addr: Addr, data: &[u8]) {
        let t = self.t0.elapsed().as_secs_f64();
        self.send(Update::Log(LogEntry { t, dir, cmd, addr, data: data.to_vec() }));
    }
}

fn run(rx: Receiver<Cmd>, tx: Sender<Update>, ctx: egui::Context) {
    let out = Out { tx, ctx, t0: Instant::now() };
    loop {
        match Katana::connect() {
            Ok(k) => {
                out.send(Update::Link(Link::Online { dev: k.dev }));
                let reason = session(k, &rx, &out).err().map_or("closed".to_string(), |e| e.to_string());
                out.send(Update::Link(Link::Searching(reason)));
            }
            Err(e) => out.send(Update::Link(Link::Searching(e.to_string()))),
        }
        // the UI went away: stop
        if matches!(rx.recv_timeout(Duration::from_secs(2)), Err(RecvTimeoutError::Disconnected)) {
            return;
        }
        while rx.try_recv().is_ok() {} // drop edits made while offline
    }
}

fn session(mut k: Katana, rx: &Receiver<Cmd>, out: &Out) -> Result<(), Box<dyn std::error::Error>> {
    let t = Instant::now();
    out.send(Update::Current(k.current_patch()? as u8));
    out.send(Update::Rtt(t.elapsed().as_secs_f32() * 1000.0));
    out.send(Update::EditBuffer(k.read_patch(EDIT_BUFFER)?));
    let mut to_load: Vec<u8> = SLOTS.to_vec();
    let mut last_rx = Instant::now();

    loop {
        // gather everything queued, keeping only the last value per address for plain writes
        let first = match rx.recv_timeout(Duration::from_millis(15)) {
            Ok(c) => Some(c),
            Err(RecvTimeoutError::Timeout) => None,
            Err(RecvTimeoutError::Disconnected) => return Ok(()),
        };
        let mut writes: Vec<(Addr, Vec<u8>)> = vec![];
        for c in first.into_iter().chain(rx.try_iter()) {
            match c {
                Cmd::Write(a, d) => match writes.iter_mut().find(|w| w.0 == a) {
                    Some(w) => w.1 = d,
                    None => writes.push((a, d)),
                },
                other => {
                    flush(&mut k, &mut writes, out)?;
                    match other {
                        Cmd::WriteMany(ws) => {
                            ws.iter().for_each(|(a, d)| out.log(Dir::Tx, 0x12, *a, d));
                            k.write_many(&ws)?;
                        }
                        Cmd::Chain(order) => {
                            out.log(Dir::Tx, 0x12, katana::amp::CHAIN, &order);
                            k.set_chain(&order)?;
                        }
                        Cmd::Select(slot) => {
                            out.log(Dir::Tx, 0x12, [0, 1, 0, 0], &[0, slot]);
                            k.select(slot)?;
                        }
                        Cmd::Save(slot) => {
                            out.log(Dir::Tx, 0x12, [0x7F, 0, 1, 4], &[0, slot]);
                            k.save(slot)?;
                            to_load.push(slot); // re-read what the amp actually stored
                        }
                        Cmd::Read(a, size) => {
                            out.log(Dir::Tx, 0x11, a, &katana::sysex::addr(size));
                            out.send(Update::Probe(k.read(a, size).map_err(|e| e.to_string())));
                        }
                        Cmd::Write(..) => unreachable!(),
                    }
                }
            }
        }
        flush(&mut k, &mut writes, out)?;

        for (a, d) in k.events() {
            out.log(Dir::Rx, 0x12, a, &d);
            if a == [0, 1, 0, 0] && d.len() == 2 {
                out.send(Update::Current(d[1]));
            }
            out.send(Update::Bytes(a, d));
            last_rx = Instant::now();
        }

        if let Some(slot) = to_load.first().copied() {
            let area = slot_area(slot);
            out.send(Update::Slot(slot, rebase(&k.read_patch(area)?, area, EDIT_BUFFER)));
            to_load.remove(0);
        } else if last_rx.elapsed() > Duration::from_secs(2) {
            let t = Instant::now();
            k.ping()?; // notice an unplugged amp
            out.send(Update::Rtt(t.elapsed().as_secs_f32() * 1000.0));
            last_rx = Instant::now();
        }
    }
}

fn flush(k: &mut Katana, writes: &mut Vec<(Addr, Vec<u8>)>, out: &Out) -> katana::amp::Result<()> {
    for (a, d) in writes.drain(..) {
        out.log(Dir::Tx, 0x12, a, &d);
        k.write(a, &d)?;
    }
    Ok(())
}
