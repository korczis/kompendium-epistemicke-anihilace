#!/usr/bin/env python3
"""Derive the catalogue of the site's interactive surfaces and gate their coverage.

Temporary, to be folded into build-graph.py together with build-ui-data.py; do not extend.

Writes static/data/surfaces.json (nobody edits it by hand): for every page class, its
templates and partials, the data files and viz scripts they load, the interactive views its
built pages render and the scenarios of test/e2e/surfaces.cjs that exercise them.

  page class  the section of a page (scripts/ia_model.py:section_of: kompendium/<folder>, else
              the first folder, else root); ia_model has no page_class() on this base
  templates   resolved as Zola does: the page's own `template`, else the nearest ancestor
              section's `page_template`, else page.html (section.html for an _index.md)
  partials    every template reachable through {% extends %} and {% include %} (Tera parse)
  data        literal load_data() paths of those templates, plus the chart_inline data files
              (static/data/charts/<slug>.json) the class's content calls
  scripts     script tags of those templates and the viz_script components of the content,
              with the vendored libraries each needs (static/data/viz-deps.json)
  views       what the built HTML of the class's pages actually loads: js/viz, js/kompendium
              and js/p5 scripts, Mermaid diagrams, chart_inline figures; conditional includes
              are decided by the build, not by re-implementing Tera
  scenarios   FIXED and derived(fromDir(site)) of test/e2e/surfaces.cjs (the module export)
              whose page is in the class, with the views each one covers

A view counts for its class unless it is generic (GENERIC_VIEWS: on every page of its kind,
so it proves nothing about the class) or not a view (NOT_VIEWS). A scenario covers every view
of its page when it checks rendering (painted canvases, counts, text); with nothing painted it
covers only the view its `interact` or `mermaid` check names.

The gate: a class that has no view covered by a scenario on one of its own pages is a gap.
KNOWN_GAPS is a ratchet: a gap not on it fails, an entry that is no longer a gap (or no longer a
class) fails until it is removed, so the list only shrinks.

The views come from a built site (default public/, from `npm run build` or `zola build`):
derived() picks the Mermaid page and, for every class without a scenario of its own, the class's
most linked page that renders a view from the built HTML. Run this after the build; it refuses a
site whose data/*.json differ from static/data/.

Usage:
  scripts/build-surfaces.py                 regenerate static/data/surfaces.json
  scripts/build-surfaces.py --check         exit 1 when the file is stale or the gate fails
  scripts/build-surfaces.py --site DIR      read the built site from DIR (default public)
"""
import collections
import json
import pathlib
import re
import subprocess
import sys
import tomllib

sys.dont_write_bytecode = True  # no __pycache__ in the checkout
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from ia_model import CONTENT, ROOT, TOML_FM, section_of, url_of  # noqa: E402

OUT = ROOT / "static" / "data" / "surfaces.json"
TEMPLATES = ROOT / "templates"
VIZ_DEPS = ROOT / "static" / "data" / "viz-deps.json"
SURFACES_CJS = ROOT / "test" / "e2e" / "surfaces.cjs"
# Data files derived() reads from the site: they must be the ones in static/data/.
SITE_DATA = ("graph.json", "search.json")

# Classes whose pages render no view covered by a scenario on one of their own pages. Ratchet:
# a new gap fails, and an entry that is covered (or gone) fails until it is removed here.
KNOWN_GAPS = (
)

# On every page of its kind, so they say nothing about a class: the neighbourhood graph under
# every page.html page and the generic overview of every section with pages.
GENERIC_VIEWS = {
    "viz/okoli": "graf okolí pod každou stránkou (page.html)",
    "viz/oddil": "obecný přehled každého oddílu (partials/section-overview.html)",
}
# Loaded by the shell on every page, or the component layer the views draw through
# (scripts/check-viz-layer.py: vrstva.js for p5/three canvases, jadro.js the search and
# neighbourhood engine (kompendium-engine/v1), kompendium-viz.js for
# ECharts/cytoscape, kniha.js for Chart.js): not a view of a page. A view's canvas made through
# the layer still counts, under the view's own script.
NOT_VIEWS = {"viz/paleta", "viz/kompendium-viz", "viz/vrstva", "viz/jadro", "kompendium/kniha"}
# A scenario that paints nothing covers only the view its interaction or Mermaid check names.
INTERACT_VIEWS = {"kostka": "viz/kostka", "faseta": "viz/glosar", "rejstrik": "viz/rejstrik"}
RENDER_CHECKS = ("painted", "count", "counts", "text")

