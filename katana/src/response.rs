//! Frequency response of the EQ block, drawn as standard filter curves (RBJ biquads) from the current parameters.
//! Only the EQ is modelled; the amp models' tone stacks and drives aren't (notes/05).

use crate::amp::Memory;
use crate::catalog::{Catalog, Param};

// ponytail: BOSS doesn't publish these; guesses until measured through USB re-amping (notes/TODO §7).
const LOW_SHELF_HZ: f64 = 100.0;
const HIGH_SHELF_HZ: f64 = 6300.0;
const GEQ_Q: f64 = 1.4; // octave-spaced graphic EQ
const FS: f64 = 96_000.0; // evaluation rate; high enough that 20 kHz isn't bent by the bilinear transform

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum Kind {
    LowCut,
    HighCut,
    LowShelf,
    HighShelf,
    Peak,
}

/// One band of the EQ, with the parameters that drive it (for handles and readouts).
#[derive(Debug, Clone)]
pub struct Band<'a> {
    pub name: &'static str,
    pub kind: Kind,
    /// None = FLAT (a cut that's off).
    pub freq: Option<f64>,
    pub gain_db: f64,
    pub q: f64,
    pub freq_param: Option<&'a Param>,
    pub gain_param: Option<&'a Param>,
    pub q_param: Option<&'a Param>,
}

pub struct Eq<'a> {
    pub on: bool,
    pub graphic: bool,
    pub level_db: f64,
    pub bands: Vec<Band<'a>>,
}

/// "1.60kHz" → 1600, "250Hz" → 250, "FLAT" → None.
pub fn parse_hz(label: &str) -> Option<f64> {
    let (num, mul) = match label.strip_suffix("kHz") {
        Some(n) => (n, 1000.0),
        None => (label.strip_suffix("Hz")?, 1.0),
    };
    num.parse::<f64>().ok().map(|n| n * mul)
}

impl<'a> Band<'a> {
    /// Gain in dB at frequency `f`.
    pub fn db(&self, f: f64) -> f64 {
        let Some(f0) = self.freq else { return 0.0 };
        let w0 = 2.0 * std::f64::consts::PI * f0 / FS;
        let (sin, cos) = w0.sin_cos();
        let a = 10f64.powf(self.gain_db / 40.0);
        let alpha = sin / (2.0 * self.q);
        let [b0, b1, b2, a0, a1, a2] = match self.kind {
            Kind::LowCut => [(1.0 + cos) / 2.0, -(1.0 + cos), (1.0 + cos) / 2.0, 1.0 + alpha, -2.0 * cos, 1.0 - alpha],
            Kind::HighCut => [(1.0 - cos) / 2.0, 1.0 - cos, (1.0 - cos) / 2.0, 1.0 + alpha, -2.0 * cos, 1.0 - alpha],
            Kind::Peak => [1.0 + alpha * a, -2.0 * cos, 1.0 - alpha * a, 1.0 + alpha / a, -2.0 * cos, 1.0 - alpha / a],
            Kind::LowShelf | Kind::HighShelf => {
                let s = if self.kind == Kind::LowShelf { -1.0 } else { 1.0 };
                let r = 2.0 * a.sqrt() * alpha;
                [
                    a * ((a + 1.0) + s * (a - 1.0) * cos + r),
                    -2.0 * s * a * ((a - 1.0) + s * (a + 1.0) * cos),
                    a * ((a + 1.0) + s * (a - 1.0) * cos - r),
                    (a + 1.0) - s * (a - 1.0) * cos + r,
                    2.0 * s * ((a - 1.0) - s * (a + 1.0) * cos),
                    (a + 1.0) - s * (a - 1.0) * cos - r,
                ]
            }
        };
        // |H(e^jw)| for w at f
        let w = 2.0 * std::f64::consts::PI * f / FS;
        let (s1, c1, s2, c2) = (w.sin(), w.cos(), (2.0 * w).sin(), (2.0 * w).cos());
        let num = (b0 + b1 * c1 + b2 * c2).powi(2) + (b1 * s1 + b2 * s2).powi(2);
        let den = (a0 + a1 * c1 + a2 * c2).powi(2) + (a1 * s1 + a2 * s2).powi(2);
        10.0 * (num / den).log10()
    }
}

