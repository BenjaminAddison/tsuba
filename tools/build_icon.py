"""Draws the Tsuba icon (a four-lobed sword guard with a brass rim, on a rack-panel tile) into app/icon/.

python tools/build_icon.py  ->  app/icon/tsuba.png (1024 px), tsuba-256.png (window icon), tsuba.ico (exe, 16-256 px)
"""
from pathlib import Path

from PIL import Image, ImageChops, ImageDraw, ImageFilter

S = 1024  # final size; everything is drawn at 4x and scaled down
K = 4
N = S * K
OUT = Path(__file__).resolve().parent.parent / "app" / "icon"

# colours from app/src/theme.rs
BODY, FACE_TOP, RAIL = (0x0D, 0x0D, 0x0F), (0x2A, 0x2B, 0x2E), (0x04, 0x04, 0x04)
LAMP = (0xFF, 0xB5, 0x47)  # MUSTARD
SILK = (0xE8, 0xE4, 0xDC)


def vgrad(size, top, bot):
    g = Image.new("RGB", (1, 256))
    for y in range(256):
        t = y / 255
        g.putpixel((0, y), tuple(round(a + (b - a) * t) for a, b in zip(top, bot)))
    return g.resize(size, Image.BICUBIC)


G = 0.78  # guard size relative to the tile


def mokko(scale):
    """Four-lobed guard outline (mokko-gata) as a mask, centred."""
    m = Image.new("L", (N, N), 0)
    d = ImageDraw.Draw(m)
    c, r, off = N / 2, N * G * scale * 0.25, N * G * scale * 0.22
    for dx, dy in ((off, 0), (-off, 0), (0, off), (0, -off)):
        d.ellipse((c + dx - r, c + dy - r, c + dx + r, c + dy + r), fill=255)
    return m


def slot():
    """Blade slot (nakago-ana): a narrow wedge, wider at the top."""
    m = Image.new("L", (N, N), 0)
    d = ImageDraw.Draw(m)
    c, h = N / 2, N * G * 0.15
    wt, wb = N * G * 0.034, N * G * 0.02
    top, bot = c - h, c + h
    d.polygon([(c - wt, top + wt), (c + wt, top + wt), (c + wb, bot - wb), (c - wb, bot - wb)], fill=255)
    d.ellipse((c - wt, top, c + wt, top + 2 * wt), fill=255)
    d.ellipse((c - wb, bot - 2 * wb, c + wb, bot), fill=255)
    return m


def side_holes():
    """Hitsu-ana: two half-moon holes either side of the slot, flat side in."""
    m = Image.new("L", (N, N), 0)
    d = ImageDraw.Draw(m)
    c = N / 2
    for side in (-1, 1):
        x, rx, ry = c + side * N * G * 0.17, N * G * 0.07, N * G * 0.1
        d.ellipse((x - rx, c - ry, x + rx, c + ry), fill=255)
        d.rectangle((x - rx, c - ry, x - rx * 0.35, c + ry) if side > 0 else (x + rx * 0.35, c - ry, x + rx, c + ry), fill=0)
    return m


def shifted(mask, dy):
    return mask.transform(mask.size, Image.AFFINE, (1, 0, 0, 0, 1, -dy))


def main():
    img = Image.new("RGBA", (N, N), (0, 0, 0, 0))

    # tile: rounded square, rack-face gradient, rail edge and a lit top lip
    pad, rad, e = N * 0.06, N * 0.2, N * 0.012
    tile = Image.new("L", (N, N), 0)
    ImageDraw.Draw(tile).rounded_rectangle((pad, pad, N - pad, N - pad), rad, fill=255)
    inner = Image.new("L", (N, N), 0)
    ImageDraw.Draw(inner).rounded_rectangle((pad + e, pad + e, N - pad - e, N - pad - e), rad - e, fill=255)
    img.paste(Image.new("RGB", (N, N), RAIL), mask=tile)
    img.paste(vgrad((N, N), FACE_TOP, BODY), mask=inner)
    img.paste(Image.new("RGB", (N, N), (0x4A, 0x4B, 0x4F)), mask=ImageChops.subtract(inner, shifted(inner, N * 0.006)))

    guard, plate = mokko(1.0), mokko(0.84)
    holes = ImageChops.lighter(slot(), side_holes())

    # shadow under the guard, kept on the tile
    shadow = shifted(guard, N * 0.02).filter(ImageFilter.GaussianBlur(N * 0.025))
    img.paste(Image.new("RGB", (N, N), (0, 0, 0)), mask=ImageChops.multiply(shadow, inner).point(lambda v: v * 0.85))

    # brass rim (mimi) in the lamp colour, a lit upper edge, then the recessed gunmetal plate
    img.paste(vgrad((N, N), (0xFF, 0xD0, 0x7A), (0x9A, 0x5E, 0x1C)), mask=guard)
    img.paste(Image.new("RGB", (N, N), (0xFF, 0xE8, 0xB8)), mask=ImageChops.subtract(guard, shifted(guard, N * 0.006)))
    img.paste(Image.new("RGB", (N, N), (0x5A, 0x38, 0x10)), mask=ImageChops.subtract(plate, shifted(plate, -N * 0.006)))
    img.paste(vgrad((N, N), (0x24, 0x25, 0x28), (0x3C, 0x3D, 0x42)), mask=plate)
    img.paste(Image.new("RGB", (N, N), (0x12, 0x12, 0x14)), mask=ImageChops.subtract(plate, shifted(plate, N * 0.008)))

    # holes go through to the dark panel, with a lit lower lip
    img.paste(Image.new("RGB", (N, N), (0x8A, 0x8B, 0x90)), mask=ImageChops.subtract(holes, shifted(holes, -N * 0.006)))
    img.paste(Image.new("RGB", (N, N), RAIL), mask=ImageChops.multiply(holes, shifted(holes, -N * 0.006)))

    img = img.resize((S, S), Image.LANCZOS)
    OUT.mkdir(parents=True, exist_ok=True)
    img.save(OUT / "tsuba.png")
    img.resize((256, 256), Image.LANCZOS).save(OUT / "tsuba-256.png")  # the window icon
    img.save(OUT / "tsuba.ico", sizes=[(n, n) for n in (16, 24, 32, 48, 64, 128, 256)])
    print("wrote", OUT / "tsuba.png", OUT / "tsuba.ico")


if __name__ == "__main__":
    main()
