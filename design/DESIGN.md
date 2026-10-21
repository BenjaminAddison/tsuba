# Tsuba — UI design brief (Katana editor, egui)

The look is retro-modern spec-sheet / HUD on near-black. Think a printed equipment label crossed with a 1980s tactical display: solid off-white label bars, cut corners, 1px hairlines, monospaced meta text, and a few muted retro accent stripes. It should feel calm, precise and dense, never glossy.

This brief covers visuals and layout only. All hardware behaviour, protocol and parameter data is yours to define. Block names, parameter lists and values in the mockups are **sample content**.

Mockup boards: 01 Editor, 02 Effects, 03 Monitor (optional), 04 UI Kit.

---

## 1. Hard rules

- Flat fills only. No blur, no shadows, no gradients. The hatch and barcode decor are drawn as plain line segments and rects.
- All strokes are 1px. Corners are square, or **cut** (one 45° chamfer, top-right only). Never rounded.
- Motion is limited to **movement and fading**. No scaling, bouncing, springs or colour tweens.
- Fonts are fixed instances: Archivo Bold / ExtraBold in Normal, SemiExpanded and Expanded, plus a mono companion (mockups use IBM Plex Mono Regular; swap if needed).
- Text is left-aligned. Never justify.
- Use the standard OS title bar. Inside the window, the top row is an app bar, not window chrome.

## 2. Colour tokens

| Token | Hex | Use |
|---|---|---|
| `BG` | `#0B0B0A` | Window ground, inputs, graph wells |
| `PANEL` | `#121211` | Panel bodies |
| `RAISED` | `#1C1B19` | Hover row, active list item (not selected) |
| `LINE` | `#2A2926` | Hairlines, dividers, inactive tab outline |
| `EDGE` | `#4A4842` | Panel borders, control borders, slider track, knob ticks |
| `TEXT_3` | `#8A867D` | Meta labels (10px), axis labels |
| `TEXT_2` | `#A29E94` | Secondary text, unselected option text |
| `INK` | `#ECE8DE` | Primary text, label bars, selected fills, active borders |
| `INK_ON` | `#0B0B0A` | Text on INK fills (sub-text on INK: `#3A3833`) |
| `CORAL` | `#F2685A` | **Accent**: knob tip, slider thumb, unsaved dot, combined EQ curve, drag ghost edge. Drive category |
| `STEEL` | `#6F8FB8` | Modulation category, received/RX |
| `MUSTARD` | `#EDB03E` | Time-FX category, **focus ring**, sent/TX |
| `SAND` | `#D8C8A4` | Dynamics / EQ / routing category |
| `SAGE` | `#8FB98B` | Online / OK / confirmed |

The accent should be a single runtime setting (default CORAL). The only translucency allowed is the drag ghost at 45% opacity.

## 3. Type

| Role | Face | Size | Notes |
|---|---|---|---|
| Display (patch name) | Archivo ExtraBold, Normal | 64 | Line height 0.92, tracking −4.5%, sentence case |
| Wordmark | Archivo ExtraBold, Normal | 22 | Tracking −4.5%, small ™ |
| Label bar / tab / button | Archivo ExtraBold, Expanded | 11–12 | Uppercase, +4% tracking |
| Control value (dropdown, type) | Archivo ExtraBold, Expanded | 14–16 | Uppercase |
| List item (channel, block name) | Archivo ExtraBold, SemiExpanded | 12–13 | Uppercase |
| Numeric readout | Archivo Bold, SemiExpanded / Expanded | 13–20 | Knob values zero-padded to 3 digits (`062`) |
| Meta / table / help | Mono Regular | 10–12 | Uppercase for labels, sentence case for help text |

## 4. Spacing and shape

- Spacing scale: 2, 4, 6, 8, 10, 12, 16, 18, 24, 40. Screen padding and panel gaps are 16. Panel body padding is 16.
- Minimum hit target is 44px tall for every clickable thing, including list rows, segmented options and graph handles (the visible handle can be 10px).
- Cut-corner sizes:
  - main panel 18
  - side panel 16
  - chain block 10–12
  - tab and primary button 10
  - small button / quick pick 8
  - label-bar slant 8
- Panel border: draw the cut polygon filled `EDGE`, then the same polygon inset 1px filled `PANEL`. Both share the cut, which gives a clean 1px chamfered border.

