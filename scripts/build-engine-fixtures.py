#!/usr/bin/env python3
"""Derive the conformance fixtures of kompendium-engine/v1 into test/cases/engine/.

Fixtures are derived; never edit by hand. Every query and path is chosen by a rule from the
committed static/data/search.json and static/data/graph.json, and every expected output is what
scripts/engine.py (the reference) answers. Any implementation of the contract (the site's JS,
a wasm build) must reproduce each fixture; test/cases/04_engine_fixtures.sh proves the reference
does.

  test/cases/engine/manifest.json  the fixture files in order, their categories and counts
  test/cases/engine/<name>.json    {category, input, expected[, data]}; `data` replaces
                                   top-level fields of search.json or graph.json before the
                                   engine is built (used only for schema_mismatch)

Conformance: an implementation's output equals `expected` as JSON once `error.message` is
removed from both (messages are informative). Every expected output is valid against
data/schemas/kompendium-engine.v1.schema.json, every input of a bad_input fixture is invalid
against #/$defs/request and every other input valid; this script checks both with a small
stdlib validator for the schema keywords the contract uses, and refuses to write otherwise.

Usage:
  scripts/build-engine-fixtures.py           regenerate the fixtures
  scripts/build-engine-fixtures.py --check   exit 1 when a fixture is stale, missing or extra
"""
import json
import pathlib
import re
import sys

sys.dont_write_bytecode = True  # no __pycache__ in the checkout
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import engine  # noqa: E402

ROOT = pathlib.Path(__file__).resolve().parent.parent
OUT = ROOT / "test" / "cases" / "engine"
SCHEMA_FILE = ROOT / "data" / "schemas" / "kompendium-engine.v1.schema.json"
MANIFEST = "manifest.json"
NOTE = "fixtures are derived by scripts/build-engine-fixtures.py; never edit by hand"
TOP_TERMS = 5        # glossary terms with the most in-links that get three queries each
DESCRIPTION_MIN = 6  # shortest description-only query word
PREFIX = 3           # letters of a title-prefix query
SMALL_LIMIT = 10     # neighbours kept by the hub and depth-2 fixtures (the leaf at depth 1
                     # keeps the default, so both an explicit and the default limit are tested)


# --- A JSON Schema 2020-12 validator for the subset the contract uses ----------------------
ANNOTATIONS = {"$schema", "$id", "$defs", "$comment", "title", "description"}
KEYWORDS = {"$ref", "type", "const", "enum", "properties", "required", "additionalProperties",
            "items", "minItems", "maxItems", "minLength", "maxLength", "pattern", "minimum",
            "maximum", "oneOf", "anyOf"} | ANNOTATIONS


def _type_of(value) -> set:
    if value is None:
        return {"null"}
    if isinstance(value, bool):
        return {"boolean"}
    if isinstance(value, int) or (isinstance(value, float) and value.is_integer()):
        return {"integer", "number"}
    if isinstance(value, float):
        return {"number"}
    return {{str: "string", list: "array", dict: "object"}[type(value)]}


def _same(a, b) -> bool:
    """JSON equality: true is not 1, 1 is 1.0."""
    if _type_of(a) != _type_of(b):
        return False
    if isinstance(a, list):
        return len(a) == len(b) and all(_same(x, y) for x, y in zip(a, b))
    if isinstance(a, dict):
        return a.keys() == b.keys() and all(_same(a[k], b[k]) for k in a)
    return a == b


