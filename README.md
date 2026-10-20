# Boss Katana 50 MK1 — reverse engineering BOSS Tone Studio

Goal: understand exactly how **BOSS TONE STUDIO for KATANA** talks to a **KATANA-50 MK1**, then build our own
fully custom replacement app.

**Status:** the protocol is decoded from the decompiled Tone Studio v4.0.0. Nothing has been tested on the amp yet.

## Notes

1. [Tone Studio architecture](notes/01-tone-studio-architecture.md): what the app is built from, key classes, native MIDI layer
2. [SysEx protocol](notes/02-sysex-protocol.md): framing, checksum, identity, editor mode, receive routing
3. [Connect sequence](notes/03-connect-sequence.md): startup handshake, timing, retries, exit, **Katana-50 slot remap**
4. [Memory map and patches](notes/04-memory-map-and-patches.md): address areas, 28 amp models, commands, `.tsl` format
5. [Replacement app](notes/05-replacement-app.md): what to build, what can be unlocked, hardware test plan, open questions

## Layout

| Folder | Contents | In git? |
|---|---|---|
| `notes/` | Findings | yes |
| `tools/extract.sh` | Rebuilds `extracted/` and `decompiled/` from `vendor/archives/` | yes |
| `vendor/` | Original Roland downloads (Tone Studio v4.0.0 installer + manuals, USB driver v1.0.1) | no (Roland copyright) |
| `extracted/tone_studio_air_app/` | The unpacked Adobe AIR app (SWF, address map, presets, native extension) | no |
| `decompiled/` | JPEXS ActionScript output: `tone_studio_as3/` (app), `rwc_ane_as3/` (native extension) | no |

To rebuild: put `bts_katana_w400.zip` (Tone Studio for KATANA v4.0.0, Windows) in `vendor/archives/`, install the
JPEXS FFDec flatpak (`com.jpexs.decompiler.flash`), then run `tools/extract.sh`.
