//! Pedals: every effect drawn as a stompbox of its own. Each effect family gets an enclosure modelled on the
//! generic boxes real pedals are built in (a narrow mini, the everyday compact, a squat wide box, a big flat box with
//! jacks on top, a sloped wedge, a chamfered or arched compact, and the treadle), and each type its own colour,
//! finish and a small graphic of what it does. A pedal's knobs are its block's main settings and turn the real
//! parameters; its footswitch (or a click on a treadle's toe) engages the block. The designs are the app's own: no
//! maker's logos or trade dress.

use eframe::egui::{pos2, vec2, Align2, Color32, Id, Painter, Pos2, Rect, Response, Sense, Shape, Stroke, Ui, Vec2};
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

/// The enclosure. Real pedals come in a few box families; each effect family gets one.
#[derive(Clone, Copy, PartialEq)]
pub enum Form {
    /// The everyday tall box (1590B / 125B proportions): overdrives, filters, sims, dynamics.
    Compact,
    /// A narrow box (1590A proportions) with jacks on top: boosts, gates, simple octaves.
    Mini,
    /// The compact box with its top corners cut off: distortion and metal.
    Chamfer,
    /// The compact box with an arched top edge: vintage modulation, spring and room reverbs.
    Arch,
    /// A squat wide box (1590BB proportions), room for two rows of knobs: EQs, phasers, flangers.
    Wide,
    /// The wide box with two footswitches: the delay block, one switch for each of its delays.
    Twin,
    /// A big flat box (1590DD proportions) with jacks on top: big fuzz, synths, pitch, big reverbs.
    BigBox,
    /// A sloped wedge with a flat rear strip and a front lip: vintage fuzz and oddities.
    Wedge,
    /// A rocking treadle: wahs, the bend and the foot volume.
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
    let mut l = colours(key, ty);
    if l.form != Form::Treadle {
        l.form = form_for(key, ty);
    }
    l
}

/// Which box an effect is built in.
fn form_for(key: &str, ty: &str) -> Form {
    use Form::*;
    match (key, ty) {
        ("DELAY" | "DELAY2", _) => Twin,
        ("NS1" | "NS2", _) => Mini,
        ("REVERB", "MODULATE") => Arch,
        ("COMP" | "SEND_RETURN" | "CHORUS", _) => Compact,
        (_, "CLEAN BOOST" | "TREBLE BOOST" | "MID BOOST" | "OCTAVE" | "SLOW GEAR" | "S-BEND") => Mini,
        (_, "DISTORTION" | "FAT DS" | "DST+" | "GUV DS" | "RAT" | "METAL ZONE" | "METAL DS" | "LEAD DS" | "LIMITER") => Chamfer,
        (_, "'60S FUZZ" | "OCT FUZZ" | "RING MOD" | "LASER BEAM" | "FEEDBACKER" | "TWIST") => Wedge,
        (_, "MUFF FUZZ" | "WAVE SYNTH" | "HARMONIST" | "PITCH SHIFTER" | "HEAVY OCTAVE" | "DC-30" | "HALL" | "HALL1" | "HALL2" | "PLATE" | "AMBIENCE" | "WARP") => BigBox,
        (_, "CHORUS" | "VIBRATO" | "UNI-V" | "ROTARY" | "TREMOLO" | "PHASER 90E" | "FLANGER 117E" | "SPRING" | "ROOM" | "HUMANIZER") => Arch,
        (_, "GRAPHIC EQ" | "GE-10" | "PARAMETRIC EQ" | "AC.PROCESSOR" | "PHASER" | "FLANGER" | "SLICER") => Wide,
        _ => Compact,
    }
}