def validate(value, schema: dict, root: dict = None, at: str = "$") -> list:
    """The violations of `value` against `schema` (empty when valid)."""
    root = root or schema
    unknown = set(schema) - KEYWORDS
    if unknown:
        return [f"{at}: schema keyword {sorted(unknown)[0]} is not supported"]
    if "$ref" in schema:
        target = root
        for part in schema["$ref"].removeprefix("#/").split("/"):
            target = target[part]
        errors = validate(value, target, root, at)
        if errors:
            return errors
    errs = []
    types = schema.get("type")
    if types is not None:
        wanted = {types} if isinstance(types, str) else set(types)
        if not wanted & _type_of(value):
            return [f"{at}: expected {'/'.join(sorted(wanted))}"]
    if "const" in schema and not _same(value, schema["const"]):
        errs.append(f"{at}: expected {json.dumps(schema['const'])}")
    if "enum" in schema and not any(_same(value, x) for x in schema["enum"]):
        errs.append(f"{at}: not one of {json.dumps(schema['enum'])}")
    if isinstance(value, str):
        if len(value) < schema.get("minLength", 0):
            errs.append(f"{at}: shorter than {schema['minLength']}")
        if "maxLength" in schema and len(value) > schema["maxLength"]:
            errs.append(f"{at}: longer than {schema['maxLength']}")
        if "pattern" in schema and not re.search(schema["pattern"], value):
            errs.append(f"{at}: does not match {schema['pattern']}")
    if "integer" in _type_of(value) or "number" in _type_of(value):
        if "minimum" in schema and value < schema["minimum"]:
            errs.append(f"{at}: below {schema['minimum']}")
        if "maximum" in schema and value > schema["maximum"]:
            errs.append(f"{at}: above {schema['maximum']}")
    if isinstance(value, list):
        if len(value) < schema.get("minItems", 0):
            errs.append(f"{at}: fewer than {schema['minItems']} items")
        if "maxItems" in schema and len(value) > schema["maxItems"]:
            errs.append(f"{at}: more than {schema['maxItems']} items")
        if "items" in schema:
            for i, item in enumerate(value):
                errs += validate(item, schema["items"], root, f"{at}[{i}]")
    if isinstance(value, dict):
        props = schema.get("properties", {})
        errs += [f"{at}: missing {k}" for k in schema.get("required", []) if k not in value]
        if schema.get("additionalProperties") is False:
            errs += [f"{at}: unexpected {k}" for k in sorted(value) if k not in props]
        for k, sub in props.items():
            if k in value:
                errs += validate(value[k], sub, root, f"{at}.{k}")
    for key in ("oneOf", "anyOf"):
        if key in schema:
            passing = sum(1 for sub in schema[key] if not validate(value, sub, root, at))
            if passing == 0 or (key == "oneOf" and passing > 1):
                errs.append(f"{at}: {key} matched {passing} alternatives")
    return errs


def load_schema() -> dict:
    return json.loads(SCHEMA_FILE.read_text(encoding="utf-8"))


def against(value, schema: dict, name: str) -> list:
    """Violations of `value` against #/$defs/<name> of the contract schema."""
    return validate(value, {"$ref": f"#/$defs/{name}"}, schema)


def strip_message(response):
    """The part of a response that conformance compares (error.message is informative)."""
    if isinstance(response, dict) and isinstance(response.get("error"), dict):
        return {**response, "error": {k: v for k, v in response["error"].items()
                                      if k != "message"}}
    return response


# --- Fixture selection: every query and path by a rule over the data -----------------------
def read(name: str) -> dict:
    return json.loads((ROOT / "static" / "data" / name).read_text(encoding="utf-8"))


def most_linked(nodes: list) -> list:
    return sorted(nodes, key=lambda n: (-n["in"], n["path"].encode("utf-8")))


def bump(schema: str) -> str:
    """"kompendium-graph/v2" -> "kompendium-graph/v3": a version this engine does not read."""
    name, version = schema.rsplit("/v", 1)
    return f"{name}/v{int(version) + 1}"


