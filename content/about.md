+++
title = "O projektu"
description = "Kdo kompendium napsal, odkud tato edice pochází, jak je sestavena a pod jakou licencí ji lze používat."
weight = 910
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

| Zdroj | Co obsahoval | Kde je teď |
|---|---|---|
| Prismatic Platform, `apps/prismatic_web/priv/content/kompendium/` | plná kniha, 1587 souborů, 2026 | `content/kompendium/`, s historií commitů |
| Prismatic Platform, `docs/kompendium/` | první strukturovaná verze, 2025 | `archive/docs-kompendium/` |
| prismatic-legacy, `unsorted/kompendium`, `blog/content/kompendium`, `blog/content/anihilace` | rané texty, rejstříky, slovníky, 2025 | `archive/legacy-2025/` |
| gist „Epistemická a kognitivní anihilace: kompletní taxonomie“ a dva související gisty | obsah, rejstříky, výkladový slovník, 2025 | `archive/gists/` |
| Glosář a filozofie Prismatic Platform | hesla, na která kniha odkazuje | `content/glossary/`, `content/philosophy/` |

Odkazy na stránky, které do knihy nepatří (vývojářský portál, akademie, architektura platformy),
vedou na původní veřejný web
[prismatic-reality-com.github.io/prismatic-promo](https://prismatic-reality-com.github.io/prismatic-promo/).
Odkazy na interní aplikaci platformy jsou ponechány jako text se značkou.

## Jak je web sestaven

[Zola](https://www.getzola.org/) generuje statický web z Markdownu, vzhled stojí na Flowbite
(Tailwind CSS), interaktivní vizualizace používají Chart.js, p5.js a three.js, diagramy Mermaid.
Vše je hostováno na GitHub Pages bez externích CDN. Repozitář je pod dohledem
[Majordomus](https://majordomus.dev). Podrobnosti jsou v
[README](https://github.com/korczis/kompendium-epistemicke-anihilace#readme) a na
[wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki).

## Licence

Text a grafika: [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.cs).
Uveďte autora, nepoužívejte komerčně a odvozená díla šiřte pod stejnou licencí. Kód (šablony,
skripty, workflow): MIT.

## Opravy a podněty

[GitHub Issues](https://github.com/korczis/kompendium-epistemicke-anihilace/issues).
