+++
title = "Bridge: agent"
description = "Glossary bridge — propojeni kompendia s glossary entry agent."
weight = 1
[taxonomies]
tags = ["kompendium", "glossary-bridge", "agent", "cross-link"]
categories = ["academic", "reference"]
[extra]
parent = "kompendium-glossary-bridges"
glossary_target = "agent"
toc = false
+++

# Bridge — Agent

## Glossary entry

[agent](@/glossary/agent.md) — Agent.

Tento bridge clanek navigacne propojuje kompendium s odpovidajicim glossary heslem a poskytuje rozsireny vyklad konceptualniho ukotveni v kompendialnim korpusu.

## Definice z glossary

Agent je v kontextu Prismatic platformy specializovaná softwarová entita s definovaným rozsahem kompetence, kanonickou markdown definicí v `.aiad/agents/`, a runtime invokační logikou. Agenti nejsou autonomní procesy v OTP smyslu — jsou to instrukční šablony aplikované přes LLM nebo deterministické pipeline pro konkrétní úkoly.

Glossary heslo poskytuje jadro vyklad; tento bridge clanek dale rozviji jeho aplikacni rovinu, vztahy a interpretacni implikace v kontextu Prismatic platformy.

## Pozice v kompendiu

Koncept se v kompendiu vyskytuje napric nasledujicimi clanky a sekcemi:

- **Sekce 01 — Co je AIAD agent**: základní definice a odlišení od OTP procesů
- **Sekce 03 — 552 agentů**: úplný katalog s domain breakdown
- **Sekce 04 — Agent invocation**: Task tool, /agents příkaz, mycelial routing
- **Sekce 05 — Agent design patterns**: single-responsibility, tier appropriateness
- **Per-technique články**: tvorba nového agenta, regresní testy

Bridge slouzi jako navigacni kotva mezi temito clanky a kanonickou definici v glossary; cross-linking je obousmerny.

## Konceptualni mapa

Vztahy konceptu k souvisejicim entitam v platformovem korpusu:

| Vztah | Cílový koncept | Typ vazby |
|---|---|---|
| registrován v | Agent Registry | katalogizace |
| klasifikován | Agent Tier | hierarchie |
| specializuje se | Domain (OSINT, DD, ...) | expertise |

Tabulka zachycuje pouze klicove vazby; uplna mapa je dostupna v kompendialnich vizualizacich a graph databazi.

## Klinicke a filosoficke implikace

Agenti otvírají filosofickou otázku: kde končí instruction-tuning a začíná agency? V Prismatic doktríně je agent epistemická role, ne ontologická entita. Klinicky agentní orchestrace umožňuje audit trail — každé rozhodnutí lze zpětně přiřadit k agentní šabloně, prompt verzi a evidence base.

Bridge zde slouzi jako vstupni bod do hlubsi analyzy v sekci kompendialnich teoretickych reflexi a klinickych aplikaci.

## Cross-linky

- **Hub kompendia**: [/kompendium/](@/kompendium/_index.md)
- **Glossary entry**: [/glossary/agent/](@/glossary/agent.md)
- **Quick reference**: [/kompendium/quick-reference/](@/kompendium/quick-reference/_index.md)
- **Visualizations**: [/kompendium/visualizations/](@/kompendium/visualizations/_index.md)
- **Glossary index**: [/glossary/](@/glossary/_index.md)
- **Bridge hub**: [/kompendium/glossary-bridges/](@/kompendium/glossary-bridges/_index.md)
- **Konceptualni mapa**: [/kompendium/konceptualni-mapa/](/kompendium/konceptualni-mapa/)
- **Per-technique katalog**: [/kompendium/techniques/](@/kompendium/techniques/_index.md)
- **Klinicke aplikace**: [/kompendium/klinicke-aplikace/](/kompendium/klinicke-aplikace/)
- **Teoreticke reflexe**: [/kompendium/teoreticke-reflexe/](/kompendium/teoreticke-reflexe/)

---

**Created by [Tomas Korcak (korczis)](https://github.com/korczis/prismatic-platform)** | [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)
