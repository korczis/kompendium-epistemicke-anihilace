#!/usr/bin/env python3
"""Renders the project's graphics as SVG, deterministically (same input, same bytes).

Motif: a regular lattice of concepts (nodes and edges) that loses its structure toward the
centre: edges break, nodes drift and shrink, colour moves from indigo to a single red accent.
Outputs static/img/{mark,cover,og,banner,pattern}.svg and static/favicon.svg; scripts/render-graphics.sh
rasterises og.svg, banner.svg and cover.svg to PNG. It also renders the section and family
graphics of the landing page and the per-section og:image into static/img/generated/ (see the
section below).

Usage: scripts/render-graphics.py [--check]   (--check writes nothing and exits 1 when any
                                               output is stale, missing or extra)
"""

import hashlib
import json
import math
import pathlib
import random
import re
import shutil
import struct
import subprocess
import sys
import tomllib

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



# --- Section and family graphics (static/img/generated/) -------------------------------------
# Inputs, all derived: the title of every top-level section (content/<top>/_index.md and
# content/kompendium/<section>/_index.md), the EA families and the pages of the link graph
# (static/data/graph.json: path, EA code), whether a page is developed (static/data/ia.json: no
# violation of `detail` or `generated` from scripts/check-ia.py) and the numeral forms of
# content/_index.md [extra.plural].
#   family-<ea-n>.svg   640 x 240, a column per subfamily EA-n.m, a cell per technique: full
#                       for a developed page, an outline for one in progress
#   section-<slug>.svg  640 x 240, a cell per page of the section, the same two states
#   og-<slug>.png       1200 x 630, the section's og:image (templates/base.html)
#   manifest.json       sha256 of every file, and for each PNG the sha256 of its SVG source
# A PNG is rasterised (rsvg-convert) only when its source changed, so a re-run keeps the
# committed bytes and --check needs no rasteriser.
CONTENT = ROOT / "content"
GENERATED = OUT / "generated"
GRAPH = ROOT / "static" / "data" / "graph.json"
IA = ROOT / "static" / "data" / "ia.json"
MANIFEST = "manifest.json"
SCHEMA = "kompendium-section-graphics/v1"

# The site's Flowbite primary (indigo, styles/app.css) and Tailwind grays.
P = {50: "#eef2ff", 100: "#e0e7ff", 200: "#c7d2fe", 300: "#a5b4fc", 400: "#818cf8",
     500: "#6366f1", 600: "#4f46e5", 700: "#4338ca", 800: "#3730a3", 900: "#312e81"}
G = {50: "#f9fafb", 200: "#e5e7eb", 300: "#d1d5db", 400: "#9ca3af", 500: "#6b7280",
     600: "#4b5563", 700: "#374151", 800: "#1f2937", 900: "#111827"}
UI_FONT = "Inter, ui-sans-serif, system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif"

# Light by default; in a dark colour scheme the tile turns gray-800 with lighter indigo, so the
# graphic carries its own background and stays legible on either page theme.
CARD_STYLE = (
    "<style>"
    f".bg{{fill:{P[50]}}}.on{{fill:{P[600]}}}.off{{fill:none;stroke:{P[400]};stroke-width:1.5}}"
    f".rule{{stroke:{P[200]};stroke-width:2}}.ink{{fill:{G[900]}}}.muted{{fill:{P[700]}}}"
    "@media (prefers-color-scheme:dark){"
    f".bg{{fill:{G[800]}}}.on{{fill:{P[400]}}}.off{{stroke:{P[300]}}}"
    f".rule{{stroke:{G[600]}}}.ink{{fill:#ffffff}}.muted{{fill:{P[300]}}}"
    "}</style>"
)


def front_matter(path: pathlib.Path) -> dict:
    text = path.read_text(encoding="utf-8")
    m = re.match(r"\+\+\+\n(.*?)\n\+\+\+", text, re.S)
    return tomllib.loads(m.group(1)) if m else {}


def slug(key: str) -> str:
    return re.sub(r"[^a-z0-9]+", "-", key.lower()).strip("-")


def esc(s: str) -> str:
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace('"', "&quot;")


def plural(n: int, forms: list) -> str:
    return forms[0] if n == 1 else forms[1] if 2 <= n <= 4 else forms[2]


def num(n: int) -> str:
    return f"{n:,}".replace(",", " ")


