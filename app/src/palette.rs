//! The command palette (Ctrl+K): find any parameter and nudge it with ← →, or type a command in the CLI's syntax
//! (`set "DELAY: F.BACK" 38`, `select A:CH1`, `write` …).

use eframe::egui::{self, pos2, vec2, Align2, Id, Key, Modifiers, Rect, Sense, Ui};
use katana::catalog::Param;

use crate::chain;
use crate::editor::QUICK;
use crate::graph;
use crate::theme::*;
use crate::widgets::*;
use crate::{choose_lamp, display, App, Tab, CHANNELS, TABS};

#[derive(Default)]
pub struct State {
    pub open: bool,
    q: String,
    sel: usize,
    fresh: bool,
}

impl State {
    pub fn toggle(&mut self) {
        self.open = !self.open;
        self.fresh = self.open;
        self.sel = 0;
    }

    pub fn open_with(&mut self, q: &str) {
        self.open = true;
        self.fresh = true;
        self.q = q.into();
        self.sel = 0;
    }
}

/// verb, arguments, what it does
const CMDS: [(&str, &str, &str); 22] = [
    ("set", "\"BLOCK: PARAM\" VALUE", "any parameter by name"),
    ("get", "\"BLOCK: PARAM\"", "show a parameter's value"),
    ("amp gain", "0-120", "the preamp gain"),
    ("amp model", "NAME|0-25", "one of 26 amp models"),
    ("amp quick", "acoustic|clean|crunch|lead|brown", "panel voicing"),
    ("select", "PANEL|A:CH1|A:CH2|B:CH1|B:CH2", "switch channel"),
    ("write", "", "store the edit buffer"),
    ("revert", "", "drop unsaved edits"),
    ("diff", "", "list unsaved edits"),
    ("name", "\"TEXT\"", "rename the patch, 16 chars"),
    ("block", "BLOCK on|off", "engage or bypass a block"),
    ("chain move", "BLOCK POSITION", "reorder the signal path"),
    ("eq band", "1-10 -12..12", "GE-10 band gain"),
    ("tone apply", "NAME", "load a tone file"),
    ("tone save", "", "save the buffer as a tone"),
    ("assign", "\"BLOCK: PARAM\"", "point a free assign at it"),
    ("read", "ADDRESS SIZE", "RQ1 memory read"),
    ("lamp", "mustard|coral|sage|steel|sand", "lamp colour"),
    ("tab", "editor|effects|control|library|monitor", "go to a view"),
    ("params", "[FILTER]", "list parameters"),
    ("locked", "", "list fixed parameters"),
    ("help", "", "all commands"),
];

/// Split on spaces, keeping "quoted strings" whole.
fn words(s: &str) -> Vec<String> {
    let mut out = vec![];
    let mut cur = String::new();
    let mut quoted = false;
    for c in s.chars() {
        match c {
            '"' => {
                if quoted {
                    out.push(std::mem::take(&mut cur));
                }
                quoted = !quoted;
            }
            ' ' if !quoted => {
                if !cur.is_empty() {
                    out.push(std::mem::take(&mut cur));
                }
            }
            c => cur.push(c),
        }
    }
    if !cur.is_empty() {
        out.push(cur);
    }
    out
}

fn find_param(app: &App, name: &str) -> Option<&'static Param> {
    let cat: &'static katana::Catalog = app.cat;
    cat.get(name).or_else(|| cat.params.iter().find(|p| p.name.eq_ignore_ascii_case(name)))
}

fn find_block(name: &str) -> Option<u8> {
    let n = name.to_uppercase();
    (0..20u8).find(|&id| {
        let (s, f, _) = chain::info(id);
        s == n || f == n || (n == "DELAY" && id == 7) || (n == "BOOSTER" && id == 15) || (n == "MOD" && id == 5)
    })
}

