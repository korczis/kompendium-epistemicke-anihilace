+++
title = "Bridge: Základní kategorie → Terminální protokoly"
description = "Bridge článek propojující 03 — Základní kategorie s 04 — Terminální protokoly."
weight = 15

[taxonomies]
tags = ["kompendium", "section-bridge", "navigace"]
categories = ["academic", "reference"]

[extra]
related_terms = ["bridge-02-to-03-uvod-zakladni-kategorie", "bridge-02-to-07-uvod-teoreticke", "bridge-03-to-05-zakladni-ultramari", "bridge-03-to-06-techniky-klinika"]
parent = "kompendium-section-bridges"
toc = false
+++

# Bridge: Základní kategorie → Terminální protokoly

> **Z:** 03 — Základní kategorie → **Do:** 04 — Terminální protokoly
> **Typ:** Inter-section bridge (sekce-na-sekci)
> **Reciprocita:** Bidirektionální navigace mezi sekcemi.

## 1. Účel bridge

Základní kategorie poskytují **typologii**; Terminální protokoly aplikují typologii na **rozhodování o ukončení**. Bridge je most od „co to je“ k „jak to bezpečně ukončit“. Bez kategorií jsou terminální protokoly slepými skripty; bez terminálních protokolů jsou kategorie akademickou klasifikací.

## 2. Klíčová témata propojení

- **Diagnostické kategorie → exit kritéria** — typ stavu určuje typ ukončení.
- **Typologie subjektů → personalizovaný exit** — kdo subjekt je, určuje, jak končí.
- **Hraniční kategorie → eskalace** — okrajové případy spouštějí specifické protokoly.
- **Subkategorie → granular kontraindikace** — jemnější třídění = přesnější varování.
- **Kategoriální readiness → vstupní filtr** — připravenost je vázaná na kategorii.
- **Hranice kategorií → meta-protokol** — co dělat mimo kategorie.
- **Glossary anchors → terminologická konzistence v protokolech** — jednotný jazyk.

## 3. Doporučená čtenářská trajektorie

Pořadí čtení: **03 → 04**. Pokud čtete protokoly bez znalosti kategorií, nepoznáte, kdy aplikovat který protokol. Pokud čtete kategorie bez protokolů, nemáte praktický výstup. Doporučená iterace: nejprve celou sekci 03 (kategorie), pak vybrané kapitoly sekce 04 podle relevantní kategorie.

## 4. Společné cross-linky

| Z 03 — Základní kategorie | Do 04 — Terminální protokoly |
|---|---|
| 03.1 — Hlavní kategorie | 04.1 — Vstupní filtr |
| 03.2 — Subkategorie | 04.4 — Granular kontraindikace |
| 03.5 — Hranice kategorií | 04.7 — Exit za hranicí |
| 03.6 — Slovníček | 04.8 — Terminologie protokolů |

## 5. Specifické techniky / koncepty

Klíčové koncepty: **diagnostická matice**, **personalizovaný exit**, **eskalační kritéria**, **granular kontraindikace**, **kategoriální readiness**. Mapují se na platformové DecisionEngine, SafetyGuard a CalibrationLoop.

## 6. Související

- [03 — Základní kategorie](@/kompendium/03-zakladni-kategorie/_index.md)
- [04 — Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md)
- [Glossary: Kategorie](@/kompendium/glossary-bridges/_index.md)
- [Quick Reference: Exit](@/kompendium/quick-reference/_index.md)
- [Klinika: Terminální](@/kompendium/06-klinicke-aplikace/_index.md)
- [Visualizations: Decision tree](@/kompendium/visualizations/_index.md)
- [Case studies](@/kompendium/case-studies/_index.md)
- [DecisionEngine](@/glossary/_index.md)

## 8. Praktická matice: kategorie × terminální protokol

Bridge funguje jako **lookup matice**: pro každou kategorii ze sekce 03 existuje minimálně jeden terminální protokol ze sekce 04. Pokud kategorie nemá protokol, je to **gap**, který musí být dokumentován jako technical debt. Stejně tak: pokud protokol není připojen k žádné kategorii, je to **dangling protocol** — vyžaduje revizi nebo odstranění. Tato matice je explicitně udržovaná v platform DecisionEngine ontology a synchronizovaná s kompendium glossary.

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)
