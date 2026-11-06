# Tsuba — UI design brief: "Outboard" (Katana editor, egui)

The editor looks like a stack of rack-mount outboard gear: brushed dark faces with ears and screws, silkscreened
labels, grey keycaps with an LED above each, machined aluminium knobs, and VFD windows lit in one lamp colour.
It should feel like hardware you already own: tactile, dense and calm, with light only where something is on.

Mockup boards (from the design canvas): Main (Editor), Effects, Control, Library, Monitor, Details (components and
states), Palette (command palette), and DirA/B/C (the explored directions; A was chosen). Values in them are sample
content; the app shows the amp's own data.

---

## 1. Rules

- **One lamp colour lights everything**: every LED, VFD, memory tick and glow. It is a setting (status bar, LAMP),
  default MUSTARD. Silkscreen, keycaps and the cream meter never change colour.
- **Red is reserved** for WRITE and DELETE (and LISTEN while capturing).
- Light means state: a lit LED = on / latched / edited. Nothing glows for decoration.
- Keys travel 1.5px when latched. The LED above a key is its state; the key face never changes colour.
- Use the standard OS title bar. Inside the window, the top unit is the app bar.

## 2. Colour tokens

| Token | Value | Use |
|---|---|---|
| `BODY` / `RAIL` | `#0D0D0F` / `#040404` | Window ground; darker rails at the sides |
| `FACE` | `#222325` → `#1B1C1E` | Unit faces (vertical gradient, 3px brushing lines) |
| `SILK` | `#E8E4DC` | Silkscreen titles and labels (13:1 on the face) |
| `SILK2` | `#A29D95` | Secondary silk (6.1:1) |
| `SILK3` | `#8F8A83` | Tertiary: hints, bypassed blocks (4.8:1) |
| `KEY` | `#414245` → `#2C2D30` | Keycaps, text `#ECE8E0` |
| `KEY · RED` | `#D8532F` → `#A63A20` | WRITE, DELETE, LISTEN; text `#FFF4EA` |
| `GLASS` | lamp 5% on `#050302` | VFD windows, with a 3px dot screen, inner shade and a 162° glare |
| `METER FACE` | `#F3DFAF` | The cream VU meter |
| Lamps | MUSTARD `#FFB547` · CORAL `#FF6B4A` · SAGE `#8CFFB4` · STEEL `#7FDBFF` · SAND `#FFE3B3` | The lamp colour |

Lit VFD text is the lamp mixed with 18% white plus a soft glow. Unlit annunciators are the lamp at 22% on near-black.
A selected VFD row inverts: lamp fill, `#170D02` text.

## 3. Type

| Role | Face | Size | Notes |
|---|---|---|---|
| Silkscreen title / label | Archivo Bold, Expanded | 10–11 | Uppercase, +0.2em, 1px black drop |
| Secondary silk, key caps | Archivo Bold, SemiExpanded | 8.5–9.5 | Uppercase, +0.16em |
| Block title (DELAY 1) | Archivo ExtraBold, Expanded | 20 | |
| Values, tables, VFD text | JetBrains Mono Regular / Bold | 9–15 | Tabular |
| Patch name display | Doto ExtraBold (dot matrix) | 21–34 | Patch name, DIFF counter, big parameter value only |

The fonts are fixed instances embedded in the app (`app/fonts`, all OFL).

## 4. The unit

- A unit is a full-width rack face: 3px radius, drop shadow `0 10 18 #00000090` plus a 2px black lip.
- **Ears** 34px each side: darker, with vertical brushing and a groove; each holds 1 rack slot (units under 110px)
  or 2, with a domed cross-head screw at a random angle.
- **Header**: silk title top-left (never a bar), optional SILK2 subtitle, a 1px rule that fades to the right, an
  optional right-hand title, and the outlined unit number (`03`).
- Sections inside a unit are split by a **groove** (1px shadow + 1px highlight).
- Units stack with a 5px gap; 12px rails either side of the stack.

## 5. Components

**Keycap**: 4px radius, grey gradient, inset top highlight, 2px solid drop + soft shadow. Hover brightens it,
latched/pressed moves it down 1.5px with an inset shade. Label in SILK2-style caps. The 12×4 LED sits 5px above.

