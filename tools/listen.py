"""TODO section 3: turn editor mode on and log every message the amp sends, decoded by address.

    python tools/listen.py [seconds]      (default 60; Ctrl+C stops early)

Also logs messages on the KATANA CTRL / DAW CTRL ports. Everything printed is also written to
logs/listen-<timestamp>.txt. Editor mode is always turned off on exit.
"""
import json
import os
import sys
import time

import rtmidi

from katana import Katana, hexs

MAP = os.path.join(os.path.dirname(__file__), "..", "extracted", "tone_studio_air_app", "_assets", "data",
                   "addressmap_gt.json")


def load_names():
    names = {}
    for area, entries in json.load(open(MAP)).items():
        if isinstance(entries, list):
            for e in entries:
                if "address" not in e:
                    continue
                size = int(e.get("size", "00,00,00,01").split(",")[-1], 16)
                names[tuple(int(x, 16) for x in e["address"].split(","))] = (e.get("name", "?"), size)
    return names


def describe(names, addr, data):
    out = []
    base = addr[0] << 21 | addr[1] << 14 | addr[2] << 7 | addr[3]
    for i in range(len(data)):
        n = base + i
        a = (n >> 21 & 0x7F, n >> 14 & 0x7F, n >> 7 & 0x7F, n & 0x7F)
        if a in names and names[a][0] != "?":
            name, size = names[a]
            v = 0
            for b in data[i:i + size]:  # multi-byte values are 7-bit big-endian (e.g. current_patch_no)
                v = v * 128 + b
            out.append(f"{name}={v}")
    return ", ".join(out[:8]) + (" ..." if len(out) > 8 else "")


def main():
    secs = float(sys.argv[1]) if len(sys.argv) > 1 else 60
    logdir = os.path.join(os.path.dirname(__file__), "..", "logs")
    os.makedirs(logdir, exist_ok=True)
    logpath = os.path.abspath(os.path.join(logdir, f"listen-{time.strftime('%Y%m%d-%H%M%S')}.txt"))
    log = open(logpath, "w", encoding="utf-8")

    def emit(line):
        print(line, flush=True)
        log.write(line + "\n")
        log.flush()

    names = load_names()
    extra = []
    for port in ("KATANA DAW CTRL", "KATANA CTRL"):
        m = rtmidi.MidiIn()
        m.ignore_types(sysex=False, timing=True, active_sense=True)
        m.open_port(Katana._find(m, port))
        extra.append((port, m))

    with Katana() as k:
        k.identify()
        k.dt1([0x7F, 0, 0, 1], [1])
        emit(f"editor mode ON. Listening {secs:.0f}s: turn knobs, switch channels, press buttons...")
        t0 = time.time()
        try:
            while time.time() - t0 < secs:
                m = k.recv(0.05)
                if m:
                    t = time.time() - t0
                    if k._is_dt1(m):
                        addr, data = m[8:12], m[12:-2]
                        emit(f"[{t:6.2f}] DT1 {hexs(addr)} = {hexs(data[:16])}{' ...' if len(data) > 16 else ''}"
                             f"  {describe(names, addr, data)}")
                    else:
                        emit(f"[{t:6.2f}] KATANA: {hexs(m)}")
                for port, mi in extra:
                    e = mi.get_message()
                    if e:
                        emit(f"[{time.time() - t0:6.2f}] {port}: {hexs(e[0])}")
        except KeyboardInterrupt:
            pass
        finally:
            k.dt1([0x7F, 0, 0x06, 0], [1])
            k.dt1([0x7F, 0, 0, 1], [0])
            emit("editor mode OFF")
    for _, m in extra:
        m.close_port()
    log.close()
    print("log saved to", logpath)


if __name__ == "__main__":
    main()
