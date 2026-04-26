+++
title = "08. Přílohy"
description = "Doplňkové referenční materiály — bibliografie, master rejstřík technik, bilingvní index pojmů, diagnostické nástroje, etický kodex, klasifikační schéma a notační konvence."
weight = 0
sort_by = "weight"
template = "section.html"

[extra]
kompendium = ["08-prilohy"]
prilohy = ["index", "reference", "metadata"]
section_icon = "📎"
toc = true
insert_anchor_links = "right"
parent = "kompendium-08-prilohy"
access_level = "L1-L4"
status = "complete"
+++

# 08. Přílohy — Referenční suite

> **Univerzální referenční vrstva kompendia** — bibliografie, rejstříky, diagnostické nástroje, etický kodex a metodologická dokumentace. Slouží jako lookup-vrstva pro sekce 01–07 i pro per-technique podknihovnu.

Sekce **08. Přílohy** plní roli, kterou v klasické monografii plní zadní obálka, glosář a aparát: **lookup, navigace, ověření, replikace**. Žádný z článků v této sekci není primárně teoretický — všechny tvoří **referenční tkáň** propojující hlavní text kompendia s primární literaturou, klinickou praxí, výzkumnou etikou a širším platformovým ekosystémem.

## Účel sekce

Hlavní text kompendia (sekce 01–07) představuje **taxonomický a teoretický korpus**. Příloh y poskytují:

1. **Verifikovatelnost** — bibliografie a primární literatura, na nichž stojí teoretické nároky.
2. **Navigaci** — master rejstřík všech technik EA-X.Y.Z s jednořádkovými popisky.
3. **Bilingvnost** — index pojmů česky/anglicky pro mezinárodní výzkumnou kompatibilitu.
4. **Klinickou aplikovatelnost** — diagnostické dotazníky a nástroje adaptované pro EA výzkum.
5. **Etickou kotvu** — kodex výzkumníka EA pro IRB a institucionální přezkum.
6. **Metodologickou transparentnost** — explicitní popis klasifikačního schématu a notace.

## Obsah sekce

| # | Článek | Cílový čtenář | Délka |
|---|--------|---------------|-------|
| 1 | [Bibliografie a primární literatura](/kompendium/08-prilohy/bibliografie/) | Výzkumník, recenzent | ~2000 slov |
| 2 | [Kompletní rejstřík technik (master index)](/kompendium/08-prilohy/rejstrik-technik/) | Klinik, navigátor | ~2500 slov |
| 3 | [Index pojmů (CS-EN bilingual)](/kompendium/08-prilohy/index-pojmu/) | Překladatel, mezinárodní výzkumník | ~2000 slov |
| 4 | [Diagnostické dotazníky a nástroje](/kompendium/08-prilohy/diagnosticke-nastroje/) | Klinický psycholog | ~2200 slov |
| 5 | [Etický kodex výzkumníka EA](/kompendium/08-prilohy/eticky-kodex/) | IRB, etický komitét | ~1500 slov |
| 6 | [Klasifikační schéma a taxonomie — meta-úroveň](/kompendium/08-prilohy/klasifikace/) | Metodolog, taxonom | ~1800 slov |
| 7 | [Zkratky a notace](/kompendium/08-prilohy/zkratky/) | Univerzální | ~1000 slov |

## Struktura referenční vrstvy

Přílohy jsou organizovány podle **funkční vrstvy**, nikoliv podle obsahu:

```
┌─────────────────────────────────────────────┐
│  HLAVNÍ TEXT (sekce 01–07)                  │
│  ├── 01 Předmluva                           │
│  ├── 02 Úvod                                │
│  ├── 03 Základní kategorie                  │
│  ├── 04 Terminální protokoly                │
│  ├── 05 Ultramární techniky                 │
│  ├── 06 Klinické aplikace                   │
│  └── 07 Teoretické reflexe                  │
└─────────────────────────────────────────────┘
              │  (cross-reference)
              ▼
┌─────────────────────────────────────────────┐
│  PŘÍLOHY (sekce 08)                         │
│  ├── Bibliografie       → verifikovatelnost │
│  ├── Rejstřík technik   → navigace          │
│  ├── Index pojmů        → bilingvnost       │
│  ├── Diagnostika        → klinická aplikace │
│  ├── Etický kodex       → IRB / přezkum     │
│  ├── Klasifikace        → metodologie       │
│  └── Zkratky            → notační konvence  │
└─────────────────────────────────────────────┘
              │  (cross-reference)
              ▼
┌─────────────────────────────────────────────┐
│  PER-TECHNIQUE PODKNIHOVNA                  │
│  /kompendium/techniques/ea-X.Y.Z-*          │
└─────────────────────────────────────────────┘
```

