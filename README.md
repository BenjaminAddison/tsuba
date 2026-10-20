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
| `tools/extract.sh` | Rebuilds `extracted/` and `decompiled/` from `vendor/archives/` |
| `tools/build_effects_map.py` | Regenerates `notes/effects-map.json` from `decompiled/` |
| `tools/katana.py` | SysEx client for the amp (python-rtmidi): identity, RQ1/DT1, editor mode, logging |
| `tools/*.py` (others) | Hardware tests and utilities: `backup.py`, `restore.py`, `listen.py`, sweeps and scans (see [07](notes/07-hardware-results.md)) |
| `logs/` | Output of the hardware test runs |
| `vendor/` | Original Roland downloads (Tone Studio v4.0.0 installer + manuals, USB driver v1.0.1) |
| `extracted/tone_studio_air_app/` | The unpacked Adobe AIR app (SWF, address map, presets, native extension) |
| `decompiled/` | JPEXS ActionScript output: `tone_studio_as3/` (app), `rwc_ane_as3/` (native extension) |

Hardware tools run from a venv: `python -m venv .venv` then `.venv\Scripts\pip install python-rtmidi` (Windows). `backups/` (your own patches) is git-ignored.

The repo is private and includes the Roland downloads, the unpacked app and the decompiled code, so agents and other
machines get everything on clone. To rebuild them from scratch: put `bts_katana_w400.zip` (Tone Studio for KATANA v4.0.0, Windows) in `vendor/archives/`, install the
JPEXS FFDec flatpak (`com.jpexs.decompiler.flash`), then run `tools/extract.sh`.
