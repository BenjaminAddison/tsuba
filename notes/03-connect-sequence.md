# 03 — Connect sequence, timing and lifecycle

Confirmed from `ToneCentralLogic.as` (state machine) and `SystemExclusive.as` (messages).
A replacement app should do the same steps in the same order.

## Startup

| # | Step | Message(s) | On failure |
|---|---|---|---|
| 1 | Find ports | OS enumeration; pick the in/out pair named `KATANA` (remembered in a SharedObject) | Port-select dialog |
| 2 | Get device ID | `F0 7E 7F 06 01 F7` → reply byte [2] | Connect timeout → port-select dialog |
| 3 | Identify model | `F0 7E <dev> 06 01 F7` → check prefix + model nibble (see 02) | `CONNECT_FAULT` → port-select dialog |
| 4 | Check comm level | RQ1 `7F 00 00 00` size `00 00 00 01` | Must be `05`, else warning popup |
| 5 | Enter editor mode | DT1 `7F 00 00 01` = `01` (sent straight after step 4's reply) | |
| 6 | Wait 100 ms | | |
| 7 | Read patch names | One RQ1 per slot: `10 nn 00 00`, size `00 00 00 10` (16-byte name) | 3 s timeout, up to 6 retries, then an error dialog |
| 8 | Read system settings | 3 RQ1 blocks, one at a time: `00 00 00 50` ×8, `00 00 04 00` ×75 (0x4B), `00 02 00 00` ×48 (0x30) | 3 s timeout per block, **up to 6 retries**, then an error dialog |
| 9 | Global EQ quirk | If the global EQ setting type is set: DT1 `00 00 04 3F` = `00`, then `01` (`PRM_SYS_EQ_TYPE` toggle, presumably to force a refresh) | |
| 10 | Read edit buffer | 3 RQ1s of size `00 00 08 00`: `60 00 00 00`, `60 00 08 00`, `60 00 10 00` | |
| 11 | Read current patch no. | RQ1 `00 01 00 00` size 2 → value = `hi*128 + lo` | Setup timeout → port-select dialog |
| 12 | Ready | Start 1 s health-check timer | |

The **health check** only re-enumerates MIDI and audio ports every 1,000 ms (`HEALTH_CHECK_TIME`) to notice unplugging.
It sends no SysEx. If the device comes back, the app reconnects from step 2.

## While editing

- **Single parameter change**: one DT1 to the parameter's `60 …` address. It is live immediately and not saved.
- **Whole patch push** (load from library): the edit buffer is written as **22 DT1 chunks, one every 30 ms**
  (`setTemporaryTimer = Timer(30)`; block list `temporaryDecimalPatchSize` in `blockParameterSetting`).
  A patch change on the amp during the push aborts it (`writeStop`).
- **Change patch / channel**: DT1 `00 01 00 00` = `<hi> <lo>`. This is resent every **500 ms** until the amp
  echoes the new current patch number (`patchChangeRetryTimer`).
  - A current-patch value of **400** appears to be a special or temporary state. The app stores the previous number and does not treat it as a real patch change.
- **Save (write)**: DT1 `7F 00 01 04` = `00 <slot>` writes the edit buffer to a slot.
- **Copy**: DT1 `7F 00 01 00` = `<src hi lo> <dst hi lo>`. `7F 7F` appears to mean "the edit buffer".
- **Patch map / reorder**: 4 DT1 chunks to `7F 70 …`, then DT1 `7F 71 00 00` = `00`. Timeout 1 s.
- **Write a stored patch directly**: the same 22 chunks, but to `10 nn …` instead of `60 00 …` (`setPatchParams`).

## Exit / port change

1. DT1 `7F 00 06 00` = `01` (USB direct monitor back on)
2. DT1 `7F 00 00 01` = `00` (editor mode off)

**A replacement app must always turn editor mode off on exit.**

## Katana-50 slot numbering (important for our amp)

The KATANA-50 has 5 slots, but the amp's addressing uses the KATANA-100's 9-slot layout.
When the model is KATANA-50, Tone Studio remaps the slot numbers both ways (`_exchangePatchNuumber`):

| App slot | Label | Amp slot number |
|---|---|---|
| 0 | PANEL | 0 |
| 1 | A: CH1 | 1 |
| 2 | A: CH2 | 2 |
| 3 | B: CH1 | **5** |
| 4 | B: CH2 | **6** |

The remap applies to:
- user-patch addresses `10 <slot> xx xx`
- the data of `00 01 00 00` (current patch) and `7F 00 01 04` (patch write)

**So on our amp, B:CH1 is `10 05 …` and B:CH2 is `10 06 …`.**
