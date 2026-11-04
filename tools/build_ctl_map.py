"""Regenerate notes/ctl-map.json from the decompiled Tone Studio: assign targets and sources, and the CTL/EXP
function lists, keeping the entries flagged `gt001` (the set the KATANA-50 MK1 firmware accepts, see notes/07).

    python3 -I tools/build_ctl_map.py
"""
import json
import re
import sys
from pathlib import Path

root = Path(sys.argv[0]).resolve().parent.parent
d = root / "decompiled/tone_studio_as3/scripts/tonecentral/common/define"
ctl = (d / "CTLDefinitionGT.as").read_text()
tgt = (d / "CTLAssignTargetDefinitionGT.as").read_text()


def section(src, name):
    start = src.index(f"const {name}:")
    end = src.index("];", start)
    return src[start:end]


def opts(src, name):
    pat = r'"gt001":(true|false),\s*"gt100":(?:true|false),\s*"val":(\d+),\s*"name":"([^"]*)"'
    return [{"val": int(v), "name": n} for ok, v, n in re.findall(pat, section(src, name)) if ok == "true"]


pat = r'"val":"([0-9A-F]{2}),([0-9A-F]{2})",\s*"name":"([^"]*)",\s*"min":(-?\d+),\s*"max":(-?\d+),\s*"step":([\d.]+)'
targets = [
    {"val": int(hi, 16) << 7 | int(lo, 16), "name": n, "min": int(mn), "max": int(mx), "step": float(st)}
    for hi, lo, n, mn, mx, st in re.findall(pat, section(tgt, "ASSIGN_TARGET_MASTER_LIST"))
]
out = {
    "switch_funcs": opts(ctl, "PRESET_PATTERN_1_FUNC"),
    "pedal_funcs": opts(ctl, "PRESET_PATTERN_2_FUNC_PATCH"),
    "assign_sources": opts(ctl, "ASSIGN_SOURCE_LIST"),
    "assign_targets": targets,
}
(root / "notes/ctl-map.json").write_text(json.dumps(out, indent=1) + "\n")
print({k: len(v) for k, v in out.items()})
