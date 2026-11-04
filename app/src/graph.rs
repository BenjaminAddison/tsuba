//! The frequency response on VFD glass: the EQ block and the patch's MASTER EQ (katana::response), log 20 Hz–20 kHz,
//! ±16 dB. Drag a band's handle for frequency and gain; scroll over the glass to step the selected band's Q.

use eframe::egui::{pos2, vec2, Align2, Id, Pos2, Rect, Sense, Shape, Stroke, Ui};
use katana::catalog::Param;
use katana::response::{self, Eq, Kind};

use crate::theme::*;
use crate::widgets::wheel;
use crate::App;

#[derive(Clone, Copy, PartialEq, Default)]
pub enum Src {
    #[default]
    Eq,
    Master,
    Both,
}

const DB: f64 = 16.0;

pub fn fmt_hz(f: f64) -> String {
    if f >= 1000.0 {
        format!("{}kHz", (f / 100.0).round() / 10.0)
    } else {
        format!("{}Hz", f.round())
    }
}

/// The bands the handles and band keys address for `src`: the EQ's unless MASTER is shown alone.
pub fn active<'a>(app: &'a App, src: Src) -> Option<Eq<'a>> {
    match src {
        Src::Master => response::master_eq(app.cat, &app.mem),
        _ => response::eq(app.cat, &app.mem),
    }
}

/// Draw the graph in `r` (glass included). `band` is the selected band of `active(src)`.
pub fn graph(app: &mut App, ui: &Ui, r: Rect, src: Src, band: &mut usize) {
    let g = glass(ui, r);
    let p = ui.painter();
    let clip = p.with_clip_rect(g.intersect(p.clip_rect()));
    let fx = |f: f64| g.left() + ((f / 20.0).log10() / 3.0) as f32 * g.width();
    let scale = (g.height() / 2.0 - 8.0) / DB as f32;
    let fy = |db: f64| g.center().y - db as f32 * scale;
    let grid = alpha(led(), 0.13);
    for f in [50.0, 100.0, 200.0, 500.0, 1000.0, 2000.0, 5000.0, 10000.0] {
        let x = fx(f).round();
        clip.extend(Shape::dashed_line(&[pos2(x, g.top()), pos2(x, g.bottom())], Stroke::new(1.0, grid), 2.0, 3.0));
    }
    for d in [-12.0, -8.0, -4.0, 4.0, 8.0, 12.0] {
        let y = fy(d).round();
        clip.extend(Shape::dashed_line(&[pos2(g.left(), y), pos2(g.right(), y)], Stroke::new(1.0, grid), 2.0, 3.0));
    }
    hline(&clip, g.left(), g.right(), fy(0.0).round(), alpha(led(), 0.3));
    let label = mix(lit(), BLACK, 0.4);
    for (s, d) in [("+12", 12.0), ("0", 0.0), ("−12", -12.0)] {
        text(&clip, pos2(g.left() + 8.0, fy(d) - 2.0), Align2::LEFT_BOTTOM, s, F::MonoB, 8.5, label);
    }
    for (f, t) in [(100.0, "100"), (1000.0, "1k"), (10000.0, "10k")] {
        text(&clip, pos2(fx(f), g.bottom() - 6.0), Align2::CENTER_BOTTOM, t, F::MonoB, 8.5, label);
    }

    let eq = response::eq(app.cat, &app.mem);
    let master = response::master_eq(app.cat, &app.mem);
    let (Some(eq), Some(master)) = (eq, master) else {
        vfd(&clip, g.center(), Align2::CENTER_CENTER, if app.online() { "READING THE AMP" } else { "NO AMP" }, F::MonoB, 11.0);
        return;
    };
    let freqs: Vec<f64> = (0..=200).map(|i| 20.0 * 1000f64.powf(i as f64 / 200.0)).collect();
    let curve = |db: &dyn Fn(f64) -> f64| freqs.iter().map(|&f| pos2(fx(f), fy(db(f).clamp(-30.0, 30.0)))).collect::<Vec<Pos2>>();
    let act = if src == Src::Master { &master } else { &eq };
    *band = (*band).min(act.bands.len() - 1);
    for (i, b) in act.bands.iter().enumerate() {
        let c = if i == *band { alpha(led(), 0.55) } else { alpha(led(), 0.2) };
        clip.line(curve(&|f| b.db(f)), Stroke::new(1.0, c));
    }
    let combined: Box<dyn Fn(f64) -> f64> = match src {
        Src::Eq => Box::new(|f| eq.db(f)),
        Src::Master => Box::new(|f| master.db(f)),
        Src::Both => Box::new(|f| eq.db(f) + master.db(f)),
    };
    if src == Src::Both {
        clip.extend(Shape::dashed_line(&curve(&|f| master.db(f)), Stroke::new(1.0, alpha(led(), 0.45)), 4.0, 3.0));
    }
    let pts = curve(&*combined);
    let on = src == Src::Master || eq.on;
    clip.line(pts.clone(), Stroke::new(6.0, alpha(led(), if on { 0.16 } else { 0.05 })));
    clip.line(pts, Stroke::new(2.0, if on { lit() } else { mix(lit(), BLACK, 0.5) }));

    // handles
    let bands = act.bands.clone();
    for (i, b) in bands.iter().enumerate() {
        let cut = matches!(b.kind, Kind::LowCut | Kind::HighCut);
        let hx = match (b.freq, b.kind) {
            (Some(f), _) => fx(f),
            (None, Kind::LowCut) => g.left() + 8.0,
            (None, _) => g.right() - 8.0,
        };
        let hy = if cut { fy(if b.freq.is_some() { -3.0 } else { 0.0 }) } else { fy(b.gain_db) };
        let c = pos2(hx, hy.clamp(g.top() + 7.0, g.bottom() - 7.0));
        let resp = ui.interact(Rect::from_center_size(c, vec2(28.0, 28.0)), Id::unique(("handle", src as u8, i)), Sense::click_and_drag());
        if resp.clicked() || resp.drag_started() {
            *band = i;
        }
        if let (true, Some(pt)) = (resp.dragged(), resp.interact_pointer_pos()) {
            if let Some(fp) = b.freq_param {
                let f = 20.0 * 10f64.powf(3.0 * ((pt.x - g.left()) / g.width()) as f64);
                let flat = (b.kind == Kind::LowCut && pt.x <= g.left() + 4.0) || (b.kind == Kind::HighCut && pt.x >= g.right() - 4.0);
                let best = fp.options.iter().filter(|o| response::parse_hz(&o.1).is_none() == flat).min_by(|x, y| {
                    let d = |o: &(u32, String)| response::parse_hz(&o.1).map_or(0.0, |h| (h / f).log10().abs());
                    d(x).total_cmp(&d(y))
                });
                if let Some(o) = best {
                    if app.raw(fp) != Some(o.0) {
                        app.set(fp, o.0);
                    }
                }
            }
            if let Some(gp) = b.gain_param {
                let db = ((g.center().y - pt.y) / scale) as f64;
                let (lo, hi) = gp.raw_range();
                let raw = (((db - gp.number(0)) / gp.step).round().max(0.0) as u32).clamp(lo, hi);
                if app.raw(gp) != Some(raw) {
                    app.set(gp, raw);
                }
            }
        }
        let sel = i == *band;
        let sq = Rect::from_center_size(c, vec2(9.0, 9.0));
        if sel {
            glow(p, sq, 1.0, 8.0, alpha(led(), 0.6));
            p.rect_filled(sq, 1.0, lit());
        } else {
            p.rect_filled(sq, 1.0, mix(rgba(0x050302FF), led(), 0.05));
            p.rect_stroke(sq, 1.0, Stroke::new(1.3, lit()), eframe::egui::StrokeKind::Inside);
        }
        if resp.hovered() {
            resp.on_hover_text(b.name);
        }
    }
    // scroll over the glass steps the selected band's Q
    let gresp = ui.interact(g, Id::unique(("graph", src as u8)), Sense::hover());
    if let (true, Some(qp)) = (gresp.hovered(), bands.get(*band).and_then(|b| b.q_param)) {
        let s = wheel(ui);
        if s != 0 {
            step_option(app, qp, s);
        }
    }
}

