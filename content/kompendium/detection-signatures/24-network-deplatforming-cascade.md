+++
title = "Detekční signatura: Deplatformingová kaskáda"
description = "EA detekční signatura — deplatformingová kaskáda."
weight = 24
[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]
[extra]
related_terms = ["22-network-narrative-injection", "23-network-reputation-laundering", "25-phenomenological-cognitive-fog", "26-phenomenological-self-doubt-spike"]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Koordinované multi-platform deplatforming nepohodlného aktéra (kritika, whistleblower, dissent) — synchronní bany, demonetizace, shadowban — často po podání reportů z koordinované sítě.

## Co indikuje

**Coordinated suppression** — reverzní strana coordinated amplification. Cíl: utlumit nepohodlný hlas + signalovat ostatním (chilling effect).

## Detekční kritéria

1. Multi-platform bany v okně < 14 dní bez transparentní procedurální kotvy
2. Reports against target spike před banem (organic baseline > 10×)
3. Reportingové účty mají bot/coordinated signature
4. Cílený aktér měl předchozí adversarial vztah s aktivní kampaní

## False positive analýza

Skutečné porušení rules vyústí v ban. Klíčové odlišení: **koordinace** + **proporce** + **transparence** procesu.

## Validační test

Coordinated reporting detection. Audit reportingových účtů. Příprava forenzního záznamu.

## Doporučená akce

Nasaďte **Mirror/archive protokol** + **legal counsel**. Eskalace k digital rights organizacím (EFF, ACLU).

## Cross-linky

- [Bot coordination](../20-network-bot-coordination/)
- [Platformní koordinace](../21-network-platform-coordination/)
- [Akcelerace izolace](../13-behavioral-isolation-acceleration/)
- [Reputation laundering](../23-network-reputation-laundering/)
- [Sekce 03 — Základní kategorie EA](../../03-zakladni-kategorie/)
- [Sekce 04 — Terminální protokoly](../../04-terminalni-protokoly/)
- [Sekce 06 — Klinické aplikace](../../06-klinicke-aplikace/)
- [Decision Engine](../../../glossary/decision-engine/)
- [Glossary — Detection Signature](../../glossary-bridges/)
- [Detection Signatures Index](../)

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [Contact](mailto:[e-mail odstraněn]) | [Developer Portal](@/developers/_index.md) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
