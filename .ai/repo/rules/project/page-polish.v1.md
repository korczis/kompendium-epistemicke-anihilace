---
id: project.page-polish
version: 1
kind: rule
title: Každá stránka je obecně vyladěná a funkční na každém zařízení
description: Vzhled a chování stránek vychází z jedné obecné šablony a ověřuje ho prohlížečový test na produkční cestě a verifikátor Flowbite Pro.
statement: Vylaďuj stránky obecně – šablonou, komponentami a odvozenými daty pro všechny stránky najednou, nikdy ručně na jedné stránce – a nic nesluč, dokud neprojde test/e2e/surfaces.cjs a verify.mjs Flowbite Pro.
status: active
class: blocking
depends_on: [project.site-derived-surfaces@3, project.ui-uses-flowbite-pro@1, project.information-architecture@1]
tags: [ui, ux, quality, interactivity]
---

# Rationale

Autor 2026-11-10: „vymazli celou page + vymazli genericky ( + enforce via .ai) all pages“ a „avoid
hardcoding to prevent outdated stuff“. Ruční úprava jedné stránky zastará a rozejde se s ostatními;
obecná úprava šablony nebo komponenty platí pro všech 1800+ stránek a dá se ověřit strojově.

# Required behaviour

- Vzhled, navigace, interaktivní prvky a metadata se mění v šablonách, komponentách a odvozených
  datech (`static/data/`), ne v obsahu jednotlivé stránky.
- Obsah nepíše cesty ani adresy webu (požadavek `hardcoded-path` v `scripts/check-ia.py`);
  skripty vizualizací načítá komponenta `{{ <viz_script name="…" /> }}`.
- Fixtury testů se odvozují z dat (`graph.json`), ne z natvrdo vybraných stránek.

# Failure behaviour

Změna, po níž test nebo verifikátor selže, se nesloučí do `main`; opraví se novým commitem.

# Verification

```sh
node test/e2e/surfaces.cjs                         # Playwright na produkční cestě: prázdné grafy,
                                                   # mrtvé komponenty, chyby konzole, 4xx, 390 px
node ~/.claude/skills/flowbite-pro/verify.mjs .    # 0 nálezů
npm run verify                                     # místní zrcadlo CI
```