## 5. Components

**Panel (the core block)**
- Header row, 30px tall, with a `LINE` bottom divider.
- Label bar: `INK` fill, `INK_ON` ExtraBold Expanded 12px uppercase text. The right edge slants 8px.
- Hatch block (optional, about 40–64px wide): 2px `INK` lines at 45° with a 6px pitch, the same slant as the label bar.
- Meta text: mono 10px `TEXT_3`, right-aligned, with about 28px right padding so it clears the cut.
- The body sits on `PANEL`.

**Read-only panel**
- Square corners with a 1px dashed `EDGE` border.
- Outlined label with a lock icon and `TEXT_2` text. No INK fill anywhere.
- Use it for things set on the amp itself (power control, master).

**Group bracket**
- A small 6px corner tick, then a mono label, then a line that ends in a down-tick.
- Groups knobs: PREAMP (Gain, Volume) | EQ / 3-BAND (Bass, Middle, Treble) | POWER AMP (Presence). Groups are separated by 1px `LINE` verticals.

**Buttons**

| Kind | Look |
|---|---|
| Primary | `INK` fill, `INK_ON` text, 10px cut. Optional ▸▸ glyph. One per view (WRITE TO AMP) |
| Secondary | Transparent with a 1px `EDGE` border |
| Hover | Border goes `EDGE` → `INK`. Fill doesn't change |
| Pressed / selected | `INK` fill |
| Focus | 2px `MUSTARD` outline, offset 2px |
| Disabled | Dashed `LINE` border, `TEXT_3` text |
| Icon | 44×44 square with a 1px `EDGE` border |

Keep primary actions in their own strip (`PANEL` fill, `LINE` border), away from decor such as barcodes and stripes.

**Selectable block** (quick picks, channels, power-style choices)
- Off: `EDGE` outline, `TEXT_2` text.
- On: `INK` fill, `INK_ON` text.
- 8–10px cut. A mono index (`01`) sits on the left and the label on the right.

**Tabs**
- Active: `INK` fill with a 10px cut.
- Inactive: `LINE` outline with an open bottom edge.
- Content is a mono number followed by an ExtraBold Expanded label.

**Dropdown / combo**
- 50px tall on a `BG` well with an `EDGE` border.
- Layout: `MODEL` meta label, value in ExtraBold Expanded 16px, `09 / 26` count, then a 50px chevron cap separated by a 1px divider.
- Open state: the border goes `INK`, the cap fills `INK` with an `INK_ON` chevron, and the list appears beneath in a 1px `INK` frame.
- Options are 44px tiles in a wrapping grid, each with a mono index and a Bold SemiExpanded name.

**Switch**
- 34×16 outline in `INK` with a 12×10 square thumb: `INK` when on, `EDGE` when off.
- The label to its left reads ENABLED / BYPASSED.

**Tick slider**
- Rows are 44px tall.
- A 1px `EDGE` track, with a 3px `INK` fill from 0 to the value.
- Ticks every 10% underneath, 6px tall in `EDGE`.
- Thumb is an 8×15 accent rect.
- The label sits top-left (mono 10px `TEXT_2`) and the value top-right.

**Segmented enum**
- 44px cells with a 3px gap.
- Selected cell is `INK` fill. Others have an `EDGE` border.

**Knob** (about 104px)
- Sweeps 270° (7:30 → 4:30).
- Ticks every 5 units, with longer ticks every 25, in `EDGE`.
- Value arc: 3px `INK` over a 3px `LINE` track.
- Inner circle is `BG` with an `EDGE` ring. The pointer is a 2px `INK` line, and a 6px accent square marks the arc end.
- Under the knob, a hairline carries the name (left) and a 3-digit value (right).
- Interaction: drag vertically, Shift for fine control.

**Channel list**
- Rows are 48px with a 4px colour pip, name, and an amp-model sub-line.
- The selected row is inverted.
- Grouping: PANEL, then a `BANK A` bracket over A:CH1 and A:CH2, then a `BANK B` bracket over B:CH1 and B:CH2.

**Chain block**

| State | Look |
|---|---|
| Active | `EDGE` border on `PANEL` |
| Selected | `INK` fill, `INK_ON` text |
| Bypassed | `LINE` border on `BG`, `TEXT_3` text, hatched bar |
| Dragging | Ghost at 45% opacity with an accent edge, sitting in its target slot |

