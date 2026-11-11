---
schema: adr/v1
id: adr-0008
kind: adr
title: "Na veřejném webu žádná funkce „rozpoznat“ (text dovnitř, shodná hesla ven)"
status: accepted
date: 2026-11-11
tags:
  - safety
  - ui
provenance:
  origin: authored
---

# 8. Na veřejném webu žádná funkce „rozpoznat“

## Context

Katalogy vzorců NLP a argumentačních faulů (větev feature/catalogs-fauly) nesou trenažér:
čtenář vloží výrok a stránka odpoví, zda je manipulativní nebo neškodný, které heslo mu
odpovídá, jeho marker a obrannou odpověď. Kontrakt jádra (kompendium-engine/v1) počítá s
operací „recognise“ nad exportem katalogů. I funkce, která lidi nehodnotí, jde přenést na
odhalovací nástroj proti lidem, a to je proti obrannému rámci knihy
(project.content-defensive-frame).

## Decision

Otázka vlastníkovi (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-11), doslovně:

> „Should a "recognise" function run on the public site at all? It takes a piece of text and
> links to the book entries whose recognition markers match (no scoring of people, no
> profiles, no storage). 2e's catalogue trainer (NLP patterns and argumentation fallacies:
> utterance in, manipulative/benign, which entry, defensive response) is this kind of surface
> and is waiting to be merged.“

Nabídnuté možnosti: „No public recognise surface (Recommended)“, „Yes, link-only reading aid“,
„Local/offline only“. Odpověď vlastníka doslovně: **„No public recognise surface
(Recommended)“**.

Veřejný web nemá žádnou plochu, do které se vkládá text a která vrací shodná hesla nebo
klasifikaci. Katalogy zůstávají jako referenční stránky k procházení (heslo, struktura,
znaky, obrana, prameny, vazby).

## Consequences

- Trenažér katalogů a každá jiná plocha „text dovnitř → hesla ven“ se na veřejný web
  nesloučí; větev katalogů přijde bez nich.
- Operace `recognise` se do kontraktu jádra ani do `static/js/viz/jadro.js` nepřidá.
- Gate webu odmítne v šablonách a skriptech plochu, která čte volný text čtenáře a vrací
  hesla podle jejich markerů (hledání podle názvu, kódu a aliasu zůstává).
