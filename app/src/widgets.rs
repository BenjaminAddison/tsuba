//! Controls from DESIGN.md §5, drawn with the theme primitives. Every control is a real focusable widget: Tab
//! reaches it, Enter/Space presses it, arrow keys step knobs and sliders.

use eframe::egui::{
    self, pos2, vec2, Align2, Id, Key, Pos2, Rect, Response, Sense, Shape, Stroke, StrokeKind, Ui,
};

use crate::theme::*;

fn hit(ui: &Ui, r: Rect, id: Id, sense: Sense) -> Response {
    ui.interact(r, id, sense)
}

/// Secondary button: transparent with a 1px EDGE border that goes INK on hover.
pub fn button(ui: &Ui, r: Rect, id: Id, label: &str) -> Response {
    let resp = hit(ui, r, id, Sense::click());
    let p = ui.painter();
    p.rect_stroke(r, 0.0, Stroke::new(1.0, if resp.hovered() { INK } else { EDGE }), StrokeKind::Inside);
    text(p, r.center(), Align2::CENTER_CENTER, label, F::Exp, 11.0, INK);
    if resp.has_focus() {
        focus_ring(p, r, 0.0);
    }
    resp
}

pub fn disabled_button(ui: &Ui, r: Rect, label: &str) {
    let p = ui.painter();
    dashed_rect(p, r, LINE);
    text(p, r.center(), Align2::CENTER_CENTER, label, F::Exp, 11.0, TEXT_3);
}

/// Primary button: INK fill, 10px cut, optional ▸▸ glyph. One per view.
pub fn primary(ui: &Ui, r: Rect, id: Id, label: &str, arrows: bool) -> Response {
    let resp = hit(ui, r, id, Sense::click());
    let p = ui.painter();
    cut_fill(p, r, 10.0, INK);
    let w = text_w(p, label, F::Exp, 11.0) + if arrows { 26.0 } else { 0.0 };
    let x = r.center().x - w / 2.0;
    text(p, pos2(x, r.center().y), Align2::LEFT_CENTER, label, F::Exp, 11.0, INK_ON);
    if arrows {
        let a = pos2(x + w - 14.0, r.center().y);
        for dx in [0.0, 6.0] {
            let o = a + vec2(dx, 0.0);
            p.add(Shape::convex_polygon(
                vec![o + vec2(0.0, -4.0), o + vec2(6.0, 0.0), o + vec2(0.0, 4.0)],
                INK_ON,
                Stroke::NONE,
            ));
        }
    }
    if resp.has_focus() {
        focus_ring(p, r, 10.0);
    }
    resp
}

/// Selectable block: off = EDGE outline + TEXT_2, on = INK fill + INK_ON. Index left; label right when `spread`,
/// else just after the index.
#[allow(clippy::too_many_arguments)]
pub fn tile(ui: &Ui, r: Rect, id: Id, idx: &str, label: &str, on: bool, cut: f32, spread: bool) -> Response {
    let resp = hit(ui, r, id, Sense::click());
    let p = ui.painter();
    let hover = resp.hovered() && !on;
    if on {
        cut_fill(p, r, cut, INK);
    } else {
        if hover && !spread {
            cut_fill(p, r, cut, RAISED);
        }
        cut_outline(p, r, cut, if hover && spread { INK } else if spread { EDGE } else { LINE });
    }
    let (fg, sub) = if on { (INK_ON, INK_SUB) } else if spread { (TEXT_2, TEXT_3) } else { (INK, TEXT_3) };
    if spread && r.width() < 140.0 {
        // too narrow for index and label: the label wins (same width for the whole row, so the row stays uniform)
        text_max(p, r.center(), Align2::CENTER_CENTER, label, F::Exp, 12.0, fg, r.width() - 12.0);
        if resp.has_focus() {
            focus_ring(p, r, cut);
        }
        return resp;
    }
    let ir = text(p, pos2(r.left() + 10.0, r.center().y), Align2::LEFT_CENTER, idx, F::Mono, 10.0, sub);
    if spread {
        let max = r.right() - cut - 8.0 - ir.right() - 8.0;
        text_max(p, pos2(r.right() - cut - 8.0, r.center().y), Align2::RIGHT_CENTER, label, F::Exp, 12.0, fg, max);
    } else {
        let max = r.right() - ir.right() - 18.0;
        text_max(p, pos2(ir.right() + 10.0, r.center().y), Align2::LEFT_CENTER, label, F::SemiB, 12.0, fg, max);
    }
    if resp.has_focus() {
        focus_ring(p, r, cut);
    }
    resp
}