def cases(search: dict, graph: dict) -> list:
    """[(name, category, input, data override or None)] in a fixed order."""
    out = []
    nodes = graph["nodes"]
    f = {name: i for i, name in enumerate(search["fields"])}
    entries = search["entries"]
    by_url = {n["url"]: n for n in nodes}

    # Codes: per EA family, the most-linked technique's code in three spellings.
    for family in sorted(graph["families"], key=lambda k: int(k[len("EA-"):])):
        techniques = [n for n in nodes if n.get("ea_code", "").startswith(family + ".")]
        if not techniques:
            continue
        code = most_linked(techniques)[0]["ea_code"]
        tail = code[len("EA-"):]
        slug = family.lower()
        for label, query in (("canonical", code), ("lower-space", "ea " + tail),
                             ("joined", "EA" + tail)):
            out.append((f"search-code-{slug}-{label}", "code",
                        {"op": "search", "query": query}, None))

    # Terms: the most-linked glossary entries, as written, folded and as a prefix.
    glossary = [n for n in nodes if n["path"].startswith("glossary/")
                and not n["path"].endswith("_index.md")]
    terms = most_linked(glossary)[:TOP_TERMS]
    for rank, node in enumerate(terms, 1):
        title = node["title"]
        for label, query in (("title", title), ("folded", engine.normalise(title)),
                             ("prefix", title[:PREFIX])):
            out.append((f"search-term-{rank:02d}-{label}", "term",
                        {"op": "search", "query": query}, None))

    # Alias: the most-linked entry whose last alias has a word and differs from its title.
    with_alias = [e for e in entries if e[f["aliases"]]
                  and engine.tokens(engine.normalise(e[f["aliases"]][-1]))
                  and engine.normalise(e[f["aliases"]][-1]) != engine.normalise(e[f["title"]])]
    best = min(with_alias, key=lambda e: (-by_url[e[f["url"]]]["in"],
                                          by_url[e[f["url"]]]["path"].encode("utf-8")))
    out.append(("search-alias", "alias", {"op": "search", "query": best[f["aliases"]][-1]}, None))

    # Description only: the first word of the most-linked descriptions that starts no title or
    # alias word anywhere (so every hit is on the description tier).
    named = set()
    for e in entries:
        for text in [e[f["title"]]] + e[f["aliases"]]:
            named.update(engine.tokens(engine.normalise(text)))
    ranked = sorted(entries, key=lambda e: (-by_url[e[f["url"]]]["in"],
                                            by_url[e[f["url"]]]["path"].encode("utf-8")))
    word = next(w for e in ranked for w in engine.tokens(engine.normalise(e[f["description"]]))
                if len(w) >= DESCRIPTION_MIN and w.isalpha()
                and not any(n.startswith(w) for n in named))
    out.append(("search-description", "description", {"op": "search", "query": word}, None))

    # No result: the shortest run of "x" (from PREFIX letters) that nothing starts.
    words = set(named)
    for e in entries:
        words.update(engine.tokens(engine.normalise(e[f["description"]])))
    nothing = next("x" * k for k in range(PREFIX, engine.QUERY_MAX)
                   if not any(w.startswith("x" * k) for w in words))
    out.append(("search-none", "none", {"op": "search", "query": nothing}, None))

    # Malformed search requests: each refused with bad_input naming one field.
    term = terms[0]["title"]
    for label, request in (
            ("not-object", [term]),
            ("missing-op", {"query": term}),
            ("unknown-op", {"op": "match", "query": term}),
            ("unknown-field", {"op": "search", "query": term, "sort": "title"}),
            ("missing-query", {"op": "search"}),
            ("query-number", {"op": "search", "query": 42}),
            ("query-blank", {"op": "search", "query": " \t "}),
            ("query-only-marks", {"op": "search", "query": "́̌"}),
            ("query-too-long", {"op": "search", "query": "a" * (engine.QUERY_MAX + 1)}),
            ("limit-zero", {"op": "search", "query": term, "limit": 0}),
            ("limit-string", {"op": "search", "query": term, "limit": "5"}),
            ("limit-too-big", {"op": "search", "query": term,
                               "limit": engine.SEARCH_LIMIT[1] + 1})):
        out.append((f"search-bad-input-{label}", "bad_input", request, None))

    # Neighbourhood: the most-linked page at both depths, a leaf, an unknown path.
    hub = most_linked(nodes)[0]
    degree = {n["id"]: set() for n in nodes}
    for a, b in graph["edges"]:
        if a != b:
            degree[a].add(b)
            degree[b].add(a)
    leaf = min((n for n in nodes if degree[n["id"]]),
               key=lambda n: (len(degree[n["id"]]), n["path"].encode("utf-8")))
    paths = {n["path"] for n in nodes}
    missing = hub["path"].removesuffix(".md") + "-neexistuje.md"
    while missing in paths:
        missing = missing.removesuffix(".md") + "-neexistuje.md"
    for label, node, depth in (("hub", hub, 1), ("hub", hub, 2), ("leaf", leaf, 1),
                               ("leaf", leaf, 2)):
        request = {"op": "neighbourhood", "path": node["path"], "depth": depth}
        if label == "hub" or depth == 2:
            request["limit"] = SMALL_LIMIT
        out.append((f"neighbourhood-{label}-depth-{depth}", "neighbourhood", request, None))
    out.append(("neighbourhood-unknown-path", "unknown_path",
                {"op": "neighbourhood", "path": missing}, None))
    for label, request in (
            ("missing-path", {"op": "neighbourhood", "depth": engine.DEPTHS[0]}),
            ("depth-too-deep", {"op": "neighbourhood", "path": hub["path"],
                                "depth": engine.DEPTHS[-1] + 1}),
            ("depth-string", {"op": "neighbourhood", "path": hub["path"], "depth": "1"}),
            ("limit-too-big", {"op": "neighbourhood", "path": hub["path"],
                               "limit": engine.NEIGHBOURHOOD_LIMIT[1] + 1})):
        out.append((f"neighbourhood-bad-input-{label}", "bad_input", request, None))

    # Data of a version this engine does not read.
    for doc, data in (("search", search), ("graph", graph)):
        out.append((f"schema-mismatch-{doc}", "schema_mismatch",
                    {"op": "search", "query": term}, {doc: {"schema": bump(data["schema"])}}))
    return out


