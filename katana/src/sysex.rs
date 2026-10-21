//! Roland SysEx framing for the KATANA (notes/02-sysex-protocol.md). Pure functions, no I/O.

pub type Addr = [u8; 4];

const HEADER: [u8; 7] = [0xF0, 0x41, 0, 0x00, 0x00, 0x00, 0x33]; // [2] = device ID
const RQ1: u8 = 0x11;
const DT1: u8 = 0x12;

pub const IDENTITY_BROADCAST: [u8; 6] = [0xF0, 0x7E, 0x7F, 0x06, 0x01, 0xF7];

pub fn checksum(body: &[u8]) -> u8 {
    ((128 - body.iter().map(|&b| b as u32).sum::<u32>() % 128) % 128) as u8
}

/// 4 × 7-bit address bytes → linear byte index (`60 00 08 00` is 1,024 bytes after `60 00 00 00`).
pub fn lin(a: Addr) -> u32 {
    a.iter().fold(0, |n, &b| n << 7 | b as u32)
}

pub fn addr(n: u32) -> Addr {
    [(n >> 21) as u8 & 0x7F, (n >> 14) as u8 & 0x7F, (n >> 7) as u8 & 0x7F, n as u8 & 0x7F]
}

pub fn hex(bytes: &[u8]) -> String {
    bytes.iter().map(|b| format!("{b:02X}")).collect::<Vec<_>>().join(" ")
}

fn frame(dev: u8, cmd: u8, body: &[u8]) -> Vec<u8> {
    let mut m = HEADER.to_vec();
    m[2] = dev;
    m.push(cmd);
    m.extend_from_slice(body);
    m.push(checksum(body));
    m.push(0xF7);
    m
}

pub fn rq1(dev: u8, a: Addr, size: u32) -> Vec<u8> {
    frame(dev, RQ1, &[a, addr(size)].concat())
}

pub fn dt1(dev: u8, a: Addr, data: &[u8]) -> Vec<u8> {
    frame(dev, DT1, &[&a[..], data].concat())
}

/// A DT1 from our amp with a valid checksum → (address, data). Anything else → None.
pub fn parse_dt1(dev: u8, m: &[u8]) -> Option<(Addr, &[u8])> {
    let n = m.len();
    if n < 15 || m[..2] != HEADER[..2] || m[2] != dev || m[3..7] != HEADER[3..] || m[7] != DT1 || m[n - 1] != 0xF7 {
        return None;
    }
    if checksum(&m[8..n - 2]) != m[n - 2] {
        return None;
    }
    Some(([m[8], m[9], m[10], m[11]], &m[12..n - 2]))
}

pub fn identity_request(dev: u8) -> [u8; 6] {
    [0xF0, 0x7E, dev, 0x06, 0x01, 0xF7]
}

/// Identity reply → (device ID, model nibble: 0 = KATANA-50, 1 = 100, 2 = 100/212, 3 = HEAD, 4 = Artist).
pub fn parse_identity(m: &[u8]) -> Option<(u8, u8)> {
    if m.len() >= 15 && m[..2] == [0xF0, 0x7E] && m[3..5] == [0x06, 0x02] && m[5..10] == [0x41, 0x33, 0x03, 0x00, 0x00] {
        Some((m[2], m[10] & 0x0F))
    } else {
        None
    }
}

/// 7-bit big-endian multi-byte values: 400 ms = `03 10`.
pub fn encode_value(raw: u32, size: usize) -> Vec<u8> {
    (0..size).rev().map(|i| (raw >> (7 * i)) as u8 & 0x7F).collect()
}

pub fn decode_value(bytes: &[u8]) -> u32 {
    bytes.iter().fold(0, |n, &b| n << 7 | b as u32)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn known_messages() {
        // verified examples from notes/02-sysex-protocol.md
        assert_eq!(hex(&dt1(0, [0x7F, 0, 0, 1], &[1])), "F0 41 00 00 00 00 33 12 7F 00 00 01 01 7F F7");
        assert_eq!(hex(&dt1(0, [0x60, 0, 0, 0x52], &[50])), "F0 41 00 00 00 00 33 12 60 00 00 52 32 1C F7");
        assert_eq!(hex(&rq1(0, [0x60, 0, 0, 0], 16)), "F0 41 00 00 00 00 33 11 60 00 00 00 00 00 00 10 10 F7");
    }

    #[test]
    fn roundtrips() {
        let m = dt1(0, [0x60, 0, 0x05, 0x62], &encode_value(400, 2));
        let (a, d) = parse_dt1(0, &m).unwrap();
        assert_eq!((a, decode_value(d)), ([0x60, 0, 0x05, 0x62], 400));
        assert_eq!(parse_dt1(1, &m), None); // other device
        let mut bad = m.clone();
        bad[12] ^= 1;
        assert_eq!(parse_dt1(0, &bad), None);
        assert_eq!(lin([0x60, 0, 0x08, 0]) - lin([0x60, 0, 0, 0]), 1024);
        assert_eq!(addr(lin([0x60, 0, 0x7F, 0x7F]) + 1), [0x60, 1, 0, 0]);
        let id = [0xF0, 0x7E, 0x00, 0x06, 0x02, 0x41, 0x33, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF7];
        assert_eq!(parse_identity(&id), Some((0, 0)));
    }
}
