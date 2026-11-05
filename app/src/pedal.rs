//! Pedals: every effect drawn as a stompbox of its own (an enclosure colour, a finish and a small graphic per
//! type), with wahs, the pitch bend and the foot volume as treadles. A pedal's knobs are its block's main settings
//! and turn the real parameters; its footswitch (or a click on a treadle's toe) engages the block. The designs are
//! the app's own: no maker's logos or trade dress, just colour and a graphic that says what the effect does.

use eframe::egui::{pos2, vec2, Align2, Color32, Id, Painter, Pos2, Rect, Response, Sense, Shape, Stroke, Ui};
use katana::catalog::Param;
use katana::sysex;

use crate::chain;
use crate::editor::{set_step, steps};
use crate::theme::*;
use crate::widgets::{drag_steps, step_input};
use crate::{display, App};

/// The enclosure's surface.
#[derive(Clone, Copy, PartialEq)]
pub enum Finish {
    Gloss,
    Sparkle,
    Brushed,
    Hammer,
    Stripe,
}

/// The graphic printed on the pedal: what the effect does to the signal.
#[derive(Clone, Copy, PartialEq)]
pub enum Glyph {
    Boost,
    Clip,
    Hard,
    Fuzz,
    Wave,
    Sweep,
    Trem,
    Rotor,
    Ring,
    Swell,
    Slice,
    Comp,
    Peak,
    Sliders,
    Bell,
    Strings,
    Saw,
    Octave,
    Pitch,
    Vowel,
    Echo,
    Tape,
    Reverse,
    Arcs,
    Spring,
    Gate,
    Fader,
    Loop,
    Bend,
    Laser,
}

#[derive(Clone, Copy, PartialEq)]
pub enum Form {
    Stomp,
    Treadle,
}

#[derive(Clone, Copy)]
pub struct Look {
    pub body: Color32,
    pub finish: Finish,
    pub glyph: Glyph,
    pub form: Form,
}

/// The pedal for an effects-map block (`key`) holding type `ty` ("" for blocks without types).
pub fn look(key: &str, ty: &str) -> Look {
    use Finish::*;
    use Glyph::*;
    let s = |c: u32, finish: Finish, glyph: Glyph| Look { body: hex(c), finish, glyph, form: Form::Stomp };
    let t = |c: u32, finish: Finish, glyph: Glyph| Look { body: hex(c), finish, glyph, form: Form::Treadle };
    match (key, ty) {
        // blocks with no type
        ("FOOT_VOLUME", _) => t(0x3A3C40, Brushed, Fader),
        ("NS1", _) => s(0x3F5466, Gloss, Gate),
        ("NS2", _) => s(0x55606B, Gloss, Gate),
        ("SEND_RETURN", _) => s(0x4A4F55, Brushed, Loop),
        // names shared by more than one block
        ("DELAY" | "DELAY2", "MODULATE") => s(0x3BA7A1, Gloss, Echo),
        ("REVERB", "MODULATE") => s(0x6E4BB4, Sparkle, Arcs),
        ("ACCEL_FX", "RING MOD") => s(0x9B3D8F, Sparkle, Ring),
        ("COMP", _) => match ty {
            "HI-BAND" => s(0x5C8FD0, Gloss, Comp),
            "LIGHT" => s(0xA9C7E8, Gloss, Comp),
            "D-COMP" => s(0xE8E3D3, Gloss, Comp),
            "ORANGE" => s(0xE9822F, Hammer, Comp),
            "FAT" => s(0x2D4778, Gloss, Comp),
            "MILD" => s(0x7DA7B8, Gloss, Comp),
            "STEREO COMP" => s(0x3769A8, Stripe, Comp),
            _ => s(0x3C6FB6, Gloss, Comp),
        },
        ("CHORUS", _) => s(0x5BAFD6, Gloss, Wave),
        // the booster
        (_, "CLEAN BOOST") => s(0xE8E3D3, Gloss, Boost),
        (_, "TREBLE BOOST") => s(0xC2C7CC, Brushed, Boost),
        (_, "MID BOOST") => s(0xE07B39, Gloss, Boost),
        (_, "CRUNCH OD") => s(0xD39B3A, Gloss, Clip),
        (_, "BLUES DRIVE") => s(0x2F5DA8, Gloss, Clip),
        (_, "OVERDRIVE") => s(0xE8C547, Gloss, Clip),
        (_, "NATURAL OD") => s(0x8A6F4D, Brushed, Clip),
        (_, "WARM OD") => s(0xB4472E, Gloss, Clip),
        (_, "TURBO OD") => s(0xE3A52B, Stripe, Clip),
        (_, "T-SCREAM") => s(0x3E8E55, Gloss, Clip),
        (_, "DISTORTION") => s(0xEE7A2F, Gloss, Hard),
        (_, "FAT DS") => s(0x7A2E2E, Hammer, Hard),
        (_, "DST+") => s(0xD8D35A, Sparkle, Hard),
        (_, "GUV DS") => s(0x26272B, Stripe, Hard),
        (_, "RAT") => s(0x1D1D1F, Gloss, Hard),
        (_, "METAL ZONE") => s(0x3A3D42, Sparkle, Hard),
        (_, "METAL DS") => s(0x6B7078, Hammer, Hard),
        (_, "'60S FUZZ") => s(0xC23A3A, Hammer, Fuzz),
        (_, "MUFF FUZZ") => s(0xBFC3C7, Stripe, Fuzz),
        (_, "OCT FUZZ") => s(0x6D3FA0, Sparkle, Fuzz),
        // FX1 / FX2
        (_, "CHORUS") => s(0x4FA3C7, Gloss, Wave),
        (_, "FLANGER") => s(0x7E57C2, Gloss, Sweep),
        (_, "PHASER") => s(0xE36F2C, Gloss, Sweep),
        (_, "UNI-V") => s(0x6B4A2F, Brushed, Wave),
        (_, "TREMOLO") => s(0x2E8C7E, Gloss, Trem),
        (_, "VIBRATO") => s(0x9C6ADE, Sparkle, Wave),
        (_, "ROTARY") => s(0x8C2F39, Hammer, Rotor),
        (_, "RING MOD") => s(0x5B6770, Brushed, Ring),
        (_, "SLOW GEAR") => s(0xD9C3A0, Gloss, Swell),
        (_, "SLICER") => s(0xE04F7E, Gloss, Slice),
        (_, "COMP") => s(0x3C6FB6, Gloss, Comp),
        (_, "LIMITER") => s(0x2E4A7D, Gloss, Comp),
        (_, "T.WAH") => s(0x5E9E3A, Gloss, Peak),
        (_, "AUTO WAH") => s(0x7DBE4A, Gloss, Peak),
        (_, "PEDAL WAH") => t(0x1F1F21, Gloss, Peak),
        (_, "GRAPHIC EQ" | "GE-10") => s(0xDDDCD6, Brushed, Sliders),
        (_, "PARAMETRIC EQ") => s(0x4B5563, Gloss, Bell),
        (_, "GUITAR SIM") => s(0xC9A26B, Gloss, Strings),
        (_, "AC.GUITAR SIM") => s(0xB8834A, Brushed, Strings),
        (_, "AC.PROCESSOR") => s(0x9E6B3B, Brushed, Strings),
        (_, "WAVE SYNTH") => s(0x00A3A3, Sparkle, Saw),
        (_, "OCTAVE") => s(0x3A7BD5, Gloss, Octave),
        (_, "HEAVY OCTAVE") => s(0x22252A, Stripe, Octave),
        (_, "PITCH SHIFTER") => s(0xD4483B, Gloss, Pitch),
        (_, "HARMONIST") => s(0x5C3D8F, Sparkle, Pitch),
        (_, "HUMANIZER") => s(0xE2A0B4, Gloss, Vowel),
        (_, "PHASER 90E") => s(0xF07A1A, Hammer, Sweep),
        (_, "FLANGER 117E") => s(0x9AA1A8, Hammer, Sweep),
        (_, "WAH 95E") => t(0x2A2A2D, Brushed, Peak),
        (_, "DC-30") => s(0x7B1E25, Stripe, Tape),
        // pedal FX
        (_, "PEDAL BEND") => t(0x2B5FAE, Gloss, Bend),
        // delay
        (_, "DIGITAL") => s(0xF2F2EE, Gloss, Echo),
        (_, "PAN") => s(0x76C3E0, Gloss, Echo),
        (_, "STEREO") => s(0x5D8FD6, Stripe, Echo),
        (_, "ANALOG") => s(0x2F7A4A, Hammer, Echo),
        (_, "TAPE ECHO") => s(0x8A6A3F, Brushed, Tape),
        (_, "REVERSE") => s(0x8C4FD1, Gloss, Reverse),
        (_, "SDE-3000") => s(0x2C2D31, Brushed, Echo),
        // reverb
        (_, "PLATE") => s(0xC8CCD0, Brushed, Arcs),
        (_, "ROOM") => s(0x8B6B4A, Gloss, Arcs),
        (_, "HALL" | "HALL1" | "HALL2") => s(0x384B8A, Sparkle, Arcs),
        (_, "SPRING") => s(0x2E6B54, Gloss, Spring),
        (_, "AMBIENCE") => s(0x9FB6C8, Sparkle, Arcs),
        // accel FX (dead on the 50 MK1, but it has types)
        (_, "S-BEND") => s(0x2B5FAE, Gloss, Bend),
        (_, "LASER BEAM") => s(0xE0245E, Sparkle, Laser),
        (_, "TWIST") => s(0x13A39A, Gloss, Sweep),
        (_, "WARP") => s(0x4B2F86, Sparkle, Pitch),
        (_, "FEEDBACKER") => s(0xC2402B, Hammer, Swell),
        // anything new: a colour from the name, the graphic from the block
        _ => {
            let h = hash(ty) ^ hash(key);
            let palette = [0x4C7A9E, 0x9E5A4C, 0x5E8C4A, 0x8C6A3A, 0x6A4C9E, 0x3A8C86, 0xA8843A, 0x7A3A5A];
            let glyph = match key {
                "DELAY" | "DELAY2" => Echo,
                "REVERB" => Arcs,
                "ODDS" => Clip,
                "EQ" => Bell,
                "PEDAL_FX" => Peak,
                _ => Wave,
            };
            let form = if key == "PEDAL_FX" { Form::Treadle } else { Form::Stomp };
            Look { body: hex(palette[(h % palette.len() as u32) as usize]), finish: [Gloss, Sparkle, Brushed, Hammer][(h >> 8) as usize % 4], glyph, form }
        }
    }
}

