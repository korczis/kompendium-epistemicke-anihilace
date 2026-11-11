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
  pokracovat.json  the "Pokračovat" block of every page (templates/partials/pokracovat.html
                 renders it): page path -> {next, related, term, protocol}, each [path, title],
                 derived from static/data/graph.json and static/data/ia.json (so run
                 scripts/build-graph.py first); see pokracovat() for the rules

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
from ia_model import (CONTENT, ROOT, TOML_FM, YAML_FM, load_pages,  # noqa: E402
                      parse_yaml_subset, url_of)

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
        # extra.aliases: names whose construct this page carries (data/front-matter.toml); the same
        # declaration feeds linking and the bold-term gate (ia_model.bold_term_index) and search.
        declared = extra.get("aliases", [])
        declared = [a.strip() for a in declared if isinstance(a, str) and a.strip()] \
            if isinstance(declared, list) else []
        pages.append({**p, "url": zola_url(p["url"]), "ea_code": code, "weight": int(front.get("weight", 0) or 0),
                      "sort_by": str(front.get("sort_by", "") or ""),
                      "category": category if isinstance(category, str) else "",
                      "aliases": declared})
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
        aliases += [a for a in p["aliases"] if a not in aliases]
        entries.append([p["title"], p["description"][:DESCRIPTION_CHARS], p["url"], p["ea_code"],
                        kind, aliases, p["links_in"], file_kind(p["path"]), p["tags"]])
    used = {p["section"] for p in pages if p["title"]}
    return {"schema": "kompendium-search/v1",
            "fields": ["title", "description", "url", "code", "kind", "aliases", "in",
                       "file", "tags"],
            "sections": {k: v for k, v in sorted(sections.items()) if k in used},
            "entries": entries}


def viz_deps() -> dict:
    """Which vendored library each visualisation script calls, read from its code.

    Comments are stripped first (a comment naming "Chart.js" is no call). The calls are the
    component layer's (K.chart, KompendiumVrstva.p5 / .three, see scripts/check-viz-layer.py)
    and the libraries' own globals.
    """
    probes = {"chart": re.compile(r"\bK\.chart\(|\bnew Chart\b|\bChart\.|\bwindow\.Chart\b|"
                                  r"\btypeof Chart\b"),
              "p5": re.compile(r"\.p5\(|\bnew p5\b|\bp5\.|\bwindow\.p5\b"),
              "three": re.compile(r"\.three\(|\bTHREE\.")}
    comments = re.compile(r"/\*.*?\*/|(^|\s)//[^\n]*", re.S)
    deps = {}
    for f in sorted(VIZ.glob("*.js")):
        text = comments.sub(r"\1", f.read_text(encoding="utf-8"))
        deps[f.name] = [lib for lib, rx in probes.items() if rx.search(text)]
    return {"schema": "kompendium-viz-deps/v1", "scripts": deps}


def natural_key(title: str) -> tuple:
    """Zola's sort_by = "title" (lexical_sort::natural_lexical_cmp): transliterated to ASCII,
    case-insensitive, other characters before digits before letters, digit runs compared as
    numbers; then the raw title."""
    bare = "".join(c for c in unicodedata.normalize("NFKD", title) if not unicodedata.combining(c))
    key = []
    for run in re.findall(r"\d+|.", bare.lower(), re.S):
        if run.isdigit():
            key.append((1, int(run), ""))
        else:
            key.append((2 if run.isalpha() else 0, 0, run))
    return tuple(key), title


def zola_sections() -> dict:
    """Every section (by its _index.md path) as Zola builds it: its pages in Zola's order (only
    the sortable ones when sorted; a page without the sort key is left out, as Zola does), its
    parent section, its weight and whether the order is a sort (Zola then sets page.higher)."""
    files = {}
    for f in sorted(CONTENT.rglob("*.md")):
        rel = f.relative_to(CONTENT).as_posix()
        text = f.read_text(encoding="utf-8")
        m = TOML_FM.match(text)
        front = {}
        if m:
            try:
                front = tomllib.loads(m.group(1))
            except tomllib.TOMLDecodeError:
                front = {}
        else:
            m = YAML_FM.match(text)
            front = parse_yaml_subset(m.group(1)) if m else {}
        if front.get("draft") is True:
            continue
        files[rel] = front
    parent_dir = lambda rel: rel.rsplit("/", 1)[0] if "/" in rel else ""  # noqa: E731
    index_of = lambda folder: f"{folder}/_index.md" if folder else "_index.md"  # noqa: E731
    sections = {rel: {"front": front, "pages": [], "subsections": [], "parent": None}
                for rel, front in files.items() if rel.rsplit("/", 1)[-1] == "_index.md"}
    for rel, sec in sections.items():
        folder = parent_dir(rel)
        if folder:
            up = index_of(parent_dir(folder))
            if up in sections:
                sec["parent"] = up
                sections[up]["subsections"].append(rel)
    for rel, front in files.items():
        if rel in sections:
            continue
        folder = parent_dir(rel)
        if rel.rsplit("/", 1)[-1] == "index.md":  # a page bundle belongs to its folder's parent
            folder = parent_dir(folder)
        if index_of(folder) in sections:
            sections[index_of(folder)]["pages"].append(rel)
    weight = lambda rel: int(sections[rel]["front"].get("weight", 0) or 0)  # noqa: E731
    for rel, sec in sections.items():
        sort_by = str(sec["front"].get("sort_by", "") or "none")
        url = lambda p: url_of(pathlib.PurePosixPath(p))  # noqa: E731
        if sort_by == "weight":
            keep = [p for p in sec["pages"] if "weight" in files[p]]
            sec["pages"] = sorted(keep, key=lambda p: (int(files[p]["weight"]), url(p)))
        elif sort_by == "title":
            keep = [p for p in sec["pages"] if "title" in files[p]]
            sec["pages"] = sorted(keep, key=lambda p: (natural_key(str(files[p]["title"])), url(p)))
        elif sort_by != "none":
            raise SystemExit(f"build-ui-data: {rel}: sort_by = {sort_by} is not modelled")
        sec["sorted"] = sort_by != "none"
        sec["subsections"].sort(key=lambda s: (weight(s), s))
    return sections


