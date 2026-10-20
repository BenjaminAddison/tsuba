"""TODO section 1: read-only connection tests. Sends no DT1s."""
from katana import Katana, hexs

with Katana(verbose=True) as k:
    print("== identity")
    for key, val in k.identify().items():
        print(f"  {key}: {val}")

    print("== comm level 7F 00 00 00")
    level = k.rq1([0x7F, 0, 0, 0], 1)
    print(f"  level = {level[0]:02X} ({'OK' if level[0] == 5 else 'Tone Studio v4 would reject'})")

    print("== current patch 00 01 00 00")
    hi, lo = k.rq1([0x00, 0x01, 0, 0], 2)
    print(f"  current patch = {hi * 128 + lo} (raw {hi:02X} {lo:02X})")

    print("== edit buffer patch name 60 00 00 00 x16")
    name = k.rq1([0x60, 0, 0, 0], 16)
    print(f"  name = {bytes(name).decode('ascii', 'replace')!r}  ({hexs(name)})")
