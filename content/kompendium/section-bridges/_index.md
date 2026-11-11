+++
title = "Section Bridges — propojení sekcí kompendia"
description = "30 bridge článků propojujících jednotlivé sekce kompendia (01–08, techniques, case studies, quick reference, visualizations, glossary bridges, platform)."
weight = 97
sort_by = "weight"
template = "section.html"

[extra]
tags = ["kompendium", "section-bridges", "navigace", "cross-link"]
categories = ["academic", "reference"]
section_icon = "🔗"
toc = true
+++

# Section Bridges

**Section Bridge** = článek (400–600 slov) propojující **dvě sekce kompendia** na úrovni celých kapitol — narozdíl od glossary bridges, které propojují jednotlivé EA jednotky s glossary entries. Section bridges fungují jako **navigační infrastruktura druhého řádu** — pomáhají čtenáři pochopit, **jak sekce do sebe zapadají**, kde jsou vzájemné závislosti a v jakém pořadí číst.

## Účel section bridges

Kompendium není lineární text. Některé sekce mají normativní povahu (Předmluva, Terminální protokoly), jiné deskriptivní (Základní kategorie), jiné aplikační (Klinika, Case Studies), jiné meta-reflektivní (Teoretické reflexe). **Section bridges popisují, jak tyto vrstvy spolupracují**:

- **Etické vrstvy** (sekce 01) jsou prerekvizita pro operativní vrstvy (sekce 04, 05).
- **Kategoriální vrstva** (sekce 03) napájí všechny aplikační sekce (04, 05, 06).
- **Klinika** (sekce 06) validuje teorii a generuje zpětnou vazbu pro revizi.
- **Teoretické reflexe** (sekce 07) reflektují všechny ostatní sekce.
- **Přílohy** (sekce 08) jsou operativní artefakty pro přímé použití.
- **Techniques / Case Studies / Quick Reference / Visualizations / Glossary Bridges** jsou **transverzální vrstvy** — netřídí se podle sekce, ale podle funkce.

Section bridges drží **sémantickou síť** mezi sekcemi tak, aby čtenář při čtení sekce X věděl, kterou sekci Y aktuálně potřebuje a v jakém pořadí.

## Struktura každého bridge

Každý section bridge článek obsahuje:

| Sekce | Obsah | Délka |
|---|---|---|
| 1. Účel bridge | Proč propojovat tyto dvě sekce | ~80 slov |
| 2. Klíčová témata propojení | 5–8 specifických témat napříč sekcemi | ~150 slov |
| 3. Doporučená čtenářská trajektorie | Pořadí čtení a iterace | ~100 slov |
| 4. Společné cross-linky | Tabulka konkrétních cross-link bodů | ~100 slov |
| 5. Specifické techniky / koncepty | Nejrelevantnější items | ~80 slov |
| 6. Související | 8–12 odkazů napříč sekcemi | — |

## Seznam 30 bridges

### A. Vazby z Předmluvy a Úvodu (5)

| Bridge | Z → Do | Typ |
|---|---|---|
| [01 → 02](@/kompendium/section-bridges/bridge-01-to-02-predmluva-uvod.md) | Předmluva → Úvod | etika ↔ definice |
| [01 → 04](@/kompendium/section-bridges/bridge-01-to-04-eticky-ramec-protokoly.md) | Etický rámec → Terminální protokoly | etika ↔ operativa |
| [01 → 05](@/kompendium/section-bridges/bridge-01-to-05-eticky-ramec-ultramari.md) | Etický rámec → Ultramari | etika ↔ intenzivní praxe |
| [02 → 03](@/kompendium/section-bridges/bridge-02-to-03-uvod-zakladni-kategorie.md) | Úvod → Základní kategorie | definice ↔ taxonomie |
| [02 → 07](@/kompendium/section-bridges/bridge-02-to-07-uvod-teoreticke.md) | Úvod → Teoretické reflexe | definice ↔ kritika |

### B. Vazby z Základních kategorií (5)

| Bridge | Z → Do | Typ |
|---|---|---|
| [03 → 04](@/kompendium/section-bridges/bridge-03-to-04-zakladni-terminalni.md) | Kategorie → Terminální | typologie ↔ exit |
| [03 → 05](@/kompendium/section-bridges/bridge-03-to-05-zakladni-ultramari.md) | Kategorie → Ultramari | typologie ↔ ultramari |
| [03 → 06](@/kompendium/section-bridges/bridge-03-to-06-techniky-klinika.md) | Techniky → Klinika | abstrakce ↔ aplikace |
| [03 → 07](@/kompendium/section-bridges/bridge-03-to-07-techniky-teorie.md) | Techniky → Teorie | praxe ↔ kritika |
| (k 02 viz výše) | | |

