//! Colour tokens, fonts and the drawing primitives from design/DESIGN.md: flat fills, 1px lines, top-right cut
//! corners, label bars, hatch and the other decor.

use std::sync::Arc;

use eframe::egui::{
    self, pos2, text::LayoutJob, vec2, Align2, Color32, FontData, FontFamily, FontId, Galley, Painter, Pos2, Rect,
    Shape, Stroke, TextFormat,
};

const fn hex(rgb: u32) -> Color32 {
    Color32::from_rgb((rgb >> 16) as u8, (rgb >> 8) as u8, rgb as u8)
}

pub const BG: Color32 = hex(0x0B0B0A);
pub const PANEL: Color32 = hex(0x121211);
pub const RAISED: Color32 = hex(0x1C1B19);
pub const LINE: Color32 = hex(0x2A2926);
pub const GRID: Color32 = hex(0x242320);
pub const EDGE: Color32 = hex(0x4A4842);
pub const TEXT_3: Color32 = hex(0x8A867D);
pub const TEXT_2: Color32 = hex(0xA29E94);
pub const INK: Color32 = hex(0xECE8DE);
pub const INK_ON: Color32 = hex(0x0B0B0A);
pub const INK_SUB: Color32 = hex(0x3A3833);
pub const CORAL: Color32 = hex(0xF2685A);
pub const STEEL: Color32 = hex(0x6F8FB8);
pub const MUSTARD: Color32 = hex(0xEDB03E);
pub const SAND: Color32 = hex(0xD8C8A4);
pub const SAGE: Color32 = hex(0x8FB98B);
// ponytail: the brief makes the accent a runtime setting; a constant until there's a settings screen.
pub const ACCENT: Color32 = CORAL;

/// The fixed font instances (DESIGN.md §3), each with its tracking.
#[derive(Clone, Copy)]
pub enum F {
    /// IBM Plex Mono: meta, tables, help.
    Mono,
    /// Archivo ExtraBold: patch name, wordmark.
    Display,
    /// Archivo ExtraBold Expanded: label bars, tabs, buttons, control values.
    Exp,
    /// Archivo ExtraBold SemiExpanded: list items.
    Semi,
    /// Archivo Bold Expanded: numeric readouts.
    ExpB,
    /// Archivo Bold SemiExpanded: option names, readouts.
    SemiB,
}

impl F {
    fn family(self) -> FontFamily {
        match self {
            F::Mono => FontFamily::Monospace,
            F::Display => FontFamily::Name("display".into()),
            F::Exp => FontFamily::Name("exp".into()),
            F::Semi => FontFamily::Name("semi".into()),
            F::ExpB => FontFamily::Name("expb".into()),
            F::SemiB => FontFamily::Name("semib".into()),
        }
    }

    fn tracking(self) -> f32 {
        match self {
            F::Mono | F::Semi | F::SemiB => 0.02,
            F::Display => -0.045,
            F::Exp | F::ExpB => 0.04,
        }
    }

    pub fn id(self, size: f32) -> FontId {
        FontId::new(size, self.family())
    }
}

