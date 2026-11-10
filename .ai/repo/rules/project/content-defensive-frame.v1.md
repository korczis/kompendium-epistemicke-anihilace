---
id: project.content-defensive-frame
version: 1
kind: rule
title: Obsah drží obranný rámec knihy
description: Každá stránka popisuje fenomén tak, aby šel rozpoznat, předejít mu a léčit ho; nikdy jako návod k manipulaci.
statement: Popisuj mechanismus manipulace jen na úrovni struktury, vždy spolu s detekčními znaky, klinickým nebo právním rámcem, obranou a zotavením, a nikdy nepiš operační návod, jak někoho manipulovat, ovládat nebo poškodit.
status: active
class: blocking
depends_on: []
tags: [content, ethics, safety]
---

# Rationale

Kompendium je defenzivní taxonomie pro kvalifikované čtenáře (psychiatry, psychology,
terapeuty, vyšetřovatele, právníky, výzkumníky). Předmluva
(`content/kompendium/01-predmluva/`) stanoví etický rámec a bezpečnostní klasifikaci. Text,
který by fungoval jako návod, by knihu obrátil proti lidem, které má chránit, a ohrozil by
její veřejné vydání.

# Required behaviour

- Mechanismus je popsán jako vzorec, který pozorovatel pozná: co je vidět, jak to probíhá,
  co to s člověkem dělá. Ne jako postup, který by šlo provést.
- Každá stránka o technice nebo fenoménu má vedle mechanismu detekční znaky, odlišení od
  neškodných jevů a od klinických stavů, obranu a cestu k zotavení.
- Žádné skripty, kroky „jak na to“, rady k výběru cíle, k zesílení účinku nebo k zakrytí stop.
- Kazuistiky jsou anonymizované kompozity; žádný detail nesmí vést k identifikaci osoby.

# Failure behaviour

Text, který porušuje pravidlo, je nález recenze třídy `blocking`: přepíše se nebo odstraní
dřív, než se sloučí do `main`.

# Verification

Recenzent čte každou změněnou stránku proti tomuto pravidlu; u rozsáhlých vln aspoň vzorek
z každého adresáře a každou stránku z `techniques/`, `04-terminalni-protokoly/` a
`05-ultramari-techniky/`.