/// Run one command line. Ok = what to show, Err = what went wrong.
pub fn run(app: &mut App, line: &str, ctx: &egui::Context) -> Result<String, String> {
    let w = words(line.trim());
    let lw: Vec<String> = w.iter().map(|s| s.to_lowercase()).collect();
    let arg = |i: usize| w.get(i).cloned().ok_or_else(|| "missing argument".to_string());
    match lw.first().map(String::as_str) {
        Some("set") => {
            let p = find_param(app, &arg(1)?).ok_or("no parameter by that name · tab completes")?;
            app.set_text(&p.name, &arg(2)?)
        }
        Some("get") => {
            let p = find_param(app, &arg(1)?).ok_or("no parameter by that name")?;
            Ok(format!("{} = {}", p.name, app.shown(p)))
        }
        Some("amp") => match lw.get(1).map(String::as_str) {
            Some("gain") => app.set_text("PREAMP A: GAIN", &arg(2)?),
            Some("model") => {
                let v = w[2..].join(" ");
                app.set_text("PREAMP A: TYPE", &v)
            }
            Some("quick") => {
                let q = arg(2)?.to_uppercase();
                let (_, raw) = QUICK.iter().find(|x| x.0 == q).ok_or("acoustic, clean, crunch, lead or brown")?;
                let p = app.param("PREAMP A: TYPE");
                app.set(p, *raw);
                Ok(format!("AMP = {}", app.shown(p)))
            }
            _ => Err("amp gain|model|quick".into()),
        },
        Some("select") => {
            let c = arg(1)?.to_uppercase();
            let (slot, label) = CHANNELS.iter().find(|x| x.1 == c || x.1.replace(':', "") == c).ok_or("PANEL, A:CH1, A:CH2, B:CH1 or B:CH2")?;
            app.select(*slot);
            Ok(format!("SELECTED {label}"))
        }
        Some("write") => {
            app.write_to_amp();
            Ok(String::new())
        }
        Some("revert") => {
            app.revert();
            Ok("REVERTED".into())
        }
        Some("diff") => {
            if app.changes.is_empty() {
                Ok("IN SYNC".into())
            } else {
                Ok(app.changes.iter().take(6).map(|p| p.label.to_uppercase()).collect::<Vec<_>>().join(", ") + if app.changes.len() > 6 { " …" } else { "" })
            }
        }
        Some("name") => {
            let n = w[1..].join(" ");
            app.rename(&n);
            Ok(format!("RENAMED {}", n.to_uppercase()))
        }
        Some("block") => {
            let (b, s) = if matches!(lw.get(1).map(String::as_str), Some("on" | "off")) { (arg(2)?, lw[1].clone()) } else { (arg(1)?, lw.get(2).cloned().unwrap_or_default()) };
            let id = find_block(&b).ok_or("no block by that name")?;
            let (on, locked) = chain::block_state(app, id);
            if locked {
                return Err("fixed by the firmware".into());
            }
            if (s == "on") != on {
                chain::toggle(app, id);
            }
            Ok(format!("{} {}", chain::info(id).1, if s == "on" { "ON" } else { "OFF" }))
        }
        Some("chain") if lw.get(1).map(String::as_str) == Some("move") => {
            let id = find_block(&arg(2)?).ok_or("no block by that name")?;
            let to: usize = arg(3)?.parse().map_err(|_| "position is a number")?;
            let order = chain::chain(app).ok_or("no chain yet")?;
            let (a, b) = chain::live_path(&order);
            let mut seg: Vec<u8> = order[a..b].to_vec();
            let from = seg.iter().position(|&x| x == id).ok_or("that block isn't on the live path")?;
            let blk = seg.remove(from);
            seg.insert(to.clamp(1, b - a) - 1, blk);
            chain::write_chain(app, a, b, &seg);
            Ok(format!("{} → {to}", chain::info(id).0))
        }
        Some("eq") => {
            let n: u32 = arg(2)?.parse().map_err(|_| "band 1-10")?;
            app.set_text(&format!("PRM_EQ_GEQ_BAND{n}"), &arg(3)?)
        }
        Some("tone") => match lw.get(1).map(String::as_str) {
            Some("apply") => {
                let q = w[2..].join(" ").to_lowercase();
                let i = app.tones.iter().position(|t| t.1.name.to_lowercase().contains(&q)).ok_or("no tone by that name")?;
                app.apply_tone(i);
                Ok(String::new())
            }
            Some("save") => {
                app.save_tone();
                Ok(String::new())
            }
            _ => Err("tone apply|save".into()),
        },
        Some("assign") => {
            let p = find_param(app, &arg(1)?).ok_or("no parameter by that name")?;
            let t = crate::control::target_for(app, p).ok_or("not an assign target")?;
            crate::control::new_assign(app, t.val);
            Ok(String::new())
        }
        Some("read") => {
            if w.len() < 3 {
                return Err("read ADDRESS SIZE, e.g. read 60 00 00 00 16".into());
            }
            let size = w[w.len() - 1].clone();
            let addr = w[1..w.len() - 1].join(" ");
            app.mon.set_probe(&addr, &size);
            app.tab = Tab::Monitor;
            let a: Vec<u8> = addr.split_whitespace().filter_map(|x| u8::from_str_radix(x, 16).ok()).collect();
            match (<[u8; 4]>::try_from(a), size.parse::<u32>()) {
                (Ok(a), Ok(n)) if app.online() => {
                    app.probe = None;
                    app.send(crate::worker::Cmd::Read(a, n));
                    Ok("READING".into())
                }
                _ => Err("bad address or size, or no amp".into()),
            }
        }
        Some("lamp" | "accent") => {
            let c = arg(1)?.to_uppercase();
            let i = LAMPS.iter().position(|l| l.0 == c).ok_or("mustard, coral, sage, steel or sand")?;
            choose_lamp(ctx, i);
            Ok(format!("LAMP {}", LAMPS[i].0))
        }
        Some("tab") | Some("editor" | "effects" | "control" | "library" | "monitor") => {
            let t = if lw[0] == "tab" { arg(1)?.to_uppercase() } else { lw[0].to_uppercase() };
            let tab = TABS.iter().find(|x| x.1 == t).ok_or("editor, effects, control, library or monitor")?;
            app.tab = tab.0;
            Ok(String::new())
        }
        Some(v) => Err(format!("no command {v:?} · try help")),
        None => Ok(String::new()),
    }
}

