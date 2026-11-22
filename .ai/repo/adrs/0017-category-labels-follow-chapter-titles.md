---
schema: adr/v1
id: adr-0017
kind: adr
title: "Popisek kategorie v metadatové tabulce techniky je název kapitoly, jednou v datech"
status: accepted
date: 2026-11-22
tags:
  - content
  - duplicate-table
  - owner-check
provenance:
  origin: authored
---

# 17. Popisek kategorie v metadatové tabulce techniky je název kapitoly, jednou v datech

## Context

Při převodu metadatové tabulky stránek technik do jedné šablony (požadavek `duplicate-table`,
po ADR 0016) se řádek „Kategorie“ má brát z jednoho datového souboru podle `ea_category`.
Vlákno f3 změřilo 2026-11-22, že ve dvou kategoriích se popisek mezi stránkami liší:

- `ea_category = "1. Akademické techniky"`: 13× „1. Akademické techniky intelektuální
  manipulace“ (např. `ea-1-1-1-selektivni-expozice`), 9× „1. Akademické techniky“
  (`ea-1-2-4-argumentacni-oslabeni`), 2× „1. Akademické techniky – kompoziční vzorce“
  (`ea-1-6-1-vzorec-guru-a-adept`);
- `ea_category = "2. Scénáře delegitimizace"`: 49× „2. Scénáře
  [delegitimizace](@/glossary/delegitimizace.md)“ (`ea-2-1-10-credentials-rekonfigurace`),
  2× „2. Scénáře epistemické delegitimizace“ (`ea-2-1-1-expertni-disinflation`).

Kapitoly mají názvy „Akademické techniky intelektuální manipulace“ (3.1) a „Scénáře
epistemické delegitimizace“ (3.2), `content/kompendium/03-zakladni-kategorie/_index.md`.

## Decision

Otázky položila session `5d49a595-d035-4bbe-b04a-d12695922860` (dev-31), AskUserQuestion,
2026-11-22. Doslova:

1. „Kompendium: v metadatové tabulce stránek technik má kategorie 1 tři různé popisky. Který
   má být jednotný pro všech 24 stránek?“ — odpověď: **„…intelektuální manipulace
   (Recommended)“**, tedy „1. Akademické techniky intelektuální manipulace“.
2. „Kompendium: kategorie 2 má v metadatové tabulce dva různé popisky. Který má být jednotný
   pro všech 51 stránek?“ — odpověď: **„porad se s llm/ai“**.

K otázce 2 se session poradila s nezávislým modelem (Codex CLI, 2026-11-22, otázka uvedla obě
znění, počty, název kapitoly 3.2 a volbu u kategorie 1). Doporučení: „Use “2. Scénáře
epistemické delegitimizace” as the canonical wording: it matches section 3.2 and the owner’s
full chapter-title convention for category 1. Retain the glossary link on “delegitimizace”.“
Gemini CLI nevrátil odpověď. Session se s doporučením shoduje ze stejného důvodu: popisek
kategorie je název její kapitoly, stejně jako u kategorie 1.

Kanonické popisky:

- kategorie 1: `1. Akademické techniky intelektuální manipulace`
- kategorie 2: `2. Scénáře epistemické [delegitimizace](@/glossary/delegitimizace.md)`

## Consequences

- Popisek leží jednou v datovém souboru podle `ea_category` a šablona metadatové tabulky ho
  vykreslí na každé stránce, takže se znovu nerozejde.
- Je to redakční změna, ne přesun: na 11 stránkách kategorie 1 a na všech 51 stránkách
  kategorie 2 se viditelný text buňky změní. Převod proto tyto stránky neověřuje bajtovou
  shodou s dřívějším zdrojem, ale shodou s kanonickým popiskem.
- Varianta „– kompoziční vzorce“ (2 stránky EA-1.6) se nahrazuje také; podkategorii nese
  řádek „Subkategorie“.
