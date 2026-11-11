---
schema: adr/v1
id: adr-0007
kind: adr
title: "Žádný import artefaktů prismatic-platform do veřejné knihy; oddíly „Vztah k Prismatic platformě“ pryč"
status: accepted
date: 2026-11-11
tags:
  - licence
  - content
provenance:
  origin: authored
---

# 7. Žádný import artefaktů prismatic-platform do veřejné knihy

## Context

Zhruba 271 veřejných stránek nese oddíl „Vztah k Prismatic platformě“, který do knihy pod
GHL v1.0 vnáší materiál ze soukromé platformy (GHL v2.0 / proprietární). ADR 0002 uvedl
historii platformy jako linii archivu; o licenci jejích artefaktů v textu knihy nerozhodl.
Session obsahu otázku zapsala do svých otevřených otázek a dál ji neřešila.

## Decision

Otázka vlastníkovi (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-11), doslovně:

> „About 271 public Kompendium pages carry a "Vztah k Prismatic platformě" section that brings
> in material from your private prismatic-platform (GHL v2.0 / proprietary) into the public
> book (GHL v1.0). Under which licence may platform artefacts enter the public book?“

Nabídnuté možnosti: „Do not import; strip (Recommended)“, „Relicense selected artefacts“,
„Private edition only“. Odpověď vlastníka doslovně: **„Do not import; strip (Recommended)“**.

Artefakty platformy do veřejné knihy nevstupují. Oddíly „Vztah k Prismatic platformě“ se
z veřejných stránek odstraní; linie v `archive/` (ADR 0002) zůstává, jak je.

## Consequences

- Odstranění dělá vlastník `content/` deterministicky (celý oddíl od nadpisu po další nadpis),
  jako jeden řez; integrační lane ho nasadí samostatně a ověří prohledáním produkce.
- Gate obsahu odmítne nadpis „Vztah k Prismatic platformě“ v `content/`, bez baseline.
- Stránka, která odstraněním klesne pod hranici rozsahu, jde do dluhu „detail“ s důvodem, ne
  zpět s platformním textem.