/// Mouse-wheel notches this frame (up/right positive). Using them stops the page from scrolling too.
pub fn wheel(ui: &Ui) -> i32 {
    let n: i32 = ui.input(|i| {
        i.events.iter().map(|e| match e {
            egui::Event::MouseWheel { delta, .. } => {
                let s = delta.y + delta.x;
                if s > 0.0 { 1 } else if s < 0.0 { -1 } else { 0 }
            }
            _ => 0,
        }).sum()
    });
    if n != 0 {
        ui.ctx().input_mut(|i| i.smooth_scroll_delta = egui::Vec2::ZERO);
    }
    n
}

/// Step a value with the scroll wheel (when hovered) or arrow keys (when focused). Returns the new index.
fn step_input(ui: &Ui, resp: &Response, idx: usize, n: usize) -> usize {
    let mut d: i32 = 0;
    if resp.hovered() {
        d += wheel(ui);
    }
    if resp.has_focus() {
        ui.memory_mut(|m| {
            m.set_focus_lock_filter(
                resp.id,
                egui::EventFilter { horizontal_arrows: true, vertical_arrows: true, ..Default::default() },
            )
        });
        ui.input(|i| {
            d += (i.key_pressed(Key::ArrowUp) || i.key_pressed(Key::ArrowRight)) as i32;
            d -= (i.key_pressed(Key::ArrowDown) || i.key_pressed(Key::ArrowLeft)) as i32;
        });
    }
    (idx as i32 + d).clamp(0, n as i32 - 1) as usize
}

fn knob_point(c: Pos2, r: f32, deg: f32) -> Pos2 {
    let t = deg.to_radians();
    c + vec2(t.sin(), -t.cos()) * r
}

fn arc(c: Pos2, r: f32, from: f32, to: f32) -> Vec<Pos2> {
    let n = ((to - from).abs() / 4.0).ceil().max(1.0) as usize;
    (0..=n).map(|i| knob_point(c, r, from + (to - from) * i as f32 / n as f32)).collect()
}

