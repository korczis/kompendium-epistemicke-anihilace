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

## Content work these answers left open: delivered by 2026-11-18

On 2026-11-17 the content lane closed and these items waited for an owner. By 2026-11-18 (main
`0e08d15b`, train-2) every one of them except the last is on main; measured on that tree:

- **`feature/puvodni-taxonomie-2`** was rebuilt on main rather than merged, as
  `feature/puvodni-taxonomie-rebuild` (`210a1514`: citations exactly as the works support them),
  landed in train-2. The old branch on origin carries nothing main needs.
- **The 19 EA-5.4 pages** were extended to the 1100-word floor (`d3b3c826`); `scripts/detail-gap.py`
  lists no `techniques/ea-5-4-*` page on `0e08d15b`.
- **`feature/techniky-drobnosti`**: both content edits are on main as `53ce7658` (`ea-5-1-22:73` now
  reads "Strukturální stopa stírání rozdílů"; the "3+ paradigmaty … 18 měsíců" and "4+ … 12 měsíců"
  thresholds are gone from `ea-5-1-26`). Its branch was deleted under answer 1 (it was `5a0228ba`).
- **Kapitola-6 as a derived listing**, in `kapitola-6-derived-listing.md`: delivered by lane dev-31
  on `feature/kapitola-6-listing` via `feature/train-1` (`0f1723f6`, `673fb312`, `abea30cb`).
- **`family-framing-placement.md`** was not among these answers and is still open.
