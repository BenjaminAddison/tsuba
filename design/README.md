# Tsuba design (UI reference)

The UI mockups for the replacement app, copied from the design canvas
(https://claude.ai/code/artifact/455ff085-23ff-4156-901d-09f3a1483f10) on 2026-10-21.
They are a **reference**, not code: the app in `app/` reimplements them in egui with live data from the amp.

- [DESIGN.md](DESIGN.md): the brief: colour tokens, type, spacing, components, screens, motion.
- `Main.dc.html` (01 Editor), `Effects.dc.html` (02 Effects), `Monitor.dc.html` (03 Monitor), `Kit.dc.html` (04 UI Kit).
  Block names, parameters and values in them are sample content.
- `canvas.json`: the canvas layout. `support.js` and `vendor/`: the runtime that renders the boards in a browser.

To view: `python3 -m http.server -d design` and open http://localhost:8000/Main.dc.html (browsers block the scripts
over `file://`). The fonts load from Google Fonts.