**LED**: dark window `lamp 13%` when off; lit = white-hot top fading through the lamp, with a glow. Round LEDs (5px)
mark edited knobs; bar LEDs (12×4) sit over keys and chain blocks.

**Knob**: 270° sweep (−135°…+135°), 11 ticks; large knobs add numbers 0–10 and minor ticks, tone knobs 0 and 10.
Machined skirt (radial gradient), knurled edge (alternating 3° wedges), spun cap with a conic sheen, black
pointer with a white dot. **Memory tick**: when the value differs from the stored channel, a lit tick marks the stored
value. Drag up/down (Shift = fine), wheel, arrows (Shift = ×10), **double-click recalls memory**. Under it: LED dot
(lit when edited), silk name, value (lit when edited). Sizes: L 92 (gain, volume), M 74 (tone), E 64 (effect
parameters), S 42 (trims).

**Fader**: slot track with ticks either side, a grey cap with a white index line, memory tick. Click or drag.

**Stepper**: ◀ [VFD value] ▶; clicking the value opens the full list on glass.

**Rocker**: I/O switch for a block's master on/off (AMP in the preamp header).

**VFD window**: 5px black bezel, glass, dot screen, inner shade, glare. Rows are selectable (invert) and hover with a
faint lamp wash.

**Signal path row**: IN → blocks → OUT on a bus with arrows. Blocks are outlined (on), dim (bypassed), dashed (fixed
by firmware), cream-filled (AMP, or the selected block on Effects). LED above, type below. FX1 and FX2 are slots that
hold any of 30 effects, so their blocks are named by the effect they hold (CHORUS), with the slot (FX 1) below.

