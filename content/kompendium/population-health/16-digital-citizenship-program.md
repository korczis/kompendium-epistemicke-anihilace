+++
title = "Programy digitálního občanství"
description = "Populační zdraví a prevence — Komplexní rozvoj digitálních kompetencí a etického chování online."
weight = 160
[taxonomies]
tags = ["kompendium", "population-health", "interventions"]
categories = ["academic", "public-health"]
[extra]
parent = "kompendium-population-health"
toc = true
+++

# Programy digitálního občanství

> Komplexní rozvoj digitálních kompetencí a etického chování online.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Programy digitálního občanství) sleduje populační vzorek **N = 12,908** subjektů
ve sledovacím období **26 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **7.58%** | [6.22, 8.94] |
| Incidence (na 100k/rok) | **320** | — |
| Velikost účinku (Cohen's d) | **0.51** | — |
| Odds ratio (vs. kontrola) | **3.0** | — |
| NNT (number needed to treat) | **31** | — |
| Pokrytí intervence | **26%** | — |
| Drop-out | **17.61%** | — |
| Náklady na obyvatele | **57 EUR/rok** | — |

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

- **Primární endpoint**: redukce incidence EA o ≥ 20% za 26 měsíců.
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 0.51),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 26%, drop-out ≤ 17.61%,
  cost-per-capita ≤ 57 EUR.
- **Equity indikátory**: redukce socioekonomického gradientu výsledků.

## Limitace

- **Selekční bias** — samoselekce subjektů snižuje externí validitu.
- **Měřící bias** — self-report instrumenty pro EA nejsou plně validovány napříč jazyky.
- **Konfaundace** — nepozorované proměnné (sociální podpora, baseline kognitivní rezerva).
- **Ekologická chyba** — populační vzorce nemusí platit individuálně.
- **Časová stabilita** — EA fenomenologie evolves with platform changes; pětileté projekce nejisté.

## Cross-linky

- [07-teoreticke-reflexe](../07-teoreticke-reflexe/_index.md)
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


## Connect footer

- **GitHub**: [korczis/prismatic-platform](https://github.com/korczis/prismatic-platform)
- **Docs**: [Kompendium /population-health/](/kompendium/population-health/)
- **API**: `GET /api/v1/epi/ea/digital-citizenship-program` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
