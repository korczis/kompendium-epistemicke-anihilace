---
id: project.viz-component-layer
version: 1
kind: rule
title: Každá vizualizace jde přes jednu komponentovou vrstvu
description: Grafy, sítě, diagramy, simulace a 3D pohledy webu vznikají jen přes sdílenou vrstvu nad p5.js, Apache ECharts, Mermaid a three.js; žádný skript si knihovnu nezakládá, neměří, nebarví ani nepopisuje sám.
statement: Stav každou vizualizaci v static/js/ přes komponentovou vrstvu (KompendiumVrstva.p5/three/frame, V.echarts a V.network v kompendium-viz.js, Mermaid v site.js) nad odvozenými daty knihy, mobile first a responzivně, a ověř to scripts/check-viz-layer.py a npm run verify.
status: active
class: blocking
depends_on: [project.ui-quality-gate@1, project.site-derived-surfaces@3, project.content-defensive-frame@1]
tags: [ui, visualization, accessibility, responsive]
---

# Rationale

Vlastník (2026-11-10, předáno session 2e, doslova): „poradne vyuzij vsude p5.js chart.js
cytoscape.js apache echarts.js, mermaid.js, genericky, componentove, vsude, mobile first,
responsive, enforce from now on via .ai/“ a „zadne duplikace / centtralni … unified“.

Před vrstvou si 23 skriptů v static/js/ psalo vlastní kopii zavaděče dat knihy (21 identických
bloků `function kniha()`) a 13 pláten p5/three si samo určovalo velikost: pevné výšky 400–600 px,
většina bez přepočtu při změně šířky, žádné nezastavilo animaci mimo obrazovku ani při
prefers-reduced-motion, žádné nemělo ovládání pauzy a plátna byla bez popisku. Paleta a barvy
tématu existovaly ve dvou kopiích; jedna z nich měla na tmavém povrchu kontrast 2,33:1.

# Required behaviour

- Vrstva je pevná sada souborů, jeden vlastník na knihovnu (výčet: `scripts/check-viz-layer.py
  --list`): `static/js/viz/vrstva.js` (tokeny tématu, živá kategorická paleta, zavaděč dat
  knihy, plátna p5.js a three.js), `static/js/viz/kompendium-viz.js` (Apache ECharts: `V.echarts`
  pro grafy a `V.network` pro sítě, graf knihy), `static/js/site.js` (Mermaid).
- Skript mimo vrstvu knihovnu nezakládá (`new p5`, `createCanvas`, `WebGLRenderer`,
  `echarts.init`, `mermaid.initialize/run/render`), nenese vlastní zavaděč dat ani vlastní paletu.
- Chart.js a cytoscape.js jsou odstraněné (pokyn vlastníka 2026-11-14: ECharts pro grafy a sítě,
  D3 pro bespoke rozvržení, p5 pro generativní; žádné Chart.js ani Cytoscape). Žádný soubor je
  nesmí vrátit: `new Chart`, `cytoscape({…})`, vendorovaný `chart*.js`/`cytoscape*.js`, závislost
  v package.json ani `<script src=…chart/cytoscape…>` jsou zakázané kdekoli — `scripts/check-viz-layer.py`
  je hlásí a skončí kódem 1.
- Popisky os se vejdou do grafu přes vrstvu: obal nastaví `grid.outerBounds` na každém
  kartézském grafu (ECharts 6 měří popisky tak, jak jsou vykreslené). Zastaralé
  `grid.containLabel: true` je zakázané ve skriptu i ve volbě `chart_inline`
  (`static/data/charts/`); opt-out jde jen přes obal `static/js/viz/kompendium-viz.js` —
  `scripts/check-viz-layer.py` to hlásí.
- Plátno je mobile first: šířka podle hostitele, výška z poměru stran v mezích, přepočet při
  změně šířky; na 390 px nic nepřetéká. Animace stojí mimo obrazovku a při
  prefers-reduced-motion a má ovládání Pozastavit/Spustit (WCAG 2.2, 2.2.2). Plátno je
  `role="img"` s českým popiskem. Barvy jsou z tokenů vrstvy a mají kontrast aspoň 3:1 vůči
  povrchu (1.4.11), text 4,5:1.
- Data jsou odvozená (graf knihy, katalogy, tabulky v textu), ne vymyšlená
  (project.site-derived-surfaces@3). Simulace ilustrují mechanismus pro rozpoznání a obranu,
  nikdy postup provedení (project.content-defensive-frame@1).
- Nová vizualizace = nový soubor ve `static/js/viz/` nebo `static/js/kompendium/`, který volá
  vrstvu; chybí-li vrstvě schopnost, rozšíří se vrstva, ne skript.

# Failure behaviour

`scripts/check-viz-layer.py` vypíše každé porušení se souborem a řádkem a skončí kódem 1;
CI i `npm run verify` tím selžou a změna se nesloučí. Plátno, které na telefonu přetéká, je
prázdné nebo hlásí chybu konzole, zastaví gate interaktivních ploch (`test/e2e/surfaces.cjs`)
a audit (`scripts/audit-ui.cjs`).

# Verification

`python3 scripts/check-viz-layer.py` (CI krok „Every visualisation goes through the component
layer“) a `npm run verify`.
