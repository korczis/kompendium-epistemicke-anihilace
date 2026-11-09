+++
title = "EA × Compliance: ZKB & Epistemic Integrity"
description = "Český Zákon o kybernetické bezpečnosti — epistemic integrity jako audit topic"
weight = 260
[taxonomies]
tags = ["kompendium", "cross-domain", "compliance"]
categories = ["academic", "platform-integration"]
[extra]
related_terms = ["24-ea-security-threat-intelligence-validation", "25-ea-compliance-nis2-integrity", "27-ea-compliance-gdpr-narrative-protection", "28-ea-compliance-aml-pattern-recognition"]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × Compliance: ZKB & Epistemic Integrity

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **Compliance**.

## Doména

**Compliance** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

ZKB §4 a navazující vyhlášky vyžadují integrity controls. NÚKIB inspections 2024 začaly hodnotit i epistemic integrity (provenance, narrative manipulation resistance).

EA framework přináší do compliance domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje compliance pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- Provenance-tracking pro all NIS2/ZKB-scoped systems
- Disinformation-resilience assessment (jak by org reagoval na narrative attack?)
- Audit-log epistemic completeness (kdo viděl jaké data, kdy, why)
- Cross-system narrative consistency (data v různých systémech říká same story)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- NÚKIB-compatible audit trail format
- Annual epistemic-integrity self-assessment
- Incident-classification scheme zahrnující narrative attacks
- Cooperation s national CERT na disinformation incidents

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

NÚKIB inspection: org měl perfect technical controls, ale failed epistemic integrity test (couldn't prove who saw critical decision document)

### Scénář 2

ZKB incident: ransomware + simultaneous narrative campaign 'utility hacked, water unsafe' → coordinated response with NÚKIB + national CERT


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
*Část série: Cross-Domain Bridges | EA × Compliance*
