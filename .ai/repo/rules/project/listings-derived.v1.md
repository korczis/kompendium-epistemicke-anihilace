---
id: project.listings-derived
version: 1
kind: rule
title: Every table of a section's own pages is a declared, derived listing
description: A table that lists a section's pages is declared once in data/listings.toml and rendered from the pages' own front matter with load_data; check-ia refuses a hand-written member row and infers any undeclared listing, and a case proves every declared listing is rendered.
statement: List a section's pages only through a [[listing]] block in data/listings.toml and a load_data loop over static/data/listings/<key>.json; put a member's descriptive cell in its own front matter, derive every count, and never hand-write a row that names a member.
status: active
class: blocking
depends_on: [project.information-architecture@1, project.content-catalogs@1]
tags: [content, derived, generic, inferred, catalogue, information-architecture]

x-majordomus:
  tests: [test/cases/45_derived_listings.sh, test/cases/46_listings_rendered.sh, test/cases/42_catalogue_row.sh, test/cases/43_catalogue_loop.sh, scripts/check-ia.py]
---

# Rationale

A hand-written table of pages is a second copy of what the pages already say, and it drifts.
Measured on the book in November 2026 (ADR 0015 and its amendments): the chapter catalogue
tables of kapitola-8 to 10 named another technique than the page they linked in 70 of 90 rows;
the register named another technique in 42 of 90; six codes sat on thirteen pages; and the
section indexes typed counts that were wrong ("5 × 30 = 150 technik" over 187 pages, "Seznam 30
bridges" over 28, a "(3)" over four rows) and left pages out (08-prilohy omitted dual-use).

The owner asked on 2026-11-16 for one generic connection: inferred, derived, generic, dynamic,
integrated with `.ai/`, deployed, verified. `project.content-catalogs` already makes catalogue
entries data that one engine turns into pages; this rule is the other direction, pages into
listings, with one declaration, one builder and one membership model, so a new listing costs one
block and no code.

# Required behaviour

| what | how |
|---|---|
| declaration | `data/listings.toml`, one `[[listing]]` per listing: `key`, `section`, `index_pages`, and as needed `where`, `exclude` (each with a reason), `group` (a code pattern or a front-matter field), `names` (a names file such as `data/families.toml`), `group_names`, `group_order`, `group_notes`, `fields`, `title_strip`, `summary_strip` |
| builder | `scripts/listings.py`, run by `scripts/build-ui-data.py`, writes `static/data/listings/<key>.json` from each member's front matter; a file of a listing no longer declared is stale and removed. One output shape for every listing: `items`, `groups`, `group_order`, `group_names`, `group_notes`, `parents`, `parent_names`, `parent_counts`, `entries`, `count` |
| members | a section's pages and its subsections' index pages; nothing is special-cased in code: a member that must not be listed is excluded in the declaration, with its reason |
| rendering | `{% set l = load_data(path="static/data/listings/<key>.json") %}` and a loop over one group, one parent, `items` or `group_order`; a single entry by code is `l.entries["…"]` |
| cells | a member's short descriptive cell lives in its own front matter (`extra.listing_note`, `extra.exploitation`, a declared field), moved verbatim; a number (count, word count) is derived in the template, never typed |
| names | chapter and family names have one source, `data/families.toml` (ADR 0015) |
| graph | `scripts/ia_model.py` adds a rendered loop's links, and the links inside the looped members' declared fields, from the same membership, so the graph matches what the page renders |
| catalogue codes | `catalogue-row`: no table row anywhere in content starts with a bold or backticked EA technique code (ADR 0015) |

The two listing rules of `scripts/check-ia.py`, both never baselined:

- `listing-row`: a page a listing names in `index_pages` hand-writes no table row linking one of
  its members.
- `undeclared-listing` (inferred, so a new section cannot slip past by not declaring itself): a
  section `_index.md` whose literal table rows, outside generated `<!-- kompendium:…:begin/end -->`
  blocks, link at least `LISTING_MIN_MEMBERS` (5) of its own member pages and at least
  `LISTING_MIN_SHARE` (50 %) of them, and that is not declared, is refused. The thresholds live in
  `scripts/check-ia.py` only, with their measurement (2026-11-16: six listings at 55–100 %, then a
  gap to picked highlights at 35 % and below).

# Failure behaviour

`python3 scripts/check-ia.py` exits 1 on any `listing-row`, `undeclared-listing` or
`catalogue-row` violation and names the page and the row. `python3 scripts/build-ui-data.py
--check` exits 1 when a listing's JSON is stale. `scripts/listings.py --check-site <site>` exits
1 when a declared index page does not render, inside its tables, a link to every member its loops
select, or loops over none of its listing. A commit after which these fail is fixed by a new
commit before it is merged to `main`.

# Verification

```sh
python3 scripts/build-ui-data.py --check   # every listing's JSON is current
python3 scripts/check-ia.py                # listing-row, undeclared-listing, catalogue-row at 0
bash test/cases/45_derived_listings.sh     # the inferred thresholds at their boundaries
bash test/cases/46_listings_rendered.sh    # the built site renders every declared listing
bash test/run.sh                           # all of the above in CI
```

After a deploy, production is verified on top: each listing's index page returns 200 and renders
its members (`scripts/listings.py --check-site` over the built site that was deployed).