EXTENDS = re.compile(r"""\{%-?\s*extends\s+["']([^"']+)["']""")
INCLUDE = re.compile(r"""\{%-?\s*include\s+["']([^"']+)["']""")
LOAD_DATA = re.compile(r"""load_data\(path=["']([^"']+)["']\s*\)""")
SCRIPT = re.compile(r"""(?:get_url\(path=['"]|config\.base_url\s*\}\}/)(js/[\w./-]+?\.js)""")
COMPONENT = re.compile(r"\{\{\s*<([a-z_]+)")
VIZ_SCRIPT = re.compile(r"""<viz_script\s+name=["']([^"']+)["']""")
CHART_INLINE = re.compile(r"""<chart_inline\s+slug=["']([^"']+)["']""")
VIEW_SCRIPT = re.compile(r"""/js/(viz|kompendium|p5)/([\w-]+)\.js""")
MERMAID = 'data-lang="mermaid"'
CHART = 'data-chart="'


def content_files() -> list:
    """Path, url, class and kind of every content file (the ia_model mapping, without the text
    analyses of ia_model.load_pages, which this gate does not need)."""
    out = []
    for f in sorted(CONTENT.rglob("*.md")):
        rel = pathlib.PurePosixPath(f.relative_to(CONTENT).as_posix())
        out.append({"path": rel.as_posix(), "url": url_of(rel), "section": section_of(rel),
                    "is_index": rel.name == "_index.md"})
    return out


def front_matter(path: str) -> dict:
    m = TOML_FM.match((CONTENT / path).read_text(encoding="utf-8"))
    if not m:
        return {}
    try:
        return tomllib.loads(m.group(1))
    except tomllib.TOMLDecodeError:
        return {}


def template_of(page: dict, fronts: dict) -> str:
    """The template Zola renders a content file with."""
    path, front = page["path"], fronts[page["path"]]
    if front.get("template"):
        return str(front["template"])
    if page["is_index"]:
        return "section.html"
    folder = path.rsplit("/", 1)[0] if "/" in path else ""
    while True:
        index = f"{folder}/_index.md" if folder else "_index.md"
        if index in fronts and fronts[index].get("page_template"):
            return str(fronts[index]["page_template"])
        if not folder:
            return "page.html"
        folder = folder.rsplit("/", 1)[0] if "/" in folder else ""


def template_graph() -> dict:
    """name -> {extends, includes, data, scripts} for every template under templates/."""
    graph = {}
    for f in sorted(TEMPLATES.rglob("*.html")):
        text = f.read_text(encoding="utf-8")
        graph[f.relative_to(TEMPLATES).as_posix()] = {
            "extends": EXTENDS.findall(text),
            "includes": sorted(set(INCLUDE.findall(text))),
            "data": sorted(set(LOAD_DATA.findall(text))),
            "scripts": sorted(set(SCRIPT.findall(text))),
        }
    return graph


def reachable(name: str, graph: dict) -> tuple:
    """The extends chain of a template (itself first) and every partial the chain includes."""
    chain = [name]
    while chain[-1] in graph and graph[chain[-1]]["extends"]:
        chain.append(graph[chain[-1]]["extends"][0])
    partials, todo = set(), [inc for t in chain for inc in graph.get(t, {}).get("includes", [])]
    while todo:
        current = todo.pop()
        if current in partials or current in chain:
            continue
        partials.add(current)
        todo.extend(graph.get(current, {}).get("includes", []))
    missing = [t for t in chain + sorted(partials) if t not in graph]
    if missing:
        raise SystemExit(f"build-surfaces: template {missing[0]} does not exist")
    return chain, partials


