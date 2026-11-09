+++
title = "EA × OSINT: Sankční seznamy a Atribuční Bias"
description = "OFAC, EU, UN sankční seznamy — politická konstrukce 'pravdy'"
weight = 40

[taxonomies]
tags = ["kompendium", "cross-domain", "osint"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["3-ea-osint-justice-cz-screening", "30-ea-compliance-regulatory-capture-detection", "5-ea-osint-social-media-manipulation", "6-ea-osint-bot-detection"]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × OSINT: Sankční seznamy a Atribuční Bias

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **OSINT**.

## Doména

**OSINT** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

Sankční seznamy nejsou neutrální fakt — jsou produktem geopolitické narativní války. EA odhaluje atribuční bias a mezery v pokrytí.

EA framework přináší do osint domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje osint pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- Cross-list comparison (entity na OFAC ale ne EU = jurisdikční divergence)
- Temporal entry analýza (zápis koreloval s politickou událostí)
- Sektoral coverage gap (proč jsou sankce na ropu ale ne na minerals?)
- Proxy-entity detection (sanctioned UBO skrz 3 vrstvy)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- Multi-jurisdiction screening (OFAC + EU + UK + UN + CZ FAÚ)
- Geopolitical-context tagging každé sankce
- Proxy-graph traversal (depth ≥5 ownership chains)
- Time-decay analýza (staré sankce = nižší relevance bez recent enforcement)

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

Czech entity flagged on EU list ale clean na OFAC — důvod: francouzský geopolitický push, US neutral

### Scénář 2

Entity 'clean' přímo, ale 67 % majitelů přes 4-vrstvý kypros-malta-bvi UBO chain


Tyto scénáře nejsou hypotetické — odpovídají skutečným patternům, které platforma detekovala v produkčních deploymentech. Detaily jsou redacted/composited pro privacy a security reasons.

## Cross-linky

- [Kompendium — Úvod](@/kompendium/02-uvod/_index.md)
- [Základní kategorie EA](@/kompendium/03-zakladni-kategorie/_index.md)
- [Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md)
- [Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md)
- [Detection signatures](@/kompendium/detection-signatures/_index.md)
- [Recovery protocols](@/kompendium/recovery-protocols/_index.md)
- [Glossary bridges](@/kompendium/glossary-bridges/_index.md)
- [Educational scenarios](@/kompendium/educational-scenarios/_index.md)
- [Case studies](@/kompendium/case-studies/_index.md)
- [Quick reference](@/kompendium/quick-reference/_index.md)


## Connect

- **Komentáře a otázky**: [GitHub Discussions](https://github.com/korczis/kompendium-epistemicke-anihilace/discussions)
- **Bug reporty**: [GitLab Issues](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- **Email**: [GitHub Issues](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- **LinkedIn**: [korczis](https://linkedin.com/in/korczis)

---

*Built with precision. Optimized for adversarial intelligence operations.*
*Část série: Cross-Domain Bridges | EA × OSINT*
