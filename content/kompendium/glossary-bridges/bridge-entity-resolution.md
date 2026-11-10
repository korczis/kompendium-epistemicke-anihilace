+++
title = "Bridge: entity-resolution"
description = "Glossary bridge — propojeni kompendia s glossary entry entity-resolution."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "entity-resolution", "cross-link"]
categories = ["academic", "reference"]

[extra]
related_terms = ["bridge-easm", "bridge-embodied-cognition", "bridge-epistemic-bubble", "bridge-epistemic-pipeline"]
parent = "kompendium-glossary-bridges"
glossary_target = "entity-resolution"
toc = false
+++

# Bridge — Entity Resolution

## Glossary entry

[entity-resolution](@/glossary/entity-resolution.md) — Entity Resolution.

Tento bridge clanek navigacne propojuje kompendium s odpovidajicim glossary heslem a poskytuje rozsireny vyklad konceptualniho ukotveni v kompendialnim korpusu.

## Definice z glossary

Entity Resolution (ER, také record linkage, deduplication) je proces identifikace a slučování záznamů odkazujících na tutéž real-world entitu (osobu, firmu, místo) napříč různými datovými zdroji. V Prismatic DD/OSINT pipeline je ER kritická pro graph-based investigation, sankční screening a beneficial ownership analýzu.

Glossary heslo poskytuje jadro vyklad; tento bridge clanek dale rozviji jeho aplikacni rovinu, vztahy a interpretacni implikace v kontextu Prismatic platformy.

## Pozice v kompendiu

Koncept se v kompendiu vyskytuje napric nasledujicimi clanky a sekcemi:

- **Sekce 04 — DD analytical workflow**: ER jako foundation pro entity-centric analysis
- **Sekce 05 — Algoritmické přístupy**: rule-based, probabilistic, ML-based
- **Sekce 06 — Czech entity matching**: ARES, RZP, sankční seznamy
- **Sekce 07 — Edge cases**: homonyms, aliases, transliteration
- **Per-technique články**: evaluation metrics (precision/recall), Fellegi-Sunter model

Bridge slouzi jako navigacni kotva mezi temito clanky a kanonickou definici v glossary; cross-linking je obousmerny.

## Konceptualni mapa

Vztahy konceptu k souvisejicim entitam v platformovem korpusu:

| Vztah | Cílový koncept | Typ vazby |
|---|---|---|
| technika | Data integration | kategorie |
| využívá | Probabilistic matching, ML | metody |
| zásobuje | Graph DB, knowledge graph | downstream |

Tabulka zachycuje pouze klicove vazby; uplna mapa je dostupna v kompendialnich vizualizacich a graph databazi.

## Klinicke a filosoficke implikace

Entity resolution je epistemicky netriviální: dva záznamy 'Jan Novák' v ARES mohou být tatáž osoba, dvě různé osoby, nebo deliberate impersonation. Filosoficky reflektuje problém personal identity (Locke, Parfit) v digitálním kontextu. Klinicky: false-positive ER může vést k chybnému compliance flag, false-negative skryje sanctioned individual.

Bridge zde slouzi jako vstupni bod do hlubsi analyzy v sekci kompendialnich teoretickych reflexi a klinickych aplikaci.

## Cross-linky

- **Hub kompendia**: [/kompendium/](@/kompendium/_index.md)
- **Glossary entry**: [/glossary/entity-resolution/](@/glossary/entity-resolution.md)
- **Quick reference**: [/kompendium/quick-reference/](@/kompendium/quick-reference/_index.md)
- **Visualizations**: [/kompendium/visualizations/](@/kompendium/visualizations/_index.md)
- **Glossary index**: [/glossary/](@/glossary/_index.md)
- **Bridge hub**: [/kompendium/glossary-bridges/](@/kompendium/glossary-bridges/_index.md)
- **Konceptualni mapa**: [/kompendium/konceptualni-mapa/](@/kompendium/konceptualni-mapa/_index.md)
- **Per-technique katalog**: [/kompendium/techniques/](@/kompendium/techniques/_index.md)
- **Klinicke aplikace**: [/kompendium/klinicke-aplikace/](@/kompendium/06-klinicke-aplikace/_index.md)
- **Teoreticke reflexe**: [/kompendium/teoreticke-reflexe/](@/kompendium/07-teoreticke-reflexe/_index.md)

---

**Created by [Tomas Korcak (korczis)](https://github.com/korczis/kompendium-epistemicke-anihilace)** | [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Entity Resolution (sjednocování entit)](@/glossary/entity-resolution.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
