# Tsuba — the complete input surface

Every input the program can take, written as if it were all CLI. This is the functional spec the GUI gets built
from: no screen, no panel, no layout — just *what the user can tell the program to do*, and what each input accepts.

Sources: `extracted/.../addressmap_gt.json` (1340 named parameters in the edit-buffer area), `notes/effects-map.json`
(20 blocks, 698 addresses with ranges and type lists), `notes/07-hardware-results.md` (what the 50 MK1 actually accepts).

**Status column**
| Mark | Meaning |
|---|---|
| ✅ | works today (CLI, GUI, or both) |
| ◻ | the protocol supports it, we have the address, nothing drives it yet |
| 🔒 | the 50 MK1 firmware refuses it — read-only, or must never be offered |

**Live vs stored.** Every write lands in the **edit buffer** (`60 00 00 00`) and is audible immediately but lost on
power-off. `write` copies the edit buffer into one of the 5 channel slots. Nothing else persists.

---

## 1. Session

| Input | Argument | Notes | |
|---|---|---|---|
| `connect` | — | auto: find the KATANA, read device ID, enter editor mode | ✅ |
| `disconnect` | — | leave editor mode cleanly | ✅ |
| `status` | — | link state, device ID, current slot, buffer synced y/n | ✅ |
| `reconnect` | — | after unplug; the worker already retries by itself | ✅ |
| `ping` | — | liveness check (used to notice an unplugged amp) | ✅ |

## 2. Channel and patch

The amp has 5 playable slots: `PANEL`, `A:CH1`, `A:CH2`, `B:CH1`, `B:CH2` (protocol slots 0, 1, 2, 5, 6).

| Input | Argument | Notes | |
|---|---|---|---|
| `select` | `PANEL\|A:CH1\|A:CH2\|B:CH1\|B:CH2` | switches the amp's live channel | ✅ |
| `current` | — | which slot the amp is on | ✅ |
| `write` | `[slot]` | store the edit buffer into a slot (default: current) | ✅ |
| `revert` | — | restore the edit buffer from the slot as stored | ✅ |
| `diff` | `[slot]` | list every byte that differs from the stored slot | ✅ |
| `name` | `"TEXT"` | rename the patch, 16 ASCII chars (`PATCH NAME1..16`) | ◻ |
| `backup` | `FILE` | dump all 5 slots + system area to a file | ✅ (python) |
| `restore` | `FILE [slot]` | write a backup back to the amp | ✅ (python) |

## 3. Amp — PREAMP A

26 models (0–25). **27 and 28 (`BGNR UB METAL`, `ORNG ROCK REVERB`) mute the amp and must never be offered.**

| Input | Argument | Range | |
|---|---|---|---|
| `amp model` | name or index | 26 models | ✅ |
| `amp gain` | 0–100 | | ✅ |
| `amp volume` | 0–100 | `LEVEL` | ✅ |
| `amp bass` | 0–100 | | ✅ |
| `amp middle` | 0–100 | | ✅ |
| `amp treble` | 0–100 | | ✅ |
| `amp presence` | 0–100 | | ✅ |
| `amp bright` | on/off | only meaningful on some models | ◻ |
| `amp t-comp` | 0–100 | tube compression | ◻ |
| `amp solo` | on/off | | ◻ |
| `amp solo-level` | 0–100 | | ◻ |
| `amp on` | on/off | bypass the preamp entirely | ◻ |
| `amp gain-sw` | low/mid/high | 🔒 stuck at MIDDLE | 🔒 |
| `amp sp-type` / `mic-*` / `direct-mix` | — | 🔒 cab sim is off and unreadable on the 50 | 🔒 |
| `amp custom *` | 11 params | only when model = `CUSTOM` | ◻ |

Quick picks — the amp's own 5 panel types, as shortcuts to a model: `acoustic` `clean` `crunch` `lead` `brown`. ✅

## 4. Signal chain

