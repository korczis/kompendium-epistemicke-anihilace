"""Derived listings of the book: one declaration, one builder, one membership model (ADR 0015).

A listing is a table of the pages of one section that a page renders with load_data instead of
writing it by hand. data/listings.toml declares each listing: the section it reads, which members
it keeps, how it groups them (inferred from a front-matter field or from a code pattern), where
the group names come from, which front-matter fields it carries and which pages render it. This
module turns the declaration and the pages' own front matter into the listing's JSON
(static/data/listings/<key>.json) and tells scripts/ia_model.py which listing and group a page
belongs to, so a rendered listing keeps its graph edges and the IA gate can tell a derived row
from a hand-written one.

A new listing is one [[listing]] block, never a new script, template or gate.

Output shape (the same for every listing):
  items         every member in order
  groups        group key -> members in order ("" when the listing does not group)
  group_order   the group keys in order
  group_names   group key -> name, when the declaration or the names file gives one
  group_notes   group key -> one-line note, when the declaration gives one
  parents       parent key -> its group keys in order (code-pattern listings with a parent)
  parent_names  parent key -> name
  parent_counts parent key -> number of its members (a count without a loop over them)
  entries       id -> member (the member's code, or its slug)
  count         number of members
Each member: id, code (if any), name, summary, slug, path (the @/ link target), words, weight,
and every declared field under its last key (extra.listing_note -> listing_note).
"""
from __future__ import annotations

import functools
import json
import pathlib
import re
import tomllib

ROOT = pathlib.Path(__file__).resolve().parent.parent
CONTENT = ROOT / "content"
DECLARATION = ROOT / "data" / "listings.toml"
OUTPUT_DIR = "static/data/listings"
SCHEMA = "kompendium-listings/v1"
OUTPUT_SCHEMA = "kompendium-listing/v1"
TOML_FM = re.compile(r"\A\+\+\+\n(.*?)\n\+\+\+\n", re.S)
WORD = re.compile(r"[A-Za-zÀ-ž]+")
# a load_data of a listing, bound to a template variable
LOAD = re.compile(r'\{%-?\s*set\s+(\w+)\s*=\s*load_data\(path="' + re.escape(OUTPUT_DIR)
                  + r'/([\w-]+)\.json"\)\s*-?%\}')


@functools.lru_cache(maxsize=None)
def declaration() -> tuple:
    """The declared listings, validated; raises ValueError on a malformed declaration."""
    data = tomllib.loads(DECLARATION.read_text(encoding="utf-8"))
    if data.get("schema") != SCHEMA:
        raise ValueError(f"{DECLARATION.name}: schema must be {SCHEMA}")
    seen, out = set(), []
    for raw in data.get("listing", []):
        key = str(raw.get("key", ""))
        if not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", key) or key in seen:
            raise ValueError(f"{DECLARATION.name}: bad or duplicate key {key!r}")
        seen.add(key)
        if not (CONTENT / str(raw.get("section", ""))).is_dir():
            raise ValueError(f"{DECLARATION.name}: listing {key}: no section {raw.get('section')!r}")
        out.append(raw)
    return tuple(out)


def output_path(listing: dict) -> str:
    return f"{OUTPUT_DIR}/{listing['key']}.json"


def _get(front: dict, dotted: str):
    node = front
    for part in dotted.split("."):
        if not isinstance(node, dict):
            return None
        node = node.get(part)
    return node


def members_of(listing: dict) -> list:
    """Content-relative paths of the section's member pages: its pages and its subsections'
    index pages, the section's own _index.md excluded."""
    sec = CONTENT / listing["section"]
    paths = [p for p in sec.glob("*.md") if p.name != "_index.md"]
    paths += [p for p in sec.glob("*/_index.md")]
    return sorted(p.relative_to(CONTENT).as_posix() for p in paths)


def front_matter(path: str) -> tuple:
    text = (CONTENT / path).read_text(encoding="utf-8")
    m = TOML_FM.match(text)
    return (tomllib.loads(m.group(1)) if m else {}), (text[m.end():] if m else text)


def classify(listing: dict, path: str, front: dict):
    """(group, parent, order) of a member page, or None when the listing does not keep it."""
    where = listing.get("where")
    if where and not _get(front, where):
        return None
    grouping = listing.get("group") or {}
    weight = front.get("weight", 0)
    weight = weight if isinstance(weight, (int, float)) else 0
    if "code" in grouping:
        code = str(_get(front, grouping["code"]) or "").strip()
        m = re.match(grouping["pattern"], code)
        if not m:
            return None
        parts = m.groups()
        fmt = lambda f: f.format(*parts) if f else ""
        order = tuple(int(x) if x.isdigit() else x for x in parts)
        return fmt(grouping.get("group")), fmt(grouping.get("parent")), (order, path)
    if "field" in grouping:
        group = str(_get(front, grouping["field"]) or grouping.get("default", ""))
        return group, "", ((weight,), path)
    return "", "", ((weight,), path)


