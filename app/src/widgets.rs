//! The Outboard controls: keycaps with LEDs, machined knobs with memory ticks, faders, steppers, rockers,
//! footswitches, meters and VFD lists. Every control is a real focusable widget: Tab reaches it, Enter/Space
//! presses it, arrow keys step knobs, faders and steppers.

use eframe::egui::{
    self, pos2, vec2, Align2, Color32, Id, Key, Pos2, Rect, Response, Sense, Shape, Stroke, Ui,
};

use crate::theme::*;

fn focus(p: &egui::Painter, r: Rect, rad: f32) {
    p.rect_stroke(r.expand(3.0), rad + 2.0, Stroke::new(2.0, led()), egui::StrokeKind::Middle);
}

#[derive(Clone, Copy, PartialEq)]
pub enum Cap {
    Grey,
    /// Write and Delete only.
    Red,
    /// The one primary action of a view (Apply).
    Amber,
}

/// Draw a keycap. `down` = latched (travels 1.5px); `hover` brightens it.
pub fn keycap(p: &egui::Painter, r: Rect, cap: Cap, down: bool, hover: bool) -> Rect {
    let (top, bot) = match cap {
        Cap::Grey => (KEY_TOP, KEY_BOT),
        Cap::Red => (RED_TOP, RED_BOT),
        Cap::Amber => (mix(led(), Color32::WHITE, 0.15), mix(led(), BLACK, 0.18)),
    };
    let (top, bot) = if hover { (mix(top, Color32::WHITE, 0.08), mix(bot, Color32::WHITE, 0.08)) } else { (top, bot) };
    let r = if down { r.translate(vec2(0.0, 1.5)) } else { r };
    if !down {
        shadow(p, r, 4.0, 3.0, 6.0, rgba(0x000000A8));
        rrect(p, r.translate(vec2(0.0, 2.0)), 4.0, hex_c(0x050505));
    } else {
        rrect(p, r.translate(vec2(0.0, 0.5)), 4.0, hex_c(0x050505));
    }
    vgrad(p, r, 4.0, top, bot);
    if down {
        vstops(p, Rect::from_min_size(r.min + vec2(2.0, 0.0), vec2(r.width() - 4.0, 4.0)), &[(0.0, rgba(0x00000090)), (1.0, rgba(0x00000000))]);
    } else {
        hline(p, r.left() + 3.0, r.right() - 3.0, r.top(), rgba(if cap == Cap::Grey { 0xFFFFFF22 } else { 0xFFFFFF45 }));
        hline(p, r.left() + 3.0, r.right() - 3.0, r.bottom() - 1.0, rgba(0x00000070));
    }
    r
}

const fn hex_c(rgb: u32) -> Color32 {
    Color32::from_rgb((rgb >> 16) as u8, (rgb >> 8) as u8, rgb as u8)
}

fn cap_text(cap: Cap) -> Color32 {
    match cap {
        Cap::Grey => KEY_TEXT,
        Cap::Red => RED_TEXT,
        Cap::Amber => INV_TEXT,
    }
}

/// Keycap with a silk label and an optional LED 5px above it (Some(lit)). Returns the response.
pub fn key(ui: &Ui, r: Rect, id: Id, label: &str, down: bool, led_on: Option<bool>) -> Response {
    key_cap(ui, r, id, label, down, led_on, Cap::Grey)
}

pub fn key_cap(ui: &Ui, r: Rect, id: Id, label: &str, down: bool, led_on: Option<bool>, cap: Cap) -> Response {
    let resp = ui.interact(r, id, Sense::click());
    let p = ui.painter();
    if let Some(on) = led_on {
        led_bar(p, pos2(r.center().x, r.top() - 7.0), on);
    }
    let pressed = down || resp.is_pointer_button_down_on();
    let face = keycap(p, r, cap, pressed, resp.hovered());
    let size = if r.height() < 26.0 { 8.5 } else { 9.5 };
    text_max(p, face.center(), Align2::CENTER_CENTER, &label.to_uppercase(), F::Silk2, size, cap_text(cap), r.width() - 8.0);
    if resp.has_focus() {
        focus(p, r, 4.0);
    }
    resp
}

/// A key that can't be used: flat, dimmed label.
pub fn key_off(ui: &Ui, r: Rect, label: &str) {
    let p = ui.painter();
    rrect(p, r, 4.0, rgba(0x2A2B2E80));
    rrect_stroke(p, r, 4.0, rgba(0xFFFFFF10));
    text_max(p, r.center(), Align2::CENTER_CENTER, &label.to_uppercase(), F::Silk2, 9.0, SILK3, r.width() - 8.0);
}