/// Knob, about 104px: 270° sweep, ticks every 5 (long every 25), value arc, pointer, accent tip; name and 3-digit
/// value under a hairline. Drag vertically (Shift for fine), scroll or arrow keys. Returns the new step index.
pub fn knob(ui: &Ui, top_left: Pos2, id: Id, name: &str, value: &str, idx: usize, n: usize) -> Option<usize> {
    let s = 104.0;
    let r = Rect::from_min_size(top_left, vec2(s, s));
    let resp = hit(ui, r, id, Sense::click_and_drag());
    let mut new = step_input(ui, &resp, idx, n);
    if resp.dragged() {
        let fine = ui.input(|i| i.modifiers.shift);
        let per_px = (n - 1) as f32 / if fine { 1000.0 } else { 200.0 };
        let acc = ui.data_mut(|d| {
            let a = d.get_temp_mut_or(id, 0.0f32);
            *a -= resp.drag_delta().y * per_px;
            let whole = a.trunc();
            *a -= whole;
            whole
        });
        new = (new as i32 + acc as i32).clamp(0, n as i32 - 1) as usize;
    }

    let p = ui.painter();
    let k = s / 100.0;
    let c = r.center();
    for v in (0..=100).step_by(5) {
        let d = -135.0 + 2.7 * v as f32;
        let inner = if v % 25 == 0 { 40.0 } else { 43.5 };
        p.line_segment([knob_point(c, inner * k, d), knob_point(c, 47.0 * k, d)], Stroke::new(1.0, EDGE));
    }
    let frac = if n > 1 { new as f32 / (n - 1) as f32 } else { 0.0 };
    let end = -135.0 + 270.0 * frac;
    p.line(arc(c, 34.0 * k, -135.0, 135.0), Stroke::new(3.0, LINE));
    if frac > 0.0 {
        p.line(arc(c, 34.0 * k, -135.0, end), Stroke::new(3.0, INK));
    }
    p.circle_filled(c, 22.0 * k, BG);
    p.circle_stroke(c, 22.0 * k, Stroke::new(1.0, EDGE));
    p.line_segment([knob_point(c, 8.0 * k, end), knob_point(c, 20.0 * k, end)], Stroke::new(2.0, INK));
    dot(p, knob_point(c, 34.0 * k, end), 6.0, ACCENT);

    let y = r.bottom() + 4.0;
    hline(p, r.left(), r.right(), y, EDGE);
    text(p, pos2(r.left(), y + 8.0), Align2::LEFT_TOP, name, F::Mono, 10.0, TEXT_2);
    text(p, pos2(r.right(), y + 6.0), Align2::RIGHT_TOP, value, F::ExpB, 13.0, INK);
    if resp.has_focus() {
        p.circle_stroke(c, 50.0 * k, Stroke::new(2.0, MUSTARD));
    }
    (new != idx).then_some(new)
}

/// 34×16 switch with a square thumb, labelled ENABLED / BYPASSED to its left. Returns the toggled state.
pub fn switch(ui: &Ui, r: Rect, id: Id, on: bool, enabled: bool) -> Option<bool> {
    let resp = if enabled { Some(hit(ui, r, id, Sense::click())) } else { None };
    let p = ui.painter();
    let fg = if enabled { INK } else { TEXT_3 };
    if enabled {
        p.rect_stroke(r, 0.0, Stroke::new(1.0, if resp.as_ref().is_some_and(|r| r.hovered()) { INK } else { EDGE }), StrokeKind::Inside);
    } else {
        dashed_rect(p, r, LINE);
    }
    let label = if !enabled { "LOCKED" } else if on { "ENABLED" } else { "BYPASSED" };
    text(p, pos2(r.left() + 12.0, r.center().y), Align2::LEFT_CENTER, label, F::Exp, 11.0, fg);
    let sw = Rect::from_center_size(pos2(r.right() - 12.0 - 17.0, r.center().y), vec2(34.0, 16.0));
    p.rect_stroke(sw, 0.0, Stroke::new(1.0, fg), StrokeKind::Inside);
    let tx = if on { sw.right() - 2.0 - 12.0 } else { sw.left() + 2.0 };
    p.rect_filled(Rect::from_min_size(pos2(tx, sw.top() + 3.0), vec2(12.0, 10.0)), 0.0, if on { INK } else { EDGE });
    let resp = resp?;
    if resp.has_focus() {
        focus_ring(p, r, 0.0);
    }
    resp.clicked().then_some(!on)
}

