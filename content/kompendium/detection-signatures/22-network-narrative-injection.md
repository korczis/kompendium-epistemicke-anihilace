+++
title = "Detekční signatura: Injekce narativu"
description = "EA detekční signatura — injekce narativu."
weight = 22
[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]
[extra]
related_terms = ["20-network-bot-coordination", "21-network-platform-coordination", "23-network-reputation-laundering", "24-network-deplatforming-cascade"]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Cílené vsazení nového narativu do diskurzu — často přes high-credibility uzly (kompromitovaní novináři, akademici, influenceři) — s cílem obejít detection a spustit organické sharing.

## Co indikuje

**Narativ engineering** — kombinace inteligence operations + PR + cognitive warfare. Cíl: shift Overton window, polarizace, demoralizace.

## Detekční kritéria

1. Nový claim (predtím neexistoval v diskurzu) získává high engagement < 24 h
2. Initial post je z high-credibility uzlu (verified, large following)
3. Narativ kotví na true core fact, ale s **manipulativním rámováním**
4. Counter-narratives jsou rychle suppressed nebo deplatformováni

## False positive analýza

Skutečně nové insights se rovněž šíří z high-credibility uzlů. Klíčové odlišení: **přítomnost manipulativního rámování** + **rezistence k correction**.

## Validační test

Narrative tracking: Monitorujte first appearance vs. rapid amplification. Hledejte injection points.

## Doporučená akce

Nasaďte **Pre-bunking** (proactive vyvrácení). Eskalujte fact-checkerům.

## Cross-linky

- [Posun rámování](../4-linguistic-framing-shift/)
- [Monokultura zdrojů](../17-network-source-monoculture/)
- [Cirkularita citací](../18-network-citation-circularity/)
- [Platformní koordinace](../21-network-platform-coordination/)
- [Sekce 03 — Základní kategorie EA](../../03-zakladni-kategorie/)
- [Sekce 04 — Terminální protokoly](../../04-terminalni-protokoly/)
- [Sekce 06 — Klinické aplikace](../../06-klinicke-aplikace/)
- [Decision Engine](../../../glossary/decision-engine/)
- [Glossary — Detection Signature](../../glossary-bridges/)
- [Detection Signatures Index](../)

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [Contact](mailto:[e-mail odstraněn]) | [Developer Portal](@/developers/_index.md) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
