+++
title = "EA × Security: AI-Augmented Spear Phishing"
description = "LLM-crafted spear phishing — EA framework jako last line of defense"
weight = 180

[taxonomies]
tags = ["kompendium", "cross-domain", "security"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["16-ea-dd-confirmation-bias-prevention", "17-ea-security-social-engineering", "19-ea-security-disinformation-defense", "2-ea-osint-czech-ares-validation"]
parent = "kompendium-cross-domain"
toc = true
+++

# EA × Security: AI-Augmented Spear Phishing

> **Cross-domain bridge** mezi Epistemic Attacks (EA) frameworkem a doménou **Security**.

## Doména

**Security** v kontextu Prismatic Platform pokrývá: investigativní operace, due-diligence pipeline, security operations, regulatory compliance. Tato doména se v posledních letech transformovala — z procedurální kontroly na **adversarial intelligence operation**, kde každý zdroj informace je potenciálně manipulovaný a každé rozhodnutí je výsledkem narrative warfare.

Klasické nástroje této domény (rule-based monitoring, document verification, technical IOCs) byly designovány pro epistemic-stable prostředí. Současná realita — AI-generovaný obsah, koordinované disinformační kampaně, sophisticated obfuscation — vyžaduje **EA-augmented** přístup.

## EA Relevance

AI eliminoval all classical phishing markers. Modern spear phishing je grammatically perfect, contextually appropriate, personalized. EA detekuje na semantic-anomaly úrovni.

EA framework přináší do security domény tři kritické dimenze:

1. **Narrative integrity** — informace není jen fact, ale součást příběhu. Manipulátor pracuje s celým narrativem, ne s izolovanými fakty.
2. **Source provenance** — proveniencia každé informace musí být sledovatelná až k root-source, ne jen k poslednímu publisher.
3. **Adversarial assumption** — předpokládáme, že někdo se aktivně snaží manipulovat naše rozhodování. Bez této assumption padáme do confirmation bias a source-laundering pastí.

Bez EA-augmentace produkuje security pipeline **plausible-but-wrong** závěry s vysokou confidence — což je horší než žádný závěr, protože vede k akcím založeným na falešné jistotě.

## Detekční metody

- Semantic-anomaly detection (request mismatched s recipient role)
- Cross-reference s known communication patterns (sender X never asked for Y before)
- URL reputation + linguistic-cue fusion (link looks normal, ale ask context unusual)
- Behavioral baseline per sender (timing, length, attachments — deviations flagged)

Tyto metody jsou implementovány v Prismatic Platform jako kombinace deterministických engine (PrismaticDd, PrismaticOsintCore) a EA-validation layeru (PrismaticDecision).

## Obranné mechanismy

- Email gateway with semantic classifier (not just signature/URL)
- Just-in-time training (employee gets simulated phish if they clicked real one)
- Reporting button with auto-context (one click → SOC investigates)
- Sender-baseline monitoring (alert on >2σ deviation in communication pattern)

Obranné mechanismy nejsou jen reaktivní — proaktivně **změny architekturu rozhodování** tak, aby manipulace byla detekovatelná **před** tím, než ovlivní akci. Cílem není blokovat všechny manipulace (nemožné), ale **redukovat blast radius** úspěšné manipulace pod akceptovatelný práh.

## Případové scénáře

### Scénář 1

Spear-phish to CFO: perfect grammar, valid sender domain (compromised account), urgent payment — ale request type never previously seen from this vendor → blocked

### Scénář 2

Whaling attempt: 'CEO' asked legal to expedite acquisition document signing — semantic match high, ale CEO never delegates acquisition signing → flagged


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
