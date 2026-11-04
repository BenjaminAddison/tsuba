//! Every edit-buffer parameter with its address, range and labels, built from Tone Studio's address map and
//! notes/effects-map.json (both embedded), plus what the KATANA-50 MK1 hardware tests found (notes/07).
//! Values are what a person reads: numbers in the displayed range (-3 for an EQ gain) or labels ("250Hz", "JC-120").

use std::collections::HashMap;

use serde::{Deserialize, Serialize};
use serde_json::{Map, Value};

use crate::amp::Memory;
use crate::sysex::{self, Addr};

const ADDRESS_MAP: &str = include_str!("../../extracted/tone_studio_air_app/_assets/data/addressmap_gt.json");
const EFFECTS_MAP: &str = include_str!("../../notes/effects-map.json");
const CTL_MAP: &str = include_str!("../../notes/ctl-map.json");

/// FX chain block IDs at `60 00 07 20`–`33` (notes/07). DIV…MXDV is the live Ch A path; MXDV…MIX is the dead Ch B.
pub const CHAIN_BLOCKS: [&str; 20] = [
    "CMP", "S/R", "PrA", "PrB", "EQ", "FX1", "FX2", "DLY", "CHO", "REV", "ACC", "PDL", "FV", "NS1", "NS2", "OD", "USB",
    "DIV", "MXDV", "MIX",
];

/// The 50 MK1 drops writes to these and keeps the given value (notes/07): dual amp, GAIN.SW, cab sim, chorus
/// block, compressor.
const LOCKED: [(Addr, u32); 10] = [
    ([0x60, 0, 0x01, 0x00], 0), // PREAMP B ON/OFF
    ([0x60, 0, 0x06, 0x40], 0), // DIVIDER MODE: SINGLE
    ([0x60, 0, 0x06, 0x41], 0), // DIVIDER CH SELECT: A
    ([0x60, 0, 0x06, 0x50], 0), // MIXER MODE
    ([0x60, 0, 0x06, 0x51], 0), // MIXER A/B BALANCE
    ([0x60, 0, 0x06, 0x52], 0), // MIXER SPREAD
    ([0x60, 0, 0x00, 0x5A], 1), // PREAMP A GAIN.SW: MIDDLE
    ([0x60, 0, 0x00, 0x5D], 0), // PREAMP A SP TYPE: OFF
    ([0x60, 0, 0x06, 0x00], 0), // CHORUS ON/OFF
    ([0x60, 0, 0x00, 0x20], 0), // COMP ON/OFF
];

#[derive(Debug, Clone, Serialize)]
pub struct Param {
    pub name: String,
    /// Short name for the UI: the effects map's name, else the part after the last `: ` ("FX1: CHORUS: RATE" → "RATE").
    pub label: String,
    pub addr: Addr,
    pub size: usize,
    pub min: i32,
    pub max: i32,
    /// Display units per raw step: 0.5 for GE-10 bands (−12..12 dB = raw 0..48), 2 for PATCH LEVEL (0..200 = 0..100).
    pub step: f64,
    /// List parameters: (raw value, label) in display order. Empty for plain numbers.
    pub options: Vec<(u32, String)>,
    /// The firmware drops writes to it and keeps this raw value.
    pub locked: Option<u32>,
}

impl Param {
    /// Raw values the parameter can take (inclusive). Signed ranges are stored offset: EQ gain −20..20 is 0..40.
    pub fn raw_range(&self) -> (u32, u32) {
        let off = self.min.min(0) as f64;
        (((self.min as f64 - off) / self.step) as u32, ((self.max as f64 - off) / self.step) as u32)
    }

    /// Displayed number for a raw value: signed ranges are stored offset (EQ gain 0 dB = raw 20), and scaled by `step`.
    pub fn number(&self, raw: u32) -> f64 {
        self.min.min(0) as f64 + raw as f64 * self.step
    }

    pub fn raw(&self, mem: &Memory) -> Option<u32> {
        let base = sysex::lin(self.addr);
        let bytes: Option<Vec<u8>> = (0..self.size as u32).map(|i| mem.get(&(base + i)).copied()).collect();
        Some(sysex::decode_value(&bytes?))
    }

    pub fn bytes(&self, raw: u32) -> Vec<u8> {
        sysex::encode_value(raw, self.size)
    }

