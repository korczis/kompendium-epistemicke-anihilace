#!/usr/bin/env python3
"""Every visualisation goes through the shared component layer; no script builds its own.

The layer is a fixed set of files, one owner per library:

  static/js/viz/vrstva.js          theme tokens, the categorical palette, the book-data loader
                                   (kniha), p5.js and three.js canvases (size, resize, pause,
                                   reduced motion, label, theme redraw)
  static/js/viz/kompendium-viz.js  Apache ECharts and cytoscape.js, the derived graph data
  static/js/kompendium/kniha.js    Chart.js charts over the book's data
  static/js/site.js                Mermaid diagrams and the chart_inline component (Chart.js)

Computation over the book's data has one owner too (ADR 0011, rule project.site-zola-engine):

  static/js/viz/jadro.js           kompendium-engine/v1: search, neighbourhood and the text
                                   folding they use (normalise); a WASM build replaces it once
                                   it reproduces test/cases/engine/
  static/js/viz/vrstva.js          the Zola-shaped URL slug (slug)

so text folding (`.normalize('NFD'/'NFKD')`) outside those two is a finding: a filter or a
ranking with its own folding answers differently from the search in the header. Loading the
derived data (fetch) is limited to the existing loaders, so a new script reads through
KompendiumVrstva.kniha, KompendiumViz or the engine instead of fetching static/data itself.

A script anywhere else under static/js/ (vendor excluded) that constructs one of those
libraries, creates a canvas, or carries its own copy of the book-data loader is a finding:
it would size, theme, pause and label its canvas on its own, which is how the duplicates and
the unlabelled, non-responsive canvases came about. Use KompendiumVrstva.p5/three/kniha,
KompendiumViz.echarts/cytoscape, or K.chart instead.

Markup written into the book (content/**/*.md) is judged too, because Tailwind generates the
classes it finds there (styles/app.css @source '../content'):

  - no inline style that sets a height or a background: the layer sizes canvases, the theme
    colours surfaces;
  - no colour class (text-, bg-, border- with a palette shade) without a dark: counterpart in
    the same class attribute: a dark-only class is light text on a white page in the light
    theme. A solid button (bg-<colour>-6xx/7xx with text-white) is exempt.

Usage:
  scripts/check-viz-layer.py           report findings, exit 1 when there are any
  scripts/check-viz-layer.py --list    print the layer and the rules, exit 0
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
JS = ROOT / "static" / "js"

# (what, pattern, files allowed to do it)
RULES = [
    ("p5.js instance", r"\bnew\s+(?:window\.)?p5\s*\(", {"viz/vrstva.js"}),
    ("p5 canvas", r"\.createCanvas\s*\(", {"viz/vrstva.js"}),
    ("three.js renderer", r"\bWebGLRenderer\s*\(", {"viz/vrstva.js"}),
    ("Chart.js chart", r"\bnew\s+(?:window\.)?Chart\s*\(", {"kompendium/kniha.js", "site.js"}),
    ("ECharts instance", r"\becharts\.init\s*\(", {"viz/kompendium-viz.js"}),
    ("cytoscape instance", r"\bcytoscape\s*\(\s*\{", {"viz/kompendium-viz.js"}),
    ("Mermaid setup", r"\bmermaid\.(?:initialize|run|render)\s*\(", {"site.js"}),
    ("own book-data loader", r"\bfunction\s+kniha\s*\(", {"viz/vrstva.js"}),
    ("own categorical palette", r"PALETTE_(?:LIGHT|DARK)\s*=", {"viz/vrstva.js"}),
    ("own text folding (use KompendiumJadro.normalise or KompendiumVrstva.slug)",
     r"\.normalize\(\s*['\"]NFK?D['\"]\s*\)", {"viz/jadro.js", "viz/vrstva.js"}),
    ("own data fetch (read through KompendiumVrstva.kniha, KompendiumViz or the engine)",
     r"\bfetch\s*\(", {"kompendium/kniha.js", "viz/kompendium-viz.js", "site.js", "viz/paleta.js",
      "viz/jadro-wasm.js"}),
]


CONTENT = ROOT / "content"
STYLE = re.compile(r'style="[^"]*\b(?:height|min-height|background(?:-color)?)\s*:', re.I)
CLASS_ATTR = re.compile(r'class="([^"]*)"')
COLOUR = re.compile(r"^(text|bg|border)-(slate|gray|zinc|neutral|stone|red|orange|amber|yellow|"
                    r"lime|green|emerald|teal|cyan|sky|blue|indigo|violet|purple|fuchsia|pink|rose)"
                    r"-[0-9]{2,3}(/[0-9]+)?$")
SOLID = re.compile(r"^bg-[a-z]+-[67]00$")


def content_findings():
    """Inline sizes/backgrounds and dark-only colour classes in the book's markup."""
    out = []
    for path in sorted(CONTENT.rglob("*.md")):
        text = path.read_text(encoding="utf-8")
        rel = path.relative_to(ROOT).as_posix()
        for m in STYLE.finditer(text):
            line = text.count("\n", 0, m.start()) + 1
            out.append(f"{rel}:{line}: inline height or background in content markup "
                       "(the layer sizes, the theme colours)")
        for m in CLASS_ATTR.finditer(text):
            classes = m.group(1).split()
            if any(c.startswith("dark:") for c in classes):
                continue
            colours = [c for c in classes if COLOUR.match(c)]
            if not colours:
                continue
            if any(SOLID.match(c) for c in colours) and "text-white" in classes:
                continue
            line = text.count("\n", 0, m.start()) + 1
            out.append(f"{rel}:{line}: colour class {colours[0]} without a dark: counterpart")
    return out


def scripts():
    for path in sorted(JS.rglob("*.js")):
        rel = path.relative_to(JS).as_posix()
        if rel.startswith("vendor/") or ".min." in rel:
            continue
        yield rel, path.read_text(encoding="utf-8")


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    unknown = [a for a in args if a != "--list"]
    if unknown:
        print(f"check-viz-layer: unknown argument {unknown[0]}; see --help", file=sys.stderr)
        return 2
    if "--list" in args:
        for what, pattern, allowed in RULES:
            print(f"{what}: only {', '.join(sorted(allowed))}")
        return 0
    findings = []
    for rel, text in scripts():
        for what, pattern, allowed in RULES:
            if rel in allowed:
                continue
            for m in re.finditer(pattern, text):
                line = text.count("\n", 0, m.start()) + 1
                findings.append(f"static/js/{rel}:{line}: {what} outside the layer "
                                f"({', '.join(sorted(allowed))})")
    findings += content_findings()
    for f in findings:
        print(f)
    files = len({f.split(":")[0] for f in findings})
    if findings:
        print(f"check-viz-layer: {len(findings)} finding(s) in {files} file(s); "
              "see scripts/check-viz-layer.py --help", file=sys.stderr)
        return 1
    print("check-viz-layer: every visualisation goes through the layer")
    return 0


if __name__ == "__main__":
    sys.exit(main())
