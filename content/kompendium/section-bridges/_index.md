+++
title = "Section Bridges — propojení sekcí kompendia"
description = "Bridge články propojující jednotlivé sekce kompendia (01–08, techniques, case studies, quick reference, visualizations, glossary bridges, platform)."
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

{% set l = load_data(path="static/data/listings/section-bridges.json") %}

## Seznam mostů

Sekce má {{ l.count }} mostů v pořadí sekcí; název každého mostu říká, odkud a kam vede.

| Most | Typ |
|---|---|
{% for t in l.items %}| [{{ t.name }}](@/{{ t.path }}) | {{ t.listing_note | default(value="") }} |
{% endfor %}

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