/// Icon keys: the glyph is drawn by `icon` in the face rect.
pub fn icon_key(ui: &Ui, r: Rect, id: Id, tip: &str, icon: impl Fn(&egui::Painter, Rect, Color32)) -> Response {
    let resp = ui.interact(r, id, Sense::click());
    let p = ui.painter();
    let face = keycap(p, r, Cap::Grey, resp.is_pointer_button_down_on(), resp.hovered());
    icon(p, face, KEY_TEXT);
    if resp.has_focus() {
        focus(p, r, 4.0);
    }
    resp.on_hover_text(tip)
}

pub fn tri(p: &egui::Painter, c: Pos2, left: bool, color: Color32) {
    let pts = if left {
        vec![c + vec2(3.5, -4.5), c + vec2(3.5, 4.5), c + vec2(-3.5, 0.0)]
    } else {
        vec![c + vec2(-3.5, -4.5), c + vec2(3.5, 0.0), c + vec2(-3.5, 4.5)]
    };
    p.add(Shape::convex_polygon(pts, color, Stroke::NONE));
}

pub fn icon_revert(p: &egui::Painter, r: Rect, c: Color32) {
    let o = r.center();
    let s = Stroke::new(1.7, c);
    let arc: Vec<Pos2> = (0..=20).map(|i| {
        let a = (200.0 + 250.0 * i as f32 / 20.0f32).to_radians();
        o + vec2(a.cos(), a.sin()) * 5.0
    }).collect();
    p.line(arc.clone(), s);
    let a0 = arc[0];
    p.line(vec![a0 + vec2(0.0, -3.5), a0, a0 + vec2(3.5, 0.0)], s);
}

// --- input helpers ----------------------------------------------------------------------------------------------

/// Mouse-wheel notches this frame (up/right positive). Using them stops the page from scrolling too.
pub fn wheel(ui: &Ui) -> i32 {
    let n: i32 = ui.input(|i| {
        i.events
            .iter()
            .map(|e| match e {
                egui::Event::MouseWheel { delta, .. } => {
                    let s = delta.y + delta.x;
                    if s > 0.0 { 1 } else if s < 0.0 { -1 } else { 0 }
                }
                _ => 0,
            })
            .sum()
    });
    if n != 0 {
        ui.ctx().input_mut(|i| i.smooth_scroll_delta = egui::Vec2::ZERO);
    }
    n
}

/// Step with the wheel (hovered) or arrows (focused; Shift = 10). Returns the new index.
pub fn step_input(ui: &Ui, resp: &Response, idx: usize, n: usize) -> usize {
    let mut d: i32 = 0;
    if resp.hovered() {
        d += wheel(ui);
    }
    if resp.has_focus() {
        ui.memory_mut(|m| {
            m.set_focus_lock_filter(resp.id, egui::EventFilter { horizontal_arrows: true, vertical_arrows: true, ..Default::default() })
        });
        ui.input(|i| {
            let k = if i.modifiers.shift { 10 } else { 1 };
            d += k * (i.key_pressed(Key::ArrowUp) || i.key_pressed(Key::ArrowRight)) as i32;
            d -= k * (i.key_pressed(Key::ArrowDown) || i.key_pressed(Key::ArrowLeft)) as i32;
        });
    }
    (idx as i32 + d).clamp(0, n as i32 - 1) as usize
}

/// Vertical drag on `resp` in steps: `full` px per whole range (Shift: 4× finer).
pub fn drag_steps(ui: &Ui, resp: &Response, id: Id, idx: usize, n: usize, full: f32) -> usize {
    if !resp.dragged() || n < 2 {
        return idx;
    }
    let fine = ui.input(|i| i.modifiers.shift);
    let per_px = (n - 1) as f32 / if fine { full * 4.0 } else { full };
    let dy = resp.drag_delta().y; // read before taking the data lock: it reads input
    let whole = ui.data_mut(|d| {
        let a = d.get_temp_mut_or(id, 0.0f32);
        *a -= dy * per_px;
        let w = a.trunc();
        *a -= w;
        w
    });
    (idx as i32 + whole as i32).clamp(0, n as i32 - 1) as usize
}

// --- knob -------------------------------------------------------------------------------------------------------

#[derive(Clone, Copy, PartialEq)]
pub enum Size {
    /// 92px: gain and volume, with numbers 0–10 and minor ticks.
    L,
    /// 74px: tone knobs, numbers at 0 and 10.
    M,
    /// 64px: effect parameters.
    E,
    /// 42px: trims.
    S,
}

impl Size {
    pub fn box_px(self) -> f32 {
        match self {
            Size::L => 92.0,
            Size::M => 74.0,
            Size::E => 64.0,
            Size::S => 42.0,
        }
    }
}