### C. Vazby z Terminálních protokolů a Ultramari (5)

| Bridge | Z → Do | Typ |
|---|---|---|
| [04 → 05](@/kompendium/section-bridges/bridge-04-to-05-terminalni-ultramari.md) | Terminální → Ultramari | bezpečnostní síť ↔ ultramari |
| [04 → 06](@/kompendium/section-bridges/bridge-04-to-06-terminalni-klinika.md) | Terminální → Klinika | protokol ↔ SOP |
| [04 → 07](@/kompendium/section-bridges/bridge-04-to-07-terminalni-teorie.md) | Terminální → Teorie | protokol ↔ kritika |
| [05 → 06](@/kompendium/section-bridges/bridge-05-to-06-ultramari-klinika.md) | Ultramari → Klinika | technika ↔ klinický vzor |
| [05 → 07](@/kompendium/section-bridges/bridge-05-to-07-ultramari-teorie.md) | Ultramari → Teorie | intenzita ↔ filozofie |

### D. Vazby do Příloh a Teorie (3)

| Bridge | Z → Do | Typ |
|---|---|---|
| [05 → 08](@/kompendium/section-bridges/bridge-05-to-08-ultramari-prilohy.md) | Ultramari → Přílohy | technika ↔ operativní artefakt |
| [06 → 07](@/kompendium/section-bridges/bridge-06-to-07-klinika-teorie.md) | Klinika → Teorie | praxe ↔ reflexe |
| [06 → 08](@/kompendium/section-bridges/bridge-06-to-08-klinika-prilohy.md) | Klinika → Přílohy | klinika ↔ klinický balíček |
| [07 → 08](@/kompendium/section-bridges/bridge-07-to-08-teorie-prilohy.md) | Teorie → Přílohy | reflexe ↔ referenční aparát |

### E. Transverzální vrstvy (8)

| Bridge | Z → Do | Typ |
|---|---|---|
| [Techniques → Case Studies](@/kompendium/section-bridges/bridge-techniques-to-case-studies.md) | preskripce ↔ narativa |
| [Techniques → Quick Reference](@/kompendium/section-bridges/bridge-techniques-to-quick-reference.md) | hluboké ↔ lookup |
| [Techniques → Glossary](@/kompendium/section-bridges/bridge-techniques-to-glossary.md) | technika ↔ definice |
| [Techniques → Visualizations](@/kompendium/section-bridges/bridge-techniques-to-visualizations.md) | text ↔ vizualizace |
| [Case Studies → Klinika](@/kompendium/section-bridges/bridge-case-studies-to-clinical.md) | narativa ↔ systém |
| [Case Studies → Glossary Bridges](@/kompendium/section-bridges/bridge-case-studies-to-glossary-bridges.md) | terminologie ↔ kotvy |
| [Quick Reference → Glossary](@/kompendium/section-bridges/bridge-quick-reference-to-glossary.md) | lookup ↔ definice |
| [Visualizations → Techniques](@/kompendium/section-bridges/bridge-visualizations-to-techniques.md) | reference ↔ technika |
| [Visualizations → Klinika](@/kompendium/section-bridges/bridge-visualizations-to-clinical.md) | vizualizace ↔ klinický artefakt |
| [Glossary Bridges → Filozofie](@/kompendium/section-bridges/bridge-glossary-bridges-to-philosophy.md) | naming ↔ power act |

## Vztah ke glossary bridges

| Glossary bridges | Section bridges |
|---|---|
| Propojují **jednotku ↔ glossary entry** | Propojují **sekce ↔ sekce** |
| Mikro-vrstva (200–400 slov) | Mezo-vrstva (400–600 slov) |
| Definiční ukotvení | Strukturální navigace |
| Reciprocita: pojem ↔ definice | Reciprocita: kapitola ↔ kapitola |

Obě vrstvy jsou **komplementární** — glossary bridges drží přesnost na úrovni pojmu, section bridges drží orientaci na úrovni knihy.

## Doporučená čtenářská strategie

1. **První čtení kompendia** — sekce 01 → 02 → 03, postupně sekvenčně. Section bridges používejte jako orientační mapy, ne jako primární obsah.
2. **Praktické čtení** — section bridges D a E vám pomohou skočit z aplikace do reference a zpět.
3. **Hluboké studium** — section bridges F propojí kompendium s platformou.
4. **Reflexe** — sekce 07 v kombinaci s glossary bridges F (filozofie) a section bridges D dává kompletní meta-vrstvu.

## Údržba section bridges

Každý section bridge má evidence-link na obě propojené sekce; pokud se některá sekce změní, příslušný bridge se reviduje.
