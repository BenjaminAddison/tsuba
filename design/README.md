# Tsuba design (UI reference)

The UI mockups for the replacement app, copied from the design canvas "Katana Editor GUI"
(https://claude.ai/artifact/NiY4FcMLwDBGJjgX5BG3nW) on 2026-11-04. They are a **reference**, not code: the app in
`app/` reimplements them in egui with live data from the amp.

- [DESIGN.md](DESIGN.md): the brief: the "Outboard" look, colour tokens, type, components, screens, motion, and
  what changed to fit the KATANA-50 MK1.
- `Main.dc.html` (Editor), `Effects.dc.html`, `Control.dc.html`, `Library.dc.html`, `Monitor.dc.html`,
  `Details.dc.html` (components and states), `Palette.dc.html` (command palette), `DirA/B/C.dc.html` (explored
  directions; A was chosen). Values in them are sample content.
- `canvas.json`: the canvas layout. `support.js` and `vendor/`: the runtime that renders the boards in a browser.

To view: `python3 -m http.server -d design` and open http://localhost:8000/Main.dc.html (browsers block the scripts
over `file://`). The fonts load from Google Fonts.
