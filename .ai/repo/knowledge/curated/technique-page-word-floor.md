---
schema: knowledge/v1
id: technique-page-word-floor
kind: knowledge
class: lesson
title: "Nineteen EA-5.4 pages are complete and 43–86 words short of the 1100-word floor: is the floor right for them, awaiting the owner's answer"
description: "Before expanding a page to clear the `detail` floor, or when deciding whether a short but finished page is a defect."
status: verified
epistemics: observed
date: 2026-11-16
tags:
  - content
  - detail
  - owner-check
provenance:
  origin: authored
---

# Nineteen EA-5.4 pages are complete and 43–86 words short of the 1100-word floor

## The question for the owner

Is 1100 words the right `detail` floor for a technique page of the EA-5.4 family, or are these
nineteen pages finished at the length they are?

Nothing is blocked on the answer. The pages stay charged meanwhile and
`scripts/detail-gap.py` carries them, so waiting costs nothing.

## What was measured, 2026-11-16

Nineteen pages of EA-5.4 sit under the floor: `ea-5-4-11`, `-12`, `-18`, `-19`, `-20`, `-21`,
`-23`, `-24`, `-25`, `-26`, `-27`, `-30`, `-31`, `-32`, `-33`, `-35`, `-36`, `-37`, `-38`, at
1014–1057 words against a floor of 1100 — **43 to 86 words short**, all of them in
`detail-gap.py`'s `gap 0-100` bucket.

They are not stubs. Every one of the nineteen has:

- exactly **nine** `##` sections, the same structure as the rest of the family;
- a `## Literatura` of **three to five** works;
- those works **used in the text** — one single listed-but-uncited work across all nineteen pages
  (O'Connor 1948 on `ea-5-4-36`);
- the book's hedging where it belongs. `ea-5-4-26`, the shortest at 1014 words, carries a
  differential key, a `## Vztah k jiným technikám` distinct from its neighbours', and the sentence
  *"Popsané pořadí je pozorovaný sled znaků, nikoli postup."*

## Why this is a question and not a task

An expansion wave was proposed for these pages and **cancelled**. It rested on a finding that 15
of the 19 cited fewer than three of their own works, which was an instrument error: the pattern
`\(\w[^)]*\d{4}\)` matches only the `(Autor, 1945)` style, while this book's house style is
`Autor (1945)` with the year alone in parentheses — so every citation in the dominant style scored
zero. `ea-5-4-33`, reported as citing none of its four works, cites all four. See lesson 9 of
`gate-practice-never-baselined.md`.

With that gone there is no cheap honest expansion. Adding 43 to 86 words to a page that is
structured, sourced and hedged is padding, and padding is the thing the floor exists to catch — so
clearing the rule that way would defeat the rule while satisfying it. Real expansion needs source
material the book does not yet have, which is the owner's to commission.

## When the owner answers

If the pages are finished as they are, the floor for this page class is what changes, and that is
an ADR with the owner's words verbatim, the session id and the time. If instead they are to grow,
it is a commission for source work on EA-5.4 and the nineteen pages are its scope. Either way this
record is the measurement, not the decision. The sibling question about where a family framing
belongs is in `family-framing-placement.md`.
