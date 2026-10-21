# 05 — Building our own replacement for Tone Studio

**Goal:** a fully custom app that replaces BOSS Tone Studio for the **KATANA-50 MK1**, and can do more than it does.

## What the app minimally has to do

1. Open the `KATANA` MIDI in/out ports.
2. Run the startup handshake in 03: identity ×2, check comm level `05`, editor mode on, read system and edit buffer and current patch.
3. Map UI controls ↔ addresses in `addressmap_gt.json`: one DT1 per change, with the checksum from 02.
4. Listen for unsolicited DT1s (patch changes and knob moves on the amp) and update the UI.
5. Patch slots: change (`00 01 00 00`), save (`7F 00 01 04`), using the **Katana-50 slot remap** (0,1,2,5,6).
6. Editor mode **off** on exit.

Everything Tone Studio does above the protocol (Tone Central downloads, telemetry, audio player, LiveSets) is optional.

## What a custom app can unlock

| Capability | How | Confidence |
|---|---|---|
| Hidden effect types: booster 7, reverb AMBIENCE (0) and HALL1 (2) | Type registers; block booster 21/22 (mute) | **Confirmed on hardware** |
| 26 GT amp models instead of 5 | Write `60 00 00 51` = 0–25 (26 and 27 mute the 50 MK1) | **Confirmed on hardware** |
| ~~Dual amp (A/B) with divider/mixer~~ | `60 00 01 00` PREAMP B, `60 00 06 40/50` | **Locked on the 50 MK1**: writes are dropped |
| Free FX chain order (not just 3 patterns) | One 20-byte DT1 to `60 00 07 20` | **Confirmed on hardware** (by ear) |
| Every effect parameter (~270 each for FX1 and FX2, DELAY2, Pedal FX, NS×2, Master EQ, Accel FX) | `60 00 …` | High: the addresses exist |
| Live automation (morphing, LFOs, MIDI/phone controller mapping) | Stream DT1s. Tone Studio paces bulk writes at 30 ms per message | High |
| Unlimited patch library, full backup and restore | Read/write `10 nn …` (+ system `00 …`) | High |
| Tuner display | Poll `7F 00 05 00` / `7F 00 02 xx` | Medium |
| Assigns 1–8, CTL/EXP to any parameter | `60 00 08 30` – `0A 30` | Medium |
| Global 10-band EQ, MIDI map, USB routing | System `00 00 …`, `00 02 …`, `7F 00 06 0x` | High |

**Not possible this way:** new DSP or effects, firmware changes, or USB audio routing beyond the exposed settings.

## Tests and open questions

Tracked in [TODO.md](TODO.md).

## What the owner wants (2026-10-20)

- **A desktop app you open**, not a web page: a much better GUI than Tone Studio, **fast startup**, and **more control**
  (everything the hardware tests unlocked: 26 amp models, free FX chain, hidden effect types, the full parametric EQ,
  every parameter).
- **Shareable tones that people can modify**: a readable, editable tone file with named parameters and display values,
  not raw bytes. `tools/tone.py` + `tones/*.json` is the first prototype.
- **An MCP server for tone crafting**: an assistant reads the amp's current tone, edits it from a plain description
  ("warm and dreamy", "old telephone") and pushes it live, as done by hand in the 2026-10-20 session
  (`tones/warm-dreamy.json`). Tools to expose: read tone, apply tone/params, list models and effect types with their
  allowed values, save to a slot, back up and restore.
- **A frequency response graph** of the current tone, updated live as parameters change.
  - Computable: the EQ block (low/high cut, shelves, 2 parametric bands with Q), the high/low cuts of delay, reverb and
    chorus, and the FX1/FX2 GRAPHIC/PARAMETRIC EQ types. These have known frequencies, gains and Qs and can be drawn
    as standard filter curves.
  - Not known: the amp models' tone stacks (BASS/MIDDLE/TREBLE/PRESENCE) and the drives. Option A: approximate them.
    Option B (untested): **measure the real response** through USB audio (send a sweep into the amp, e.g. with the USB
    in/out mode `7F 00 06 01` set for re-amping, and record the processed USB output).

**Decided (2026-10-21):** Rust, with **egui** (glow/OpenGL backend for fast startup) and one codebase built natively
for Linux and Windows (no Wine). The look follows `design/` (DESIGN.md + mockups), made for egui: flat, 1px lines,
cut corners, fixed font instances. The MCP server is deferred. Tone files: `tones/*.json` (named parameters, display
values); `Catalog::export` writes the amp, each live block's switch, active blocks' type and parameters, the chain and
patch level. The app is in `app/`, the backend in `katana/`.

How the app maps the design onto the amp:
- The chain shows the live Ch A path (blocks between DIV and MXDV, 12 on stock patches). CHORUS is a locked block
  (shown bypassed with a lock, still movable); DELAY 2 has no chain slot, so it's a second unit inside DELAY.
- The frequency graph models the EQ block only (parametric or GE-10). Shelf corners (100 Hz / 6.3 kHz) are guesses
  until measured; the delay/reverb filters only shape the wet signal and aren't drawn.
- Write to amp = `7F 00 01 04`; revert = write back the bytes that differ from the stored slot.
- Monitor's probe only reads (RQ1).

## Suggested stack (earlier notes, before the owner's preferences)

- **Web app + Web MIDI** (Chrome/Edge): no install, works on Linux, Windows and macOS. SysEx needs a user permission prompt.
- Or **Python + python-rtmidi** for a quick CLI/prototype that tests the plan above.
