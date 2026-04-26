+++
title = "EA × Due Diligence: Confirmation Bias v DD Procesu"
description = "Investigation bias — jak DD týmy nevědomě hledají potvrzení deal teze"
weight = 90
[taxonomies]
tags = ["kompendium", "cross-domain", "due-diligence"]
categories = ["academic", "platform-integration"]
[extra]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × Due Diligence: Confirmation Bias v DD Procesu

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **Due Diligence**.

## Doména

**Due Diligence** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

DD je pod tlakem dodat go/no-go rozhodnutí. Confirmation bias způsobuje, že tým hledá důkazy podporující předem rozhodnutý směr. EA framework forces falsification.

EA framework přináší do due diligence domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje due diligence pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- Pre-DD hypothesis registration (lock teze BEFORE evidence gathering)
- Steel-manning protocol (najít nejsilnější argument PROTI deal)
- Devil's advocate role assignment (one analyst = adversarial)
- Outcome-tracking calibration (ex-post check: bylo doporučení správné?)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- Pre-mortem workshop (předpokládejme deal selhal — proč?)
- Falsification-required findings (každá teze musí mít attempted refutation)
- Bias-checklist na review (12 standard biases — confirmation, anchoring, sunk-cost...)
- Independent shadow-DD (parallel team without access to primary findings)

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

DD target acquired despite 14 red flags — pre-mortem analýza ex-post ukázala, že tým ignoroval všechny non-confirming evidence

### Scénář 2

Reverse DD: tým instruován prokázat 'deal je špatný' — found 7 issues missed by original DD


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
*Část série: Cross-Domain Bridges | EA × Due Diligence*
