# Next steps (2026-10-21)

Tsuba (the app in `app/`) and its backend (`katana/`) are built but **have never talked to the real amp**.
Nothing is committed yet.

## 1. Commit (on Linux)

```
git add -A && git commit -m "Add Tsuba app (egui), katana backend and design reference"
git push
```

runing it

```
sudo dnf install alsa-lib-devel                   
# one-time: Linux headers the MIDI and audio code needs to build

cargo run --release -p tsuba -- --demo            
# no amp: sample patch, for trying the UI

cargo run --release -p tsuba                      
# with the amp plugged in over USB
```


## 2. First run on Windows

1. Install Rust: https://rustup.rs (default options), then `git pull`.
2. **Close Tone Studio** (it locks the MIDI ports). Plug in the amp.
3. From the repo root, test the backend first:
   ```
   cargo run --release -p katana -- info         # should print device ID, slot and chain
   cargo run --release -p katana -- listen 20    # turn knobs: lines should appear
   cargo run --release -p katana -- apply tones/warm-dreamy.json
   cargo run --release -p katana -- meter 10     # play: L/R levels from USB audio
   ```
4. Then the app: `cargo run --release -p tsuba`

## 3. What to check in the app (note anything odd)

- [ ] It connects by itself (top right: green LINK) and the patch name and knobs match the amp.
- [ ] Turn a knob **on the amp**: the app's knob follows. Turn one **in the app**: the sound changes.
- [ ] Click a channel: the amp switches. Switch on the amp: the app follows.
- [ ] Right after switching channel, the strip says **IN SYNC** (not UNSAVED EDITS). If it says UNSAVED, tell me.
- [ ] Change something → UNSAVED EDITS → REVERT puts it back; WRITE TO AMP (or Ctrl+S) saves it.
- [ ] Effects tab: drag a block (e.g. REVERB before AMP). Does the sound change as expected?
- [ ] Effects tab: switch blocks on/off, change types, move sliders.
- [ ] EQ: drag handles on the graph, scroll for Q. Do the curves look plausible?
- [ ] Unplug the amp: the app shows SEARCHING; plug it back in: it reconnects.
- [ ] Startup feels fast? Any lag while dragging a knob quickly?
- [ ] Library: click a tone to load it; + NEW saves the current sound into `tones/`.

## 4. Bring back to the next session

- Anything from the list above that failed, plus a screenshot if it looks wrong.
- The Monitor tab's **.TXT ↓** export (saved in `logs/`) if something misbehaves.
- By ear: what booster type 7 sounds like (currently labelled "LEAD DS", a guess).

## Open items for later

Tracked in `notes/TODO.md` §7: EQ shelf frequencies (guessed), Linux MIDI/audio port names, .tsl import,
the MCP server.
