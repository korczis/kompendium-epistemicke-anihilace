#!/usr/bin/env python3
"""Every visualisation goes through the shared component layer; no script builds its own.

The layer is a fixed set of files, one owner per library:

  static/js/viz/vrstva.js          theme tokens, the categorical palette, the book-data loader
                                   (kniha), p5.js and three.js canvases (size, resize, pause,
                                   reduced motion, label, theme redraw), and the frame every
                                   chart, network and canvas gets (toolbar, maximize to the
                                   viewport, Escape, #max=<id> in the address)
  static/js/viz/kompendium-viz.js  Apache ECharts: the one chart wrapper (KompendiumViz.echarts,
                                   the only echarts.init) and the one network wrapper
                                   (KompendiumViz.network), the derived graph data
  static/js/kompendium/kniha.js    charts over the book's data (K.chart, through the wrapper)
  static/js/site.js                Mermaid diagrams and the chart_inline component (ECharts
                                   option in static/data/charts/, through the wrapper)

Charts and graphs are ECharts only (owner's order of 2026-11-14: "ECharts for charts and graphs,
D3 for bespoke layouts and force physics, p5 for generative art; no Chart.js or Cytoscape; one
component layer per project"). Any use of Chart.js or cytoscape.js is refused wherever it
appears: a constructor or global in a script (`new Chart(`, `window.Chart`, `cytoscape(`), a
vendored bundle (chart.umd.min.js, chart.min.js, cytoscape.min.js) named in a script, template,
the book's markup, scripts/vendor.mjs or package.json, a script tag loading one, a file of
either under static/js/vendor/, or a dependency on either in package.json.

Computation over the book's data has one owner too (ADR 0011, rule project.site-zola-engine):

  static/js/viz/jadro.js           kompendium-engine/v1: search, neighbourhood and the text
                                   folding they use (normalise); a WASM build replaces it once
                                   it reproduces test/cases/engine/
  static/js/viz/vrstva.js          the Zola-shaped URL slug (slug)

Axis labels fit the chart box through the wrapper too: it sets grid.outerBounds on every
cartesian chart (ECharts 6 measures the labels as drawn). The legacy grid.containLabel only
estimates and samples every n-th label above 40 categories, which clipped the longest one, so
`containLabel: true` in a script or in a chart_inline option (static/data/charts/) is a finding.

so text folding (`.normalize('NFD'/'NFKD')`) outside those two is a finding: a filter or a
ranking with its own folding answers differently from the search in the header. Loading the
derived data (fetch) is limited to the existing loaders, so a new script reads through
KompendiumVrstva.kniha, KompendiumViz or the engine instead of fetching static/data itself.

The small helpers every view needs have one copy too, in static/js/viz/vrstva.js
(KompendiumVrstva): esc (text into HTML), plural and count (Czech forms 1 / 2-4 / 5+), ink (text
colour on a fill by WCAG contrast), readJson (data inlined by a template), urlState.get/set (view
state in the address), failed (book data did not load), isIndex, reducedMotion, lazy and
mount (build a view only once it is in view). A script that defines its own function of one of
those names (`function esc(`, `var esc = function`, `const esc = (s) =>`), its own
IntersectionObserver or its own history.replaceState is a finding; an alias of the layer's
helper (`var failed = window.KompendiumVrstva.failed;`) is not. site.js keeps its table-of-contents
scroll spy, which watches headings for as long as the page is open (not a lazy mount).

A script anywhere else under static/js/ (vendor excluded) that constructs one of those
libraries, creates a canvas, or carries its own copy of the book-data loader is a finding:
it would size, theme, pause and label its canvas on its own, which is how the duplicates and
the unlabelled, non-responsive canvases came about. Use KompendiumVrstva.p5/three/kniha,
KompendiumViz.echarts/network, or K.chart instead.

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

# Helper names the layer owns (KompendiumVrstva); a local definition of one is a copy.
HELPERS = r"(?:esc|escapeHtml|plural|ink|readJson|params|failed|isIndex|reducedMotion)\b"

# (what, pattern, files allowed to do it)
RULES = [
    ("p5.js instance", r"\bnew\s+(?:window\.)?p5\s*\(", {"viz/vrstva.js"}),
    ("p5 canvas", r"\.createCanvas\s*\(", {"viz/vrstva.js"}),
    ("three.js renderer", r"\bWebGLRenderer\s*\(", {"viz/vrstva.js"}),
    ("ECharts instance", r"\becharts\.init\s*\(", {"viz/kompendium-viz.js"}),
    ("Mermaid setup", r"\bmermaid\.(?:initialize|run|render)\s*\(", {"site.js"}),
    ("own book-data loader", r"\bfunction\s+kniha\s*\(", {"viz/vrstva.js"}),
    ("own categorical palette", r"PALETTE_(?:LIGHT|DARK)\s*=", {"viz/vrstva.js"}),
    ("own text folding (use KompendiumJadro.normalise or KompendiumVrstva.slug)",
     r"\.normalize\(\s*['\"]NFK?D['\"]\s*\)", {"viz/jadro.js", "viz/vrstva.js"}),
    ("own data fetch (read through KompendiumVrstva.kniha, KompendiumViz or the engine)",
     r"\bfetch\s*\(", {"kompendium/kniha.js", "viz/kompendium-viz.js", "site.js", "viz/paleta.js",
      "viz/jadro-wasm.js"}),
    ("own copy of a layer helper (use KompendiumVrstva.esc/plural/count/ink/readJson/urlState/"
     "failed/isIndex/reducedMotion)",
     r"\bfunction\s+" + HELPERS + r"\s*\(|\b(?:const|let|var)\s+" + HELPERS +
     r"\s*=\s*(?:function\b|\([^)]*\)\s*=>|[A-Za-z_$][\w$]*\s*=>)", {"viz/vrstva.js"}),
    ("own lazy mount (use KompendiumVrstva.lazy or KompendiumVrstva.mount)",
     r"\bnew\s+(?:window\.)?IntersectionObserver\b", {"viz/vrstva.js", "site.js"}),
    ("own URL state (use KompendiumVrstva.urlState.set)",
     r"\bhistory\.replaceState\s*\(", {"viz/vrstva.js"}),
    ("legacy grid.containLabel (the chart wrapper fits axis labels with grid.outerBounds)",
     r"[\"']?\bcontainLabel[\"']?\s*:\s*true\b", {"viz/kompendium-viz.js"}),
]


# Chart.js and cytoscape.js are gone (owner's order of 2026-11-14); no file may bring them back.
# A bundle's file name (lower case, as vendored): the library named in prose ("Chart.js") is not
# a use of it.
BANNED_NAME = re.compile(r"\b(?:chart\.umd(?:\.min)?\.js|chart\.min\.js|cytoscape(?:\.min)?\.js)\b")
BANNED_CODE = re.compile(r"\bnew\s+(?:window\.)?Chart\s*\(|\bwindow\.Chart\b|\btypeof\s+Chart\b|"
                         r"\bcytoscape\s*\(|\bwindow\.cytoscape\b")
BANNED_TAG = re.compile(r"<script\b[^>]*\bsrc=[^>]*(?:chart|cytoscape)[^>]*>", re.I)
BANNED_DEP = re.compile(r'"(?:chart\.js|chartjs|cytoscape(?:-[\w-]+)?|react-chartjs-2|vue-chartjs)"\s*:')
BANNED_VENDOR = re.compile(r"^(?:chart|cytoscape)\b", re.I)


def banned_findings():
    """Chart.js or cytoscape.js anywhere: code, bundle names, script tags, vendored files,
    dependencies."""
    out = []

    def scan(rel, text, patterns):
        for what, rx in patterns:
            for m in rx.finditer(text):
                line = text.count("\n", 0, m.start()) + 1
                out.append(f"{rel}:{line}: {what} ({m.group(0).strip()[:60]}); charts and graphs "
                           "are ECharts only, through KompendiumViz.echarts/network")

    code = [("Chart.js or cytoscape.js call", BANNED_CODE), ("Chart.js or cytoscape.js bundle",
                                                            BANNED_NAME)]
    for rel, text in scripts():
        scan(f"static/js/{rel}", text, code)
    markup = [("script tag loading Chart.js or cytoscape.js", BANNED_TAG),
              ("Chart.js or cytoscape.js bundle", BANNED_NAME)]
    for base, glob in ((ROOT / "templates", "*.html"), (CONTENT, "*.md")):
        for path in sorted(base.rglob(glob)):
            scan(path.relative_to(ROOT).as_posix(), path.read_text(encoding="utf-8"), markup)
    for rel in ("scripts/vendor.mjs", "package.json"):
        path = ROOT / rel
        if path.exists():
            scan(rel, path.read_text(encoding="utf-8"),
                 [("Chart.js or cytoscape.js dependency", BANNED_DEP),
                  ("Chart.js or cytoscape.js bundle", BANNED_NAME),
                  ("Chart.js or cytoscape.js package", re.compile(r"node_modules/(?:chart\.js|cytoscape)\b"))])
    vendor = JS / "vendor"
    if vendor.is_dir():
        for path in sorted(vendor.iterdir()):
            if BANNED_VENDOR.match(path.name):
                out.append(f"static/js/vendor/{path.name}: vendored Chart.js or cytoscape.js; delete it")
    return out


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
        print("Chart.js or cytoscape.js (calls, bundles, script tags, vendored files, "
              "dependencies): nowhere")
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
    legacy = RULES[-1]
    for path in sorted((ROOT / "static" / "data" / "charts").glob("*.json")):
        text = path.read_text(encoding="utf-8")
        for m in re.finditer(legacy[1], text):
            line = text.count("\n", 0, m.start()) + 1
            findings.append(f"{path.relative_to(ROOT).as_posix()}:{line}: {legacy[0]}")
    findings += content_findings()
    findings += banned_findings()
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
