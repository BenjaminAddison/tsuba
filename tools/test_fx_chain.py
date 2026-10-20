"""TODO section 4: does a custom FX chain (60 00 07 20, 20 positions) change the sound, not just the stored order?

    python tools/test_fx_chain.py [seconds per step]     (default 8; Ctrl+C stops early)

High gain + big reverb: reverb at the end (normal) vs reverb BEFORE the amp (distorted wash), which none of the
3 chain patterns can do. (A compressor test was dropped: COMP ON 60 00 00 20 is locked on the 50 MK1.)
Edit buffer only, nothing is saved: everything touched is restored at the end.
"""
import sys
import time

from katana import Katana, Log

CHAIN, PTN = [0x60, 0, 0x07, 0x20], [0x60, 0, 0x12, 0x00]
PRE_A = [0x60, 0, 0x00, 0x50]  # 0x20 bytes: on, type, gain, ...
COMP = [0x60, 0, 0x00, 0x20]  # on, type, sustain, attack, tone, level
REV = [0x60, 0, 0x06, 0x10]  # on, type, time
REV_LEVEL = [0x60, 0, 0x06, 0x18]

NAMES = {0: "CMP", 1: "S/R", 2: "PrA", 3: "PrB", 4: "EQ", 5: "FX1", 6: "FX2", 7: "DLY", 8: "CHO", 9: "REV", 10: "ACC",
         11: "PDL", 12: "FV", 13: "NS1", 14: "NS2", 15: "OD", 16: "USB", 17: "DIV", 18: "MXDV", 19: "MIX", 20: "MST"}
IDS = {v: k for k, v in NAMES.items()}
STANDARD = "DIV PDL OD FX1 PrA NS1 FV EQ S/R DLY FX2 CHO REV MXDV CMP PrB ACC MIX NS2 USB"  # pattern 1
REV_FIRST = "DIV PDL OD FX1 REV PrA NS1 FV EQ S/R DLY FX2 CHO MXDV CMP PrB ACC MIX NS2 USB"


def ids(order):
    return [IDS[n] for n in order.split()]


def main():
    secs = float(sys.argv[1]) if len(sys.argv) > 1 else 8
    log = Log("fx-chain")
    with Katana() as k:
        k.identify()
        k.editor_on()
        orig = {"chain": k.rq1(CHAIN, 20), "ptn": k.rq1(PTN, 1), "pre_a": k.rq1(PRE_A, 0x20), "comp": k.rq1(COMP, 6),
                "rev": k.rq1(REV, 3), "rev_level": k.rq1(REV_LEVEL, 1)}
        log(f"original: ptn {orig['ptn'][0]}, chain {' '.join(NAMES[x] for x in orig['chain'])}")

        def set_chain(order, label):
            k.dt1(CHAIN, ids(order))
            k.recv_all(0.2)
            ok = k.rq1(CHAIN, 20) == ids(order)
            log(f"    chain -> {label}{'' if ok else '  ** NOT ACCEPTED **'}")

        def step(n, title):
            log(f"[step {n}] {title}")
            time.sleep(secs)

        try:
            log("High gain + big hall reverb. Play chords and let them ring out / stop to hear the tail.")
            k.dt1(PTN, [1])
            k.recv_all(0.4)
            k.dt1(PRE_A, [1, 24, 60])  # Preamp A on, 5150 DRIVE, gain 60
            k.dt1(REV, [1, 3, 60])  # reverb on, HALL, time 60
            k.dt1(REV_LEVEL, [80])
            k.recv_all(0.2)
            for i in range(3, 0, -1):
                log(f"starting in {i}...")
                time.sleep(1)
            set_chain(STANDARD, "standard: reverb at the end")
            step(1, "reverb AFTER the amp (normal)")
            set_chain(REV_FIRST, "reverb BEFORE the amp")
            step(2, "reverb BEFORE the amp: should sound like a distorted, smeared wash")
            set_chain(STANDARD, "standard")
            step(3, "reverb AFTER the amp again (normal)")

        except KeyboardInterrupt:
            log("stopped early")
        finally:
            for addr, key in ((PTN, "ptn"), (CHAIN, "chain"), (PRE_A, "pre_a"), (COMP, "comp"), (REV, "rev"),
                              (REV_LEVEL, "rev_level")):
                k.dt1(addr, orig[key])
                time.sleep(0.05)
            k.recv_all(0.3)
            ok = all(k.rq1(a, len(orig[key])) == orig[key] for a, key in
                     ((CHAIN, "chain"), (PTN, "ptn"), (PRE_A, "pre_a"), (COMP, "comp"), (REV, "rev")))
            log(f"restored original settings: {'OK' if ok else 'MISMATCH, switch channel and back to reload'}")
    log.close()


if __name__ == "__main__":
    main()
