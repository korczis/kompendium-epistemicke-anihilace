#!/usr/bin/env python3
"""Derive the data the site's shell reads: navigation, related terms, search, viz libraries.

Temporary: once both ui-app-shell-v2 and the content lane's head (feature/content-expansion)
are on main, the first train after that folds these outputs into scripts/build-graph.py under
its single --check and deletes this file. Do not extend it meanwhile.

Writes, into static/data/ (nobody edits them by hand):

  nav.json       every section (by its _index.md path): title, url, its pages in the section's
                 own order ([url, title, EA code]), its subsections and the number of pages in
                 its subtree; the sidebar subtrees, sub-navigation tabs and page position read it
  terms.json     every page slug (file stem) -> [url, title, category]; resolves a page's
                 `extra.related_terms` into links (a glossary entry wins a shared slug)
  glossary.json  the glossary's facets: categories and initial letters with counts, totals
  search.json    the one search index of the site, read by the navbar combobox
                 (static/js/site.js) and by the command palette (static/js/viz/paleta.js):
                 per page [title, description, url, EA code, kind, aliases, in-links,
                 file, tags], plus the section labels; the source path and section of an
                 entry follow from its url and file (0 page.md, 1 _index.md, 2 index.md)
  viz-deps.json  every educational visualisation in static/js/kompendium/ -> the vendored
                 libraries it calls (chart, p5, three); base.html loads only those

Deterministic: the same content gives the same bytes, so `--check` fails CI when a commit
changes content or a visualisation without regenerating them.

Usage:
  scripts/build-ui-data.py           regenerate the files
  scripts/build-ui-data.py --check   exit 1 when any file is stale
"""
import collections
import json
import pathlib
import re
import sys
import tomllib
import unicodedata

sys.dont_write_bytecode = True  # no __pycache__ in the checkout
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from ia_model import CONTENT, ROOT, TOML_FM, load_pages  # noqa: E402

OUT = ROOT / "static" / "data"
VIZ = ROOT / "static" / "js" / "kompendium"
DESCRIPTION_CHARS = 160
EA_FILE = re.compile(r"^(?:qr-)?ea-(\d+)-(\d+)-(\d+)")
ALIAS = re.compile(r"^(.*?)\s*\((.*?)\)\s*$")

# Search result kind by path prefix; the first match wins.
KIND = [("glossary/", "Pojem"), ("kompendium/techniques/", "Technika"),
        ("kompendium/case-studies/", "Kazuistika"),
        ("kompendium/historical-cases/", "Historický případ"),
        ("kompendium/recovery-protocols/", "Zotavení"),
        ("kompendium/emergency-protocols/", "Krizový protokol"),
        ("kompendium/self-defense-guides/", "Sebeobrana"),
        ("kompendium/detection-signatures/", "Detekce"),
        ("kompendium/glossary-bridges/", "Most"), ("philosophy/", "Filozofie"),
        ("kompendium/", "Kapitola")]
# Section labels for the palette badge: fixed names where the section title is English or long.
SECTION_LABELS = {"root": "Úvod", "glossary": "Glosář", "philosophy": "Filozofie",
                  "kompendium/techniques": "Techniky",
                  "kompendium/quick-reference": "Rychlé karty",
                  "kompendium/glossary-bridges": "Mosty glosáře"}


def front_matter(path: str) -> dict:
    m = TOML_FM.match((CONTENT / path).read_text(encoding="utf-8"))
    if not m:
        return {}
    try:
        return tomllib.loads(m.group(1))
    except tomllib.TOMLDecodeError:
        return {}


def slug(segment: str) -> str:
    """Zola's path slug (slugify.paths = "on", the slug crate): ASCII, lower case, runs of
    anything else become one dash. Pages are served at these paths, case-sensitively."""
    bare = "".join(c for c in unicodedata.normalize("NFKD", segment) if not unicodedata.combining(c))
    return re.sub(r"[^a-z0-9]+", "-", bare.lower()).strip("-")


def zola_url(url: str) -> str:
    """The URL Zola serves for a content path's URL ("/a/Ä-B/" -> "/a/a-b/")."""
    parts = [slug(x) for x in url.strip("/").split("/") if x]
    return "/" + "/".join(parts) + ("/" if parts else "")


def load() -> list:
    """The pages of ia_model plus the front-matter fields the shell needs."""
    pages = []
    for p in load_pages():
        front = front_matter(p["path"])
        if front.get("render") is False:
            continue
        extra = front.get("extra") if isinstance(front.get("extra"), dict) else {}
        code = str(extra.get("ea_code", "") or "")
        if not code:
            m = EA_FILE.match(p["path"].rsplit("/", 1)[-1])
            code = "EA-" + ".".join(m.groups()) if m else ""
        category = extra.get("category", "")
        pages.append({**p, "url": zola_url(p["url"]), "ea_code": code, "weight": int(front.get("weight", 0) or 0),
                      "sort_by": str(front.get("sort_by", "") or ""),
                      "category": category if isinstance(category, str) else ""})
    return pages


def zola_order(section: dict, group: list) -> list:
    """The order Zola gives a section's pages: by weight, by title, else by path."""
    if section["sort_by"] == "weight":
        return sorted(group, key=lambda p: (p["weight"], p["path"]))
    if section["sort_by"] == "title":
        return sorted(group, key=lambda p: (p["title"].lower(), p["path"]))
    return sorted(group, key=lambda p: p["path"])


