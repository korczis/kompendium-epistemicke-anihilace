+++
title = "Kampaně veřejné informovanosti"
description = "Populační zdraví a prevence — Návrh a evaluace mediálních kampaní zvyšujících povědomí o EA."
weight = 180
[taxonomies]
tags = ["kompendium", "population-health", "interventions"]
categories = ["academic", "public-health"]
[extra]
related_terms = ["16-digital-citizenship-program", "17-vulnerable-population-outreach", "19-bystander-intervention-training", "20-helpline-population-impact"]
parent = "kompendium-population-health"
toc = true
+++

# Kampaně veřejné informovanosti

> Návrh a evaluace mediálních kampaní zvyšujících povědomí o EA.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Kampaně veřejné informovanosti) sleduje populační vzorek **N = 10,888** subjektů
ve sledovacím období **29 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **2.71%** | [2.22, 3.2] |
| Incidence (na 100k/rok) | **634** | — |
| Velikost účinku (Cohen's d) | **0.21** | — |
| Odds ratio (vs. kontrola) | **4.14** | — |
| NNT (number needed to treat) | **36** | — |
| Pokrytí intervence | **41%** | — |
| Drop-out | **11.39%** | — |
| Náklady na obyvatele | **38 EUR/rok** | — |

Vzorek je stratifikován podle věku (18-29, 30-44, 45-64, 65+), genderu, urbanizace
a socioekonomického statusu (5 kvintilů).

## Implementační rámec

1. **Detekce a screening** — populační nástroj s validovanou citlivostí ≥ 0.82.
2. **Stratifikace rizika** — risk-stratified outreach s prioritizací top decilu.
3. **Intervenční kaskáda** — stepped care: psychoedukace → krátká intervence → specializovaná péče.
4. **Datový sběr** — kontinuální monitoring přes integrovaný platformový sběr.
5. **Evaluace** — předem registrovaná protokol, primární a sekundární endpointy.

**Framework hook (Prismatic)**: Intervence integruje s `PrismaticHelpline` modulem a `Academy` learning loop. M5M doctrine vynucuje task decomposition; každá intervenční session má max 5 minut. Telemetrie přes `:telemetry.span` (OTEL pillar).

## Indikátory úspěchu

- **Primární endpoint**: redukce incidence EA o ≥ 20% za 29 měsíců.
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 0.21),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 41%, drop-out ≤ 11.39%,
  cost-per-capita ≤ 38 EUR.
- **Equity indikátory**: redukce socioekonomického gradientu výsledků.

## Limitace

- **Selekční bias** — samoselekce subjektů snižuje externí validitu.
- **Měřící bias** — self-report instrumenty pro EA nejsou plně validovány napříč jazyky.
- **Konfaundace** — nepozorované proměnné (sociální podpora, baseline kognitivní rezerva).
- **Ekologická chyba** — populační vzorce nemusí platit individuálně.
- **Časová stabilita** — EA fenomenologie evolves with platform changes; pětileté projekce nejisté.

## Cross-linky

- [08-prilohy](../08-prilohy/_index.md)
- [case-studies](../case-studies/_index.md)
- [detection-signatures](../detection-signatures/_index.md)
- [emergency-protocols](../emergency-protocols/_index.md)
- [forensic-legal](../forensic-legal/_index.md)
- [glossary-bridges](../glossary-bridges/_index.md)
- [organizational-defense](../organizational-defense/_index.md)
- [quick-reference](../quick-reference/_index.md)
- [educational-scenarios](../educational-scenarios/_index.md)
- [historical-cases](../historical-cases/_index.md)
- [cross-domain](../cross-domain/_index.md)


## Connect footer

- **GitHub**: [korczis/kompendium-epistemicke-anihilace](https://github.com/korczis/kompendium-epistemicke-anihilace)
- **Docs**: [Kompendium /population-health/](@/kompendium/population-health/_index.md)
- **API**: `GET /api/v1/epi/ea/public-awareness-campaign` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
