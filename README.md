# Boss Katana 50 MK1 — reverse engineering BOSS Tone Studio

Goal: understand exactly how **BOSS TONE STUDIO for KATANA** talks to a **KATANA-50 MK1**, then build our own
fully custom replacement app.

**Status:** the protocol is decoded from the decompiled Tone Studio v4.0.0. Hardware testing has started; see [07](notes/07-hardware-results.md).

## Notes

1. [Tone Studio architecture](notes/01-tone-studio-architecture.md): what the app is built from, key classes, native MIDI layer
2. [SysEx protocol](notes/02-sysex-protocol.md): framing, checksum, identity, editor mode, receive routing
3. [Connect sequence](notes/03-connect-sequence.md): startup handshake, timing, retries, exit, **Katana-50 slot remap**
4. [Memory map and patches](notes/04-memory-map-and-patches.md): address areas, 28 amp models, commands, `.tsl` format
5. [Replacement app](notes/05-replacement-app.md): what to build, what can be unlocked, hardware test plan, open questions
6. [Effects map](notes/06-effects-map.md): every effect block, type and parameter with its address and range ([JSON](notes/effects-map.json))
7. [Hardware results](notes/07-hardware-results.md): what the real amp does

**Next steps:** [notes/TODO.md](notes/TODO.md): hardware tests, what we need, what's left to extract.

## Layout

| Folder | Contents |
|---|---|
| `notes/` | Findings |
| `app/` | **Tsuba**, the replacement app (Rust, egui), in the "Outboard" rack look: Editor (patch memory, chain, preamp, EQ response, master EQ, USB level meter), Effects (drag-to-reorder chain, block settings), Control (assigns, CTL/EXP pedals, footswitches), Library (tones, preview, backups) and Monitor screens, plus a Ctrl+K command palette |
| `katana/` | Its backend: SysEx/MIDI (`amp.rs`), parameter catalog and tone files (`catalog.rs`), EQ curves (`response.rs`), USB audio meter (`audio.rs`), a test CLI (`main.rs`) |
| `design/` | The UI design the app follows: [DESIGN.md](design/DESIGN.md) and the mockup boards |
| `tones/` | Shareable tone files (JSON with named parameters) |
| `tools/extract.sh` | Rebuilds `extracted/` and `decompiled/` from `vendor/archives/` |
| `tools/build_effects_map.py` | Regenerates `notes/effects-map.json` from `decompiled/` |
| `tools/build_ctl_map.py` | Regenerates `notes/ctl-map.json` (assign targets and sources, CTL/EXP functions) from `decompiled/` |
| `tools/katana.py` | SysEx client for the amp (python-rtmidi): identity, RQ1/DT1, editor mode, logging |
| `tools/*.py` (others) | Hardware tests and utilities: `backup.py`, `restore.py`, `listen.py`, sweeps and scans (see [07](notes/07-hardware-results.md)) |
| `logs/` | Output of the hardware test runs |
| `vendor/` | Original Roland downloads (Tone Studio v4.0.0 installer + manuals, USB driver v1.0.1) |
| `extracted/tone_studio_air_app/` | The unpacked Adobe AIR app (SWF, address map, presets, native extension) |
| `decompiled/` | JPEXS ActionScript output: `tone_studio_as3/` (app), `rwc_ane_as3/` (native extension) |

## Download

Tagged builds are on the [releases page](../../releases): `tsuba.exe` on its own, or a zip of the exe plus `tones/`.
Windows 64-bit, self-contained, no installer. To cut a new one, push a version tag
(`git tag v0.1.0 && git push origin v0.1.0`), or run Actions › Release › **Run workflow** with **publish** ticked to
tag the version in `app/Cargo.toml`. Either way [`.github/workflows/release.yml`](.github/workflows/release.yml)
builds the exe on a Windows runner and publishes the release.

## Running the app

Rust 1.95+ (`rustup` on Windows; Fedora's `cargo` works on Linux). From the repo root:

```
cargo run --release -p tsuba            # the app; connects to the KATANA by itself, reconnects if unplugged
cargo run --release -p tsuba -- --demo  # no amp: a sample patch, for UI work (also --tab NAME, --palette QUERY)
cargo run --release -p katana -- info   # the backend's test CLI (also: get, set, apply, chain, listen, meter)
cargo test -p katana
```

Windows: close Tone Studio first (MIDI ports are exclusive). Linux needs `alsa-lib-devel` to build. The release exe
is self-contained (fonts and parameter data are built in); it looks for `tones/` in the current folder, else next to itself.

Hardware tools run from a venv: `python -m venv .venv` then `.venv\Scripts\pip install python-rtmidi` (Windows). `backups/` (your own patches, and the app's Library › BACK UP ALL CHANNELS files) is git-ignored.

The repo is private and includes the Roland downloads, the unpacked app and the decompiled code, so agents and other
machines get everything on clone. To rebuild them from scratch: put `bts_katana_w400.zip` (Tone Studio for KATANA v4.0.0, Windows) in `vendor/archives/`, install the
JPEXS FFDec flatpak (`com.jpexs.decompiler.flash`), then run `tools/extract.sh`.
