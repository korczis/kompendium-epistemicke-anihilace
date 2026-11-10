#!/usr/bin/env python3
"""Reference implementation of the engine contract kompendium-engine/v1.

docs/engine/kompendium-engine-v1.md is the contract; data/schemas/kompendium-engine.v1.schema.json
its JSON Schema. This module is the build-side engine: every other implementation (the site's
JS, a later wasm build) must give the same output for the fixtures in test/cases/engine/,
which scripts/build-engine-fixtures.py derives with this module.

Pure: the only I/O is load(), which reads static/data/search.json and static/data/graph.json.
Everything else maps a request (a JSON value) to a response (a JSON object) and never raises.

  engine = load()                      # or Engine(search_doc, graph_doc)
  engine.run({"op": "search", "query": "EA-1.1.1"})
  engine.run({"op": "neighbourhood", "path": "glossary/gaslighting.md", "depth": 2})
"""
import json
import pathlib
import re
import unicodedata

SCHEMA = "kompendium-engine/v1"
DATA = pathlib.Path(__file__).resolve().parent.parent / "static" / "data"
# Data schemas this version reads; an unknown one is a schema_mismatch, never a guess.
SEARCH_SCHEMAS = ("kompendium-search/v1",)
GRAPH_SCHEMAS = ("kompendium-graph/v2",)
SEARCH_FIELDS = ("title", "description", "url", "code", "kind", "aliases", "in")

QUERY_MAX = 200          # code points of the raw query
PATH_MAX = 512
SEARCH_LIMIT = (12, 50)  # default, maximum
NEIGHBOURHOOD_LIMIT = (28, 200)
DEPTHS = (1, 2)
TIERS = ("exact_code", "exact_title", "exact_alias", "title_prefix", "title_word", "description")
OPS = {"search": ("op", "query", "limit"), "neighbourhood": ("op", "path", "depth", "limit")}

# Whitespace, spelled out so every implementation collapses the same set (JS \s plus U+0085).
WHITESPACE = re.compile("[\t\n\u000b\f\r \u0085   -   "
                        "  　﻿]+")
# An EA code on a normalised string: "ea-1.2.3", "ea 1.2.3", "ea1.2.3", "ea-3.2.f", "ea-1.6".
CODE = re.compile(r"^ea[ -]?([0-9]+)(?:[.-]([0-9]+|[a-z]))?(?:[.-]([0-9]+|[a-z]))?$")


def normalise(text: str) -> str:
    """NFKD, drop combining marks (General_Category M*), lower case, collapse whitespace."""
    bare = "".join(c for c in unicodedata.normalize("NFKD", text)
                   if not unicodedata.category(c).startswith("M"))
    return WHITESPACE.sub(" ", bare.lower()).strip(" ")


def tokens(norm: str) -> list:
    """Maximal runs of letters and digits (General_Category L* or N*) of a normalised string."""
    out, word = [], []
    for c in norm:
        if unicodedata.category(c)[0] in "LN":
            word.append(c)
        elif word:
            out.append("".join(word))
            word = []
    if word:
        out.append("".join(word))
    return out


def ea_code(norm: str):
    """The canonical EA code ("EA-1.2.3") of a normalised string, or None."""
    m = CODE.match(norm)
    if not m:
        return None
    parts = [g for g in m.groups() if g is not None]
    return "EA-" + ".".join(str(int(p)) if p.isdigit() else p.upper() for p in parts)


def _error(op, code: str, message: str, field=None) -> dict:
    return {"schema": SCHEMA, "ok": False, "op": op,
            "error": {"code": code, "message": message, "field": field}}


def _integer(value):
    """The integer a JSON number stands for (1 and 1.0 alike), else None; booleans are not."""
    if isinstance(value, bool):
        return None
    if isinstance(value, int):
        return value
    if isinstance(value, float) and value.is_integer():
        return int(value)
    return None


def _sort_key(text: str) -> bytes:
    """Ascending by Unicode code point (UTF-8 bytes order the same way)."""
    return text.encode("utf-8")


