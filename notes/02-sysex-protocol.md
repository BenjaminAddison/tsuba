# 02 — The SysEx protocol

Confirmed from decompiled code (`SystemExclusive.as`, `SysExParams.as`) unless marked otherwise.

## USB / MIDI ports

From the driver INF (`vendor/usb_driver_v1.0.1/files/64bit/RDIF1179.INF`):

- USB ID **`0582:01D8`** (Roland, KATANA). Audio + MIDI composite device.
- MIDI ports: **`KATANA`** (editor traffic, the one Tone Studio uses), `KATANA DAW CTRL`, `KATANA CTRL`.
- Windows needs Roland's driver. On Linux the stock `snd-usb-audio` driver should expose the ports (untested on this amp).

## Message framing

Roland "Model ID 4 bytes" SysEx. Maker ID `41`, model ID **`00 00 00 33`**.

```
Read  (RQ1): F0 41 <dev> 00 00 00 33 11 <a1 a2 a3 a4> <s1 s2 s3 s4> <sum> F7
Write (DT1): F0 41 <dev> 00 00 00 33 12 <a1 a2 a3 a4> <d1 ... dn>    <sum> F7
```

- `<dev>` = device ID, learned from the identity reply (see below).
- Address and size are 4 bytes, **7-bit each** (every byte is 00–7F). So `60 00 08 00` is 8×128 = 1,024 bytes after `60 00 00 00`.
- The amp answers an RQ1 with one or more **DT1** messages carrying the data.
- Incoming messages are only accepted if they are `F0 41 <dev> 00 00 00 33 12` (`chekckSysExVal`).

## Checksum (`getCheckSum`)

Roland standard over the address and data (or size) bytes:

```
sum = (128 - (a1+a2+a3+a4 + d1+...+dn) % 128) % 128
```

Verified examples:

| Purpose | Message |
|---|---|
| Editor mode ON | `F0 41 <dev> 00 00 00 33 12 7F 00 00 01 01 7F F7` |
| Preamp A gain = 50 | `F0 41 <dev> 00 00 00 33 12 60 00 00 52 32 1C F7` |
| Read 16-byte patch name | `F0 41 <dev> 00 00 00 33 11 60 00 00 00 00 00 00 10 10 F7` |

## Identity / device detection

1. **Broadcast identity request**: `F0 7E 7F 06 01 F7`.
   The app takes **byte [2] of the reply** as the device ID (`requestResponce` case `"deviceID"`).
2. **Directed identity request**: `F0 7E <dev> 06 01 F7`.
   The reply must start with **`F0 7E <dev> 06 02 41 33 03 00 00`** and end with `F7` (`SysExParams.checkID`).
   - `41` = Roland, `33 03` = family code, `00 00` = family number.
   - The **low nibble of byte [10]** (the first software-revision byte) identifies the model:

| Value | Model |
|---|---|
| 0 | **KATANA-50** (ours) |
| 1 | KATANA-100 |
| 2 | KATANA-100/212 |
| 3 | KATANA-HEAD |
| 4 | KATANA-Artist |
| 5–7 | Rejected → "connect fault" (probably later models; unconfirmed) |

## Editor communication level and mode (`7F 00 00 0x`)

- **`7F 00 00 00` — communication level** (read with RQ1, size 1). This is a **protocol-version handshake**.
  Tone Studio v4.0.0 only continues if the value is exactly **`05`**:
  - `00`–`04` → "low communication level" popup (the amp firmware is too old)
  - `05` → OK
  - `06+` → "high communication level" popup (the app is too old)

  Both popups link to the firmware download page.
- **`7F 00 00 01` — editor mode.** The app writes `01` right after reading the level and writes `00` on exit or port change.
  In editor mode the amp sends **DT1s to the app when its state changes** (patch change, knob moves).
  The receive router handles unsolicited `60 …` and `00 01 00 00` messages, which supports this.
  Exactly which panel actions echo still needs testing on hardware.
- On exit the app also writes USB direct monitor `7F 00 06 00` = `01`.

## Receive routing (`setResponceData`)

Unsolicited and requested DT1s are routed by their first address byte:

| First byte | Area | Handler |
|---|---|---|
| `00 01 00 00` (exact) | Current patch number | Patch changed on the amp → reload |
| `7F 01 00 03` (exact) | Patch-clear command echo | |
| `00` | System / MIDI settings | `systemDataReceive` |
| `10`, `20` | Stored user / preset patches | `patchDataReceive` |
| `60` | **Edit buffer** (the patch you hear right now) | `temporaryDataReceive` |
| `7F` | Command area | `commandDataReceive` |
