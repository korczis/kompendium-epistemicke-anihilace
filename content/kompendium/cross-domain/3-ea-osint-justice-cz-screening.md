+++
title = "EA × OSINT: Justice.cz pod EA-Screening"
description = "Soudní rejstřík OR.justice — narativní cleansing soudních rozhodnutí"
weight = 30
[taxonomies]
tags = ["kompendium", "cross-domain", "osint"]
categories = ["academic", "platform-integration"]
[extra]
related_terms = ["28-ea-compliance-aml-pattern-recognition", "29-ea-compliance-kyc-narrative-validation", "30-ea-compliance-regulatory-capture-detection", "4-ea-osint-sanctions-list-bias"]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × OSINT: Justice.cz pod EA-Screening

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **OSINT**.

## Doména

**OSINT** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

Public soudní data jsou pravdivá, ale selektivně prezentovaná. EA detekuje, co chybí — nezahájené spory, stažené žaloby, mimosoudní vyrovnání.

EA framework přináší do osint domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje osint pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- Gap-analýza mezi soudními řízeními a tržními zprávami
- Detekce 'voluntary dismissal' patternu (žalovaná opakovaně urovnává)
- Časová korelace: stažení žaloby <30 dní před DD start
- Counterparty network analýza (kdo žaloval koho, jak často)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- Litigation-quietness skóre (méně sporů než peer = anomálie)
- Settlement-pattern detector
- Reputation-laundering alerts (PR booms post-litigation)
- Cross-jurisdiction check (CZ + SK + EU CURIA)

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

DD target: 0 sporů v ČR, ale 14 stažených žalob v posledních 3 letech — všechny urovnány do 60 dnů (suspicious settlement pattern)

### Scénář 2

Dodavatelská prověrka: protistrana vyhrává 91 % sporů (peer baseline 47 %)


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
