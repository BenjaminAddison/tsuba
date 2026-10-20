"""TODO section 4: listen to the effect types the amp accepts but Tone Studio doesn't offer (from scan_types.py).

    python tools/listen_types.py [seconds per step]     (default 6; Ctrl+C stops early)

Booster: types 7, 21, 22 next to known references. Reverb: 0 (AMBIENCE) and 2 (HALL1) next to ROOM and HALL2.
Clean amp (JC-120) throughout. Edit buffer only: snapshotted first and restored at the end.
"""
import sys
import time

from katana import Katana, Log
from restore import restore_edit_buffer, snapshot_edit_buffer

PRE_A = [0x60, 0, 0x00, 0x50]  # on, type, gain
ODDS = [0x60, 0, 0x00, 0x30]  # on, type, drive, bottom, tone, solo sw, solo level, effect level, direct mix
REV = [0x60, 0, 0x06, 0x10]  # on, type, time
REV_LEVEL = [0x60, 0, 0x06, 0x18]


def odds(t):
    return [(ODDS, [1, t, 50, 50, 50, 0, 50, 50, 0])]


def rev(t):
    return [(REV, [1, t, 50]), (REV_LEVEL, [70])]


STEPS = [
    ("BOOSTER: play riffs and chords", None),
    ("booster type 6  FAT DS (known reference)", odds(6)),
    ("booster type 7  ?? not in Tone Studio (maybe LEAD DS)", odds(7)),
    ("booster type 20 MUFF FUZZ (known reference)", odds(20)),
    ("booster type 21 ?? not in Tone Studio", odds(21)),
    ("booster type 22 ?? not in Tone Studio", odds(22)),
    ("booster OFF (dry clean amp)", [(ODDS, [0])]),
    ("REVERB: play short chords and stop to hear the tail", None),
    ("reverb type 1 ROOM (known reference)", rev(1)),
    ("reverb type 0 AMBIENCE ?? not in Tone Studio", rev(0)),
    ("reverb type 2 HALL1 ?? not in Tone Studio", rev(2)),
    ("reverb type 3 HALL2 (Tone Studio's HALL)", rev(3)),
]


def main():
    secs = float(sys.argv[1]) if len(sys.argv) > 1 else 6
    log = Log("listen-types")
    with Katana() as k:
        k.identify()
        k.editor_on()
        snap = snapshot_edit_buffer(k)
        try:
            k.dt1(PRE_A, [1, 8, 30])  # clean JC-120
            k.dt1(REV, [0])
            k.recv_all(0.2)
            for i in range(3, 0, -1):
                log(f"starting in {i}...")
                time.sleep(1)
            n = 0
            for label, writes in STEPS:
                if writes is None:
                    log(f"--- {label}")
                    continue
                n += 1
                for a, d in writes:
                    k.dt1(a, d)
                k.recv_all(0.1)
                bad = [a for a, d in writes if k.rq1(a, len(d)) != d]
                log(f"[{n:2d}] {label}{'  ** NOT ACCEPTED **' if bad else ''}")
                time.sleep(secs)
        except KeyboardInterrupt:
            log("stopped early")
        finally:
            bad = restore_edit_buffer(k, snap)
            log(f"edit buffer restored: {'OK' if not bad else f'{len(bad)} bytes differ: {bad[:6]}'}")
    log.close()


if __name__ == "__main__":
    main()