**Pedal**: each effect drawn as a stompbox of its own. The box follows the generic enclosures real pedals use,
by effect family: **mini** (1590A proportions, jacks on top: boosts, gates, simple octaves), **compact** (1590B/125B:
overdrives, filters, sims, dynamics), **chamfered** compact (top corners cut: distortion, metal), **arched** compact
(curved top edge: vintage modulation, spring and room reverbs), **wide** (1590BB, two rows of knobs: EQs, phasers,
flangers), **twin** (the wide box with two footswitches, one per delay: the delay block), **big box** (1590DD, jacks
on top: big fuzz, synths, pitch, big reverbs), **wedge** (sloped face between a flat rear strip and a front lip:
vintage fuzz, ring mod) and the **treadle**. Each box has its own footprint in the pedalboard slot, knob layout and
jack position, and the board's patch cables run from jack to jack. Each type then has an enclosure colour, a finish
(gloss, sparkle, brushed, hammertone or a stripe) and a small stroke graphic of what it does (a clipped wave for drives, decaying bars for
delays, arcs for reverbs, sliders for a graphic EQ), with knobs for its main settings, the lamp-colour LED, and a
footswitch on a darker plate. Wahs, the pitch bend and the foot volume are treadles: rubber ridges, a lit position
gauge, the toe as the switch. Print is near-black on light enclosures and cream on dark ones. The designs are the
app's own: no maker's logos or trade dress. Fixed blocks show at 40% under a dashed FIXED band; the amp is the KATANA
combo (black tolex, handle, corner caps, a dotted grille between silver pipings, a plain nameplate where
the badge sits; no maker's logo), wider than a pedal and dimmed when the preamp is off.

**Cover key** (DELETE): a red key under a translucent flip cover. The first click lifts the cover, the second deletes.

**Footswitch**: hex nut, chrome cap, LED above; label and its MIDI CC (or setting) under it.

**VU meter**: cream face, 0–10 scale with a red top fifth, black needle, glass reflection.

**Jewel**: pilot lamp (link state) and the five lamp-colour picks.

## 6. Screens

Every screen: the **top unit** (pilot jewel, KATANA-50 MK1, link + ping time, the five mode keys, a SEARCH window
that opens the command palette, CTRL K, ?) and the **status unit** (MIDI IN/OUT LEDs that flicker on traffic, EDITOR
MODE, TX/RX/ERR counters on glass, a hint or the latest message, LAMP colour jewels).

**Editor**
1. PATCH MEMORY: channel keys grouped LIVE / BANK A / BANK B; the dot-matrix display (annunciators PANEL A B CH1 CH2
   EDIT MIDI MEM, name and length, then the touched parameter against memory or the channel's state; double-click to
   rename); DIFF counter (hover lists the edits); REVERT; WRITE (red, LED blinks while unsaved).
2. SIGNAL PATH: click a block to engage/bypass it, drag to reorder, double-click to open it on Effects. Legend.
3. PREAMP · A: the panel's 5-way TYPE selector (ACOUSTIC CLEAN CRUNCH LEAD BROWN) plus a stepper over all 26 models;
   LEVEL (gain, volume); TONE (bass, middle, treble, presence); SOLO and BRIGHT keys, SOLO LVL and T-COMP trims;
   the AMP rocker.
4. RESPONSE: the EQ (or MASTER EQ, or both) on glass, band handles to drag, wheel for Q, band keys and a readout.
   MASTER EQ · PATCH: five faders; the VU meter showing the USB audio send level; MASTER and POWER noted as set on
   the amp.

**Effects**: compact PATCH unit; SIGNAL PATH (click selects, drag reorders); PEDALBOARD (the live path as pedals
cabled in order: click selects, the footswitch engages); BLOCK unit: title (the effect, for FX1/FX2), type chip
(click for every type), ON, MOVE ◀ ▶, RESET (back to memory), unit pages (DELAY 1/2), type keys for short lists, the
block's pedal (its knobs turn the main settings, its footswitch engages it), a visual on glass (delay repeats, the EQ curve, or every setting as a bar), knobs for numbers and keys/steppers for lists.
PARAMETER panel: the touched parameter (value, memory, range), its CLI line with COPY, and the assigns driving it with
+ ASSIGN CONTROL.

**Control**: ASSIGN · MATRIX (8 assigns on glass with on/off keys; edit source, target search, min/max knobs, mode,
wave shape and rate). CTL · PEDALS (the six CTL/EXP functions), STOMP (footswitches for the blocks the amp's buttons
and MIDI CCs switch), PATCH · GLOBAL (patch level, BPM, key).

**Library**: TONES (find, voicing filters with counts, FOLDER, IMPORT, SAVE AS TONE); LIBRARIAN table (name, amp,
chain dots, age) with keyboard selection; PREVIEW (name, file, note, amp, chain, preamp bars, EQ curve, APPLY,
COPY JSON, DELETE under a cover); BACKUP (all five channels to `backups/`, load any channel of the latest backup).

**Monitor**: SHOW filters with counts, CAPTURE (PAUSE, LISTEN, REC timer), TX/RX rate meters and msg/s; LOG table
(time, kind tag, decoded, frame); DECODE (frame bytes by role, command, address, value, checksum, bits, COPY HEX,
RESEND own edit-buffer writes) or ADDR MAP (confidence bars); READ probe with a hex/ASCII dump.

**Command palette** (Ctrl+K): searches parameters (with a value bar, ← → nudge) and commands; Enter runs a command
in the CLI's syntax, Tab completes.

## 7. Fitting the KATANA-50 MK1

The mockups were drawn before some hardware findings; the app follows the amp:
- Blocks the firmware fixes (COMP, CHORUS, PRE B, divider, mixer) are dashed and can't be engaged; ACCEL FX is on
  the dead B path, so Control's ACCEL FX section became PATCH · GLOBAL, and MANUAL MODE became STOMP.
- AMP / FX / BOTH on the response became EQ / MASTER / BOTH: only the EQ blocks are modelled, not amp tone stacks.
- MASTER · GLOBAL faders are the patch's MASTER EQ. The amp's MASTER volume and POWER can't be read, so the meter
  shows the USB send level and MASTER/POWER are noted as set on the amp.
- RESTORE loads a backed-up channel into the edit buffer (WRITE keeps it) rather than writing slots directly, so
  values the firmware filters on direct slot writes survive (notes/07).

## 8. Motion

| What | Timing |
|---|---|
| Key travel | instant 1.5px |
| Chain reorder slide | 180ms ease-out |
| Drag ghost | 120ms fade to 45% |
| WRITE LED, unsaved display line | 1Hz blink |
| MIDI IN/OUT LEDs | lit ~90ms per message |
| Search cursor | 1Hz blink |
