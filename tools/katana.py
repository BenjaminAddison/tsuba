"""Minimal SysEx client for the BOSS KATANA (see notes/02-sysex-protocol.md).

Usage as a library:
    with Katana() as k:
        k.identify()
        print(k.rq1([0x7F, 0, 0, 0], 1))
"""
import os
import time

import rtmidi

MODEL_ID = [0x00, 0x00, 0x00, 0x33]
RQ1, DT1 = 0x11, 0x12
MODELS = {0: "KATANA-50", 1: "KATANA-100", 2: "KATANA-100/212", 3: "KATANA-HEAD", 4: "KATANA-Artist"}


def checksum(body):
    return (128 - sum(body) % 128) % 128


def hexs(msg):
    return " ".join(f"{b:02X}" for b in msg)


def addr_add(addr, offset):
    """Add a byte offset to a 4-byte 7-bit address."""
    n = 0
    for b in addr:
        n = n * 128 + b
    n += offset
    return [(n >> 21) & 0x7F, (n >> 14) & 0x7F, (n >> 7) & 0x7F, n & 0x7F]


def size7(n):
    return [(n >> 21) & 0x7F, (n >> 14) & 0x7F, (n >> 7) & 0x7F, n & 0x7F]


class Log:
    """Prints lines and also writes them to logs/<prefix>-<timestamp>.txt."""

    def __init__(self, prefix):
        logdir = os.path.join(os.path.dirname(__file__), "..", "logs")
        os.makedirs(logdir, exist_ok=True)
        self.path = os.path.abspath(os.path.join(logdir, f"{prefix}-{time.strftime('%Y%m%d-%H%M%S')}.txt"))
        self.f = open(self.path, "w", encoding="utf-8")

    def __call__(self, line):
        print(line, flush=True)
        self.f.write(line + "\n")
        self.f.flush()

    def close(self):
        self.f.close()
        print("log saved to", self.path)


