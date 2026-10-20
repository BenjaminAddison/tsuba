"""Apply a readable tone file to the amp's edit buffer (live, not saved). Prototype of a shareable tone format.

    python tools/tone.py apply tones/warm-dry.json
    python tools/tone.py show  tones/warm-dry.json      (resolve names/values without touching the amp)

A tone file is JSON: {"name", "description", "params": {"BLOCK: PARAM": value}}. Names are the address map's names
(e.g. "PREAMP A: GAIN"). Values are what Tone Studio shows: numbers in the displayed range (signed values like
-3 for EQ gains are fine) or list labels (e.g. "250Hz", "OFF", "DELUXE CRUNCH").
Switching channel on the amp and back undoes an applied tone.
"""
import json
import os
import sys

HERE = os.path.dirname(__file__)
ADDRMAP = os.path.join(HERE, "..", "extracted", "tone_studio_air_app", "_assets", "data", "addressmap_gt.json")
FXMAP = os.path.join(HERE, "..", "notes", "effects-map.json")
ON_OFF = {"OFF": 0, "ON": 1}


def load_maps():
    names = {e["name"]: (e["address"].replace(",", " "), int(e.get("size", "00,00,00,01").split(",")[-1], 16))
             for e in json.load(open(ADDRMAP))["temporary"] if e.get("name") and e.get("address")}
    specs, types = {}, {}
    for block in json.load(open(FXMAP)).values():
        if block.get("type_address") and block.get("types"):
            types[block["type_address"]] = {t["name"]: t["val"] for t in block["types"]}
        for params in block.get("params", {}).values():
            for p in params:
                specs.setdefault(p["address"], p)
    return names, specs, types


def encode(name, value, names, specs, types):
    """Return (address list, raw bytes) for a named parameter and a display value.

    Multi-byte values (e.g. DELAY TIME, 2 bytes) are 7-bit big-endian: 400 ms = 03 10."""
    if name not in names:
        raise KeyError(f"unknown parameter {name!r}")
    a, size = names[name]
    if a in types and isinstance(value, str):
        if value not in types[a]:
            raise ValueError(f"{name}: {value!r} not one of {list(types[a])}")
        raw = types[a][value]
    elif isinstance(value, str):
        spec = specs.get(a, {})
        labels = spec.get("values") or []
        if value in labels:
            raw = labels.index(value)
        elif value.upper() in ON_OFF:
            raw = ON_OFF[value.upper()]
        else:
            raise ValueError(f"{name}: {value!r} not one of {labels}")
    else:
        spec = specs.get(a)
        lo, hi = (spec["min"], spec["max"]) if spec else (0, 127)
        if not lo <= value <= hi:
            raise ValueError(f"{name}: {value} outside {lo}..{hi}")
        raw = value - lo if lo < 0 else value  # signed ranges are stored offset (e.g. EQ gain 0 dB = 20)
    data = [(raw >> (7 * i)) & 0x7F for i in reversed(range(size))]
    return [int(x, 16) for x in a.split()], data


def main():
    cmd, path = sys.argv[1], sys.argv[2]
    tone = json.load(open(path))
    names, specs, types = load_maps()
    writes = [(n, v, *encode(n, v, names, specs, types)) for n, v in tone["params"].items()]
    print(f"{tone['name']}: {tone.get('description', '')}")
    if cmd == "show":
        for n, v, a, raw in writes:
            print(f"  {' '.join(f'{b:02X}' for b in a)} = {' '.join(f'{b:3d}' for b in raw):7s}  {n} = {v}")
        return
    from katana import Katana
    with Katana() as k:
        k.identify()
        k.editor_on()
        for _, _, a, raw in writes:
            k.dt1(a, raw)
        k.recv_all(0.3)
        bad = [(n, v, raw, got) for n, v, a, raw in writes if (got := k.rq1(a, len(raw))) != raw]
    print(f"applied {len(writes)} params to the edit buffer (not saved)"
          + ("" if not bad else f"; NOT ACCEPTED: {bad}"))


if __name__ == "__main__":
    main()
