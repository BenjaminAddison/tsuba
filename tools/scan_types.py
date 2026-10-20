"""TODO section 4: which effect TYPE values does the amp accept, compared with Tone Studio's lists?

    python tools/scan_types.py [max value]      (default 63)

For each block the block is switched off (silent), every type value 0..max is written and read back. A value is
"accepted" if it reads back as written. The whole edit buffer is snapshotted first and restored at the end.
Results go to logs/scan-types-<timestamp>.txt and notes/effect-types-scan.json.
"""
import json
import os
import sys
import time

from katana import Katana, Log
from restore import restore_edit_buffer, snapshot_edit_buffer

MAP = os.path.join(os.path.dirname(__file__), "..", "notes", "effects-map.json")
OUT = os.path.join(os.path.dirname(__file__), "..", "notes", "effect-types-scan.json")
SKIP = {"PREAMP_A", "PREAMP_B", "DIVIDER", "MIXER"}  # amp models tested by ear already; dual amp is locked


def addr(s):
    return [int(x, 16) for x in s.split()]


def main():
    top = int(sys.argv[1]) if len(sys.argv) > 1 else 63
    blocks = {n: b for n, b in json.load(open(MAP)).items() if b.get("type_address") and n not in SKIP}
    log = Log("scan-types")
    results = {}
    with Katana() as k:
        k.identify()
        k.editor_on()
        snap = snapshot_edit_buffer(k)
        try:
            for name, b in blocks.items():
                ta = addr(b["type_address"])
                known = sorted(t["val"] for t in b.get("types") or [])
                if b.get("on_off_address"):
                    k.dt1(addr(b["on_off_address"]), [0])
                    k.recv_all(0.1)
                accepted, clamps = [], {}
                for v in range(top + 1):
                    k.dt1(ta, [v])
                    time.sleep(0.02)
                    got = k.rq1(ta, 1)[0]
                    if got == v:
                        accepted.append(v)
                    else:
                        clamps[v] = got
                extra = [v for v in accepted if v not in known]
                missing = [v for v in known if v not in accepted]
                results[name] = {"type_address": b["type_address"], "tone_studio": known, "accepted": accepted,
                                 "extra": extra, "rejected_known": missing}
                log(f"{name:12s} Tone Studio {len(known):2d} types; amp accepts {len(accepted):2d}: {accepted}")
                if extra:
                    log(f"{'':12s}   NOT in Tone Studio: {extra}")
                if missing:
                    log(f"{'':12s}   in Tone Studio but REJECTED: {missing}")
                k.recv_all(0.1)
        except KeyboardInterrupt:
            log("stopped early")
        finally:
            bad = restore_edit_buffer(k, snap)
            log(f"edit buffer restored: {'OK' if not bad else f'{len(bad)} bytes differ: {bad[:6]}'}")
    with open(OUT, "w") as f:
        json.dump(results, f, indent=1)
    log(f"results saved to {os.path.abspath(OUT)}")
    log.close()


if __name__ == "__main__":
    main()