pub fn install(ctx: &egui::Context) {
    let mut defs = egui::FontDefinitions::default();
    let fallback = defs.families[&FontFamily::Proportional].clone();
    let fonts: [(&str, &'static [u8]); 6] = [
        ("mono", include_bytes!("../fonts/IBMPlexMono-Regular.ttf")),
        ("display", include_bytes!("../fonts/Archivo-ExtraBold.ttf")),
        ("exp", include_bytes!("../fonts/Archivo-Expanded-ExtraBold.ttf")),
        ("semi", include_bytes!("../fonts/Archivo-SemiExpanded-ExtraBold.ttf")),
        ("expb", include_bytes!("../fonts/Archivo-Expanded-Bold.ttf")),
        ("semib", include_bytes!("../fonts/Archivo-SemiExpanded-Bold.ttf")),
    ];
    for (name, bytes) in fonts {
        defs.font_data.insert(name.into(), Arc::new(FontData::from_static(bytes)));
        let fam = if name == "mono" { FontFamily::Monospace } else { FontFamily::Name(name.into()) };
        defs.families.insert(fam, [name.to_string()].into_iter().chain(fallback.iter().cloned()).collect());
    }
    // egui's own widgets (text fields, tooltips) use the proportional family: make that mono too
    defs.families.get_mut(&FontFamily::Proportional).unwrap().insert(0, "mono".into());
    ctx.set_fonts(defs);

    ctx.all_styles_mut(|s| {
        let v = &mut s.visuals;
        v.dark_mode = true;
        v.panel_fill = BG;
        v.window_fill = PANEL;
        v.extreme_bg_color = BG;
        v.override_text_color = Some(INK);
        v.selection.bg_fill = INK_SUB;
        v.selection.stroke = Stroke::new(1.0, INK);
        v.text_cursor.stroke = Stroke::new(2.0, MUSTARD);
        v.window_stroke = Stroke::new(1.0, INK);
        v.window_corner_radius = 0.into();
        v.window_shadow = egui::Shadow::NONE;
        v.popup_shadow = egui::Shadow::NONE;
        s.spacing.scroll.floating = false;
        s.spacing.scroll.bar_width = 6.0;
    });
}

/// Lay out one line of text with the font's tracking, truncated with … beyond `max_w`.
pub fn galley(p: &Painter, s: &str, f: F, size: f32, color: Color32, max_w: f32) -> Arc<Galley> {
    let format =
        TextFormat { font_id: f.id(size), extra_letter_spacing: f.tracking() * size, color, ..Default::default() };
    let mut job = LayoutJob::single_section(s.to_owned(), format);
    job.wrap = egui::text::TextWrapping::truncate_at_width(max_w);
    p.layout_job(job)
}

pub fn text(p: &Painter, pos: Pos2, align: Align2, s: &str, f: F, size: f32, color: Color32) -> Rect {
    text_max(p, pos, align, s, f, size, color, f32::INFINITY)
}

#[allow(clippy::too_many_arguments)]
pub fn text_max(p: &Painter, pos: Pos2, align: Align2, s: &str, f: F, size: f32, color: Color32, max_w: f32) -> Rect {
    let g = galley(p, s, f, size, color, max_w);
    let r = align.anchor_size(pos, g.size());
    p.galley(r.min, g, color);
    r
}

pub fn text_w(p: &Painter, s: &str, f: F, size: f32) -> f32 {
    galley(p, s, f, size, INK, f32::INFINITY).size().x
}

/// Wrapped paragraph; returns its height.
pub fn para(p: &Painter, pos: Pos2, s: &str, size: f32, color: Color32, width: f32, line_h: f32) -> f32 {
    let format = TextFormat {
        font_id: F::Mono.id(size),
        extra_letter_spacing: 0.02 * size,
        color,
        line_height: Some(line_h),
        ..Default::default()
    };
    let mut job = LayoutJob::single_section(s.to_owned(), format);
    job.wrap.max_width = width;
    let g = p.layout_job(job);
    let h = g.size().y;
    p.galley(pos, g, color);
    h
}

/// A rect with its top-right corner cut at 45°.
pub fn cut_poly(r: Rect, c: f32) -> Vec<Pos2> {
    vec![r.left_top(), pos2(r.right() - c, r.top()), pos2(r.right(), r.top() + c), r.right_bottom(), r.left_bottom()]
}

pub fn cut_fill(p: &Painter, r: Rect, c: f32, fill: Color32) {
    if c <= 0.0 {
        p.rect_filled(r, 0.0, fill);
    } else {
        p.add(Shape::convex_polygon(cut_poly(r, c), fill, Stroke::NONE));
    }
}

/// 1px outline of a cut rect.
pub fn cut_outline(p: &Painter, r: Rect, c: f32, color: Color32) {
    p.add(Shape::closed_line(cut_poly(r.shrink(0.5), c), Stroke::new(1.0, color)));
}

/// Filled cut rect with a 1px border: the border polygon, then the same polygon inset 1px (DESIGN.md §4).
pub fn cut_frame(p: &Painter, r: Rect, c: f32, fill: Color32, border: Color32) {
    cut_fill(p, r, c, border);
    cut_fill(p, r.shrink(1.0), c, fill);
}

pub fn hline(p: &Painter, x0: f32, x1: f32, y: f32, color: Color32) {
    p.hline(x0..=x1, y + 0.5, Stroke::new(1.0, color));
}

pub fn vline(p: &Painter, x: f32, y0: f32, y1: f32, color: Color32) {
    p.vline(x + 0.5, y0..=y1, Stroke::new(1.0, color));
}

pub fn dashed_rect(p: &Painter, r: Rect, color: Color32) {
    let r = r.shrink(0.5);
    let pts = [r.left_top(), r.right_top(), r.right_bottom(), r.left_bottom(), r.left_top()];
    p.extend(Shape::dashed_line(&pts, Stroke::new(1.0, color), 4.0, 3.0));
}

/// The 2px MUSTARD keyboard focus ring, 2px outside the control.
pub fn focus_ring(p: &Painter, r: Rect, c: f32) {
    p.add(Shape::closed_line(cut_poly(r.expand(3.0), c + 1.0), Stroke::new(2.0, MUSTARD)));
}

/// Diagonal hatch (2px INK lines, 6px pitch) in a parallelogram slanted like the label bar.
pub fn hatch(p: &Painter, r: Rect, under: Color32) {
    let clip = p.with_clip_rect(r.intersect(p.clip_rect()));
    let h = r.height();
    let mut x = r.left() - h;
    while x < r.right() {
        clip.line_segment([pos2(x, r.bottom()), pos2(x + h, r.top())], Stroke::new(1.6, INK));
        x += 6.0;
    }
    let s = 8.0;
    clip.add(Shape::convex_polygon(vec![r.left_top(), pos2(r.left() + s, r.top()), r.left_bottom()], under, Stroke::NONE));
    clip.add(Shape::convex_polygon(
        vec![r.right_top(), r.right_bottom(), pos2(r.right() - s, r.bottom())],
        under,
        Stroke::NONE,
    ));
}

/// INK label bar with a slanted right edge. Returns its width.
pub fn label_bar(p: &Painter, x: f32, y: f32, h: f32, s: &str) -> f32 {
    let w = text_w(p, s, F::Exp, 12.0) + 10.0 + 18.0;
    p.add(Shape::convex_polygon(
        vec![pos2(x, y), pos2(x + w, y), pos2(x + w - 8.0, y + h), pos2(x, y + h)],
        INK,
        Stroke::NONE,
    ));
    text(p, pos2(x + 10.0, y + h / 2.0), Align2::LEFT_CENTER, s, F::Exp, 12.0, INK_ON);
    w
}

/// The core panel: 1px EDGE border with a cut corner, a 30px header (label bar, optional hatch, sub and meta
/// text) and a PANEL body. Returns the body rect.
pub fn panel(p: &Painter, r: Rect, cut: f32, title: &str, hatch_w: f32, sub: &str, meta: &str) -> Rect {
    cut_frame(p, r, cut, PANEL, EDGE);
    let (x, y) = (r.left() + 1.0, r.top() + 1.0);
    let mut cx = x + label_bar(p, x, y, 29.0, title);
    if hatch_w > 0.0 {
        hatch(p, Rect::from_min_size(pos2(cx + 4.0, y), vec2(hatch_w, 29.0)), PANEL);
        cx += 4.0 + hatch_w;
    }
    if !sub.is_empty() {
        text(p, pos2(cx + 12.0, y + 14.5), Align2::LEFT_CENTER, sub, F::Mono, 10.0, TEXT_3);
    }
    text(p, pos2(r.right() - cut - 10.0, y + 14.5), Align2::RIGHT_CENTER, meta, F::Mono, 10.0, TEXT_3);
    hline(p, x, r.right() - 1.0, r.top() + 30.0, LINE);
    Rect::from_min_max(pos2(x, r.top() + 31.0), r.max - vec2(1.0, 1.0))
}

/// Group bracket: corner tick, mono label, then a line ending in a down-tick.
pub fn bracket(p: &Painter, x0: f32, x1: f32, y: f32, label: &str, color: Color32) {
    let ty = y + 6.0;
    hline(p, x0, x0 + 6.0, ty, color);
    vline(p, x0, ty, ty + 6.0, color);
    let r = text(p, pos2(x0 + 14.0, y), Align2::LEFT_TOP, label, F::Mono, 10.0, TEXT_2);
    hline(p, r.right() + 8.0, x1, ty, color);
    vline(p, x1 - 1.0, ty, ty + 6.0, color);
}

/// Small square status dot.
pub fn dot(p: &Painter, c: Pos2, size: f32, color: Color32) {
    p.rect_filled(Rect::from_center_size(c, vec2(size, size)), 0.0, color);
}

/// Chevron for dropdown caps.
pub fn chevron(p: &Painter, c: Pos2, up: bool, color: Color32) {
    let d = if up { -1.0 } else { 1.0 };
    p.line(vec![c + vec2(-6.0, -3.0 * d), c + vec2(0.0, 3.0 * d), c + vec2(6.0, -3.0 * d)], Stroke::new(2.0, color));
}

pub fn lock_icon(p: &Painter, c: Pos2, color: Color32) {
    let body = Rect::from_center_size(c + vec2(0.0, 2.0), vec2(10.0, 7.0));
    p.rect_stroke(body, 0.0, Stroke::new(1.0, color), egui::StrokeKind::Inside);
    let arc: Vec<Pos2> = (0..=8)
        .map(|i| {
            let a = std::f32::consts::PI * i as f32 / 8.0;
            pos2(c.x - 3.0 * a.cos(), body.top() - 2.0 - 3.0 * a.sin())
        })
        .collect();
    p.line([vec![pos2(c.x - 3.0, body.top())], arc, vec![pos2(c.x + 3.0, body.top())]].concat(), Stroke::new(1.0, color));
}

// --- decor (DESIGN.md §8): never carries meaning ---------------------------------------------------------------

const BARCODE: [(f32, f32); 25] = [
    (0., 2.), (3., 4.), (6., 9.), (10., 11.), (12., 13.), (16., 18.), (19., 20.), (22., 23.), (24., 27.), (29., 30.),
    (31., 33.), (34., 35.), (38., 39.), (40., 42.), (44., 45.), (46., 49.), (50., 51.), (53., 55.), (56., 57.),
    (58., 59.), (61., 63.), (64., 65.), (66., 69.), (71., 72.), (73., 75.),
];

pub fn barcode(p: &Painter, top_left: Pos2) {
    for (a, b) in BARCODE {
        p.rect_filled(Rect::from_min_max(top_left + vec2(a, 0.0), top_left + vec2(b, 26.0)), 0.0, INK);
    }
}

pub const STRIPES: [Color32; 10] = [CORAL, SAND, STEEL, CORAL, MUSTARD, STEEL, SAND, CORAL, MUSTARD, STEEL];

/// Horizontal colour stripes, spread over `r`'s height.
pub fn stripes(p: &Painter, r: Rect, colors: &[Color32], thick: f32) {
    let gap = (r.height() - thick * colors.len() as f32) / (colors.len() - 1).max(1) as f32;
    for (i, c) in colors.iter().enumerate() {
        let y = r.top() + i as f32 * (thick + gap);
        p.rect_filled(Rect::from_min_size(pos2(r.left(), y), vec2(r.width(), thick)), 0.0, *c);
    }
}

fn dotted_circle(p: &Painter, c: Pos2, r: f32, pitch: f32, color: Color32) {
    let n = (std::f32::consts::TAU * r / pitch) as usize;
    for i in 0..n {
        let a = std::f32::consts::TAU * i as f32 / n as f32;
        dot(p, c + vec2(a.sin(), -a.cos()) * r, 1.6, color);
    }
}

/// Radar: dotted outer ring, two inner rings, crosshair, one accent sweep. `sweep` in radians from 12 o'clock.
pub fn radar(p: &Painter, c: Pos2, r: f32, sweep: f32) {
    dotted_circle(p, c, r * 0.93, 6.0, INK);
    p.circle_stroke(c, r * 0.67, Stroke::new(1.0, EDGE));
    p.circle_stroke(c, r * 0.37, Stroke::new(1.0, EDGE));
    p.line_segment([c - vec2(0.0, r * 0.87), c + vec2(0.0, r * 0.87)], Stroke::new(1.0, LINE));
    p.line_segment([c - vec2(r * 0.87, 0.0), c + vec2(r * 0.87, 0.0)], Stroke::new(1.0, LINE));
    p.line_segment([c - vec2(5.0, 0.0), c + vec2(5.0, 0.0)], Stroke::new(1.4, INK));
    p.line_segment([c - vec2(0.0, 5.0), c + vec2(0.0, 5.0)], Stroke::new(1.4, INK));
    let tip = c + vec2(sweep.sin(), -sweep.cos()) * r * 0.67;
    p.line_segment([c, tip], Stroke::new(1.6, ACCENT));
    dot(p, tip, 6.0, ACCENT);
    for a in [0.0f32, 2.4, 4.3] {
        p.circle_filled(c + vec2(a.sin(), -a.cos()) * r * 0.93, 3.0, INK);
    }
}
