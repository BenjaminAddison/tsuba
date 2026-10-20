# 01 — How BOSS Tone Studio for KATANA is built

Source: BOSS TONE STUDIO for KATANA **v4.0.0** (Windows, July 2020), decompiled with JPEXS.
All code paths below are relative to `decompiled/tone_studio_as3/scripts/`.

## The short version

Tone Studio is an **Adobe AIR / Flex app written in ActionScript 3**. All amp logic is in the SWF.
It reaches the hardware through one small Roland native extension (`com.roland.rwc`), which is a thin
wrapper over the OS MIDI API. The protocol is plain **Roland SysEx over USB-MIDI**. Nothing is encrypted,
and there is no proprietary USB layer.

```
Tone Studio (AS3/Flex, .swf)
   │  "F0,41,00,00,00,00,33,12,..."   (comma-separated hex string)
   ▼
RWC native extension (RWCANE.dll, AIR ANE)
   │  midiOutLongMsg / midiInAddBuffer   (WinMM; CoreMIDI on macOS)
   ▼
Roland USB driver (RDWM1179.SYS)  — or class-compliant snd-usb-audio on Linux
   │  USB-MIDI, port "KATANA"
   ▼
KATANA amp (USB 0582:01D8) — a flat SysEx memory map
```

## Package contents (`extracted/tone_studio_air_app/`)

| File | What it is |
|---|---|
| `BOSS_TONE_STUDIO_for_KATANA.swf` | The whole app (UI + protocol), 1,749 AS3 classes |
| `_assets/data/addressmap_gt.json` | **The amp memory map**: 2,300+ named parameters → address + size |
| `_assets/data/katana_preset_patches.tsl` | The 9 factory patches as JSON (see 04) |
| `_assets/data/katana.json` | Cloud endpoints (BOSS Tone Central, Roland API telemetry, firmware URLs) |
| `META-INF/AIR/extensions/com.roland.rwc/` | Native extension: `RWCANE.dll` + its AS3 wrapper `library.swf` |
| `META-INF/AIR/application.xml` | AIR manifest (id `BOSS-TONE-STUDIO-for-KATANA`, v4.0.0) |

The app was forked from the **GT-001 / GT-100 editor**. Names like `addressmap_gt.json`, `ParameterDefinitionGT`,
`model_id_gt001` and `"device":"GT"` in `.tsl` files come from that, and the amp runs a GT-style effects engine.

## Key classes

| Class | File | Role |
|---|---|---|
| `SystemExclusive` | `tonecentral/systemexclusive/SystemExclusive.as` | **All MIDI I/O.** Singleton. Builds and parses SysEx, checksum, block reads/writes, patch change/copy/write, receive routing |
| `SysExParams` | `tonecentral/systemexclusive/SysExParams.as` | Device ID, identity-reply validation, amp-model detection, parameter stores |
| `AddressMap` | `tonecentral/mediator/AddressMap.as` | Loads `addressmap_gt.json`, exposes `command_*`, `model_id`, etc. |
| `ToneCentralLogic` | `tonecentral/ToneCentralLogic.as` | **Connect state machine**, timeouts, retries, 1 s device health check, exit |
| `ToneCentralMediator` | `tonecentral/mediator/ToneCentralMediator.as` | Global app state (`ampModel`, `connected`, ...) |
| `ParameterDefinitionGT` | `tonecentral/common/define/ParameterDefinitionGT.as` | Parameter ranges and value lists (preamp types, effect types, patch slot names) |
| `SystemSettingDefinitionGT` | `tonecentral/common/define/` | System/global settings UI definitions |
| `CTLAssignTargetDefinitionGT` | `tonecentral/common/define/` | What CTL/EXP/assigns can target |
| `TemporaryParams`, `SystemParams`, `MidiParams` | `tonecentral/parametors/` | Typed copies of the amp's memory blocks; `getExData(addr,size)` serialises a block |
| `views/edit/amp/*` | `tonecentral/views/edit/amp/` | Amp/effect UI panels |
| `LiveSetDataAccess` | `tonecentral/common/storage/` | Local patch library in AIR's built-in SQLite |
| `common/log/*`, `common/net/*` | | Telemetry to api.roland.com, Tone Central downloads. Not needed for a replacement |

## Native extension API (`decompiled/rwc_ane_as3/scripts/com/roland/rwc/Rwc.as`)

Every call goes through `ExtensionContext.call(name, ...)` into `RWCANE.dll`:

| Function | Purpose |
|---|---|
| `DEVICE_searchMidiInputEndpoints` / `...OutputEndpoints` | Enumerate MIDI ports |
| `DEVICE_selectMidiInputEndpoint` / `...OutputEndpoint` | Open a port |
| `DEVICE_midiOutput(str)` | Send one SysEx; `str` = comma-separated hex bytes `"F0,41,...,F7"` |
| `DEVICE_*Audio*` | Enumerate/select audio devices (used by the built-in audio player) |
| `PLAYER_*` | Play backing audio files |

Incoming MIDI arrives as an AIR `StatusEvent` with `code = "native_midi_event"`. Its `level` field holds the
bytes as XML (`<data>F0</data><data>41</data>...`). `SystemExclusive.onStatusEvent` parses it.

**For a replacement app, this whole layer is just "open the MIDI port named KATANA and send/receive SysEx."**
Web MIDI, python-rtmidi, ALSA `amidi` and RtMidi all do this.