20 ordered positions (`FX CHAIN: POSITION1..20`). On the 50 MK1 the live path is whatever sits between `DIV` and
`MXDV` — usually 12 blocks. Block ids: `CMP S/R PrA PrB EQ FX1 FX2 DLY CHO REV ACC PDL FV NS1 NS2 OD USB DIV MXDV MIX`.

| Input | Argument | Notes | |
|---|---|---|---|
| `chain` | — | print the current order | ✅ |
| `chain set` | 20 block ids | write the whole order | ✅ |
| `chain move` | `BLOCK POSITION` | move one block (what dragging does) | ✅ |
| `chain swap` | `BLOCK ±1` | nudge one block earlier/later | ✅ |
| `chain reset` | — | back to the factory order | ◻ |

## 5. Effect blocks

Every block takes the same three inputs — **on/off**, **type**, and **that type's parameters**. The parameter set
changes with the type, which is why the count column has two numbers.

| Block | on/off | types | params (max per type / all types) | |
|---|---|---|---|---|
| `od` OD/DS booster | ✅ | 20 (+1 hidden `LEAD DS`) | 7 / 15 — drive, bottom, tone, solo, level, mix | ✅ |
| `fx1` | ✅ | 30 | 33 / 245 | ✅ |
| `fx2` | ✅ | 30 | 33 / 245 | ✅ |
| `eq` | ✅ | 2 (parametric, GE-10) | 12 / 24 | ✅ |
| `delay` | ✅ | 8 | 11 / 56 | ✅ |
| `delay2` | ✅ | 8 | 11 / 56 | ✅ |
| `reverb` | ✅ | 5 | 8 | ✅ |
| `pedal` PEDAL FX | ✅ | 3 | 6 / 17 | ✅ |
| `ns` NS1 | ✅ | — | 3 — threshold, release, detect | ✅ |
| `ns2` | ✅ | — | 3 | ✅ |
| `fv` FOOT VOLUME | — | — | 4 — curve, min, max, level | ✅ |
| `sr` SEND/RETURN | ✅ | — | 4 — mode, send, return, adjust | ✅ |
| `comp` | 🔒 off | 8 | 4 | 🔒 |
| `chorus` | 🔒 off | 3 | 7 — use FX1/FX2 type CHORUS instead | 🔒 |
| `accel` ACCEL FX | — | 6 | 7 / 26 — needs a foot switch to trigger | ◻ |
| `preamp-b` | 🔒 off | 28 | 27 | 🔒 |
| `divider` / `mixer` | — | — | 10 / 3 — dual-amp routing, dead on the 50 | 🔒 |

Generic form, which is all the GUI really needs:

```
block on   BLOCK on|off
block type BLOCK TYPE          # e.g. block type fx1 "PEDAL WAH"
block set  BLOCK PARAM VALUE   # e.g. block set eq "LOW-MID FREQ" 250Hz
block get  BLOCK [PARAM]
block reset BLOCK              # type defaults
```

Values take either a number (`35`) or the amp's own label (`"1.60kHz"`, `"ON"`, `"TAPE ECHO"`).

## 6. Any parameter, by name

The escape hatch that covers all 1340 — keep it, it is how everything above is implemented.

| Input | Argument | | |
|---|---|---|---|
| `get` | `"PREAMP A: GAIN"` | ✅ |
| `set` | `"PREAMP A: GAIN" 35` | ✅ |
| `params` | `[filter]` | list names, ranges, current values | ✅ |

## 7. Master and global

| Input | Argument | Notes | |
|---|---|---|---|
| `master eq` | low / mid-freq / mid-q / mid-gain / high | 5 params, per patch | ◻ |
| `master volume` | — | 🔒 the physical knob only | 🔒 |
| `power control` | — | 🔒 amp panel only | 🔒 |
| `tuner` | — | 🔒 not on the 50 MK1 | 🔒 |

## 8. Foot controller and assignments

Fully addressed, nothing drives it — hardware tests are on hold until a controller is bought (`notes/TODO.md`).

