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
| All 28 GT amp models instead of 5 | Write `60 00 00 51` = 0–27 | High: factory patches use them. Sound per value still to test |
| Dual amp (A/B) with divider/mixer | `60 00 01 00` PREAMP B, `60 00 06 40/50` | Unknown on 50 MK1 |
| Free FX chain order | `60 00 07 20` (20 positions) | Medium |
| Every effect parameter (~270 each for FX1 and FX2, DELAY2, Pedal FX, NS×2, Master EQ, Accel FX) | `60 00 …` | High: the addresses exist |
| Live automation (morphing, LFOs, MIDI/phone controller mapping) | Stream DT1s. Tone Studio paces bulk writes at 30 ms per message | High |
| Unlimited patch library, full backup and restore | Read/write `10 nn …` (+ system `00 …`) | High |
| Tuner display | Poll `7F 00 05 00` / `7F 00 02 xx` | Medium |
| Assigns 1–8, CTL/EXP to any parameter | `60 00 08 30` – `0A 30` | Medium |
| Global 10-band EQ, MIDI map, USB routing | System `00 00 …`, `00 02 …`, `7F 00 06 0x` | High |

**Not possible this way:** new DSP or effects, firmware changes, or USB audio routing beyond the exposed settings.

## Tests and open questions

Tracked in [TODO.md](TODO.md).

## Suggested stack (not decided)

- **Web app + Web MIDI** (Chrome/Edge): no install, works on Linux, Windows and macOS. SysEx needs a user permission prompt.
- Or **Python + python-rtmidi** for a quick CLI/prototype that tests the plan above.