/// Colour, finish and graphic per type (and the treadles).
fn colours(key: &str, ty: &str) -> Look {
    use Finish::*;
    use Glyph::*;
    let s = |c: u32, finish: Finish, glyph: Glyph| Look { body: hex(c), finish, glyph, form: Form::Compact };
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
            let form = if key == "PEDAL_FX" { Form::Treadle } else { Form::Compact };
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
    /// A twin pedal's second footswitch (the delay block: DELAY 2's switch).
    pub second: Option<&'static Param>,
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

/// The pedal for chain block `id`, showing effects-map block `key` (one of the block's pages). `big` pedals carry
/// as many knobs as their box holds, pedalboard ones at most three.
pub fn spec(app: &App, id: u8, key: &str, slot: &str, big: bool) -> Pedal {
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
    let cap = if look.form == Form::Treadle { 0 } else { plan(look.form).cap.min(if big { 6 } else { 3 }) };
    let mut knobs: Vec<(usize, &'static Param)> = ranked.into_iter().take(cap).collect();
    knobs.sort_by_key(|(i, _)| *i);
    let second = if look.form == Form::Twin && matches!(key, "DELAY" | "DELAY2") { chain::switch_param(app, "DELAY2") } else { None };
    Pedal { slot: slot.into(), name, look, on, locked, knobs: knobs.into_iter().map(|(_, p)| p).collect(), pos, bands, second }
}

/// Where a pedal sits in its box and how its face is laid out, as fractions of the body's height.
struct Plan {
    knobs: (f32, f32),
    glyph: f32,
    name: f32,
    slot: f32,
    foot: (f32, f32),
    /// The footswitch sits on a darker plate.
    plate: bool,
    /// Most knobs the box holds.
    cap: usize,
    /// Side jacks at this height, else jacks on top.
    jack: Option<f32>,
    name_size: f32,
    glyph_k: f32,
    /// Corner radius.
    rad: f32,
}

fn plan(f: Form) -> Plan {
    let base = Plan {
        knobs: (0.05, 0.43),
        glyph: 0.48,
        name: 0.585,
        slot: 0.665,
        foot: (0.72, 0.965),
        plate: true,
        cap: 4,
        jack: Some(0.22),
        name_size: 13.0,
        glyph_k: 1.0,
        rad: 8.0,
    };
    match f {
        Form::Compact => base,
        Form::Treadle => Plan { jack: Some(0.30), rad: 10.0, ..base },
        Form::Chamfer => Plan { knobs: (0.08, 0.44), jack: Some(0.26), rad: 5.0, ..base },
        Form::Arch => Plan { knobs: (0.12, 0.45), glyph: 0.495, name: 0.595, slot: 0.67, jack: Some(0.32), ..base },
        Form::Mini => Plan { knobs: (0.06, 0.42), glyph: 0.47, name: 0.565, slot: 0.625, foot: (0.69, 0.955), plate: false, cap: 2, jack: None, name_size: 10.0, glyph_k: 0.8, rad: 6.0 },
        Form::Wide | Form::Twin => Plan { knobs: (0.05, 0.45), glyph: 0.515, name: 0.62, slot: 0.69, foot: (0.74, 0.965), cap: 5, jack: Some(0.25), ..base },
        Form::BigBox => Plan { knobs: (0.07, 0.40), glyph: 0.47, name: 0.58, slot: 0.66, foot: (0.72, 0.97), plate: false, cap: 6, jack: None, name_size: 15.0, glyph_k: 1.35, rad: 7.0 },
        Form::Wedge => Plan { knobs: (0.22, 0.49), glyph: 0.545, name: 0.635, slot: 0.70, foot: (0.79, 0.985), plate: false, cap: 3, jack: Some(0.09), name_size: 12.0, ..base },
    }
}

/// The pedal's own footprint in its slot `r` (a 2:3 box), standing on the slot's bottom edge.
pub fn body(f: Form, r: Rect) -> Rect {
    let (fw, fh) = match f {
        Form::Compact | Form::Chamfer | Form::Arch => (0.80, 0.96),
        Form::Mini => (0.58, 0.84),
        Form::Wide | Form::Twin => (1.0, 0.82),
        Form::BigBox => (1.0, 1.0),
        Form::Wedge => (0.88, 0.92),
        Form::Treadle => (0.78, 1.0),
    };
    Rect::from_min_size(pos2(r.center().x - r.width() * fw / 2.0, r.bottom() - r.height() * fh), vec2(r.width() * fw, r.height() * fh))
}

/// The input and output jacks of a pedal in slot `r`: where a cable plugs in, and the way it leaves.
pub fn ports(look: &Look, r: Rect) -> [(Pos2, Vec2); 2] {
    let b = body(look.form, r);
    let k = r.width() / 130.0;
    match plan(look.form).jack {
        Some(f) => {
            let y = b.top() + b.height() * f;
            [(pos2(b.left() - 6.0 * k, y), vec2(-1.0, 0.0)), (pos2(b.right() + 6.0 * k, y), vec2(1.0, 0.0))]
        }
        None => {
            let y = b.top() - 6.0 * k;
            [(pos2(b.left() + b.width() * 0.28, y), vec2(0.0, -1.0)), (pos2(b.right() - b.width() * 0.28, y), vec2(0.0, -1.0))]
        }
    }
}

/// The amp's cabinet in slot `r`: a combo a little wider than tall, standing on the slot's bottom edge, with room
/// above for its handle.
pub fn amp_body(r: Rect) -> Rect {
    let k = r.height() / 195.0;
    let h = (r.width() / 1.15).min(r.height() - 12.0 * k);
    let w = (h * 1.15).min(r.width());
    Rect::from_min_size(pos2(r.center().x - w / 2.0, r.bottom() - h), vec2(w, h))
}

/// The amp's jacks: on its top panel, as on the real combo.
pub fn amp_ports(r: Rect) -> [(Pos2, Vec2); 2] {
    let b = amp_body(r);
    [(pos2(b.left() + b.width() * 0.12, b.top()), vec2(0.0, -1.0)), (pos2(b.right() - b.width() * 0.12, b.top()), vec2(0.0, -1.0))]
}

/// What came of a pedal this frame: a click on it (select) or on its footswitch (engage or bypass).
pub struct Out {
    pub clicked: bool,
    pub stomped: bool,
}

/// Draws `pd` in slot `r` (a 2:3 box). `live` makes its knobs turn (else a click anywhere on it is a body click).
pub fn draw(app: &mut App, ui: &Ui, r: Rect, salt: u8, pd: &Pedal, selected: bool, live: bool) -> Out {
    let b = body(pd.look.form, r);
    let body_resp = ui.interact(b, Id::unique(("pedal", salt)), Sense::click());
    let k = r.width() / 130.0;
    let pl = plan(pd.look.form);
    let o = outline(pd.look.form, b, k, pl.rad * k);
    let mut p = ui.painter().clone();
    if pd.locked {
        p.multiply_opacity(0.42);
    }
    if selected {
        glow(&p, b.expand(3.0 * k), 10.0 * k, 14.0 * k, alpha(led(), 0.28));
    }
    shadow(&p, b, pl.rad * k, 6.0 * k, 12.0 * k, rgba(0x000000C8));
    let (stomped, heel) = match pd.look.form {
        Form::Treadle => treadle(app, ui, &p, b, k, salt, pd, live),
        _ => (stomp(app, ui, &p, b, &o, &pl, k, salt, pd, live), false),
    };
    if selected {
        p.add(Shape::closed_line(grow(&o.pts, 2.5 * k), Stroke::new(1.5, led())));
    }
    if pd.locked {
        let tr = Rect::from_center_size(b.center(), vec2(b.width() + 6.0 * k, 16.0 * k.max(0.8)));
        let full = ui.painter();
        full.rect_filled(tr, 2.0, rgba(0x15151590));
        dashed_rect(full, tr, rgba(0xE8E4DC70));
        text_max(full, tr.center(), Align2::CENTER_CENTER, "FIXED", F::Silk2, 8.5 * k.max(0.85), SILK2, tr.width() - 6.0);
    }
    Out { clicked: body_resp.clicked() || heel, stomped }
}

// --- enclosure geometry -------------------------------------------------------------------------------------------

/// A body's outline (convex, clockwise from the top-left) and its top edge, for the highlight.
struct Outline {
    pts: Vec<Pos2>,
    top: Vec<Pos2>,
}

/// Arc points around `c` from `a0` to `a1` degrees (0 = right, 90 = down).
fn arc(c: Pos2, r: f32, a0: f32, a1: f32, out: &mut Vec<Pos2>) {
    for j in 0..=6 {
        let a = (a0 + (a1 - a0) * j as f32 / 6.0).to_radians();
        out.push(c + vec2(a.cos(), a.sin()) * r);
    }
}

fn outline(f: Form, b: Rect, k: f32, rad: f32) -> Outline {
    let (l, t, rt, bt) = (b.left(), b.top(), b.right(), b.bottom());
    let mut pts = vec![];
    let bottom = |pts: &mut Vec<Pos2>| {
        arc(pos2(rt - rad, bt - rad), rad, 0.0, 90.0, pts);
        arc(pos2(l + rad, bt - rad), rad, 90.0, 180.0, pts);
    };
    match f {
        Form::Chamfer => {
            let c = 13.0 * k;
            let top = vec![pos2(l, t + c), pos2(l + c, t), pos2(rt - c, t), pos2(rt, t + c)];
            pts.extend_from_slice(&top[1..]);
            bottom(&mut pts);
            pts.push(top[0]);
            Outline { pts, top }
        }
        Form::Arch => {
            let s = (b.width() * 0.14).min(18.0 * k);
            let half = b.width() / 2.0;
            let big_r = (half * half + s * s) / (2.0 * s);
            let c = pos2(b.center().x, t + big_r);
            let top: Vec<Pos2> = (0..=20)
                .map(|j| {
                    let x = l + b.width() * j as f32 / 20.0;
                    pos2(x, c.y - (big_r * big_r - (x - c.x).powi(2)).max(0.0).sqrt())
                })
                .collect();
            pts.extend(top.iter().copied());
            bottom(&mut pts);
            Outline { pts, top }
        }
        Form::Wedge => {
            // the rear edge is further from the eye: a little narrower
            let i = b.width() * 0.06;
            let top = vec![pos2(l + i, t), pos2(rt - i, t)];
            pts.extend(top.iter().copied());
            bottom(&mut pts);
            Outline { pts, top }
        }
        _ => Outline { pts: rrect_points(b, rad), top: vec![pos2(l + rad, t), pos2(rt - rad, t)] },
    }
}

fn cross(a: Pos2, b: Pos2, q: Pos2) -> f32 {
    (b.x - a.x) * (q.y - a.y) - (b.y - a.y) * (q.x - a.x)
}

fn orient(pts: &[Pos2]) -> f32 {
    let n = pts.len();
    (0..n).map(|i| pts[i].x * pts[(i + 1) % n].y - pts[(i + 1) % n].x * pts[i].y).sum::<f32>().signum()
}

fn inside(pts: &[Pos2], q: Pos2) -> bool {
    let (s, n) = (orient(pts), pts.len());
    (0..n).all(|i| cross(pts[i], pts[(i + 1) % n], q) * s >= 0.0)
}

/// `subject` cut to the convex polygon `clip` (Sutherland–Hodgman).
fn clip_poly(subject: &[Pos2], clip: &[Pos2]) -> Vec<Pos2> {
    let s = orient(clip);
    let mut out = subject.to_vec();
    for i in 0..clip.len() {
        let (a, b) = (clip[i], clip[(i + 1) % clip.len()]);
        if (b - a).length_sq() < 1e-6 {
            continue;
        }
        let input = std::mem::take(&mut out);
        if input.is_empty() {
            break;
        }
        let ins = |q: Pos2| cross(a, b, q) * s >= 0.0;
        for j in 0..input.len() {
            let (p0, p1) = (input[(j + input.len() - 1) % input.len()], input[j]);
            let hit = || {
                let (d0, d1) = (cross(a, b, p0), cross(a, b, p1));
                p0 + (p1 - p0) * (d0 / (d0 - d1))
            };
            match (ins(p0), ins(p1)) {
                (true, true) => out.push(p1),
                (true, false) => out.push(hit()),
                (false, true) => {
                    out.push(hit());
                    out.push(p1);
                }
                _ => {}
            }
        }
    }
    out
}

/// Where a horizontal line at `y` enters and leaves the outline.
fn span(pts: &[Pos2], y: f32) -> Option<(f32, f32)> {
    let n = pts.len();
    let xs: Vec<f32> = (0..n)
        .filter_map(|i| {
            let (a, b) = (pts[i], pts[(i + 1) % n]);
            ((a.y <= y && b.y > y) || (b.y <= y && a.y > y)).then(|| a.x + (b.x - a.x) * (y - a.y) / (b.y - a.y))
        })
        .collect();
    (xs.len() >= 2).then(|| (xs.iter().copied().fold(f32::MAX, f32::min), xs.iter().copied().fold(f32::MIN, f32::max)))
}

fn rect_pts(r: Rect) -> Vec<Pos2> {
    vec![r.left_top(), r.right_top(), r.right_bottom(), r.left_bottom()]
}

fn fill(p: &Painter, pts: &[Pos2], c: Color32) {
    if pts.len() >= 3 {
        p.add(Shape::convex_polygon(pts.to_vec(), c, Stroke::NONE));
    }
}

/// The outline pushed out by `d` (for the selection ring).
fn grow(pts: &[Pos2], d: f32) -> Vec<Pos2> {
    let c = pts.iter().fold(vec2(0.0, 0.0), |a, q| a + q.to_vec2()) / pts.len().max(1) as f32;
    pts.iter().map(|q| *q + (q.to_vec2() - c).normalized() * d).collect()
}

fn enclosure(p: &Painter, o: &Outline, b: Rect, k: f32, look: &Look, seed: u32) {
    let c = look.body;
    let (top, bot) = (mix(c, Color32::WHITE, 0.10), mix(c, BLACK, 0.22));
    grad_poly(p, &o.pts, |q| lerp_c(top, bot, ((q.y - b.top()) / b.height()).clamp(0.0, 1.0)));
    let mut rng = Rng(seed | 1);
    let i = ink(c);
    match look.finish {
        Finish::Gloss => {
            let tri = [b.left_top(), pos2(b.left() + b.width() * 0.55, b.top()), pos2(b.left(), b.top() + b.height() * 0.42)];
            fill(p, &clip_poly(&tri, &o.pts), rgba(0xFFFFFF14));
        }
        Finish::Sparkle => {
            let n = (b.area() / (70.0 * k.max(0.5))) as usize;
            for j in 0..n {
                let q = pos2(b.left() + rng.next() * b.width(), b.top() + rng.next() * b.height());
                let rr = (0.45 + rng.next() * 0.6) * k.max(0.7);
                if inside(&o.pts, q) {
                    p.circle_filled(q, rr, if j % 3 == 0 { rgba(0x00000030) } else { rgba(0xFFFFFF48) });
                }
            }
        }
        Finish::Brushed => {
            let mut y = b.top() + 1.0;
            let mut j = 0;
            while y < b.bottom() {
                if let Some((x0, x1)) = span(&o.pts, y) {
                    let c = if j % 2 == 0 { rgba(0xFFFFFF0A) } else { rgba(0x00000012) };
                    p.hline(x0 + 0.5..=x1 - 0.5, y, Stroke::new(0.8, c));
                }
                y += 1.6 + rng.next() * 1.4;
                j += 1;
            }
        }
        Finish::Hammer => {
            for j in 0..((b.area() / (260.0 * k.max(0.5))) as usize) {
                let q = pos2(b.left() + rng.next() * b.width(), b.top() + rng.next() * b.height());
                let rr = (3.0 + rng.next() * 6.0) * k;
                if [vec2(rr, 0.0), vec2(-rr, 0.0), vec2(0.0, rr), vec2(0.0, -rr)].iter().all(|d| inside(&o.pts, q + *d)) {
                    p.circle_filled(q, rr, if j % 2 == 0 { rgba(0xFFFFFF0E) } else { rgba(0x00000018) });
                }
            }
        }
        Finish::Stripe => {
            let band = clip_poly(&rect_pts(Rect::from_center_size(b.center(), vec2(24.0 * k, b.height() + 2.0))), &o.pts);
            fill(p, &band, alpha(i, 0.20));
            if band.len() >= 3 {
                p.add(Shape::closed_line(band, Stroke::new(1.0 * k, alpha(i, 0.35))));
            }
        }
    }
    if look.form == Form::Wedge {
        // a flat rear strip, the sloped face, a flat front lip
        let (ry, fy) = (b.top() + b.height() * 0.17, b.top() + b.height() * 0.78);
        let strip = |y0: f32, y1: f32, a: u32| fill(p, &clip_poly(&rect_pts(Rect::from_min_max(pos2(b.left() - 1.0, y0), pos2(b.right() + 1.0, y1))), &o.pts), rgba(a));
        strip(b.top() - 1.0, ry, 0x00000050);
        strip(fy, b.bottom() + 1.0, 0x00000034);
        for y in [ry, fy] {
            if let Some((x0, x1)) = span(&o.pts, y) {
                p.hline(x0..=x1, y, Stroke::new(1.0, rgba(0x00000090)));
                p.hline(x0 + 1.0..=x1 - 1.0, y + 1.0, Stroke::new(0.8, rgba(0xFFFFFF22)));
            }
        }
    }
    p.add(Shape::closed_line(o.pts.clone(), Stroke::new(1.0, rgba(0x000000A0))));
    let hi: Vec<Pos2> = o.top.iter().map(|q| *q + vec2(0.0, 0.8)).collect();
    p.add(Shape::line(hi, Stroke::new(1.0, rgba(0xFFFFFF40))));
}

fn screw(p: &Painter, c: Pos2, k: f32) {
    let rr = 2.3 * k.max(0.6);
    p.circle_filled(c, rr, hex(0x9C9993));
    p.circle_stroke(c, rr, Stroke::new(0.6, rgba(0x00000090)));
    p.line_segment([c - vec2(rr * 0.7, 0.0), c + vec2(rr * 0.7, 0.0)], Stroke::new(0.7, rgba(0x00000099)));
}

/// Jacks either side at `side` (a fraction of the height), or on the top edge.
fn jacks(p: &Painter, b: Rect, k: f32, side: Option<f32>) {
    let rects = match side {
        Some(f) => {
            let y = b.top() + b.height() * f;
            [Rect::from_center_size(pos2(b.left() - 3.0 * k, y), vec2(6.0 * k, 12.0 * k)), Rect::from_center_size(pos2(b.right() + 3.0 * k, y), vec2(6.0 * k, 12.0 * k))]
        }
        None => {
            let y = b.top() - 3.0 * k;
            [Rect::from_center_size(pos2(b.left() + b.width() * 0.28, y), vec2(12.0 * k, 6.0 * k)), Rect::from_center_size(pos2(b.right() - b.width() * 0.28, y), vec2(12.0 * k, 6.0 * k))]
        }
    };
    for jr in rects {
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

/// A stompbox in body `b`. Returns whether its (first) footswitch was stomped; a twin's second switch is handled here.
#[allow(clippy::too_many_arguments)]
fn stomp(app: &mut App, ui: &Ui, p: &Painter, b: Rect, o: &Outline, pl: &Plan, k: f32, salt: u8, pd: &Pedal, live: bool) -> bool {
    let look = &pd.look;
    let i = ink(look.body);
    let y = |f: f32| b.top() + b.height() * f;
    jacks(p, b, k, pl.jack);
    enclosure(p, o, b, k, look, hash(&pd.name));
    let inset = 7.0 * k;
    let screws: Vec<Pos2> = match look.form {
        Form::Compact => vec![pos2(b.left() + inset, b.top() + inset), pos2(b.right() - inset, b.top() + inset)],
        Form::Wide | Form::Twin | Form::BigBox => vec![
            pos2(b.left() + inset, b.top() + inset),
            pos2(b.right() - inset, b.top() + inset),
            pos2(b.left() + inset, b.bottom() - inset),
            pos2(b.right() - inset, b.bottom() - inset),
        ],
        Form::Wedge => vec![pos2(b.left() + b.width() * 0.22, y(0.085)), pos2(b.right() - b.width() * 0.22, y(0.085))],
        _ => vec![],
    };
    for c in screws {
        screw(p, c, k);
    }

    // knobs, or a graphic EQ's sliders
    let small = k < 0.8;
    let zone = Rect::from_min_max(pos2(b.left() + 8.0 * k, y(pl.knobs.0)), pos2(b.right() - 8.0 * k, y(pl.knobs.1)));
    if !pd.bands.is_empty() {
        let zone = zone.shrink2(vec2(4.0 * k, 4.0 * k));
        let n = pd.bands.len();
        for (j, q) in pd.bands.iter().enumerate() {
            let x = zone.left() + zone.width() * (j as f32 + 0.5) / n as f32;
            p.vline(x, zone.top()..=zone.bottom(), Stroke::new(1.6 * k, rgba(0x00000080)));
            let (lo, hi) = q.raw_range();
            let f = app.raw(q).map_or(0.5, |v| (v.saturating_sub(lo)) as f32 / (hi - lo).max(1) as f32);
            let cy = zone.bottom() - f * zone.height();
            let cap = Rect::from_center_size(pos2(x, cy), vec2(6.0 * k, 3.5 * k));
            vgrad(p, cap, 1.0, hex(0x3A3A3D), hex(0x111112));
            hline(p, cap.left(), cap.right(), cap.center().y - 0.5, alpha(Color32::WHITE, 0.7));
        }
    } else if !pd.knobs.is_empty() {
        let n = pd.knobs.len();
        let rows: Vec<usize> = match (look.form, n) {
            (Form::Mini, 2) => vec![1, 1],
            (_, 4) => vec![2, 2],
            (_, 5) => vec![3, 2],
            (_, 6) => vec![3, 3],
            _ => vec![n],
        };
        let label_h = if small { 0.0 } else { 10.0 * k };
        let slot_h = zone.height() / rows.len() as f32;
        let max_cols = rows.iter().copied().max().unwrap_or(1) as f32;
        let rad = (zone.width() / max_cols * 0.34).min((slot_h - label_h) * 0.42).min(16.0 * k);
        let mut j = 0;
        for (ri, &cols) in rows.iter().enumerate() {
            for c in 0..cols {
                let q = pd.knobs[j];
                let x = zone.left() + zone.width() * (c as f32 + 0.5) / cols as f32;
                let mut cy = zone.top() + slot_h * (ri as f32 + 0.5) - label_h / 2.0;
                if look.form == Form::Wedge && cols == 3 && c == 1 {
                    cy -= 4.0 * k;
                }
                pedal_knob(app, ui, p, pos2(x, cy), rad, q, Id::unique(("pedal-knob", salt, j)), live, i);
                if !small {
                    // long labels shrink to fit their column before they are cut
                    let label = face_label(&q.label);
                    let lw = zone.width() / cols as f32 - 2.0 * k;
                    let size = 6.6 * k * (lw / text_w(p, &label, F::Silk2, 6.6 * k)).clamp(0.78, 1.0);
                    text_max(p, pos2(x, cy + rad + 6.5 * k), Align2::CENTER_CENTER, &label, F::Silk2, size, alpha(i, 0.9), lw);
                }
                j += 1;
            }
        }
    }

    // graphic, LED, name
    let gy = y(pl.glyph);
    let gr = Rect::from_center_size(pos2(b.center().x, gy), vec2(34.0 * k, 15.0 * k) * pl.glyph_k);
    glyph(p, gr, look.glyph, i, k * pl.glyph_k);
    if pd.second.is_none() {
        led_dot(p, pos2(b.right() - 12.0 * k, gy), (6.0 * k).max(4.0), pd.on && !pd.locked);
    }
    name(p, pos2(b.center().x, y(pl.name)), &pd.name, b.width() - 14.0 * k, pl.name_size * k, i);
    if !small {
        text_max(p, pos2(b.center().x, y(pl.slot)), Align2::CENTER_CENTER, &pd.slot, F::Silk2, 6.6 * k, alpha(i, 0.7), b.width() - 16.0 * k);
    }

    // footswitch(es)
    let fz = Rect::from_min_max(pos2(b.left() + 7.0 * k, y(pl.foot.0)), pos2(b.right() - 7.0 * k, y(pl.foot.1)));
    if pl.plate {
        let prad = if look.form == Form::Chamfer { 3.0 * k } else { 6.0 * k };
        vgrad(p, fz, prad, mix(look.body, BLACK, 0.42), mix(look.body, BLACK, 0.58));
        hline(p, fz.left() + prad, fz.right() - prad, fz.top(), rgba(0x00000080));
        hline(p, fz.left() + prad, fz.right() - prad, fz.bottom() - 1.0, rgba(0xFFFFFF18));
    }
    let hexr = (15.0 * k).min(fz.height() * 0.40);
    let switches: Vec<(f32, Option<&'static Param>)> = match pd.second {
        Some(q) => vec![(0.3, None), (0.7, Some(q))],
        None => vec![(0.5, None)],
    };
    let mut stomped = false;
    for (n, (fx, sw)) in switches.into_iter().enumerate() {
        let c = pos2(fz.left() + fz.width() * fx, fz.center().y);
        let hit = vec2(hexr * 2.6, hexr * 2.6).max(vec2(24.0, 24.0));
        let resp = ui.interact(Rect::from_center_size(c, hit), Id::unique(("pedal-stomp", salt, n)), Sense::click());
        footswitch(p, c, hexr, resp.is_pointer_button_down_on());
        let on = match sw {
            Some(q) => app.raw(q) == Some(1),
            None => pd.on && !pd.locked,
        };
        if pd.second.is_some() {
            // each switch's LED on its left: delay 1, then delay 2
            led_dot(p, c - vec2(hexr + 7.0 * k, 0.0), (5.0 * k).max(3.5), on);
        }
        let what = if pd.second.is_some() { format!("Delay {} · ", n + 1) } else { String::new() };
        let resp = resp.on_hover_text(format!("{what}{}", if on { "Stomp to bypass" } else { "Stomp to engage" }));
        if resp.clicked() {
            match sw {
                None => stomped = !pd.locked,
                Some(q) => {
                    if app.online() && !q.is_locked() {
                        app.set(q, (!on) as u32);
                    }
                }
            }
        }
    }
    stomped
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

/// A knob's name as printed on a pedal: short, the way real pedals print them.
fn face_label(label: &str) -> String {
    let up = label.to_uppercase();
    let short = match up.as_str() {
        "EFFECT LEVEL" => "E.LEVEL",
        "DIRECT MIX" => "D.MIX",
        "REVERB TIME" | "DELAY TIME" => "TIME",
        "DENSITY" => "DENS",
        "SPRING SENS" => "SPRING",
        "FEEDBACK" => "F.BACK",
        "THRESHOLD" | "THRESH" => "THRESH",
        "FREQUENCY" => "FREQ",
        "RESONANCE" => "RESO",
        _ => up.as_str(),
    };
    short.replace("PRE DELAY", "PRE").replace("LOW ", "L.").replace("HIGH ", "H.").replace("PEDAL ", "P.")
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
    jacks(p, r, k, plan(Form::Treadle).jack);
    let o = outline(Form::Treadle, r, k, 10.0 * k);
    enclosure(p, &o, r, k, look, hash(&pd.name));
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

/// The amp, on the pedalboard: the KATANA combo seen from the front. Black tolex, a carrying handle, black corner
/// caps, a dotted black grille between two silver pipings, four grille screws and a plain nameplate (no maker's
/// logo). Dimmed when the preamp is off.
pub fn amp_head(app: &App, ui: &Ui, r: Rect, salt: u8, selected: bool) -> Response {
    let b = amp_body(r);
    let k = r.height() / 195.0;
    let on = chain::block_state(app, chain::AMP).0;
    let model = chain::type_text(app, chain::AMP);
    let hit = b.union(Rect::from_min_max(pos2(b.left(), b.top() - 10.0 * k), b.right_top()));
    let resp = ui.interact(hit, Id::unique(("amp-head", salt)), Sense::click());
    let mut p = ui.painter().clone();
    if !on {
        p.multiply_opacity(0.55);
    }
    if selected {
        glow(&p, b.expand(3.0 * k), 6.0 * k, 14.0 * k, alpha(led(), 0.28));
    }
    // handle: a black strap between two mounts
    let hw = b.width() * 0.34;
    let hr = Rect::from_min_max(pos2(b.center().x - hw / 2.0, b.top() - 9.0 * k), pos2(b.center().x + hw / 2.0, b.top() + 4.0 * k));
    p.rect_stroke(hr, 4.5 * k, Stroke::new(3.2 * k.max(0.7), hex(0x2C2C30)), eframe::egui::StrokeKind::Middle);
    hline(&p, hr.left() + 4.0 * k, hr.right() - 4.0 * k, hr.top() - 1.0 * k, rgba(0xFFFFFF30));
    // cabinet
    shadow(&p, b, 4.0 * k, 6.0 * k, 12.0 * k, rgba(0x000000C8));
    vgrad(&p, b, 4.0 * k, hex(0x242427), hex(0x131315));
    for x in [hr.left() + 2.0 * k, hr.right() - 2.0 * k] {
        let m = Rect::from_center_size(pos2(x, b.top() + 1.0 * k), vec2(10.0 * k, 4.0 * k));
        vgrad(&p, m, 1.5 * k, hex(0x2A2A2D), hex(0x0C0C0D));
    }
    // grille: black cloth with a fine dot weave
    let g = Rect::from_min_max(pos2(b.left() + b.width() * 0.035, b.top() + b.height() * 0.04), pos2(b.right() - b.width() * 0.035, b.bottom() - b.height() * 0.04));
    p.rect_filled(g, 1.5 * k, hex(0x0D0D0E));
    let step = (2.6 * k).max(2.2);
    let dot = (0.9 * k).max(0.7);
    let mut m = eframe::egui::Mesh::default();
    let mut row = 0;
    let mut y = g.top() + step / 2.0;
    while y < g.bottom() {
        let mut x = g.left() + step / 2.0 + if row % 2 == 1 { step / 2.0 } else { 0.0 };
        while x < g.right() {
            m.add_colored_rect(Rect::from_center_size(pos2(x, y), vec2(dot, dot)), rgba(0x5E5E6266));
            x += step;
        }
        y += step;
        row += 1;
    }
    p.add(Shape::mesh(m));
    // silver piping along the top and bottom of the grille
    for py in [g.top() + g.height() * 0.03, g.bottom() - g.height() * 0.03] {
        let pr = Rect::from_center_size(pos2(g.center().x, py), vec2(g.width(), (1.8 * k).max(1.2)));
        vgrad(&p, pr, 0.5, hex(0xEDEDED), hex(0x8E8E8E));
    }
    // grille screws
    for (fx, fy) in [(0.04, 0.09), (0.96, 0.09), (0.04, 0.91), (0.96, 0.91)] {
        let c = pos2(g.left() + g.width() * fx, g.top() + g.height() * fy);
        let rr = (2.4 * k).max(1.4);
        radial_disc(&p, c, rr, c + vec2(-rr * 0.3, -rr * 0.4), rr * 1.6, &[(0.0, hex(0xFFFFFF)), (0.5, hex(0xB4B4B4)), (1.0, hex(0x5A5A5A))]);
        p.line_segment([c - vec2(rr * 0.6, 0.0), c + vec2(rr * 0.6, 0.0)], Stroke::new(0.6, rgba(0x00000099)));
        p.line_segment([c - vec2(0.0, rr * 0.6), c + vec2(0.0, rr * 0.6)], Stroke::new(0.6, rgba(0x00000099)));
    }
    // corner caps
    let cc = (b.width() * 0.07).max(5.0);
    for (fx, fy) in [(0.0f32, 0.0f32), (1.0, 0.0), (0.0, 1.0), (1.0, 1.0)] {
        let c = pos2(b.left() + b.width() * fx, b.top() + b.height() * fy);
        let cr = Rect::from_center_size(c + vec2((0.5 - fx) * cc * 0.6, (0.5 - fy) * cc * 0.6), vec2(cc, cc));
        vgrad(&p, cr, 2.5 * k, hex(0x1B1B1D), hex(0x070708));
        p.rect_stroke(cr, 2.5 * k, Stroke::new(0.7, rgba(0xFFFFFF1E)), eframe::egui::StrokeKind::Inside);
    }
    // a plain nameplate where the badge sits
    let label = "KATANA-50";
    let size = (8.5 * k).max(6.0);
    let tw = text_w(&p, label, F::Title, size);
    let plate = Rect::from_center_size(pos2(g.center().x, g.top() + g.height() * 0.2), vec2(tw + 10.0 * k, size + 6.0 * k));
    p.rect_filled(plate, 1.5 * k, hex(0x08080A));
    p.rect_stroke(plate, 1.5 * k, Stroke::new(0.8, hex(0xB8B8B8)), eframe::egui::StrokeKind::Inside);
    text(&p, plate.center(), Align2::CENTER_CENTER, label, F::Title, size, hex(0xEDEDED));
    p.rect_stroke(b, 4.0 * k, Stroke::new(1.0, rgba(0x000000C0)), eframe::egui::StrokeKind::Outside);
    if selected {
        p.rect_stroke(b.expand(2.5 * k), 6.0 * k, Stroke::new(1.5, led()), eframe::egui::StrokeKind::Middle);
    }
    let state = if on { "" } else { " (off)" };
    resp.on_hover_text(format!("The amp · {model}{state} · its settings live on the Editor"))
}

/// A patch cable from jack `a` to jack `b`, each given as (where it plugs in, the way it leaves), sagging a little.
pub fn cable(p: &Painter, a: (Pos2, Vec2), b: (Pos2, Vec2), k: f32) {
    let km = k.max(0.6);
    let d = (b.0 - a.0).length();
    let lead = |dir: Vec2| if dir.y < 0.0 { 10.0 * km } else { (d * 0.45).clamp(8.0 * km, 30.0 * km) };
    let sag = |dir: Vec2| if dir.y < 0.0 { Vec2::ZERO } else { vec2(0.0, (d * 0.18).clamp(3.0, 14.0) * km) };
    // plugs stick out 7 from the jack
    let (a0, b0) = (a.0 + a.1 * 7.0 * k, b.0 + b.1 * 7.0 * k);
    let (c1, c2) = (a0 + a.1 * lead(a.1) + sag(a.1), b0 + b.1 * lead(b.1) + sag(b.1));
    let pts: Vec<Pos2> = (0..=24)
        .map(|j| {
            let t = j as f32 / 24.0;
            let u = 1.0 - t;
            (a0.to_vec2() * u * u * u + c1.to_vec2() * 3.0 * u * u * t + c2.to_vec2() * 3.0 * u * t * t + b0.to_vec2() * t * t * t).to_pos2()
        })
        .collect();
    let shade: Vec<Pos2> = pts.iter().map(|q| *q + vec2(0.0, 2.0 * km)).collect();
    p.add(Shape::line(shade, Stroke::new(3.6 * km, rgba(0x00000070))));
    p.add(Shape::line(pts.clone(), Stroke::new(3.4 * km, hex(0x323236))));
    let hi: Vec<Pos2> = pts.iter().map(|q| *q - vec2(0.0, 0.8 * km)).collect();
    p.add(Shape::line(hi, Stroke::new(0.9 * km, rgba(0xFFFFFF2C))));
    for (q, dir) in [a, b] {
        // a metal sleeve at the jack, a black boot behind it
        let along = |l: f32, w: f32| if dir.x != 0.0 { vec2(l, w) } else { vec2(w, l) };
        let sleeve = Rect::from_center_size(q + dir * 1.5 * k, along(3.5 * k, 5.0 * k).max(vec2(2.5, 2.5)));
        let boot = Rect::from_center_size(q + dir * 5.0 * k, along(5.0 * k, 6.0 * k).max(vec2(3.0, 3.0)));
        vgrad(p, boot, 1.5, hex(0x2C2C2F), hex(0x0E0E0F));
        vgrad(p, sleeve, 0.5, hex(0xD8D5CF), hex(0x7A7771));
    }
}
