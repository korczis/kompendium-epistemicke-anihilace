+++
title = "Bridge: blue-team"
description = "Glossary bridge — propojeni kompendia s glossary entry blue-team."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "blue-team", "cross-link"]
categories = ["academic", "reference"]

[extra]
related_terms = ["bridge-bite-model", "bridge-black-team", "bridge-bounded-context", "bridge-c-ptsd"]
parent = "kompendium-glossary-bridges"
glossary_target = "blue-team"
toc = false
+++

# Bridge — Blue team

## Glossary entry

[blue-team](@/glossary/blue-team.md) — Blue team.

Tento bridge clanek navigacne propojuje kompendium s odpovidajicim glossary heslem a poskytuje rozsireny vyklad konceptualniho ukotveni v kompendialnim korpusu.

## Definice z glossary

Blue team je v Prismatic color-team taxonomii agentní rodina specializovaná na defenzivní bezpečnost, threat detection, incident response a infrastructure hardening. Komplementární k [red team](@/glossary/red-team.md) (offensive) v klasickém security paradigmatu; operuje pod zvýšenou auditní zátěží a předvídatelností.

Glossary heslo poskytuje jadro vyklad; tento bridge clanek dale rozviji jeho aplikacni rovinu, vztahy a interpretacni implikace v kontextu Prismatic platformy.

## Pozice v kompendiu

Koncept se v kompendiu vyskytuje napric nasledujicimi clanky a sekcemi:

- **Sekce 04 — [Color teams](@/glossary/color-teams.md) overview**: blue team mezi 6 týmy
- **Sekce 05 — Defensive security**: SIEM, IDS/IPS, threat modeling
- **Sekce 06 — Incident response**: playbook, IR pipeline, post-mortem
- **Sekce 07 — Red vs. Blue**: [purple team](@/glossary/purple-team.md) jako sjednocení
- **Per-technique články**: defensive playbooks, MITRE ATT&CK mapping

Bridge slouzi jako navigacni kotva mezi temito clanky a kanonickou definici v glossary; cross-linking je obousmerny.

## Konceptualni mapa

Vztahy konceptu k souvisejicim entitam v platformovem korpusu:

| Vztah | Cílový koncept | Typ vazby |
|---|---|---|
| instance | Color Team | specializace |
| kontrastuje | Red team (ofenzivní) | polarita |
| integruje | Purple team | sjednocení |

Tabulka zachycuje pouze klicove vazby; uplna mapa je dostupna v kompendialnich vizualizacich a graph databazi.

## Klinicke a filosoficke implikace

Blue team reprezentuje epistemiku obrany: znalost vlastní infrastruktury, předvídání útočníka, kontinuální vigilance. Filosoficky implementuje princip Maginot-line vs. defense-in-depth. Klinicky musí blue team pracovat s information asymmetry — útočník volí čas a místo, defendant musí být všude vždy.

Bridge zde slouzi jako vstupni bod do hlubsi analyzy v sekci kompendialnich teoretickych reflexi a klinickych aplikaci.

## Cross-linky

- **Hub kompendia**: [/kompendium/](@/kompendium/_index.md)
- **Glossary entry**: [/glossary/blue-team/](@/glossary/blue-team.md)
- **Quick reference**: [/kompendium/quick-reference/](@/kompendium/quick-reference/_index.md)
- **Visualizations**: [/kompendium/visualizations/](@/kompendium/visualizations/_index.md)
- **Glossary index**: [/glossary/](@/glossary/_index.md)
- **Bridge hub**: [/kompendium/glossary-bridges/](@/kompendium/glossary-bridges/_index.md)
- **Konceptualni mapa**: [/kompendium/konceptualni-mapa/](@/kompendium/konceptualni-mapa/_index.md)
- **Per-technique katalog**: [/kompendium/techniques/](@/kompendium/techniques/_index.md)
- **Klinicke aplikace**: [/kompendium/klinicke-aplikace/](@/kompendium/06-klinicke-aplikace/_index.md)
- **Teoreticke reflexe**: [/kompendium/teoreticke-reflexe/](@/kompendium/07-teoreticke-reflexe/_index.md)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Blue Team](@/glossary/blue-team.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
