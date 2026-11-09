#!/usr/bin/env python3
"""Renders the project's graphics as SVG, deterministically (same input, same bytes).

Motif: a regular lattice of concepts (nodes and edges) that loses its structure toward the
centre: edges break, nodes drift and shrink, colour moves from indigo to a single red accent.
Outputs static/img/{mark,cover,og,banner}.svg and static/favicon.svg; scripts/render-graphics.sh
rasterises og.svg and banner.svg to PNG.
"""

import math
import pathlib
import random

ROOT = pathlib.Path(__file__).resolve().parent.parent
OUT = ROOT / "static" / "img"

INDIGO = ["#312e81", "#3730a3", "#4338ca", "#4f46e5", "#6366f1", "#818cf8", "#a5b4fc"]
ACCENT = "#ef4444"
INK = "#0b1020"
PAPER = "#f9fafb"
FONT = "Inter, 'Helvetica Neue', Arial, sans-serif"


def lattice(width, height, step, cx, cy, radius, seed):
    """Nodes on a jittered grid; displacement and decay grow toward (cx, cy)."""
    rng = random.Random(seed)
    nodes = []
    cols = int(width / step) + 2
    rows = int(height / step) + 2
    for row in range(rows):
        for col in range(cols):
            x = col * step + (step / 2 if row % 2 else 0) - step / 2
            y = row * step * 0.866
            d = math.hypot(x - cx, y - cy) / radius
            decay = max(0.0, 1.0 - d)
            angle = rng.uniform(0, 2 * math.pi)
            drift = decay ** 1.6 * step * rng.uniform(0.6, 2.4)
            nodes.append({
                "x": x + math.cos(angle) * drift,
                "y": y + math.sin(angle) * drift,
                "decay": decay,
                "row": row,
                "col": col,
                "r": (step * 0.055 if decay > 0.82 else max(0.6, (1.0 - decay * 0.75) * step * 0.07))
                * rng.uniform(0.8, 1.2),
                "keep": rng.random(),
            })
    return nodes, cols


def colour(decay):
    if decay > 0.82:
        return ACCENT
    index = min(len(INDIGO) - 1, int((1 - decay) * (len(INDIGO) - 1) + 0.5))
    return INDIGO[len(INDIGO) - 1 - index] if decay > 0.4 else INDIGO[index]


def network(width, height, step, cx, cy, radius, seed, edge_opacity=0.55):
    nodes, cols = lattice(width, height, step, cx, cy, radius, seed)
    by_pos = {(n["row"], n["col"]): n for n in nodes}
    parts = []
    for n in nodes:
        neighbours = [(n["row"], n["col"] + 1), (n["row"] + 1, n["col"]),
                      (n["row"] + 1, n["col"] + (1 if n["row"] % 2 else -1))]
        for key in neighbours:
            m = by_pos.get(key)
            if not m:
                continue
            decay = max(n["decay"], m["decay"])
            if n["keep"] < decay * 1.15:
                continue
            opacity = edge_opacity * (1 - decay * 0.8)
            parts.append(
                f'<line x1="{n["x"]:.1f}" y1="{n["y"]:.1f}" x2="{m["x"]:.1f}" y2="{m["y"]:.1f}" '
                f'stroke="{colour(decay)}" stroke-opacity="{opacity:.2f}" stroke-width="{max(0.4, step * 0.012):.2f}"/>'
            )
    for n in nodes:
        if n["decay"] > 0.95:
            continue
        parts.append(
            f'<circle cx="{n["x"]:.1f}" cy="{n["y"]:.1f}" r="{n["r"]:.2f}" fill="{colour(n["decay"])}" '
            f'fill-opacity="{0.95 - n["decay"] * 0.45:.2f}"/>'
        )
    return "\n".join(parts)


def svg(width, height, body, title, desc):
    return (
        f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {width} {height}" width="{width}" '
        f'height="{height}" role="img" aria-labelledby="t d">\n<title id="t">{title}</title>\n'
        f'<desc id="d">{desc}</desc>\n{body}\n</svg>\n'
    )


def mark():
    size = 64
    rng = random.Random(7)
    parts = [f'<rect width="{size}" height="{size}" rx="14" fill="{INK}"/>']
    cx = cy = size / 2
    ring = []
    for i in range(12):
        a = i / 12 * 2 * math.pi - math.pi / 2
        broken = i in (2, 3, 7)
        r = 22 + (rng.uniform(2, 5) if broken else 0)
        ring.append((cx + math.cos(a) * r, cy + math.sin(a) * r, broken))
    for i, (x, y, broken) in enumerate(ring):
        nx, ny, nb = ring[(i + 1) % len(ring)]
        if not (broken or nb):
            parts.append(f'<line x1="{x:.1f}" y1="{y:.1f}" x2="{nx:.1f}" y2="{ny:.1f}" stroke="{INDIGO[5]}" stroke-width="2.2" stroke-linecap="round"/>')
        if i % 3 == 0 and not broken:
            parts.append(f'<line x1="{x:.1f}" y1="{y:.1f}" x2="{cx}" y2="{cy}" stroke="{INDIGO[4]}" stroke-opacity="0.55" stroke-width="1.4"/>')
    for x, y, broken in ring:
        parts.append(f'<circle cx="{x:.1f}" cy="{y:.1f}" r="{2.2 if broken else 3}" fill="{ACCENT if broken else INDIGO[6]}"/>')
    parts.append(f'<circle cx="{cx}" cy="{cy}" r="5" fill="none" stroke="{ACCENT}" stroke-width="2"/>')
    return svg(size, size, "\n".join(parts), "Kompendium epistemické anihilace",
               "Kruh pojmů propojených se středem; tři uzly se odpojily a zčervenaly.")