fn ang(f: f32) -> f32 {
    -135.0 + 270.0 * f
}

/// Machined knob in a `size` box at `o` (top-left). `mem` is the stored value: when it differs, an LED tick marks
/// it and double-click recalls it. Drag up/down (Shift fine), scroll, or arrows. Returns the new step.
#[allow(clippy::too_many_arguments)]
pub fn knob(ui: &Ui, o: Pos2, id: Id, size: Size, idx: usize, n: usize, mem: Option<usize>, enabled: bool) -> (Option<usize>, Response) {
    let b = size.box_px();
    let bx = Rect::from_min_size(o, vec2(b, b));
    let inset = match size {
        Size::L => 0.20,
        Size::M => 0.19,
        Size::E => 0.19,
        Size::S => 0.15,
    };
    let skirt = bx.shrink(b * inset);
    let resp = ui.interact(skirt.expand(4.0), id, if enabled { Sense::click_and_drag() } else { Sense::hover() });
    let mut new = idx;
    if enabled {
        new = step_input(ui, &resp, idx, n);
        new = drag_steps(ui, &resp, id, new, n, 220.0);
        if resp.double_clicked() {
            if let Some(m) = mem {
                new = m;
            }
        }
    }
    let p = ui.painter();
    let c = bx.center();
    let k = b / 100.0;
    let (r0, r1) = match size {
        Size::L => (37.0, 42.0),
        Size::M | Size::E => (38.0, 44.0),
        Size::S => (41.0, 48.0),
    };
    let tick = if size == Size::S { 2.0 } else { 1.3 };
    for i in 0..=10 {
        let a = ang(i as f32 / 10.0);
        p.line_segment([point(c, a, r0 * k), point(c, a, r1 * k)], Stroke::new(tick * k.max(0.7), rgba(0xE8E4DCB8)));
    }
    if size == Size::L {
        for i in 0..=9 {
            let a = -121.5 + 27.0 * i as f32;
            p.line_segment([point(c, a, (r0 + 2.0) * k), point(c, a, (r1 - 0.5) * k)], Stroke::new(0.9, rgba(0xE8E4DC66)));
        }
        for v in [0, 2, 4, 6, 8, 10] {
            text(p, point(c, -135.0 + 27.0 * v as f32, 50.0 * k + 2.0), Align2::CENTER_CENTER, &v.to_string(), F::Silk2, 7.5, rgba(0xE8E4DC99));
        }
    } else if size == Size::M {
        for v in [0, 10] {
            text(p, point(c, -135.0 + 27.0 * v as f32, 51.0 * k + 2.0), Align2::CENTER_CENTER, &v.to_string(), F::Silk2, 7.5, rgba(0xE8E4DC99));
        }
    }
    let frac = |i: usize| if n > 1 { i as f32 / (n - 1) as f32 } else { 0.0 };
    if let Some(m) = mem.filter(|&m| m != new) {
        let a = ang(frac(m));
        let (q0, q1) = (point(c, a, (r0 - 3.0) * k), point(c, a, (r1 + 1.0) * k));
        p.line_segment([q0, q1], Stroke::new(4.5 * k.max(0.6), alpha(led(), 0.35)));
        p.line_segment([q0, q1], Stroke::new(2.4 * k.max(0.6), led()));
    }
    // skirt, knurl, cap, pointer
    let rs = skirt.width() / 2.0;
    let sh = match size {
        Size::L => (7.0, 12.0),
        Size::S => (4.0, 7.0),
        _ => (6.0, 10.0),
    };
    shadow(p, skirt, rs, sh.0, sh.1, rgba(0x000000B8));
    p.circle_filled(c + vec2(0.0, 1.0), rs, rgba(0x000000C0));
    radial_disc(p, c, rs, pos2(c.x, c.y - rs * 0.4), rs * 1.45, &[(0.0, hex_c(0xF6F4F0)), (0.58, hex_c(0xB6B2AB)), (1.0, hex_c(0x6C6862))]);
    knurl(p, c, rs * 0.84, rs, 3.0, rgba(0x00000038), rgba(0xFFFFFF16));
    let rc = rs * (1.0 - 2.0 * 0.12 / (1.0 - 2.0 * inset).max(0.3)).max(0.6);
    p.circle_filled(c, rc, hex_c(0xD1CDC6));
    let mut ring = rc - 0.75;
    while ring > 1.0 {
        p.circle_stroke(c, ring, Stroke::new(0.6, rgba(0xC6C2BB90)));
        ring -= 1.5;
    }
    conic(p, c, rc, |d| {
        let t = ((d - 25.0).rem_euclid(180.0)) / 90.0; // 0 at 25°, 1 at 115°, 2 at 205°
        let w = if t <= 1.0 { 1.0 - t } else { t - 1.0 };
        lerp_c(rgba(0x00000026), rgba(0xFFFFFF5A), w)
    });
    p.circle_stroke(c, rc, Stroke::new(0.8, rgba(0xFFFFFF60)));
    let a = ang(frac(new));
    p.line_segment([point(c, a, rs * 0.86), point(c, a, rs * 0.14)], Stroke::new(2.5 * (rs / 30.0).clamp(0.6, 1.2), hex_c(0x141414)));
    p.circle_filled(point(c, a, rs * 0.94), 2.0 * (rs / 30.0).clamp(0.7, 1.0), hex_c(0xFBFAF6));
    if resp.has_focus() {
        p.circle_stroke(c, rs + 4.0, Stroke::new(2.0, led()));
    }
    ((new != idx).then_some(new), resp)
}