pub fn show(app: &mut App, ui: &mut Ui) {
    if !app.pal.open {
        return;
    }
    let ctx = ui.ctx().clone();
    let screen = ctx.content_rect();
    let q = app.pal.q.clone();
    let qq = q.trim().to_lowercase();
    let first = qq.split(' ').next().unwrap_or("").to_string();
    let is_cmd = qq.contains(' ') && CMDS.iter().any(|c| c.0.split(' ').next() == Some(first.as_str()));
    let show_locked = qq == "locked";
    let pfilter = if qq.starts_with("params") { qq.trim_start_matches("params").trim().to_string() } else if is_cmd || qq == "help" { String::new() } else { qq.clone() };
    let cat: &'static katana::Catalog = app.cat;
    let params: Vec<&'static Param> = if is_cmd || qq == "help" {
        vec![]
    } else {
        cat.params
            .iter()
            .filter(|p| p.is_locked() == show_locked && (show_locked || pfilter.is_empty() || p.name.to_lowercase().contains(&pfilter)))
            .filter(|p| !p.name.starts_with("PATCH NAME") && (show_locked || !crate::control::dead_target(&p.name)) && (!app.loaded || app.raw(p).is_some()))
            .collect()
    };
    let cmds: Vec<&(&str, &str, &str)> = CMDS.iter().filter(|c| qq.is_empty() || qq == "help" || format!("{} {} {}", c.0, c.1, c.2).to_lowercase().contains(&qq) || (is_cmd && c.0.starts_with(&first))).collect();
    let pshow: Vec<&'static Param> = params.iter().take(6).copied().collect();
    let cshow: Vec<&(&str, &str, &str)> = cmds.iter().take(if qq == "help" { 22 } else { 5 }).copied().collect();
    let n_rows = pshow.len() + cshow.len();
    app.pal.sel = app.pal.sel.min(n_rows.saturating_sub(1));

    // keys before the text field sees them
    let (up, down, tab, esc) = ctx.input_mut(|i| {
        (
            i.count_and_consume_key(Modifiers::NONE, Key::ArrowUp),
            i.count_and_consume_key(Modifiers::NONE, Key::ArrowDown),
            i.consume_key(Modifiers::NONE, Key::Tab),
            i.consume_key(Modifiers::NONE, Key::Escape),
        )
    });
    let nudge_ok = !qq.contains(' ') && app.pal.sel < pshow.len();
    let (left, right) = if nudge_ok {
        ctx.input_mut(|i| (i.count_and_consume_key(Modifiers::NONE, Key::ArrowLeft), i.count_and_consume_key(Modifiers::NONE, Key::ArrowRight)))
    } else {
        (0, 0)
    };
    if esc {
        app.pal.open = false;
        return;
    }
    app.pal.sel = (app.pal.sel + down).saturating_sub(up).min(n_rows.saturating_sub(1));
    if left != right && app.online() {
        let p = pshow[app.pal.sel];
        graph::step_option(app, p, right as i32 - left as i32);
    }
    let complete = |sel: usize| -> String {
        if sel < pshow.len() {
            format!("set \"{}\" ", pshow[sel].name)
        } else if let Some(c) = cshow.get(sel - pshow.len()) {
            format!("{} ", c.0)
        } else {
            String::new()
        }
    };
    if tab && n_rows > 0 {
        app.pal.q = complete(app.pal.sel);
        app.pal.fresh = true;
    }

    let w = 660.0f32.min(screen.width() - 40.0);
    let rows_h = (n_rows.max(1) as f32) * 30.0 + if pshow.is_empty() { 0.0 } else { 24.0 } + if cshow.is_empty() { 0.0 } else { 28.0 } + if is_cmd { 44.0 } else { 0.0 };
    let list_h = rows_h.clamp(120.0, (screen.height() - 220.0).max(160.0));
    let h = 18.0 + 22.0 + 12.0 + 50.0 + 12.0 + list_h + 12.0 + 30.0;
    let dlg = Rect::from_min_size(pos2(screen.center().x - w / 2.0, screen.top() + 64.0), vec2(w, h));
    let mut run_line: Option<String> = None;
    let mut close = false;
    egui::Area::new(Id::unique("palette")).order(egui::Order::Foreground).fixed_pos(screen.min).show(&ctx, |ui| {
        let back = ui.allocate_rect(screen, Sense::click());
        let p = ui.painter();
        p.rect_filled(screen, 0.0, rgba(0x000000B0));
        if back.clicked() && !ui.rect_contains_pointer(dlg) {
            close = true;
        }
        shadow(p, dlg, 5.0, 24.0, 50.0, rgba(0x000000E8));
        vgrad(p, dlg, 5.0, rgba(0x252628FF), rgba(0x1C1D1FFF));
        hline(p, dlg.left() + 4.0, dlg.right() - 4.0, dlg.top(), rgba(0xFFFFFF24));
        for (c, r) in [(dlg.left_top() + vec2(9.0, 9.0), 38.0), (dlg.right_top() + vec2(-9.0, 9.0), 112.0), (dlg.left_bottom() + vec2(9.0, -9.0), 161.0), (dlg.right_bottom() + vec2(-9.0, -9.0), 74.0)] {
            screw(p, c, r);
        }
        let x0 = dlg.left() + 26.0;
        let x1 = dlg.right() - 26.0;
        let ty = dlg.top() + 24.0;
        let t = silk(p, pos2(x0, ty), Align2::LEFT_CENTER, "SEARCH", F::Silk, 10.0, SILK);
        let s = silk(p, pos2(t.right() + 12.0, ty), Align2::LEFT_CENTER, "PARAMETERS · COMMANDS", F::Silk2, 9.0, SILK2);
        let esc_r = Rect::from_min_size(pos2(x1 - 30.0, ty - 9.0), vec2(30.0, 18.0));
        keycap(p, esc_r, Cap::Grey, false, false);
        text(p, esc_r.center(), Align2::CENTER_CENTER, "esc", F::Mono, 9.5, KEY_TEXT);
        let cl = silk(p, pos2(esc_r.left() - 10.0, ty), Align2::RIGHT_CENTER, "CLOSE", F::Silk2, 9.0, SILK2);
        rule(p, s.right() + 14.0, cl.left() - 14.0, ty);

        let fr = Rect::from_min_max(pos2(x0, ty + 18.0), pos2(x1, ty + 68.0));
        let match_txt = if is_cmd { "COMMAND".to_string() } else if qq.is_empty() { "ALL".into() } else { format!("{} MATCHES", params.len() + cmds.len()) };
        let g = glass(ui, fr);
        vfd(ui.painter(), pos2(g.right() - 12.0, g.center().y), Align2::RIGHT_CENTER, &match_txt, F::MonoB, 9.0);
        vfd(ui.painter(), pos2(g.left() + 12.0, g.center().y), Align2::LEFT_CENTER, "▸", F::MonoB, 15.0);
        let row = Rect::from_min_max(pos2(g.left() + 34.0, g.center().y - 11.0), pos2(g.right() - 110.0, g.center().y + 11.0));
        let edit = egui::TextEdit::singleline(&mut app.pal.q)
            .id(Id::unique("palette-q"))
            .frame(egui::Frame::NONE)
            .font(F::Mono.id(15.0))
            .text_color(lit())
            .hint_text(egui::RichText::new("search params or type a command").color(mix(lit(), BLACK, 0.6)).font(F::Mono.id(15.0)))
            .margin(vec2(0.0, 0.0))
            .desired_width(row.width());
        let resp = ui.put(row, edit);
        if app.pal.fresh {
            resp.request_focus();
            if let Some(mut st) = egui::TextEdit::load_state(ui.ctx(), resp.id) {
                let end = egui::text::CCursor::new(app.pal.q.chars().count());
                st.cursor.set_char_range(Some(egui::text::CCursorRange::one(end)));
                st.store(ui.ctx(), resp.id);
            }
            app.pal.fresh = false;
        }
        if resp.changed() {
            app.pal.sel = 0;
        }
        let enter = resp.lost_focus() && ui.input(|i| i.key_pressed(Key::Enter));
        if !resp.has_focus() && !enter {
            resp.request_focus();
        }

        // results
        let lr = Rect::from_min_size(pos2(x0, fr.bottom() + 12.0), vec2(x1 - x0, list_h));
        let g = glass(ui, lr);
        let mut y = g.top() + 6.0;
        let clip = g.shrink(1.0);
        if is_cmd {
            let hint = cshow.first().map_or("", |c| c.2);
            let rr = Rect::from_min_size(pos2(g.left() + 4.0, y), vec2(g.width() - 8.0, 32.0));
            ui.painter().rect_filled(rr, 0.0, inv());
            let p = ui.painter();
            text(p, pos2(rr.left() + 10.0, rr.center().y), Align2::LEFT_CENTER, "RUN ▸", F::MonoB, 9.0, INV_TEXT);
            text_max(p, pos2(rr.left() + 60.0, rr.center().y), Align2::LEFT_CENTER, q.trim(), F::Mono, 12.0, INV_TEXT, rr.width() - 240.0);
            text(p, pos2(rr.right() - 10.0, rr.center().y), Align2::RIGHT_CENTER, &format!("{hint}  · enter"), F::Mono, 10.0, rgba(0x170D02B0));
            y += 40.0;
        }
        let mut k = 0;
        if !pshow.is_empty() {
            let p = ui.painter();
            vfd(p, pos2(g.left() + 12.0, y + 10.0), Align2::LEFT_CENTER, &format!("PARAMETERS  {}", params.len()), F::MonoB, 8.5);
            y += 24.0;
            for prm in &pshow {
                let rr = Rect::from_min_size(pos2(g.left() + 4.0, y), vec2(g.width() - 8.0, 28.0));
                let s = app.pal.sel == k;
                if vfd_row(ui, rr, Id::unique(("pp", prm.addr)), s).clicked() {
                    app.pal.sel = k;
                    app.touched = Some(prm);
                }
                let p = ui.painter().with_clip_rect(clip);
                if s {
                    row_text(&p, pos2(rr.left() + 8.0, rr.center().y), Align2::LEFT_CENTER, "▸", 10.0, true, false, 12.0);
                }
                row_text(&p, pos2(rr.left() + 24.0, rr.center().y), Align2::LEFT_CENTER, &prm.name, 12.0, s, false, rr.width() - 270.0);
                let (lo, hi) = prm.raw_range();
                let f = app.raw(prm).map_or(0.0, |r| r.saturating_sub(lo) as f32 / (hi - lo).max(1) as f32);
                vfd_bar(&p, Rect::from_min_size(pos2(rr.right() - 230.0, rr.center().y - 3.0), vec2(100.0, 6.0)), f, prm.min < 0, s);
                let v = app.raw(prm).map_or("—".into(), |r| display(prm, r));
                let ed = app.edited(prm);
                let vr = row_text(&p, pos2(rr.right() - 10.0, rr.center().y), Align2::RIGHT_CENTER, &v, 11.0, s, false, 110.0);
                if ed {
                    p.circle_filled(pos2(vr.left() - 8.0, rr.center().y), 2.5, if s { INV_TEXT } else { lit() });
                }
                y += 30.0;
                k += 1;
            }
        }
        if !cshow.is_empty() {
            let p = ui.painter();
            p.extend(egui::Shape::dashed_line(&[pos2(g.left() + 8.0, y + 2.0), pos2(g.right() - 8.0, y + 2.0)], egui::Stroke::new(1.0, alpha(led(), 0.2)), 2.0, 3.0));
            vfd(p, pos2(g.left() + 12.0, y + 14.0), Align2::LEFT_CENTER, &format!("COMMANDS  {}", cmds.len()), F::MonoB, 8.5);
            y += 28.0;
            for c in &cshow {
                if y + 28.0 > g.bottom() {
                    break;
                }
                let rr = Rect::from_min_size(pos2(g.left() + 4.0, y), vec2(g.width() - 8.0, 28.0));
                let s = app.pal.sel == k;
                if vfd_row(ui, rr, Id::unique(("pc", c.0)), s).clicked() {
                    app.pal.q = format!("{} ", c.0);
                    app.pal.fresh = true;
                }
                let p = ui.painter().with_clip_rect(clip);
                row_text(&p, pos2(rr.left() + 8.0, rr.center().y), Align2::LEFT_CENTER, ">", 10.0, s, true, 12.0);
                let vr = row_text(&p, pos2(rr.left() + 24.0, rr.center().y), Align2::LEFT_CENTER, c.0, 11.5, s, false, 160.0);
                row_text(&p, pos2(vr.right() + 8.0, rr.center().y), Align2::LEFT_CENTER, c.1, 11.0, s, true, rr.width() - 380.0);
                row_text(&p, pos2(rr.right() - 10.0, rr.center().y), Align2::RIGHT_CENTER, c.2, 10.0, s, true, 210.0);
                y += 30.0;
                k += 1;
            }
        }
        if n_rows == 0 && !is_cmd {
            let p = ui.painter();
            vfd(p, pos2(g.left() + 12.0, g.top() + 22.0), Align2::LEFT_CENTER, "NOTHING MATCHES", F::Mono, 11.0);
            vfd(p, pos2(g.left() + 12.0, g.top() + 40.0), Align2::LEFT_CENTER, "TRY help", F::Mono, 10.0);
        }

        // footer
        let p = ui.painter();
        let fy = dlg.bottom() - 24.0;
        let mut fx = x0;
        for (keys, label) in [(&["↑", "↓"][..], "MOVE"), (&["enter"][..], "RUN"), (&["tab"][..], "COMPLETE"), (&["← →"][..], "NUDGE")] {
            for k in keys {
                let kw = text_w(p, k, F::Mono, 9.5) + 12.0;
                let kr = Rect::from_min_size(pos2(fx, fy - 9.0), vec2(kw.max(18.0), 18.0));
                keycap(p, kr, Cap::Grey, false, false);
                text(p, kr.center(), Align2::CENTER_CENTER, k, F::Mono, 9.5, KEY_TEXT);
                fx = kr.right() + 4.0;
            }
            fx = silk(p, pos2(fx + 4.0, fy), Align2::LEFT_CENTER, label, F::Silk2, 9.0, SILK2).right() + 18.0;
        }
        silk(p, pos2(x1, fy), Align2::RIGHT_CENTER, "CLI SYNTAX WORKS", F::Silk2, 9.0, SILK3);

        if enter {
            if is_cmd || CMDS.iter().any(|c| c.0 == qq.as_str() && c.1.is_empty()) {
                run_line = Some(q.clone());
            } else if n_rows > 0 {
                app.pal.q = complete(app.pal.sel);
                app.pal.fresh = true;
            } else if !qq.is_empty() {
                run_line = Some(q.clone());
            }
        }
    });
    if close {
        app.pal.open = false;
    }
    if let Some(line) = run_line {
        match run(app, &line, ui.ctx()) {
            Ok(msg) => {
                if !msg.is_empty() {
                    app.say(msg.to_uppercase());
                }
                app.pal.q.clear();
                app.pal.open = false;
            }
            Err(e) => app.say(e.to_uppercase()),
        }
    }
}
