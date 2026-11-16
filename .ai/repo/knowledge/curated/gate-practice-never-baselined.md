---
schema: knowledge/v1
id: gate-practice-never-baselined
kind: knowledge
class: lesson
title: "Widening or adding a never-baselined gate: the fix lands with it, the count is pages and clears per page, a zero proves only what it looks for, text moved out of a page's source is invisible to the tools, and a pattern that confirms the hypothesis is read by eye first"
description: "Before adding or widening a NEVER_BASELINED rule in scripts/check-ia.py, or before reading a 0 from one as 'the class is clean'."
status: verified
epistemics: observed
date: 2026-11-16
tags:
  - gates
  - check-ia
  - ci
provenance:
  origin: authored
---

# Widening or adding a never-baselined gate

`scripts/check-ia.py` keeps most safety rules in `NEVER_BASELINED` with a ceiling in
`PENDING_ZERO` that may only fall. Nine things about them were each rediscovered the hard way in
the sessions of 2026-11-12 to 2026-11-16.

**1. A widened gate and the content it newly charges are one change.** Widening a rule that sits
at its ceiling makes the count grow, and growth is a hard fail, so a widen pushed alone turns main
red until someone fixes the content. Land both as one branch, or as a stacked pair that lands in a
single fast-forward: `fix/pristupova-uroven` (row removal, detail 199 → 212) rode on
`feature/zvednuti-13` (the 13-page lift), and `fix/applier-checklist` carries both the widened
`PLAYBOOK_APPLIER` and the 11 pages it charged.

**2. The count is pages, not occurrences.** `--list <rule>` and `ia.json` count charged pages. A
fix that removes repeated rows from pages that still carry other repeated rows moves nothing:
`duplicate-table` stayed at 256 after 280 safeguard rows went, and fell only by the 7 pages whose
sole duplicate was the removed row. Measure the page set before promising a drop.

**3. A zero proves only what the pattern looks for.** `howto` read 0 book-wide while 11 pages
carried an applier checklist, because the pattern keyed on the words "před aplikací … protokol"
and the block said "Před aplikací: 1. Konzultuj …". `drug-name` keyed on classes and missed named
substances. Key a rule on the shape when the vocabulary varies, and write its known recall gap into
the rule's description, so that nobody reads a 0 as "class handled".

**4. Some classes are worklists, not gates.** A rule with low precision costs CI time on every
run and trains people to ignore it. Measure precision on a hand-read sample first. The bare-surname
pattern ran at ~25% (it is now `scripts/lint-bare-surname.py`, advisory), Czech reader-directed
imperatives cannot be bounded by verb lists or endings, and single-number durations ran at 10–20%.
Each became a one-off candidate list for a content pass; only the narrow, high-precision cores
became gates.

**5. A one-line content edit has a derived tail.** Adding a work to a page's `## Literatura` makes
`content/references.md` stale; editing a bold, a heading or a link moves `static/data/*.json`.
Run `scripts/verify-content.sh --fix` before every content commit, however small. It verifies the
index, not the working tree, and names any unstaged path beside its verdict.

**6. A page-counting ceiling is cleared per page, so the biggest family can be worth zero.** A
block only pays off when it is the last duplicate on its carriers. Measured on 2026-11-16, the
60-page comparative block frees 0 pages and the 40-page safety table frees 0, while the levers
were the small section-wide notices pasted on every page of one section: 11 in section 06, 10 in
07, 6 in 05, 5 in 02, 3 in 01. Four of them, 29 pages, took `duplicate-passage` from 281 to 252,
and single-block pages fell from 37 to 8. After that the lever is PAIRS: 70 of the remaining 252
pages carry exactly two charged blocks and drop only when both go. Before promising a drop on any
page-counting rule, compute the per-page block distribution, not the per-block page counts.

**7. A gate that needs language-specific words can read them out of the repository.** A rule
keyed on Czech nouns, units or labels does not need a hand list. `typed-count` learns what a
set's members are called from the derived expressions the book already writes — a page binds
`load_data(path="static/data/listings/detection-signatures.json")` and writes `{{ l.count }}
signatur`, and that sentence is the only place saying those members are "signatur" in Czech,
which no schema and no file name carries. A source with no derived expression teaches no noun and
is never charged, because there is nothing to demand in its place. Scope the rule by what the page
provably has available — the binding — not by what its name suggests it is. The matching risk is
that a vocabulary read from the tree can go empty and then charges nothing, so the case must teach
its OWN vocabulary in its fixture and prove the rule non-vacuous on every run.

**8. Moving text out of a page's source takes it away from every tool that reads the source.** The
remedy this requirement names for a shared notice — `templates/partials/` plus `{% include %}` —
leaves the page's source saying `{% include %}` where the prose stood, and `ia_model` reads the
source. Four section notices moved that way cost 17 `@/` link occurrences. So `load_pages` reads
each page twice and which copy a field comes from follows what the field is about: the SOURCE for
`duplicate-passage` and `duplicate-table`, because duplication is a property of the source and
expanding there would cancel the remedy (252 straight back to 281); the RENDERED page for `links`,
`words`, `diacritics`, `language`, `has_related` and `has_definition`, because each describes the
page a reader is handed. Two cautions found by the case that proves it: a page's links are
deduplicated into a set of targets (`ia_model.py:230`), so a partial linking what its page already
links adds no edge and a fixture built that way tests nothing; and three fixture pages sharing one
boilerplate paragraph ARE a duplicate passage, so a case can charge its own scaffolding.

