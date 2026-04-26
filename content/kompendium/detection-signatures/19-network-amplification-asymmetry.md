+++
title = "Detekční signatura: Asymetrie amplifikace"
description = "EA detekční signatura — asymetrie amplifikace."
weight = 19
[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]
[extra]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Anomální poměr mezi reach + retweets + shares u určitého narativu vs. baseline pro daný uzel. Indikátor coordinated amplification (botů, paid promotion, koordinovaného sdílení).

## Co indikuje

**Synthetic signal injection** — uměle generovaný dojem populární podpory. Klasický nástroj influence operations, propagandistických kampaní.

## Detekční kritéria

1. Engagement-to-followers ratio > 5× baseline pro daný uzel
2. Časové rozdělení sharingu nepřirozeně tight (10–60 minut po publikaci)
3. Sharing accounts mají nízkou diverzitu (similar bio, posting patterns)
4. Geografické rozložení sharingu nesrovnalé s tématem

## False positive analýza

Skutečně virální obsah (catastrophe news, viral memes) má rovněž extrémní asymetrii. Klíčové odlišení: **organizace** sharing patternů + **identita** amplifikujících účtů.

## Validační test

Bot detection: Spusťte botometer/Hoaxy na top 100 sharing accounts. Pokud bot-likelihood > 0.6 → signál.

## Doporučená akce

Nasaďte **Amplification audit**. Reportujte platformě. Aplikujte epistemické discount k narativu.

## Cross-linky

- [Bot coordination](../20-network-bot-coordination/)
- [Platformní koordinace](../21-network-platform-coordination/)
- [Injekce narativu](../22-network-narrative-injection/)
- [Monokultura zdrojů](../17-network-source-monoculture/)
- [Sekce 03 — Základní kategorie EA](../../03-zakladni-kategorie/)
- [Sekce 04 — Terminální protokoly](../../04-terminalni-protokoly/)
- [Sekce 06 — Klinické aplikace](../../06-klinicke-aplikace/)
- [Decision Engine](../../../glossary/decision-engine/)
- [Glossary — Detection Signature](../../glossary-bridges/)
- [Detection Signatures Index](../)

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [Contact](mailto:[e-mail odstraněn]) | [Developer Portal](/developers/) | [Glossary](/glossary/) | [Kompendium](/kompendium/)*