impl Eq<'_> {
    /// The combined response in dB, or flat when the EQ is off.
    pub fn db(&self, f: f64) -> f64 {
        if !self.on {
            return 0.0;
        }
        self.level_db + self.bands.iter().map(|b| b.db(f)).sum::<f64>()
    }
}

/// The EQ block as it is in `mem` (an edit-buffer image).
pub fn eq<'a>(cat: &'a Catalog, mem: &Memory) -> Option<Eq<'a>> {
    let p = |name: &str| cat.get(name);
    let num = |p: Option<&Param>| p.and_then(|p| p.raw(mem).map(|r| p.number(r)));
    let label = |p: Option<&Param>| {
        p.and_then(|p| cat.value(p, mem)).and_then(|v| v.as_str().map(String::from)).unwrap_or_default()
    };
    let on = num(p("EQ: ON/OFF"))? == 1.0;
    let graphic = num(p("PRM_EQ_TYPE")) == Some(1.0);

    let mut bands = vec![];
    let level;
    if graphic {
        const HZ: [f64; 10] = [31.0, 62.0, 125.0, 250.0, 500.0, 1000.0, 2000.0, 4000.0, 8000.0, 16000.0];
        const NAMES: [&str; 10] = ["31", "62", "125", "250", "500", "1K", "2K", "4K", "8K", "16K"];
        for (i, (hz, name)) in HZ.iter().zip(NAMES).enumerate() {
            let g = p(&format!("PRM_EQ_GEQ_BAND{}", i + 1));
            let gain_db = num(g)?;
            bands.push(Band { name, kind: Kind::Peak, freq: Some(*hz), gain_db, q: GEQ_Q, freq_param: None, gain_param: g, q_param: None });
        }
        level = num(p("PRM_EQ_GEQ_LEVEL")).unwrap_or(0.0);
    } else {
        let (lc, hc) = (p("EQ: LOW CUT"), p("EQ: HIGH CUT"));
        let (lm, hm) = (p("EQ: LOW-MID FREQ"), p("EQ: HIGH-MID FREQ"));
        let (lmq, hmq) = (p("EQ: LOW-MID Q"), p("EQ: HIGH-MID Q"));
        let (lg, lmg, hmg, hg) = (p("EQ: LOW GAIN"), p("EQ: LOW-MID GAIN"), p("EQ: HIGH-MID GAIN"), p("EQ: HIGH GAIN"));
        let q = |p: Option<&Param>| label(p).parse::<f64>().unwrap_or(1.0);
        let b = |name, kind, freq, gain_db, q, fp, gp, qp| Band { name, kind, freq, gain_db, q, freq_param: fp, gain_param: gp, q_param: qp };
        bands = vec![
            b("LOW CUT", Kind::LowCut, parse_hz(&label(lc)), 0.0, 0.707, lc, None, None),
            b("LOW", Kind::LowShelf, Some(LOW_SHELF_HZ), num(lg)?, 0.707, None, lg, None),
            b("LO-MID", Kind::Peak, parse_hz(&label(lm)), num(lmg)?, q(lmq), lm, lmg, lmq),
            b("HI-MID", Kind::Peak, parse_hz(&label(hm)), num(hmg)?, q(hmq), hm, hmg, hmq),
            b("HIGH", Kind::HighShelf, Some(HIGH_SHELF_HZ), num(hg)?, 0.707, None, hg, None),
            b("HIGH CUT", Kind::HighCut, parse_hz(&label(hc)), 0.0, 0.707, hc, None, None),
        ];
        level = num(p("EQ: LEVEL")).unwrap_or(0.0);
    }
    Some(Eq { on, graphic, level_db: level, bands })
}

