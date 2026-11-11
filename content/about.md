+++
title = "O projektu"
description = "Kdo kompendium napsal, odkud tato edice pochází, jak je sestavena a pod jakou licencí ji lze používat."
weight = 910

[taxonomies]
tags = ["kompendium"]

[extra]
toc = true
+++

## Autor

Tomas Korcak ([korczis](https://github.com/korczis)). Kompendium vzniklo v letech 2025–2026 jako
součást znalostní báze Prismatic Platform a od listopadu 2026 vychází samostatně v tomto
repozitáři.

## Účel a hranice

Kompendium je **defenzivní taxonomie**. Popisuje mechanismy epistemické a kognitivní manipulace
na úrovni struktury, aby je odborníci dokázali rozpoznat, předcházet jim a léčit jejich následky.
Není to operativní manuál, diagnostický nástroj ani náhrada odborné péče. Kdo potřebuje pomoc,
obrací se na odborníka nebo na krizovou linku.

Etický rámec, bezpečnostní klasifikaci a doporučený způsob čtení popisuje
[předmluva](@/kompendium/01-predmluva/_index.md), zejména
[etické aspekty](@/kompendium/01-predmluva/eticke-aspekty.md).

## Odkud tato edice pochází

Kniha rostla od března 2025 v několika liniích. Všechny jsou v repozitáři **s původní
historií** commitů:

| Období | Linie | Co obsahovala | Kde je teď |
|---|---|---|---|
| 2025-03 | gist „Epistemická a [kognitivní anihilace](@/glossary/kognitivni-anihilace.md): kompletní taxonomie“, gist „[Hypersyntaktická anihilace](@/glossary/hypersyntakticka-anihilace.md)“ | obsah, rejstříky, výkladový slovník | `archive/gists/` |
| 2025-03 až 05 | prismatic-legacy | rané texty, rejstříky, slovníky, blog | `archive/prismatic-legacy/` |
| 2025-07 | gist „Absolutní [epistemická disoluční komora](@/glossary/epistemicka-disolucni-komora.md)“, korczis/prismatic | první struktura o osmi oddílech | `archive/gists/`, `archive/prismatic/` |
| 2025-09 až 2026-08 | Prismatic Platform, `docs/kompendium/` | strukturovaná verze 29 souborů | `archive/docs-kompendium/` |
| 2026-01 | psychonautic | znalostní báze o epistemické anihilaci | `archive/psychonautic/` |
| 2026-04 až dnes | Prismatic Platform, `apps/prismatic_web/priv/content/kompendium/` | plná kniha, 1587 souborů | `content/kompendium/` (zdroj tohoto webu) |
| | glosář a filozofie Prismatic Platform | hesla, na která kniha odkazuje | `content/glossary/`, `content/philosophy/` |

Přehled linií a postup hledání popisuje
[`archive/README.md`](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/archive/README.md).

Odkazy na stránky, které do knihy nepatří (architektura platformy a dřívější veřejné vydání knihy),
vedou na původní veřejný web
[prismatic-reality-com.github.io/prismatic-promo](https://prismatic-reality-com.github.io/prismatic-promo/).
Odkaz na vývojářský portál byl z patiček odstraněn (rozhodnutí vlastníka, ADR 0007). Kniha už
nikde neodkazuje na interní aplikaci platformy.

## Jak je web sestaven

[Zola](https://www.getzola.org/) generuje statický web z Markdownu, vzhled stojí na Flowbite
(Tailwind CSS), interaktivní vizualizace používají Chart.js, p5.js a three.js, diagramy Mermaid.
Vše je hostováno na GitHub Pages bez externích CDN. Repozitář je pod dohledem
[Majordomus](https://majordomus.dev). Podrobnosti jsou v
[README](https://github.com/korczis/kompendium-epistemicke-anihilace#readme) a na
[wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki).

## Licence

Celý repozitář – text, grafika, archiv i kód – je pod licencí
[General Honest License (GHL) v1.0](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE)
autora Tomáše Korčáka. Kanonické znění je v repozitáři
[korczis/prismatic, `docs/ghl`](https://github.com/korczis/prismatic/tree/master/docs/ghl).
Knihovny třetích stran si ponechávají vlastní licence
([NOTICE.md](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/NOTICE.md)).

## Opravy a podněty

[GitHub Issues](https://github.com/korczis/kompendium-epistemicke-anihilace/issues).
