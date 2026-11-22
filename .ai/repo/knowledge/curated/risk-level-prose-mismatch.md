---
schema: knowledge/v1
id: risk-level-prose-mismatch
kind: knowledge
class: lesson
title: "Technique metadata rows that are not derivable from front matter: risk_level prose, Subkategorie link drift, Rodičovská links"
description: "Measured facts about the technique metadata table left after the Kategorie label was resolved by ADR 0017: extra.risk_level does not determine the Riziková úroveň sentence, the Reverzibilita cell is not derivable, some Subkategorie cells carry a glossary link the front matter lacks, and the Rodičovská link is not 1:1 from parent_chapter. Each is a content decision, not a tooling one."
status: verified
epistemics: observed
date: 2026-11-22
tags:
  - content
  - front-matter
  - duplicate-table
  - owner-question
provenance:
  origin: authored
---

# Metadata rows not derivable from front matter

The Kategorie label question is **resolved**: the owner chose the chapter title as canonical for the
two drifting families (ADR 0017), the labels live once in `data/ea-categories.toml`, and
`scripts/extract-metadata-table.py` renders the Kategorie cell from there — a deliberate editorial
relabel on 11 pages of category 1 and all 51 pages of category 2, every other row held byte-exact.
What follows are the rows that are **still** not derivable, recorded as measured facts.

## Riziková úroveň / Reverzibilita are the page's own assessment (2026-11-22, main 522f632e)

Over the 366 technique pages that carry `extra.risk_level` and a `| **Riziková úroveň** |` row,
`risk_level` does **not** map one-to-one to the cell's prose tier:

- `critical` → 9 distinct prose values, `extreme` → 50, `high` → 54, `moderate` → 6,
  `moderate-high` → 8, `ultramarine` → 3; only `low-moderate` is 1:1.

Each cell is a full sentence ("Vysoká – odnímá odborníkovi institucionální hlas a ochranu…"), not a
tier label, and no page carries a `reversibility` key. So neither cell is derivable from front
matter, and a data file keyed by `risk_level` would be wrong. The tool moves each cell **verbatim**
into per-page `extra.ea_risk_text` / `extra.ea_reversibility_text`; `risk_level` is left untouched
and is **not** reconciled with the prose.

## Subkategorie display-label override — resolved; `ea_subcategory` stays a plain key

The owner's standing rule is that everything is interlinked: a template must never drop a link the
page carries. `extra.ea_subcategory` must stay a plain key (listings, filters and the graph read it
as a key), so a glossary link in the Subkategorie cell lives in a display-label override keyed by
`ea_subcategory` in `data/ea-subcategories.toml`; the partial renders
`{{ sub[page.extra.ea_subcategory] | default(value=page.extra.ea_subcategory) }}` — the override
where one exists, the plain key otherwise. Six category-1 pages (`ea-1-3-1` … `ea-1-3-6`, key
`1.3 Narušení procesů revize a falsifikace`) link `[falsifikace](@/glossary/falsifikace.md)`; the
override carries that cell verbatim, so they move byte-exact with the link preserved.

A subcategory may be added to the override file only when **every** page carrying that
`ea_subcategory` had that exact cell — adding one relabels them all. That is why
`5.1 Epistemická singularita` is **not** overridden: its pages disagree — 21 link
`[Epistemická singularita](@/glossary/epistemicka-singularita.md)`, 9 do not. That is a content
drift (by the interlinking rule the 9 should gain the link), an edit to those 9 page sources, not a
template override; the 21 linked pages stay refused by the move until it is resolved.

## Rodičovská kapitola link is not 1:1 from parent_chapter

The Rodičovská kapitola link is not derivable 1:1 from `parent_chapter` — `kapitola-1` → 2 links,
`kapitola-2` → 2, `05-ultramari-techniky` → 6, `08-prilohy` → 4 — so that row stays literal on the
page (it is kept, not moved into the partial).

## How to apply

For the rows still open above (risk_level prose, the parent_chapter link, and the `5.1` subcategory
content drift), record the owner's answer here and in the plan before templating or editing; do not
pick a mapping in tooling. The precedents are ADR 0017 (Kategorie) and the subcategory override.
