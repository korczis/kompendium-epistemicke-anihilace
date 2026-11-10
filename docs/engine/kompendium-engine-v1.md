# kompendium-engine/v1

The portable contract of the site's query engine: two operations, `search` and
`neighbourhood`, over the derived data in `static/data/`. Any implementation (the site's JS, a
later wasm build) is conformant when it reproduces every fixture in `test/cases/engine/`.

| Artefact | Role |
| --- | --- |
| this document | the contract |
| `data/schemas/kompendium-engine.v1.schema.json` | JSON Schema 2020-12 of requests (`#/$defs/request`) and responses (`#/$defs/response`) |
| `scripts/engine.py` | the reference implementation (stdlib, pure; its only I/O is reading the two inputs) |
| `scripts/build-engine-fixtures.py [--check]` | derives the fixtures from the real data; `--check` runs in `npm run verify` and CI |
| `test/cases/engine/` | the fixtures: `manifest.json` plus one `{category, input, expected[, data]}` per file |
| `test/cases/04_engine_fixtures.sh` | proves the reference reproduces them and the schema rejects violations |

## Inputs

The engine is built once from two documents and then answers requests. It reads them by field
name, never by position.

| File | Schema | What the engine reads |
| --- | --- | --- |
| `static/data/search.json` | `kompendium-search/v1` (`scripts/build-ui-data.py`) | `fields` naming at least `title, description, url, code, kind, aliases, in`; `entries` |
| `static/data/graph.json` | `kompendium-graph/v2` (`scripts/build-graph.py`) | `nodes[i]` with `id = i, path, url, title, section, in`; `edges` as `[from, to]` id pairs |

A page is identified by its graph `path` (the content source path, e.g.
`glossary/gaslighting.md`). A search entry joins its graph node by exact `url`. In-degree is
the node's `in`. Edges are deduplicated and self-loops ignored.

The two documents must come from the same build. If either schema is not one this version
reads, a required field is missing or mistyped, or a search entry has no node with its url,
every request answers `schema_mismatch` (with `field` naming the document part, e.g.
`graph.schema`) before its input is looked at.

## Requests and responses

A request is a JSON object with `op`. Unknown fields are refused. Every response carries
`"schema": "kompendium-engine/v1"` and `ok`. On success it echoes the effective parameters,
defaults included. On failure it is an error object (see Errors). The values in the examples
below are illustrative; the fixtures hold real ones.

### search

```json
{"op": "search", "query": "EA-1.1.1", "limit": 12}
```

| Field | Rule |
| --- | --- |
| `query` | string, 1–200 code points, not empty after normalisation |
| `limit` | integer 1–50, default 12 |

```json
{"schema": "kompendium-engine/v1", "ok": true, "op": "search",
 "query": "EA1.1.1", "normalised": "ea-1.1.1", "code": "EA-1.1.1", "limit": 12, "total": 12,
 "hits": [{"path": "kompendium/techniques/ea-1-1-1-selektivni-expozice.md",
           "url": "/kompendium/techniques/ea-1-1-1-selektivni-expozice/",
           "title": "EA-1.1.1 Selektivní expozice", "code": "EA-1.1.1", "kind": "Technika",
           "in": 151, "tier": 1, "why": "exact_code"}]}
```

`total` counts every match and `hits` holds the first `limit` of them. `code` is the parsed EA
code of the query, or `null`. `normalised` is the string the tiers compared. A query that
matches nothing is a success with `total: 0`.

### neighbourhood

```json
{"op": "neighbourhood", "path": "glossary/gaslighting.md", "depth": 2, "limit": 28}
```

| Field | Rule |
| --- | --- |
| `path` | string, 1–512 code points, a graph node's `path` |
| `depth` | 1 or 2, default 1 |
| `limit` | integer 1–200, default 28: neighbours kept besides the centre |

```json
{"schema": "kompendium-engine/v1", "ok": true, "op": "neighbourhood",
 "path": "glossary/gaslighting.md", "depth": 2, "limit": 28, "total": 905, "truncated": true,
 "nodes": [{"path": "glossary/gaslighting.md", "title": "Gaslighting", "class": "glossary",
            "distance": 0, "in": 251}],
 "edges": [{"from": "glossary/gaslighting.md", "to": "glossary/darvo.md", "kind": "link"}]}
```

- Links count in both directions: a neighbour links to the page or the page links to it.
  `distance` is the shortest such hop count, at most `depth`.
- `nodes` holds the centre first (distance 0), then the first `limit` neighbours ordered by
  distance ascending, in-degree descending, path ascending. `total` counts every neighbour
  within `depth`, and `truncated` is `total > limit`.
- `class` is the node's `section`, the page class of `scripts/ia_model.py:section_of`.
- `edges` holds every graph link whose ends are both in `nodes`, with its direction kept,
  ordered by `from` and then `to`, both path ascending. v1 has a single edge kind, `link`.

## Normalisation

`normalise(s)` applies four steps in this order:

