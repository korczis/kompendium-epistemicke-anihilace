---
id: project.site-derived-surfaces
version: 1
kind: rule
title: Navigační a datové plochy webu jsou odvozené a interaktivní
description: Mapa knihy, stav knihy, graf okolí, zpětné odkazy a metadata každé stránky se odvozují z obsahu a dat, nikdy se nepíšou ručně.
statement: Stav, mapu, okolí, zpětné odkazy, související stránky a metadata (SEO, Open Graph, JSON-LD) každé stránky vykresluj obecnou šablonou z obsahu a ze static/data/graph.json a metrics.json, ne ručně na stránce, a každou dlaždici, uzel a položku přehledu udělej odkazem na stránku, kterou zobrazuje.
status: active
class: blocking
depends_on: [project.information-architecture@1, project.ui-uses-flowbite-pro@1]
tags: [ui, information-architecture, seo, interactivity]
---

# Rationale

Kniha má přes 1800 stránek; cokoli psané na stránku ručně zastará a nebude jednotné. Obsah
a odkazy jsou data (`scripts/build-graph.py`), takže každou navigační a přehledovou plochu
lze odvodit jednou šablonou pro všechny stránky – a pak je i stejně interaktivní a stejně
vypadá (Flowbite Pro).

# Required behaviour

- `/mapa/` (Cytoscape.js nad `graph.json`; parametry `?oddil=`, `?stitek=`, `?stranka=`)
  a `/stav/` (ECharts nad `metrics.json`) čtou jen odvozená data.
- Každá stránka ukazuje graf okolí, zpětné odkazy („Odkazují sem“) a související stránky
  podle štítků; nesou SEO, Open Graph a JSON-LD metadata z `title` a `description`.
- Každá dlaždice, uzel grafu, sloupec grafu a položka seznamu vede na stránku, kterou
  představuje.
- Mermaid v obsahu: uzel je klikací přes `click Uzel "@/glossary/heslo.md"` (volitelně
  `#kotva`); uzel, jehož popisek se rovná názvu stránky, je klikací automaticky.
- Knihovny (Cytoscape.js, ECharts, Chart.js, p5.js, Mermaid, Flowbite) jsou vendorované
  s pevnou verzí; žádná stránka nenačítá vlastní kopii ani CDN.

# Failure behaviour

Plocha, která něco píše ručně, ukazuje prázdný graf nebo nevede na stránky, je nález
recenze třídy `blocking` a opraví se dřív, než se sloučí do `main`.

# Verification

Kouřový test v CI (`/mapa/`, `/stav/`, `/galerie/`, `graph.json`, `metrics.json`,
vendorované knihovny) a `node ~/.claude/skills/flowbite-pro/verify.mjs .` s 0 nálezy;
data hlídá `python3 scripts/build-graph.py --check`.