    /// What a person reads: the option label, or the number in the displayed range.
    pub fn display(&self, raw: u32) -> Value {
        match self.options.iter().find(|o| o.0 == raw) {
            Some(o) => Value::String(o.1.clone()),
            None if self.step.fract() == 0.0 => Value::from(self.number(raw) as i64),
            None => Value::from(self.number(raw)),
        }
    }

    /// The firmware keeps this one at a fixed value whatever is written.
    pub fn is_locked(&self) -> bool {
        self.locked.is_some()
    }
}

/// An effect block from notes/effects-map.json: its switch, type selector, and parameter pages.
#[derive(Debug, Clone)]
pub struct FxBlock {
    pub on: Option<Addr>,
    pub type_addr: Option<Addr>,
    /// Page name ("DEFAULT" or a type name, which then lists that type's full parameter set) → addresses.
    pub pages: HashMap<String, Vec<Addr>>,
}

/// Blocks a shared tone carries. The rest are dead on the 50 MK1 (COMP, PREAMP B, CHORUS, ACCEL FX, divider, mixer).
const TONE_BLOCKS: [&str; 12] = [
    "PREAMP_A", "ODDS", "FX1", "EQ", "FX2", "DELAY", "DELAY2", "REVERB", "PEDAL_FX", "FOOT_VOLUME", "SEND_RETURN", "NS1",
];

/// A shareable tone: {"name", "description", "params": {"PREAMP A: GAIN": 35, "EQ: LOW CUT": "80.0Hz", ...}}.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Tone {
    pub name: String,
    #[serde(default)]
    pub description: String,
    pub params: Map<String, Value>,
}

/// An assign target from Tone Studio's list (notes/ctl-map.json): the raw TARGET value, its name ("DELAY: TIME")
/// and the display range its TARGET MIN/MAX use.
#[derive(Debug, Clone, Deserialize)]
pub struct Target {
    pub val: u32,
    pub name: String,
    pub min: i32,
    pub max: i32,
    pub step: f64,
}

#[derive(Deserialize)]
struct Opt {
    val: u32,
    name: String,
}

#[derive(Deserialize)]
struct CtlMap {
    switch_funcs: Vec<Opt>,
    pedal_funcs: Vec<Opt>,
    assign_sources: Vec<Opt>,
    assign_targets: Vec<Target>,
}

pub struct Catalog {
    pub params: Vec<Param>,
    /// Assign targets, in Tone Studio's order.
    pub targets: Vec<Target>,
    /// Effect blocks by their effects-map key: "FX1", "DELAY2", "PREAMP_A", ...
    pub blocks: HashMap<String, FxBlock>,
    by_name: HashMap<String, usize>,
    by_addr: HashMap<Addr, usize>,
}

#[derive(Deserialize)]
struct MapEntry {
    name: Option<String>,
    address: Option<String>,
    size: Option<String>,
}

#[derive(Deserialize)]
struct Block {
    on_off_address: Option<String>,
    type_address: Option<String>,
    types: Option<Vec<TypeOpt>>,
    params: HashMap<String, Vec<Spec>>,
}

#[derive(Deserialize)]
struct TypeOpt {
    val: u32,
    name: String,
}

#[derive(Deserialize)]
struct Spec {
    name: String,
    address: String,
    min: i32,
    max: i32,
    step: f64,
    #[serde(default)]
    values: Vec<String>,
}

fn parse_addr(s: &str) -> Addr {
    let b: Vec<u8> = s.split([',', ' ']).map(|x| u8::from_str_radix(x, 16).expect("hex address")).collect();
    [b[0], b[1], b[2], b[3]]
}