fn hash(s: &str) -> u32 {
    s.bytes().fold(0x811C9DC5u32, |h, b| (h ^ b as u32).wrapping_mul(0x01000193))
}

/// A small deterministic random sequence (finish texture), 0..1.
struct Rng(u32);

impl Rng {
    fn next(&mut self) -> f32 {
        self.0 ^= self.0 << 13;
        self.0 ^= self.0 >> 17;
        self.0 ^= self.0 << 5;
        (self.0 % 10_000) as f32 / 10_000.0
    }
}

fn luma(c: Color32) -> f32 {
    (0.299 * c.r() as f32 + 0.587 * c.g() as f32 + 0.114 * c.b() as f32) / 255.0
}

/// Print colour on a body: near-black on light enclosures, cream on dark ones.
fn ink(body: Color32) -> Color32 {
    if luma(body) > 0.55 {
        hex(0x18171A)
    } else {
        hex(0xF2EEE6)
    }
}

// --- what a block's pedal shows ----------------------------------------------------------------------------------

pub struct Pedal {
    /// Small print: the slot ("FX 1", "BOOSTER").
    pub slot: String,
    /// The effect, large: its type, else the block's name.
    pub name: String,
    pub look: Look,
    pub on: bool,
    pub locked: bool,
    pub knobs: Vec<&'static Param>,
    /// A treadle's position parameter.
    pub pos: Option<&'static Param>,
    /// A graphic EQ's bands, drawn as sliders.
    pub bands: Vec<&'static Param>,
}

/// The name a block's effect goes by: its type, else a plain name for typeless blocks.
pub fn effect_name(app: &App, key: &str) -> String {
    if let Some(p) = chain::type_param(app, key).filter(|p| app.raw(p).is_some()) {
        return app.shown(p);
    }
    match key {
        "NS1" | "NS2" => "NOISE SUPPRESSOR".into(),
        "FOOT_VOLUME" => "FOOT VOLUME".into(),
        "SEND_RETURN" => "SEND / RETURN".into(),
        k => k.replace('_', " "),
    }
}