1. Unicode NFKD.
2. Drop every combining mark (General_Category `M*`).
3. Lower case (full Unicode default mapping, `str.lower` / `String.prototype.toLowerCase`).
4. Collapse each run of whitespace to one space and trim. Whitespace means U+0009–U+000D,
   U+0020, U+0085, U+00A0, U+1680, U+2000–U+200A, U+2028, U+2029, U+202F, U+205F, U+3000
   and U+FEFF.

So `Šikana  ` becomes `sikana`, `Rychlá karta` becomes `rychla karta`, and the ligature `ﬁ`
becomes `fi`. A **word** is a maximal run of letters and digits (General_Category `L*` or `N*`)
of a normalised string. `ea-1.2.3` has the words `ea, 1, 2, 3`, and `∇∞` has none.

**EA codes.** A normalised string is a code when it matches
`^ea[ -]?([0-9]+)(?:[.-]([0-9]+|[a-z]))?(?:[.-]([0-9]+|[a-z]))?$`. So `EA-1.2.3`, `ea 1.2.3`,
`EA1.2.3`, `ea-1-2-3`, `EA-3.2.F` and `EA-1.6` are all codes. Its canonical form is `EA-` plus
the parts joined by `.`, with numbers without leading zeros and letters in upper case
(`ea1.02.3` gives `EA-1.2.3`). The `ea` prefix is required, so a bare `1.2.3` is text. An
entry's code is canonicalised the same way.

## Search ranking

Each entry takes the first tier it satisfies, given `q = normalise(query)`. When `q` is a code,
`q` is replaced by `normalise(canonical code)` (so every spelling gives the same hits), and only
tiers 1–4 apply.

| Tier | `why` | Satisfied when |
| --- | --- | --- |
| 1 | `exact_code` | the query is a code equal to the entry's canonical code |
| 2 | `exact_title` | `normalise(title) == q` |
| 3 | `exact_alias` | `normalise(alias) == q` for one of the entry's aliases |
| 4 | `title_prefix` | `normalise(title)` starts with `q` |
| 5 | `title_word` | every word of `q` starts a word of the title or of an alias |
| 6 | `description` | every word of `q` starts a word of the title, an alias or the description |

Tiers 5 and 6 need `q` to have at least one word. Hits are ordered by tier ascending, then graph
in-degree descending, then `path` ascending. "Path ascending" means by Unicode code point
(UTF-8 byte order), never a locale collation. Each hit names its tier in `tier` and `why`.

## Errors

A failure is never an exception and never an empty success:

```json
{"schema": "kompendium-engine/v1", "ok": false, "op": "neighbourhood",
 "error": {"code": "unknown_path", "message": "no page has this path in graph.json",
           "field": "path"}}
```

| `error.code` | When |
| --- | --- |
| `schema_mismatch` | the input documents are not ones this version reads (checked first) |
| `bad_input` | the request is not an object, `op` is missing or unknown, a field is unknown, missing, mistyped or out of range |
| `unknown_path` | `neighbourhood.path` names no graph node |

`op` is the request's op when it is a known one, else `null`. `field` names the offending field:
the first unknown field in code-point order, else the first failing field in the order of the
tables above (`op`, `query`, `limit`; `op`, `path`, `depth`, `limit`), or `null` when the request
is not an object. A JSON number with an integer value (`2` or `2.0`) is an integer, and a
boolean is not a number. `message` is informative English: conformance compares everything
except `error.message`.

## Fixtures and conformance

`scripts/build-engine-fixtures.py` chooses every query and path by a rule over the committed
data. Nothing in it is typed by hand.

- Search:
  - per EA family, the most-linked technique's code in three spellings;
  - the most-linked glossary terms as written, normalised and as a three-letter prefix;
  - one alias query;
  - one description-only query;
  - one query with no results;
  - malformed requests.
- Neighbourhood:
  - the most-linked page at depth 1 and 2;
  - the least-connected page at depth 1 and 2;
  - an unknown path;
  - malformed requests.
- Data: one `schema_mismatch` per input document. Its `data` field replaces top-level fields
  of that document (here its `schema`, bumped to a version v1 does not read) before the engine
  is built.

`manifest.json` lists the fixture files in name order with their categories and counts. A
runner loads the two committed data files, applies `data` when present, runs `input`, and
compares the result with `expected` as JSON, ignoring `error.message`. Fixtures change whenever
the data does. Regenerate them with `python3 scripts/build-engine-fixtures.py` together with
`build-graph.py` and `build-ui-data.py`; `--check` fails CI otherwise.

## Versioning

`kompendium-engine/v1` is frozen once on main. A change is **breaking** (it needs `v2`) when it
changes any of these:

- the output for an input that v1 already answers: a tier, its order, a tie-break, the
  normalisation, the code grammar, a default, a limit or the neighbourhood order;
- any response field: one added, removed or renamed, or a changed meaning (the response
  shapes are closed, `additionalProperties: false`);
- an error code;
- an accepted request, which would now be refused.

Additive changes stay in v1:

- reading a new data schema version that keeps the fields above;
- a new optional request field whose default reproduces v1;
- a new operation, with its own request and response definitions.

A v2 sits beside v1: its own document
`kompendium-engine-v2.md`, schema `kompendium-engine.v2.schema.json` and fixture directory. The
`schema` field of every response tells them apart, and v1 stays until no consumer reads it.