/// Label row under a knob: LED dot (lit when edited) and silk name, then the value (lit when edited).
pub fn knob_label(p: &egui::Painter, c: Pos2, name: &str, value: &str, edited: bool, max_w: f32) {
    let up = name.to_uppercase();
    let (f, size) = if text_w(p, &up, F::Silk, 10.0) + 11.0 <= max_w { (F::Silk, 10.0) } else { (F::Silk2, 8.5) };
    let w = text_w(p, &up, f, size).min(max_w - 11.0);
    let x = c.x - (w + 11.0) / 2.0;
    led_dot(p, pos2(x + 2.5, c.y), 5.0, edited);
    text_max(p, pos2(x + 11.0, c.y + 1.0), Align2::LEFT_CENTER, &up, f, size, rgba(0x000000B0), max_w - 11.0);
    text_max(p, pos2(x + 11.0, c.y), Align2::LEFT_CENTER, &up, f, size, SILK, max_w - 11.0);
    let vy = c.y + 16.0;
    if edited {
        glow_text(p, pos2(c.x, vy), Align2::CENTER_CENTER, value, F::Mono, 10.5, f32::INFINITY, lit(), 0.14);
    } else {
        text(p, pos2(c.x, vy), Align2::CENTER_CENTER, value, F::Mono, 10.5, SILK2);
    }
}

// --- fader ------------------------------------------------------------------------------------------------------

/// Vertical fader in `r` (track down the middle, ticks either side, a cap). Returns the new step.
pub fn fader(ui: &Ui, r: Rect, id: Id, idx: usize, n: usize, mem: Option<usize>) -> Option<usize> {
    let resp = ui.interact(r, id, Sense::click_and_drag());
    let mut new = step_input(ui, &resp, idx, n);
    let (y0, y1) = (r.top() + 10.0, r.bottom() - 10.0);
    if let (true, Some(pt)) = (resp.is_pointer_button_down_on(), resp.interact_pointer_pos()) {
        if !resp.dragged() || resp.drag_started() {
            let f = ((y1 - pt.y) / (y1 - y0)).clamp(0.0, 1.0);
            new = (f * (n - 1) as f32).round() as usize;
        } else {
            new = drag_steps(ui, &resp, id, new, n, y1 - y0);
        }
    }
    if resp.double_clicked() {
        if let Some(m) = mem {
            new = m;
        }
    }
    let p = ui.painter();
    let cx = r.center().x;
    for i in 0..=10 {
        let y = y1 - (y1 - y0) * i as f32 / 10.0;
        let w = if i % 5 == 0 { 7.0 } else { 4.0 };
        hline(p, cx - 9.0 - w, cx - 9.0, y.round(), rgba(0xE8E4DC66));
        hline(p, cx + 9.0, cx + 9.0 + w, y.round(), rgba(0xE8E4DC66));
    }
    let slot = Rect::from_min_max(pos2(cx - 2.5, y0 - 4.0), pos2(cx + 2.5, y1 + 4.0));
    rrect(p, slot, 2.5, hex_c(0x050506));
    hline(p, slot.left(), slot.right(), slot.bottom(), rgba(0xFFFFFF14));
    let f = if n > 1 { new as f32 / (n - 1) as f32 } else { 0.0 };
    if let Some(m) = mem.filter(|&m| m != new) {
        let my = y1 - (y1 - y0) * (m as f32 / (n - 1).max(1) as f32);
        p.line_segment([pos2(cx + 9.0, my), pos2(cx + 18.0, my)], Stroke::new(2.4, led()));
    }
    let cy = y1 - (y1 - y0) * f;
    let cap = Rect::from_center_size(pos2(cx, cy), vec2(30.0, 14.0));
    shadow(p, cap, 2.0, 3.0, 5.0, rgba(0x000000C0));
    vgrad(p, cap, 2.0, hex_c(0x5A5B5E), hex_c(0x2A2B2E));
    hline(p, cap.left() + 2.0, cap.right() - 2.0, cap.top(), rgba(0xFFFFFF30));
    hline(p, cap.left() + 3.0, cap.right() - 3.0, cy.round(), hex_c(0xE8E4DC));
    if resp.has_focus() {
        focus(p, cap, 2.0);
    }
    (new != idx).then_some(new)
}

