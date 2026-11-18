---
schema: knowledge/v1
id: kapitola-6-derived-listing
kind: knowledge
class: lesson
title: "Kapitola 6 (EA-5.1) as a derived listing: agreed scope, delivered through train-1"
description: "Before changing the derived Techniky EA-5.1 section of content/kompendium/05-ultramari-techniky/kapitola-6.md, or before bringing back a Klastr A-F frame or its parenthetical technique names."
status: verified
epistemics: observed
date: 2026-11-17
tags:
  - content
  - derived
  - catalogue
  - information-architecture
provenance:
  origin: authored
---

# Kapitola 6 (EA-5.1) as a derived listing: agreed scope, delivered through train-1

## Delivered

The conversion was delivered on `feature/kapitola-6-listing` by lane dev-31 and merged into
`feature/train-1` (merge `baadb660`):

- `0f1723f6` feat(content): kapitola-6 renders EA-5.1 from the pages; the cluster map is gone;
- `673fb312` chore(data): derived files regenerated after the kapitola-6 listing;
- `abea30cb` docs(adr): 0015 amended for kapitola-6, an application of P.

**Re-measured before deletion.** The caveat below was closed: there are 17 parenthetical names
in the old cluster prose (`0f1723f6^`), and none of them is the title or an `extra.aliases`
entry of any page in `content/`; all 17 differ from the title of the page under their code.
Re-checked on `fix/kapitola-6-hub` over `fd11ca9b` with the same result. They left the book.

**Follow-up, delivered on `fix/kapitola-6-hub`.** Three pages outside the slice still depended on
the removed frame on `fd11ca9b`; none does now:

- `05-pokrocile-operace/kapitola-6/_index.md` (clusters A–C) is organised by the techniques in
  code order (`67fe2573`, bibliography `41125dec`);
- `05-pokrocile-techniky/kapitola-6/_index.md` (clusters D–F) likewise (`dcc19590`);
- the Související of `06-epistemicka-singularita/_index.md` no longer says "třicet technik
  EA-5.1", "rozcestníky po klastrech" or "vrcholová technika" (`164a8370`).

The "Klastr A–D" of `06-klinicke-aplikace/diagnosticke-indikatory.md` are screening-marker groups
of their own and stay.

The sections below are the record as it was written before the work, kept as its scope.

## Where it stands

Kapitola-8, 9 and 10 were converted to derived listings by `feature/derived-listings` (main
`5307b4e9`, 2026-11-16, rule `project.listings-derived`, ADR 0015 answer P). Kapitola-6 was left
out of that branch on purpose and agreed as a follow-up with dev-31. Session content-2e accepted it,
then released it unstarted on 2026-11-17, when main was `f6900270`. Nobody holds it now. This record
is the committed copy of the scope. The machine-local Majordomus handover of the same day
(`.ai/local/state/handovers/20261117T012251Z--…`) is not in the repository's history.

## What the page is today

`content/kompendium/05-ultramari-techniky/kapitola-6.md` (on `f6900270`):

- `## Techniky EA-5.1.* — strukturální mapa` (line 32) is a hand-written table;
- six sections `## Klastr A — Sebevztažný kolaps` to `## Klastr F — Konvergence k singularitě`
  (lines 47 to 89) group the techniques.

**Where the clusters come from.** They entered the book in the overnight bulk generation of
2026-04-26 (`8e13a953`, "expand to 102 chapters + 40 EA techniques"). No ADR mentions them, and
none of the cluster names is in the 2025 taxonomy. Removing them is therefore a cleanup under
answer P, not the loss of an owner decision.

`Klastr A` also occurs in two other files:

- `content/kompendium/05-pokrocile-operace/kapitola-6/_index.md`;
- `content/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md`.

Neither is in the agreed scope. Read both before assuming they are copies of the same frame.

## Agreed scope (dev-31, 2026-11-16)

1. One derived `Techniky EA-5.1` section, rendered from the `techniques` listing in
   `data/listings.toml` as kapitola-8 to 10 are. The Klastr A-F headings go.
2. The 17 parenthetical names in the rows either go or become the linked page title. They are
   names that occur only in a row, such as "5.1.2 (auto-falsifikace)" over the page "Konceptuální
   nihilace", and 5.1.4 is named twice.
3. Each of the 10 linked central-technique sentences stays only if its claim holds without the
   cluster frame.
4. ADR 0015 gets a doplněk marked "application of P", as kapitola-8 to 10 got.
5. Before landing, compare the per-rule page sets for `detail`, `weak-link` and citations on both
   trees, the branch and main. If the page falls under the detail floor, add sourced running text
   rather than counting table cells.

## Caveats the next picker must not skip

- **The 17-parenthetical claim was unverified when this was written** (re-measured since; see Delivered). It says that every parenthetical name differs from
  the title of the page it sits over. It was asserted once and never re-measured, by its author or
  by content-2e. Measure it before deleting any of them: a parenthetical that is in fact a page's
  title is a loss to keep, not a cleanup.
- **Test case numbers moved.** On main, 02→52, 03→53 and 40→54, and case 55 is new.
  `test/cases/46_listings_rendered.sh` is unmoved and is the case that proves the rendered listing.
- **Word counts.** `words.json` is the book's single word count. Case 55 refuses any `word_count`
  in templates, and Tera 2 forbids `load_data(...).attr`. A new partial binds the `load_data`
  result to a variable first.

## Landing

Follow the Kompendium landing protocol, the one the two derived branches followed:

1. merge `origin/main`;
2. regenerate the derived files;
3. pin CI on the exact head;
4. get the owner's approval for the push to main, recorded with `majordomus decision add`;
5. fast-forward only, with no unfinished `pages.yml` run;
6. verify production by status codes and by `scripts/listings.py --check-site` on the deployed
   build.
