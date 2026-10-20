"""Map what each MIDI CC does on the KATANA port, and look for one that triggers the CTL function (set to TUNER).

    python tools/cc_sweep.py

For CC 1-119 (skipping bank select 0/32): send value 127, then 0, on MIDI channel 1, and log every DT1 the amp sends
back (editor mode on) plus the running mode (7F 00 00 02: 1/2 = tuner on). Edit buffer only: the whole edit buffer is
snapshotted first and written back at the end. Switching channel and back also reloads the stored patch.
"""
import time

from katana import Katana, Log, hexs
from restore import restore_edit_buffer, snapshot_edit_buffer

RUNNING_MODE = [0x7F, 0, 0, 0x02]
CTL_FUNC = [0x60, 0, 0x07, 0x50]  # CTL/EXP: ACCEL/CTL: FUNC
TUNER = 22


def main():
    log = Log("cc-sweep")
    with Katana() as k:
        k.identify()
        k.editor_on()
        rx = k.rq1([0x00, 0x02, 0x00, 0x00], 2)
        log(f"MIDI RX channel {rx[0] + 1}, omni {rx[1]}; sending on channel 1")
        snap = snapshot_edit_buffer(k)
        k.dt1(CTL_FUNC, [TUNER])
        k.recv_all(0.2)
        log(f"CTL FUNC set to {k.rq1(CTL_FUNC, 1)[0]} (22 = TUNER)")
        found = []
        try:
            for cc in range(1, 120):
                if cc == 32:
                    continue
                effects = []
                for val in (127, 0):
                    k.out.send_message([0xB0, cc, val])
                    for m in k.recv_all(0.15):
                        if k._is_dt1(m):
                            effects.append(f"{hexs(m[8:12])}={hexs(m[12:-2][:4])}")
                    mode = k.rq1(RUNNING_MODE, 1)[0]
                    if mode:
                        found.append((cc, val, mode))
                        log(f"CC {cc} = {val}: RUNNING MODE {mode} (TUNER ON?)")
                if effects:
                    shown = list(dict.fromkeys(effects))
                    log(f"CC {cc:3d}: {', '.join(shown[:8])}{' ...' if len(shown) > 8 else ''}")
            if not found:
                log("no CC changed the running mode")
        except KeyboardInterrupt:
            log("stopped early")
        finally:
            if k.rq1(RUNNING_MODE, 1)[0]:
                log("tuner still on: sending the CCs that turned it on again to toggle it off")
                for cc, _, _ in found[:1]:
                    k.out.send_message([0xB0, cc, 127])
                    k.out.send_message([0xB0, cc, 0])
                    k.recv_all(0.3)
            bad = restore_edit_buffer(k, snap)
            log(f"edit buffer restored: {'OK' if not bad else f'{len(bad)} bytes differ: {bad[:6]}'}")
    log.close()


if __name__ == "__main__":
    main()
