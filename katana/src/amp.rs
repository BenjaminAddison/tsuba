//! The connection to the amp over USB MIDI (midir: WinMM on Windows, ALSA on Linux).
//! Handshake per notes/03-connect-sequence.md; behaviour per notes/07-hardware-results.md.

use std::collections::{BTreeMap, VecDeque};
use std::fmt;
use std::sync::mpsc::{channel, Receiver};
use std::thread::sleep;
use std::time::{Duration, Instant};

use midir::{Ignore, MidiIO, MidiInput, MidiInputConnection, MidiOutput, MidiOutputConnection};

use crate::sysex::{self, Addr};

/// Sparse memory image, linear address → byte. The amp skips undefined addresses, and so does this.
pub type Memory = BTreeMap<u32, u8>;

/// Patch areas for `read_patch`: the edit buffer (what you hear) and stored slot n.
pub const EDIT_BUFFER: [u8; 2] = [0x60, 0x00];
pub fn slot_area(n: u8) -> [u8; 2] {
    [0x10, n]
}

/// Move a patch image to another area, e.g. a stored slot read at `10 0n …` onto edit-buffer addresses, so one
/// `Catalog` lookup serves both.
pub fn rebase(mem: &Memory, from: [u8; 2], to: [u8; 2]) -> Memory {
    let (f, t) = (sysex::lin([from[0], from[1], 0, 0]), sysex::lin([to[0], to[1], 0, 0]));
    mem.iter().filter(|(a, _)| (f..f + (1 << 14)).contains(*a)).map(|(a, b)| (a - f + t, *b)).collect()
}

/// Slots the KATANA-50 can play: PANEL, A:CH1, A:CH2, B:CH1, B:CH2. 3, 4, 7, 8 exist (the 100's A3/A4/B3/B4) but
/// can only be read and written directly, never selected or saved into.
pub const SLOTS: [u8; 5] = [0, 1, 2, 5, 6];

const CURRENT_PATCH: Addr = [0x00, 0x01, 0x00, 0x00];
const COMM_LEVEL: Addr = [0x7F, 0x00, 0x00, 0x00];
const EDITOR_MODE: Addr = [0x7F, 0x00, 0x00, 0x01];
const PATCH_WRITE: Addr = [0x7F, 0x00, 0x01, 0x04];
const USB_DIRECT_MONITOR: Addr = [0x7F, 0x00, 0x06, 0x00];
pub const CHAIN: Addr = [0x60, 0x00, 0x07, 0x20];

const PACE: Duration = Duration::from_millis(30); // Tone Studio's gap between bulk writes
const MAX_DT1: usize = 64;

#[derive(Debug)]
pub enum Error {
    NotFound(String),
    Midi(String),
    Timeout(String),
    Unsupported(String),
    Invalid(String),
}

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            Error::NotFound(s) => write!(f, "amp not found: {s}"),
            Error::Midi(s) => write!(f, "MIDI error: {s}"),
            Error::Timeout(s) => write!(f, "no answer from the amp: {s}"),
            Error::Unsupported(s) => write!(f, "unsupported amp: {s}"),
            Error::Invalid(s) => write!(f, "{s}"),
        }
    }
}

impl std::error::Error for Error {}

pub type Result<T> = std::result::Result<T, Error>;

fn midi_err(e: impl fmt::Display) -> Error {
    Error::Midi(e.to_string())
}

/// The editor port. Windows names it `KATANA` (next to `KATANA DAW CTRL` and `KATANA CTRL`).
// ponytail: Linux ALSA names are untested; this takes the first KATANA port that isn't a CTRL port.
fn find_port<T: MidiIO>(io: &T) -> Result<T::Port> {
    let ports = io.ports();
    let names: Vec<String> = ports.iter().map(|p| io.port_name(p).unwrap_or_default()).collect();
    names
        .iter()
        .position(|n| n.contains("KATANA") && !n.contains("CTRL"))
        .map(|i| ports[i].clone())
        .ok_or_else(|| Error::NotFound(format!("no KATANA port in {names:?}. Is Tone Studio still running?")))
}

/// One open connection in editor mode. Dropping it turns editor mode off again.
///
/// Not thread-safe by design: one worker thread owns it, the UI talks to that thread.
pub struct Katana {
    out: MidiOutputConnection,
    _inp: MidiInputConnection<()>,
    rx: Receiver<Vec<u8>>,
    pending: VecDeque<(Addr, Vec<u8>)>,
    pub dev: u8,
}

