//! The "Outboard" look (design/DESIGN.md): rack units with ears and screws, brushed faces, silkscreen labels,
//! keycaps with LEDs, and VFD glass lit in one lamp colour. Colours, fonts and the drawing primitives live here;
//! the controls built from them are in widgets.rs.

use std::sync::atomic::{AtomicU8, Ordering};
use std::sync::{Arc, OnceLock};

use eframe::egui::{
    self, epaint, pos2, text::LayoutJob, vec2, Align2, Color32, ColorImage, FontData, FontFamily, FontId, Galley,
    Mesh, Painter, Pos2, Rect, Shape, Stroke, TextFormat, TextureHandle, TextureOptions,
};

const fn hex(rgb: u32) -> Color32 {
    Color32::from_rgb((rgb >> 16) as u8, (rgb >> 8) as u8, rgb as u8)
}

/// `#RRGGBBAA`, unmultiplied like CSS.
pub fn rgba(rgba: u32) -> Color32 {
    Color32::from_rgba_unmultiplied((rgba >> 24) as u8, (rgba >> 16) as u8, (rgba >> 8) as u8, rgba as u8)
}

pub const BODY: Color32 = hex(0x0D0D0F);
pub const RAIL: Color32 = hex(0x040404);
pub const FACE_TOP: Color32 = hex(0x222325);
pub const FACE_BOT: Color32 = hex(0x1B1C1E);
pub const SILK: Color32 = hex(0xE8E4DC);
pub const SILK2: Color32 = hex(0xA29D95);
pub const SILK3: Color32 = hex(0x8F8A83);
pub const KEY_TOP: Color32 = hex(0x414245);
pub const KEY_BOT: Color32 = hex(0x2C2D30);
pub const KEY_TEXT: Color32 = hex(0xECE8E0);
pub const RED_TOP: Color32 = hex(0xD8532F);
pub const RED_BOT: Color32 = hex(0xA63A20);
pub const RED_TEXT: Color32 = hex(0xFFF4EA);
pub const METER_FACE: Color32 = hex(0xF3DFAF);
pub const INV_TEXT: Color32 = hex(0x170D02);
pub const BLACK: Color32 = Color32::BLACK;

/// The five lamp colours. One lights every LED, display and memory tick (a runtime setting).
pub const LAMPS: [(&str, Color32); 5] = [
    ("MUSTARD", hex(0xFFB547)),
    ("CORAL", hex(0xFF6B4A)),
    ("SAGE", hex(0x8CFFB4)),
    ("STEEL", hex(0x7FDBFF)),
    ("SAND", hex(0xFFE3B3)),
];

static LAMP: AtomicU8 = AtomicU8::new(0);

pub fn lamp() -> usize {
    LAMP.load(Ordering::Relaxed) as usize % LAMPS.len()
}

pub fn set_lamp(i: usize) {
    LAMP.store(i as u8, Ordering::Relaxed);
}

/// The lamp colour.
pub fn led() -> Color32 {
    LAMPS[lamp()].1
}

/// `a` mixed toward `b` by `t` (0 = a), like CSS color-mix in sRGB.
pub fn mix(a: Color32, b: Color32, t: f32) -> Color32 {
    let l = |x: u8, y: u8| (x as f32 + (y as f32 - x as f32) * t).round() as u8;
    Color32::from_rgb(l(a.r(), b.r()), l(a.g(), b.g()), l(a.b(), b.b()))
}

pub fn alpha(c: Color32, a: f32) -> Color32 {
    Color32::from_rgba_unmultiplied(c.r(), c.g(), c.b(), (a * 255.0).round() as u8)
}

/// Lit VFD text: the lamp with a little white.
pub fn lit() -> Color32 {
    mix(led(), Color32::WHITE, 0.18)
}

/// Unlit VFD segments and annunciators.
pub fn dim() -> Color32 {
    mix(hex(0x0B0704), led(), 0.22)
}

/// The inverted (selected) VFD row.
pub fn inv() -> Color32 {
    mix(led(), Color32::WHITE, 0.12)
}

// --- fonts ------------------------------------------------------------------------------------------------------