impl Catalog {
    pub fn load() -> Catalog {
        #[derive(Deserialize)]
        struct AddressMap {
            temporary: Vec<MapEntry>,
        }
        let map: AddressMap = serde_json::from_str(ADDRESS_MAP).expect("address map");
        let blocks: HashMap<String, Block> = serde_json::from_str(EFFECTS_MAP).expect("effects map");

        let mut specs: HashMap<Addr, &Spec> = HashMap::new();
        let mut types: HashMap<Addr, Vec<(u32, String)>> = HashMap::new();
        for b in blocks.values() {
            if let (Some(a), Some(t)) = (&b.type_address, &b.types) {
                types.insert(parse_addr(a), t.iter().map(|t| (t.val, t.name.clone())).collect());
            }
            for s in b.params.values().flatten() {
                specs.entry(parse_addr(&s.address)).or_insert(s);
            }
        }

        let fx = blocks.iter().map(|(k, b)| {
            let pages = b.params.iter().map(|(n, ps)| (n.clone(), ps.iter().map(|p| parse_addr(&p.address)).collect()));
            let on = b.on_off_address.as_deref().map(parse_addr);
            (k.clone(), FxBlock { on, type_addr: b.type_address.as_deref().map(parse_addr), pages: pages.collect() })
        });
        let ctl: CtlMap = serde_json::from_str(CTL_MAP).expect("ctl map");
        let mut cat = Catalog { params: vec![], targets: vec![], blocks: fx.collect(), by_name: HashMap::new(), by_addr: HashMap::new() };
        for e in map.temporary {
            let (Some(name), Some(a)) = (e.name, e.address) else { continue };
            let addr = parse_addr(&a);
            let size = e.size.map_or(1, |s| parse_addr(&s)[3] as usize);
            let spec = specs.get(&addr);
            let (min, max, step) = spec.map_or((0, (1 << (7 * size)) - 1, 1.0), |s| (s.min, s.max, s.step));
            let options = types.get(&addr).cloned().unwrap_or_else(|| {
                spec.map_or(vec![], |s| s.values.iter().enumerate().map(|(i, l)| (i as u32, l.clone())).collect())
            });
            let locked = LOCKED.iter().find(|l| l.0 == addr).map(|l| l.1);
            cat.by_name.insert(name.clone(), cat.params.len());
            cat.by_addr.entry(addr).or_insert(cat.params.len());
            let label = spec.map_or_else(|| name.rsplit(": ").next().unwrap_or(&name).to_string(), |s| s.name.clone());
            cat.params.push(Param { name, label, addr, size, min, max, step, options, locked });
        }

        // KATANA-50 MK1 allow-lists (notes/07): the firmware accepts some values that mute the amp, and hides some
        // that work. Never offer amp models 26/27 or booster 21/22.
        for p in &mut cat.params {
            match p.addr {
                [0x60, 0, 0x00, 0x51] | [0x60, 0, 0x01, 0x01] => p.options.retain(|o| o.0 <= 25),
                [0x60, 0, 0x00, 0x31] => p.options.push((7, "LEAD DS".into())), // hidden; name is the GT's, unconfirmed
                [0x60, 0, 0x06, 0x11] => p.options.extend([(0, "AMBIENCE".into()), (2, "HALL1".into())]),
                _ => {}
            }
            // CTL/EXP functions and assign sources (notes/ctl-map.json). EXP FUNC only stores OFF and FOOT VOLUME on
            // the 50 MK1 (notes/07), but factory patches hold PB/FV, so that label stays for display.
            let opts = |l: &[Opt]| l.iter().map(|o| (o.val, o.name.clone())).collect::<Vec<_>>();
            let n = p.name.as_str();
            if n.starts_with("CTL/EXP: ") && n.ends_with(": FUNC") {
                p.options = match n {
                    "CTL/EXP: EXP: FUNC" => vec![(0, "OFF".into()), (1, "FOOT VOLUME".into()), (4, "PB/FV".into())],
                    "CTL/EXP: SUB EXP: FUNC" => opts(&ctl.pedal_funcs),
                    _ => opts(&ctl.switch_funcs),
                };
            } else if n.starts_with("ASSIGN") && n.ends_with(": SOURCE") {
                p.options = opts(&ctl.assign_sources);
            } else if (n.starts_with("ASSIGN") && n.ends_with(": SOURCE MODE")) || n.ends_with(": SRC MODE") {
                p.options = vec![(0, "MOMENT".into()), (1, "TOGGLE".into())];
            }
        }
        cat.targets = ctl.assign_targets;
        cat
    }

    /// The assign target with this raw TARGET value.
    pub fn target(&self, raw: u32) -> Option<&Target> {
        self.targets.iter().find(|t| t.val == raw)
    }

    pub fn get(&self, name: &str) -> Option<&Param> {
        self.by_name.get(name).map(|&i| &self.params[i])
    }

    /// The parameter that starts at this address (for naming what the amp sends).
    pub fn at(&self, a: Addr) -> Option<&Param> {
        self.by_addr.get(&a).map(|&i| &self.params[i])
    }

