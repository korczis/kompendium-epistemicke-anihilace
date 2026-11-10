---
schema: adr/v1
id: adr-0004
kind: adr
title: "Akademický styl: každý bod je odstavec s referencí, každá technika a každý pojem má vlastní stránku"
status: accepted
date: 2026-11-10
tags:
  - content
  - style
  - sources
provenance:
  origin: authored
---

# 4. Akademický styl: každý bod je odstavec s referencí

## Context

Obsah knihy rozvíjely 2026-11-10 souběžně tři sessions. Pokyny autora k formě a rozsahu padly
v různých sessions; tento záznam je shromažďuje doslova, aby platily pro každou vlnu a každého
pracovníka, ne jen pro session, ve které zazněly.

## Decision

Pokyny autora doslova (bez diakritiky, jak byly napsány):

Session `62aaa969-db73-4419-aeb1-23bc36e05c88`, 2026-11-10, přibližně 00:35Z–01:00Z (předala
session `kompendium-epistemicke-anihilace-2e`):

- „rozvin kazdou jednu stranku obsahudjici text "placeholder" ci proste placeholder“
- „znas mne, znas, tech, znas, .ai/ udelej to poradne a konzistentne, enforce do budoucna“
- „kazdy jeden bod musi byt odstavec s referebcbcu“
- „vse musi byt adcademic style“
- „vse musi byt rozvinuto“
- „vse mus byt enfordced“
- „zadny placeholders“

Tamtéž, přibližně 01:40Z–03:45Z:

- „kazdy jeden poejm at je link, ve propoj, enforce via .ai/“
- „kazda techika musi mit vlastni page“
- „vse cesky ci bilungua“
- „kazdy jeden termin musi mit vlastni page - byt enforced linked from now on“
- „vse do budoucna enforce via .ai“

Session `30dc7a0e-8a7f-48e6-8922-1b1b2dc08588` (tato), 2026-11-10: „kazdy tucny link musi byt
genericky, vest na detailni page splnujici veskere parametry“, „from now on forever“; přes
session `dev-31`: „rozvin kazdy jeden markdown na 2x A4+ rozsah“, „avoid hardcoding to prevent
outdated stuff“.

Z toho plyne pro každou stránku `content/`: akademický styl v češtině (nebo dvojjazyčně),
každý věcný bod je souvislý odstavec opřený o referenci na existující dílo, žádné zástupné
texty, rozsah aspoň 2× A4, každá technika a každý pojem má vlastní stránku a každý pojem je
odkazem.

## Consequences

- Vynucuje to brána `scripts/check-ia.py` (pravidlo `project.information-architecture`):
  `detail` (prahy ze `zola.toml`), `generated`, `weak-link`, `summary`, `term-page`,
  `hardcoded-path`; požadavky na odstavce a citace (`bullets`, `citations`, `bibliography`,
  `citation-unresolved`, `technique-page`) přidává session 2e do téže brány přes `--introduce`.
- Reference musí odkazovat na skutečně existující díla (pravidlo
  `project.content-sources-verifiable`); kde jistota chybí, myšlenka zůstane bez citace a do
  hlášení se zapíše, co bylo vynecháno. Vymyšlená reference je horší než žádná.
- Odstavec s referencí nesmí být vata: rozsah se plní podstatou (znaky, odlišení, rámec,
  obrana, zotavení, otevřené otázky), ne opakováním.