- 10px cut. Contents: slot number and grip (6 dots) on top, then name, then type, then a 4px category-colour bar at the bottom.
- A 1px `EDGE` "bus" line runs behind the row, with IN / OUT labels at its ends.

## 6. Screens

**01 Editor** (three columns, wrapping to one on narrow windows)
- *Left, about 250px:*
  - CHANNELS panel with the 5 channels as above.
  - LIBRARY panel with search, a tone list, and IMPORT / + NEW.
- *Centre:*
  1. Patch label in the Strata style: hairline-ruled. Top row has `PATCH / ID …` and a barcode. Middle row has a 10-line colour stripe stack beside left-aligned status text and three outline icons. Then the big patch name, then a `CHANNEL / A:CH2 … AMP / CLEAN` mono 18px line.
  2. Action strip: UNSAVED dot and text, then REVERT and WRITE TO AMP.
  3. AMP panel with the MODEL dropdown (26 models), a QUICK row (ACOUSTIC, CLEAN, CRUNCH, LEAD, BROWN), and the three knob groups.
- *Right, about 280px:*
  - DEVICE panel with a radar decor, model, and a spec list (connection, device ID, channel, buffer).
  - ON THE AMP read-only panel.
- No level meters.

**02 Effects**
- SIGNAL CHAIN across the full width:
  - 12 equal slots, drag to reorder.
  - While dragging, the ghost sits in the slot under the cursor and the other blocks slide to their new slots (180ms ease-out). Dropping commits the order.
  - Clicking a block selects it.
  - Below the chain, a legend for the category colours and bypassed.
- Two panels side by side below the chain:
  - **Parameters**: a header with the block name, category chip and `POSITION 10 / 12`. A toolbar with ENABLED switch, TYPE dropdown, and ◀ ▶ move buttons (the keyboard alternative to dragging). Then a 5–20 parameter grid of tick sliders and segmented enums in 3 columns. Selecting AMP shows a short note that links to the Editor.
  - **Frequency response**: a log-frequency graph from 20 Hz to 20 kHz and ±24 dB.
    - Grid lines at 50 / 100 / 200 / 500 / 1k / 2k / 5k / 10k and every 6 dB in `#242320`. The 0 dB line is a dashed `EDGE` line.
    - Each band component is drawn thin: `EDGE`, or `INK` when its band is selected. The combined curve is 2px accent.
    - Square handles per band are hollow, or accent-filled when selected.
    - Above the graph, band chips (LOW CUT, LOW, LO-MID, HI-MID, HIGH, HIGH CUT). Below it, a readout of BAND / FREQ / GAIN / Q (or SLOPE). It updates live as parameters move.

**03 Monitor** (optional dev view)
- Listener panel with a radar, counters, TX/RX/command filter toggles, and pause / export.
- A log table (rows 36px, the selected row inverted, TX in `MUSTARD` and RX in `STEEL`).
- A frame decode drawn as a row of byte blocks colour-coded by role. Command bytes use `INK` fill, address bytes a `STEEL` outline, data `CORAL` fill, and checksum `MUSTARD` fill.
- An address map with 5-segment confidence bars, and a probe form.

**Persistent chrome** (every screen)
- App bar (44px): wordmark, 4-line colour stripe mark, `KATANA EDITOR / 0.1`, and a LINK status tag on the right.
- Tab row: 01 EDITOR, 02 EFFECTS, 03 MONITOR.
- Status bar (30px, mono 10px): ONLINE · BUFFER · DEVICE ID · shortcut hint.

## 7. Motion

| What | Timing |
|---|---|
| Chain reorder slide | 180ms ease-out (`left` only) |
| Drag ghost fade | 120ms linear to 45% |
| Dropdown open / close | Instant, or a 120ms fade |
| Selection changes | Instant |

## 8. Decor (use sparingly, at most one per panel)

- **Colour stripe stack**: horizontal 3px lines in CORAL / SAND / STEEL / MUSTARD, 4px gap.
- **Barcode**: 75×26, irregular 1–3px `INK` bars.
- **Hatch block**: in panel headers only.
- **Radar**: dotted outer ring, two inner rings, a crosshair, and one accent sweep line. Device panel or Monitor only.
- **Group bracket**: see components.

Decor never carries meaning and never sits next to a primary action.