    /// Display value → the DT1 to send.
    pub fn encode(&self, name: &str, v: &Value) -> Result<(Addr, Vec<u8>), String> {
        let p = self.get(name).ok_or_else(|| format!("unknown parameter {name:?}"))?;
        let labels = || p.options.iter().map(|o| o.1.as_str()).collect::<Vec<_>>();
        let raw = match v {
            Value::String(s) => match p.options.iter().find(|o| &o.1 == s) {
                Some(o) => o.0,
                None if p.options.is_empty() && s.eq_ignore_ascii_case("off") => 0,
                None if p.options.is_empty() && s.eq_ignore_ascii_case("on") => 1,
                None => return Err(format!("{name}: {s:?} is not one of {:?}", labels())),
            },
            Value::Bool(b) => *b as u32,
            Value::Number(num) => {
                let n = num.as_f64().unwrap_or(f64::NAN);
                let raw = (n - p.min.min(0) as f64) / p.step;
                if !p.options.is_empty() {
                    match p.options.iter().find(|o| o.0 as f64 == n) {
                        Some(o) => o.0,
                        None => return Err(format!("{name}: {num} is not allowed, use one of {:?}", labels())),
                    }
                } else if !(p.min as f64..=p.max as f64).contains(&n) {
                    return Err(format!("{name}: {num} is outside {}..{}", p.min, p.max));
                } else if (raw - raw.round()).abs() > 1e-6 {
                    return Err(format!("{name}: {num} is not a multiple of {}", p.step));
                } else {
                    raw.round() as u32
                }
            }
            _ => return Err(format!("{name}: {v} is not a number or label")),
        };
        if p.locked.is_some_and(|l| l != raw) {
            return Err(format!("{name} is locked on the KATANA-50"));
        }
        Ok((p.addr, sysex::encode_value(raw, p.size)))
    }

    /// The display value of a parameter in a memory image, or None if those bytes aren't in it.
    pub fn value(&self, p: &Param, mem: &Memory) -> Option<Value> {
        p.raw(mem).map(|r| p.display(r))
    }

    /// The parameters a block shows for its current type: the type's own page if it has one, else DEFAULT.
    /// The switch and type selector aren't included.
    pub fn block_params(&self, key: &str, mem: &Memory) -> Vec<&Param> {
        let Some(b) = self.blocks.get(key) else { return vec![] };
        let ty = b.type_addr.and_then(|a| self.at(a)).and_then(|p| self.value(p, mem));
        let page = ty.as_ref().and_then(Value::as_str).and_then(|t| b.pages.get(t)).or_else(|| b.pages.get("DEFAULT"));
        page.into_iter().flatten().filter(|a| Some(**a) != b.on && Some(**a) != b.type_addr).filter_map(|&a| self.at(a)).collect()
    }

    /// A shareable tone from an edit-buffer image: the amp, each live block's switch, and for blocks that are on,
    /// their type and parameters; then the FX chain order and patch level.
    pub fn export(&self, mem: &Memory, name: &str) -> Tone {
        let mut params = Map::new();
        let mut put = |p: &Param| {
            if let (Some(v), None) = (self.value(p, mem), p.locked) {
                params.insert(p.name.clone(), v);
            }
        };
        for key in TONE_BLOCKS {
            let b = &self.blocks[key];
            let on = b.on.and_then(|a| self.at(a));
            on.inspect(|p| put(p));
            if on.is_none_or(|p| p.raw(mem) == Some(1)) {
                b.type_addr.and_then(|a| self.at(a)).inspect(|p| put(p));
                self.block_params(key, mem).into_iter().for_each(&mut put);
            }
        }
        (1..=20).filter_map(|i| self.get(&format!("FX CHAIN: POSITION{i}"))).for_each(&mut put);
        self.get("PATCH LEVEL").inspect(|p| put(p));
        Tone { name: name.into(), description: String::new(), params }
    }

