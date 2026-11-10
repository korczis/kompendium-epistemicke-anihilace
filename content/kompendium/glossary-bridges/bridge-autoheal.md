+++
title = "Bridge: autoheal"
description = "Glossary bridge — propojeni kompendia s glossary entry autoheal."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "autoheal", "cross-link"]
categories = ["academic", "reference"]

[extra]
related_terms = ["bridge-archer-supreme", "bridge-autoevolve", "bridge-betrayal-trauma", "bridge-bite-model"]
parent = "kompendium-glossary-bridges"
glossary_target = "autoheal"
toc = false
+++

# Bridge — AutoHeal

## Glossary entry

[autoheal](@/glossary/autoheal.md) — AutoHeal.

Tento bridge clanek navigacne propojuje kompendium s odpovidajicim glossary heslem a poskytuje rozsireny vyklad konceptualniho ukotveni v kompendialnim korpusu.

## Definice z glossary

AutoHeal je platformní mechanismus pro automatické zotavení z detekovaných regresí — restart selhaných GenServerů, rollback failed deployments, regenerace cache stavů a obnova baseline metrik. Aktivuje se přes `mix autoheal.baseline` a operuje pod supervizí [AutoEvolve](@/glossary/autoevolve.md) subsystému.

Glossary heslo poskytuje jadro vyklad; tento bridge clanek dale rozviji jeho aplikacni rovinu, vztahy a interpretacni implikace v kontextu Prismatic platformy.

## Pozice v kompendiu

Koncept se v kompendiu vyskytuje napric nasledujicimi clanky a sekcemi:

- **Sekce 02 — Resilient systems**: AutoHeal vs. let-it-crash filosofie OTP
- **Sekce 04 — Production safety**: AutoHeal v production validation [doctrine](@/glossary/doctrine.md)
- **Sekce 05 — Recovery patterns**: supervisor restart, baseline restoration, cache rebuild
- **Sekce 07 — Operational doctrine**: kdy AutoHeal eskaluje na human intervention
- **Per-technique články**: definice healing strategy per app, baseline metrics

Bridge slouzi jako navigacni kotva mezi temito clanky a kanonickou definici v glossary; cross-linking je obousmerny.

## Konceptualni mapa

Vztahy konceptu k souvisejicim entitam v platformovem korpusu:

| Vztah | Cílový koncept | Typ vazby |
|---|---|---|
| doplňuje | AutoEvolve | komplement |
| využívá | OTP supervision | infrastruktura |
| monitoruje | Health Score | trigger |

Tabulka zachycuje pouze klicove vazby; uplna mapa je dostupna v kompendialnich vizualizacich a graph databazi.

## Klinicke a filosoficke implikace

AutoHeal je reflexí biologické metafory: systém schopný self-repair je odolnější vůči neočekávaným poruchám. Filosoficky implementuje princip autopoesis (Maturana, Varela) v softwarové vrstvě. Klinicky redukuje MTTR (mean time to recovery) a kritickou dependenci na on-call operatérech.

Bridge zde slouzi jako vstupni bod do hlubsi analyzy v sekci kompendialnich teoretickych reflexi a klinickych aplikaci.

## Cross-linky

- **Hub kompendia**: [/kompendium/](@/kompendium/_index.md)
- **Glossary entry**: [/glossary/autoheal/](@/glossary/autoheal.md)
- **Quick reference**: [/kompendium/quick-reference/](@/kompendium/quick-reference/_index.md)
- **Visualizations**: [/kompendium/visualizations/](@/kompendium/visualizations/_index.md)
- **Glossary index**: [/glossary/](@/glossary/_index.md)
- **Bridge hub**: [/kompendium/glossary-bridges/](@/kompendium/glossary-bridges/_index.md)
- **Konceptualni mapa**: [/kompendium/konceptualni-mapa/](@/kompendium/konceptualni-mapa/_index.md)
- **Per-technique katalog**: [/kompendium/techniques/](@/kompendium/techniques/_index.md)
- **Klinicke aplikace**: [/kompendium/klinicke-aplikace/](@/kompendium/06-klinicke-aplikace/_index.md)
- **Teoreticke reflexe**: [/kompendium/teoreticke-reflexe/](@/kompendium/07-teoreticke-reflexe/_index.md)

---

**Created by [Tomas Korcak (korczis)](https://github.com/korczis/kompendium-epistemicke-anihilace)** | [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [AutoHeal](@/glossary/autoheal.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
