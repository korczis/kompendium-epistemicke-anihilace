#!/usr/bin/env python3
"""Derive the book's link graph and its metrics for the site's visualisations.

Writes three files that templates and scripts read and nobody edits by hand:

  static/data/graph.json    nodes (one per page) and edges (resolved @/ links, as index pairs);
                            schema kompendium-graph/v2: v1 plus top-level families (EA-N -> name),
                            on technique nodes ea_code and code_shared_with (ids of
                            other technique pages carrying the same code)
                            and, on historical cases,
                            period_start, period_end (years; none when ongoing),
                            ongoing, category and place;
                            additive (2026-11-10): on every node `typ` and `oblasti`, on EA-coded
                            nodes `rodina` (EA-N) and `podrodina` (EA-N.M), and a top-level
                            `categories` index (typ, oblast, rodina, podrodina, publikum, pilir -> label,
                            description, node ids) for the category hubs and page chips; the
                            types and domains come from data/categories.toml, and a section with
                            no `typ` row fails the build
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
import tomllib

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
    # Technique pages that carry the same EA code (derived from the file name ea-X-Y[-Z]-…):
    # the hero card shows the clash instead of a hand-written note.
    by_code = collections.defaultdict(list)
    for i, p in enumerate(pages):
        m = re.match(r"kompendium/techniques/ea-(\d+)-(\d+)(?:-(\d+))?(?:-|\.md$)", p["path"])
        if m and not p["is_index"]:
            by_code["EA-" + ".".join(g for g in m.groups() if g)].append(i)
    for code, ids in by_code.items():
        for i in ids:
            nodes[i]["ea_code"] = code
            if len(ids) > 1:
                nodes[i]["code_shared_with"] = [j for j in ids if j != i]

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
    fams = families(pages)
    graph = {"schema": SCHEMA, "nodes": nodes, "edges": edges, "families": fams,
             "categories": categorise(pages, nodes, fams)}
    return {"graph.json": graph, "metrics.json": metrics, "ia.json": ia_report(pages)}


FAMILY_HEADING = re.compile(r"^##\s+Kapitola\s+(\d+)\s+[—–-]\s+(.+?)\s*$", re.M)


def families(pages: list) -> dict:
    """EA family code -> name, derived: the chapter headings of the register of techniques
    ("## Kapitola 1 — Akademické techniky"), else the most common extra.ea_category on the
    family's technique pages. A family with no derivable name is left out, never guessed."""
    names = {}
    register = ROOT / "content" / "kompendium" / "08-prilohy" / "rejstrik-technik.md"
    if register.exists():
        for num, name in FAMILY_HEADING.findall(register.read_text(encoding="utf-8")):
            names[f"EA-{int(num)}"] = re.sub(r"\s*\(.*?\)\s*$", "", name).strip()
    votes = collections.defaultdict(collections.Counter)
    for p in pages:
        m = re.match(r"kompendium/techniques/ea-(\d+)-", p["path"])
        if m and p.get("ea_category"):
            votes[f"EA-{int(m.group(1))}"][p["ea_category"]] += 1
    for family, counter in votes.items():
        names.setdefault(family, re.sub(r"^\d+\.\s*", "", counter.most_common(1)[0][0]))
    return dict(sorted(names.items(), key=lambda kv: int(kv[0][3:])))


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


CATEGORIES = ROOT / "data" / "categories.toml"
SUBFAMILY_HEADING = re.compile(r"^###\s+(\d+)\.(\d+)\s+(.+?)\s*$", re.M)
SUBFAMILY_ROW = re.compile(r"^\|\s*`EA-(\d+)\.(\d+)`\s*\|\s*([^|]+?)\s*\|", re.M)
CODED = re.compile(r"(?:kompendium/techniques/ea|kompendium/quick-reference/qr-ea)-(\d+)-(\d+)")