    /// Writes for a tone, plus one message per parameter that was skipped (unknown, locked or out of range),
    /// so tones from other Katana models still load.
    pub fn encode_tone(&self, tone: &Tone) -> (Vec<(Addr, Vec<u8>)>, Vec<String>) {
        let (mut writes, mut skipped) = (vec![], vec![]);
        for (name, v) in &tone.params {
            match self.encode(name, v) {
                Ok(w) => writes.push(w),
                Err(e) => skipped.push(e),
            }
        }
        (writes, skipped)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    #[test]
    fn encodes() {
        let c = Catalog::load();
        assert_eq!(c.encode("PREAMP A: GAIN", &json!(50)).unwrap(), ([0x60, 0, 0, 0x52], vec![50]));
        assert_eq!(c.encode("EQ: LOW GAIN", &json!(-2)).unwrap().1, vec![18]);
        assert_eq!(c.encode("DELAY: DELAY TIME", &json!(420)).unwrap().1, vec![3, 36]);
        assert_eq!(c.encode("PREAMP A: TYPE", &json!("JC-120")).unwrap().1, vec![8]);
        assert!(c.encode("PREAMP A: TYPE", &json!("BGNR UB METAL")).is_err()); // mutes the 50 MK1
        assert!(c.encode("PREAMP A: TYPE", &json!(26)).is_err());
        assert!(c.encode("OD/DS: TYPE", &json!(21)).is_err());
        assert_eq!(c.encode("PRM_EQ_GEQ_BAND1", &json!(-1.5)).unwrap().1, vec![21]); // GE-10: 0.5 dB steps
        assert_eq!(c.encode("PATCH LEVEL", &json!(100)).unwrap().1, vec![50]); // displayed ×2
        assert!(c.encode("PATCH LEVEL", &json!(99)).is_err());
        assert_eq!(c.encode("REVERB: TYPE", &json!("AMBIENCE")).unwrap().1, vec![0]);
        assert!(c.encode("PREAMP B: ON/OFF", &json!("ON")).is_err()); // locked
        assert!(c.encode("CHORUS: ON/OFF", &json!("OFF")).is_ok()); // the locked value itself is harmless

        let p = c.get("EQ: LOW GAIN").unwrap();
        let mem: Memory = [(sysex::lin(p.addr), 18)].into();
        assert_eq!(c.value(p, &mem), Some(json!(-2)));
        let p = c.get("PRM_EQ_GEQ_BAND1").unwrap();
        assert_eq!((p.raw_range(), p.display(21)), ((0, 48), json!(-1.5)));
        assert_eq!(c.get("PATCH LEVEL").unwrap().raw_range(), (0, 100));
    }

    #[test]
    fn ctl_lists() {
        let c = Catalog::load();
        let f = c.get("CTL/EXP: ACCEL/CTL: FUNC").unwrap();
        assert!(f.options.iter().any(|o| o == &(22, "TUNER".to_string())));
        assert!(!f.options.iter().any(|o| o.0 == 21 || o.0 == 23)); // AMP CTL, MANUAL MODE: rejected by the 50 MK1
        assert_eq!(c.encode("CTL/EXP: EXP: FUNC", &json!("FOOT VOLUME")).unwrap().1, vec![1]);
        assert_eq!(c.get("ASSIGN3: SOURCE").unwrap().options[0].1, "EXP PEDAL");
        assert_eq!(c.target(0).unwrap().name, "COMP: ON/OFF");
        assert!(c.targets.len() > 600);
    }

    #[test]
    fn export_roundtrips() {
        let c = Catalog::load();
        let path = format!("{}/../tones/warm-dreamy.json", env!("CARGO_MANIFEST_DIR"));
        let tone: Tone = serde_json::from_str(&std::fs::read_to_string(path).unwrap()).unwrap();
        // an edit buffer of zeros with the tone applied
        let mut mem: Memory = c.params.iter().flat_map(|p| (0..p.size as u32).map(|i| (sysex::lin(p.addr) + i, 0))).collect();
        for (a, d) in c.encode_tone(&tone).0 {
            mem.extend(d.iter().enumerate().map(|(i, &b)| (sysex::lin(a) + i as u32, b)));
        }
        let out = c.export(&mem, "x");
        assert!(c.encode_tone(&out).1.is_empty());
        for k in ["PREAMP A: GAIN", "DELAY: DELAY TIME", "FX1: 2x2 CHORUS: HIGH DEPTH", "FX CHAIN: POSITION20"] {
            assert!(out.params.contains_key(k), "{k}");
        }
        assert_eq!(out.params["DELAY: DELAY TIME"], json!(420));
        assert!(!out.params.contains_key("FX2: FX TYPE")); // FX2 is off, so only its switch travels
    }

    #[test]
    fn example_tones_encode_cleanly() {
        let c = Catalog::load();
        for f in ["warm-dry", "warm-dreamy"] {
            let path = format!("{}/../tones/{f}.json", env!("CARGO_MANIFEST_DIR"));
            let tone: Tone = serde_json::from_str(&std::fs::read_to_string(path).unwrap()).unwrap();
            let (writes, skipped) = c.encode_tone(&tone);
            assert!(skipped.is_empty(), "{f}: {skipped:?}");
            assert_eq!(writes.len(), tone.params.len());
        }
    }
}