// --- stepper, rocker, segments ----------------------------------------------------------------------------------

/// ◀ [VFD value] ▶. Returns (step, clicked the value).
pub fn stepper(ui: &Ui, r: Rect, id: Id, value: &str) -> (i32, bool) {
    let kw = 26.0;
    let mut step = 0;
    let lr = Rect::from_min_size(r.min, vec2(kw, r.height()));
    let rr = Rect::from_min_size(pos2(r.right() - kw, r.top()), vec2(kw, r.height()));
    if icon_key(ui, lr, id.with("prev"), "Previous", |p, f, c| tri(p, f.center(), true, c)).clicked() {
        step = -1;
    }
    if icon_key(ui, rr, id.with("next"), "Next", |p, f, c| tri(p, f.center(), false, c)).clicked() {
        step = 1;
    }
    let mid = Rect::from_min_max(pos2(lr.right() + 6.0, r.top() - 2.0), pos2(rr.left() - 6.0, r.bottom() + 2.0));
    let resp = ui.interact(mid, id.with("val"), Sense::click());
    let g = glass(ui, mid);
    vfd_max(ui.painter(), pos2(g.left() + 8.0, g.center().y), Align2::LEFT_CENTER, value, F::MonoB, 12.0, g.width() - 16.0);
    if resp.hovered() {
        rrect_stroke(ui.painter(), mid, 5.0, alpha(led(), 0.35));
    }
    if resp.has_focus() {
        focus(ui.painter(), mid, 5.0);
    }
    if resp.has_focus() {
        ui.input(|i| {
            if i.key_pressed(Key::ArrowLeft) {
                step = -1;
            }
            if i.key_pressed(Key::ArrowRight) {
                step = 1;
            }
        });
    }
    if resp.hovered() {
        step += wheel(ui).signum();
    }
    (step, resp.clicked())
}

/// I/O rocker (a block's master switch). Returns the toggled state.
pub fn rocker(ui: &Ui, r: Rect, id: Id, on: bool, enabled: bool) -> Option<bool> {
    let resp = ui.interact(r, id, if enabled { Sense::click() } else { Sense::hover() });
    let p = ui.painter();
    rrect(p, r, 3.0, hex_c(0x050506));
    rrect_stroke(p, r, 3.0, rgba(0xFFFFFF18));
    let half = r.width() / 2.0;
    let (i_r, o_r) = (
        Rect::from_min_size(r.min + vec2(2.0, 2.0), vec2(half - 2.0, r.height() - 4.0)),
        Rect::from_min_size(pos2(r.center().x, r.top() + 2.0), vec2(half - 2.0, r.height() - 4.0)),
    );
    let pressed = if on { i_r } else { o_r };
    let raised = if on { o_r } else { i_r };
    vgrad(p, raised, 2.0, hex_c(0x4A4B4E), hex_c(0x2E2F32));
    vgrad(p, pressed, 2.0, hex_c(0x202124), hex_c(0x2A2B2E));
    let ic = if enabled { KEY_TEXT } else { SILK3 };
    p.line_segment([i_r.center() - vec2(0.0, 3.5), i_r.center() + vec2(0.0, 3.5)], Stroke::new(1.5, if on && enabled { lit() } else { ic }));
    p.circle_stroke(o_r.center(), 3.5, Stroke::new(1.3, ic));
    if resp.has_focus() {
        focus(p, r, 3.0);
    }
    (enabled && resp.clicked()).then_some(!on)
}

/// Row of lamp segments (a level). `lit` from 0..n, optional `peak` segment drawn white-hot.
pub fn segments(p: &egui::Painter, r: Rect, n: usize, lit_n: usize, peak: Option<usize>) {
    let gap = 2.0;
    let w = (r.width() - gap * (n - 1) as f32) / n as f32;
    for i in 0..n {
        let s = Rect::from_min_size(pos2(r.left() + i as f32 * (w + gap), r.top()), vec2(w, r.height()));
        if peak == Some(i) {
            glow(p, s, 1.0, 6.0, alpha(Color32::WHITE, 0.5));
            rrect(p, s, 1.0, hex_c(0xFFF6E2));
        } else {
            led_rect(p, s, 1.0, i < lit_n);
        }
    }
}