/// Fixed font instances, each with its tracking (em).
#[derive(Clone, Copy, PartialEq)]
pub enum F {
    /// Archivo Bold Expanded: silkscreen titles and labels.
    Silk,
    /// Archivo Bold SemiExpanded: secondary silkscreen, key caps.
    Silk2,
    /// Archivo ExtraBold Expanded: block titles.
    Title,
    /// JetBrains Mono: values, tables, VFD text.
    Mono,
    MonoB,
    /// Doto: the dot-matrix patch display.
    Dot,
}

impl F {
    fn family(self) -> FontFamily {
        match self {
            F::Mono => FontFamily::Monospace,
            F::Silk => FontFamily::Name("silk".into()),
            F::Silk2 => FontFamily::Name("silk2".into()),
            F::Title => FontFamily::Name("title".into()),
            F::MonoB => FontFamily::Name("monob".into()),
            F::Dot => FontFamily::Name("dot".into()),
        }
    }

    fn tracking(self) -> f32 {
        match self {
            F::Silk => 0.2,
            F::Silk2 => 0.16,
            F::Title => 0.06,
            F::Mono | F::MonoB => 0.0,
            F::Dot => 0.08,
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
        ("mono", include_bytes!("../fonts/JetBrainsMono-Regular.ttf")),
        ("monob", include_bytes!("../fonts/JetBrainsMono-Bold.ttf")),
        ("silk", include_bytes!("../fonts/Archivo-Expanded-Bold.ttf")),
        ("silk2", include_bytes!("../fonts/Archivo-SemiExpanded-Bold.ttf")),
        ("title", include_bytes!("../fonts/Archivo-Expanded-ExtraBold.ttf")),
        ("dot", include_bytes!("../fonts/Doto-ExtraBold.ttf")),
    ];
    for (name, bytes) in fonts {
        defs.font_data.insert(name.into(), Arc::new(FontData::from_static(bytes)));
        let fam = if name == "mono" { FontFamily::Monospace } else { FontFamily::Name(name.into()) };
        // the mono face covers arrows and symbols the Archivo subsets and Doto lack
        let mut chain = vec![name.to_string()];
        if name != "mono" {
            chain.push("mono".into());
        }
        defs.families.insert(fam, chain.into_iter().chain(fallback.iter().cloned()).collect());
    }
    defs.families.get_mut(&FontFamily::Proportional).unwrap().insert(0, "mono".into());
    ctx.set_fonts(defs);
    install_visuals(ctx);
}

/// Styles that follow the lamp colour (text selection, cursor).
pub fn install_visuals(ctx: &egui::Context) {
    ctx.all_styles_mut(|s| {
        let v = &mut s.visuals;
        v.dark_mode = true;
        v.panel_fill = BODY;
        v.window_fill = FACE_BOT;
        v.extreme_bg_color = hex(0x050302);
        v.override_text_color = Some(SILK);
        v.selection.bg_fill = alpha(led(), 0.35);
        v.selection.stroke = Stroke::new(1.0, led());
        v.text_cursor.stroke = Stroke::new(2.0, led());
        v.window_shadow = egui::Shadow::NONE;
        v.popup_shadow = egui::Shadow::NONE;
        s.spacing.scroll.floating = false;
        s.spacing.scroll.bar_width = 6.0;
    });
}

/// One line of text with the font's tracking, truncated with … beyond `max_w`.
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
    // tracking adds space after the last glyph too: drop it so right-aligned text lines up
    let r = r.translate(vec2(if align.x() == egui::Align::Max { f.tracking() * size } else { 0.0 }, 0.0));
    p.galley(r.min, g, color);
    r
}

pub fn text_w(p: &Painter, s: &str, f: F, size: f32) -> f32 {
    galley(p, s, f, size, SILK, f32::INFINITY).size().x - f.tracking() * size
}

/// Silkscreen: uppercase print with a 1px black drop.
pub fn silk(p: &Painter, pos: Pos2, align: Align2, s: &str, f: F, size: f32, color: Color32) -> Rect {
    let up = s.to_uppercase();
    text(p, pos + vec2(0.0, 1.0), align, &up, f, size, rgba(0x000000B0));
    text(p, pos, align, &up, f, size, color)
}

/// Lit VFD text with a soft glow.
pub fn vfd(p: &Painter, pos: Pos2, align: Align2, s: &str, f: F, size: f32) -> Rect {
    vfd_max(p, pos, align, s, f, size, f32::INFINITY)
}