/// The pedal for chain block `id`, showing effects-map block `key` (one of the block's pages).
pub fn spec(app: &App, id: u8, key: &str, slot: &str, max_knobs: usize) -> Pedal {
    let name = effect_name(app, key);
    let ty = chain::type_param(app, key).filter(|p| app.raw(p).is_some()).map(|p| app.shown(p)).unwrap_or_default();
    let look = look(key, &ty);
    let (on, locked) = chain::block_state(app, id);
    let mut params: Vec<&'static Param> = app.cat.block_params(key, &app.mem).into_iter().filter(|p| !p.is_locked() && p.options.is_empty()).collect();
    params.sort_by_key(|p| sysex::lin(p.addr));
    let up = |p: &Param| p.label.to_uppercase();
    let pos = if look.form == Form::Treadle {
        params.iter().copied().find(|p| up(p).contains("PEDAL POS")).or_else(|| params.iter().copied().find(|p| up(p) == "LEVEL"))
    } else {
        None
    };
    params.retain(|p| pos.is_none_or(|q| !std::ptr::eq(*p, q)));
    let bands: Vec<&'static Param> = if look.glyph == Glyph::Sliders { params.iter().copied().filter(|p| up(p).ends_with("HZ")).collect() } else { vec![] };
    params.retain(|p| !bands.iter().any(|b| std::ptr::eq(*p, *b)));
    // the main settings first; DIRECT MIX only when there is room
    let mut ranked: Vec<(usize, &'static Param)> = params.iter().copied().enumerate().collect();
    ranked.sort_by_key(|(i, p)| (up(p).contains("DIRECT MIX") as usize, *i));
    let mut knobs: Vec<(usize, &'static Param)> = ranked.into_iter().take(if look.form == Form::Treadle { 0 } else { max_knobs }).collect();
    knobs.sort_by_key(|(i, _)| *i);
    Pedal { slot: slot.into(), name, look, on, locked, knobs: knobs.into_iter().map(|(_, p)| p).collect(), pos, bands }
}

/// What came of a pedal this frame: a click on it (select) or on its footswitch (engage or bypass).
pub struct Out {
    pub clicked: bool,
    pub stomped: bool,
}

/// Draws `pd` in `r` (a 2:3 box). `live` makes its knobs turn (else a click anywhere on it is a body click).
pub fn draw(app: &mut App, ui: &Ui, r: Rect, salt: u8, pd: &Pedal, selected: bool, live: bool) -> Out {
    let body = ui.interact(r, Id::unique(("pedal", salt)), Sense::click());
    let k = r.width() / 130.0;
    let mut p = ui.painter().clone();
    if pd.locked {
        p.multiply_opacity(0.42);
    }
    if selected {
        glow(&p, r.expand(3.0 * k), 10.0 * k, 14.0 * k, alpha(led(), 0.28));
    }
    shadow(&p, r, 9.0 * k, 6.0 * k, 12.0 * k, rgba(0x000000C8));
    let (stomped, heel) = match pd.look.form {
        Form::Stomp => (stomp(app, ui, &p, r, k, salt, pd, live), false),
        Form::Treadle => treadle(app, ui, &p, r, k, salt, pd, live),
    };
    if selected {
        p.rect_stroke(r.expand(2.5 * k), 10.0 * k, Stroke::new(1.5, led()), eframe::egui::StrokeKind::Middle);
    }
    if pd.locked {
        let tr = Rect::from_center_size(r.center(), vec2(r.width() + 6.0 * k, 16.0 * k.max(0.8)));
        let full = ui.painter();
        full.rect_filled(tr, 2.0, rgba(0x15151590));
        dashed_rect(full, tr, rgba(0xE8E4DC70));
        text_max(full, tr.center(), Align2::CENTER_CENTER, "FIXED", F::Silk2, 8.5 * k.max(0.85), SILK2, tr.width() - 6.0);
    }
    Out { clicked: body.clicked() || heel, stomped }
}

fn enclosure(p: &Painter, r: Rect, k: f32, rad: f32, look: &Look, seed: u32) {
    let b = look.body;
    vgrad(p, r, rad, mix(b, Color32::WHITE, 0.10), mix(b, BLACK, 0.22));
    let clip = p.with_clip_rect(r.shrink(1.0).intersect(p.clip_rect()));
    let mut rng = Rng(seed | 1);
    let i = ink(b);
    match look.finish {
        Finish::Gloss => {
            let pts = vec![r.left_top() + vec2(rad, 0.0), pos2(r.left() + r.width() * 0.55, r.top()), pos2(r.left(), r.top() + r.height() * 0.42), pos2(r.left(), r.top() + rad)];
            clip.add(Shape::convex_polygon(pts, rgba(0xFFFFFF14), Stroke::NONE));
        }
        Finish::Sparkle => {
            let n = (r.area() / (70.0 * k.max(0.5))) as usize;
            for j in 0..n {
                let q = pos2(r.left() + rng.next() * r.width(), r.top() + rng.next() * r.height());
                let c = if j % 3 == 0 { rgba(0x00000030) } else { rgba(0xFFFFFF48) };
                clip.circle_filled(q, (0.45 + rng.next() * 0.6) * k.max(0.7), c);
            }
        }
        Finish::Brushed => {
            let mut y = r.top() + 1.0;
            let mut j = 0;
            while y < r.bottom() {
                let c = if j % 2 == 0 { rgba(0xFFFFFF0A) } else { rgba(0x00000012) };
                clip.hline(r.left()..=r.right(), y, Stroke::new(0.8, c));
                y += 1.6 + rng.next() * 1.4;
                j += 1;
            }
        }
        Finish::Hammer => {
            for j in 0..((r.area() / (260.0 * k.max(0.5))) as usize) {
                let q = pos2(r.left() + rng.next() * r.width(), r.top() + rng.next() * r.height());
                let c = if j % 2 == 0 { rgba(0xFFFFFF0E) } else { rgba(0x00000018) };
                clip.circle_filled(q, (3.0 + rng.next() * 6.0) * k, c);
            }
        }
        Finish::Stripe => {
            let sr = Rect::from_center_size(pos2(r.center().x, r.center().y), vec2(24.0 * k, r.height()));
            clip.rect_filled(sr, 0.0, alpha(i, 0.20));
            clip.vline(sr.left(), r.y_range(), Stroke::new(1.0 * k, alpha(i, 0.35)));
            clip.vline(sr.right(), r.y_range(), Stroke::new(1.0 * k, alpha(i, 0.35)));
        }
    }
    p.rect_stroke(r, rad, Stroke::new(1.0, rgba(0x000000A0)), eframe::egui::StrokeKind::Outside);
    hline(&clip, r.left() + rad, r.right() - rad, r.top() + 0.5, rgba(0xFFFFFF40));
}

fn screw(p: &Painter, c: Pos2, k: f32) {
    let rr = 2.3 * k.max(0.6);
    p.circle_filled(c, rr, hex(0x9C9993));
    p.circle_stroke(c, rr, Stroke::new(0.6, rgba(0x00000090)));
    p.line_segment([c - vec2(rr * 0.7, 0.0), c + vec2(rr * 0.7, 0.0)], Stroke::new(0.7, rgba(0x00000099)));
}

fn jacks(p: &Painter, r: Rect, k: f32, y: f32) {
    for (x, dir) in [(r.left(), -1.0), (r.right(), 1.0)] {
        let jr = Rect::from_center_size(pos2(x + dir * 3.0 * k, y), vec2(6.0 * k, 12.0 * k));
        vgrad(p, jr, 1.5 * k, hex(0xB9B6B0), hex(0x5A5853));
        p.rect_stroke(jr, 1.5 * k, Stroke::new(0.6, rgba(0x000000A0)), eframe::egui::StrokeKind::Inside);
    }
}

/// The effect's name, as large as fits `w`, on one line or two.
fn name(p: &Painter, c: Pos2, s: &str, w: f32, size: f32, color: Color32) {
    let fit = |t: &str, max: f32| {
        let tw = text_w(p, t, F::Title, size);
        if tw <= w { max } else { (max * w / tw).max(5.0) }
    };
    let one = fit(s, size);
    let words: Vec<&str> = s.split(' ').collect();
    if one >= size * 0.78 || words.len() < 2 {
        text(p, c, Align2::CENTER_CENTER, s, F::Title, one, color);
        return;
    }
    let mid = (1..words.len()).min_by_key(|&i| (words[..i].join(" ").len() as i32 - words[i..].join(" ").len() as i32).abs()).unwrap_or(1);
    let (a, b) = (words[..mid].join(" "), words[mid..].join(" "));
    let sz = fit(&a, size * 0.82).min(fit(&b, size * 0.82));
    text(p, c - vec2(0.0, sz * 0.58), Align2::CENTER_CENTER, &a, F::Title, sz, color);
    text(p, c + vec2(0.0, sz * 0.58), Align2::CENTER_CENTER, &b, F::Title, sz, color);
}

#[allow(clippy::too_many_arguments)]
fn stomp(app: &mut App, ui: &Ui, p: &Painter, r: Rect, k: f32, salt: u8, pd: &Pedal, live: bool) -> bool {
    let look = &pd.look;
    let i = ink(look.body);
    jacks(p, r, k, r.top() + 44.0 * k);
    enclosure(p, r, k, 9.0 * k, look, hash(&pd.name));
    for c in [pos2(r.left() + 7.0 * k, r.top() + 7.0 * k), pos2(r.right() - 7.0 * k, r.top() + 7.0 * k)] {
        screw(p, c, k);
    }

    // knobs, or a graphic EQ's sliders
    let small = k < 0.8;
    if !pd.bands.is_empty() {
        let zone = Rect::from_min_max(pos2(r.left() + 14.0 * k, r.top() + 14.0 * k), pos2(r.right() - 14.0 * k, r.top() + 80.0 * k));
        let n = pd.bands.len();
        for (j, b) in pd.bands.iter().enumerate() {
            let x = zone.left() + zone.width() * (j as f32 + 0.5) / n as f32;
            p.vline(x, zone.top()..=zone.bottom() - 6.0 * k, Stroke::new(1.6 * k, rgba(0x00000080)));
            let (lo, hi) = b.raw_range();
            let f = app.raw(b).map_or(0.5, |v| (v.saturating_sub(lo)) as f32 / (hi - lo).max(1) as f32);
            let y = zone.bottom() - 6.0 * k - f * (zone.height() - 6.0 * k);
            let cap = Rect::from_center_size(pos2(x, y), vec2(6.0 * k, 3.5 * k));
            vgrad(p, cap, 1.0, hex(0x3A3A3D), hex(0x111112));
            hline(p, cap.left(), cap.right(), cap.center().y - 0.5, alpha(Color32::WHITE, 0.7));
        }
    } else if !pd.knobs.is_empty() {
        let n = pd.knobs.len();
        let (rows, cols) = if n == 4 { (2, 2) } else { (1, n) };
        let rad = match (rows, cols) {
            (2, _) => 11.0,
            (_, 1) => 16.0,
            (_, 2) => 14.0,
            _ => 11.5,
        } * k;
        let zone_top = r.top() + 12.0 * k;
        let zone_h = 74.0 * k;
        for (j, q) in pd.knobs.iter().enumerate() {
            let (row, col) = (j / cols, j % cols);
            let row_n = if row == rows - 1 { n - row * cols } else { cols };
            let x = r.left() + r.width() * (col as f32 + 0.5) / row_n as f32;
            let label_h = if small { 0.0 } else { 10.0 * k };
            let slot_h = zone_h / rows as f32;
            let y = zone_top + slot_h * row as f32 + (slot_h - label_h) / 2.0;
            pedal_knob(app, ui, p, pos2(x, y), rad, q, Id::unique(("pedal-knob", salt, j)), live, i);
            if !small {
                let lw = r.width() / cols as f32 - 4.0 * k;
                text_max(p, pos2(x, y + rad + 7.0 * k), Align2::CENTER_CENTER, &q.label.to_uppercase(), F::Silk2, 6.6 * k, alpha(i, 0.9), lw);
            }
        }
    }

    // graphic, name, LED
    let plate_y = r.top() + 88.0 * k;
    let gr = Rect::from_center_size(pos2(r.center().x, plate_y + 8.0 * k), vec2(34.0 * k, 15.0 * k));
    glyph(p, gr, look.glyph, i, k);
    led_dot(p, pos2(r.right() - 14.0 * k, plate_y + 8.0 * k), (6.0 * k).max(4.0), pd.on && !pd.locked);
    name(p, pos2(r.center().x, plate_y + 31.0 * k), &pd.name, r.width() - 16.0 * k, 13.0 * k, i);
    if !small {
        text_max(p, pos2(r.center().x, plate_y + 47.0 * k), Align2::CENTER_CENTER, &pd.slot, F::Silk2, 6.6 * k, alpha(i, 0.7), r.width() - 16.0 * k);
    }

    // footswitch plate
    let fr = Rect::from_min_max(pos2(r.left() + 7.0 * k, r.top() + 142.0 * k), pos2(r.right() - 7.0 * k, r.bottom() - 7.0 * k));
    vgrad(p, fr, 6.0 * k, mix(look.body, BLACK, 0.42), mix(look.body, BLACK, 0.58));
    hline(p, fr.left() + 6.0 * k, fr.right() - 6.0 * k, fr.top(), rgba(0x00000080));
    hline(p, fr.left() + 6.0 * k, fr.right() - 6.0 * k, fr.bottom() - 1.0, rgba(0xFFFFFF18));
    let resp = ui.interact(Rect::from_center_size(fr.center(), vec2(40.0 * k, 40.0 * k).max(vec2(24.0, 24.0))), Id::unique(("pedal-stomp", salt)), Sense::click());
    footswitch(p, fr.center(), 15.0 * k, resp.is_pointer_button_down_on());
    let tip = if pd.on { "Stomp to bypass" } else { "Stomp to engage" };
    let resp = resp.on_hover_text(tip);
    resp.clicked() && !pd.locked
}

fn footswitch(p: &Painter, c: Pos2, hexr: f32, pressed: bool) {
    let pts: Vec<Pos2> = (0..6).map(|i| point(c, 30.0 + 60.0 * i as f32, hexr)).collect();
    grad_poly(p, &pts, |q| {
        let t = ((q.y - (c.y - hexr)) / (2.0 * hexr)).clamp(0.0, 1.0);
        lerp_c(hex(0xC9C6C0), hex(0x5E5B56), t)
    });
    p.add(Shape::closed_line(pts, Stroke::new(0.8, rgba(0x00000080))));
    let cr = hexr * if pressed { 0.55 } else { 0.6 };
    radial_disc(p, c, cr, c + vec2(-cr * 0.25, -cr * 0.3), cr * 1.7, &[(0.0, hex(0xFFFFFF)), (0.45, hex(0xBDBAB4)), (1.0, hex(0x4A4844))]);
    p.circle_stroke(c, cr, Stroke::new(0.8, rgba(0x00000090)));
}

/// A black dome knob with a white line; turns `q` when `live`.
#[allow(clippy::too_many_arguments)]
fn pedal_knob(app: &mut App, ui: &Ui, p: &Painter, c: Pos2, rad: f32, q: &'static Param, id: Id, live: bool, ink_c: Color32) {
    let (idx, n, mem) = steps(app, q);
    let enabled = live && app.online() && app.raw(q).is_some();
    let mut new = idx;
    if enabled {
        let resp = ui.interact(Rect::from_center_size(c, vec2(rad * 2.0 + 6.0, rad * 2.0 + 6.0)), id, Sense::click_and_drag());
        new = step_input(ui, &resp, idx, n);
        new = drag_steps(ui, &resp, id, new, n, 200.0);
        if resp.double_clicked() {
            if let Some(m) = mem {
                new = m;
            }
        }
        if resp.drag_started() || resp.clicked() {
            app.touched = Some(q);
        }
        let shown = app.raw(q).map_or("—".into(), |v| display(q, v));
        let _ = resp.on_hover_text(format!("{} · {shown}", q.name));
        if new != idx {
            set_step(app, q, new);
        }
    }
    let f = if n > 1 { new as f32 / (n - 1) as f32 } else { 0.0 };
    // scale ticks in the print colour
    for j in 0..=10 {
        let a = -135.0 + 27.0 * j as f32;
        p.line_segment([point(c, a, rad + 2.0), point(c, a, rad + 2.0 + 2.2 * (rad / 12.0).max(0.6))], Stroke::new(0.8, alpha(ink_c, 0.6)));
    }
    if let Some(m) = mem.filter(|&m| m != new && n > 1) {
        let a = -135.0 + 270.0 * m as f32 / (n - 1) as f32;
        p.line_segment([point(c, a, rad + 1.5), point(c, a, rad + 5.0)], Stroke::new(1.8, led()));
    }
    p.circle_filled(c + vec2(0.0, rad * 0.12), rad + 0.5, rgba(0x00000090));
    radial_disc(p, c, rad, c + vec2(-rad * 0.3, -rad * 0.4), rad * 1.6, &[(0.0, hex(0x5A5A5E)), (0.5, hex(0x232325)), (1.0, hex(0x0B0B0C))]);
    knurl(p, c, rad * 0.86, rad, 8.0, rgba(0x00000040), rgba(0xFFFFFF10));
    let a = -135.0 + 270.0 * f;
    p.line_segment([point(c, a, rad * 0.25), point(c, a, rad * 0.92)], Stroke::new((rad / 8.0).clamp(1.0, 2.0), hex(0xF4F1EA)));
}

#[allow(clippy::too_many_arguments)]
/// Returns (toe clicked, rest of the treadle clicked).
fn treadle(app: &mut App, ui: &Ui, p: &Painter, r: Rect, k: f32, salt: u8, pd: &Pedal, live: bool) -> (bool, bool) {
    let look = &pd.look;
    let i = ink(look.body);
    jacks(p, r, k, r.top() + 60.0 * k);
    enclosure(p, r, k, 10.0 * k, look, hash(&pd.name));
    let tr = Rect::from_min_max(pos2(r.left() + 10.0 * k, r.top() + 9.0 * k), pos2(r.right() - 10.0 * k, r.bottom() - 52.0 * k));
    let pos = pd.pos;
    let f = pos.and_then(|q| {
        let (lo, hi) = q.raw_range();
        app.raw(q).map(|v| (v.saturating_sub(lo)) as f32 / (hi - lo).max(1) as f32)
    }).unwrap_or(0.5);
    // drag the treadle to rock it, click to engage
    let resp = ui.interact(tr, Id::unique(("treadle", salt)), if live { Sense::click_and_drag() } else { Sense::click() });
    if let (true, Some(q)) = (live && app.online(), pos) {
        let (idx, n, _) = steps(app, q);
        let mut new = step_input(ui, &resp, idx, n);
        new = drag_steps(ui, &resp, Id::unique(("treadle-drag", salt)), new, n, 140.0);
        if resp.drag_started() {
            app.touched = Some(q);
        }
        if new != idx {
            set_step(app, q, new);
        }
    }
    // toe down (f = 1): the toe end looks longer and lit from above
    let tilt = (f - 0.5) * 2.0;
    let inset_top = (1.0 - tilt) * 3.0 * k;
    let inset_bot = (1.0 + tilt) * 3.0 * k;
    let pts = vec![
        pos2(tr.left() + inset_top, tr.top()),
        pos2(tr.right() - inset_top, tr.top()),
        pos2(tr.right() - inset_bot, tr.bottom()),
        pos2(tr.left() + inset_bot, tr.bottom()),
    ];
    let pressed = resp.is_pointer_button_down_on() && !resp.dragged();
    let shade = if pressed { 0.1 } else { 0.0 };
    shadow(p, tr, 6.0 * k, 4.0 * k, 8.0 * k, rgba(0x000000B0));
    grad_poly(p, &pts, |q| {
        let t = ((q.y - tr.top()) / tr.height()).clamp(0.0, 1.0);
        let top = 0.24 + 0.1 * tilt - shade;
        let bot = 0.16 - 0.08 * tilt - shade;
        let v = top + (bot - top) * t;
        mix(hex(0x0A0A0B), hex(0x6A6A6E), v.clamp(0.0, 1.0))
    });
    p.add(Shape::closed_line(pts.clone(), Stroke::new(0.8, rgba(0x000000C0))));
    // rubber ridges
    let mut y = tr.top() + 8.0 * k;
    while y < tr.bottom() - 6.0 * k {
        let t = (y - tr.top()) / tr.height();
        let ins = inset_top + (inset_bot - inset_top) * t + 5.0 * k;
        p.line_segment([pos2(tr.left() + ins, y), pos2(tr.right() - ins, y)], Stroke::new(1.6 * k, rgba(0x00000090)));
        p.line_segment([pos2(tr.left() + ins, y + 1.4 * k), pos2(tr.right() - ins, y + 1.4 * k)], Stroke::new(0.7 * k, rgba(0xFFFFFF1C)));
        y += 6.0 * k;
    }
    // position gauge along the base
    let gr = Rect::from_min_max(pos2(r.left() + 3.5 * k, tr.top() + 6.0 * k), pos2(r.left() + 6.5 * k, tr.bottom() - 6.0 * k));
    p.rect_filled(gr, 1.0, rgba(0x00000090));
    if pos.is_some() {
        let lit_r = Rect::from_min_max(pos2(gr.left(), gr.bottom() - gr.height() * f), gr.max);
        if pd.on && !pd.locked {
            glow(p, lit_r, 1.0, 4.0, alpha(led(), 0.45));
            p.rect_filled(lit_r, 1.0, lit());
        } else {
            p.rect_filled(lit_r, 1.0, dim());
        }
    }
    // name plate
    let plate = Rect::from_min_max(pos2(r.left() + 8.0 * k, tr.bottom() + 6.0 * k), pos2(r.right() - 8.0 * k, r.bottom() - 7.0 * k));
    let gr2 = Rect::from_center_size(pos2(plate.left() + 18.0 * k, plate.top() + 10.0 * k), vec2(22.0 * k, 11.0 * k));
    glyph(p, gr2, look.glyph, i, k * 0.8);
    led_dot(p, pos2(plate.right() - 8.0 * k, plate.top() + 10.0 * k), (6.0 * k).max(4.0), pd.on && !pd.locked);
    name(p, pos2(plate.center().x, plate.top() + 27.0 * k), &pd.name, plate.width() - 4.0 * k, 12.0 * k, i);
    if k >= 0.8 {
        let what = |q: &Param| if q.label.to_uppercase().contains("POS") { "POS" } else { "LVL" };
        let v = pos.and_then(|q| app.raw(q).map(|v| format!("{} · {} {}", pd.slot, what(q), display(q, v)))).unwrap_or(pd.slot.clone());
        text_max(p, pos2(plate.center().x, plate.top() + 40.0 * k), Align2::CENTER_CENTER, &v, F::Silk2, 6.6 * k, alpha(i, 0.7), plate.width());
    }
    let tip = if live { "Drag to rock the pedal · click the toe to engage or bypass" } else { "Click the toe to engage or bypass" };
    let resp = resp.on_hover_text(tip);
    let toe = resp.interact_pointer_pos().is_some_and(|q| q.y < tr.top() + tr.height() * 0.3);
    (resp.clicked() && toe && !pd.locked, resp.clicked() && !toe)
}

/// The graphic in `g`: a stroke drawing of the effect.
fn glyph(p: &Painter, g: Rect, kind: Glyph, c: Color32, k: f32) {
    let st = Stroke::new((1.4 * k).max(1.0), c);
    let n = 48;
    let curve = |f: &dyn Fn(f32) -> f32| -> Vec<Pos2> {
        (0..=n).map(|j| {
            let t = j as f32 / n as f32;
            pos2(g.left() + t * g.width(), g.center().y - f(t).clamp(-1.0, 1.0) * g.height() / 2.0)
        }).collect()
    };
    let tau = std::f32::consts::TAU;
    let line = |pts: Vec<Pos2>| {
        p.add(Shape::line(pts, st));
    };
    let bar = |x: f32, h: f32| {
        p.line_segment([pos2(x, g.bottom()), pos2(x, g.bottom() - h * g.height())], st);
    };
    match kind {
        Glyph::Boost => {
            for j in 0..3 {
                let y = g.bottom() - j as f32 * g.height() * 0.33;
                line(vec![pos2(g.center().x - g.width() * 0.3, y), pos2(g.center().x, y - g.height() * 0.32), pos2(g.center().x + g.width() * 0.3, y)]);
            }
        }
        Glyph::Clip => line(curve(&|t| (2.6 * (tau * 2.0 * t).sin()).tanh() * 0.9)),
        Glyph::Hard => line(curve(&|t| (4.0 * (tau * 2.0 * t).sin()).clamp(-0.8, 0.8))),
        Glyph::Fuzz => line(curve(&|t| {
            let s = (tau * 2.0 * t).sin().signum() * 0.8;
            s + 0.15 * (tau * 19.0 * t).sin()
        })),
        Glyph::Wave => line(curve(&|t| (tau * 2.0 * t).sin() * 0.8)),
        Glyph::Sweep => line(curve(&|t| (tau * (1.0 + 3.0 * t) * t * 1.6).sin() * 0.8)),
        Glyph::Trem => {
            for j in 0..13 {
                let t = j as f32 / 12.0;
                let a = 0.55 + 0.45 * (tau * 1.5 * t).sin();
                let x = g.left() + t * g.width();
                p.line_segment([pos2(x, g.center().y - a * g.height() / 2.0), pos2(x, g.center().y + a * g.height() / 2.0)], st);
            }
        }
        Glyph::Rotor => {
            let r = g.height() * 0.5;
            p.circle_stroke(g.center(), r, st);
            line(vec![point(g.center(), 60.0, r * 0.95), point(g.center(), 240.0, r * 0.95)]);
            p.circle_filled(point(g.center(), 60.0, r * 0.7), 1.6 * k.max(0.8), c);
        }
        Glyph::Ring => {
            let r = g.height() * 0.45;
            p.circle_stroke(g.center() - vec2(r * 0.55, 0.0), r, st);
            p.circle_stroke(g.center() + vec2(r * 0.55, 0.0), r, st);
        }
        Glyph::Swell => line(curve(&|t| (tau * 5.0 * t).sin() * (t * t) * 0.95)),
        Glyph::Slice => {
            for j in 0..6 {
                let x0 = g.left() + g.width() * j as f32 / 6.0;
                let h = if j % 2 == 0 { 0.9 } else { 0.55 };
                let rr = Rect::from_min_max(pos2(x0 + 1.0, g.center().y - h * g.height() / 2.0), pos2(x0 + g.width() / 6.0 - 1.5, g.center().y + h * g.height() / 2.0));
                p.rect_filled(rr, 0.5, c);
            }
        }
        Glyph::Comp => {
            line(curve(&|t| (tau * 3.0 * t).sin() * (0.95 - 0.55 * (t * 2.0).min(1.0))));
            let y = g.height() * 0.22;
            hline(p, g.left() + g.width() * 0.5, g.right(), g.center().y - y, alpha(c, 0.6));
            hline(p, g.left() + g.width() * 0.5, g.right(), g.center().y + y, alpha(c, 0.6));
        }
        Glyph::Peak => line(curve(&|t| {
            let d = (t - 0.55) / 0.09;
            -0.6 + 1.5 * (-d * d).exp() - 0.5 * (t - 0.55).max(0.0)
        })),
        Glyph::Sliders => {
            for j in 0..5 {
                let x = g.left() + g.width() * (j as f32 + 0.5) / 5.0;
                p.line_segment([pos2(x, g.top()), pos2(x, g.bottom())], Stroke::new(st.width * 0.6, alpha(c, 0.6)));
                let y = g.top() + g.height() * [0.6, 0.3, 0.5, 0.2, 0.45][j];
                p.rect_filled(Rect::from_center_size(pos2(x, y), vec2(4.0 * k.max(0.8), 2.4 * k.max(0.8))), 0.5, c);
            }
        }
        Glyph::Bell => line(curve(&|t| {
            let a = (-((t - 0.3) / 0.1).powi(2)).exp();
            let b = (-((t - 0.72) / 0.08).powi(2)).exp();
            -0.15 + 0.9 * a - 0.7 * b
        })),
        Glyph::Strings => {
            for j in 0..4 {
                let y = g.top() + g.height() * (j as f32 + 0.5) / 4.0;
                p.line_segment([pos2(g.left(), y), pos2(g.right(), y)], Stroke::new(st.width * 0.6, c));
            }
            p.circle_filled(g.center(), g.height() * 0.36, mix(c, BLACK, 0.0));
            p.circle_stroke(g.center(), g.height() * 0.46, st);
        }
        Glyph::Saw => line(curve(&|t| ((t * 3.0).fract() * 2.0 - 1.0) * 0.85)),
        Glyph::Octave => {
            line(curve(&|t| (tau * 1.5 * t).sin() * 0.85));
            p.add(Shape::line(curve(&|t| (tau * 3.0 * t).sin() * 0.4), Stroke::new(st.width * 0.7, alpha(c, 0.7))));
        }
        Glyph::Pitch => {
            let cx = g.center().x;
            line(vec![pos2(cx - g.width() * 0.35, g.center().y), pos2(cx - g.width() * 0.2, g.top()), pos2(cx - g.width() * 0.05, g.center().y)]);
            line(vec![pos2(cx + g.width() * 0.05, g.center().y), pos2(cx + g.width() * 0.2, g.bottom()), pos2(cx + g.width() * 0.35, g.center().y)]);
        }
        Glyph::Vowel => {
            text(p, g.center(), Align2::CENTER_CENTER, "A·E·I", F::MonoB, g.height() * 0.85, c);
        }
        Glyph::Echo | Glyph::Reverse => {
            for j in 0..6 {
                let t = j as f32 / 5.0;
                let h = if kind == Glyph::Echo { 0.75f32.powi(j) } else { 0.75f32.powi(5 - j) };
                bar(g.left() + 2.0 + t * (g.width() - 4.0), h);
            }
        }
        Glyph::Tape => {
            let r = g.height() * 0.42;
            let (a, b) = (pos2(g.left() + r + 1.0, g.center().y), pos2(g.right() - r - 1.0, g.center().y));
            p.circle_stroke(a, r, st);
            p.circle_stroke(b, r, st);
            p.circle_filled(a, r * 0.3, c);
            p.circle_filled(b, r * 0.3, c);
            p.line_segment([a + vec2(0.0, r), b + vec2(0.0, r)], st);
        }
        Glyph::Arcs => {
            let o = pos2(g.left() + 2.0, g.center().y);
            p.circle_filled(o, 1.6 * k.max(0.8), c);
            for j in 1..=4 {
                let rr = g.width() * 0.22 * j as f32;
                let pts: Vec<Pos2> = (0..=12).map(|s| point(o, 45.0 + 90.0 * s as f32 / 12.0, rr)).filter(|q| g.expand(2.0).contains(*q)).collect();
                if pts.len() > 1 {
                    p.add(Shape::line(pts, Stroke::new(st.width, alpha(c, 1.0 - 0.18 * j as f32))));
                }
            }
        }
        Glyph::Spring => {
            let mut pts = vec![];
            for j in 0..=16 {
                let t = j as f32 / 16.0;
                let y = if j % 2 == 0 { g.top() + 1.0 } else { g.bottom() - 1.0 };
                pts.push(pos2(g.left() + t * g.width(), y));
            }
            line(pts);
        }
        Glyph::Gate => {
            hline(p, g.left(), g.left() + g.width() * 0.3, g.center().y, c);
            p.add(Shape::line(curve(&|t| if (0.3..0.75).contains(&t) { (tau * 6.0 * t).sin() * 0.9 } else { 0.0 }), st));
            p.extend(Shape::dashed_line(&[pos2(g.left(), g.top() + 2.0), pos2(g.right(), g.top() + 2.0)], Stroke::new(0.8, alpha(c, 0.6)), 2.0, 2.0));
        }
        Glyph::Fader => {
            p.line_segment([pos2(g.left(), g.bottom()), pos2(g.right(), g.top())], st);
            p.line_segment([pos2(g.left(), g.bottom()), pos2(g.right(), g.bottom())], st);
        }
        Glyph::Loop => {
            let rr = g.shrink2(vec2(g.width() * 0.15, g.height() * 0.1));
            p.rect_stroke(rr, rr.height() / 2.0, st, eframe::egui::StrokeKind::Middle);
            let a = pos2(rr.center().x, rr.top());
            p.add(Shape::convex_polygon(vec![a + vec2(3.0 * k, 0.0), a + vec2(-1.5 * k, -2.5 * k), a + vec2(-1.5 * k, 2.5 * k)], c, Stroke::NONE));
        }
        Glyph::Bend => {
            line(curve(&|t| -0.8 + 1.6 * (t * t)));
            let a = pos2(g.right(), g.top());
            p.add(Shape::convex_polygon(vec![a, a + vec2(-4.0 * k, 0.5 * k), a + vec2(-0.5 * k, 4.0 * k)], c, Stroke::NONE));
        }
        Glyph::Laser => line(curve(&|t| ((t * 6.0).fract() * 2.0 - 1.0) * (1.0 - t) * 0.9)),
    }
}

/// The amp, on the pedalboard: a small cream head with the model on its panel.
pub fn amp_head(app: &App, ui: &Ui, r: Rect, salt: u8, selected: bool) -> Response {
    let resp = ui.interact(r, Id::unique(("amp-head", salt)), Sense::click());
    let p = ui.painter();
    let k = r.width() / 130.0;
    let on = chain::block_state(app, chain::AMP).0;
    if selected {
        glow(p, r.expand(3.0 * k), 8.0 * k, 14.0 * k, alpha(led(), 0.28));
    }
    // handle
    let hr = Rect::from_center_size(pos2(r.center().x, r.top() + 3.0 * k), vec2(r.width() * 0.4, 7.0 * k));
    p.rect_stroke(hr, 3.0 * k, Stroke::new(2.5 * k, hex(0x111112)), eframe::egui::StrokeKind::Middle);
    let box_r = Rect::from_min_max(pos2(r.left(), r.top() + 8.0 * k), r.max);
    shadow(p, box_r, 6.0 * k, 6.0 * k, 12.0 * k, rgba(0x000000C8));
    vgrad(p, box_r, 6.0 * k, hex(0xF2EFE8), hex(0xD9D5CC));
    // grille
    let gr = Rect::from_min_max(pos2(box_r.left() + 8.0 * k, box_r.top() + 8.0 * k), pos2(box_r.right() - 8.0 * k, box_r.bottom() - 54.0 * k));
    p.rect_filled(gr, 3.0 * k, hex(0x2A2622));
    let clip = p.with_clip_rect(gr.intersect(p.clip_rect()));
    let step = 4.0 * k.max(0.6);
    let mut x = gr.left() - gr.height();
    while x < gr.right() {
        clip.line_segment([pos2(x, gr.bottom()), pos2(x + gr.height(), gr.top())], Stroke::new(0.6, rgba(0xFFFFFF14)));
        clip.line_segment([pos2(x, gr.top()), pos2(x + gr.height(), gr.bottom())], Stroke::new(0.6, rgba(0x00000040)));
        x += step;
    }
    p.rect_stroke(gr, 3.0 * k, Stroke::new(1.0, rgba(0x00000080)), eframe::egui::StrokeKind::Inside);
    // panel
    let py = gr.bottom() + 14.0 * k;
    for j in 0..4 {
        let c = pos2(box_r.left() + box_r.width() * (j as f32 + 1.0) / 5.0, py);
        p.circle_filled(c, 5.0 * k, hex(0x1A1A1B));
        p.line_segment([c, point(c, -60.0 + 40.0 * j as f32, 4.5 * k)], Stroke::new(1.0, hex(0xF2EEE6)));
    }
    led_dot(p, pos2(box_r.right() - 10.0 * k, py), (6.0 * k).max(4.0), on);
    name(p, pos2(box_r.center().x, box_r.bottom() - 24.0 * k), &chain::type_text(app, chain::AMP), box_r.width() - 14.0 * k, 12.0 * k, hex(0x18171A));
    if k >= 0.8 {
        text(p, pos2(box_r.center().x, box_r.bottom() - 10.0 * k), Align2::CENTER_CENTER, "PREAMP A", F::Silk2, 6.6 * k, rgba(0x18171AB0));
    }
    p.rect_stroke(box_r, 6.0 * k, Stroke::new(1.0, rgba(0x000000A0)), eframe::egui::StrokeKind::Outside);
    if selected {
        p.rect_stroke(r.expand(2.5 * k), 8.0 * k, Stroke::new(1.5, led()), eframe::egui::StrokeKind::Middle);
    }
    resp.on_hover_text("The amp · its settings live on the Editor")
}

/// A patch cable between two jacks, sagging a little.
pub fn cable(p: &Painter, a: Pos2, b: Pos2, k: f32) {
    let sag = ((b.x - a.x).abs() * 0.25).clamp(4.0, 18.0) * k.max(0.6);
    let pts: Vec<Pos2> = (0..=16).map(|j| {
        let t = j as f32 / 16.0;
        pos2(a.x + (b.x - a.x) * t, a.y + (b.y - a.y) * t + sag * 4.0 * t * (1.0 - t))
    }).collect();
    p.add(Shape::line(pts.clone(), Stroke::new(3.2 * k.max(0.7), hex(0x0B0B0C))));
    p.add(Shape::line(pts, Stroke::new(1.0 * k.max(0.7), rgba(0xFFFFFF18))));
    for (q, d) in [(a, 1.0), (b, -1.0)] {
        let pr = Rect::from_center_size(q + vec2(d * 3.0 * k, 0.0), vec2(7.0 * k, 5.0 * k).max(vec2(4.0, 3.0)));
        vgrad(p, pr, 1.0, hex(0x3A3A3D), hex(0x151516));
    }
}
