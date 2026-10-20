"""TODO section 2: read-only backup of every user patch, the edit buffer and system settings.

Writes backups/<timestamp>.json:
  system areas: {name: {"address": "00 00 04 00", "data": "hex..."}}
  patches:      {name: {"address": "10 01 00 00", "segments": [["10 01 00 00", "hex..."], ...]}}
"""
import json
import os
import sys
import time

from katana import Katana, hexs

# A patch spans xx xx 00 00 - xx xx 20 00. Tone Studio reads it as 3 overlapping 2048-byte RQ1s; the amp skips
# undefined addresses, so the reply is sparse. We read 2 non-overlapping halves and keep the segments as sent.
PATCH_CHUNKS = [([0x00, 0x00], 2048), ([0x10, 0x00], 2048)]
# Katana-50 slot remap (notes/03): app slot -> amp slot
SLOTS = {"PANEL": 0, "A_CH1": 1, "A_CH2": 2, "B_CH1": 5, "B_CH2": 6,
         "hidden_3": 3, "hidden_4": 4, "hidden_7": 7, "hidden_8": 8}  # hidden: not reachable from the panel
SYSTEM = {
    "system_00000050": ([0x00, 0x00, 0x00, 0x50], 8),
    "system_00000400": ([0x00, 0x00, 0x04, 0x00], 75),
    "setup_current_patch": ([0x00, 0x01, 0x00, 0x00], 2),
    "midi_00020000": ([0x00, 0x02, 0x00, 0x00], 48),
}


def read_patch(k, top):
    """Returns (segments, name, total bytes) where segments is [[address hex, data hex], ...]."""
    segs = []
    for (a3, a4), size in PATCH_CHUNKS:
        segs += k.read_sparse(top[:2] + [a3, a4], size)
    name = bytes(segs[0][1][:16]).decode("ascii", "replace")
    total = sum(len(d) for _, d in segs)
    return [[hexs(a), bytes(d).hex()] for a, d in segs], name, total


def main():
    probe = "--probe" in sys.argv
    out = {}
    with Katana() as k:
        info = k.identify()
        print("connected:", info["model"], "dev", info["dev"])
        k.editor_on()  # 00 01 00 00 only answers in editor mode (notes/07)
        out["_meta"] = {"time": time.strftime("%Y-%m-%d %H:%M:%S"), **info,
                        "comm_level": k.rq1([0x7F, 0, 0, 0], 1)[0]}

        for name, (addr, size) in SYSTEM.items():
            d = k.rq1(addr, size, timeout=3.0)
            out[name] = {"address": hexs(addr), "data": bytes(d).hex()}
            print(f"  {name:22s} {hexs(addr)} x{size}: ok")

        segs, name, total = read_patch(k, [0x60, 0x00])
        out["edit_buffer"] = {"address": "60 00 00 00", "segments": segs}
        print(f"  edit_buffer            name={name!r} {total} bytes in {len(segs)} msgs")

        for label, slot in SLOTS.items():
            segs, name, total = read_patch(k, [0x10, slot])
            out[f"user_{label}"] = {"address": hexs([0x10, slot, 0, 0]), "segments": segs}
            print(f"  user {label:8s} (10 {slot:02X})  name={name!r} {total} bytes in {len(segs)} msgs")

        if probe:
            for slot in (3, 4, 7, 8, 9):
                try:
                    d = k.rq1([0x10, slot, 0, 0], 16, timeout=1.5)
                    print(f"  probe 10 {slot:02X}: name={bytes(d).decode('ascii', 'replace')!r}")
                except TimeoutError as e:
                    print(f"  probe 10 {slot:02X}: no reply ({e})")

    os.makedirs("../backups", exist_ok=True)
    path = f"../backups/{time.strftime('%Y%m%d-%H%M%S')}.json"
    with open(path, "w") as f:
        json.dump(out, f, indent=1)
    print("saved", os.path.abspath(path))


if __name__ == "__main__":
    main()
