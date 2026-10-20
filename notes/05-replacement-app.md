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

## Hardware test plan (do these first)

All of these are safe: they only touch the edit buffer, and nothing is stored until a patch-write.

1. **Back up first**: read all `10 nn` user patches and the system area, and save them to disk.
2. List ports (`amidi -l` / `aconnect -l`) and confirm `KATANA` shows up on Linux without a driver.
3. Identity: send `F0 7E 7F 06 01 F7` and record the reply. Expect model nibble `0`.
4. RQ1 `7F 00 00 00`. Expect `05` (what does our firmware report?).
5. Editor mode on, turn a knob on the amp, and log what DT1s arrive.
6. Sweep `60 00 00 51` through 0–27 on the edit buffer and listen.
7. Try PREAMP B on and the divider/mixer modes.
8. Editor mode off.

## Open questions

- [ ] Byte layout of a full patch: extract it from `TemporaryParams.getExData` (needed for `.tsl` import/export).
- [ ] Which `00 00 …` system addresses hold the panel knob positions (`sys_knob_pos_*`)?
- [ ] What is current-patch value `400` exactly?
- [ ] Does the 50 MK1 honour PREAMP B / divider / mixer, or are they ignored?
- [ ] Does Linux `snd-usb-audio` expose all 3 MIDI ports for `0582:01D8`, or does the amp need vendor mode?
- [ ] Does a newer Tone Studio (Katana MK2 era) change the comm level or the protocol? (Model nibbles 5–7 are rejected by v4.0.0.)

## Suggested stack (not decided)

- **Web app + Web MIDI** (Chrome/Edge): no install, works on Linux, Windows and macOS. SysEx needs a user permission prompt.
- Or **Python + python-rtmidi** for a quick CLI/prototype that tests the plan above.
