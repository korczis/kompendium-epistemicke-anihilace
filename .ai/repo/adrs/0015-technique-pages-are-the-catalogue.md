---
schema: adr/v1
id: adr-0015
kind: adr
title: "The technique pages are the catalogue; chapter tables are derived from them"
status: accepted
date: 2026-11-15
tags:
  - content
  - taxonomy
  - catalogue
provenance:
  origin: authored
---

# 15. The technique pages are the catalogue; chapter tables are derived from them

## Context

Each EA code is described in two places: a technique page (`content/kompendium/techniques/`, with
`extra.ea_code`, title, description and the text under the content gates) and a hand-written row in
a chapter's catalogue table. The two had drifted. Measured read-only on 2026-11-15 (session
`a70e6c7e-b525-4e86-bcd0-65a5d3593446`, on `fix/duplicate-ea-codes` over main `ea220db8`):

- kapitola-1 (19 rows) and kapitola-7 (20 linked headings) agree with their pages exactly.
- kapitola-8, 9 and 10 (EA-5.3, 5.4, 5.5): 70 of 90 rows name a different technique from the page
  they link (5.4.3 "Curryho paradox" links "Tarsky diagonalizace pravdy"), 20 rows link no page,
  no row's code differs from its page's `ea_code`.
- 393 technique pages' codes have no catalogue row anywhere; most families have no chapter table.
- Of the 90 drifted rows, 88 name a technique with no page, title or alias anywhere in the book;
  EA-5.4.28 "Konvergentní paradox" is EA-5.4.6's page; one fuzzy hit (5.3.17) is likely false.
- Provenance: both sets came from one night of bulk generation on 2026-04-26, neither authored.
  The kapitola-8 rows first, in `8e13a953` (00:34, "expand to 102 chapters + 40 EA techniques");
  the mismatched pages 30–50 minutes later in `bbd2bfdd` (62 technique pages) and `41532c9d`
  (101). None of the sampled row names is in the author's 2025 taxonomy (ADR 0005).
- No ADR or knowledge record said which of the two is canonical.

The same drift had let six codes sit on thirteen pages, fixed on `fix/duplicate-ea-codes` with
the `duplicate-ea-code` gate.

The owner was asked, in session `a70e6c7e-b525-4e86-bcd0-65a5d3593446` on 2026-11-15 at about
17:20 Europe/Prague, verbatim:

