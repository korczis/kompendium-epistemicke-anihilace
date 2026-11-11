---
schema: knowledge/v1
id: nlp-catalogue-provenance
kind: knowledge
class: lesson
title: "Katalog NLP vzorců je kanonický katalog z primární a kritické literatury, ne přepis jedné knihy"
description: "Když se pracuje s rodinami, hesly nebo zdroji sekce nlp-vzorce, nebo když se nabízí kniha jako zdroj obsahu."
status: verified
epistemics: observed
date: 2026-11-10
tags:
  - content
  - nlp
  - sources
provenance:
  origin: authored
---

# Katalog NLP vzorců je kanonický katalog z primární a kritické literatury, ne přepis jedné knihy

Autor zadal 2026-11-10 jednu stránku na každý vzorec knihy Vaknin 2008 (*The Big Book of NLP
Techniques*). Kniha nebyla legálně dostupná; dostupné byly jen neoprávněné kopie, a ty se
nepoužily ani jako zdroj obsahu, ani jako zdroj názvů či klasifikace. Autor proto rozhodl
o kanonickém katalogu (rozhodnutí v `majordomus decision`): 414 hesel ve 22 rodinách,
sestavených z primární literatury NLP, z jejích kořenů (Bateson, Satirová, Erickson, obecná
sémantika) a z kritického výzkumu.

Co z toho plyne pro další práci:

- Vazba každého hesla na Vaknina je `inferred` a zůstane tak, dokud ji někdo neověří
  v legálně dostupném výtisku (pak `observed`). Stránky hesel Vaknina necitují.
- Texty jsou původní výklad; žádná příručka se nepřepisuje ani neparafrázuje zblízka.
- Pisatelé (agenti) systematicky zmírňovali přiřazení, kterými si nebyli jistí: tvrzení bez
  jistého zdroje stojí v textu obecně a bez citace, místo aby se zdroj dotvořil. Jejich
  hlášení uváděla konkrétní přiřazení „ke kontrole“; ta jsou první na řadě při recenzi.
- Bibliografie `data/sources.toml` je uzavřená: dílo, které v ní není (Ashby, Wegner,
  Mind-Lines, Erickson's papers), se zmiňuje jen v textu bez citace.
- Rozdělení rodin na části (`<rodina>.<část>.toml`) a přepínač `--part` umožnily psát
  paralelně bez kolizí; generátor zapisuje jen soubory dané části.
