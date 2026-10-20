# 07 — Hardware test results

Results from the real amp (KATANA-50 MK1) on Windows 11, driven by `tools/katana.py` via python-rtmidi (WinMM).

## Setup (2026-10-20)

- Windows enumerates USB `0582:01D8` with three MIDI endpoints through Windows MIDI Services.
- python-rtmidi (WinMM) ports: IN `KATANA`, `KATANA DAW CTRL`, `KATANA CTRL`; OUT also lists `Microsoft GS Wavetable Synth`
  first, so match ports by name, not index.
- Tone Studio must not be running: WinMM ports are exclusive.

## Connection (TODO §1): all as decoded

| Test | Result |
|---|---|
| Broadcast identity `F0 7E 7F 06 01 F7` | `F0 7E 00 06 02 41 33 03 00 00 00 00 00 00 F7` → **device ID `00`** |
| Directed identity `F0 7E 00 06 01 F7` | Same reply. Prefix matches; model nibble `0` = KATANA-50. Software revision bytes are all `00` |
| Comm level `7F 00 00 00` | **`05`**: Tone Studio v4 accepts it |
| Current patch `00 01 00 00` | `00 02` = A:CH2 at the time |

## Reads and memory layout (TODO §2)

- **The amp splits long replies into DT1s of at most 241 data bytes** (255-byte messages). 2048 bytes take ~0.8 s.
- **Patch memory is sparse.** For an RQ1 covering holes, the amp skips undefined addresses and only sends defined runs.
  Example: an RQ1 of `60 00 08 00` ×2048 jumps from `60 00 11 35` to `60 00 12 00`, and `60 00 10 00` starts at `60 00 10 10`.
  So a reader must not expect `size` bytes back. It should collect DT1s until the amp goes quiet.
- Tone Studio's 3 × 2048-byte edit-buffer reads (`00 00`, `08 00`, `10 00`) **overlap**, because 2048 bytes is 16 pages of
  7-bit addressing. Two reads (`xx xx 00 00` and `xx xx 10 00`) cover a whole patch: **2,767 defined bytes in 12 DT1s**.
  Stored user patches have the same size and layout.
- **Hidden slots exist:** `10 03`, `10 04`, `10 07` and `10 08` answer, holding the factory "KATANA A-3/A-4/B-3/B-4".
  The KATANA-50 keeps the 100's 9-slot memory even though the panel only reaches 0, 1, 2, 5 and 6. `10 09` does not answer.
- `tools/backup.py` saves system, MIDI, edit buffer, the 5 user slots and the 4 hidden slots to `backups/<timestamp>.json`.
- `tools/restore.py <backup> <slot>` writes a slot back (DT1s of ≤64 bytes to `10 nn …`, 30 ms apart) and verifies
  every byte. **Tested on hidden slot 3: everything restores except one byte** (below).

### Stored writes: no echo, and the firmware filters values

- DT1s to stored slots (`10 nn …`) are **never echoed**, even when the value changes. Verify with a read-back.
- **CTL/EXP: EXP FUNC `xx xx 08 10` only accepts 0 (OFF) and 1 (FOOT VOLUME)**, and any other value becomes 1. But every
  factory patch on this amp (all 9 slots) holds **4 (PB/FV)**. So a SysEx restore cannot recreate that factory value:
  slot 3 now has 1 there. This only matters with an expression pedal on that patch.
  Untested: the patch-write command `7F 00 01 04` might keep the 4, because it copies the edit buffer inside the amp.

## Live editing (TODO §3)

- Editor mode on/off (`7F 00 00 01`): the amp sends nothing in response.
- DT1 to Preamp A gain `60 00 00 52`: the change is live, and **the amp echoes the DT1 back** (same address and value).
  The stored slot (`10 02 00 52`) is unchanged, so the edit is not saved. Restoring the old value works.

## What the amp sends in editor mode (TODO §3)

Two listen runs; the second is saved as `logs/listen-20261020-205215.txt`.

Captured with `tools/listen.py` while knobs, buttons and channels were used on the panel. The amp pushes everything
by itself, so **a replacement app never needs to poll**.

