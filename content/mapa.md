+++
title = "Mapa knihy"
description = "Interaktivní graf všech stránek kompendia a odkazů mezi nimi: oddíly, štítky a okolí každé stránky."
template = "mapa.html"
weight = 901

[taxonomies]
tags = ["kompendium", "informacni-architektura", "graf", "navigace"]

[extra]
toc = false
+++

Mapa ukazuje knihu jako síť: uzly jsou stránky, čáry jsou odkazy v textu. Výchozí pohled
shrnuje oddíly a sílu vazeb mezi nimi; klepnutím na oddíl zobrazíte jeho stránky, výběrem
štítku stránky jednoho tématu a hledáním okolí konkrétní stránky. Graf se generuje při každém
sestavení webu z odkazů v textu, takže odpovídá aktuální podobě knihy.

Přehled rozsahu a toho, co v knize ještě chybí, je na stránce [Stav knihy](@/stav.md).

## Související

- [Stav knihy](@/stav.md): rozsah a provázanost knihy v číslech a grafech.
- [Případy × techniky](@/matice.md): které techniky se opakují napříč kazuistikami a historickými
  případy.
- [Obsah kompendia](@/kompendium/_index.md): kapitoly a kolekce jako strom.
- [Glosář](@/glossary/_index.md): pojmy, na které kniha odkazuje nejčastěji.
- [Galerie](@/galerie.md): generativní grafika k motivům knihy.