| Input | Argument | Notes | |
|---|---|---|---|
| `assign` | `1..8 on\|off` | 8 modulation slots | ◻ |
| `assign target` | `N PARAMETER [min] [max]` | any parameter is a valid target | ◻ |
| `assign source` | `N SOURCE` | expression pedal, GA-FC switch, internal pedal, wave | ◻ |
| `assign curve` | `N trigger/time/curve/rate/waveform` | 5 shaping params per slot | ◻ |
| `ctl` | `ACCEL/CTL\|EXP SW\|SUB CTL1\|SUB CTL2\|EXP\|SUB EXP func/min/max/mode` | 22 params | ◻ |
| `manual` | `BANK UP\|BANK DOWN\|PEDAL1..4\|LOOP\|ACCEL func` | 8 params | ◻ |

## 9. Tone files

A tone is JSON with named parameters (`tones/*.json`), portable between amps.

| Input | Argument | | |
|---|---|---|---|
| `tone list` | — | what's in `tones/` | ✅ |
| `tone show` | `FILE` | resolve without touching the amp | ✅ |
| `tone apply` | `FILE` | write it to the edit buffer | ✅ |
| `tone save` | `[NAME]` | export the edit buffer as a tone | ✅ |
| `tone import` | `FILE...` | copy files into `tones/` (drag-and-drop in the GUI) | ✅ |
| `tone delete` | `FILE` | | ◻ |
| `tone search` | `TEXT` | by name, amp model or active blocks | ✅ |
| `tsl import` | `FILE.tsl` | read Tone Studio's own format | ◻ |

## 10. Monitor and protocol

| Input | Argument | Notes | |
|---|---|---|---|
| `listen` | `[seconds]` | print what the amp pushes (knobs, channel changes) | ✅ |
| `log filter` | `tx\|rx\|edit\|sys\|cmd` | which frames to show | ✅ |
| `log pause` | on/off | | ✅ |
| `log export` | `[FILE]` | | ✅ |
| `log clear` | — | | ◻ |
| `read` | `ADDRESS SIZE` | raw RQ1 probe, read-only on purpose | ✅ |
| `decode` | `FRAME` | explain a frame byte by byte, verify the checksum | ✅ |
| `meter` | `[seconds]` | USB audio output level, L/R peak dB | ✅ |

**No raw write.** A bad DT1 can mute the amp (notes/07); writes go through named parameters only.

## 11. The program itself

Inputs that aren't amp data — they only exist because there is a UI:

| Input | Argument | |
|---|---|---|
| `view` | `editor\|effects\|monitor` | ✅ |
| `select block` | `BLOCK` | which block the parameter editor is showing | ✅ |
| `select band` | `LOW CUT\|LOW\|LO-MID\|HI-MID\|HIGH\|HIGH CUT` | which EQ band the graph highlights | ✅ |
| `accent` | `coral\|steel\|mustard\|sand\|sage` | single accent colour, per the design brief | ◻ |
| `demo` | — | fake amp, for UI work with no hardware | ✅ |
| `tab` | `editor\|effects\|monitor` | which view to open on | ✅ |

## 12. Never offer

From the hardware tests. An app that gets these wrong makes the amp go silent:

- amp models 26, 27 and booster types 21, 22 — accepted, no sound
- `PREAMP B`, `COMP`, `CHORUS`, `DIVIDER`, `MIXER`, cab sim / mic params — writes are dropped
- raw DT1 to an unmapped address
- master volume, power control, tuner — the amp's own panel

---

## The short version

Strip it to the inputs that cannot be removed without losing a feature:

```
select SLOT              write [SLOT]            revert
amp model VALUE          amp gain|volume|bass|middle|treble|presence 0-100
chain set BLOCK...       chain move BLOCK POS
block on BLOCK on|off    block type BLOCK TYPE   block set BLOCK PARAM VALUE
tone list|apply|save|import|search
view VIEW                select block BLOCK      select band BAND
listen                   log filter|pause|export log           read ADDR SIZE
status
```

That is **23 verbs**. Everything in the GUI is one of those 23 with a nicer handle on it — and every screen we draw
should be judged on how directly it exposes them.
