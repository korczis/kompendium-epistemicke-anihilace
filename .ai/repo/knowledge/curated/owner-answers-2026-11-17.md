---
schema: knowledge/v1
id: owner-answers-2026-11-17
kind: knowledge
class: lesson
title: "Four owner answers of 2026-11-17 on cleanup and the content backlog, and the content work they leave unowned"
description: "Before deleting merged branches or worktrees, restoring feature/puvodni-taxonomie-2, extending EA-5.4 pages, or picking up feature/techniky-drobnosti."
status: verified
epistemics: observed
date: 2026-11-17
tags:
  - owner-check
  - content
  - branches
provenance:
  origin: authored
---

# Four owner answers of 2026-11-17 on cleanup and the content backlog, and the content work they leave unowned

## Provenance

dev-31 asked these four questions in session 5d49a595 on 2026-11-17 and relayed the answers
verbatim over the mesh. The session that committed this record did not hear the owner give them;
it is committing a peer's verbatim relay. The two earlier answers of the same session (the ghost CI
runs and `feature/content-placeholders`) are in `ghost-ci-runs.md`.

## The answers

1. Q: cleanup of merged branches and worktrees. A: "Smazat sloučené" (delete the merged ones).
   dev-31 deleted 105 branches on origin, recording each SHA, and 109 merged local branches with
   `git branch -d`. 7 remote branches remain, each with a reason. Merged, clean worktrees whose
   HEAD is on main were removed by the sessions that owned them.
2. Q: `docs/owner-answers` duplicates `ghost-ci-runs.md`. A: "Zahodit duplicitu" (drop the
   duplicate). Its owner checked that `ghost-ci-runs.md` carries everything before removing the
   branch. The removed commit was `cd5aafd9c306c5bed466f19a87df203afbe9d371`.
3. Q: `feature/puvodni-taxonomie-2` (a00d3f4c: 23 wave-2 pages not on main, 22 conflicts).
   A: "Obnovit a pustit" (restore it and let it through).
4. Q: the 19 EA-5.4 pages under the floor. A: "Dopsat na 1100" (write them up to 1100). This
   settles `technique-page-word-floor.md`.

## Content work these answers leave open, with no owner on 2026-11-17

The sessions of the content lane closed on 2026-11-17. Each item below waits for a session to
claim it:

- **`feature/puvodni-taxonomie-2` is a rebuild, not a merge.** Rebuild it on current main through
  the gates in force since 2026-11-10: ADRs 0007, 0010 and 0012 to 0015, plus the rules that
  landed on 2026-11-17:
  - typed-count;
  - reader-command;
  - platform-prose;
  - one word count: `words.json`, and case 55 refuses `word_count` in `templates/**/*.html`;
  - include partials: `templates/partials/*.md` are content, not HTML.
- **The 19 EA-5.4 pages, 1014 to 1057 words each.** Extend them with sourced,
  recognition-framed prose, never filler. They are the `gap 0-100` bucket of
  `scripts/detail-gap.py`.
- **`feature/techniky-drobnosti` (5a0228ba).** Its link fix is on main. Two content edits are
  not: "Strukturální stopa Kroku 3" at `ea-5-1-22:73` and "3+ paradigmaty … 18 měsíců" at
  `ea-5-1-26:70`.
  - Caution: `ea-5-1-22` is the live production control for the reader-command gate and sits on
    its boundary.
  - Re-read what that gate charges before and after the edit. A sentence addressed to the reader
    as patient is charged; an exercise verb for the reader as student is not.
- **Kapitola-6 as a derived listing**, in `kapitola-6-derived-listing.md`.
- **`family-framing-placement.md`** was not among these answers and is still open.
