---
schema: adr/v1
id: adr-0016
kind: adr
title: "Rámec rodiny i knihy zůstává na každé stránce, ale z jedné sdílené šablony"
status: accepted
date: 2026-11-22
tags:
  - content
  - duplicate-passage
  - owner-check
provenance:
  origin: authored
---

# 16. Rámec rodiny i knihy zůstává na každé stránce, ale z jedné sdílené šablony

## Context

Požadavek `duplicate-passage` účtuje 94 odstavců zkopírovaných na 3+ stránek (252 stránek,
1271 výskytů, `python3 scripts/dup-passages.py`, 2026-11-22). Znalost
`family-framing-placement` (2026-11-16) změřila, že 69 z nich leží uvnitř jedné rodiny nebo
sekce (788 výskytů) a 25 napříč rodinami (483 výskytů), mezi nimi i obranný rámec knihy
(„Tento článek **nemá operační charakter**…“), diferenciální diagnóza a pozorování klinika.
Kam rámec patří, byla redakční otázka vlastníka, ne otázka brány.

## Decision

Otázky položila session `5d49a595-d035-4bbe-b04a-d12695922860` (dev-31) přes AskUserQuestion,
odpovězeno 2026-11-22T05:05Z. Doslova:

1. Otázka: „Kompendium: 69 duplicitních odstavců rámuje celou rodinu technik a ne konkrétní
   stránku. Jde o 29 různých sad stránek, celkem 788 výskytů, například odstavec „na rozdíl od
   technik epistemické singularity (5.1)…“ na 60 stránkách EA-5.4. Kde mají být?“
   Odpověď: **„Partial na stránce (Recommended)“** — text na každé stránce zůstane, ale půjde
   ze sdílené šablony.
2. Otázka: „Kompendium: 25 odstavců se opakuje napříč rodinami. Patří mezi ně i obranný rámec
   knihy: „Tento článek nemá operační charakter: jeho účelem je výhradně defenzivní
   rozpoznání…“ (25 stránek), dále oddíl o diferenciální diagnóze a o tom, co pozoruje klinik
   nebo supervizor. Co s nimi?“
   Odpověď: **„Partial, text beze změny (Recommended)“** — jedna šablona pro celou knihu,
   vložená na stejné místo každé stránky; obranná formulace zůstává doslova.

## Consequences

- Každý účtovaný odstavec se přesune do `templates/partials/` a stránka ho vkládá
  `{% include %}` na místě, kde stál. Čtenář dostane stejnou stránku; slova a `@/` odkazy
  se čtou z rozvinuté kopie (`scripts/ia_model.py`, `expand_includes`), takže žádná stránka
  nespadne pod 1100 slov a graf odkazů se nezmění.
- Převod dělá nástroj, ne ruka: bloky se odvozují z `passage_blocks` brány, tedy přesně to,
  co brána účtuje. Text obranného rámce se nemění ani o znak.
- Rozhodnutí neruší rozlišení z `family-framing-placement`: odstavec, který říká něco
  o konkrétní technice, se přepisuje per stránka, ne přesouvá.
