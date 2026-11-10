+++
title = "Stav knihy"
description = "Přehled rozsahu a provázanosti kompendia: stránky, slova a odkazy podle oddílů, sirotci a nepřeložené stránky."
template = "stav.html"
weight = 902
[taxonomies]
tags = ["kompendium", "informacni-architektura", "metriky", "navigace"]

[extra]
toc = false
+++

Všechna čísla vznikají při sestavení webu ze zdrojového textu (`scripts/build-graph.py`);
nic z nich se nepíše ručně. Kontrola informační architektury (`scripts/check-ia.py`) hlídá,
aby se počty sirotků, tenkých a nepřeložených stránek mohly jen snižovat. Síť odkazů mezi
stránkami si můžete prohlédnout na [Mapě knihy](@/mapa.md).

## Související

- [Mapa knihy](@/mapa.md): síť odkazů mezi stránkami.
- [Obsah kompendia](@/kompendium/_index.md): kapitoly a kolekce.
- [Reference](@/references.md): citovaná literatura.
- [O projektu](@/about.md): odkud kniha pochází a jak se sestavuje.
