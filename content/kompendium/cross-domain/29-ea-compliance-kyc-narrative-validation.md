+++
title = "EA × Compliance: KYC — Narrative Validation Layer"
description = "KYC compliance — beyond document verification k narrative validation"
weight = 290
[taxonomies]
tags = ["kompendium", "cross-domain", "compliance"]
categories = ["academic", "platform-integration"]
[extra]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × Compliance: KYC — Narrative Validation Layer

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **Compliance**.

## Doména

**Compliance** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

Standard KYC verifies documents (passport, ARES). EA-KYC adds narrative validation: does the customer's stated story (business model, source of funds, purpose) match observable evidence?

EA framework přináší do compliance domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje compliance pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- Narrative-extraction from KYC interview (what story does customer tell?)
- Evidence-corroboration matrix (each narrative claim → supporting evidence)
- Inconsistency detection (customer says X, public records say Y)
- Source-of-funds narrative depth (>3 layers traced)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- KYC platform with narrative-coherence scoring
- Enhanced due diligence trigger (narrative score <70 → EDD)
- Periodic narrative re-validation (annual review of stated story vs. activity)
- Public-records cross-check automation (ARES, OR.justice, OFAC, FAÚ)

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

KYC application: customer claimed 'export business to DACH region', but ARES showed 0 employees, no warehouse, 2-year-old shell → narrative validation failed, EDD triggered

### Scénář 2

Annual review: customer's narrative drifted (claimed 'consulting', became 'crypto trading') without notification → status-change form requested


Tyto scénáře nejsou hypotetické — odpovídají skutečným patternům, které platforma detekovala v produkčních deploymentech. Detaily jsou redacted/composited pro privacy a security reasons.

## Cross-linky

- [Kompendium — Úvod](/kompendium/02-uvod/)
- [Základní kategorie EA](/kompendium/03-zakladni-kategorie/)
- [Terminální protokoly](/kompendium/04-terminalni-protokoly/)
- [Klinické aplikace](/kompendium/06-klinicke-aplikace/)
- [Detection signatures](/kompendium/detection-signatures/)
- [Recovery protocols](/kompendium/recovery-protocols/)
- [Glossary bridges](/kompendium/glossary-bridges/)
- [Educational scenarios](/kompendium/educational-scenarios/)
- [Case studies](/kompendium/case-studies/)
- [Quick reference](/kompendium/quick-reference/)


## Connect

- **Komentáře a otázky**: [GitHub Discussions](https://github.com/korczis/prismatic-platform/discussions)
- **Bug reporty**: [GitLab Issues](https://gitlab.com/korczis/prismatic-platform/-/issues)
- **Email**: [[e-mail odstraněn]](mailto:[e-mail odstraněn])
- **LinkedIn**: [korczis](https://linkedin.com/in/korczis)

---

*Built with precision. Optimized for adversarial intelligence operations.*
*Část série: Cross-Domain Bridges | EA × Compliance*