def _error_is(code):
    return lambda r: not r["ok"] and r["error"]["code"] == code


# What each category's rule promises; a fixture that breaks it means the rule chose badly.
RULES = {
    "code": lambda r: r["ok"] and r["hits"] and r["hits"][0]["why"] == "exact_code",
    "term": lambda r: r["ok"] and r["total"] > 0,
    "alias": lambda r: r["ok"] and any(h["why"] == "exact_alias" for h in r["hits"]),
    "description": lambda r: r["ok"] and r["total"] > 0
    and all(h["why"] == "description" for h in r["hits"]),
    "none": lambda r: r["ok"] and r["total"] == 0,
    "neighbourhood": lambda r: r["ok"] and len(r["nodes"]) > 1,
    "bad_input": _error_is("bad_input"),
    "unknown_path": _error_is("unknown_path"),
    "schema_mismatch": _error_is("schema_mismatch"),
}


def apply(search: dict, graph: dict, data) -> engine.Engine:
    """The engine over the data with a fixture's `data` override applied."""
    data = data or {}
    return engine.Engine({**search, **data.get("search", {})}, {**graph, **data.get("graph", {})})


def build() -> dict:
    search, graph = read("search.json"), read("graph.json")
    schema = load_schema()
    reference = engine.Engine(search, graph)
    files, listing, counts, problems = {}, [], {}, []
    for name, category, request, data in cases(search, graph):
        expected = (apply(search, graph, data) if data else reference).run(request)
        fixture = {"category": category, "input": request, "expected": expected}
        if data:
            fixture["data"] = data
        problems += [f"{name}: expected {e}" for e in against(expected, schema, "response")]
        request_errors = against(request, schema, "request")
        if category == "bad_input" and not request_errors:
            problems.append(f"{name}: the schema accepts a request the engine refuses")
        if category != "bad_input" and request_errors:
            problems.append(f"{name}: input {request_errors[0]}")
        if not RULES[category](expected):
            problems.append(f"{name}: the {category} rule did not give the expected outcome")
        if name + ".json" in files:
            problems.append(f"{name}: derived twice")
        files[name + ".json"] = fixture
        listing.append({"file": name + ".json", "category": category})
        counts[category] = counts.get(category, 0) + 1
    files[MANIFEST] = {"schema": "kompendium-engine-fixtures/v1", "engine": engine.SCHEMA,
                       "note": NOTE,
                       "data": {"search": search["schema"], "graph": graph["schema"]},
                       "counts": counts,
                       "fixtures": sorted(listing, key=lambda x: x["file"])}
    return {"files": files, "problems": problems}


def serialise(data) -> str:
    return json.dumps(data, ensure_ascii=False, indent=2, sort_keys=True) + "\n"


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    unknown = [a for a in args if a != "--check"]
    if unknown:
        print(f"build-engine-fixtures: unknown argument {unknown[0]}; see --help", file=sys.stderr)
        return 2
    check = "--check" in args
    result = build()
    if result["problems"]:
        for p in result["problems"]:
            print(f"build-engine-fixtures: {p}", file=sys.stderr)
        return 1
    wanted = {name: serialise(data) for name, data in sorted(result["files"].items())}
    present = {p.name for p in OUT.glob("*.json")} if OUT.exists() else set()
    stale = [n for n, text in wanted.items()
             if n not in present or (OUT / n).read_text(encoding="utf-8") != text]
    extra = sorted(present - set(wanted))
    if check:
        if stale or extra:
            listed = ", ".join(stale[:5] + [f"{n} (extra)" for n in extra[:5]])
            print(f"build-engine-fixtures: stale {len(stale) + len(extra)} file(s): {listed}; "
                  "run scripts/build-engine-fixtures.py")
            return 1
        print(f"build-engine-fixtures: up to date ({len(wanted) - 1} fixtures)")
        return 0
    OUT.mkdir(parents=True, exist_ok=True)
    for name in extra:
        (OUT / name).unlink()
    for name in stale:
        (OUT / name).write_text(wanted[name], encoding="utf-8")
    print(f"build-engine-fixtures: wrote {len(stale)}, removed {len(extra)} "
          f"({len(wanted) - 1} fixtures)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