> Kompendium chapters 8, 9 and 10 (EA-5.3, 5.4, 5.5): 70 of the 90 table rows name a different
> technique from the page they link (e.g. 5.4.3 row "Curryho paradox" links a page about "Tarsky
> diagonalizace pravdy"), and 20 rows link no page. Both sets came from one night of bulk
> generation on 2026-04-26, neither authored: the chapter rows first (commit 8e13a953), the 163
> pages 30–50 min later under the same codes. 88 of the 90 row names have no content anywhere in
> the book. Under any option, EA-5.4.28 "Konvergentní paradox" is folded into EA-5.4.6, its
> existing page. Which set describes the techniques the book means?

Options offered, verbatim:

- "P: the pages (Recommended)" — "The pages carry the text, Mechanismus and sources. The tables
  are regenerated from the pages' front matter; the ~70 row-only names are dropped. EA-5.3.27
  goes to ego-skeletalni-redukce (the page its row links); autobiografi-self-fragmentace takes
  EA-5.3.31."
- "M: keep both" — "Pages keep their techniques; the ~70 row-only names stay listed in the
  chapter as catalogued but unwritten, each a future page that would need sources before it is
  written."
- "R: the rows" — "The ~70 mismatched pages move to new codes and the rows' techniques get pages
  written — about 70 techniques the book has never described, all needing sources from scratch."

The owner's answer, verbatim: "P: the pages (Recommended)".

## Decision

1. **The technique page is the catalogue entry.** An EA code's name, family and one-line summary
   are the page's `extra.ea_code`, `title` and `description`. A chapter does not write them.
2. **Chapter catalogue tables are derived.** They are rendered from the technique pages' front
   matter (Tera `load_data`, since content is templated before shortcodes), and a gate refuses a
   hand-written EA catalogue row in content. This applies first where nothing is lost: kapitola-1,
   kapitola-7 and the families that have no table at all, so the 393 uncatalogued pages are
   catalogued.
3. **kapitola-8, 9 and 10 follow the pages.** Their tables are regenerated from the pages; the
   row-only names are dropped. EA-5.4.28 "Konvergentní paradox" folds into EA-5.4.6.
4. **EA-5.3.27** stays with `ea-5-3-27-ego-skeletalni-redukce`, the page its row linked;
   `ea-5-3-27-autobiografi-self-fragmentace` takes EA-5.3.31, the next free code of its family,
   with a Zola alias from its old URL and its links repointed. The `duplicate-ea-code` gate then
   reaches 0 and stays never-baselined at 0.

## Alternatives rejected

- **M, keep both:** would keep about 70 names the book never describes as catalogue entries, a
  promise of pages that do not exist.
- **R, the rows:** would move about 70 sourced pages to new codes and commission about 70 pages
  without content or sources, against the rule that nothing is invented.

## Consequences

- A chapter can no longer name a technique its page does not describe, nor list a code without a
  page; the catalogue cannot drift, because nothing in it is hand-written.
- Every technique page appears in its family's catalogue.
- Row-only names from kapitola-8 to 10 leave the book; one that a source later supports enters as
  a page with its own code, never as a row.
- Anything that reads the chapter tables as data reads the technique pages' front matter instead.

## Amendment, 2026-11-15: the register and the family names

Found while converting, measured in session `a70e6c7e-b525-4e86-bcd0-65a5d3593446` and agreed with
the integrator (dev-31) on the mesh:

- `08-prilohy/rejstrik-technik.md` was a sixth hand-written catalogue: 90 rows with the code in
  backticks, which the first form of the gate did not see. 42 of the 90 named a different
  technique from the page under the code (2.1.1 "Ad hominem konstrukce" over "Expertní
  disinflace"); none of the 42 names is any page's title, one (7.3.8) only differs in wording; 409
  codes had no row. It follows decision 3: it is rendered from the pages. `klasifikace.md`'s
  notation examples had the same drift (EA-5.1.30 "Apoteoza prázdna" over "Konceptuální
  entropie") and now take the name from the catalogue. `catalogue-row` refuses a backticked code
  as well as a bold one.
- Chapter and family names have one source, `data/families.toml`, which build-graph,
  catalogue.json and every derived table read; the register's headings are no longer a source,
  because they are rendered from it. The 2025 original taxonomy (ADR 0005) does not name the
  families. Where the book had two wordings (1.1–1.5), the chapter text's was chosen: the
  kapitola-1 and techniques-index wording occurs 5–12 times outside the register, the register's
  own 0–1 times. A family named nowhere in the book (1.6, 2.2–2.5, 3.x, 4.x, 6.x) keeps its code.

## Amendment, 2026-11-15: the cluster maps of kapitola-8, 9 and 10

This is an application of the owner's answer P above, not a new owner decision; the integrator
(dev-31) confirmed on the mesh that it is within P. Measured in session
`a70e6c7e-b525-4e86-bcd0-65a5d3593446` on `feature/derived-catalogue`:

- Each of the three chapters had a "Strukturální mapa: 30 technik EA-5.x v šesti klastrech" and
  six "Klastr A–F" sections: catalogue tables cut by code range, with intros making thematic
  claims about the techniques in each range.
- The themes do not hold for the pages. kapitola-9 "Lhářské varianty" (5.4.1–5.4.5) holds the
  pages on the liar, Russell's type violation, Tarski's diagonalisation, Gödelian
  self-reflection and Wittgenstein's rule-following; "Russellovské varianty" (5.4.6–5.4.10) holds
  Konvergentní paradox, Epimenides, Quine, Cantor and Berry.
- Pages 5.3.1–5.3.6 and 5.5.1–5.5.6 carry exactly the six cluster titles as technique names: the
  bulk generation of 2026-04-26 turned the cluster titles into techniques.
- The ranges and the "30 technik" headings stop at 30, while families 5.3 and 5.4 have 37 and 60
  pages: 36 pages were in no cluster. The closing summaries named row-only "vrcholové techniky"
  (5.3.28 "Vrcholová hypertransformace" over the page "Pseudo-self implantace", 5.4.28
  "Konvergentní paradox", EA-5.4.6's page, 5.5.28 "Konvergentní transkonceptualita" over
  "Olfaktická modulace").

So each chapter's map and clusters became one derived section, "Techniky EA-5.x", with the count
taken from catalogue.json; the closing summaries were rewritten to the pages, and nothing else in
the kept sections changed. The six pages named after clusters keep their names: under P the pages
are the techniques, and renaming them is a separate content slice. The rows had been most of each
chapter's running text, so each chapter gained a sourced section on the literature its page names
draw on, framed as recognition and distinction, with its own Literatura.

## Note, 2026-11-16: where the catalogue lives now

The technique catalogue named `static/data/catalogue.json` in the amendments above is the first
listing of the generic layer of rule `project.listings-derived`: it is declared in
`data/listings.toml` (key `techniques`), built by `scripts/listings.py` and written to
`static/data/listings/techniques.json`, with the keys `groups`, `parents`, `group_names` and
`parent_names` in place of `families`, `chapters`, `family_names` and `chapter_names`. The
decisions above are unchanged.
