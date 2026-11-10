---
schema: adr/v1
id: adr-0006
kind: adr
title: "Oddíly „Operační modus“: přejmenovat a přerámovat hned, přepsat později"
status: accepted
date: 2026-11-10
tags:
  - content
  - safety
provenance:
  origin: authored
---

# 6. Oddíly „Operační modus“: přejmenovat a přerámovat hned, přepsat později

## Context

267 stránek knihy (techniky a související stránky) má oddíl „Operační modus“ psaný jako
očíslované kroky („Krok 1 … Krok 5“: jak manipulátor fasádu staví, zatemňuje, navozuje,
tlumí). Přečtený vzorek (EA-1.1.3 Terminologická mystifikace) je popisný, ale formát kroků
je tvar návodu, kterým kniha podle vlastního rámce není (project.content-defensive-frame).
Pečlivý přepis na mechanismus a znaky rozpoznání chystá session obsahu, ale je blokovaný
týdenním limitem API do 2026-11-14. Gate „howto“ v části 21 brání přidání nových takových
oddílů.

## Decision

Otázka vlastníkovi (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-10), doslovně:

> „267 technique pages in the public Kompendium have an "Operační modus" section written as
> numbered steps ("Krok 1 … Krok 5": how the manipulator sets up, obscures, induces,
> inhibits). The one I read is descriptive, but the step format reads like a playbook, which
> the book says it is not. A careful rewrite (into mechanism + recognition markers) is planned
> by a peer session but blocked by its API limit until Nov 14; a new gate already stops more
> of these being added. What should happen to the live sections now?“

Nabídnuté možnosti: „Strip now, rewrite later (Recommended)“, „Keep until the rewrite“,
„Retitle and reframe now“. Odpověď vlastníka doslovně: **„Retitle and reframe now“**.

Text oddílů zůstává. Hned se mechanicky změní:

- nadpis oddílu „Operační modus“ na rámec rozpoznání (pracovní znění „Jak technika působí –
  rozpoznání“; přesné znění volí vlastník obsahu);
- podnadpisy „Krok N — …“ přestanou být číslovanými kroky (zůstane jejich věcný název jako
  znak, který lze rozpoznat), takže oddíl nečte jako postup.

Pečlivý přepis prózy (mechanismus, znaky rozpoznání, obrana) proběhne později v plánovaném
přepisu technik a tento stav nahradí.

## Consequences

- Změnu dělá vlastník `content/` (session obsahu) jako samostatný řez; integrační lane ji
  nasadí samostatně, jako opravu dávkování léčiv (6432386f).
- Gate „howto“ (část 21) se rozšíří tak, aby odmítl i nadpis „Operační modus“ a podnadpisy
  „Krok N“ v těle techniky; bez baseline.
- Tabulka struktury hesla v `content/kompendium/techniques/_index.md` přejmenuje řádek
  „Operační modus“ stejně.
