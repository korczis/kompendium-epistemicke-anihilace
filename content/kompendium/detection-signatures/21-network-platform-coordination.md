+++
title = "Detekční signatura: Platformní koordinace"
description = "EA detekční signatura — platformní koordinace."
weight = 21
[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]
[extra]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Stejný narativ se objevuje cross-platform (X, Facebook, TikTok, podcasty, blogy) v krátkém okně, s podobnými key messages, vizuálním ztvárněním a hashtagy — bez deklarované kampaně.

## Co indikuje

**Cross-platform influence operation**. Klasický rys státem sponzorovaných kampaní (RU, CN, IR), korporátních PR útoků, sektářských mobilizací.

## Detekční kritéria

1. Top 5 platforms publikují tematicky koherentní obsah v okně < 48 h
2. Sdílení vizuálních elementů (memes, stock photos) napříč platformami
3. Hashtag adoption rapid + decoupled od organické konverzace
4. Sentiment analysis: extreme polarization spikes synchronně

## False positive analýza

Globální events (election day, sports finals) generují legitimně cross-platform synchronicitu. Klíčové: **téma** + **hloubka analýzy**.

## Validační test

Cross-platform monitoring (Hoaxy, Brandwatch, Meltwater). Korelační analýza topic + timing.

## Doporučená akce

Nasaďte **Platform coordination report**. Multiagency informování (CTI týmy, fact-checkers).

## Cross-linky

- [Asymetrie amplifikace](../19-network-amplification-asymmetry/)
- [Bot coordination](../20-network-bot-coordination/)
- [Injekce narativu](../22-network-narrative-injection/)
- [Akcelerace izolace](../13-behavioral-isolation-acceleration/)
- [Sekce 03 — Základní kategorie EA](../../03-zakladni-kategorie/)
- [Sekce 04 — Terminální protokoly](../../04-terminalni-protokoly/)
- [Sekce 06 — Klinické aplikace](../../06-klinicke-aplikace/)
- [Decision Engine](../../../glossary/decision-engine/)
- [Glossary — Detection Signature](../../glossary-bridges/)
- [Detection Signatures Index](../)

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [Contact](mailto:[e-mail odstraněn]) | [Developer Portal](/developers/) | [Glossary](/glossary/) | [Kompendium](/kompendium/)*
