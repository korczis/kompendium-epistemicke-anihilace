+++
title = "EA × Security: Attribution — Beyond Technical Indicators"
description = "Cyber attribution je narrative construction — EA odhaluje atribuční bias"
weight = 230

[taxonomies]
tags = ["kompendium", "cross-domain", "security"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["21-ea-security-supply-chain-narrative", "22-ea-security-incident-response-narrative", "24-ea-security-threat-intelligence-validation", "25-ea-compliance-nis2-integrity"]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × Security: Attribution — Beyond Technical Indicators

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **Security**.

## Doména

**Security** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

Attribution to nation-state APTs is often premature, politically motivated. Technical IOCs jsou easy to spoof. EA-Security demands evidence-tier framework before attribution claims.

EA framework přináší do security domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje security pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- IOC-tier framework (tier 1: cryptographic, tier 4: TTPs)
- Geopolitical-context tagging (atribuce 'Russia/China/Iran' může být politically convenient)
- Spoofing-evidence check (could attacker easily fake these IOCs?)
- Multi-source corroboration (≥3 independent attribution sources)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- Internal attribution-confidence rating (low/medium/high — public statement min 'high')
- Geopolitical-bias review (independent reviewer assesses attribution v context of current geopolitics)
- Refutation-required protocol (every attribution claim must list 'why this could be wrong')
- Public-statement gates (attribution requires CISO + legal + comms approval)

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

Attack on Czech utility: initial atribuce 'Russian APT' based on Cyrillic strings — review found strings copy-pasted from public IOC feeds, real attacker likely cybercriminal

### Scénář 2

Ransomware blamed on 'North Korean actor' — refutation analysis showed equally plausible criminal-as-a-service group, atribuce downgraded


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
*Část série: Cross-Domain Bridges | EA × Security*