impl Katana {
    /// Open the ports and run the handshake: identity ×2, KATANA-50 check, comm level 05, editor mode on.
    pub fn connect() -> Result<Katana> {
        let mut inp = MidiInput::new("katana-editor").map_err(midi_err)?;
        inp.ignore(Ignore::TimeAndActiveSense);
        let out = MidiOutput::new("katana-editor").map_err(midi_err)?;
        let (ip, op) = (find_port(&inp)?, find_port(&out)?);
        let (tx, rx) = channel();
        let _inp = inp
            .connect(&ip, "katana-in", move |_, m, _| drop(tx.send(m.to_vec())), ())
            .map_err(midi_err)?;
        let out = out.connect(&op, "katana-out").map_err(midi_err)?;
        let mut k = Katana { out, _inp, rx, pending: VecDeque::new(), dev: 0x10 };

        let (dev, _) = k.identity(&sysex::IDENTITY_BROADCAST)?;
        k.dev = dev;
        let (_, model) = k.identity(&sysex::identity_request(dev))?;
        if model != 0 {
            return Err(Error::Unsupported(format!("model {model}; only the KATANA-50 (0) is supported")));
        }
        let level = k.read(COMM_LEVEL, 1)?[0];
        if level != 5 {
            return Err(Error::Unsupported(format!("communication level {level}, expected 5 (firmware mismatch)")));
        }
        k.write(EDITOR_MODE, &[1])?;
        Ok(k)
    }

    fn identity(&mut self, req: &[u8]) -> Result<(u8, u8)> {
        self.send(req)?;
        let deadline = Instant::now() + Duration::from_secs(2);
        while let Some(m) = self.recv(deadline) {
            if let Some(id) = sysex::parse_identity(&m) {
                return Ok(id);
            }
        }
        Err(Error::Timeout("identity request".into()))
    }

    fn send(&mut self, m: &[u8]) -> Result<()> {
        self.out.send(m).map_err(midi_err)
    }

    fn recv(&self, deadline: Instant) -> Option<Vec<u8>> {
        self.rx.recv_timeout(deadline.saturating_duration_since(Instant::now())).ok()
    }

    fn next_dt1(&self, deadline: Instant) -> Option<(Addr, Vec<u8>)> {
        while let Some(m) = self.recv(deadline) {
            if let Some((a, d)) = sysex::parse_dt1(self.dev, &m) {
                return Some((a, d.to_vec()));
            }
        }
        None
    }

    /// Everything the amp pushed by itself since the last call: panel moves, channel changes, write echoes.
    /// The amp echoes a DT1 only when it changes a value, and pushes the whole edit buffer on a channel change.
    pub fn events(&mut self) -> Vec<(Addr, Vec<u8>)> {
        let mut ev: Vec<_> = self.pending.drain(..).collect();
        ev.extend(self.rx.try_iter().filter_map(|m| sysex::parse_dt1(self.dev, &m).map(|(a, d)| (a, d.to_vec()))));
        ev
    }

    /// Read exactly `size` defined bytes. Unrelated DT1s that arrive meanwhile are kept for `events()`.
    pub fn read(&mut self, a: Addr, size: u32) -> Result<Vec<u8>> {
        let start = sysex::lin(a);
        for _ in 0..3 {
            self.send(&sysex::rq1(self.dev, a, size))?;
            let mut got = vec![None; size as usize];
            let deadline = Instant::now() + Duration::from_secs(1);
            while got.contains(&None) {
                let Some((at, data)) = self.next_dt1(deadline) else { break };
                let base = sysex::lin(at);
                if base >= start + size || base + data.len() as u32 <= start {
                    self.pending.push_back((at, data));
                    continue;
                }
                for (i, b) in data.into_iter().enumerate() {
                    if let Some(slot) = (base + i as u32).checked_sub(start).and_then(|o| got.get_mut(o as usize)) {
                        *slot = Some(b);
                    }
                }
            }
            if !got.contains(&None) {
                return Ok(got.into_iter().flatten().collect());
            }
        }
        Err(Error::Timeout(format!("read {} size {size}", sysex::hex(&a))))
    }

