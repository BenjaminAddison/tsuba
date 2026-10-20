#!/usr/bin/env python3
"""Build notes/effects-map.json from the decompiled Tone Studio sources.

For every effect block: its type list (value -> name) and, per type, each parameter's
edit-buffer address, byte count, range and display name.

Sources (decompiled/tone_studio_as3/scripts/tonecentral/):
  common/define/ParameterDefinitionGT.as  *_TYPE lists and *_PARAMS_LIST ranges
  parametors/TemporaryParams.as           setData(): address key -> field name
Address key = addr[2]*256 + addr[3] under 60 00 xx xx. Two-byte values are stored as
<id>_h / <id>_l fields, value = h*128 + l.
"""
import json, re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "decompiled/tone_studio_as3/scripts/tonecentral"
tp = (SRC / "parametors/TemporaryParams.as").read_text()
pd = (SRC / "common/define/ParameterDefinitionGT.as").read_text()

body = tp[tp.index("protected function setData("):]
body = body[:body.index("\n      }\n")]
key_of = {f: int(k) for k, f in re.findall(r"param1 == (\d+)\)\s*\{\s*this\.(\w+) = param2;", body)}


def addr(key):
    return f"60 00 {key >> 8:02X} {key & 0xFF:02X}"


def locate(pid):
    if pid in key_of:
        return addr(key_of[pid]), 1
    if pid + "_h" in key_of and pid + "_l" in key_of:
        return addr(min(key_of[pid + "_h"], key_of[pid + "_l"])), 2
    return None, None


def as3_const(name):
    """Parse a `public static const NAME:T = <literal>;` whose literal is JSON-like."""
    start = pd.index(f"const {name}:")
    lit = pd[pd.index("=", start) + 1:]
    depth, end = 0, 0
    for i, c in enumerate(lit):
        depth += c in "[{"
        depth -= c in "]}"
        if c == ";" and depth == 0:
            end = i
            break
    lit = re.sub(r"(?<=[:\[,])\s*([A-Z][A-Z_0-9]*)\b(?=\s*[,}\]])", r'"\1"', lit[:end])  # bare consts -> strings
    return json.loads(lit.replace("\\'", "'"))


# Value names for enum params (speaker types, modes...). Entries built by function calls are skipped.
dd = pd[pd.index("const DROPDOWN_LIST:Object"):]
dd = dd[:dd.index("\n      };")]
value_names = {k: json.loads(v.replace("\\'", "'")) for k, v in re.findall(r'"(\w+)":(\[[^\]\n]*\]),?\n', dd)}


blocks = {}
for plist in re.findall(r"public static const (\w+)_PARAMS_LIST:Object", pd):
    p = plist.lower().replace("odds", "od_ds")
    on = next((f for f in (p + "_on_off", p + "_sw") if f in key_of), None)
    sel = next((f for f in (p + "_type", p + "_fx_type", p + "_mode") if f in key_of), None)
    block = {"on_off_address": on and addr(key_of[on]), "type_address": sel and addr(key_of[sel]),
             "types": None, "params": {}}
    tname = {"PREAMP_A": "PREAMP_TYPE", "PREAMP_B": "PREAMP_TYPE", "DELAY2": "DELAY_TYPE"}.get(plist, plist + "_TYPE")
    if f"const {tname}:Array" in pd:
        block["types"] = [{"val": t["val"], "name": t["name"]} for t in as3_const(tname)]
    for typ, params in as3_const(plist + "_PARAMS_LIST").items():
        rows = []
        for p in params:
            a, n = locate(p["id"])
            row = {"id": p["id"], "name": p["name"], "address": a, "bytes": n,
                   "min": p.get("min"), "max": p.get("max"), "step": p.get("step")}
            if p["id"] in value_names:
                row["values"] = value_names[p["id"]]
            rows.append(row)
        block["params"][typ] = rows
    blocks[plist] = block

out = ROOT / "notes/effects-map.json"
out.write_text(json.dumps(blocks, indent=1))
total = sum(len(r) for b in blocks.values() for r in b["params"].values())
missing = sorted({r["id"] for b in blocks.values() for rs in b["params"].values() for r in rs if not r["address"]})
print(f"{len(blocks)} blocks, {total} param rows, {len(missing)} without address: {missing}")
assert key_of["fx1_phaser_rate"] == 0x0276  # 60 00 02 76, cross-checked against addressmap_gt.json
sys.exit(1 if missing else 0)
