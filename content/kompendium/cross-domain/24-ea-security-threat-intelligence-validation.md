+++
title = "EA × Security: Threat Intel Source Validation"
description = "Threat intelligence je často OSINT in disguise — EA aplikuje source-credibility framework"
weight = 240
[taxonomies]
tags = ["kompendium", "cross-domain", "security"]
categories = ["academic", "platform-integration"]
[extra]
related_terms = ["22-ea-security-incident-response-narrative", "23-ea-security-attribution-bias", "25-ea-compliance-nis2-integrity", "26-ea-compliance-zkb-epistemic-integrity"]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × Security: Threat Intel Source Validation

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **Security**.

## Doména

**Security** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

Commercial threat intel feeds vary 10× v false-positive rate. EA-Security validuje feeds before consumption: source provenance, FP rates, narrative bias.

EA framework přináší do security domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje security pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- FP-rate measurement per feed (track false alerts za 90 days)
- Source-provenance audit (where does the feed get its data?)
- Narrative-bias check (feed's public reports — political slant?)
- Cross-feed corroboration (require ≥2 feeds for high-confidence alerts)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- Per-feed weighted scoring (high-FP feeds get lower weight in correlation)
- Quarterly feed audit (drop feeds with FP >20 %)
- Internal feed integration (organizational TTPs prioritized over external)
- Continuous calibration (analyst feedback → weight updates)

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

Threat intel feed flagged 47 IPs as 'C2 servers' over 30 days — investigation found 32 % were home routers, feed dropped from blocklist tier

### Scénář 2

Premium feed claimed 'Russian APT campaign' — independent review found 80 % of indicators recycled from 2-year-old reports, feed downgraded


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

- **Komentáře a otázky**: [GitHub Discussions](https://github.com/korczis/prismatic-platform/discussions)
- **Bug reporty**: [GitLab Issues](https://gitlab.com/korczis/prismatic-platform/-/issues)
- **Email**: [[e-mail odstraněn]](mailto:[e-mail odstraněn])
- **LinkedIn**: [korczis](https://linkedin.com/in/korczis)

---

*Built with precision. Optimized for adversarial intelligence operations.*
*Část série: Cross-Domain Bridges | EA × Security*
