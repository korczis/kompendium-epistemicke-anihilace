+++
title = "EA × Due Diligence: Systemic Confirmation Bias Prevention"
description = "Architectural prevention biasu v DD — beyond individual training"
weight = 160
[taxonomies]
tags = ["kompendium", "cross-domain", "due-diligence"]
categories = ["academic", "platform-integration"]
[extra]
related_terms = ["14-ea-dd-narrative-warfare", "15-ea-dd-evidence-quality-assessment", "17-ea-security-social-engineering", "18-ea-security-spear-phishing"]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × Due Diligence: Systemic Confirmation Bias Prevention

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **Due Diligence**.

## Doména

**Due Diligence** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

Bias training selhává — bias je systémový, ne individual. EA-DD bias mitigation funguje na úrovni process design: red teams, blind reviews, devil's advocate, calibration loops.

EA framework přináší do due diligence domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje due diligence pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- Red team workshops (separate team paid to find deal-killers)
- Blind partial review (analyst gets data without knowing target identity)
- Decision-protocol mandates (must list 3 deal-killers before sign-off)
- Anonymized outcome database (bias detection across analysts)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- Mandatory red-team session pro deals >$50M
- Blind-review protocol pro financial analysis (target name redacted)
- Pre-mortem template (assume deal failed, write retrospective)
- Bias-audit quarterly (compare go/no-go rates by analyst — outliers reviewed)

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

Acquisition $200M: standard DD said 'high confidence buy', red team found 4 deal-killers in 2 weeks — deal restructured

### Scénář 2

Bias audit: analyst X had 94 % 'go' rate vs. team baseline 67 % — review revealed systematic over-confidence


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
*Část série: Cross-Domain Bridges | EA × Due Diligence*
