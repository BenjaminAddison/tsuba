"""Restore one stored patch slot from a backups/*.json file made by backup.py, then verify it byte for byte.

    python tools/restore.py <backup.json> <amp slot number>      e.g. restore.py ../backups/x.json 3

The slot number is the amp's (0, 1, 2, 5, 6, plus hidden 3, 4, 7, 8), not the app's.
Writes go straight to 10 <slot> ..., in chunks of at most 64 bytes, 30 ms apart (Tone Studio's pacing).
"""
import json
import sys
import time

from katana import Katana, addr_add, hexs

CHUNK = 64
# Values the firmware refuses on write, although factory patches contain them (notes/07). Keyed by the low 2 address bytes.
FILTERED = {(0x08, 0x10): "CTL/EXP: EXP FUNC: SysEx only accepts 0 OFF / 1 FOOT VOLUME; factory value 4 PB/FV becomes 1"}


def slot_segments(backup, slot):
    for key, area in backup.items():
        if key.startswith("user_") and area["address"] == hexs([0x10, slot, 0, 0]):
            return [([int(x, 16) for x in a.split()], list(bytes.fromhex(d))) for a, d in area["segments"]]
    raise KeyError(f"slot {slot} not in backup")


def write_segments(k, segs, pace=0.03):
    """Write segments in DT1s of at most CHUNK bytes. Bytes in FILTERED are skipped: writing them can only make
    them worse (e.g. EXP FUNC 4 would become 1), and leaving them alone keeps the value already in the amp."""
    n = 0
    for addr, data in segs:
        runs, start = [], 0
        for i in range(len(data) + 1):
            if i == len(data) or tuple(addr_add(addr, i)[2:]) in FILTERED:
                if i > start:
                    runs.append((start, i))
                start = i + 1
        for lo, hi in runs:
            for off in range(lo, hi, CHUNK):
                k.dt1(addr_add(addr, off), data[off:min(off + CHUNK, hi)])
                n += 1
                time.sleep(pace)
                k.drain()  # discard change echoes
    return n


def verify_segments(k, segs):
    """Returns a list of (address, expected, actual) mismatches."""
    bad = []
    for addr, data in segs:
        got = k.rq1(addr, len(data), timeout=3.0)
        for i, (e, g) in enumerate(zip(data, got)):
            if e != g:
                bad.append((hexs(addr_add(addr, i)), e, g))
    return bad


def snapshot_edit_buffer(k):
    """Read the whole edit buffer as segments (for restore_edit_buffer)."""
    return [(list(a), list(d)) for a, d in k.read_sparse([0x60, 0, 0, 0], 2048) + k.read_sparse([0x60, 0, 0x10, 0], 2048)]


def restore_edit_buffer(k, segs):
    """Write a snapshot back. Returns mismatches, ignoring FILTERED bytes (they are not written)."""
    write_segments(k, segs)
    return [m for m in verify_segments(k, segs) if tuple(int(x, 16) for x in m[0].split()[2:]) not in FILTERED]


def main():
    path, slot = sys.argv[1], int(sys.argv[2])
    segs = slot_segments(json.load(open(path)), slot)
    with Katana() as k:
        k.identify()
        k.editor_on()
        n = write_segments(k, segs)
        bad = verify_segments(k, segs)
    known = [(a, e, g) for a, e, g in bad if tuple(int(x, 16) for x in a.split()[2:]) in FILTERED]
    bad = [m for m in bad if m not in known]
    print(f"slot {slot}: wrote {sum(len(d) for _, d in segs)} bytes in {n} DT1s; "
          f"{'verified OK' if not bad else f'{len(bad)} MISMATCHES: {bad[:10]}'}")
    for a, e, g in known:
        print(f"  known firmware limit at {a}: wanted {e}, amp keeps {g} "
              f"({FILTERED[tuple(int(x, 16) for x in a.split()[2:])]})")
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