def pokracovat() -> dict:
    """Where to go next from each page: the rules of the "Pokračovat" block.

    Four targets, each once and only a worked-out page (in static/data/ia.json without the
    "detail" and "generated" violations):
      next      the first worked-out page after this one in its section's Zola order (the pager
                shows the nearest, worked-out or not); at the end of the section the first
                worked-out page of the next sibling section; dropped when it is the page the
                pager already offers (page.higher, the next page of a sorted section);
      related   the strongest related page of static/data/graph.json: a mutual link before a
                link from this page before a backlink, on a tie the more specific page (fewer
                in-links), on a full tie the first met (links in graph order, then backlinks in
                permalink order, as Zola lists page.backlinks);
      term      the glossary entry this page links to most strongly (not on a glossary page);
      protocol  the most strongly linked crisis protocol (not on a crisis protocol page).
    A link target is matched to a page by its URL, a backlink by its source page's URL.
    """
    graph = json.loads((OUT / "graph.json").read_text(encoding="utf-8"))
    ia = {p["path"]: p["violations"]
          for p in json.loads((OUT / "ia.json").read_text(encoding="utf-8"))["pages"]}
    nodes, edges = graph["nodes"], graph["edges"]
    by_path = {n["path"]: n for n in nodes}
    by_url = {}
    for n in nodes:
        by_url.setdefault(n["url"], n)
    ok = lambda path: path in ia and not {"detail", "generated"} & set(ia[path])  # noqa: E731
    offset, start = 0, []
    for n in nodes:
        start.append(offset)
        offset += n["out"]
    linkers = collections.defaultdict(set)
    for src, dst in edges:
        linkers[dst].add(src)
    sections = zola_sections()
    page_section = {p: rel for rel, sec in sections.items() for p in sec["pages"]}
    # A page left out of a sorted section is still a page of it (Zola keeps its ancestors).
    for f in sorted(CONTENT.rglob("*.md")):
        rel = f.relative_to(CONTENT).as_posix()
        if rel in sections or rel in page_section:
            continue
        folder = rel.rsplit("/", 1)[0] if "/" in rel else ""
        if rel.endswith("/index.md") or rel == "index.md":
            folder = folder.rsplit("/", 1)[0] if "/" in folder else ""
        index = f"{folder}/_index.md" if folder else "_index.md"
        if index in sections:
            page_section[rel] = index
    title = lambda path: by_path[path]["title"] if path in by_path else ""  # noqa: E731
    out = {}
    for here, sec_path in sorted(page_section.items()):
        sec = sections[sec_path]
        order = sec["pages"]
        nxt = ""
        if here in order:
            nxt = next((p for p in order[order.index(here) + 1:] if ok(p)), "")
        if not nxt and sec["parent"]:
            siblings = sections[sec["parent"]]["subsections"]
            for s in siblings[siblings.index(sec_path) + 1:]:
                nxt = next((p for p in sections[s]["pages"] if ok(p)), "")
                if nxt:
                    break
        if nxt and sec["sorted"] and here in order and order.index(here) + 1 < len(order) \
                and order[order.index(here) + 1] == nxt:
            nxt = ""
        best = {"related": ("", -1), "term": ("", -1), "protocol": ("", -1)}
        me = by_path.get(here)
        if me is not None:
            mine = edges[start[me["id"]]:start[me["id"]] + me["out"]]
            out_ids = [e[1] for e in mine if e[0] == me["id"]]
            back = sorted({nodes[s]["url"] for s in linkers[me["id"]]})
            back_set = set(back)
            back_ids = [by_url[u]["id"] for u in back if u in by_url]
            for direction, ids in ((0, out_ids), (1, back_ids)):
                for i in ids:
                    n = nodes[i]
                    if direction == 1 and [me["id"], i] in mine:
                        continue
                    if n["path"] in (here, nxt) or not ok(n["path"]):
                        continue
                    tier = 1 if direction else (3 if n["url"] in back_set else 2)
                    score = tier * 1000000 - n["in"]
                    if n["section"] == "glossary" and me["section"] != "glossary":
                        kind = "term"
                    elif (n["section"] == "kompendium/emergency-protocols"
                          and me["section"] != "kompendium/emergency-protocols"):
                        kind = "protocol"
                    else:
                        kind = "related"
                    if score > best[kind][1]:
                        best[kind] = (n["path"], score)
        entry = {"next": nxt, **{k: v[0] for k, v in best.items()}}
        entry = {k: [v, title(v)] for k, v in entry.items() if v}
        if entry:
            out[here] = entry
    return {"schema": "kompendium-pokracovat/v1", "pages": out}


def build() -> dict:
    pages = load()
    return {"nav.json": navigation(pages), "terms.json": terms(pages),
            "glossary.json": glossary(pages), "search.json": search_index(pages),
            "viz-deps.json": viz_deps(), "pokracovat.json": pokracovat()}


def serialise(data: dict) -> str:
    return json.dumps(data, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n"


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    unknown = [a for a in args if a != "--check"]
    if unknown:
        # An unknown option must never fall through to write mode.
        print(f"build-ui-data: unknown argument {unknown[0]}; see --help", file=sys.stderr)
        return 2
    check = "--check" in args
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