FIELD_LINK = re.compile(r"\]\(@/([^)#\s]+?\.md)(?:#[^)\s]*)?\)")


def field_links(listing: dict, front: dict) -> list:
    """The @/ link targets inside a member's declared fields: a page that renders the member
    renders these links too."""
    out = []
    for field in listing.get("fields", []):
        value = _get(front, field)
        if isinstance(value, str):
            out += FIELD_LINK.findall(value)
    return out


def member_groups(path: str, front: dict) -> list:
    """[(listing key, group, parent, links in its fields)] for a page: the listings it is a
    member of."""
    out = []
    for listing in declaration():
        sec = listing["section"]
        if not (path.startswith(sec + "/") and (path.count("/") == sec.count("/") + 1
                                                 or path.endswith("/_index.md")
                                                 and path.count("/") == sec.count("/") + 2)):
            continue
        if path == f"{sec}/_index.md":
            continue
        c = classify(listing, path, front)
        if c:
            out.append((listing["key"], c[0], c[1], field_links(listing, front)))
    return out


def _names(listing: dict) -> tuple:
    groups = dict(listing.get("group_names") or {})
    parents = {}
    names = listing.get("names")
    if names:
        data = tomllib.loads((ROOT / names).read_text(encoding="utf-8"))
        parents.update({str(r["code"]): str(r["name"]) for r in data.get("chapter", [])})
        groups.update({str(r["code"]): str(r["name"]) for r in data.get("family", [])})
    return groups, parents


def build(listing: dict) -> dict:
    """The listing's JSON from its members' own front matter."""
    strip_title = re.compile(listing["title_strip"]) if listing.get("title_strip") else None
    strip_summary = re.compile(listing["summary_strip"], re.I) if listing.get("summary_strip") else None
    rows = []
    for path in members_of(listing):
        front, body = front_matter(path)
        c = classify(listing, path, front)
        if not c:
            continue
        group, parent, order = c
        title = str(front.get("title", "")).strip()
        summary = str(front.get("description", "") or "").strip()
        if strip_title:
            title = strip_title.sub("", title).strip()
        if strip_summary:
            summary = strip_summary.sub("", summary).strip()
        code = str(_get(front, listing["group"]["code"])).strip() if "code" in (listing.get("group") or {}) else ""
        slug = path.rsplit("/", 1)[-1][:-3] if not path.endswith("/_index.md") else path.rsplit("/", 2)[-2]
        entry = {"id": code or slug, "name": title, "summary": summary[:1].upper() + summary[1:],
                 "slug": slug, "path": path, "words": len(WORD.findall(body)),
                 "weight": front.get("weight", 0)}
        if code:
            entry["code"] = code
        for field in listing.get("fields", []):
            value = _get(front, field)
            if isinstance(value, str) and value.strip():
                entry[field.rsplit(".", 1)[-1]] = value.strip()
        rows.append((order, group, parent, entry))
    rows.sort(key=lambda r: r[0])
    group_names, parent_names = _names(listing)
    declared_order = list(listing.get("group_order") or [])
    groups: dict = {}
    parents: dict = {}
    for _, group, parent, entry in rows:
        groups.setdefault(group, []).append(entry)
        if parent:
            parents.setdefault(parent, [])
            if group not in parents[parent]:
                parents[parent].append(group)
    order = [g for g in declared_order if g in groups] + [g for g in groups if g not in declared_order]
    entries: dict = {}
    for _, _, _, e in rows:
        entries.setdefault(e["id"], e)
    out = {"schema": OUTPUT_SCHEMA, "key": listing["key"], "items": [e for *_, e in rows],
           "groups": groups, "group_order": order, "entries": entries, "count": len(rows),
           "group_names": {g: n for g, n in group_names.items() if g in groups},
           "group_notes": {g: n for g, n in (listing.get("group_notes") or {}).items() if g in groups}}
    if parents:
        out["parents"] = parents
        out["parent_names"] = {p: n for p, n in parent_names.items() if p in parents}
        out["parent_counts"] = {p: sum(len(groups[g]) for g in gs) for p, gs in parents.items()}
    return out


def build_all() -> dict:
    """{output path: JSON} for every declared listing."""
    return {output_path(listing): build(listing) for listing in declaration()}


def serialise(data: dict) -> str:
    return json.dumps(data, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n"