pub fn vfd_max(p: &Painter, pos: Pos2, align: Align2, s: &str, f: F, size: f32, max_w: f32) -> Rect {
    glow_text(p, pos, align, s, f, size, max_w, lit(), 0.16)
}

#[allow(clippy::too_many_arguments)]
pub fn glow_text(p: &Painter, pos: Pos2, align: Align2, s: &str, f: F, size: f32, max_w: f32, c: Color32, g: f32) -> Rect {
    let halo = alpha(led(), g);
    let k = (size / 10.0).clamp(0.8, 2.2);
    for (dx, dy) in [(-1.0, 0.0), (1.0, 0.0), (0.0, -1.0), (0.0, 1.0), (-0.7, -0.7), (0.7, 0.7), (0.7, -0.7), (-0.7, 0.7)] {
        text_max(p, pos + vec2(dx, dy) * k, align, s, f, size, halo, max_w);
    }
    text_max(p, pos, align, s, f, size, c, max_w)
}

/// Wrapped paragraph; returns its height.
#[allow(clippy::too_many_arguments)]
pub fn para(p: &Painter, pos: Pos2, s: &str, f: F, size: f32, color: Color32, width: f32, line_h: f32) -> f32 {
    let format = TextFormat {
        font_id: f.id(size),
        extra_letter_spacing: f.tracking() * size,
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

// --- fills ------------------------------------------------------------------------------------------------------

/// Points of a rounded rect, clockwise from the top-left.
fn rrect_points(r: Rect, rad: f32) -> Vec<Pos2> {
    let rad = rad.min(r.width() / 2.0).min(r.height() / 2.0);
    if rad <= 0.3 {
        return vec![r.left_top(), r.right_top(), r.right_bottom(), r.left_bottom()];
    }
    let n = 5;
    let corners = [
        (pos2(r.right() - rad, r.top() + rad), -90.0f32),
        (pos2(r.right() - rad, r.bottom() - rad), 0.0),
        (pos2(r.left() + rad, r.bottom() - rad), 90.0),
        (pos2(r.left() + rad, r.top() + rad), 180.0),
    ];
    let mut pts = vec![];
    for (c, a0) in corners {
        for i in 0..=n {
            let a = (a0 + 90.0 * i as f32 / n as f32).to_radians();
            pts.push(c + vec2(a.cos(), a.sin()) * rad);
        }
    }
    pts.rotate_right(n + 1); // start at the top-left corner
    pts
}

/// Rounded rect with a vertical gradient (top → bottom).
pub fn vgrad(p: &Painter, r: Rect, rad: f32, top: Color32, bot: Color32) {
    grad_poly(p, &rrect_points(r, rad), |q| {
        let t = ((q.y - r.top()) / r.height().max(1.0)).clamp(0.0, 1.0);
        lerp_c(top, bot, t)
    });
}

/// Rect with a horizontal gradient through `stops` (position 0–1, colour).
pub fn hgrad(p: &Painter, r: Rect, stops: &[(f32, Color32)]) {
    let mut m = Mesh::default();
    for w in stops.windows(2) {
        let (x0, x1) = (r.left() + r.width() * w[0].0, r.left() + r.width() * w[1].0);
        let i = m.vertices.len() as u32;
        m.colored_vertex(pos2(x0, r.top()), w[0].1);
        m.colored_vertex(pos2(x1, r.top()), w[1].1);
        m.colored_vertex(pos2(x1, r.bottom()), w[1].1);
        m.colored_vertex(pos2(x0, r.bottom()), w[0].1);
        m.add_triangle(i, i + 1, i + 2);
        m.add_triangle(i, i + 2, i + 3);
    }
    p.add(Shape::mesh(m));
}

/// Rect with a vertical gradient through `stops`.
pub fn vstops(p: &Painter, r: Rect, stops: &[(f32, Color32)]) {
    let mut m = Mesh::default();
    for w in stops.windows(2) {
        let (y0, y1) = (r.top() + r.height() * w[0].0, r.top() + r.height() * w[1].0);
        let i = m.vertices.len() as u32;
        m.colored_vertex(pos2(r.left(), y0), w[0].1);
        m.colored_vertex(pos2(r.right(), y0), w[0].1);
        m.colored_vertex(pos2(r.right(), y1), w[1].1);
        m.colored_vertex(pos2(r.left(), y1), w[1].1);
        m.add_triangle(i, i + 1, i + 2);
        m.add_triangle(i, i + 2, i + 3);
    }
    p.add(Shape::mesh(m));
}

fn lerp_c(a: Color32, b: Color32, t: f32) -> Color32 {
    let l = |x: u8, y: u8| (x as f32 + (y as f32 - x as f32) * t).round() as u8;
    // premultiplied channels interpolate correctly as they are
    Color32::from_rgba_premultiplied(l(a.r(), b.r()), l(a.g(), b.g()), l(a.b(), b.b()), l(a.a(), b.a()))
}

/// Convex polygon filled with a per-point colour (fan from the centroid).
pub fn grad_poly(p: &Painter, pts: &[Pos2], color: impl Fn(Pos2) -> Color32) {
    if pts.len() < 3 {
        return;
    }
    let c = pts.iter().fold(vec2(0.0, 0.0), |a, q| a + q.to_vec2()) / pts.len() as f32;
    let c = pos2(c.x, c.y);
    let mut m = Mesh::default();
    m.colored_vertex(c, color(c));
    for q in pts {
        m.colored_vertex(*q, color(*q));
    }
    let n = pts.len() as u32;
    for i in 0..n {
        m.add_triangle(0, 1 + i, 1 + (i + 1) % n);
    }
    p.add(Shape::mesh(m));
}

pub fn rrect(p: &Painter, r: Rect, rad: f32, fill: Color32) {
    p.rect_filled(r, rad, fill);
}

pub fn rrect_stroke(p: &Painter, r: Rect, rad: f32, color: Color32) {
    p.rect_stroke(r.shrink(0.5), rad, Stroke::new(1.0, color), egui::StrokeKind::Middle);
}

/// Soft drop shadow (or glow, with a light colour) under a rounded rect.
pub fn shadow(p: &Painter, r: Rect, rad: f32, dy: f32, blur: f32, color: Color32) {
    let s = epaint::Shadow { offset: [0, dy as i8], blur: blur as u8, spread: 0, color };
    p.add(s.as_shape(r, rad));
}

pub fn glow(p: &Painter, r: Rect, rad: f32, blur: f32, color: Color32) {
    p.add(epaint::RectShape::filled(r, rad, color).with_blur_width(blur));
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
    p.extend(Shape::dashed_line(&pts, Stroke::new(1.0, color), 3.0, 2.0));
}

/// The silkscreen rule after a title: fades to the right.
pub fn rule(p: &Painter, x0: f32, x1: f32, y: f32) {
    if x1 > x0 {
        hgrad(p, Rect::from_min_max(pos2(x0, y), pos2(x1, y + 1.0)), &[(0.0, rgba(0xE8E4DC33)), (1.0, rgba(0xE8E4DC14))]);
    }
}

// --- textures ---------------------------------------------------------------------------------------------------

struct Tex {
    dots: TextureHandle,
    brush: TextureHandle,
    ear: TextureHandle,
}

static TEX: OnceLock<Tex> = OnceLock::new();

fn tex(ctx: &egui::Context) -> &'static Tex {
    TEX.get_or_init(|| {
        let opts = TextureOptions { wrap_mode: egui::TextureWrapMode::Repeat, ..TextureOptions::NEAREST };
        let img = |w: usize, h: usize, px: &[u8]| {
            let pixels = px.chunks(4).map(|c| Color32::from_rgba_unmultiplied(c[0], c[1], c[2], c[3])).collect();
            ColorImage::new([w, h], pixels)
        };
        let o = [0, 0, 0, 0];
        let wd = [255, 255, 255, 255];
        let dots = img(3, 3, &[o, o, o, o, wd, o, o, o, o].concat());
        let brush = img(1, 3, &[[255, 255, 255, 5], [0, 0, 0, 0], [0, 0, 0, 18]].concat());
        let ear = img(3, 1, &[[255, 255, 255, 5], [0, 0, 0, 0], [0, 0, 0, 0]].concat());
        Tex {
            dots: ctx.load_texture("vfd-dots", dots, opts),
            brush: ctx.load_texture("brush", brush, opts),
            ear: ctx.load_texture("ear", ear, opts),
        }
    })
}

fn tiled(p: &Painter, t: &TextureHandle, r: Rect, cell: Pos2, tint: Color32) {
    let mut m = Mesh::with_texture(t.id());
    let uv = Rect::from_min_max(pos2(0.0, 0.0), pos2(r.width() / cell.x, r.height() / cell.y));
    m.add_rect_with_uv(r, uv, tint);
    p.add(Shape::mesh(m));
}

// --- the rack ---------------------------------------------------------------------------------------------------

pub const EAR: f32 = 34.0;

/// The window ground: dark rails either side.
pub fn rack_bg(p: &Painter, r: Rect) {
    hgrad(p, r, &[(0.0, RAIL), (0.18, BODY), (0.82, BODY), (1.0, RAIL)]);
}

/// Unit screw: domed head with a cross slot at `rot` degrees.
pub fn screw(p: &Painter, c: Pos2, rot: f32) {
    p.circle_filled(c + vec2(0.0, 1.0), 5.0, rgba(0x000000CC));
    let hl = c + vec2(-1.4, -2.0);
    let mut pts = vec![];
    for i in 0..24 {
        let a = std::f32::consts::TAU * i as f32 / 24.0;
        pts.push(c + vec2(a.cos(), a.sin()) * 5.0);
    }
    grad_poly(p, &pts, |q| {
        let d = (q - hl).length() / 7.5;
        if d < 0.5 { lerp_c(hex(0xF2EFEA), hex(0x9A968F), d * 2.0) } else { lerp_c(hex(0x9A968F), hex(0x3E3C39), ((d - 0.5) * 2.0).min(1.0)) }
    });
    p.circle_filled(hl, 1.6, rgba(0xFFFFFF60));
    let a = rot.to_radians();
    for k in [0.0, std::f32::consts::FRAC_PI_2] {
        let d = vec2((a + k).cos(), (a + k).sin()) * 3.4;
        p.line_segment([c - d, c + d], Stroke::new(1.4, hex(0x33302C)));
    }
}

/// Rack slot (the oval hole in the ear) with its screw.
fn slot(p: &Painter, c: Pos2, rot: f32) {
    let r = Rect::from_center_size(c, vec2(18.0, 10.0));
    rrect(p, r.translate(vec2(0.0, 1.0)), 5.0, rgba(0xFFFFFF14));
    rrect(p, r, 5.0, hex(0x050506));
    screw(p, c + vec2((rot as i32 % 5) as f32 - 2.0, 0.0), rot);
}

/// A rack unit: shadow, brushed face, ears with screws. Returns the face between the ears.
pub fn unit(ui: &egui::Ui, r: Rect, seed: u32) -> Rect {
    let p = ui.painter();
    shadow(p, r, 3.0, 10.0, 18.0, rgba(0x00000090));
    rrect(p, r.translate(vec2(0.0, 2.0)), 3.0, BLACK);
    vgrad(p, r, 3.0, FACE_TOP, FACE_BOT);
    let t = tex(ui.ctx());
    tiled(p, &t.brush, r.shrink2(vec2(1.0, 1.0)), pos2(1.0, 3.0), Color32::WHITE);
    vstops(p, Rect::from_min_size(r.min, vec2(r.width(), 14.0f32.min(r.height()))), &[(0.0, rgba(0xFFFFFF10)), (1.0, rgba(0xFFFFFF00))]);
    hline(p, r.left() + 2.0, r.right() - 2.0, r.top(), rgba(0xFFFFFF1F));
    hline(p, r.left() + 2.0, r.right() - 2.0, r.bottom() - 1.0, rgba(0x000000B0));
    const ROT: [f32; 12] = [17.0, 63.0, 141.0, 88.0, 32.0, 115.0, 9.0, 152.0, 71.0, 24.0, 128.0, 46.0];
    for (side, x) in [(0, r.left()), (1, r.right() - EAR)] {
        let er = Rect::from_min_size(pos2(x, r.top()), vec2(EAR, r.height()));
        hgrad(p, er.shrink2(vec2(0.0, 1.0)), &[(0.0, rgba(0x0000002A)), (0.55, rgba(0xFFFFFF07)), (1.0, rgba(0x00000024))]);
        tiled(p, &t.ear, er.shrink2(vec2(0.0, 1.0)), pos2(3.0, 1.0), Color32::WHITE);
        let bx = if side == 0 { er.right() - 1.0 } else { er.left() };
        vline(p, bx, r.top() + 1.0, r.bottom() - 1.0, rgba(0x000000B8));
        vline(p, bx + 1.0, r.top() + 1.0, r.bottom() - 1.0, rgba(0xFFFFFF0E));
        let n = if r.height() < 110.0 { 1 } else { 2 };
        for k in 0..n {
            let cy = if n == 1 { r.center().y } else { r.top() + r.height() * (0.25 + 0.5 * k as f32) };
            slot(p, pos2(er.center().x, cy), ROT[((seed * 2 + side) as usize * 3 + k) % ROT.len()]);
        }
    }
    Rect::from_min_max(pos2(r.left() + EAR, r.top()), pos2(r.right() - EAR, r.bottom()))
}

/// A unit's header: silk title, secondary text, a rule, then (right) an optional title and the unit number box.
/// Returns the right end of the rule.
pub fn header(p: &Painter, face: Rect, y: f32, title: &str, sub: &str, right: &str, num: usize) -> f32 {
    let x = face.left() + 20.0;
    let t = silk(p, pos2(x, y), Align2::LEFT_CENTER, title, F::Silk, 11.0, SILK);
    let mut rx = t.right() + 12.0;
    if !sub.is_empty() {
        let s = silk(p, pos2(rx, y), Align2::LEFT_CENTER, sub, F::Silk2, 9.0, SILK2);
        rx = s.right() + 14.0;
    }
    let mut right_x = face.right() - 20.0;
    if num > 0 {
        let s = format!("{num:02}");
        let w = text_w(p, &s, F::Mono, 9.0) + 12.0;
        let b = Rect::from_min_size(pos2(right_x - w, y - 7.0), vec2(w, 14.0));
        rrect_stroke(p, b, 2.0, rgba(0xE8E4DC55));
        text(p, b.center(), Align2::CENTER_CENTER, &s, F::Mono, 9.0, SILK2);
        right_x = b.left() - 12.0;
    }
    if !right.is_empty() {
        let r = silk(p, pos2(right_x, y), Align2::RIGHT_CENTER, right, F::Silk, 11.0, SILK);
        right_x = r.left() - 12.0;
    }
    rule(p, rx, right_x, y);
    right_x
}

/// A vertical groove between sections of one unit.
pub fn groove(p: &Painter, x: f32, y0: f32, y1: f32) {
    vline(p, x, y0, y1, rgba(0x00000080));
    vline(p, x + 1.0, y0, y1, rgba(0xFFFFFF0C));
}

// --- glass ------------------------------------------------------------------------------------------------------

/// A VFD window: black bezel, lamp-tinted glass with a dot screen, inner shade and a glare. Returns the glass.
pub fn glass(ui: &egui::Ui, r: Rect) -> Rect {
    let p = ui.painter();
    vgrad(p, r, 5.0, hex(0x040404), hex(0x101011));
    hline(p, r.left() + 3.0, r.right() - 3.0, r.bottom(), rgba(0xFFFFFF16));
    let g = r.shrink(5.0);
    glass_face(ui, g);
    g
}

pub fn glass_face(ui: &egui::Ui, g: Rect) {
    let p = ui.painter();
    rrect(p, g, 2.0, mix(hex(0x050302), led(), 0.05));
    vstops(p, Rect::from_min_size(g.min, vec2(g.width(), (g.height() * 0.62).min(90.0))), &[(0.0, alpha(led(), 0.10)), (1.0, alpha(led(), 0.0))]);
    tiled(p, &tex(ui.ctx()).dots, g, pos2(3.0, 3.0), alpha(led(), 0.10));
    // inner shade
    let s = 12.0f32.min(g.height() / 3.0);
    let sh = rgba(0x000000A0);
    let clear = rgba(0x00000000);
    vstops(p, Rect::from_min_size(g.min, vec2(g.width(), s)), &[(0.0, sh), (1.0, clear)]);
    vstops(p, Rect::from_min_max(pos2(g.left(), g.bottom() - s), g.max), &[(0.0, clear), (1.0, sh)]);
    hgrad(p, Rect::from_min_size(g.min, vec2(s, g.height())), &[(0.0, sh), (1.0, clear)]);
    hgrad(p, Rect::from_min_max(pos2(g.right() - s, g.top()), g.max), &[(0.0, clear), (1.0, sh)]);
    // glare: linear-gradient(162deg, #FFFFFF12 0, #FFFFFF05 34%, transparent 35%)
    let (sx, sy) = (0.309f32, 0.951f32);
    let len = sx * g.width() + sy * g.height();
    let c = 0.34 * len;
    let mut pts = vec![g.left_top()];
    let xa = c / sx;
    if xa <= g.width() {
        pts.push(pos2(g.left() + xa, g.top()));
    } else {
        pts.push(g.right_top());
        pts.push(pos2(g.right(), g.top() + (c - sx * g.width()) / sy));
    }
    let yb = c / sy;
    if yb <= g.height() {
        pts.push(pos2(g.left(), g.top() + yb));
    } else {
        pts.push(pos2(g.left() + (c - sy * g.height()) / sx, g.bottom()));
        pts.push(g.left_bottom());
    }
    let mut m = Mesh::default();
    for q in &pts {
        let t = (sx * (q.x - g.left()) + sy * (q.y - g.top())) / c;
        m.colored_vertex(*q, lerp_c(rgba(0xFFFFFF10), rgba(0xFFFFFF05), t.clamp(0.0, 1.0)));
    }
    for i in 1..pts.len() as u32 - 1 {
        m.add_triangle(0, i, i + 1);
    }
    p.add(Shape::mesh(m));
}

// --- lamps ------------------------------------------------------------------------------------------------------

/// Key LED: a 12×4 window, lit or dark.
pub fn led_bar(p: &Painter, c: Pos2, on: bool) {
    let r = Rect::from_center_size(c, vec2(12.0, 4.0));
    led_rect(p, r, 1.0, on);
}

/// Soft round light: lamp colour fading to nothing at `r`.
pub fn halo(p: &Painter, c: Pos2, r: f32, a: f32) {
    let col = led();
    radial_disc(p, c, r, c, r, &[(0.0, alpha(col, a)), (0.45, alpha(col, a * 0.45)), (1.0, alpha(col, 0.0))]);
}

pub fn led_rect(p: &Painter, r: Rect, rad: f32, on: bool) {
    if on {
        if rad * 2.0 >= r.width().min(r.height()) - 0.5 {
            halo(p, r.center(), r.width().max(r.height()) * 1.6, 0.6);
        } else {
            glow(p, r.expand(1.0), rad + 1.0, (r.height() * 2.0).clamp(3.0, 8.0), alpha(led(), 0.55));
        }
        grad_poly(p, &rrect_points(r, rad), |q| {
            let t = ((q.y - r.top()) / r.height()).clamp(0.0, 1.0);
            if t < 0.42 { lerp_c(hex(0xFFF6E2), led(), t / 0.42) } else { lerp_c(led(), mix(led(), BLACK, 0.45), (t - 0.42) / 0.58) }
        });
    } else {
        rrect(p, r, rad, mix(hex(0x0C0805), led(), 0.13));
        hline(p, r.left() + 1.0, r.right() - 1.0, r.top(), rgba(0x000000C0));
        hline(p, r.left() + 1.0, r.right() - 1.0, r.bottom(), rgba(0xFFFFFF10));
    }
}

/// Round LED dot.
pub fn led_dot(p: &Painter, c: Pos2, d: f32, on: bool) {
    led_rect(p, Rect::from_center_size(c, vec2(d, d)), d / 2.0, on);
}

/// A jewel lamp (the pilot light, lamp-colour picks): coloured glass in a chrome bezel.
pub fn jewel(p: &Painter, c: Pos2, r: f32, color: Color32, lit: bool) {
    p.circle_filled(c, r + 2.0, hex(0x1A1A1B));
    p.circle_stroke(c, r + 1.5, Stroke::new(1.5, hex(0x8A8781)));
    if lit {
        radial_disc(p, c, r * 2.6, c, r * 2.6, &[(0.0, alpha(color, 0.55)), (0.5, alpha(color, 0.2)), (1.0, alpha(color, 0.0))]);
    }
    let hl = c + vec2(-r * 0.3, -r * 0.35);
    let base = if lit { color } else { mix(color, BLACK, 0.55) };
    let mut pts = vec![];
    for i in 0..24 {
        let a = std::f32::consts::TAU * i as f32 / 24.0;
        pts.push(c + vec2(a.cos(), a.sin()) * r);
    }
    grad_poly(p, &pts, |q| {
        let d = ((q - hl).length() / (r * 1.6)).min(1.0);
        lerp_c(mix(base, Color32::WHITE, 0.6), mix(base, BLACK, 0.35), d)
    });
    p.circle_filled(hl, r * 0.25, rgba(0xFFFFFF90));
}

pub fn point(c: Pos2, deg: f32, r: f32) -> Pos2 {
    let t = deg.to_radians();
    c + vec2(t.sin(), -t.cos()) * r
}

/// Radial-gradient disc (a metal skirt): `stops` by distance from `focus`, normalised by `reach`.
pub fn radial_disc(p: &Painter, c: Pos2, r: f32, focus: Pos2, reach: f32, stops: &[(f32, Color32)]) {
    let color = |q: Pos2| {
        let d = ((q - focus).length() / reach).clamp(0.0, 1.0);
        let i = stops.windows(2).position(|w| d <= w[1].0).unwrap_or(stops.len() - 2);
        let (a, b) = (stops[i], stops[i + 1]);
        lerp_c(a.1, b.1, ((d - a.0) / (b.0 - a.0).max(1e-3)).clamp(0.0, 1.0))
    };
    let (rings, segs) = (6, 48);
    let mut m = Mesh::default();
    m.colored_vertex(c, color(c));
    for ri in 1..=rings {
        let rr = r * ri as f32 / rings as f32;
        for si in 0..segs {
            let a = std::f32::consts::TAU * si as f32 / segs as f32;
            let q = c + vec2(a.cos(), a.sin()) * rr;
            m.colored_vertex(q, color(q));
        }
    }
    let v = |ri: u32, si: u32| 1 + (ri - 1) * segs + si % segs;
    for si in 0..segs {
        m.add_triangle(0, v(1, si), v(1, si + 1));
    }
    for ri in 2..=rings as u32 {
        for si in 0..segs {
            m.add_triangle(v(ri - 1, si), v(ri, si), v(ri, si + 1));
            m.add_triangle(v(ri - 1, si), v(ri, si + 1), v(ri - 1, si + 1));
        }
    }
    p.add(Shape::mesh(m));
}

/// Annular wedges alternating two colours (a knurled edge), `pitch` degrees each.
pub fn knurl(p: &Painter, c: Pos2, r0: f32, r1: f32, pitch: f32, a: Color32, b: Color32) {
    let n = (360.0 / pitch) as usize;
    let mut m = Mesh::default();
    for i in 0..n {
        let (d0, d1) = (i as f32 * pitch, (i + 1) as f32 * pitch);
        let col = if i % 2 == 0 { a } else { b };
        let k = m.vertices.len() as u32;
        for q in [point(c, d0, r0), point(c, d0, r1), point(c, d1, r1), point(c, d1, r0)] {
            m.colored_vertex(q, col);
        }
        m.add_triangle(k, k + 1, k + 2);
        m.add_triangle(k, k + 2, k + 3);
    }
    p.add(Shape::mesh(m));
}

/// Conic sheen over a disc: colour by angle (from 12 o'clock, degrees), constant along each radius.
pub fn conic(p: &Painter, c: Pos2, r: f32, color: impl Fn(f32) -> Color32) {
    let n = 72;
    let mut m = Mesh::default();
    for i in 0..n {
        let (d0, d1) = (360.0 * i as f32 / n as f32, 360.0 * (i + 1) as f32 / n as f32);
        let k = m.vertices.len() as u32;
        m.colored_vertex(c, color((d0 + d1) / 2.0));
        m.colored_vertex(point(c, d0, r), color(d0));
        m.colored_vertex(point(c, d1, r), color(d1));
        m.add_triangle(k, k + 1, k + 2);
    }
    p.add(Shape::mesh(m));
}