def cover():
    w, h = 600, 800
    body = [
        f'<defs><radialGradient id="g" cx="50%" cy="46%" r="60%"><stop offset="0" stop-color="#1e1b4b"/>'
        f'<stop offset="1" stop-color="{INK}"/></radialGradient></defs>',
        f'<rect width="{w}" height="{h}" fill="url(#g)"/>',
        network(w, h, 34, w * 0.5, h * 0.42, 260, 11),
        f'<rect x="0" y="{h - 230}" width="{w}" height="230" fill="{INK}" fill-opacity="0.82"/>',
        f'<text x="40" y="{h - 170}" fill="{INDIGO[6]}" font-family="{FONT}" font-size="15" letter-spacing="4">KOMPENDIUM</text>',
        f'<text x="40" y="{h - 128}" fill="#ffffff" font-family="{FONT}" font-size="34" font-weight="800">Epistemická a kognitivní</text>',
        f'<text x="40" y="{h - 88}" fill="#ffffff" font-family="{FONT}" font-size="34" font-weight="800">anihilace</text>',
        f'<line x1="40" y1="{h - 62}" x2="120" y2="{h - 62}" stroke="{ACCENT}" stroke-width="3"/>',
        f'<text x="40" y="{h - 34}" fill="#9ca3af" font-family="{FONT}" font-size="15">Tomas Korcak · defenzivní taxonomie</text>',
    ]
    return svg(w, h, "\n".join(body), "Obálka kompendia",
               "Pravidelná síť pojmů, která se směrem ke středu rozpadá do fragmentů; pod ní název knihy.")


def wide(w, h, title_size, with_text=True):
    body = [
        f'<defs><radialGradient id="g" cx="72%" cy="50%" r="70%"><stop offset="0" stop-color="#1e1b4b"/>'
        f'<stop offset="1" stop-color="{INK}"/></radialGradient>'
        f'<linearGradient id="fade" x1="0" x2="1"><stop offset="0" stop-color="{INK}"/>'
        f'<stop offset="0.55" stop-color="{INK}" stop-opacity="0.15"/><stop offset="1" stop-color="{INK}" stop-opacity="0"/></linearGradient></defs>',
        f'<rect width="{w}" height="{h}" fill="url(#g)"/>',
        network(w, h, h / 11, w * 0.72, h * 0.5, h * 0.62, 23),
    ]
    if with_text:
        s = title_size
        body += [
            f'<rect width="{w * 0.62:.0f}" height="{h}" fill="url(#fade)"/>',
            f'<text x="{s * 1.4:.0f}" y="{h * 0.36:.0f}" fill="{INDIGO[6]}" font-family="{FONT}" font-size="{s * 0.38:.0f}" letter-spacing="5">KOMPENDIUM</text>',
            f'<text x="{s * 1.4:.0f}" y="{h * 0.36 + s * 1.15:.0f}" fill="#ffffff" font-family="{FONT}" font-size="{s:.0f}" font-weight="800">Epistemická a kognitivní</text>',
            f'<text x="{s * 1.4:.0f}" y="{h * 0.36 + s * 2.25:.0f}" fill="#ffffff" font-family="{FONT}" font-size="{s:.0f}" font-weight="800">anihilace</text>',
            f'<line x1="{s * 1.4:.0f}" y1="{h * 0.36 + s * 2.9:.0f}" x2="{s * 3.6:.0f}" y2="{h * 0.36 + s * 2.9:.0f}" stroke="{ACCENT}" stroke-width="{s * 0.08:.1f}"/>',
            f'<text x="{s * 1.4:.0f}" y="{h * 0.36 + s * 3.6:.0f}" fill="#9ca3af" font-family="{FONT}" font-size="{s * 0.42:.0f}">Defenzivní taxonomie epistemické a kognitivní manipulace</text>',
        ]
    return "\n".join(body)


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    files = {
        OUT / "mark.svg": mark(),
        ROOT / "static" / "favicon.svg": mark(),
        OUT / "cover.svg": cover(),
        OUT / "og.svg": svg(1200, 630, wide(1200, 630, 56), "Kompendium epistemické a kognitivní anihilace",
                            "Síť pojmů, která se vpravo rozpadá; vlevo název knihy."),
        OUT / "banner.svg": svg(1600, 400, wide(1600, 400, 42), "Kompendium epistemické a kognitivní anihilace",
                                "Široký pruh se sítí pojmů, která se rozpadá; vlevo název knihy."),
        OUT / "pattern.svg": svg(1600, 400, wide(1600, 400, 42, with_text=False), "Rozpadající se síť pojmů",
                                 "Dekorativní pozadí bez textu."),
    }
    for path, text in files.items():
        path.write_text(text, encoding="utf-8")
        print(f"wrote {path.relative_to(ROOT)} ({len(text) // 1024} KiB)")


if __name__ == "__main__":
    main()
