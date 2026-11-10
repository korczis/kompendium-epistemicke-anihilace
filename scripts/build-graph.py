#!/usr/bin/env python3
"""Derive the book's link graph and its metrics for the site's visualisations.

Writes three files that templates and scripts read and nobody edits by hand:

  static/data/graph.json    nodes (one per page) and edges (resolved @/ links, as index pairs);
                            schema kompendium-graph/v2: v1 plus, on historical cases,
                            period_start, period_end (years; none when ongoing),
                            ongoing, category and place
  static/data/metrics.json  per-section and whole-book figures for the dashboards
  static/data/ia.json       per page: open IA violations by rule (scripts/check-ia.py), words,
                            language, in and out degree, for the editorial view

Deterministic: the same content gives the same bytes, so `--check` can fail CI when a
commit changes content without regenerating them.

Usage:
  scripts/build-graph.py           regenerate both files
  scripts/build-graph.py --check   exit 1 when either file is stale
"""
import collections
import importlib.util
import json
import pathlib
import re
import statistics
import sys

sys.dont_write_bytecode = True  # no __pycache__ in the checkout
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from ia_model import ROOT, load_pages, load_terms  # noqa: E402

OUT = ROOT / "static" / "data"
SCHEMA = "kompendium-graph/v2"
# "> **Kategorie**: Totalitní režimy · **Období**: 1969–1989 · **Místo**: ČSSR" (may wrap)
CASE_LINE = re.compile(r"\*\*Kategorie\*\*:\s*(?P<cat>[^·]+?)\s*·\s*\*\*Období\*\*:"
                       r"\s*(?P<period>[^·]+?)\s*·\s*\*\*Místo\*\*:\s*(?P<place>.+?)\s*$")
YEAR = re.compile(r"(?<!\d)(1[0-9]{3}|20[0-9]{2})(?!\d)")
# A century on its own ("od 19. století") is a year; one that only qualifies decades
# ("80. let 20. století") is not.
CENTURY = re.compile(r"(?<!let )(?<!léta )(?<!\d)(\d{1,2})\.\s*stolet")
DECADES = re.compile(r"(?<!\d)(\d)0\.\s*(?:–\s*(\d)0\.\s*)?(?:let|léta)")


def case_fields(path: str) -> dict:
    """Timeline fields of a historical case, from its category line (empty if absent).

    Years are read as written; decades ("50.–80. léta 20. století") become their first and last
    year; an open period ("od roku 1968", "do současnosti") has no period_end and ongoing = true.
    """
    if not path.startswith("kompendium/historical-cases/") or path.endswith("_index.md"):
        return {}
    lines = (ROOT / "content" / path).read_text(encoding="utf-8").split("\n")
    for i, line in enumerate(lines):
        if line.startswith(">") and "**Kategorie**" in line:
            block = [line]
            for nxt in lines[i + 1:]:
                if not nxt.strip() or nxt.startswith("#"):
                    break
                block.append(nxt)
            joined = " ".join(l.lstrip(">").strip() for l in block)
            break
    else:
        return {}
    m = CASE_LINE.search(joined)
    if not m:
        return {}
    period = m.group("period")
    century = 1800 if "19. stol" in period and "20. stol" not in period else 1900
    years = [int(y) for y in YEAR.findall(period)]
    years += [(int(c) - 1) * 100 for c in CENTURY.findall(period)]
    for a, b in DECADES.findall(period):
        years.append(century + int(a) * 10)
        years.append(century + int(b or a) * 10 + 9)
    fields = {"category": m.group("cat").strip(), "place": m.group("place").strip()}
    ongoing = period.lstrip().startswith("od ") or "současnost" in period
    if years:
        fields["period_start"] = min(years)
        if not ongoing:
            fields["period_end"] = max(years)
    if ongoing:
        fields["ongoing"] = True
    return fields


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
        **case_fields(p["path"]),
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
    terms = load_terms(pages)
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
        "terms": len(terms),
        "terms_with_page": sum(1 for t in terms if t["page"]),
        "terms_without_page": sorted(t["term"] for t in terms if not t["page"]),
        "sections": sections,
    }
    graph = {"schema": SCHEMA, "nodes": nodes, "edges": edges}
    return {"graph.json": graph, "metrics.json": metrics, "ia.json": ia_report(pages)}


def ia_report(pages: list) -> dict:
    spec = importlib.util.spec_from_file_location("check_ia", ROOT / "scripts" / "check-ia.py")
    check_ia = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(check_ia)
    open_now = check_ia.current()
    rows = []
    for p in pages:
        rows.append({
            "path": p["path"],
            "url": p["url"],
            "title": p["title"],
            "section": p["section"],
            "violations": open_now.get(f"content/{p['path']}", []),
            "words": p["words"],
            "lang": p["language"],
            "in": p["links_in"],
            "out": len(p["links"]),
        })
    terms = sorted(k[len("term:"):] for k in open_now if k.startswith("term:"))
    counts = collections.Counter(r for rules in open_now.values() for r in rules)
    return {"schema": "kompendium-ia/v1", "rules": dict(sorted(counts.items())),
            "terms_without_page": terms, "pages": rows}


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
