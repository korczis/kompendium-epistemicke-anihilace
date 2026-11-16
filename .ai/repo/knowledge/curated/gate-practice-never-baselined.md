---
schema: knowledge/v1
id: gate-practice-never-baselined
kind: knowledge
class: lesson
title: "Widening or adding a never-baselined gate: the fix lands with it, the count is pages, a zero proves only what it looks for"
description: "Before adding or widening a NEVER_BASELINED rule in scripts/check-ia.py, or before reading a 0 from one as 'the class is clean'."
status: verified
epistemics: observed
date: 2026-11-15
tags:
  - gates
  - check-ia
  - ci
provenance:
  origin: authored
---

# Widening or adding a never-baselined gate

`scripts/check-ia.py` keeps most safety rules in `NEVER_BASELINED` with a ceiling in
`PENDING_ZERO` that may only fall. Five things about them were each rediscovered the hard way in
the sessions of 2026-11-12 to 2026-11-15.

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

Instruments that misled the same sessions, and the reading that held:

- A truncated commit sha in a CI query returned 0 runs; the full sha found the run at once.
- This site's 404 page carries the full navigation, so a fetch of a wrong URL still "contains" the
  site's words. Guard every production check with the HTTP status (`curl -w '%{http_code}'`).
- A run reads `queued` while its first job runs; read the jobs, not the run's label.
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
