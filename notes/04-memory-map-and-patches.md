# 04 — Memory map, parameters and patch format

The full map is `extracted/tone_studio_air_app/_assets/data/addressmap_gt.json`:
2,306 named entries `{name, address, size}`. Most parameters are 1 byte.
The map is shared by every Katana model, so some entries may not exist on the 50 MK1.

## Top-level areas

| Address | Area | Map key |
|---|---|---|
| `00 00 00 00` | System settings (LCD, play options, USB levels, global EQ, knob positions) | `system` (322) |
| `00 01 00 00` | Setup: current patch number (2 bytes) | `setup` |
| `00 02 00 00` | MIDI settings (channels, PC map) | `midi` (543) |
| `10 nn 00 00` | **Stored user patch `nn`** (see slot numbering in 03) | `user_patch_list_top` |
| `20 nn 00 00` | Factory preset patch `nn` | `preset_patch_list_top` |
| `30 0n …`, `40 0n …` | Quick-setting patches (20 slots; same layout as a patch) | `quickSettingPatchAddress` (code) |
| `60 00 00 00` | **Edit buffer**: the live patch (1,414 params) | `temporary` |
| `7F …` | Commands and state | `command` (26) |

## Edit buffer (`60 00 …`) block layout

| Address | Block |
|---|---|
| `60 00 00 00` | Patch name, 16 ASCII bytes |
| `60 00 00 10` | Output select |
| `60 00 00 20` | COMP |
| `60 00 00 30` | OD/DS (Booster) |
| `60 00 00 50` | **PREAMP A**: on, **type**, gain, T-comp, bass, middle, treble, presence, level, bright, gain SW, solo SW/level, SP type... |
| `60 00 01 00` | PREAMP B (dual-amp engine) |
| `60 00 01 30` | EQ |
| `60 00 01 40` | FX1 (Mod), large per-type block |
| `60 00 03 4C` | FX2 (FX), large per-type block |
| `60 00 05 60` | DELAY |
| `60 00 06 00` | CHORUS |
| `60 00 06 10` | REVERB |
| `60 00 06 20` | PEDAL FX (wah etc.) |
| `60 00 06 30` | Foot volume |
| `60 00 06 40` / `06 50` | DIVIDER / MIXER (A/B amp routing) |
| `60 00 06 55` | SEND/RETURN |
| `60 00 06 60` | Amp control |
| `60 00 06 63` / `06 68` | NS1 / NS2 (noise suppressors) |
| `60 00 06 70` | ACCEL FX |
| `60 00 07 0F` | Patch category |
| `60 00 07 10` | Patch level |
| `60 00 07 11` | Master EQ |
| `60 00 07 16` | Master BPM / key / beat |
| `60 00 07 20` | **FX chain order** (20 positions) |
| `60 00 07 40` | Manual mode |
| `60 00 07 50` | CTL/EXP function |
| `60 00 08 30` – `0A 10` | ASSIGN 1–8 |
| `60 00 0A 30` | Assign common |
| `60 00 10 xx` – `15 xx` | Extended FX params (Tera Echo, Overtone, EVH phaser/flanger, DELAY2, GA-FC footswitch assigns...) |

## Preamp (amp model) types

`PREAMP A: TYPE` (`60 00 00 51`) and `PREAMP B: TYPE` (`60 00 01 01`) take these values (`ParameterDefinitionGT.PREAMP_TYPE`):

| Val | Model | Val | Model |
|---|---|---|---|
| 0 | NATURAL CLEAN | 14 | VO LEAD |
| 1 | FULL RANGE | 15 | MATCH DRIVE |
| 2 | COMBO CRUNCH | 16 | BG LEAD |
| 3 | STACK CRUNCH | 17 | BG DRIVE |
| 4 | HiGAIN STACK | 18 | MS1959 I |
| 5 | POWER DRIVE | 19 | MS1959 I+II |
| 6 | EXTREME LEAD | 20 | R-FIER VINTAGE |
| 7 | CORE METAL | 21 | R-FIER MODERN |
| 8 | JC-120 | 22 | T-AMP LEAD |
| 9 | CLEAN TWIN | 23 | SLDN |
| 10 | PRO CRUNCH | 24 | 5150 DRIVE |
| 11 | TWEED | 25 | CUSTOM |
| 12 | DELUXE CRUNCH | 26 | BGNR UB METAL |
| 13 | VO DRIVE | 27 | ORNG ROCK REVERB |

The front panel only shows 5 types (`AMP_TYPE_LIST`: ACOUSTIC, CLEAN, CRUNCH, LEAD, BROWN). Tone Studio reads that as a
**system knob position** (`sys_knob_pos_type`), not from the patch.

**Evidence that the GT models are real on this amp:** the factory patches store GT model numbers.
PANEL, A-2 and B-1 to B-3 use **23 (SLDN)**, A-1 uses **8 (JC-120)**, A-3 uses **11 (TWEED)**, and A-4 and B-4 use **24 (5150 DRIVE)**.
Whether *every* value 0–27 sounds distinct on the 50 MK1 still needs testing on hardware.

## Command area (`7F …`)

| Address | Size | Command |
|---|---|---|
| `7F 00 00 00` | 1 | Editor communication level (read; must be `05`) |
| `7F 00 00 01` | 1 | Editor mode (`01` on / `00` off) |
| `7F 00 00 02` | 1 | Running mode (read) |
| `7F 00 01 00` | 4 | Patch copy `<src hi lo> <dst hi lo>` |
| `7F 00 01 04` | 2 | Patch write `00 <slot>` |
| `7F 00 02 00` – `0A` | 2 each | Tuner pitch, strings 1–6 (multi mode) |
| `7F 00 05 00` | 2 | Tuner pitch (single mode) |
| `7F 00 06 00` | 1 | USB direct monitor |
| `7F 00 06 01` | 1 | USB in/out mode |
| `7F 01 00 00` | 2 | Quick-setting write |
| `7F 01 00 02` | 1 | A/B utility |
| `7F 01 00 03` | 1 | Patch clear |
| `7F 01 00 04` | 1 | Patch initialise |
| `7F 01 00 07` | 1 | Manual switch |
| `7F 01 01 00` – `04` | 1 each | Switch FX1 / FX2 / FX3 / TAP / TAP2 |
| `7F 70 00 00` | 4×64 | Patch map |
| `7F 71 00 00` | 1 | Apply patch map |

## Patch files (`.tsl`)

JSON, e.g. `katana_preset_patches.tsl`:

```json
{
  "device": "GT", "version": "1.0.0",
  "liveSetData": { "id": "...", "name": "KATANA Preset", ... },
  "patchList": [
    { "name": "KATANA       A-1", "patchNo": null, "category": ..., "note": null,
      "params": { "preamp_a_type": 8, "preamp_a_gain": 60, "reverb_on_off": 1, ... } }
  ]
}
```

- Each patch has **1,057 named params** (snake_case, e.g. `preamp_a_type`). These are not raw bytes.
  Translating them to addresses goes through the `TemporaryParams` class (`tonecentral/parametors/TemporaryParams.as`).
  Its field order and `getExData(addr,size)` define the byte layout. **This is the next thing to extract for a
  replacement app's import and export.**
- Tone Studio keeps its own library in an AIR SQLite DB (`LiveSetDataAccess`, table `livesets`).
