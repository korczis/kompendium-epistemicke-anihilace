+++
title = "Vizualizace pro Sekci 03 — Postup technik EA-1 fázemi"
description = "Interaktivní vizualizace specifická pro sekci 03: postup 13 EA-1 technik pěti fázemi (etablování → exploitace → konsolidace → eskalace → intervence) jako Chart.js scatter graf s ko-okurenčními…"
weight = 99

[taxonomies]
tags = ["kompendium", "vizualizace", "interaktivni", "chartjs", "ea-1", "akademicka-manipulace"]
categories = ["academic", "tools"]

[extra]
related_terms = ["somaticke-vektory", "tom-exploitation", "scenar-h"]
parent = "kompendium-03-zakladni-kategorie"
section_icon = "📊"
toc = false
+++

# Postup EA-1 technik pěti fázemi

Tato sekce-specifická vizualizace ukazuje, jak [13 technik akademické manipulace EA-1.\*](@/kompendium/03-zakladni-kategorie/kapitola-1.md) postupuje **pěti operačními fázemi** typického manipulačního cyklu:

1. **Etablování** — budování důvěry a autority, framing kontextu
2. **Exploitace** — aktivní použití technik na cílový subjekt
3. **Konsolidace** — upevnění získaného epistemického vlivu
4. **Eskalace** — prohloubení manipulace, přechod k závažnějším formám
5. **Intervence** — bod, kde detekce a neutralizace mají nejvyšší účinnost

Body grafu reprezentují techniky umístěné podle fáze (X) a typické závažnosti (Y, 1–5). Hrany ukazují **typické ko-okurenční vzorce** — které techniky operátoři často kombinují v rámci jedné fáze nebo přechodu mezi fázemi.

<canvas id="section-03-progression" width="800" height="500"></canvas>
<div id="progression-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
<script src="/kompendium-epistemicke-anihilace/js/kompendium/section-03-progression.js"></script>

## Jak číst graf

- **Klik na bod** — zobrazí název techniky, fázi, závažnost a seznam typických ko-okurenčních partnerů.
- **Barva** — kóduje fázi: modrá (etablování), fialová (exploitace), oranžová (konsolidace), červená (eskalace), zelená (intervence).
- **Šedé čáry** — ko-okurence v rámci stejné fáze nebo bezprostředního přechodu.

## Související

- [3.1 Akademické techniky (EA-1.1.\* až EA-1.5.\*)](@/kompendium/03-zakladni-kategorie/kapitola-1.md)
- [3.2 Scénáře epistemické delegitimizace](@/kompendium/03-zakladni-kategorie/kapitola-2.md)
- [3.3 Pokročilá edukativní implementace](@/kompendium/03-zakladni-kategorie/kapitola-3.md)
- [Globální vizualizace EA taxonomie](@/kompendium/visualizations/_index.md)
- [Techniques index — per-technique články](@/kompendium/techniques/_index.md)
- [Glossary: Taxonomie EA](@/glossary/taxonomie-ea.md)
- [Glossary: Epistemická anihilace](@/glossary/epistemicka-anihilace.md)

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [Glossary](@/glossary/_index.md) | [Philosophy](@/philosophy/_index.md) | [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/)
