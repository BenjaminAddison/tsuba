"""TODO section 3: editor mode + a single live DT1 to the edit buffer, then restore. Saves nothing."""
import time

from katana import Katana, hexs

GAIN = [0x60, 0x00, 0x00, 0x52]  # PREAMP A gain

with Katana() as k:
    k.identify()
    assert k.rq1([0x7F, 0, 0, 0], 1) == [5]
    hi, lo = k.rq1([0x00, 0x01, 0, 0], 2)
    slot = hi * 128 + lo
    stored = [0x10, slot, 0x00, 0x52]
    print(f"current patch {slot}; stored gain {k.rq1(stored, 1)[0]}")

    k.dt1([0x7F, 0, 0, 1], [1])
    unsolicited = k.recv_all(0.3)
    print("editor mode ON; amp sent:", [hexs(m) for m in unsolicited] or "nothing")

    g0 = k.rq1(GAIN, 1)[0]
    g1 = min(g0 + 10, 120)
    k.dt1(GAIN, [g1])
    echo = k.recv_all(0.3)
    print(f"gain {g0} -> {g1}; echo after DT1:", [hexs(m) for m in echo] or "nothing")
    print(f"  edit buffer reads {k.rq1(GAIN, 1)[0]}, stored slot reads {k.rq1(stored, 1)[0]}")
    time.sleep(2)

    k.dt1(GAIN, [g0])
    k.recv_all(0.2)
    print(f"restored: edit buffer {k.rq1(GAIN, 1)[0]}, stored {k.rq1(stored, 1)[0]}")

    k.dt1([0x7F, 0, 0x06, 0], [1])
    k.dt1([0x7F, 0, 0, 1], [0])
    print("editor mode OFF; amp sent:", [hexs(m) for m in k.recv_all(0.3)] or "nothing")
