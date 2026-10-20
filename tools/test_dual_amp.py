"""TODO section 4: does the KATANA-50 MK1 run PREAMP B and the divider/mixer (dual amp)?

    python tools/test_dual_amp.py [seconds per step]     (default 8; Ctrl+C stops early)

Edit buffer only, nothing is saved: every register touched is restored at the end, and editor mode is turned off.
Ch A = JC-120 (clean), Ch B = 5150 DRIVE (high gain), so it is obvious which one you hear.
"""
import sys
import time

from katana import Katana, Log

PRE_A = [0x60, 0x00, 0x00, 0x50]  # 0x20 bytes: on, type, gain, t-comp, bass, mid, treble, presence, level, ...
PRE_B = [0x60, 0x00, 0x01, 0x00]  # same layout
DIVIDER = [0x60, 0x00, 0x06, 0x40]  # mode (0 SINGLE / 1 DUAL), ch select (0 A / 1 B), ...
MIXER = [0x60, 0x00, 0x06, 0x50]  # mode (0 STEREO / 1 PAN L/R), A/B balance 0-100, spread
DIV_MODE, DIV_CH = [0x60, 0, 0x06, 0x40], [0x60, 0, 0x06, 0x41]
BALANCE = [0x60, 0, 0x06, 0x51]
JC120, DRIVE5150 = 8, 24


def main():
    secs = float(sys.argv[1]) if len(sys.argv) > 1 else 8
    log = Log("dual-amp")
    with Katana() as k:
        k.identify()
        k.dt1([0x7F, 0, 0, 1], [1])
        k.recv_all(0.2)
        orig = {"A": k.rq1(PRE_A, 0x20), "B": k.rq1(PRE_B, 0x20), "DIV": k.rq1(DIVIDER, 10), "MIX": k.rq1(MIXER, 3)}
        hi, lo = k.rq1([0x00, 0x01, 0, 0], 2)
        log(f"patch {hi * 128 + lo}; original A={orig['A'][:9]} B={orig['B'][:9]} DIV={orig['DIV']} MIX={orig['MIX']}")

        def write(addr, data, label):
            k.dt1(addr, data)
            k.recv_all(0.1)
            back = k.rq1(addr, len(data))
            flag = "" if back == list(data) else f"  ** READ BACK {back} **"
            log(f"    {label}{flag}")

        def step(n, title):
            log(f"[step {n}] {title}")

        try:
            for i in range(3, 0, -1):
                log(f"starting in {i}... play continuously")
                time.sleep(1)

            step(1, "SINGLE, Ch A = JC-120 (clean)")
            write(DIV_MODE, [0, 0], "divider SINGLE, Ch A")
            write([0x60, 0, 0, 0x51], [JC120], "Preamp A type JC-120")
            time.sleep(secs)

            step(2, "SINGLE, Ch B = 5150 DRIVE (high gain). Dirty = Preamp B works")
            b = list(orig["A"])  # copy A's settings so the level matches
            b[0], b[1], b[2] = 1, DRIVE5150, 70
            write(PRE_B, b[:0x10], "Preamp B on, 5150 DRIVE, gain 70, A's EQ/level")
            write(DIV_CH, [1], "divider Ch B")
            time.sleep(secs)

            step(3, "back to Ch A (clean)")
            write(DIV_CH, [0], "divider Ch A")
            time.sleep(secs)

            step(4, "DUAL, balance 50 (both amps together)")
            write(BALANCE, [50], "mixer balance 50")
            write(DIV_MODE, [1], "divider DUAL")
            time.sleep(secs)

            step(5, f"DUAL, balance sweep 0 -> 100 over {secs * 2:.0f}s (clean -> dirty if 0 = all A)")
            for v in range(0, 101, 5):
                k.dt1(BALANCE, [v])
                log(f"    balance {v}")
                time.sleep(secs * 2 / 21)
            k.recv_all(0.1)
            time.sleep(1)
        except KeyboardInterrupt:
            log("stopped early")
        finally:
            for addr, key in ((PRE_A, "A"), (PRE_B, "B"), (DIVIDER, "DIV"), (MIXER, "MIX")):
                k.dt1(addr, orig[key])
                time.sleep(0.03)
            k.recv_all(0.2)
            ok = (k.rq1(PRE_A, 0x20) == orig["A"] and k.rq1(PRE_B, 0x20) == orig["B"]
                  and k.rq1(DIVIDER, 10) == orig["DIV"] and k.rq1(MIXER, 3) == orig["MIX"])
            log(f"restored original settings: {'OK' if ok else 'MISMATCH, check the amp'}")
            k.dt1([0x7F, 0, 0x06, 0], [1])
            k.dt1([0x7F, 0, 0, 1], [0])
            log("editor mode OFF")
    log.close()


if __name__ == "__main__":
    main()