/// Bipolar or unipolar value as 10 VFD segments (palette rows, library knob bars).
pub fn vfd_bar(p: &egui::Painter, r: Rect, frac: f32, bipolar: bool, inverted: bool) {
    let n = 10;
    let gap = 2.0;
    let w = (r.width() - gap * (n - 1) as f32) / n as f32;
    let (lo, hi) = if bipolar { (frac.min(0.5), frac.max(0.5)) } else { (0.0, frac) };
    for k in 0..n {
        let mid = (k as f32 + 0.5) / n as f32;
        let on = mid >= lo && mid <= hi && !(bipolar && (frac - 0.5).abs() < 0.03);
        let s = Rect::from_min_size(pos2(r.left() + k as f32 * (w + gap), r.top()), vec2(w, r.height()));
        if inverted {
            rrect(p, s, 1.0, if on { INV_TEXT } else { rgba(0x170D0224) });
        } else if on {
            glow(p, s, 1.0, 5.0, alpha(led(), 0.45));
            rrect(p, s, 1.0, lit());
        } else {
            rrect(p, s, 1.0, mix(hex_c(0x0B0704), led(), 0.16));
        }
    }
}

// --- VFD text field and lists -----------------------------------------------------------------------------------

/// Single-line input on glass. Returns the response (lost_focus + Enter = submit).
pub fn vfd_field(ui: &mut Ui, r: Rect, s: &mut String, hint: &str, prefix: &str, size: f32) -> egui::Response {
    let g = glass(ui, r);
    let mut x = g.left() + 10.0;
    if !prefix.is_empty() {
        let pr = vfd(ui.painter(), pos2(x, g.center().y), Align2::LEFT_CENTER, prefix, F::MonoB, size - 1.0);
        x = pr.right() + 8.0;
    }
    let row = Rect::from_min_max(pos2(x, g.center().y - size * 0.75), pos2(g.right() - 8.0, g.center().y + size * 0.75));
    let edit = egui::TextEdit::singleline(s)
        .frame(egui::Frame::NONE)
        .font(F::Mono.id(size))
        .text_color(lit())
        .hint_text(egui::RichText::new(hint).color(mix(hex_c(0x0B0704), led(), 0.4)).font(F::Mono.id(size)))
        .margin(vec2(0.0, 0.0))
        .desired_width(row.width());
    ui.put(row, edit)
}

/// One selectable VFD row (inverted when selected, a faint lamp wash on hover). Returns the response.
pub fn vfd_row(ui: &Ui, r: Rect, id: Id, selected: bool) -> Response {
    let resp = ui.interact(r, id, Sense::click());
    let p = ui.painter();
    if selected {
        glow(p, r, 0.0, 10.0, alpha(led(), 0.25));
        p.rect_filled(r, 0.0, inv());
    } else if resp.hovered() {
        p.rect_filled(r, 0.0, alpha(led(), 0.10));
    }
    if resp.has_focus() {
        p.rect_stroke(r, 0.0, Stroke::new(1.5, led()), egui::StrokeKind::Inside);
    }
    resp
}

/// Text on a VFD row: inverted ink when selected, lit (with glow) otherwise, `dim` for secondary.
#[allow(clippy::too_many_arguments)]
pub fn row_text(p: &egui::Painter, pos: Pos2, align: Align2, s: &str, size: f32, sel: bool, dimmed: bool, max_w: f32) -> Rect {
    if sel {
        text_max(p, pos, align, s, F::Mono, size, if dimmed { rgba(0x170D02A0) } else { INV_TEXT }, max_w)
    } else if dimmed {
        text_max(p, pos, align, s, F::Mono, size, mix(lit(), hex_c(0x050302), 0.45), max_w)
    } else {
        glow_text(p, pos, align, s, F::Mono, size, max_w, lit(), 0.10)
    }
}

