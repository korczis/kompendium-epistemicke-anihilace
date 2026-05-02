+++
title = "EA × Due Diligence: UBO Disinformation Patterns"
description = "Beneficial ownership obfuscation — narrative warfare na ownership chains"
weight = 130
[taxonomies]
tags = ["kompendium", "cross-domain", "due-diligence"]
categories = ["academic", "platform-integration"]
[extra]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × Due Diligence: UBO Disinformation Patterns

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **Due Diligence**.

## Doména

**Due Diligence** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

UBO disinformation je #1 DD red flag. Adversary konstruuje plausible-but-false ownership narrative, který odolá superficial review. EA-DD aplikuje multi-layer chain analysis.

EA framework přináší do due diligence domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje due diligence pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- Ownership chain depth analysis (>4 vrstvy = red flag)
- Jurisdiction-shopping detector (BVI/Cyprus/Malta clusters)
- Nominee-director frequency (recyklovaná jména = obfuscation signal)
- Beneficial-ownership-narrative consistency check (5 sources)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- Multi-jurisdiction UBO graph traversal (CZ ARES + EU EBR + global Sayari/OpenCorporates)
- Source-divergence alerts (UBO mismatch mezi zdroji)
- Regulatory-filing cross-reference (FAÚ, AML reports, sanctions)
- Narrative-consistency scoring (každý zdroj musí říct same story)

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

Czech s.r.o.: ARES říká UBO X, ale FAÚ má record Y, Cyprus filing má Z — narrativ inconsistency, escalated

### Scénář 2

DD target: 'simple' 2-vrstvá ownership, ale Sayari graph odhalil 7-vrstvou chain skrz 4 jurisdikce, end UBO sanctioned


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
*Část série: Cross-Domain Bridges | EA × Due Diligence*
