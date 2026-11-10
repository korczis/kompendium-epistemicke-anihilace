#!/usr/bin/env python3
"""Derive the book's link graph and its metrics for the site's visualisations.

Writes two files that templates and scripts read and nobody edits by hand:

  static/data/graph.json    nodes (one per page) and edges (resolved @/ links, as index pairs)
  static/data/metrics.json  per-section and whole-book figures for the dashboards
  static/data/nav.json      every section (by its _index.md path): title, url, its pages in the
                            section's own order and its subsections — the sidebar subtrees,
                            the section sub-navigation and the page windows read it
  static/data/glossary.json the glossary's facets: categories and initial letters with counts,
                            totals; the glossary page renders its toolbar from it
  static/data/terms.json    every page slug (file stem) -> [url, title, category]: resolves the
                            `related_terms` of a page into links; glossary wins a shared slug

Deterministic: the same content gives the same bytes, so `--check` can fail CI when a
commit changes content without regenerating them.

Usage:
  scripts/build-graph.py           regenerate both files
  scripts/build-graph.py --check   exit 1 when either file is stale
"""
import collections
import json
import pathlib
import statistics
import sys

sys.dont_write_bytecode = True  # no __pycache__ in the checkout
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from ia_model import ROOT, load_pages  # noqa: E402

OUT = ROOT / "static" / "data"
SCHEMA = "kompendium-graph/v1"


def build() -> dict:
    pages = load_pages()
    index = {p["path"]: i for i, p in enumerate(pages)}
    nodes = [{
        "id": i,
        "path": p["path"],
        "url": p["url"],
        "title": p["title"],
        "section": p["section"],
        "tags": p["tags"],
        "words": p["words"],
        "lang": p["language"],
        "out": len(p["links"]),
        "in": p["links_in"],
    } for i, p in enumerate(pages)]
    edges = [[index[p["path"]], index[t]] for p in pages for t in p["links"]]

    by_section = collections.defaultdict(list)
    for p in pages:
        by_section[p["section"]].append(p)
    sections = []
    for name, group in sorted(by_section.items()):
        words = [p["words"] for p in group]
        sections.append({
            "section": name,
            "pages": len(group),
            "words": sum(words),
            "median_words": int(statistics.median(words)),
            "median_links_out": int(statistics.median(len(p["links"]) for p in group)),
            "orphans": sum(1 for p in group if p["links_in"] == 0 and not p["is_index"]),
            "english": sum(1 for p in group if p["language"] == "en"),
            "without_diacritics": sum(
                1 for p in group if p["language"] == "cs" and p["words"] >= 50
                and p["diacritics"] < 0.03),
            "with_related": sum(1 for p in group if p["has_related"]),
        })
    total_words = sum(p["words"] for p in pages)
    metrics = {
        "schema": "kompendium-metrics/v1",
        "pages": len(pages),
        "words": total_words,
        "links": len(edges),
        "broken_links": sum(len(p["broken_links"]) for p in pages),
        "orphans": sum(s["orphans"] for s in sections),
        "english_pages": sum(s["english"] for s in sections),
        "pages_without_diacritics": sum(s["without_diacritics"] for s in sections),
        "pages_with_related": sum(s["with_related"] for s in sections),
        "thin_pages": sum(1 for p in pages if p["words"] < 600 and not p["is_index"]),
        "sections": sections,
    }
    graph = {"schema": SCHEMA, "nodes": nodes, "edges": edges}
    return {"graph.json": graph, "metrics.json": metrics, "nav.json": navigation(pages),
            "terms.json": terms(pages), "glossary.json": glossary(pages)}


def glossary(pages: list) -> dict:
    entries = [p for p in pages if p["path"].startswith("glossary/") and not p["is_index"]]
    cats = collections.Counter(p["category"] for p in entries if p["category"])
    letters = collections.Counter(p["title"][:1].upper() for p in entries if p["title"])
    words = sum(p["words"] for p in entries)
    return {
        "schema": "kompendium-glossary/v1",
        "terms": len(entries),
        "words": words,
        "average_words": round(words / len(entries)) if entries else 0,
        "categories": [[c, n] for c, n in sorted(cats.items())],
        "letters": [[l, n] for l, n in sorted(letters.items())],
    }


def zola_order(section: dict, group: list) -> list:
    """The order Zola gives a section's pages: by weight, by title, or by path."""
    if section.get("sort_by") == "weight":
        return sorted(group, key=lambda p: (p["weight"], p["path"]))
    if section.get("sort_by") == "title":
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
        ordered = zola_order(section, children.get(path, []))
        nav[path] = {
            "title": section["title"],
            "url": section["url"],
            "pages": [[p["url"], p["title"], p["ea_code"]] for p in ordered],
            "subsections": sorted(subsections.get(path, [])),
            "total": len(ordered) + sum(1 for q in pages if not q["is_index"]
                                        and q["path"].startswith(path[:-len("_index.md")])
                                        and q not in ordered),
        }
    return {"schema": "kompendium-nav/v1", "sections": nav}


def terms(pages: list) -> dict:
    found = {}
    for p in sorted(pages, key=lambda p: (not p["path"].startswith("glossary/"), p["path"])):
        if p["is_index"]:
            continue
        slug = p["path"].rsplit("/", 1)[-1][:-3]
        found.setdefault(slug, [p["url"], p["title"], p["category"]])
    return {"schema": "kompendium-terms/v1", "terms": found}


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
            print(f"build-graph: stale {', '.join(stale)}; run scripts/build-graph.py")
            return 1
        print("build-graph: up to date")
        return 0
    print(f"build-graph: wrote {', '.join(stale) or 'nothing (up to date)'}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
