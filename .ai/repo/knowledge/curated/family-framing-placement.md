---
schema: knowledge/v1
id: family-framing-placement
kind: knowledge
class: lesson
title: "Family-level framing on 155 technique pages: where it belongs, awaiting the owner's answer"
description: "Before moving a duplicated block that turns out to be true of a whole family rather than of one technique, or when deciding whether a framing repeats on every member page."
status: verified
epistemics: observed
date: 2026-11-16
tags:
  - content
  - duplicate-passage
  - owner-check
provenance:
  origin: authored
---

# Family-level framing on 155 technique pages: where it belongs, awaiting the owner's answer

## The question for the owner

Does a family-level framing belong on **every member page of its family**, as it does today, or
**once on the family's chapter page** with a link from each member?

Nothing is blocked on the answer. The remedy described below preserves today's arrangement
exactly, so it can be applied either way; the question is whether the repetition is wanted at all.

## What was measured, 2026-11-16

Four duplicated prose blocks, each confined to exactly one family — no carrier of any of them
lies outside it:

| words | pages | family |
|-------|-------|--------|
| 64 | 60 | EA-5.4 |
| 39 | 35 | EA-5.4 |
| 50 | 30 | EA-5.3 |
| 18 | 30 | EA-5.3 |

They sit directly under `## Definice` and say something about the family, not about the technique
whose page carries them. On `ea-5-4-26-heap-paradox-eskalace` the two EA-5.4 blocks are lines 38
and 40: *"na rozdíl od technik epistemické singularity (5.1) a metatranscendentální anihilace
(5.2) zasahují paradoxální protokoly formální infrastrukturu posuzování"* and *"strukturálně
blízká kognitivní anti-rekurzivitě, ale operuje uvnitř klasické formální logiky — ortodoxní
paradoxy klasické tradice (Russell, Tarski, Gödel, Wittgenstein)"*. Both are true of all 60 pages
of EA-5.4 equally.

The per-technique content of those same pages lives in `## Vztah k jiným technikám` (`Často se
kombinuje s`, `Eskaluje do`, `Alternativy`), and it already differs per page. So the blocks are
not boilerplate pretending to be technique content; they are a family's framing, repeated.

## Why the question is open rather than settled by the fix

`duplicate-passage` charges these blocks, and the requirement's own remedy for a genuine shared
notice is `templates/partials/` plus `{% include %}`. Applying it moves the ceiling **252 → 187**
and loses nothing: the words stay (`load_pages` reads a rendered copy for `words` and `links`),
three of the four blocks' `@/` links stay, and the reader is handed an identical page.

The alternative that was measured and rejected as the first move — deleting the blocks, or
rewriting them per page — would have answered an editorial question with a gate:

- deleting the EA-5.4 pair takes all 35 of its pages below the 1100-word floor (the pair is 103
  words, and 19 of those pages are already 43–86 words short of the floor today);
- deleting the EA-5.3 pair is possible without any page falling under the floor, so the gate would
  have been satisfied while 30 readers lost a framing nobody decided to remove;
- rewriting is 130 paragraphs, of which 16 pages could carry a real rewrite from their own
  `## Literatura` (none of the 35 has its own `## Mechanismus`) and 19 would need expansion first.

So the include is applied, the arrangement is preserved, and the editorial choice stays with the
owner. The 19 thin pages are not listed here: `scripts/detail-gap.py` is the derived worklist and
all 19 are in its `gap 0-100` bucket.

## When the owner answers

The answer becomes an ADR with the owner's words verbatim, the session id and the time, the way
ADR 0014 records the three answers of 2026-11-12. This record is not the decision: it is the
measurement the decision will be made on. Open ADR numbers start at 0016 — 0015 is the technique
pages catalogue, on `feature/derived-catalogue`.