def section_inputs() -> dict:
    ia = json.loads(IA.read_text(encoding="utf-8"))
    weak = {p["path"] for p in ia["pages"] if {"detail", "generated"} & set(p["violations"])}
    home = front_matter(CONTENT / "_index.md")
    graph = json.loads(GRAPH.read_text(encoding="utf-8"))
    nodes = graph["nodes"]

    sections = []
    paths = sorted(CONTENT.glob("*/_index.md")) + sorted(CONTENT.glob("kompendium/*/_index.md"))
    for path in paths:
        key = path.parent.relative_to(CONTENT).as_posix()
        pages = sorted((n for n in nodes if n["path"].startswith(key + "/")
                        and n["path"] != key + "/_index.md"), key=lambda n: n["path"])
        sections.append({"key": key, "slug": slug(key), "title": front_matter(path).get("title", key),
                         "pages": [n["path"] not in weak for n in pages]})

    families = []
    for code, name in sorted(graph["families"].items(), key=lambda kv: int(kv[0].split("-")[1])):
        members = sorted((n for n in nodes if str(n.get("ea_code", "")).split(".")[0] == code),
                         key=lambda n: (n["ea_code"], n["path"]))
        subs = {}
        for n in members:
            sub = ".".join(n["ea_code"].split(".")[:2])
            subs.setdefault(sub, []).append(n["path"] not in weak)
        families.append({"code": code, "slug": slug(code), "name": name,
                         "subs": sorted(subs.items(), key=lambda kv: [int(x) for x in re.findall(r"\d+", kv[0])])})
    return {"book": home.get("title", ""), "forms": home["extra"]["plural"]["stranka"],
            "sections": sections, "families": families}


def cell(x: float, y: float, s: float, developed: bool) -> str:
    if developed:
        return f'<rect class="on" x="{x:.1f}" y="{y:.1f}" width="{s:.1f}" height="{s:.1f}" rx="{s * 0.2:.1f}"/>'
    i = 0.75
    return (f'<rect class="off" x="{x + i:.1f}" y="{y + i:.1f}" width="{s - 2 * i:.1f}" '
            f'height="{s - 2 * i:.1f}" rx="{s * 0.2:.1f}"/>')