## Vztah k platformě Prismatic

Přílohy nejsou izolované — jsou **operativně propojeny** s běžícími systémy:

- **[Glossary](/glossary/)** → [Index pojmů](/kompendium/08-prilohy/index-pojmu/) deriváuje termíny z hlavního platformového glosáře a recipročně do něj přispívá.
- **[Decision Engine](/hub/dd/decisions/)** → [Diagnostické nástroje](/kompendium/08-prilohy/diagnosticke-nastroje/) poskytují signály pro kalibraci důvěry.
- **[NABLA Infinity](/glossary/nabla-infinity/)** → [Klasifikační schéma](/kompendium/08-prilohy/klasifikace/) mapuje techniky na úrovně L0–L13.
- **[Color Teams](/glossary/color-teams/)** → [Etický kodex](/kompendium/08-prilohy/eticky-kodex/) definuje hranice Red Team adversariální simulace.
- **[3NL architektura](/glossary/three-nested-loops/)** → [Zkratky a notace](/kompendium/08-prilohy/zkratky/) sjednocuje doctrine zkratky napříč platformou.

## Konvence používání

### Kdy číst přílohy

- **Před prvním čtením kompendia** — Zkratky, Klasifikace, Etický kodex (orientace).
- **Při studiu konkrétní techniky** — Rejstřík technik, Index pojmů (lookup).
- **Před výzkumnou aplikací** — Etický kodex, Diagnostické nástroje (operacionalizace).
- **Při akademickém citování** — Bibliografie, Klasifikace (verifikace).

### Verzování a aktualizace

Příloh y sledují **verzi celého kompendia**. Změny v hlavním textu (nové techniky, revize taxonomie, posuny v notaci) vyvolají odpovídající aktualizaci v rejstřících a indexech. Bibliografie roste inkrementálně; etický kodex je verzován samostatně podle přezkumu IRB.

## Související sekce

- **Začněte zde** → [Předmluva](/kompendium/01-predmluva/) → [Úvod](/kompendium/02-uvod/)
- **Hlavní taxonomie** → [Základní kategorie](/kompendium/03-zakladni-kategorie/) → [Terminální protokoly](/kompendium/04-terminalni-protokoly/) → [Ultramární techniky](/kompendium/05-ultramari-techniky/)
- **Aplikace** → [Klinické aplikace](/kompendium/06-klinicke-aplikace/) → [Teoretické reflexe](/kompendium/07-teoreticke-reflexe/)
- **Per-technique** → [Techniques index](/kompendium/techniques/)
- **Platformový kontext** → [Hub kompendia](/kompendium/) → [Glossary](/glossary/) → [Philosophy](/philosophy/)


## ⚡ Kritický krok

**Tato příloha je referenční nástroj** — není k četbě od začátku do konce.
Místo lineární četby:

1. Identifikuj **konkrétní termín / techniku / nástroj**, který právě potřebuješ
2. Použij vyhledávání (Cmd+F / Ctrl+F) v této stránce
3. Pokud nenajdeš, zkontroluj [glossary](/glossary/) a [rejstřík technik](/kompendium/08-prilohy/rejstrik-technik/)

> **Mandatorní akce**: použití přílohy bez konkrétní otázky je obvykle
> formou prokrastinace. Definuj si nejprve, **co hledáš**, teprve pak
> otevři přílohu.

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Hub kompendia](/kompendium/) | [Techniques](/kompendium/techniques/) | [Glossary](/glossary/) | [Philosophy](/philosophy/) | [Developer Portal](/developers/)
