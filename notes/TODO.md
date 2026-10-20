# TODO — next tests and what we need

Hardware testing started 2026-10-20 on Windows. Results are in [07-hardware-results.md](07-hardware-results.md).

## Needed before testing

- [ ] **KATANA-50 MK1 owner's manual** (rear-panel jacks, footswitch/EXP pedal wiring, MIDI implementation chart). It's not in `vendor/`.
- [x] Test machine with the amp on USB: Windows 11 + Python + `python-rtmidi` in `.venv` (Linux still untested).
- [x] A tiny SysEx test script (`tools/katana.py`) (send/receive + Roland checksum, see [02](02-sysex-protocol.md)). It is the first piece of the replacement app.
- [ ] Optional: a Windows machine with Tone Studio + MIDI-OX (or a USB sniffer) to record real traffic and compare against our notes.

## 1. Connection (safe, read-only)

- [ ] (Windows: yes, all 3 ports.) Does the amp show up on Linux without a driver (`snd-usb-audio`)? Which of the 3 MIDI ports appear (`KATANA`, `KATANA DAW CTRL`, `KATANA CTRL`)?
- [x] Broadcast identity `F0 7E 7F 06 01 F7`: record the full reply and the device ID (byte [2]).
- [x] Directed identity: check the reply prefix `F0 7E <dev> 06 02 41 33 03 00 00` and that the model nibble = `0` (KATANA-50).
- [x] RQ1 `7F 00 00 00`: communication level. Expect `05`; record our firmware's value.
- [x] Read current patch `00 01 00 00` (2 bytes).

## 2. Backup (before any write)

- [x] Read and save all user patches: slots 0, 1, 2, 5, 6 at `10 nn …` (Katana-50 slot remap, see [03](03-connect-sequence.md)).
- [x] Read and save the system areas (Tone Studio's 3 blocks only) `00 00 …` and the MIDI settings `00 02 …`.
- [x] Write the backup to disk and prove a restore works on one slot before relying on it. (Slot 3 works, except EXP FUNC 4 → 1; see [07](07-hardware-results.md))

## 3. Editor mode and live editing

- [x] Editor mode on (`7F 00 00 01` = `01`). Turn each amp knob and switch channels, and log which DT1s arrive unprompted.
- [x] Single-parameter DT1s to the edit buffer (e.g. Preamp A gain `60 00 00 52`). Confirm it changes live and isn't saved.
- [x] Patch change via `00 01 00 00` (does the amp echo it back?). Then patch write via `7F 00 01 04`, on a scratch slot only. Both work; the write keeps EXP FUNC 4; hidden slots are ignored ([07](07-hardware-results.md)).
- [x] Editor mode off on exit. Confirm the amp returns to normal.

## 4. Hidden features (edit buffer only, don't save)

- [x] Sweep **Preamp A type** `60 00 00 51` through 0–27 and note which models sound distinct. (0–25 work; 26, 27 mute: see [07](07-hardware-results.md))
- [x] FX1/FX2/booster **type values in the gaps** (e.g. FX 5, 8, 11, 13, 17, 24, 30, 32–34). Accepted or ignored? FX gaps are rejected; hidden extras booster 7, reverb AMBIENCE/HALL1 work; booster 21/22 mute ([07](07-hardware-results.md)).
- [x] **Preamp B + divider/mixer** (`60 00 01 00`, `60 00 06 40/50`): does the 50 MK1 run a second amp? **No: the switches are locked** ([07](07-hardware-results.md)). Stored patches are filtered too, so it's closed.
- [x] **FX chain order** `60 00 07 20`: can blocks be reordered? **Yes, any order, confirmed by ear**, as one full 20-byte write ([07](07-hardware-results.md)). COMP stays locked.
- [x] Tuner pitch readout `7F 00 05 00` while playing. **No tuner on the 50 MK1** ([07](07-hardware-results.md)).

## 5. Foot control

On hold (2026-10-20): no footswitch or expression pedal available. MIDI PC/CC over USB is done.

- [ ] Rear **SEL CH1 CH2/EXP PEDAL** jack: from the manual, get the wiring for a footswitch and for an expression pedal. How does the amp tell them apart?
- [ ] Expression pedal function per patch `60 00 12 1F` (0 VOLUME … 9 PEDAL FX): check it with a real or DIY pedal.
- [x] Read the MIDI receive settings: RX channel `00 02 00 00` (= 1, omni off), MAP SELECT `00 02 00 0D`, PC map `00 02 01 00` (2 bytes per PC#). There are no CC-number settings; the CCs are fixed.
- [x] Send MIDI **Program Change / Control Change** over USB. (KATANA port, channel 1: PC 1/2/5/6/7 = A1/A2/PANEL/B1/B2; CCs mapped in [07](07-hardware-results.md).) Which port does the amp accept them on? Do PC/CC switch channels and effects as mapped?
- [ ] DIY pedal hardware: pick a USB-host-capable board (Raspberry Pi / Teensy 4.x / ESP32-S3 / RP2040 + PIO USB host). The amp's USB is device-only.

## 6. Still to extract from the decompiled code

- [ ] Full patch **byte layout**: `TemporaryParams.getExData`/`setData`, for raw patch backup ↔ `.tsl` import/export.
- [ ] Effect **sub-type lists** and computed dropdown labels (reverb time, tempo-synced rates/delay times, mixer balance).
- [ ] **Assigns 1–8 / knob assigns / EXP min/max** targets (`CTLAssignTargetDefinitionGT.as`, `CTLDefinitionGT.as`).
- [ ] **System settings** with ranges (`SystemSettingDefinitionGT.as`), including panel knob positions `sys_knob_pos_*`.
- [ ] Meaning of current-patch value `400`.

## 7. Replacement app

- [ ] Choose the stack: web app + Web MIDI vs Python prototype ([05](05-replacement-app.md)).
- [ ] Build a minimal CLI first: connect handshake → backup/restore → set one parameter. That proves the protocol before any UI work.
- [ ] Don't copy Tone Studio's bug: its full-patch push skips the 12 EVH95 pedal / Heavy Octave params ([06](06-effects-map.md)).
- [ ] `tools/restore.py`: restore visible slots through the edit buffer + `7F 00 01 04` so EXP FUNC keeps its value.
