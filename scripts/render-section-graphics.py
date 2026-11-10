#!/usr/bin/env python3
"""Renders the landing page's section graphics from the content, deterministically.

Inputs, all derived (no hand lists): the title of every top-level section (content/<top>/_index.md
and content/kompendium/<section>/_index.md), the families of techniques and every page of the
link graph (static/data/graph.json: path, EA code), whether each page is developed
(static/data/ia.json: no violation of the rules `detail` or `generated` of scripts/check-ia.py)
and the numeral forms of content/_index.md [extra.plural].

Outputs, only into static/img/generated/:
  family-<ea-n>.svg     one per EA family, 640 x 240: a column per subfamily (EA-n.m), a cell per
                        technique, a full cell for a developed page and an outline for one in
                        progress
  section-<slug>.svg    one per top-level section, 640 x 240: a cell per page, the same two states
  og-<slug>.png         one per top-level section, 1200 x 630, for og:image (base.html)
  manifest.json         sha256 of every file, and for each PNG the sha256 of the SVG it was
                        rasterised from

SVG is pure text built here, so the same input gives the same bytes on any machine. A PNG is
rasterised with playwright-core (already a dev dependency) only when the SVG it comes from has
changed, so a re-run keeps the committed bytes; `--check` therefore never needs a browser: it
compares every SVG byte for byte, the source hash of every PNG and the hash and size of every
file in the directory, and fails on anything stale, missing or extra.

Usage: scripts/render-section-graphics.py [--check]
"""

import hashlib
import json
import math
import pathlib
import re
import struct
import subprocess
import sys
import tempfile
import tomllib

ROOT = pathlib.Path(__file__).resolve().parent.parent
CONTENT = ROOT / "content"
OUT = ROOT / "static" / "img" / "generated"
GRAPH = ROOT / "static" / "data" / "graph.json"
IA = ROOT / "static" / "data" / "ia.json"
MANIFEST = "manifest.json"
SCHEMA = "kompendium-section-graphics/v1"

# The site's Flowbite primary (indigo, styles/app.css) and Tailwind grays.
P = {50: "#eef2ff", 100: "#e0e7ff", 200: "#c7d2fe", 300: "#a5b4fc", 400: "#818cf8",
     500: "#6366f1", 600: "#4f46e5", 700: "#4338ca", 800: "#3730a3", 900: "#312e81"}
G = {50: "#f9fafb", 200: "#e5e7eb", 300: "#d1d5db", 400: "#9ca3af", 500: "#6b7280",
     600: "#4b5563", 700: "#374151", 800: "#1f2937", 900: "#111827"}
FONT = "Inter, ui-sans-serif, system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif"

