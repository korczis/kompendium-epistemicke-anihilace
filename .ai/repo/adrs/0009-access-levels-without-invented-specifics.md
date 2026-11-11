---
schema: adr/v1
id: adr-0009
kind: adr
title: "Úrovně přístupu L1–L4 zůstávají, vymyšlené podrobnosti pryč"
status: accepted
date: 2026-11-11
tags:
  - content
  - safety
provenance:
  origin: authored
---

# 9. Úrovně přístupu L1–L4 zůstávají, vymyšlené podrobnosti pryč

## Context

Kniha má vlastní klasifikaci přístupu (`content/kompendium/01-predmluva/bezpecnostni-klasifikace.md`:
L1 Foundation, L2 Practitioner, L3 Specialist, L4 Expert), na kterou se odvolává 651 stránek.
Stránka uvádí podmínky bez pramene: „8h etického školení + NDA“, „40h specializovaný kurz“,
„80h advanced training“, pojmenované kurzy po 16 a 8 hodinách a podle dřívější revize i 30denní
karanténu a mezinárodní registr porušení. Takové kurzy, registry ani certifikace neexistují.

Zkratky úrovní nejsou artefakt platformy: platformní stupně agentů (`agent-tier`) byly odstraněny
podle ADR 0007 a jediný živý význam notace L1–L4 je tento vlastní nástroj knihy (ověřeno v textu
stránky, řádky 40–42 tabulky a oddíly L1–L4).

## Decision

Otázka vlastníkovi (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-11), doslovně:

> „The Kompendium's own access classification (01-predmluva/bezpecnostni-klasifikace.md: L1
> Foundation, L2 Practitioner, L3 Specialist, L4 Expert, used by 651 pages) states specific
> prerequisites with no source: "8h etičkého školení + NDA", "40h specializovaný kurz", "80h
> advanced training", named courses of 16 and 8 hours, and (per an earlier review) a 30-day
> quarantine and an international register of violations. No such courses, registers or
> certifications exist. What should happen?“

Možnosti: „Keep levels, drop invented specifics (Recommended)“, „Keep as is“, „Replace with plain
audience notes“. Odpověď vlastníka doslovně: **„Keep levels, drop invented specifics
(Recommended)“**.

Úrovně L1–L4 zůstávají jako vlastní vodítko knihy (pro koho úroveň je a jaký dohled předpokládá).
Vymyšlené hodiny, pojmenované kurzy, NDA, karanténa a registr se odstraní a stránka řekne
otevřeně, že jde o doporučení knihy, ne o existující certifikaci.

## Consequences

- Úpravu dělá vlastník obsahu jako samostatný řez; odkazy 651 stránek na úrovně zůstávají platné.
- Gate na vzor `L[1-5]` by odmítl vlastní stránky knihy; vymyšlené podrobnosti se hlídají
  gatem šablonových čísel a revizí, ne podle notace úrovní.