def _check_data(search, graph):
    """None when both documents have the shape this version reads, else (field, message)."""
    if not isinstance(search, dict) or search.get("schema") not in SEARCH_SCHEMAS:
        return "search.schema", f"search.json schema must be one of {', '.join(SEARCH_SCHEMAS)}"
    if not isinstance(graph, dict) or graph.get("schema") not in GRAPH_SCHEMAS:
        return "graph.schema", f"graph.json schema must be one of {', '.join(GRAPH_SCHEMAS)}"
    fields = search.get("fields")
    if not isinstance(fields, list) or any(f not in fields for f in SEARCH_FIELDS):
        return "search.fields", f"search.json fields must name {', '.join(SEARCH_FIELDS)}"
    entries = search.get("entries")
    if not isinstance(entries, list):
        return "search.entries", "search.json entries must be a list"
    at = {name: fields.index(name) for name in SEARCH_FIELDS}
    for i, e in enumerate(entries):
        if (not isinstance(e, list) or len(e) < len(fields)
                or any(not isinstance(e[at[k]], str)
                       for k in ("title", "description", "url", "code", "kind"))
                or not isinstance(e[at["aliases"]], list)
                or any(not isinstance(a, str) for a in e[at["aliases"]])):
            return "search.entries", f"search.json entry {i} does not match its fields"
    nodes, edges = graph.get("nodes"), graph.get("edges")
    if not isinstance(nodes, list) or not isinstance(edges, list):
        return "graph.nodes", "graph.json must carry nodes and edges lists"
    for i, n in enumerate(nodes):
        if (not isinstance(n, dict) or n.get("id") != i
                or any(not isinstance(n.get(k), str) for k in ("path", "url", "title", "section"))
                or _integer(n.get("in")) is None):
            return "graph.nodes", f"graph.json node {i} lacks id, path, url, title, section or in"
    for e in edges:
        if (not isinstance(e, list) or len(e) != 2
                or any(_integer(x) is None or not 0 <= x < len(nodes) for x in e)):
            return "graph.edges", "graph.json edges must be [from, to] pairs of node ids"
    return None