def html_of(site: pathlib.Path, url: str) -> str:
    path = site / url.strip("/") / "index.html" if url.strip("/") else site / "index.html"
    if not path.exists():
        raise SystemExit(f"build-surfaces: {path} is missing; build the site first (npm run build)")
    return path.read_text(encoding="utf-8")


def views_of(html: str) -> set:
    found = {f"{kind}/{name}" for kind, name in VIEW_SCRIPT.findall(html)}
    if MERMAID in html:
        found.add("mermaid")
    if CHART in html:
        found.add("chart-inline")
    return found - NOT_VIEWS


def scenarios(site: pathlib.Path) -> list:
    """FIXED and derived scenarios, read from the module export of surfaces.cjs."""
    code = ("const s = require(process.argv[1]);"
            "s.derived(s.fromDir(process.argv[2])).then((d) => {"
            "process.stdout.write(JSON.stringify({fixed: s.FIXED, derived: d}));"
            "}).catch((e) => { console.error(e.stack || e); process.exit(1); });")
    try:
        out = subprocess.run(["node", "-e", code, str(SURFACES_CJS), str(site)],
                             capture_output=True, text=True, check=True).stdout
    except subprocess.CalledProcessError as exc:
        raise SystemExit(f"build-surfaces: surfaces.cjs derived() failed:\n{exc.stderr}")
    data = json.loads(out)
    keep = ("path", "note", "painted", "count", "counts", "interact", "mermaid", "text")
    return ([dict({k: s[k] for k in keep if k in s}, origin="fixed") for s in data["fixed"]]
            + [dict({k: s[k] for k in keep if k in s}, origin="derived") for s in data["derived"]])


def covers(scenario: dict, page_views: set) -> list:
    if scenario.get("painted", 0) > 0 or any(scenario.get(k) for k in RENDER_CHECKS[1:]):
        return sorted(page_views)
    named = set()
    if scenario.get("interact") in INTERACT_VIEWS:
        named.add(INTERACT_VIEWS[scenario["interact"]])
    if scenario.get("mermaid"):
        named.add("mermaid")
    return sorted(named & page_views)


def check_site(site: pathlib.Path) -> None:
    for name in SITE_DATA:
        built, source = site / "data" / name, ROOT / "static" / "data" / name
        if not built.exists():
            raise SystemExit(f"build-surfaces: {built} is missing; build the site first "
                             "(npm run build) or pass --site")
        if built.read_bytes() != source.read_bytes():
            raise SystemExit(f"build-surfaces: {built} differs from static/data/{name}; "
                             "the site is stale, rebuild it")