pub fn step_option(app: &mut App, p: &'static Param, d: i32) {
    if p.options.is_empty() {
        let (lo, hi) = p.raw_range();
        let cur = app.raw(p).unwrap_or(lo) as i32;
        app.set(p, (cur + d).clamp(lo as i32, hi as i32) as u32);
    } else {
        let cur = app.raw(p).and_then(|c| p.options.iter().position(|o| o.0 == c)).unwrap_or(0) as i32;
        let next = (cur + d).clamp(0, p.options.len() as i32 - 1) as usize;
        app.set(p, p.options[next].0);
    }
}

/// "400Hz  −3.5dB  Q 2" for the selected band.
pub fn readout(app: &App, src: Src, band: usize) -> String {
    let Some(eq) = active(app, src) else { return "—".into() };
    let Some(b) = eq.bands.get(band) else { return "—".into() };
    let freq = match (b.freq_param, b.freq) {
        (Some(_), None) => "FLAT".into(),
        (_, Some(f)) if b.freq_param.is_some() || eq.graphic => fmt_hz(f),
        _ => "SHELF".into(),
    };
    let gain = if matches!(b.kind, Kind::LowCut | Kind::HighCut) { "—".into() } else { format!("{:+}dB", b.gain_db).replace('-', "−") };
    let q = match b.kind {
        Kind::LowCut | Kind::HighCut => "12dB/oct".to_string(),
        _ if b.q_param.is_some() => format!("Q {}", b.q),
        _ => String::new(),
    };
    format!("{freq}  {gain}  {q}").trim_end().to_string()
}