class Engine:
    def __init__(self, search: dict, graph: dict):
        self.problem = _check_data(search, graph)
        if self.problem:
            return
        nodes = graph["nodes"]
        self.nodes = nodes
        self.by_path = {n["path"]: n for n in nodes}
        by_url = {n["url"]: n for n in nodes}
        self.adjacent = [set() for _ in nodes]
        self.edges = sorted({(a, b) for a, b in graph["edges"] if a != b})
        for a, b in self.edges:
            self.adjacent[a].add(b)
            self.adjacent[b].add(a)
        f = {name: i for i, name in enumerate(search["fields"])}
        self.entries = []
        for e in search["entries"]:
            node = by_url.get(e[f["url"]])
            if node is None:
                self.problem = ("search.entries",
                                "a search.json entry has no graph.json node with its url; "
                                "the two files are not from the same build")
                return
            title, aliases = e[f["title"]], e[f["aliases"]]
            norm_title = normalise(title)
            norm_aliases = [normalise(a) for a in aliases]
            words = tokens(norm_title) + [w for a in norm_aliases for w in tokens(a)]
            code = e[f["code"]] or None
            self.entries.append({
                "path": node["path"], "url": node["url"], "title": title, "code": code,
                "kind": e[f["kind"]], "in": node["in"],
                "ea": ea_code(normalise(code)) if code else None,
                "t": norm_title, "aliases": norm_aliases, "words": words,
                "all": words + tokens(normalise(e[f["description"]])),
            })

    def run(self, request) -> dict:
        op = request.get("op") if isinstance(request, dict) else None
        op = op if isinstance(op, str) and op in OPS else None
        if self.problem:
            return _error(op, "schema_mismatch", self.problem[1], self.problem[0])
        if not isinstance(request, dict):
            return _error(None, "bad_input", "the request must be a JSON object")
        if "op" not in request or not isinstance(request["op"], str):
            return _error(None, "bad_input", "op must be a string", "op")
        if op is None:
            return _error(None, "bad_input", f"op must be one of {', '.join(OPS)}", "op")
        unknown = sorted(k for k in request if k not in OPS[op])
        if unknown:
            return _error(op, "bad_input", f"{unknown[0]} is not a field of {op}", unknown[0])
        return self._search(request) if op == "search" else self._neighbourhood(request)

    def _limit(self, op, request, bounds):
        default, maximum = bounds
        if "limit" not in request:
            return default, None
        limit = _integer(request["limit"])
        if limit is None or not 1 <= limit <= maximum:
            return None, _error(op, "bad_input",
                                f"limit must be an integer from 1 to {maximum}", "limit")
        return limit, None

    def _search(self, request) -> dict:
        query = request.get("query")
        if not isinstance(query, str):
            return _error("search", "bad_input", "query must be a string", "query")
        if len(query) > QUERY_MAX:
            return _error("search", "bad_input",
                          f"query must be at most {QUERY_MAX} code points", "query")
        q = normalise(query)
        if not q:
            return _error("search", "bad_input", "query is empty after normalisation", "query")
        limit, err = self._limit("search", request, SEARCH_LIMIT)
        if err:
            return err
        code = ea_code(q)
        if code:
            # Every spelling of a code is one query: its canonical form, tiers 1-4 only.
            q = normalise(code)
        words = [] if code else tokens(q)

        def every(pool):
            return bool(words) and all(any(w.startswith(x) for w in pool) for x in words)

        hits = []
        for e in self.entries:
            checks = (code is not None and e["ea"] == code, e["t"] == q, q in e["aliases"],
                      e["t"].startswith(q), every(e["words"]), every(e["all"]))
            tier = next((i for i, hit in enumerate(checks) if hit), None)
            if tier is not None:
                hits.append((tier, e))
        hits.sort(key=lambda h: (h[0], -h[1]["in"], _sort_key(h[1]["path"])))
        return {"schema": SCHEMA, "ok": True, "op": "search", "query": query, "normalised": q,
                "code": code, "limit": limit, "total": len(hits),
                "hits": [{"path": e["path"], "url": e["url"], "title": e["title"],
                          "code": e["code"], "kind": e["kind"], "in": e["in"],
                          "tier": tier + 1, "why": TIERS[tier]} for tier, e in hits[:limit]]}

    def _neighbourhood(self, request) -> dict:
        op = "neighbourhood"
        path = request.get("path")
        if not isinstance(path, str) or not 1 <= len(path) <= PATH_MAX:
            return _error(op, "bad_input",
                          f"path must be a string of 1 to {PATH_MAX} code points", "path")
        depth = _integer(request["depth"]) if "depth" in request else DEPTHS[0]
        if depth not in DEPTHS:
            return _error(op, "bad_input", "depth must be 1 or 2", "depth")
        limit, err = self._limit(op, request, NEIGHBOURHOOD_LIMIT)
        if err:
            return err
        centre = self.by_path.get(path)
        if centre is None:
            return _error(op, "unknown_path", "no page has this path in graph.json", "path")
        distance = {centre["id"]: 0}
        frontier = [centre["id"]]
        for d in range(1, depth + 1):
            nxt = []
            for i in frontier:
                for j in self.adjacent[i]:
                    if j not in distance:
                        distance[j] = d
                        nxt.append(j)
            frontier = nxt
        around = sorted((i for i in distance if i != centre["id"]),
                        key=lambda i: (distance[i], -self.nodes[i]["in"],
                                       _sort_key(self.nodes[i]["path"])))
        chosen = [centre["id"]] + around[:limit]
        keep = set(chosen)
        path_of = lambda i: self.nodes[i]["path"]  # noqa: E731
        edges = sorted(((a, b) for a, b in self.edges if a in keep and b in keep),
                       key=lambda e: (_sort_key(path_of(e[0])), _sort_key(path_of(e[1]))))
        return {"schema": SCHEMA, "ok": True, "op": op, "path": path, "depth": depth,
                "limit": limit, "total": len(around), "truncated": len(around) > limit,
                "nodes": [{"path": path_of(i), "title": self.nodes[i]["title"],
                           "class": self.nodes[i]["section"], "distance": distance[i],
                           "in": self.nodes[i]["in"]} for i in chosen],
                "edges": [{"from": path_of(a), "to": path_of(b), "kind": "link"}
                          for a, b in edges]}


def load(data: pathlib.Path = DATA) -> Engine:
    """The engine over the committed static/data/search.json and graph.json."""
    read = lambda name: json.loads((data / name).read_text(encoding="utf-8"))  # noqa: E731
    return Engine(read("search.json"), read("graph.json"))