# Light by default; in a dark colour scheme the tile turns gray-800 with lighter indigo, so the
# graphic carries its own background and stays legible on either page theme.
STYLE = (
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


def inputs() -> dict:
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


def svg(width: int, height: int, body: list, label: str) -> str:
    return (f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {width} {height}" '
            f'width="{width}" height="{height}" role="img" aria-label="{esc(label)}">'
            f"{STYLE}<rect class=\"bg\" width=\"{width}\" height=\"{height}\"/>" + "".join(body) + "</svg>\n")


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
    return svg(CARD_W, CARD_H, body, f'{f["code"]} {f["name"]}')


def section_svg(s: dict) -> str:
    body = grid(s["pages"], 40, 24, CARD_W - 80, CARD_H - 48) if s["pages"] else [
        f'<line class="rule" x1="40" y1="{CARD_H / 2}" x2="{CARD_W - 40}" y2="{CARD_H / 2}"/>']
    return svg(CARD_W, CARD_H, body, s["title"])


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


def og_svg(s: dict, book: str, forms: list) -> str:
    """The sharing image of a section. Light only: a PNG cannot follow the reader's theme."""
    w, h = 1200, 630
    style = (f"<style>.bg{{fill:#ffffff}}.band{{fill:{P[50]}}}.on{{fill:{P[600]}}}"
             f".off{{fill:none;stroke:{P[400]};stroke-width:2}}.ink{{fill:{G[900]}}}"
             f".muted{{fill:{P[700]}}}.rule{{fill:{P[600]}}}</style>")
    body = [f'<rect class="band" x="760" width="440" height="{h}"/>',
            f'<rect class="rule" x="72" y="96" width="96" height="8" rx="4"/>',
            f'<text class="muted" x="72" y="156" font-family="{FONT}" font-size="28" font-weight="600">'
            f"{esc(book)}</text>"]
    for i, line in enumerate(wrap(s["title"], 24)):
        body.append(f'<text class="ink" x="72" y="{262 + i * 76}" font-family="{FONT}" font-size="64" '
                    f'font-weight="800">{esc(line)}</text>')
    n = len(s["pages"])
    body.append(f'<text class="muted" x="72" y="548" font-family="{FONT}" font-size="30" '
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


RASTER = r"""
const fs = require('node:fs');
const { chromium } = require(process.env.PLAYWRIGHT || 'playwright-core');
(async () => {
  const jobs = JSON.parse(fs.readFileSync(process.argv[2], 'utf8'));
  const browser = await chromium.launch();
  const page = await browser.newPage({ viewport: { width: 1200, height: 630 }, colorScheme: 'light' });
  for (const [svgFile, pngFile] of jobs) {
    const svg = fs.readFileSync(svgFile, 'utf8');
    await page.setContent('<!doctype html><html><body style="margin:0">' + svg + '</body></html>');
    await page.screenshot({ path: pngFile, clip: { x: 0, y: 0, width: 1200, height: 630 } });
  }
  await browser.close();
})().catch((e) => { console.error(e); process.exit(1); });
"""


def rasterise(jobs: list) -> None:
    """[(svg text, png path)] -> PNG files, through playwright-core from node_modules."""
    with tempfile.TemporaryDirectory() as tmp:
        tmp = pathlib.Path(tmp)
        pairs = []
        for i, (text, png) in enumerate(jobs):
            src = tmp / f"{i}.svg"
            src.write_text(text, encoding="utf-8")
            pairs.append([str(src), str(png)])
        (tmp / "jobs.json").write_text(json.dumps(pairs), encoding="utf-8")
        (tmp / "raster.cjs").write_text(RASTER, encoding="utf-8")
        subprocess.run(["node", str(tmp / "raster.cjs"), str(tmp / "jobs.json")], cwd=ROOT,
                       check=True, env={**__import__("os").environ,
                                        "NODE_PATH": str(ROOT / "node_modules")})


def plan() -> tuple:
    data = inputs()
    svgs = {}
    for f in data["families"]:
        svgs[f"family-{f['slug']}.svg"] = family_svg(f)
    for s in data["sections"]:
        svgs[f"section-{s['slug']}.svg"] = section_svg(s)
    ogs = {f"og-{s['slug']}.png": og_svg(s, data["book"], data["forms"]) for s in data["sections"]}
    return svgs, ogs


def manifest(svgs: dict, ogs: dict) -> dict:
    files = {}
    for name, text in sorted(svgs.items()):
        files[name] = {"sha256": sha(text.encode("utf-8"))}
    for name, text in sorted(ogs.items()):
        data = (OUT / name).read_bytes() if (OUT / name).exists() else b""
        files[name] = {"sha256": sha(data), "source_sha256": sha(text.encode("utf-8")),
                       "width": png_size(data)[0], "height": png_size(data)[1]}
    return {"schema": SCHEMA, "generator": "scripts/render-section-graphics.py", "files": files}


def check(svgs: dict, ogs: dict) -> list:
    problems = []
    try:
        recorded = json.loads((OUT / MANIFEST).read_text(encoding="utf-8"))["files"]
    except (OSError, ValueError, KeyError):
        return [f"{MANIFEST} is missing or unreadable"]
    expected = set(svgs) | set(ogs) | {MANIFEST}
    present = {p.name for p in OUT.iterdir()} if OUT.exists() else set()
    problems += [f"{n}: missing" for n in sorted(expected - present)]
    problems += [f"{n}: not produced by the generator" for n in sorted(present - expected)]
    for name, text in sorted(svgs.items()):
        if (OUT / name).exists() and (OUT / name).read_text(encoding="utf-8") != text:
            problems.append(f"{name}: stale")
    for name, text in sorted(ogs.items()):
        if not (OUT / name).exists():
            continue
        data = (OUT / name).read_bytes()
        rec = recorded.get(name, {})
        if rec.get("source_sha256") != sha(text.encode("utf-8")):
            problems.append(f"{name}: rendered from an older source")
        if rec.get("sha256") != sha(data):
            problems.append(f"{name}: bytes differ from the manifest")
        if png_size(data) != (1200, 630):
            problems.append(f"{name}: {png_size(data)[0]}x{png_size(data)[1]}, not 1200x630")
    if not problems and json.dumps(manifest(svgs, ogs), sort_keys=True) != json.dumps(
            json.loads((OUT / MANIFEST).read_text(encoding="utf-8")), sort_keys=True):
        problems.append(f"{MANIFEST}: stale")
    return problems


def main() -> int:
    args = sys.argv[1:]
    if args not in ([], ["--check"]):
        print(__doc__)
        return 2
    svgs, ogs = plan()
    if args == ["--check"]:
        problems = check(svgs, ogs)
        for p in problems:
            print(f"render-section-graphics: {p}")
        if problems:
            print("render-section-graphics: stale; run scripts/render-section-graphics.py")
            return 1
        print(f"render-section-graphics: {len(svgs)} SVG and {len(ogs)} PNG current")
        return 0
    OUT.mkdir(parents=True, exist_ok=True)
    expected = set(svgs) | set(ogs) | {MANIFEST}
    for p in OUT.iterdir():
        if p.name not in expected:
            p.unlink()
    for name, text in svgs.items():
        path = OUT / name
        if not path.exists() or path.read_text(encoding="utf-8") != text:
            path.write_text(text, encoding="utf-8")
    try:
        recorded = json.loads((OUT / MANIFEST).read_text(encoding="utf-8"))["files"]
    except (OSError, ValueError, KeyError):
        recorded = {}
    jobs = []
    for name, text in sorted(ogs.items()):
        path = OUT / name
        rec = recorded.get(name, {})
        fresh = (path.exists() and rec.get("source_sha256") == sha(text.encode("utf-8"))
                 and rec.get("sha256") == sha(path.read_bytes()))
        if not fresh:
            jobs.append((text, path))
    if jobs:
        rasterise(jobs)
    (OUT / MANIFEST).write_text(json.dumps(manifest(svgs, ogs), ensure_ascii=False, indent=1,
                                           sort_keys=True) + "\n", encoding="utf-8")
    print(f"render-section-graphics: {len(svgs)} SVG, {len(ogs)} PNG ({len(jobs)} rasterised)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
