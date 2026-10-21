//! Command-line front end, for testing the backend on the amp before there's a UI.

use std::time::{Duration, Instant};

use katana::{amp, catalog::CHAIN_BLOCKS, sysex, Catalog, Katana, Tone};
use serde_json::Value;

const USAGE: &str = "usage: katana <command>
  info                 connect, show the device, current slot and FX chain
  get NAME             read one parameter, e.g. \"PREAMP A: GAIN\"
  set NAME VALUE       write one parameter to the edit buffer (live, not saved)
  show FILE            resolve a tone file without touching the amp
  apply FILE           apply a tone file to the edit buffer (live, not saved)
  chain [BLOCK x20]    show the FX chain, or set it (all 20 blocks, e.g. from `chain` output)
  listen [SECONDS]     print what the amp sends (default 30 s)
  meter [SECONDS]      show the USB audio output level (default 30 s)";

fn main() {
    let args: Vec<String> = std::env::args().skip(1).collect();
    if let Err(e) = run(&args) {
        eprintln!("error: {e}");
        std::process::exit(1);
    }
}

fn load_tone(path: &str) -> Result<Tone, Box<dyn std::error::Error>> {
    Ok(serde_json::from_str(&std::fs::read_to_string(path)?)?)
}

fn run(args: &[String]) -> Result<(), Box<dyn std::error::Error>> {
    let cat = Catalog::load();
    let a: Vec<&str> = args.iter().map(String::as_str).collect();
    match a.as_slice() {
        ["show", path] => {
            let tone = load_tone(path)?;
            println!("{}: {}", tone.name, tone.description);
            for (name, v) in &tone.params {
                match cat.encode(name, v) {
                    Ok((addr, data)) => println!("  {} = {:<8} {name} = {v}", sysex::hex(&addr), sysex::hex(&data)),
                    Err(e) => println!("  skipped: {e}"),
                }
            }
        }
        ["info"] => {
            let mut k = Katana::connect()?;
            let slot = k.current_patch()?;
            println!("KATANA-50 connected, device ID {:02X}, current slot {slot}", k.dev);
            print_chain(&k.read(amp::CHAIN, 20)?);
        }
        ["get", name] => {
            let p = cat.get(name).ok_or("unknown parameter")?;
            let mut k = Katana::connect()?;
            let base = sysex::lin(p.addr);
            let mem = k.read(p.addr, p.size as u32)?.into_iter().enumerate().map(|(i, b)| (base + i as u32, b));
            println!("{name} = {}", cat.value(p, &mem.collect()).unwrap());
        }
        ["set", name, value] => {
            // a label first ("1" is a Q label), then a number
            let (addr, data) = cat
                .encode(name, &Value::String(value.to_string()))
                .or_else(|_| cat.encode(name, &serde_json::from_str(value).unwrap_or(Value::Null)))?;
            let mut k = Katana::connect()?;
            k.write(addr, &data)?;
            let back = k.read(addr, data.len() as u32)?;
            println!("{name} = {value}{}", if back == data { "" } else { "  (NOT ACCEPTED by the amp)" });
        }
        ["apply", path] => {
            let tone = load_tone(path)?;
            let (writes, skipped) = cat.encode_tone(&tone);
            let mut k = Katana::connect()?;
            k.write_many(&writes)?;
            std::thread::sleep(Duration::from_millis(300));
            let mut bad = vec![];
            for (addr, data) in &writes {
                if &k.read(*addr, data.len() as u32)? != data {
                    bad.push(cat.at(*addr).map_or(sysex::hex(addr), |p| p.name.clone()));
                }
            }
            println!("{}: applied {} params to the edit buffer (not saved)", tone.name, writes.len() - bad.len());
            skipped.iter().for_each(|s| println!("  skipped: {s}"));
            bad.iter().for_each(|s| println!("  NOT ACCEPTED: {s}"));
        }
        ["chain"] => print_chain(&Katana::connect()?.read(amp::CHAIN, 20)?),
        ["chain", blocks @ ..] if blocks.len() == 20 => {
            let mut order = [0u8; 20];
            for (o, b) in order.iter_mut().zip(blocks) {
                *o = CHAIN_BLOCKS.iter().position(|n| n == b).ok_or(format!("unknown block {b}"))? as u8;
            }
            let mut k = Katana::connect()?;
            k.set_chain(&order)?;
            print_chain(&k.read(amp::CHAIN, 20)?);
        }
        ["listen", rest @ ..] => {
            let secs = rest.first().map_or(Ok(30), |s| s.parse())?;
            let mut k = Katana::connect()?;
            println!("listening for {secs} s: turn knobs, switch channels...");
            let end = Instant::now() + Duration::from_secs(secs);
            while Instant::now() < end {
                for (addr, data) in k.events() {
                    let name = cat.at(addr).map_or("", |p| p.name.as_str());
                    println!("{} = {}  {name}", sysex::hex(&addr), sysex::hex(&data));
                }
                std::thread::sleep(Duration::from_millis(10));
            }
        }
        ["meter", rest @ ..] => {
            let secs = rest.first().map_or(Ok(30), |s| s.parse())?;
            let m = katana::audio::Meter::open()?;
            let end = Instant::now() + Duration::from_secs(secs);
            while Instant::now() < end {
                std::thread::sleep(Duration::from_millis(100));
                let db = m.take_peaks().map(|p| 20.0 * p.max(1e-6).log10());
                println!("L {:6.1} dB   R {:6.1} dB", db[0], db[1]);
            }
        }
        _ => println!("{USAGE}"),
    }
    Ok(())
}

fn print_chain(order: &[u8]) {
    let names: Vec<&str> = order.iter().map(|&b| CHAIN_BLOCKS.get(b as usize).copied().unwrap_or("?")).collect();
    println!("chain: {}", names.join(" "));
}