def build(site: pathlib.Path) -> dict:
    check_site(site)
    pages = content_files()
    fronts = {p["path"]: front_matter(p["path"]) for p in pages}
    graph = template_graph()
    viz_deps = json.loads(VIZ_DEPS.read_text(encoding="utf-8"))["scripts"]
    by_url = {p["url"]: p for p in pages}

    classes = collections.defaultdict(lambda: {
        "pages": 0, "templates": collections.Counter(), "partials": set(), "data": set(),
        "scripts": set(), "libraries": set(), "components": set(),
        "views": collections.Counter(), "generic_views": collections.Counter(),
        "scenarios": []})
    page_views = {}
    for page in pages:
        c = classes[page["section"]]
        c["pages"] += 1
        name = template_of(page, fronts)
        c["templates"][name] += 1
        chain, partials = reachable(name, graph)
        c["partials"] |= partials
        for t in chain + sorted(partials):
            c["data"].update(graph[t]["data"])
            c["scripts"].update(graph[t]["scripts"])
        body = (CONTENT / page["path"]).read_text(encoding="utf-8")
        c["components"].update(COMPONENT.findall(body))
        for viz in VIZ_SCRIPT.findall(body):
            c["scripts"].add(f"js/kompendium/{viz}.js")
            c["libraries"].update(viz_deps.get(f"{viz}.js", []))
        for slug in CHART_INLINE.findall(body):
            c["data"].add(f"static/data/charts/{slug}.json")
        views = views_of(html_of(site, page["url"]))
        page_views[page["path"]] = views
        for v in views:
            (c["generic_views"] if v in GENERIC_VIEWS else c["views"])[v] += 1

    unmapped = []
    for s in scenarios(site):
        page = by_url.get("/" + s["path"])
        if page is None:
            unmapped.append(s)
            continue
        own = {v for v in page_views[page["path"]] if v not in GENERIC_VIEWS}
        s["page"] = page["path"]
        s["covers"] = covers(s, own)
        classes[page["section"]]["scenarios"].append(s)

    out = {}
    for cid, c in sorted(classes.items()):
        covered = sorted({v for s in c["scenarios"] for v in s["covers"]})
        status = "covered" if covered else ("uncovered" if c["views"] else "no-view")
        out[cid] = {
            "pages": c["pages"],
            "templates": dict(sorted(c["templates"].items())),
            "partials": sorted(c["partials"]),
            "data": sorted(c["data"]),
            "scripts": sorted(c["scripts"]),
            "libraries": sorted(c["libraries"]),
            "components": sorted(c["components"]),
            "views": dict(sorted(c["views"].items())),
            "generic_views": dict(sorted(c["generic_views"].items())),
            "scenarios": sorted(c["scenarios"], key=lambda s: (s["path"], s["origin"])),
            "covered_views": covered,
            "status": status,
        }
    gaps = sorted(cid for cid, c in out.items() if c["status"] != "covered")
    return {
        "schema": "kompendium-surfaces/v1",
        "generic_views": GENERIC_VIEWS,
        "classes": out,
        "gaps": gaps,
        "unmapped_scenarios": sorted(unmapped, key=lambda s: s["path"]),
    }


def findings(data: dict) -> list:
    """The ratchet: gaps not on KNOWN_GAPS, and entries of KNOWN_GAPS that are no longer gaps."""
    classes, gaps, known = data["classes"], set(data["gaps"]), set(KNOWN_GAPS)
    out = []
    for cid in sorted(gaps - known):
        c = classes[cid]
        why = ("its views " + ", ".join(c["views"]) + " have no scenario on its pages"
               if c["status"] == "uncovered" else "its pages render no class view")
        out.append(f"{cid}: new class without a view covered by a scenario ({why})")
    for cid in sorted(known - gaps):
        if cid in classes:
            out.append(f"{cid}: covered now; remove it from KNOWN_GAPS (the list only shrinks)")
        else:
            out.append(f"{cid}: not a page class any more; remove it from KNOWN_GAPS")
    if list(KNOWN_GAPS) != sorted(set(KNOWN_GAPS)):
        out.append("KNOWN_GAPS: keep it sorted and without duplicates")
    return out


def serialise(data: dict) -> str:
    return json.dumps(data, ensure_ascii=False, indent=1, sort_keys=True) + "\n"


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    check, site = False, ROOT / "public"
    while args:
        arg = args.pop(0)
        if arg == "--check":
            check = True
        elif arg == "--site" and args:
            site = pathlib.Path(args.pop(0)).resolve()
        else:
            # An unknown option must never fall through to write mode.
            print(f"build-surfaces: unknown argument {arg}; see --help", file=sys.stderr)
            return 2
    data = build(site)
    text = serialise(data)
    current = OUT.read_text(encoding="utf-8") if OUT.exists() else None
    problems = findings(data)
    for p in problems:
        print(f"build-surfaces: {p}")
    if check:
        if current != text:
            print("build-surfaces: stale static/data/surfaces.json; run scripts/build-surfaces.py")
            return 1
        if problems:
            return 1
        n = len(data["classes"])
        print(f"build-surfaces: up to date; {n - len(data['gaps'])} of {n} classes covered, "
              f"{len(data['gaps'])} known gaps")
        return 0
    if current != text:
        OUT.write_text(text, encoding="utf-8")
        print("build-surfaces: wrote static/data/surfaces.json")
    else:
        print("build-surfaces: static/data/surfaces.json up to date")
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