def grid(states: list, x0: float, y0: float, w: float, h: float) -> list:
    """A square-cell grid of len(states) cells filling w x h, row by row."""
    n = max(1, len(states))
    cols = max(1, math.ceil(math.sqrt(n * w / h)))
    rows = math.ceil(n / cols)
    pitch = min(w / cols, h / rows)
    size = pitch * 0.78
    ox = x0 + (w - cols * pitch) / 2
    oy = y0 + (h - rows * pitch) / 2
    return [cell(ox + (i % cols) * pitch, oy + (i // cols) * pitch, size, d) for i, d in enumerate(states)]


def card_svg(width: int, height: int, body: list, label: str) -> str:
    return (f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {width} {height}" '
            f'width="{width}" height="{height}" role="img" aria-label="{esc(label)}">'
            f"{CARD_STYLE}<rect class=\"bg\" width=\"{width}\" height=\"{height}\"/>" + "".join(body) + "</svg>\n")


# Card graphics are 8:3 and carry no text (the card prints the code, title and count), so a
# card may crop them to its own box (object-cover) without cutting a word.
CARD_W, CARD_H = 640, 240


def family_svg(f: dict) -> str:
    subs = f["subs"]
    tallest = max(len(s[1]) for s in subs)
    gap = 560 / len(subs)
    # Each subfamily is a column k cells wide, filled from the bottom; k is the same for every
    # column and chosen so the cells come out as large as the space allows.
    pitch, k = max((min(gap * 0.86 / k, 184 / math.ceil(tallest / k)), k)
                   for k in range(1, tallest + 1))
    size = pitch * 0.8
    body = [f'<line class="rule" x1="40" y1="{CARD_H - 26}" x2="{CARD_W - 40}" y2="{CARD_H - 26}"/>']
    for i, (_, states) in enumerate(subs):
        x = 40 + i * gap + (gap - k * pitch) / 2
        for j, d in enumerate(states):
            body.append(cell(x + (j % k) * pitch, CARD_H - 32 - (j // k + 1) * pitch, size, d))
    return card_svg(CARD_W, CARD_H, body, f'{f["code"]} {f["name"]}')


def section_svg(s: dict) -> str:
    body = grid(s["pages"], 40, 24, CARD_W - 80, CARD_H - 48) if s["pages"] else [
        f'<line class="rule" x1="40" y1="{CARD_H / 2}" x2="{CARD_W - 40}" y2="{CARD_H / 2}"/>']
    return card_svg(CARD_W, CARD_H, body, s["title"])


def wrap(text: str, width: int) -> list:
    lines, line = [], ""
    for word in text.split():
        if line and len(line) + 1 + len(word) > width:
            lines.append(line)
            line = word
        else:
            line = f"{line} {word}".strip()
    if line:
        lines.append(line)
    if len(lines) > 3:
        lines = lines[:3]
        lines[2] = lines[2].rstrip(".,;:") + "…"
    return lines


def section_og_svg(s: dict, book: str, forms: list) -> str:
    """The sharing image of a section. Light only: a PNG cannot follow the reader's theme."""
    w, h = 1200, 630
    style = (f"<style>.bg{{fill:#ffffff}}.band{{fill:{P[50]}}}.on{{fill:{P[600]}}}"
             f".off{{fill:none;stroke:{P[400]};stroke-width:2}}.ink{{fill:{G[900]}}}"
             f".muted{{fill:{P[700]}}}.rule{{fill:{P[600]}}}</style>")
    body = [f'<rect class="band" x="760" width="440" height="{h}"/>',
            f'<rect class="rule" x="72" y="96" width="96" height="8" rx="4"/>',
            f'<text class="muted" x="72" y="156" font-family="{UI_FONT}" font-size="28" font-weight="600">'
            f"{esc(book)}</text>"]
    # The largest size at which the title fits 640 px in at most three lines (a bold glyph is
    # about 0.62 em wide); the longest titles end with an ellipsis at the smallest size.
    for size in (64, 56, 48, 42):
        per_line = int(640 / (0.62 * size))
        lines = wrap(s["title"], per_line)
        if len(lines) <= 3 and all(len(x) <= per_line for x in lines) and not lines[-1].endswith("…"):
            break
    for i, line in enumerate(lines):
        body.append(f'<text class="ink" x="72" y="{214 + size + i * round(size * 1.18)}" '
                    f'font-family="{UI_FONT}" font-size="{size}" font-weight="800">{esc(line)}</text>')
    n = len(s["pages"])
    body.append(f'<text class="muted" x="72" y="548" font-family="{UI_FONT}" font-size="30" '
                f'font-weight="600">{num(n)} {esc(plural(n, forms))}</text>')
    body += grid(s["pages"], 800, 72, 360, 486) if s["pages"] else []
    return (f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {w} {h}" width="{w}" height="{h}">'
            f'{style}<rect class="bg" width="{w}" height="{h}"/>' + "".join(body) + "</svg>\n")


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def png_size(data: bytes) -> tuple:
    if data[:8] != b"\x89PNG\r\n\x1a\n":
        return (0, 0)
    return struct.unpack(">II", data[16:24])


def rsvg(jobs: list) -> None:
    """[(svg text, png path)] -> 1200 x 630 PNG through rsvg-convert, as render-graphics.sh."""
    if not shutil.which("rsvg-convert"):
        sys.exit("render-graphics: rsvg-convert is required (brew install librsvg)")
    for text, png in jobs:
        subprocess.run(["rsvg-convert", "-w", "1200", "-h", "630", "-o", str(png)],
                       input=text.encode("utf-8"), check=True)


def generated_plan() -> tuple:
    data = section_inputs()
    svgs = {}
    for f in data["families"]:
        svgs[f"family-{f['slug']}.svg"] = family_svg(f)
    for s in data["sections"]:
        svgs[f"section-{s['slug']}.svg"] = section_svg(s)
    ogs = {f"og-{s['slug']}.png": section_og_svg(s, data["book"], data["forms"]) for s in data["sections"]}
    return svgs, ogs


def generated_manifest(svgs: dict, ogs: dict) -> dict:
    files = {}
    for name, text in sorted(svgs.items()):
        files[name] = {"sha256": sha(text.encode("utf-8"))}
    for name, text in sorted(ogs.items()):
        data = (GENERATED / name).read_bytes() if (GENERATED / name).exists() else b""
        files[name] = {"sha256": sha(data), "source_sha256": sha(text.encode("utf-8")),
                       "width": png_size(data)[0], "height": png_size(data)[1]}
    return {"schema": SCHEMA, "generator": "scripts/render-graphics.py", "files": files}


def generated_check(svgs: dict, ogs: dict) -> list:
    problems = []
    try:
        recorded = json.loads((GENERATED / MANIFEST).read_text(encoding="utf-8"))["files"]
    except (OSError, ValueError, KeyError):
        return [f"{MANIFEST} is missing or unreadable"]
    expected = set(svgs) | set(ogs) | {MANIFEST}
    present = {p.name for p in GENERATED.iterdir()} if GENERATED.exists() else set()
    problems += [f"{n}: missing" for n in sorted(expected - present)]
    problems += [f"{n}: not produced by the generator" for n in sorted(present - expected)]
    for name, text in sorted(svgs.items()):
        if (GENERATED / name).exists() and (GENERATED / name).read_text(encoding="utf-8") != text:
            problems.append(f"{name}: stale")
    for name, text in sorted(ogs.items()):
        if not (GENERATED / name).exists():
            continue
        data = (GENERATED / name).read_bytes()
        rec = recorded.get(name, {})
        if rec.get("source_sha256") != sha(text.encode("utf-8")):
            problems.append(f"{name}: rendered from an older source")
        if rec.get("sha256") != sha(data):
            problems.append(f"{name}: bytes differ from the manifest")
        if png_size(data) != (1200, 630):
            problems.append(f"{name}: {png_size(data)[0]}x{png_size(data)[1]}, not 1200x630")
    if not problems and json.dumps(generated_manifest(svgs, ogs), sort_keys=True) != json.dumps(
            json.loads((GENERATED / MANIFEST).read_text(encoding="utf-8")), sort_keys=True):
        problems.append(f"{MANIFEST}: stale")
    return problems


def lattice_files() -> dict:
    return {
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


def main() -> int:
    args = sys.argv[1:]
    if args not in ([], ["--check"]):
        print(__doc__)
        return 2
    files = lattice_files()
    svgs, ogs = generated_plan()
    if args == ["--check"]:
        problems = [f"{p.relative_to(ROOT)}: stale" for p, text in files.items()
                    if not p.exists() or p.read_text(encoding="utf-8") != text]
        problems += [f"static/img/generated/{p}" for p in generated_check(svgs, ogs)]
        for p in problems:
            print(f"render-graphics: {p}")
        if problems:
            print("render-graphics: stale; run scripts/render-graphics.sh")
            return 1
        print(f"render-graphics: {len(files)} SVG, and in static/img/generated {len(svgs)} SVG "
              f"and {len(ogs)} PNG current")
        return 0
    OUT.mkdir(parents=True, exist_ok=True)
    for path, text in files.items():
        path.write_text(text, encoding="utf-8")
        print(f"wrote {path.relative_to(ROOT)} ({len(text) // 1024} KiB)")
    GENERATED.mkdir(parents=True, exist_ok=True)
    expected = set(svgs) | set(ogs) | {MANIFEST}
    for p in GENERATED.iterdir():
        if p.name not in expected:
            p.unlink()
    for name, text in svgs.items():
        path = GENERATED / name
        if not path.exists() or path.read_text(encoding="utf-8") != text:
            path.write_text(text, encoding="utf-8")
    try:
        recorded = json.loads((GENERATED / MANIFEST).read_text(encoding="utf-8"))["files"]
    except (OSError, ValueError, KeyError):
        recorded = {}
    jobs = []
    for name, text in sorted(ogs.items()):
        path = GENERATED / name
        rec = recorded.get(name, {})
        if not (path.exists() and rec.get("source_sha256") == sha(text.encode("utf-8"))
                and rec.get("sha256") == sha(path.read_bytes())):
            jobs.append((text, path))
    if jobs:
        rsvg(jobs)
    (GENERATED / MANIFEST).write_text(json.dumps(generated_manifest(svgs, ogs), ensure_ascii=False,
                                                 indent=1, sort_keys=True) + "\n", encoding="utf-8")
    print(f"wrote static/img/generated: {len(svgs)} SVG, {len(ogs)} PNG ({len(jobs)} rasterised)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
