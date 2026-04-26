+++
title = "EA × Due Diligence: Source Weighting v DD Reportu"
description = "Vážení zdrojů — proč 'audited financials' nejsou automaticky 100 % důvěryhodné"
weight = 100
[taxonomies]
tags = ["kompendium", "cross-domain", "due-diligence"]
categories = ["academic", "platform-integration"]
[extra]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × Due Diligence: Source Weighting v DD Reportu

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **Due Diligence**.

## Doména

**Due Diligence** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

Audited statements jsou důvěryhodnější než management interview, ale pouze pokud audit-firm má clean record. EA aplikuje multi-dimensional weighting.

EA framework přináší do due diligence domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje due diligence pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- Source-class baseline weights (audited > unaudited > management > rumor)
- Auditor reputation overlay (Big 4 vs. tier 2 vs. unknown)
- Conflict-of-interest discount (auditor = related party)
- Recency-decay (data >12 měsíců = weight × 0.7)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- Weighted-evidence scoring v DD reportu
- Source-dependency graph (které findings závisí na kterých zdrojích)
- Sensitivity analýza (co kdyby top-source byl wrong?)
- Audit-firm watch list (sankcionovaní auditoři, restated opinions)

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

DD target: 'audited' financials, ale auditor = 4-osobní firma, která auditovala 23 firem stejného UBO — weight downgraded 100→35

### Scénář 2

Management projections: weight 20, ale po 3 quarters tracking match real performance → upgraded 20→55


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
