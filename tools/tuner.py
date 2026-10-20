"""TODO section 4: tuner readout. Turn the tuner on AT THE AMP; this shows what the amp reports.

    python tools/tuner.py [seconds]      (default 60; Ctrl+C stops early)

Protocol (Tuner.as / SystemExclusive.as): running mode 7F 00 00 02 is read-only (0 normal, 1 tuner, 2 multi tuner).
Pitch arrives as DT1s of 2 bytes: note index (0 = C ... 11 = B, 0C = no signal) and cents + 50 (0-100):
single mode at 7F 00 05 00, multi mode per string at 7F 00 02 00/02/04/06/08/0A.
Running mode is polled every second; pitch is polled only if the amp doesn't push it by itself.
"""
import sys
import time

from katana import Katana, Log, hexs

RUNNING_MODE = [0x7F, 0, 0, 0x02]
SINGLE = [0x7F, 0, 0x05, 0x00]
MULTI = [0x7F, 0, 0x02, 0x00]
NOTES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
MODES = {0: "normal", 1: "TUNER", 2: "MULTI TUNER"}


def fmt(note, cents_raw):
    if note == 0x0C:
        return "  --  (no signal)"
    c = cents_raw - 50
    pos = max(0, min(20, (c + 50) // 5))
    meter = "".join("|" if i == 10 else ("#" if i == pos else ".") for i in range(21))
    return f"{NOTES[note] if note < 12 else hex(note):2s} {c:+3d}c [{meter}]{'  IN TUNE' if abs(c) <= 3 else ''}"


def main():
    secs = float(sys.argv[1]) if len(sys.argv) > 1 else 60
    log = Log("tuner")
    with Katana() as k:
        k.identify()
        k.editor_on()
        mode = k.rq1(RUNNING_MODE, 1)[0]
        log(f"running mode: {mode} {MODES.get(mode, '?')}. Turn the tuner on at the amp and play a string.")
        t0 = time.time()
        next_poll = 0.0
        last_push = 0.0
        last_line = None
        try:
            while time.time() - t0 < secs:
                m = k.recv(0.02, k._is_dt1)
                now = time.time()
                if m:
                    addr, data = m[8:12], m[12:-2]
                    if addr == RUNNING_MODE:
                        mode = data[0]
                        log(f"[{now - t0:6.2f}] pushed running mode {mode} {MODES.get(mode, '?')}")
                    elif addr == SINGLE:
                        last_push = now
                        line = f"[{now - t0:6.2f}] pushed {fmt(data[0], data[1])}  raw {hexs(data)}"
                        if line[9:] != (last_line or "")[9:]:
                            log(line)
                        last_line = line
                    elif addr[:3] == MULTI[:3] and addr[3] <= 0x0B:
                        last_push = now
                        log(f"[{now - t0:6.2f}] pushed string {addr[3] // 2 + 1}: {fmt(data[0], data[1])}  raw {hexs(data)}")
                    else:
                        log(f"[{now - t0:6.2f}] other DT1 {hexs(addr)} = {hexs(data[:8])}")
                if now >= next_poll:
                    next_poll = now + 1.0
                    try:
                        new = k.rq1(RUNNING_MODE, 1, retries=0)[0]
                    except TimeoutError:
                        new = mode
                    if new != mode:
                        log(f"[{now - t0:6.2f}] polled running mode {new} {MODES.get(new, '?')}")
                        mode = new
                    if mode in (1, 2) and now - last_push > 1.0:  # tuner on but nothing pushed: poll pitch
                        try:
                            if mode == 1:
                                d = k.rq1(SINGLE, 2, retries=0)
                                log(f"[{now - t0:6.2f}] polled {fmt(d[0], d[1])}  raw {hexs(d)}")
                            else:
                                d = k.rq1(MULTI, 12, retries=0)
                                log(f"[{now - t0:6.2f}] polled multi " +
                                    "  ".join(f"{i + 1}:{fmt(d[2 * i], d[2 * i + 1])[:8]}" for i in range(6)))
                        except TimeoutError:
                            log(f"[{now - t0:6.2f}] pitch poll: no reply")
        except KeyboardInterrupt:
            pass
    log.close()


if __name__ == "__main__":
    main()