class Katana:
    def __init__(self, port_name="KATANA", verbose=False):
        self.verbose = verbose
        self.inp = rtmidi.MidiIn(queue_size_limit=4096)
        self.inp.ignore_types(sysex=False, timing=True, active_sense=True)
        self.out = rtmidi.MidiOut()
        self.inp.open_port(self._find(self.inp, port_name))
        self.out.open_port(self._find(self.out, port_name))
        self.dev = 0x10
        self.model = None
        self.editor = False

    @staticmethod
    def _find(io, name):
        for i, p in enumerate(io.get_ports()):
            # WinMM appends " <index>"; match the exact base name so "KATANA" != "KATANA CTRL"
            if p.rsplit(" ", 1)[0] == name:
                return i
        raise RuntimeError(f"port {name!r} not found in {io.get_ports()}")

    def editor_on(self):
        """Editor mode on. close() (and leaving a `with` block) turns it off again."""
        self.dt1([0x7F, 0, 0, 1], [1])
        self.editor = True
        self.recv_all(0.2)

    def editor_off(self):
        self.dt1([0x7F, 0, 0x06, 0], [1])  # USB direct monitor back on, as Tone Studio does on exit
        self.dt1([0x7F, 0, 0, 1], [0])
        self.editor = False

    def close(self):
        if self.editor:
            self.editor_off()
        self.inp.close_port()
        self.out.close_port()

    def __enter__(self):
        return self

    def __exit__(self, *exc):
        self.close()

    # --- raw I/O -------------------------------------------------------------
    def send(self, msg):
        if self.verbose:
            print(">>", hexs(msg))
        self.out.send_message(msg)

    def drain(self):
        while self.inp.get_message():
            pass

    def recv(self, timeout=1.0, want=None):
        """Return the next message (optionally matching want(msg)) or None on timeout."""
        end = time.time() + timeout
        while time.time() < end:
            m = self.inp.get_message()
            if m:
                msg = m[0]
                if self.verbose:
                    print("<<", hexs(msg))
                if want is None or want(msg):
                    return msg
            else:
                time.sleep(0.001)
        return None

    def recv_all(self, timeout=0.5):
        """Collect everything that arrives until `timeout` passes with no new message."""
        msgs = []
        while True:
            m = self.recv(timeout)
            if m is None:
                return msgs
            msgs.append(m)

    # --- identity --------------------------------------------------------------
    def identify(self):
        self.drain()
        self.send([0xF0, 0x7E, 0x7F, 0x06, 0x01, 0xF7])
        r = self.recv(2.0, lambda m: m[:2] == [0xF0, 0x7E] and m[3:5] == [0x06, 0x02])
        if not r:
            raise TimeoutError("no reply to broadcast identity request")
        self.dev = r[2]
        self.send([0xF0, 0x7E, self.dev, 0x06, 0x01, 0xF7])
        r2 = self.recv(2.0, lambda m: m[:2] == [0xF0, 0x7E] and m[3:5] == [0x06, 0x02])
        if not r2:
            raise TimeoutError("no reply to directed identity request")
        prefix_ok = r2[:10] == [0xF0, 0x7E, self.dev, 0x06, 0x02, 0x41, 0x33, 0x03, 0x00, 0x00]
        self.model = MODELS.get(r2[10] & 0x0F, f"unknown ({r2[10] & 0x0F})")
        return {"broadcast_reply": hexs(r), "directed_reply": hexs(r2), "dev": self.dev,
                "prefix_ok": prefix_ok, "model": self.model}

    # --- RQ1 / DT1 -------------------------------------------------------------
    def _frame(self, cmd, body):
        return [0xF0, 0x41, self.dev] + MODEL_ID + [cmd] + body + [checksum(body), 0xF7]

    def _is_dt1(self, m):
        return m[:8] == [0xF0, 0x41, self.dev] + MODEL_ID + [DT1]

    def rq1(self, addr, size, timeout=1.0, retries=2):
        """Read `size` bytes at `addr`. Returns bytes in address order (may span several DT1s).

        Unrelated DT1s (change echoes, panel moves) that arrive meanwhile are ignored. On a timeout the request is
        resent up to `retries` times, as Tone Studio does.
        """
        start = (addr[0] << 21) | (addr[1] << 14) | (addr[2] << 7) | addr[3]
        wanted = set(range(start, start + size))
        for attempt in range(retries + 1):
            self.drain()
            self.send(self._frame(RQ1, list(addr) + size7(size)))
            data = {}
            end = time.time() + timeout
            while not wanted <= data.keys() and time.time() < end:
                m = self.recv(end - time.time(), self._is_dt1)
                if not m:
                    break
                a, payload, cs = m[8:12], m[12:-2], m[-2]
                if checksum(m[8:-2]) != cs:
                    raise ValueError(f"bad checksum: {hexs(m)}")
                base = (a[0] << 21) | (a[1] << 14) | (a[2] << 7) | a[3]
                for i, b in enumerate(payload):
                    if base + i in wanted:
                        data[base + i] = b
            if wanted <= data.keys():
                return [data[start + i] for i in range(size)]
        raise TimeoutError(f"RQ1 {hexs(addr)} size {size}: got {len(data)} bytes after {retries + 1} tries")

    def read_sparse(self, addr, size, quiet=0.4):
        """Read a range that may contain holes (the amp skips undefined addresses).

        Returns a list of (address, bytes) segments exactly as the amp sent them.
        """
        self.drain()
        self.send(self._frame(RQ1, list(addr) + size7(size)))
        segs = []
        first = self.recv(2.0, self._is_dt1)
        m = first
        while m:
            if checksum(m[8:-2]) != m[-2]:
                raise ValueError(f"bad checksum: {hexs(m)}")
            segs.append((m[8:12], m[12:-2]))
            m = self.recv(quiet, self._is_dt1)
        return segs

    def dt1(self, addr, data):
        self.send(self._frame(DT1, list(addr) + list(data)))