    /// Read a range with holes: collect DT1s until the amp goes quiet.
    pub fn read_sparse(&mut self, a: Addr, size: u32) -> Result<Memory> {
        let start = sysex::lin(a);
        self.send(&sysex::rq1(self.dev, a, size))?;
        let mut mem = Memory::new();
        let mut deadline = Instant::now() + Duration::from_secs(2);
        while let Some((at, data)) = self.next_dt1(deadline) {
            let base = sysex::lin(at);
            if base < start || base >= start + size {
                self.pending.push_back((at, data));
                continue;
            }
            mem.extend(data.into_iter().enumerate().map(|(i, b)| (base + i as u32, b)));
            deadline = Instant::now() + Duration::from_millis(400);
        }
        if mem.is_empty() {
            return Err(Error::Timeout(format!("read {} size {size}", sysex::hex(&a))));
        }
        Ok(mem)
    }

    /// A whole patch (2,767 defined bytes) in two reads: `EDIT_BUFFER` or `slot_area(n)`.
    pub fn read_patch(&mut self, area: [u8; 2]) -> Result<Memory> {
        let mut mem = self.read_sparse([area[0], area[1], 0x00, 0x00], 2048)?;
        mem.extend(self.read_sparse([area[0], area[1], 0x10, 0x00], 2048)?);
        Ok(mem)
    }

    /// One DT1. Edit-buffer writes are live and not saved; the amp echoes them only if the value changed.
    pub fn write(&mut self, a: Addr, data: &[u8]) -> Result<()> {
        self.send(&sysex::dt1(self.dev, a, data))
    }

    /// Bulk write: contiguous runs are merged into DT1s of ≤ 64 bytes, paced 30 ms apart like Tone Studio.
    pub fn write_many(&mut self, writes: &[(Addr, Vec<u8>)]) -> Result<()> {
        let mut bytes = Memory::new();
        for (a, d) in writes {
            bytes.extend(d.iter().enumerate().map(|(i, &b)| (sysex::lin(*a) + i as u32, b)));
        }
        let mut runs: Vec<(u32, Vec<u8>)> = vec![];
        for (at, b) in bytes {
            match runs.last_mut() {
                Some((start, run)) if *start + run.len() as u32 == at && run.len() < MAX_DT1 => run.push(b),
                _ => runs.push((at, vec![b])),
            }
        }
        for (i, (at, run)) in runs.iter().enumerate() {
            if i > 0 {
                sleep(PACE);
            }
            self.write(sysex::addr(*at), run)?;
        }
        Ok(())
    }

    /// Cheap liveness check (reads the comm level). Errors once the amp is gone.
    pub fn ping(&mut self) -> Result<()> {
        self.read(COMM_LEVEL, 1).map(drop)
    }

    /// The selected slot (see `SLOTS`).
    pub fn current_patch(&mut self) -> Result<u32> {
        Ok(sysex::decode_value(&self.read(CURRENT_PATCH, 2)?))
    }

    /// Switch channel. The amp then pushes the new edit buffer by itself (see `events`).
    pub fn select(&mut self, slot: u8) -> Result<()> {
        check_slot(slot)?;
        self.write(CURRENT_PATCH, &[0, slot])
    }

    /// Save the edit buffer into a slot. Done inside the amp, so filtered values (EXP FUNC 4) survive.
    pub fn save(&mut self, slot: u8) -> Result<()> {
        check_slot(slot)?;
        self.write(PATCH_WRITE, &[0, slot])
    }

    /// Set the FX chain order. Must be one 20-byte write: single-position writes are rejected by the amp.
    pub fn set_chain(&mut self, order: &[u8; 20]) -> Result<()> {
        let mut seen = [false; 20];
        for &b in order {
            if b >= 20 || std::mem::replace(&mut seen[b as usize], true) {
                return Err(Error::Invalid(format!("chain must use each block 0-19 once: {order:?}")));
            }
        }
        self.write(CHAIN, order)
    }
}

fn check_slot(slot: u8) -> Result<()> {
    if SLOTS.contains(&slot) {
        Ok(())
    } else {
        Err(Error::Invalid(format!("slot {slot} can't be selected or saved on the KATANA-50 (use {SLOTS:?})")))
    }
}

impl Drop for Katana {
    fn drop(&mut self) {
        // as Tone Studio does on exit: USB direct monitor back on, editor mode off
        let _ = self.write(USB_DIRECT_MONITOR, &[1]);
        let _ = self.write(EDITOR_MODE, &[0]);
    }
}