/// The patch's MASTER EQ (`60 00 07 11`–`15`): low shelf, a mid peak with frequency and Q, high shelf. Always on.
pub fn master_eq<'a>(cat: &'a Catalog, mem: &Memory) -> Option<Eq<'a>> {
    let p = |name: &str| cat.get(name);
    let num = |p: Option<&Param>| p.and_then(|p| p.raw(mem).map(|r| p.number(r)));
    let label = |p: Option<&Param>| {
        p.and_then(|p| cat.value(p, mem)).and_then(|v| v.as_str().map(String::from)).unwrap_or_default()
    };
    let (lg, mf, mq, mg, hg) =
        (p("MASTER EQ: LOW GAIN"), p("MASTER EQ: MID FREQ"), p("MASTER EQ: MID Q"), p("MASTER EQ: MID GAIN"), p("MASTER EQ: HIGH GAIN"));
    let q = label(mq).parse::<f64>().unwrap_or(1.0);
    let b = |name, kind, freq, gain_db, q, fp, gp, qp| Band { name, kind, freq, gain_db, q, freq_param: fp, gain_param: gp, q_param: qp };
    let bands = vec![
        b("LOW", Kind::LowShelf, Some(LOW_SHELF_HZ), num(lg)?, 0.707, None, lg, None),
        b("MID", Kind::Peak, parse_hz(&label(mf)), num(mg)?, q, mf, mg, mq),
        b("HIGH", Kind::HighShelf, Some(HIGH_SHELF_HZ), num(hg)?, 0.707, None, hg, None),
    ];
    Some(Eq { on: true, graphic: false, level_db: 0.0, bands })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn band(kind: Kind, f: f64, g: f64, q: f64) -> Band<'static> {
        Band { name: "", kind, freq: Some(f), gain_db: g, q, freq_param: None, gain_param: None, q_param: None }
    }

    #[test]
    fn curves() {
        assert_eq!(parse_hz("1.60kHz"), Some(1600.0));
        assert_eq!(parse_hz("FLAT"), None);
        let close = |a: f64, b: f64| (a - b).abs() < 0.1;
        assert!(close(band(Kind::Peak, 1000.0, 6.0, 1.0).db(1000.0), 6.0));
        assert!(close(band(Kind::Peak, 1000.0, 6.0, 1.0).db(20.0), 0.0));
        assert!(close(band(Kind::LowCut, 100.0, 0.0, 0.707).db(100.0), -3.0));
        assert!(close(band(Kind::HighCut, 5000.0, 0.0, 0.707).db(5000.0), -3.0));
        assert!(close(band(Kind::LowShelf, 100.0, -6.0, 0.707).db(20.0), -6.0));
        assert!(close(band(Kind::HighShelf, 6300.0, 4.0, 0.707).db(20000.0), 4.0));
    }

    #[test]
    fn master_eq_reads_the_patch() {
        let c = Catalog::load();
        let mut mem: Memory = c.params.iter().flat_map(|p| (0..p.size as u32).map(move |i| (crate::sysex::lin(p.addr) + i, 0))).collect();
        for (n, v) in [("MASTER EQ: MID GAIN", serde_json::json!(6)), ("MASTER EQ: MID FREQ", serde_json::json!("1.00kHz")), ("MASTER EQ: LOW GAIN", serde_json::json!(0)), ("MASTER EQ: HIGH GAIN", serde_json::json!(0))] {
            let (a, d) = c.encode(n, &v).unwrap();
            mem.extend(d.iter().enumerate().map(|(i, &b)| (crate::sysex::lin(a) + i as u32, b)));
        }
        let eq = master_eq(&c, &mem).unwrap();
        assert_eq!(eq.bands.len(), 3);
        assert!((eq.db(1000.0) - 6.0).abs() < 0.2);
        assert!(eq.db(20.0).abs() < 0.5);
    }
}