def subfamily_names() -> dict:
    """EA-N.M -> name, from the technique register: "### 1.1 Akvizice poznání" headings and
    the "| `EA-9.1` | Jazykové modely: … |" rows of its group tables. No name is guessed."""
    register = ROOT / "content" / "kompendium" / "08-prilohy" / "rejstrik-technik.md"
    names = {}
    if register.exists():
        text = register.read_text(encoding="utf-8")
        for regex in (SUBFAMILY_HEADING, SUBFAMILY_ROW):
            for fam, sub, name in regex.findall(text):
                names.setdefault(f"EA-{int(fam)}.{int(sub)}", re.sub(r"`", "", name).strip())
    return names


def categorise(pages: list, nodes: list, fams: dict) -> dict:
    """Give every node its page type and domains (data/categories.toml) and every EA-coded
    node its family and subfamily; return the index the category hubs read."""
    spec = tomllib.loads(CATEGORIES.read_text(encoding="utf-8"))

    def matches(section: str, prefixes: list) -> int:
        best = -1
        for pre in prefixes:
            if section == pre or section.startswith(pre + "/"):
                best = max(best, len(pre))
        return best

    index = {"typ": {}, "oblast": {}, "rodina": {}, "podrodina": {}, "publikum": {}, "pilir": {}}
    # typ slug -> audiences that serve it, and -> its single defensive function
    aud_of = {}
    for row in spec.get("publikum", []):
        index["publikum"][row["slug"]] = {"label": row["label"],
                                          "description": row["description"], "nodes": []}
        for t in row["types"]:
            aud_of.setdefault(t, []).append(row["slug"])
    pilir_of = {}
    for row in spec.get("pilir", []):
        index["pilir"][row["slug"]] = {"label": row["label"],
                                       "description": row["description"], "nodes": []}
        for t in row["types"]:
            pilir_of[t] = row["slug"]
    for row in spec["typ"]:
        index["typ"][row["slug"]] = {"label": row["label"], "description": row["description"],
                                     "nodes": []}
    for row in spec["oblast"]:
        index["oblast"][row["slug"]] = {"label": row["label"], "description": row["description"],
                                        "nodes": []}
    subnames = subfamily_names()
    untyped = set()
    for page, node in zip(pages, nodes):
        section = page["section"]
        ranked = sorted(((matches(section, r["sections"]), r["slug"]) for r in spec["typ"]),
                        reverse=True)
        if not ranked or ranked[0][0] < 0:
            untyped.add(section)
            continue
        node["typ"] = ranked[0][1]
        index["typ"][node["typ"]]["nodes"].append(node["id"])
        m = None if page["is_index"] else CODED.match(page["path"])
        family = f"EA-{int(m.group(1))}" if m else None
        if m:
            sub = f"{family}.{int(m.group(2))}"
            node["rodina"], node["podrodina"] = family, sub
            index["rodina"].setdefault(family, {"label": fams.get(family, family), "nodes": []})
            index["rodina"][family]["nodes"].append(node["id"])
            index["podrodina"].setdefault(sub, {"label": subnames.get(sub, sub),
                                                "family": family, "nodes": []})
            index["podrodina"][sub]["nodes"].append(node["id"])
        domains = [r["slug"] for r in spec["oblast"]
                   if matches(section, r.get("sections", [])) >= 0
                   or (family and family in r.get("families", []))]
        node["oblasti"] = domains
        for d in domains:
            index["oblast"][d]["nodes"].append(node["id"])
        node["publikum"] = aud_of.get(node["typ"], [])
        for a in node["publikum"]:
            index["publikum"][a]["nodes"].append(node["id"])
        if node["typ"] in pilir_of:
            node["pilir"] = pilir_of[node["typ"]]
            index["pilir"][node["pilir"]]["nodes"].append(node["id"])
    if untyped:
        raise SystemExit("build-graph: no `typ` row in data/categories.toml for section(s) "
                         + ", ".join(sorted(untyped)) + "; add one there")
    order = lambda kv: [int(x) for x in kv[0][3:].split(".")]  # noqa: E731
    index["rodina"] = dict(sorted(index["rodina"].items(), key=order))
    index["podrodina"] = dict(sorted(index["podrodina"].items(), key=order))
    return index


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