/// Option picker shown over everything (a model or type list): a glass panel of rows in columns.
/// Returns Some(Some(i)) when picked, Some(None) when dismissed.
pub fn option_popup(ui: &Ui, id: Id, anchor: Rect, opts: &[String], sel: Option<usize>, col_w: f32) -> Option<Option<usize>> {
    let ctx = ui.ctx().clone();
    let screen = ctx.content_rect();
    let cols = ((screen.width() - 80.0) / col_w).floor().clamp(1.0, 4.0) as usize;
    let cols = cols.min(opts.len().div_ceil(8)).max(1);
    let rows = opts.len().div_ceil(cols);
    let (w, h) = (cols as f32 * col_w + 24.0, rows as f32 * 26.0 + 24.0);
    let mut pos = pos2(anchor.left(), anchor.bottom() + 6.0);
    pos.x = pos.x.min(screen.right() - w - 12.0).max(screen.left() + 12.0);
    if pos.y + h > screen.bottom() - 12.0 {
        pos.y = (anchor.top() - 6.0 - h).max(screen.top() + 12.0);
    }
    let mut out = None;
    egui::Area::new(id).order(egui::Order::Foreground).fixed_pos(pos).show(&ctx, |ui| {
        let r = Rect::from_min_size(pos, vec2(w, h));
        ui.allocate_rect(r, Sense::hover());
        shadow(ui.painter(), r, 5.0, 14.0, 30.0, rgba(0x000000E0));
        let g = glass(ui, r);
        for (i, o) in opts.iter().enumerate() {
            let (c, rw) = (i / rows, i % rows);
            let row = Rect::from_min_size(pos2(g.left() + 7.0 + c as f32 * col_w, g.top() + 7.0 + rw as f32 * 26.0), vec2(col_w - 4.0, 24.0));
            let on = sel == Some(i);
            let resp = vfd_row(ui, row, id.with(i), on);
            let p = ui.painter();
            row_text(p, pos2(row.left() + 8.0, row.center().y), Align2::LEFT_CENTER, &format!("{:02}", i + 1), 10.0, on, true, 30.0);
            row_text(p, pos2(row.left() + 36.0, row.center().y), Align2::LEFT_CENTER, &o.to_uppercase(), 11.5, on, false, col_w - 48.0);
            if resp.clicked() {
                out = Some(Some(i));
            }
        }
        let hovered = ui.rect_contains_pointer(r);
        let clicked_out = ctx.input(|i| i.pointer.any_pressed()) && !hovered && !ui.ctx().rect_contains_pointer(ui.layer_id(), anchor);
        if out.is_none() && (clicked_out || ctx.input(|i| i.key_pressed(Key::Escape))) {
            out = Some(None);
        }
    });
    out
}

// --- meters and hardware ----------------------------------------------------------------------------------------

/// Cream VU meter with a needle at `frac` (0–1), scale 0–10, the top fifth red.
pub fn vu(p: &egui::Painter, r: Rect, frac: f32, title: &str, sub: &str) {
    rrect(p, r, 4.0, hex_c(0x0A0A0B));
    let face = r.shrink(5.0);
    vgrad(p, face, 2.0, METER_FACE, hex_c(0xE6CF98));
    let piv = pos2(face.center().x, face.bottom() + face.height() * 0.15);
    let rad = face.height() * 0.95;
    let a = |f: f32| -50.0 + 100.0 * f;
    let arc: Vec<Pos2> = (0..=40).map(|i| point(piv, a(i as f32 / 40.0), rad * 0.78)).collect();
    p.line(arc, Stroke::new(1.0, hex_c(0x2A2620)));
    let red: Vec<Pos2> = (0..=10).map(|i| point(piv, a(0.8 + 0.2 * i as f32 / 10.0), rad * 0.80)).collect();
    p.line(red, Stroke::new(4.0, hex_c(0xC8402A)));
    for i in 0..=10 {
        let ang = a(i as f32 / 10.0);
        let long = i % 2 == 0;
        p.line_segment([point(piv, ang, rad * 0.78), point(piv, ang, rad * if long { 0.86 } else { 0.83 })], Stroke::new(1.0, hex_c(0x2A2620)));
        if long {
            text(p, point(piv, ang, rad * 0.94), Align2::CENTER_CENTER, &i.to_string(), F::Silk2, 8.5, hex_c(0x2A2620));
        }
    }
    text(p, pos2(face.center().x, face.top() + face.height() * 0.62), Align2::CENTER_CENTER, title, F::Silk, 10.0, hex_c(0x2A2620));
    text(p, pos2(face.center().x, face.top() + face.height() * 0.62 + 13.0), Align2::CENTER_CENTER, sub, F::Silk2, 7.0, hex_c(0x5A5040));
    let clip = p.with_clip_rect(face.intersect(p.clip_rect()));
    let na = a(frac.clamp(0.0, 1.05));
    clip.line_segment([piv + vec2(1.5, 1.5), point(piv, na, rad * 0.9) + vec2(1.5, 1.5)], Stroke::new(2.4, rgba(0x00000030)));
    clip.line_segment([piv, point(piv, na, rad * 0.9)], Stroke::new(1.5, hex_c(0x151515)));
    clip.circle_filled(pos2(piv.x, face.bottom()), 9.0, hex_c(0x1A1A1A));
    // glass reflection
    vstops(p, Rect::from_min_size(face.min, vec2(face.width(), face.height() * 0.4)), &[(0.0, rgba(0xFFFFFF30)), (1.0, rgba(0xFFFFFF00))]);
}