**9. When a measurement returns exactly what the hypothesis predicted, read three of the
underlying pages by eye before acting.** The agreement is what stops you looking, and a pattern is
itself a hypothesis about the corpus. On 2026-11-16 the pattern `\(\w[^)]*\d{4}\)` was used to
count in-text citations; it matches only the `(Autor, 1945)` style, while this book's house style
is `Autor (1945)` with the year alone in parentheses, so `\(\w` consumes the `1` and leaves three
digits for `\d{4}` — **every citation in the dominant style scored zero.** Low counts are exactly
what a thin page is expected to show, so the result read as a finding: "15 of 19 pages cite fewer
than three of their own works, one cites none". Checking each `## Literatura` entry against its own
page's body found **one** uncited work across all nineteen pages, and the page reported as citing
none of its four cites all four. A whole expansion wave rested on it and was cancelled before a
word was written. The same day, "moving four notices into partials lost 17 links" was the same
shape: those were occurrences, not edges, because a page's links are deduplicated into a set of
targets. Prefer counting with the repository's own tools (`ia_model`, `check_ia.passage_blocks`)
over a fresh regex, and read the matching AND the non-matching items.

Instruments that misled the same sessions, and the reading that held:

- A truncated commit sha in a CI query returned 0 runs; the full sha found the run at once.
- This site's 404 page carries the full navigation, so a fetch of a wrong URL still "contains" the
  site's words. Guard every production check with the HTTP status (`curl -w '%{http_code}'`).
- A run reads `queued` while its first job runs; read the jobs, not the run's label.
- A deploy that reads `in_progress` with an hour-old update is not hung: read the job's steps, one
  of which took 23 minutes on its own.
- A monitor shorter than the run it watches reports nothing and expires; a 35-minute verify under a
  30-minute watch looks identical to silence.
- Zola's `page.word_count` is computed from the markdown BEFORE Tera expands it, so prose moved
  into a partial stops counting: the badge, schema.org `wordCount`, the technique hero and both
  explorer JSONs understate by the notice's length less the `{% include %}` line, 13-44 words per
  page on the five measured. `ia_model` reads the rendered copy, so the book briefly has two word
  counts that disagree; `static/data/ia.json` carries the one the gates judge.
- `zola check` renders content but compares nothing. To prove a change left the reader's page
  alone, build it and diff the rendered body against production — the five pages above were
  byte-identical at 13338, 14620, 22804, 19027 and 10174 characters, which is what isolated the
  word count as the only difference.
- - The primary checkout is another session's working tree and moves under a measurement. Compare
  against `git show origin/main:<path>`, never against the files in it.
- The GitHub API budget (5000 calls an hour) is shared by every session on the account, and
  several watchers polling `gh` once a minute exhausted it (2026-11-15). A watcher's filter then
  printed the 403 body where a failed job's name goes, so a rate limit read as a red build. Ask
  git what git can answer (`git ls-remote` for heads, `merge-base --is-ancestor`), read a run's
  verdict with one `gh` call per wake, and check the response has `.jobs` before judging it.
- A renumbering verified only on its new addresses looked done: production served all six new
  codes at 200 while every old address returned 404, because each alias named the page's new path
  (c5200028, 2026-11-15). A move is verified in both directions: the new page at 200 and each old
  address at 200 redirecting to it. A gate on aliases equal to their own page's address catches
  this shape of the bug before it ships.
- A grep proves only the shape it searches: 105 of 106 generated graphics looked orphaned
  because the templates build their paths (`"section-" ~ key ~ ".svg"`), and no page looked
  illustrated because the illustrations are inline SVG drawn by a script, not `![...]`. Measure
  the rendered page. For a deployed surface, the browser gate runs against production too:
  `BASE_URL=<Pages URL> PLAYWRIGHT=$PWD/node_modules/playwright-core ONLY='^/<path>/' node
  test/e2e/surfaces.cjs` (ONLY matches a path that starts with "/"; an empty selection exits 2).
- A CI watcher keyed on "the newest run for this sha" reported a pre-merge head's green as the
  merged head's: `[ "$h" != "9738c87d"* ]` is not a glob in POSIX `test`, so it filtered nothing.
  Pin the run id of the push you made and watch that id; the sha moves under you, the id does not.
- `scripts/ia-baseline.json` is written with each page's charges sorted, so a reorder shows as a
  large diff that moves nothing. Compare it as a set per page, then read what did move: a slice can
  change another rule's charges as a side effect (removing "**Přístupová úroveň L3–L4**" also
  dropped a bold-candidate charge, with nobody editing a bold).
- A baseline entry can carry a count (`citations:N`), so a slice can move the counts while no page
  or entry moves: removing uncited prose from 45 pages took book-wide citations 10279 to 10234 with
  the page and entry totals unchanged (2026-11-15). Likewise a rule whose unit is a page (a
  duplicated passage shared by 3 or more pages) holds its page count until the last family on a
  page is gone; measure the family-page incidences to see such a wave progress.
- A baseline diff speaks only for baselined rules. Never-baselined rules held by a PENDING_ZERO
  ceiling (detail, weak-link) are absent from `scripts/ia-baseline.json`, so a page newly charged by
  one of them leaves that file unchanged, and a ceiling that still holds hides a swap of pages.
  Before landing a removal, compare each such rule's page set on both trees, not only its count.
- Commit the derived state before merging main into a branch. A gate run leaves regenerated files
  modified; `git merge` then refuses, and generators run afterwards measure the unmerged tree.
- Below a few GiB free the suite fails with ENOSPC in ways that look like defects; two branches
  reported 1 and 3 failures and both were green once the disk had room. `scripts/disk-floor.sh`
  now refuses to start the gate or the suite under `KEA_MIN_FREE_MIB` (default 3072).
- After a merge, derived files (`static/data/*.json`) are regenerated from the merged content,
  never hand-merged, and checked for zero conflict markers before staging: a `<<<<<<<` staged into
  derived data passes every content gate.
