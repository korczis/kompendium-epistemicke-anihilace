#!/usr/bin/env python3
"""Every visualisation goes through the shared component layer; no script builds its own.

The layer is a fixed set of files, one owner per library:

  static/js/viz/vrstva.js          theme tokens, the categorical palette, the book-data loader
                                   (kniha), p5.js and three.js canvases (size, resize, pause,
                                   reduced motion, label, theme redraw)
  static/js/viz/kompendium-viz.js  Apache ECharts and cytoscape.js, the derived graph data
  static/js/kompendium/kniha.js    Chart.js charts over the book's data
  static/js/site.js                Mermaid diagrams and the chart_inline component (Chart.js)

A script anywhere else under static/js/ (vendor excluded) that constructs one of those
libraries, creates a canvas, or carries its own copy of the book-data loader is a finding:
it would size, theme, pause and label its canvas on its own, which is how the duplicates and
the unlabelled, non-responsive canvases came about. Use KompendiumVrstva.p5/three/kniha,
KompendiumViz.echarts/cytoscape, or K.chart instead.

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
]


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
