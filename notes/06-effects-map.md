# 06 — Full effects mapping

**Yes, we have it all.** [`effects-map.json`](effects-map.json) lists every effect block, every type and every
parameter Tone Studio can edit: **20 blocks, 773 parameter rows, every one with an address.**
Rebuild it with `python3 tools/build_effects_map.py`.

## How it was built

| Source (decompiled) | Gives |
|---|---|
| `ParameterDefinitionGT.*_TYPE` | Type lists: value → name (e.g. FX1 19 = PHASER) |
| `ParameterDefinitionGT.*_PARAMS_LIST` | Per type: parameter id, display name, min/max/step |
| `ParameterDefinitionGT.DROPDOWN_LIST` | Value names for enum parameters (speaker types, modes...) |
| `TemporaryParams.setData()` | Parameter id → edit-buffer address. This is the receive-side lookup and is complete. The send side (`getParamForEx`) misses 12 extended params (EVH95 pedal, Heavy Octave) |

Cross-checked: randomly sampled addresses all match the official names in `addressmap_gt.json`
(e.g. `fx1_uni_v_depth` → `60 00 03 15` = "FX1: UNI-V: DEPTH").

## JSON shape

```json
"FX1": {
  "on_off_address": "60 00 01 40",
  "type_address":   "60 00 01 41",
  "types":  [{"val": 19, "name": "PHASER"}, ...],
  "params": {
    "PHASER": [{"id": "fx1_phaser_rate", "name": "RATE", "address": "60 00 02 76",
                "bytes": 1, "min": 0, "max": 100, "step": 1}, ...]
  }
}
```

Blocks with no type selector use the key `"DEFAULT"`. Some typed blocks also have a `"DEFAULT"` list of shared params.

## Encoding rules

- **Raw byte = displayed value − min.** Example: PREAMP T-COMP shows −10…+10, so a display of 0 is stored as `10`.
  EQ gains show −20…+20 dB, so 0 dB is stored as `20`. Confirmed in the factory `.tsl` presets.
- **`bytes: 2`** params (delay times, pre-delays) are split into two 7-bit bytes: value = `hi*128 + lo`, `hi` first.
- **Address key:** the code indexes the edit buffer as `addr[2]*256 + addr[3]`. That is how `60 00 02 76` becomes key 630.
- **Type values are not contiguous.** The gaps (e.g. FX 5, 8, 11, 13, 17, 24, 30, 32–34) are GT-100 effects that Tone Studio
  doesn't offer on the Katana. Whether the amp still accepts them is untested.

## Blocks

| Block | On/off | Type select | Types | Param rows |
|---|---|---|---|---|
| COMP | `60 00 00 20` | `60 00 00 21` | 8 | 4 |
| OD/DS (Booster) | `60 00 00 30` | `60 00 00 31` | 20 | 7 |
| PREAMP A | `60 00 00 50` | `60 00 00 51` | 28 | 27 |
| PREAMP B | `60 00 01 00` | `60 00 01 01` | 28 | 27 |
| EQ | `60 00 01 30` | `60 00 11 04` | 2 | 24 |
| FX1 (Mod) | `60 00 01 40` | `60 00 01 41` | 30 | 234 |
| FX2 (FX) | `60 00 03 4C` | `60 00 03 4D` | 30 | 245 |
| DELAY | `60 00 05 60` | `60 00 05 61` | 8 | 56 |
| DELAY2 | `60 00 10 4E` | `60 00 10 4F` | 8 | 56 |
| CHORUS | `60 00 06 00` | `60 00 06 01` | 3 | 7 |
| REVERB | `60 00 06 10` | `60 00 06 11` | 5 | 8 |
| PEDAL FX | `60 00 06 20` | `60 00 11 11` | 3 | 17 |
| ACCEL FX | — | `60 00 06 70` | 6 | 26 |
| FOOT VOLUME | — | — | — | 4 |
| DIVIDER | — | `60 00 06 40` (mode) | — | 10 |
| MIXER | — | `60 00 06 50` (mode) | — | 3 |
| SEND/RETURN | `60 00 06 55` | `60 00 06 56` (mode) | — | 4 |
| NS1 / NS2 | `60 00 06 63` / `06 68` | — | — | 2 / 3 |
| MASTER SETTING | — | — | — | 9 |

## Type lists (value → name)

- **COMP:** 0 BOSS COMP, 1 HI-BAND, 2 LIGHT, 3 D-COMP, 4 ORANGE, 5 FAT, 6 MILD, 7 STEREO COMP
- **OD/DS:** 0 MID BOOST, 1 CLEAN BOOST, 2 TREBLE BOOST, 3 CRUNCH OD, 4 NATURAL OD, 5 WARM OD, 6 FAT DS, 8 METAL DS, 9 OCT FUZZ, 10 BLUES DRIVE, 11 OVERDRIVE, 12 T-SCREAM, 13 TURBO OD, 14 DISTORTION, 15 RAT, 16 GUV DS, 17 DST+, 18 METAL ZONE, 19 '60S FUZZ, 20 MUFF FUZZ
- **PREAMP A/B:** see the table in [04](04-memory-map-and-patches.md#preamp-amp-model-types) (0–27)
- **EQ:** 0 PARAMETRIC EQ, 1 GE-10
- **FX1 / FX2** (same list): 0 T.WAH, 1 AUTO WAH, 2 PEDAL WAH, 3 COMP, 4 LIMITER, 6 GRAPHIC EQ, 7 PARAMETRIC EQ, 9 GUITAR SIM, 10 SLOW GEAR, 12 WAVE SYNTH, 14 OCTAVE, 15 PITCH SHIFTER, 16 HARMONIST, 18 AC.PROCESSOR, 19 PHASER, 20 FLANGER, 21 TREMOLO, 22 ROTARY, 23 UNI-V, 25 SLICER, 26 VIBRATO, 27 RING MOD, 28 HUMANIZER, 29 CHORUS, 31 AC.GUITAR SIM, 35 PHASER 90E, 36 FLANGER 117E, 37 WAH 95E, 38 DC-30, 39 HEAVY OCTAVE
- **DELAY / DELAY2:** 0 DIGITAL, 1 PAN, 2 STEREO, 6 REVERSE, 7 ANALOG, 8 TAPE ECHO, 9 MODULATE, 10 SDE-3000
- **CHORUS:** 0 MONO, 1 STEREO1, 2 STEREO2
- **REVERB:** 1 ROOM, 3 HALL, 4 PLATE, 5 SPRING, 6 MODULATE
- **PEDAL FX:** 0 PEDAL WAH, 1 PEDAL BEND, 2 WAH 95E
- **ACCEL FX:** 0 S-BEND, 1 LASER BEAM, 2 RING MOD, 3 TWIST, 4 WARP, 5 FEEDBACKER

## Not in the JSON yet

- **Sub-types** (`*_SUB_TYPE_LIST`: CUSTOM booster/preamp shaping, harmonist harmony, PEDAL WAH sub-models).
- Values built by function calls in `DROPDOWN_LIST` (reverb time, chorus pre-delay, mixer balance, tempo-synced
  rates and delay times). Their raw ranges are in the JSON, but not their display labels.
- **Assigns / CTL / EXP / GA-FC** targets (`CTLAssignTargetDefinitionGT.as`) and **system** settings (`SystemSettingDefinitionGT.as`).
- **Which params are visible for which type** (`ENABLE_PATTERN_LIST`). The JSON already groups params per type, which covers most of this.
