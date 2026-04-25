+++
title = "Interaktivní vizualizace"
description = "Klikatelné Chart.js / Three.js / p5.js vizualizace EA taxonomie — distribuce, severity matrix, 3D graph technik, recovery trajectory, fenomenologická timeline, 2D síť, rekurzivní spirála, NABLA pipeline, simulace epistemické dezintegrace, simulace narušení pozornosti."
weight = 90
sort_by = "weight"
template = "section.html"

[taxonomies]
tags = ["kompendium", "vizualizace", "interaktivni", "chartjs", "threejs", "p5js"]
categories = ["academic", "tools"]

[extra]
section_icon = "📊"
toc = true
parent = "kompendium"
+++

# Interaktivní vizualizace EA taxonomie

Deset klikatelných vizualizací umožňujících interaktivní průchod taxonomií [epistemické a kognitivní anihilace](/glossary/epistemicka-anihilace/). Každá vizualizace načítá data ze zveřejněných článků kompendia a propojuje vás přímo do [techniques podknihovny](/kompendium/techniques/).

## 1. Distribuce technik napříč kategoriemi (Chart.js)

Doughnut chart ukazující kolik [EA technik](/glossary/taxonomie-ea/) je v každé kategorii. Klik na segment → drilldown s odkazy na konkrétní techniky.

<canvas id="taxonomy-distribution" width="800" height="500"></canvas>
<div id="taxonomy-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<script src="/js/kompendium/taxonomy-distribution-chart.js"></script>

## 2. Severity matrix — kategorie × závažnost (Chart.js)

Bubble chart s velikostí kódovanou počtem technik, barva = úroveň závažnosti.

<canvas id="severity-matrix" width="800" height="500"></canvas>
<div id="severity-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
<script src="/js/kompendium/severity-matrix-chart.js"></script>

## 3. 3D graf vztahů technik (Three.js)

Force-layout 3D graph 18 reprezentativních technik napříč EA-1, EA-5.1, EA-5.2. Otáčí se automaticky, klikněte pro detail.

<div id="technique-graph-3d" style="width:100%; height:500px; background:#0f172a; border-radius:8px;"></div>
<div id="graph-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
<script src="https://cdn.jsdelivr.net/npm/three@0.160.0/build/three.min.js"></script>
<script src="/js/kompendium/technique-graph-3d.js"></script>

## 4. Trajektorie zotavení (Chart.js)

Multi-line chart reziduálního deficitu (%) v čase pro 4 úrovně závažnosti EA. Klikněte na bod pro popis fáze.

<canvas id="recovery-trajectory" width="800" height="400"></canvas>
<div id="recovery-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
<script src="/js/kompendium/recovery-trajectory-chart.js"></script>

## 5. Simulace epistemické dezintegrace (p5.js)

Animace 80 částic reprezentujících přesvědčení/koncepty. Cykluje fázemi: stabilní → perturbovaná → fragmentovaná → rekonstruovaná. Slider mění intenzitu manipulace.

<div id="epistemic-disintegration"></div>
<input id="disintegration-intensity" type="range" min="0" max="1" step="0.01" value="0.3" class="w-full mt-2">
<p class="text-slate-400 text-sm mt-1">Intenzita manipulačního tlaku (0 = stabilita, 1 = totální fragmentace)</p>
<script src="https://cdn.jsdelivr.net/npm/p5@1.9.0/lib/p5.min.js"></script>
<script src="/js/kompendium/epistemic-disintegration-sim.js"></script>

## 6. Simulace narušení pozornosti (p5.js)

Demonstrace [EA-1.1.2 informačního přetížení](/kompendium/techniques/ea-1-1-2-informacni-pretizeni/). Hýbejte myší (= pozornost). Při nízkém tempu zachycujete; při vysokém vám většina informací uniká.

<div id="attention-disruption"></div>
<input id="attention-rate" type="range" min="0.1" max="5" step="0.1" value="1" class="w-full mt-2">
<p class="text-slate-400 text-sm mt-1">Tempo informačního streamu (0.1 = pomalé, 5 = přetížení)</p>
<script src="/js/kompendium/attention-disruption-sim.js"></script>

## 7. Fenomenologická timeline symptomů (Chart.js)

Scatter chart s pěti symptomovými stopami (úzkost, depersonalizace, epistemická nejistota, somatická tíseň, konfuze identity) napříč 0–60 měsíci EA expozice. Klikněte na bod pro popis fenoménu v dané fázi.

<canvas id="phenomenology-timeline" width="800" height="500"></canvas>
<div id="phenomenology-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
<script src="/js/kompendium/phenomenology-timeline-chart.js"></script>

## 8. 2D síť EA technik (Chart.js)

Statická 2D síť ~30 reprezentativních technik se vztahy. Klikněte na uzel — zvýrazní sousední techniky a vypíše seznam.

<canvas id="ea-network-2d" width="800" height="600"></canvas>
<div id="ea-network-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
<script src="/js/kompendium/ea-network-2d.js"></script>

## 9. Rekurzivní spirála myšlení (p5.js)

Vizualizace [hyperreflexivity (EA-5.1.13)](/kompendium/techniques/) a [referenční rekurze (EA-5.1.7)](/kompendium/techniques/). Spirálové dráhy se s rostoucí hloubkou rekurze fragmentují. Pohněte myší vertikálně — nahoru = hlubší rekurze → paralýza.

<div id="recursive-thought-spiral"></div>
<p class="text-slate-400 text-sm mt-1">Pohni myší: vertikální poloha řídí hloubku rekurze (1–12). Nad 9 = metakognitivní paralýza.</p>
<script src="/js/kompendium/recursive-thought-spiral.js"></script>

## 10. NABLA Infinity 16-úrovňová pipeline (Three.js)

3D vizualizace [NABLA Infinity](/glossary/nabla-infinity/) epistemické pipeline: 16 stackovaných transparentních prstenců (L0 senzorický vstup → L15 akce/výstup). Animované částice ukazují tok dat mezi úrovněmi. Klikněte na prstenec pro detail úrovně.

<div id="nabla-pipeline-viz" style="width:100%; height:600px; background:#0f172a; border-radius:8px;"></div>
<div id="nabla-pipeline-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
<script src="/js/kompendium/nabla-pipeline-viz.js"></script>

## Související

- [Hub kompendia](/kompendium/)
- [Techniques index](/kompendium/techniques/)
- [Glossary: Taxonomie EA](/glossary/taxonomie-ea/)
- [Glossary: Decision Engine](/hub/dd/decisions/)

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [Glossary](/glossary/) | [Philosophy](/philosophy/) | [Developer Portal](/developers/)
