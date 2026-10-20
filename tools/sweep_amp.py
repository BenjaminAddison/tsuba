"""TODO section 4: step PREAMP A TYPE (60 00 00 51) through all 28 GT amp models while you play.

    python tools/sweep_amp.py [seconds per model]     (default 6; Ctrl+C stops early)

Edit buffer only, nothing is saved: the original type is restored at the end and editor mode is turned off.
Each value is read back to check the amp accepted it. Output is also written to logs/sweep-<timestamp>.txt.
"""
import os
import sys
import time

from katana import Katana

TYPE = [0x60, 0x00, 0x00, 0x51]
MODELS = ["NATURAL CLEAN", "FULL RANGE", "COMBO CRUNCH", "STACK CRUNCH", "HiGAIN STACK", "POWER DRIVE",
          "EXTREME LEAD", "CORE METAL", "JC-120", "CLEAN TWIN", "PRO CRUNCH", "TWEED", "DELUXE CRUNCH", "VO DRIVE",
          "VO LEAD", "MATCH DRIVE", "BG LEAD", "BG DRIVE", "MS1959 I", "MS1959 I+II", "R-FIER VINTAGE",
          "R-FIER MODERN", "T-AMP LEAD", "SLDN", "5150 DRIVE", "CUSTOM", "BGNR UB METAL", "ORNG ROCK REVERB"]
PANEL = {1: "ACOUSTIC", 8: "CLEAN", 11: "CRUNCH", 24: "LEAD", 23: "BROWN"}


def main():
    secs = float(sys.argv[1]) if len(sys.argv) > 1 else 6
    logdir = os.path.join(os.path.dirname(__file__), "..", "logs")
    os.makedirs(logdir, exist_ok=True)
    logpath = os.path.abspath(os.path.join(logdir, f"sweep-{time.strftime('%Y%m%d-%H%M%S')}.txt"))
    log = open(logpath, "w", encoding="utf-8")

    def emit(line):
        print(line, flush=True)
        log.write(line + "\n")
        log.flush()

    with Katana() as k:
        k.identify()
        k.dt1([0x7F, 0, 0, 1], [1])
        k.recv_all(0.2)
        hi, lo = k.rq1([0x00, 0x01, 0, 0], 2)
        name = bytes(k.rq1([0x60, 0, 0, 0], 16)).decode("ascii", "replace").strip()
        orig = k.rq1(TYPE, 1)[0]
        emit(f"patch {hi * 128 + lo} {name!r}, original type {orig} {MODELS[orig]}. Play continuously.")
        try:
            for i in range(3, 0, -1):
                emit(f"starting in {i}...")
                time.sleep(1)
            for v, model in enumerate(MODELS):
                k.dt1(TYPE, [v])
                k.recv_all(0.1)
                back = k.rq1(TYPE, 1)[0]
                tag = f"  (panel {PANEL[v]})" if v in PANEL else ""
                ok = "" if back == v else f"  ** READ BACK {back}, NOT ACCEPTED **"
                emit(f"[{v + 1:2d}/28] type {v:2d}  {model}{tag}{ok}")
                time.sleep(max(0.0, secs - 0.2))
        except KeyboardInterrupt:
            emit("stopped early")
        finally:
            k.dt1(TYPE, [orig])
            k.recv_all(0.2)
            emit(f"restored type {k.rq1(TYPE, 1)[0]}")
            k.dt1([0x7F, 0, 0x06, 0], [1])
            k.dt1([0x7F, 0, 0, 1], [0])
            emit("editor mode OFF")
    log.close()
    print("log saved to", logpath)


if __name__ == "__main__":
    main()