def navigation(pages: list) -> dict:
    indexes = {p["path"]: p for p in pages if p["is_index"]}
    children = collections.defaultdict(list)
    subsections = collections.defaultdict(list)
    for p in pages:
        folder = p["path"].rsplit("/", 1)[0] if "/" in p["path"] else ""
        if p["is_index"]:
            if not folder:
                continue
            parent = folder.rsplit("/", 1)[0] + "/_index.md" if "/" in folder else "_index.md"
            subsections[parent].append(p["path"])
        else:
            children[(folder + "/_index.md") if folder else "_index.md"].append(p)
    nav = {}
    for path, section in sorted(indexes.items()):
        prefix = path[:-len("_index.md")]
        ordered = zola_order(section, children.get(path, []))
        nav[path] = {
            "title": section["title"],
            "url": section["url"],
            "pages": [[p["url"], p["title"], p["ea_code"]] for p in ordered],
            "subsections": sorted(subsections.get(path, [])),
            "total": sum(1 for q in pages if not q["is_index"] and q["path"].startswith(prefix)),
        }
    return {"schema": "kompendium-nav/v1", "sections": nav}


def terms(pages: list) -> dict:
    found = {}
    for p in sorted(pages, key=lambda p: (not p["path"].startswith("glossary/"), p["path"])):
        if not p["is_index"]:
            found.setdefault(p["path"].rsplit("/", 1)[-1][:-3], [p["url"], p["title"], p["category"]])
    return {"schema": "kompendium-terms/v1", "terms": found}


def glossary(pages: list) -> dict:
    entries = [p for p in pages if p["path"].startswith("glossary/") and not p["is_index"]]
    cats = collections.Counter(p["category"] for p in entries if p["category"])
    letters = collections.Counter(p["title"][:1].upper() for p in entries if p["title"])
    words = sum(p["words"] for p in entries)
    return {"schema": "kompendium-glossary/v1", "terms": len(entries), "words": words,
            "average_words": round(words / len(entries)) if entries else 0,
            "categories": [[c, n] for c, n in sorted(cats.items())],
            "letters": [[c, n] for c, n in sorted(letters.items())]}


def section_label(title: str) -> str:
    """"3. Základní kategorie — Přehled" -> "Základní kategorie"."""
    return re.sub(r"^\d+\.\s*", "", re.split(r"\s+[—–]\s+|\s+/\s+|:\s", title)[0]).strip()


def file_kind(path: str) -> int:
    """0 for a page file, 1 for a section (_index.md), 2 for a page bundle (index.md)."""
    name = path.rsplit("/", 1)[-1]
    return 1 if name == "_index.md" else 2 if name == "index.md" else 0


def search_index(pages: list) -> dict:
    sections = dict(SECTION_LABELS)
    for p in pages:
        m = re.match(r"^(.*)/_index\.md$", p["path"])
        if m and p["title"]:
            sections.setdefault(m.group(1), section_label(p["title"]))
    entries = []
    for p in pages:
        if not p["title"]:
            continue
        kind = next((label for prefix, label in KIND if p["path"].startswith(prefix)), "Stránka")
        aliases = []
        m = ALIAS.match(p["title"])
        if m:
            aliases = [a for a in (m.group(1).strip(), m.group(2).strip()) if a]
        entries.append([p["title"], p["description"][:DESCRIPTION_CHARS], p["url"], p["ea_code"],
                        kind, aliases, p["links_in"], file_kind(p["path"]), p["tags"]])
    used = {p["section"] for p in pages if p["title"]}
    return {"schema": "kompendium-search/v1",
            "fields": ["title", "description", "url", "code", "kind", "aliases", "in",
                       "file", "tags"],
            "sections": {k: v for k, v in sorted(sections.items()) if k in used},
            "entries": entries}


def viz_deps() -> dict:
    """Which vendored library each visualisation script calls, read from its source."""
    probes = {"chart": re.compile(r"\bnew Chart\b|\bChart\.|window\.Chart\b"),
              "p5": re.compile(r"\bnew p5\b|\bp5\.|window\.p5\b"),
              "three": re.compile(r"\bTHREE\.")}
    deps = {}
    for f in sorted(VIZ.glob("*.js")):
        text = f.read_text(encoding="utf-8")
        deps[f.name] = [lib for lib, rx in probes.items() if rx.search(text)]
    return {"schema": "kompendium-viz-deps/v1", "scripts": deps}


def build() -> dict:
    pages = load()
    return {"nav.json": navigation(pages), "terms.json": terms(pages),
            "glossary.json": glossary(pages), "search.json": search_index(pages),
            "viz-deps.json": viz_deps()}


def serialise(data: dict) -> str:
    return json.dumps(data, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n"


def main() -> int:
    check = "--check" in sys.argv[1:]
    stale = []
    for name, data in build().items():
        target, text = OUT / name, serialise(data)
        current = target.read_text(encoding="utf-8") if target.exists() else None
        if current == text:
            continue
        stale.append(name)
        if not check:
            OUT.mkdir(parents=True, exist_ok=True)
            target.write_text(text, encoding="utf-8")
    if check:
        if stale:
            print(f"build-ui-data: stale {', '.join(stale)}; run scripts/build-ui-data.py")
            return 1
        print("build-ui-data: up to date")
        return 0
    print(f"build-ui-data: wrote {', '.join(stale) or 'nothing (up to date)'}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