/// Tick slider row (64px: label and value on top, control below): 1px EDGE track, 3px INK fill, ticks every
/// 10%, 8×15 accent thumb. Click or drag to set; scroll or arrows to step. Returns the new step index.
pub fn slider(ui: &Ui, r: Rect, id: Id, name: &str, value: &str, idx: usize, n: usize) -> Option<usize> {
    let p = ui.painter();
    text_max(p, r.left_top(), Align2::LEFT_TOP, name, F::Mono, 10.0, TEXT_2, r.width() * 0.6);
    text(p, r.right_top() + vec2(0.0, -1.0), Align2::RIGHT_TOP, value, F::ExpB, 12.0, INK);
    let ctl = Rect::from_min_max(pos2(r.left(), r.top() + 20.0), r.right_bottom());
    let resp = hit(ui, ctl, id, Sense::click_and_drag());
    let mut new = step_input(ui, &resp, idx, n);
    let (x0, x1) = (ctl.left() + 4.0, ctl.right() - 4.0);
    if let (true, Some(pos)) = (resp.is_pointer_button_down_on(), resp.interact_pointer_pos()) {
        let f = ((pos.x - x0) / (x1 - x0)).clamp(0.0, 1.0);
        new = (f * (n - 1) as f32).round() as usize;
    }
    let frac = if n > 1 { new as f32 / (n - 1) as f32 } else { 0.0 };
    let ty = ctl.top() + 12.0;
    let p = ui.painter();
    hline(p, x0, x1, ty, EDGE);
    p.rect_filled(Rect::from_min_max(pos2(x0, ty - 1.0), pos2(x0 + (x1 - x0) * frac, ty + 2.0)), 0.0, INK);
    for t in 0..=10 {
        let x = x0 + (x1 - x0) * t as f32 / 10.0;
        vline(p, x.floor(), ty + 6.0, ty + 12.0, EDGE);
    }
    let tx = x0 + (x1 - x0) * frac;
    p.rect_filled(Rect::from_center_size(pos2(tx, ty), vec2(8.0, 15.0)), 0.0, ACCENT);
    if resp.has_focus() {
        focus_ring(p, ctl, 0.0);
    }
    (new != idx).then_some(new)
}

/// Segmented enum row (64px): label on top, 44px cells with a 3px gap. Returns the picked index.
pub fn segmented(ui: &Ui, r: Rect, id: Id, name: &str, opts: &[String], sel: usize) -> Option<usize> {
    let p = ui.painter();
    text(p, r.left_top(), Align2::LEFT_TOP, name, F::Mono, 10.0, TEXT_2);
    let n = opts.len() as f32;
    let w = (r.width() - 3.0 * (n - 1.0)) / n;
    let mut picked = None;
    for (i, o) in opts.iter().enumerate() {
        let c = Rect::from_min_size(pos2(r.left() + i as f32 * (w + 3.0), r.top() + 20.0), vec2(w, r.height() - 20.0));
        let resp = hit(ui, c, id.with(i), Sense::click());
        let on = i == sel;
        let p = ui.painter();
        if on {
            p.rect_filled(c, 0.0, INK);
        } else {
            p.rect_stroke(c, 0.0, Stroke::new(1.0, if resp.hovered() { INK } else { EDGE }), StrokeKind::Inside);
        }
        text_max(p, c.center(), Align2::CENTER_CENTER, o, F::Exp, 11.0, if on { INK_ON } else { TEXT_2 }, w - 8.0);
        if resp.has_focus() {
            focus_ring(p, c, 0.0);
        }
        if resp.clicked() && !on {
            picked = Some(i);
        }
    }
    picked
}

/// Dropdown header: 50px BG well, meta label, value, count, and a 50px chevron cap that inverts when open.
pub fn dropdown(ui: &Ui, r: Rect, id: Id, meta: &str, value: &str, count: &str, open: bool) -> Response {
    let resp = hit(ui, r, id, Sense::click());
    let p = ui.painter();
    p.rect_filled(r, 0.0, BG);
    let border = if open || resp.hovered() { INK } else { EDGE };
    p.rect_stroke(r, 0.0, Stroke::new(1.0, border), StrokeKind::Inside);
    let m = text(p, pos2(r.left() + 12.0, r.center().y), Align2::LEFT_CENTER, meta, F::Mono, 10.0, TEXT_3);
    let cap = Rect::from_min_max(pos2(r.right() - 50.0, r.top() + 1.0), r.max - vec2(1.0, 1.0));
    let cr = text(p, pos2(cap.left() - 14.0, r.center().y), Align2::RIGHT_CENTER, count, F::Mono, 10.0, TEXT_2);
    let max = cr.left() - m.right() - 28.0;
    text_max(p, pos2(m.right() + 14.0, r.center().y), Align2::LEFT_CENTER, value, F::Exp, 16.0, INK, max);
    if open {
        p.rect_filled(cap, 0.0, INK);
    }
    vline(p, cap.left() - 1.0, r.top(), r.bottom(), EDGE);
    chevron(p, cap.center(), open, if open { INK_ON } else { INK });
    if resp.has_focus() {
        focus_ring(p, r, 0.0);
    }
    resp
}

