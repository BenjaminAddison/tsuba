**Tsuba** — editor for the BOSS KATANA-50 MK1. Windows, 64-bit.

## Download

- **`tsuba.exe`** — the app. Self-contained: the fonts and the parameter data are built in, so there is no installer and no runtime to add.
- **the `.zip`** — the same exe plus the `tones/` folder of shareable tone files and the README.

## Running it

Plug the KATANA-50 into USB and start `tsuba.exe`. It finds the amp by itself and reconnects if you unplug it.
**Close BOSS Tone Studio first** — Windows gives one program at a time the amp's MIDI ports.

Without an amp, `tsuba.exe --demo` opens a sample patch for looking around (also `--tab NAME` and `--palette QUERY`).

Put the `tones/` folder next to the exe, or run the exe from a folder that has one, to get the tones on the Library
screen; the app writes its channel backups there as well.

The exe is unsigned, so SmartScreen says "Windows protected your PC" the first time: **More info**, then **Run anyway**.
