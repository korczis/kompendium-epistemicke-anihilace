+++
title = "EA × Compliance: AML — Pattern Recognition Beyond Rules"
description = "AML monitoring — EA-augmented pattern recognition překračuje rule-based limits"
weight = 280

[taxonomies]
tags = ["kompendium", "cross-domain", "compliance"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["26-ea-compliance-zkb-epistemic-integrity", "27-ea-compliance-gdpr-narrative-protection", "29-ea-compliance-kyc-narrative-validation", "3-ea-osint-justice-cz-screening"]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × Compliance: AML — Pattern Recognition Beyond Rules

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **Compliance**.

## Doména

**Compliance** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

Classical AML rules (>€10K = SAR) miss sophisticated layering. EA-AML aplikuje narrative-pattern recognition: what story does this transaction sequence tell?

EA framework přináší do compliance domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje compliance pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- Transaction-sequence narrative extraction (what's the 'story' of this account?)
- Cross-account network analysis (related entities, beneficial owners)
- Behavioral baseline per account (deviations flagged)
- Narrative-coherence check (stated business purpose vs. actual flows)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- AML platform with narrative-pattern engine (alongside rule-based)
- SAR-quality scoring (good narrative → faster regulator processing)
- Cross-institution data sharing (with FAÚ, where legally allowed)
- Continuous learning (closed cases → updated patterns)

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

AML investigation: account had no rule-violations, but narrative analysis flagged 'classic layering' pattern → SAR filed, FAÚ confirmed, $4M frozen

### Scénář 2

Onboarding: business stated 'consulting services' but transaction patterns matched 'money mule' narrative → escalated, account refused

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