**Channel change.** The amp sends the new `00 01 00 00` (current patch, e.g. `00 01` = A:CH1). Then it sends **the
whole edit buffer** as 12 DT1s, ~35 ms apart (~0.45 s total), followed by system state: knob positions
`00 00 04 20`–`29`, FX LED states `00 00 04 10`–`12` and FX select states `00 00 04 13`–`15`.
**Only the knob/LED values that differ from the previous channel are sent.** The knob positions are stored per
patch, not read from the physical pots.

**Each knob move sends two DT1s** about every 20 ms while the knob turns:
1. the patch parameter it controls (`60 …`)
2. the physical knob position (`00 00 04 2x`, 0–100)

The two values differ: the amp maps knob position to parameter value through a curve (e.g. BASS knob 8 → BASS 2).

| Panel control | Patch parameter | Knob position |
|---|---|---|
| AMP TYPE | `60 00 00 51` PREAMP A TYPE | `00 00 04 20` |
| GAIN | `60 00 00 52` PREAMP A GAIN | `00 00 04 21` |
| VOLUME | `60 00 00 58` PREAMP A LEVEL | `00 00 04 22` |
| BASS / MIDDLE / TREBLE | `60 00 00 54` / `55` / `56` | `00 00 04 23` / `24` / `25` |
| BOOSTER/MOD (FX1) | split knob, see below | `00 00 04 27` |
| DELAY/FX (FX2) | split knob, see below | `00 00 04 28` |
| REVERB knob (FX3) | `60 00 06 18` REVERB EFFECT LEVEL (turning it up from 0 also sends REVERB ON/OFF = 1) | `00 00 04 29` |

**The AMP TYPE knob selects GT amp models:**

| Knob position | Label | PREAMP A TYPE |
|---|---|---|
| 0 | ACOUSTIC | **1 FULL RANGE** |
| 1 | CLEAN | **8 JC-120** |
| 2 | CRUNCH | **11 TWEED** |
| 3 | LEAD | **24 5150 DRIVE** |
| 4 | BROWN | **23 SLDN** |

**BOOSTER/MOD and DELAY/FX are split knobs** with a dead zone at the centre (~50–52, both halves off, LED off):

| Knob | Left half (0 → ~50) | Right half (~53 → 100) |
|---|---|---|
| BOOSTER/MOD | OD/DS ON `60 00 00 30` = 1, DRIVE `60 00 00 32` rises towards centre (pos 49 → 96); FX1 off | FX1 ON `60 00 01 40` = 1, OD/DS off; sends the mod's rate (e.g. FLANGER RATE `60 00 02 7E`: pos 56 → 13, pos 81 → 51) |
| DELAY/FX | DELAY ON `60 00 05 60` = 1, FX2 off; EFFECT LEVEL `60 00 05 66` rises and F.BACK `60 00 05 64` falls slightly towards centre (pos 5 → 3/35, pos 46 → 94/23) | FX2 side (seen at load: pos 53, LED 2) |

At 0, the effect switches off (`… ON/OFF` = 0, LED 0).

**The colour (variation) buttons cycle green → red → yellow** (LED state 1/2/3) and rewrite the effect type:

| Button | Variation register | Types written per colour (G / R / Y) |
|---|---|---|
| BOOSTER/MOD button (booster side) | `60 00 12 10` (`PRM_FXBOX_SEL_FX1B`) = ?/1/2 | OD/DS TYPE `60 00 00 31` = ? / 10 / 12 |
| FX2 button | `60 00 12 13` (`PRM_FX_ACTIVE_AB_FX1`) = 0/1/2 | FX2 TYPE `60 00 03 4D` = 3 / 0 / 14 |
| FX3 (reverb) button | `60 00 12 14` (`PRM_FX_ACTIVE_AB_FX2`) = 0/1/2 | REVERB TYPE `60 00 06 11` = 4 / 5 / 3, and DELAY2 TYPE `60 00 10 4F` = 0 / 7 / 8 |

The colour ↔ register mapping assumes LED state 1 = green. The register names in Tone Studio's map are off by one from
the panel (`…_FX1` drives the FX2 LED).

Not captured yet (minor): the PANEL button, the colour cycle on the MOD and DELAY halves, and footswitch/TAP input.

## Amp models (TODO §4)

`tools/sweep_amp.py` stepped PREAMP A TYPE `60 00 00 51` through 0–27 on the PANEL patch while playing
(log: `logs/sweep-20261020-205532.txt`). Every value read back as written, so **the amp accepts all 28 values**.

- **0–25: all work and each changes the tone audibly.** That is 26 usable models instead of the panel's 5, including
  CUSTOM (25).
