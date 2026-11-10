+++
title = "EA × OSINT: ARES Validation pod EA Lens"
description = "Český ARES jako primární zdroj — limity a EA-bezpečné použití"
weight = 20

[taxonomies]
tags = ["kompendium", "cross-domain", "osint"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["18-ea-security-spear-phishing", "19-ea-security-disinformation-defense", "20-ea-security-insider-threat", "21-ea-security-supply-chain-narrative"]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × OSINT: ARES Validation pod EA Lens

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **OSINT**.

## Doména

**OSINT** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

ARES je oficiální, ale ne immunní vůči manipulaci přes nominee directors a accelerated re-registration. EA odhaluje vzorce neviditelné prostou rešerší.

EA framework přináší do osint domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje osint pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- Detekce timing-anomálií (jednatel jmenován <30 dní před transakcí)
- Frequency analýza UBO změn (>3 změny/rok = red flag)
- Cross-reference s OR.justice.cz pro detekci dokument-divergence
- Pattern matching nominee directors (recyklované adresy/jména)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- EA-validation pipeline (ARES + OR.justice + RZP + Insolvenční rejstřík)
- UBO change-velocity skóre
- Address clustering (SharedRegisteredAddress detector)
- Audit trail s cryptographic timestamping

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

Akvizice s.r.o.: jednatel měněn 4× za 18 měsíců, vždy 7 dní před tendrem — vzor opakovan u 23 dalších firem ve stejné CZ-NACE

### Scénář 2

Veřejná zakázka: 5 'nezávislých' uchazečů sdílí registrované sídlo skrz 2 prostředníky

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
