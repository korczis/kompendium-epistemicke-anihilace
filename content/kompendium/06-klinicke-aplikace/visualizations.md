+++
title = "Vizualizace pro Sekci 06 — Klinická cesta zotavení"
description = "Interaktivní vývojový diagram klinické cesty: assessment → diagnostika → intervence → monitoring → zotavení. Klik na fázi zvýrazní typické EA-6.X techniky používané v daném stadiu."
weight = 99

[taxonomies]
tags = ["kompendium", "vizualizace", "interaktivni", "chartjs", "klinicke-aplikace", "zotaveni"]
categories = ["academic", "clinical", "tools"]

[extra]
parent = "kompendium-06-klinicke-aplikace"
section_icon = "🏥"
toc = false
+++

# Klinická cesta zotavení

Tato sekce-specifická vizualizace zobrazuje **pětifázovou klinickou cestu** zotavení po expozici technikám epistemické anihilace ve formě toku (Sankey-like Chart.js):

1. **Assessment** — diagnostické indikátory, [self-report instrumenty](/kompendium/06-klinicke-aplikace/self-report-instrumenty/), [semi-structured interview](/kompendium/06-klinicke-aplikace/semi-structured-interview-protokol/)
2. **Diagnostika** — [diagnostické indikátory](/kompendium/06-klinicke-aplikace/diagnosticke-indikatory/), [diferenciální diagnostika](/kompendium/06-klinicke-aplikace/diferencialni-diagnostika/), screening
3. **Intervence** — [terapeutické přístupy](/kompendium/06-klinicke-aplikace/terapeuticke-pristupy/), [epistemická rekonstrukce](/kompendium/06-klinicke-aplikace/epistemicka-rekonstrukce/), [kolektivní intervence](/kompendium/06-klinicke-aplikace/kolektivni-intervence/)
4. **Monitoring** — [supervizní rámce](/kompendium/06-klinicke-aplikace/supervizni-ramce/), preventivní strategie
5. **Zotavení** — stabilizace, integrace, dlouhodobá rezilience

**Klikněte na fázi** pro zvýraznění typicky používaných EA-6.X technik a klinických aktivit.

<canvas id="section-06-recovery-flow" width="800" height="500"></canvas>
<div id="recovery-flow-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<script src="/js/kompendium/section-06-recovery-flow.js"></script>

## Jak číst diagram

- **Sloupce zleva doprava** = pět fází klinické cesty.
- **Šipky mezi sloupci** = typický flow pacienta; tlustší = častější transition.
- **Klik na sloupec** = zvýraznění technik EA-6.X, které jsou v dané fázi nejrelevantnější, plus odkaz na příslušný klinický článek.

## Související

- [Diagnostické indikátory](/kompendium/06-klinicke-aplikace/diagnosticke-indikatory/)
- [Diferenciální diagnostika](/kompendium/06-klinicke-aplikace/diferencialni-diagnostika/)
- [Self-report instrumenty](/kompendium/06-klinicke-aplikace/self-report-instrumenty/)
- [Terapeutické přístupy](/kompendium/06-klinicke-aplikace/terapeuticke-pristupy/)
- [Epistemická rekonstrukce](/kompendium/06-klinicke-aplikace/epistemicka-rekonstrukce/)
- [Kolektivní intervence](/kompendium/06-klinicke-aplikace/kolektivni-intervence/)
- [Supervizní rámce](/kompendium/06-klinicke-aplikace/supervizni-ramce/)
- [Vulnerabilní populace](/kompendium/06-klinicke-aplikace/vulnerabilni-populace/)
- [Globální vizualizace EA taxonomie](/kompendium/visualizations/)
- [Glossary: Taxonomie EA](/glossary/taxonomie-ea/)

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [Glossary](/glossary/) | [Philosophy](/philosophy/) | [Developer Portal](/developers/)