- **26 BGNR UB METAL and 27 ORNG ROCK REVERB mute the amp.** They are accepted without an error, but there is no sound.
  These models were presumably added for later Katana models; the 50 MK1 firmware has no DSP behind them.
  **A replacement app must not offer 26 or 27 on the 50 MK1**, and should treat them as invalid when importing `.tsl`
  patches made on other models.
- Not yet tested: whether firmware updates change this (the identity reply's software revision bytes are all `00`),
  and whether PREAMP B `60 00 01 01` behaves the same.

## Dual amp (TODO §4): locked on the 50 MK1

Tested with `tools/test_dual_amp.py` and single-register probes (log: `logs/dual-amp-20261020-210153.txt`).
**The firmware silently drops writes to the dual-amp switches**: no echo, and they read back unchanged.

| Register | Address | Write accepted? |
|---|---|---|
| PREAMP B ON/OFF | `60 00 01 00` | **No** (stays 0) |
| DIVIDER MODE (SINGLE/DUAL) | `60 00 06 40` | **No** (stays 0 = SINGLE) |
| DIVIDER CH SELECT (A/B) | `60 00 06 41` | **No** (stays 0 = Ch A) |
| MIXER MODE / A/B BALANCE / SPREAD | `60 00 06 50`–`52` | **No** (stay 0) |
| PREAMP B type, gain, EQ, level... | `60 00 01 01`– | Yes (stored, but inaudible while B is off) |
| DIVIDER Ch A/B filter etc. | `60 00 06 42`– | Yes (presumably no effect in SINGLE mode) |

So **the 50 MK1 cannot run a second amp through the edit buffer.** Preamp A on Ch A is the only path.
**Stored patches are filtered the same way.** Writing straight into hidden slot `10 03 …` (single-byte and block
DT1s): PREAMP B ON, DIVIDER MODE/CH and MIXER BALANCE stay 0; PREAMP B TYPE is accepted. The filter applies to every
SysEx write, so **the dual amp cannot be enabled by SysEx at all** on the 50 MK1. Slot 3 was then restored from backup.

### Echo semantics (applies to all writes)

- The amp echoes a DT1 **only when it changes a value**. Writing the current value gets no echo.
- A write to a locked register gets no echo and doesn't change the value.
- So "accepted" can only be proven by writing a *different* value and reading it back. A scan for every locked
  parameter would have to change each one briefly.

### Current-patch read quirk

`00 01 00 00` answered an RQ1 outside editor mode at the start of the session. After the first editor-mode-off, it only
answers **in editor mode** (other areas answer either way). Read it in editor mode, as Tone Studio does.

## FX chain (TODO §4)

**Block IDs** for the 20 positions at `60 00 07 20`–`33` (`ChainParams.getEffectName`):

| ID | Block | ID | Block | ID | Block |
|---|---|---|---|---|---|
| 0 | CMP (compressor) | 7 | DLY | 14 | NS2 |
| 1 | S/R (send/return) | 8 | CHO (chorus) | 15 | OD (booster) |
| 2 | PrA (preamp A) | 9 | REV | 16 | USB (out tap) |
| 3 | PrB (preamp B) | 10 | ACC (accel FX) | 17 | DIV (divider) |
| 4 | EQ | 11 | PDL (pedal FX) | 18 | MXDV (Ch A / Ch B boundary) |
| 5 | FX1 (mod) | 12 | FV (foot volume) | 19 | MIX (mixer) |
| 6 | FX2 (FX) | 13 | NS1 | | |

Blocks between DIV and MXDV run on Ch A; blocks between MXDV and MIX run on Ch B. The 50 MK1 is locked to Ch A, so
**CMP, PrB and ACC are parked on the dead B path** in every pattern.

**Tone Studio only writes `PRM_CHAIN_PTN` `60 00 12 00`** (CHAIN1–3 = 0–2; 3 is rejected). The amp then rewrites the 20
positions and echoes them:

| Pattern | Ch A path (between DIV and MXDV) |
|---|---|
| 0 | PDL PrA NS1 FV EQ S/R **OD FX1** DLY FX2 CHO REV (booster and mod after the amp) |
| 1 | PDL **OD FX1** PrA NS1 FV EQ S/R DLY FX2 CHO REV (standard) |
| 2 | PDL OD FX1 **DLY FX2** PrA NS1 FV EQ S/R CHO REV (delay and FX before the amp) |

(Once, the edit buffer read `… EQ DLY FX2 CHO REV S/R …` with pattern 1, so S/R may also move with some other setting.)

**Custom orders: the amp accepts any order written as one 20-byte DT1** to `60 00 07 20`, e.g. REV before DLY,
FX1 before OD, CMP moved onto the A path. It reads back exactly, and the pattern number stays as it was.
**Confirmed by ear** (`tools/test_fx_chain.py`, log `logs/fx-chain-20261020-211249.txt`): with a 5150 DRIVE amp and
hall reverb, moving REV in front of PrA (impossible with the 3 patterns) clearly changed the sound. **The DSP follows a
custom chain**, not just the stored list.

**Single-position writes are rejected** (a swap done as two single-byte writes leaves the chain unchanged), presumably
because each intermediate state has a duplicate block. Always write the whole chain.

**PREAMP A: GAIN.SW `60 00 00 5A` is locked at 1 (MIDDLE)**: writing 0 (LOW) is dropped.

**CHORUS block ON `60 00 06 00` is locked at 0.** For chorus use FX1/FX2 type CHORUS (29), a 2x2 chorus with a crossover
(`60 00 03 39`–`42` for FX1), which works.

**COMP is locked:** COMP ON `60 00 00 20` stays 0 even with CMP moved onto the live path. Its other settings are stored.

### Reading while the amp is echoing

The first FX-chain run crashed on its final 1-byte read-back: the old `rq1` stopped as soon as it had `size` bytes from
**any** address, and a pattern write makes the amp echo 20+ messages (positions, knob and LED states). `rq1` now only
counts the requested addresses and retries twice on a timeout, as Tone Studio does. Reading straight after a pattern
write now works.

## Tuner (TODO §4): not available on the 50 MK1

- Tone Studio never turns the tuner on. It only reads running mode `7F 00 00 02` (0 normal, 1 tuner, 2 multi tuner)
  and receives pitch DT1s: `7F 00 05 00` (single) or `7F 00 02 00`–`0A` (per string), 2 bytes each: note index
  (0 = C … 11 = B, `0C` = no signal) and cents + 50. `tools/tuner.py` displays this if a tuner ever runs.
- On this amp running mode reads 0 and **ignores writes**.
- `CTL/EXP: ACCEL/CTL: FUNC` `60 00 07 50` (and EXP SW FUNC `07 60`) **accept 22 = TUNER** (they reject 21 AMP CTL and
  23 S/R). But nothing could trigger the CTL: no MIDI CC (sweep below), and `7F 01 01 03`/`04` are tap tempo.
- The amp has no tuner control on its panel. Conclusion: the tuner code is shared with other Katana models; the 50 MK1
  has no usable tuner. Untested: a physical footswitch on a CTL jack, if the 50 MK1 has one.

## MIDI CC map on the KATANA port (TODO §5, partial)

`tools/cc_sweep.py` sent CC 1–119 (value 127 then 0, channel 1; RX channel is 1, omni off) and logged what the amp
reported (log `logs/cc-sweep-20261020-211916.txt`):

| CC | Effect |
|---|---|
| 16 | BOOSTER on/off `60 00 00 30` (+ knob/LED state) |
| 17 | FX2 on/off `60 00 03 4C` |
| 18 | REVERB on/off `60 00 06 10` |
| 19 | SEND/RETURN on/off `60 00 06 55` |
| 80 | PATCH LEVEL `60 00 07 10` (**0 = silent**) |
| 81, 82 | FOOT VOLUME level `60 00 06 33` |

No other CC changed anything, including the MOD (FX1) and DELAY switches. Program Change is not tested yet.
The command-area switches `7F 01 01 03` (TAP) and `04` (TAP2) set DELAY TIME `60 00 05 62` / DELAY2 TIME `60 00 10 50`
(tap tempo).

## Effect types: what the firmware accepts (TODO §4)

`tools/scan_types.py` switched each block off (silent), wrote type values 0–63 and read them back
(log `logs/scan-types-20261020-212239.txt`, data `notes/effect-types-scan.json`).
**For almost every block the firmware accepts exactly Tone Studio's list and rejects everything else**, including
the FX1/FX2 gaps (5, 8, 11, 13, 17, 24, 30, 32–34). So unlike amp models 26/27, there are no mute traps there.

| Block | Type address | Accepted | Not in Tone Studio |
|---|---|---|---|
| COMP | `60 00 00 21` | 0–7 | – (but COMP ON is locked) |
| OD/DS (booster) | `60 00 00 31` | 0–22 | **7, 21, 22** (no names in Tone Studio; 7 is probably LEAD DS in GT naming) |
| EQ | `60 00 11 04` | 0, 1 | – |
| FX1, FX2 | `60 00 01 41`, `60 00 03 4D` | the 30 listed | – |
| DELAY, DELAY2 | `60 00 05 61`, `60 00 10 4F` | 0, 1, 2, 6–10 | – |
| CHORUS | `60 00 06 01` | 0–2 | – |
| REVERB | `60 00 06 11` | 0–6 | **0 AMBIENCE, 2 HALL1** (names from Tone Studio's own `reverb_type` dropdown; its UI shows HALL = 3 = HALL2) |
| PEDAL FX | `60 00 11 11` | 0–2 | – |
| SEND/RETURN mode | `60 00 06 56` | 0–2 | (a mode, not a type list) |
| ACCEL FX | `60 00 06 70` | 0–5 | – (ACCEL is on the dead B path) |

**Listening test** (`tools/listen_types.py`, clean JC-120, each extra next to a known type):

| Extra | Result |
|---|---|
| Booster 7 | **Works**: a real drive type (name unconfirmed; probably LEAD DS) |
| Booster 21, 22 | **Mute the amp**: accepted but silent, like amp models 26/27 |
| Reverb 0 AMBIENCE | **Works** |
| Reverb 2 HALL1 | **Works** |

So the replacement app gains **3 hidden effect types** (booster 7, AMBIENCE, HALL1) and must **block booster 21 and 22**.

### Rule for the app: "accepted" ≠ "works"

The firmware's write filter rejects most invalid values, but some values it accepts make no sound
(PREAMP A TYPE 26, 27; OD/DS TYPE 21, 22). They look like DSP slots for algorithms other models have. An app must
use an allow-list per model, not the firmware's read-back.

## Switching channels from software (TODO §3, §5)

Log: `logs/patch-switch-20261020-212807.txt`.

- **SysEx** `00 01 00 00` = `<hi> <lo>` (Tone Studio's method) switches immediately. In editor mode the amp pushes the new
  current patch, then the whole edit buffer and the changed knob/LED states (~29 DT1s).
- **MIDI Program Change** on the KATANA port, channel 1, works too. Numbering follows the KATANA-100 layout
  (MAP SELECT `00 02 00 0D` = 0; the PC map at `00 02 01 00` is 1:1 but apparently not the one in use):

| PC# (byte) | Amp slot | Channel |
|---|---|---|
| 1, 2 (0, 1) | 1, 2 | A:CH1, A:CH2 |
| 3, 4 (2, 3) | – | ignored (would be the 100's A3, A4) |
| 5 (4) | 0 | PANEL |
| 6, 7 (5, 6) | 5, 6 | B:CH1, B:CH2 |
| 8+ | – | ignored |

- **The hidden slots 3, 4, 7, 8 are the KATANA-100's A3, A4, B3, B4.** The amp ignores switching to them (SysEx or PC),
  and ignores the write (`7F 00 01 04`) and copy (`7F 00 01 00`) commands aimed at them. They can still be read and
  written directly at `10 nn …`, so an app can use them as extra storage, but they can't be played.

## Saving with the amp's write command (TODO §3)

`7F 00 01 04` = `00 <slot>` saves the edit buffer into a visible slot. Tested on A:CH2 (renamed the edit buffer, saved,
read the slot, then renamed back, saved again and verified the whole slot against the backup).

- The amp echoes `7F 00 01 04`, then pushes the current patch and the whole edit buffer, like a channel change.
- **The saved slot keeps EXP FUNC = 4.** The command copies the edit buffer inside the amp, so the SysEx write filter
  doesn't apply.
- **So an exact restore of a visible slot is possible:** switch to the slot (loads its stored data, including EXP FUNC),
  write the backup into the edit buffer (skipping filtered bytes), then save with `7F 00 01 04`. Direct writes to
  `10 nn …` can't restore EXP FUNC 4. Hidden slots can only be restored directly, so slot 3 keeps EXP FUNC 1.