/// Option grid under an open dropdown: 44px tiles (index + name) wrapping at `min_w`, in a 1px INK frame.
/// Returns its height and the clicked option.
pub fn option_grid(ui: &Ui, top_left: Pos2, w: f32, id: Id, opts: &[(u32, String)], sel: Option<u32>, min_w: f32) -> (f32, Option<u32>) {
    let inner = w - 20.0;
    let cols = (((inner + 4.0) / (min_w + 4.0)).floor() as usize).max(1);
    let rows = opts.len().div_ceil(cols);
    let h = 20.0 + rows as f32 * 44.0 + rows.saturating_sub(1) as f32 * 4.0;
    let frame = Rect::from_min_size(top_left, vec2(w, h));
    let p = ui.painter();
    p.rect_filled(frame, 0.0, BG);
    p.rect_stroke(frame, 0.0, Stroke::new(1.0, INK), StrokeKind::Inside);
    let tw = (inner - (cols - 1) as f32 * 4.0) / cols as f32;
    let mut picked = None;
    for (i, (raw, name)) in opts.iter().enumerate() {
        let (row, col) = (i / cols, i % cols);
        let r = Rect::from_min_size(top_left + vec2(10.0 + col as f32 * (tw + 4.0), 10.0 + row as f32 * 48.0), vec2(tw, 44.0));
        if tile(ui, r, id.with(i), &format!("{:02}", i + 1), name, sel == Some(*raw), 0.0, false).clicked() {
            picked = Some(*raw);
        }
    }
    (h, picked)
}

/// Single-line text field: BG well, 1px EDGE border, mono text centred vertically.
pub fn text_field(ui: &mut Ui, r: Rect, s: &mut String, hint: &str, size: f32) {
    let p = ui.painter();
    p.rect_filled(r, 0.0, BG);
    p.rect_stroke(r, 0.0, Stroke::new(1.0, EDGE), StrokeKind::Inside);
    let row = Rect::from_center_size(r.center(), vec2(r.width() - 20.0, size + 6.0));
    let edit = egui::TextEdit::singleline(s)
        .frame(egui::Frame::NONE)
        .font(F::Mono.id(size))
        .text_color(INK)
        .hint_text(egui::RichText::new(hint).color(TEXT_2).font(F::Mono.id(size)))
        .margin(vec2(0.0, 0.0))
        .desired_width(row.width());
    ui.put(row, edit);
}

/// On/off cell: INK fill when on, EDGE outline when off, centred label.
pub fn toggle(ui: &Ui, r: Rect, id: Id, label: &str, on: bool) -> Response {
    let resp = hit(ui, r, id, Sense::click());
    let p = ui.painter();
    if on {
        p.rect_filled(r, 0.0, INK);
    } else {
        p.rect_stroke(r, 0.0, Stroke::new(1.0, if resp.hovered() { INK } else { EDGE }), StrokeKind::Inside);
    }
    text_max(p, r.center(), Align2::CENTER_CENTER, label, F::Exp, 11.0, if on { INK_ON } else { TEXT_2 }, r.width() - 8.0);
    if resp.has_focus() {
        focus_ring(p, r, 0.0);
    }
    resp
}