/// Footswitch: hex nut, chrome cap, LED above. Returns the response.
pub fn footswitch(ui: &Ui, c: Pos2, id: Id, on: bool, enabled: bool) -> Response {
    let resp = ui.interact(Rect::from_center_size(c, vec2(48.0, 48.0)), id, if enabled { Sense::click() } else { Sense::hover() });
    let p = ui.painter();
    led_dot(p, c - vec2(0.0, 31.0), 5.0, on);
    let hexr = 21.0;
    let pts: Vec<Pos2> = (0..6).map(|i| point(c, 30.0 + 60.0 * i as f32, hexr)).collect();
    shadow(p, Rect::from_center_size(c, vec2(36.0, 36.0)), 18.0, 5.0, 8.0, rgba(0x000000B0));
    grad_poly(p, &pts, |q| {
        let t = ((q.y - (c.y - hexr)) / (2.0 * hexr)).clamp(0.0, 1.0);
        lerp_c(hex_c(0xC9C6C0), hex_c(0x5E5B56), t)
    });
    p.add(Shape::closed_line(pts, Stroke::new(1.0, rgba(0x00000080))));
    let pressed = resp.is_pointer_button_down_on();
    let cr = if pressed { 11.5 } else { 12.5 };
    radial_disc(p, c, cr, c + vec2(-3.0, -4.0), cr * 1.7, &[(0.0, hex_c(0xFFFFFF)), (0.45, hex_c(0xBDBAB4)), (1.0, hex_c(0x4A4844))]);
    p.circle_stroke(c, cr, Stroke::new(0.8, rgba(0x00000090)));
    if resp.has_focus() {
        p.circle_stroke(c, hexr + 3.0, Stroke::new(2.0, led()));
    }
    resp
}

/// Delete under a flip cover: the first click lifts the cover (armed), the second deletes. Returns true on delete.
pub fn covered_key(ui: &Ui, r: Rect, id: Id, label: &str, enabled: bool) -> bool {
    let armed_id = id.with("armed");
    let armed: bool = ui.data(|d| d.get_temp(armed_id).unwrap_or(false));
    let resp = ui.interact(r.expand2(vec2(0.0, 8.0)), id, if enabled { Sense::click() } else { Sense::hover() });
    let p = ui.painter();
    let mut fire = false;
    if armed {
        let k = keycap(p, r, Cap::Red, resp.is_pointer_button_down_on(), resp.hovered());
        text(p, k.center(), Align2::CENTER_CENTER, &label.to_uppercase(), F::Silk2, 9.5, RED_TEXT);
        // the lifted cover above
        let cover = Rect::from_min_max(pos2(r.left() - 4.0, r.top() - 16.0), pos2(r.right() + 4.0, r.top() - 4.0));
        let pts = vec![cover.left_top(), cover.right_top(), pos2(cover.right() - 8.0, cover.bottom()), pos2(cover.left() + 8.0, cover.bottom())];
        grad_poly(p, &pts, |q| lerp_c(hex_c(0xE0603A), hex_c(0x8A2E18), ((q.y - cover.top()) / cover.height()).clamp(0.0, 1.0)));
        if resp.clicked() {
            fire = true;
            ui.data_mut(|d| d.insert_temp(armed_id, false));
        }
        if !resp.hovered() && ui.input(|i| i.pointer.any_pressed()) {
            ui.data_mut(|d| d.insert_temp(armed_id, false));
        }
    } else {
        // closed: translucent red cover over the key
        let k = keycap(p, r, Cap::Red, false, false);
        text(p, k.center(), Align2::CENTER_CENTER, &label.to_uppercase(), F::Silk2, 9.5, rgba(0xFFF4EA50));
        let cover = r.expand2(vec2(4.0, 4.0));
        rrect(p, cover, 5.0, rgba(0xC0402260));
        rrect_stroke(p, cover, 5.0, rgba(0xFF8A6A80));
        hline(p, cover.left() + 4.0, cover.right() - 4.0, cover.top() + 2.0, rgba(0xFFFFFF40));
        rrect(p, Rect::from_center_size(pos2(r.center().x, cover.bottom() + 2.0), vec2(26.0, 6.0)), 2.0, hex_c(0xA63A20));
        if enabled && resp.clicked() {
            ui.data_mut(|d| d.insert_temp(armed_id, true));
        }
    }
    if resp.has_focus() {
        focus(p, r, 4.0);
    }
    fire
}
