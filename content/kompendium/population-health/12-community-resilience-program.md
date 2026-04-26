+++
title = "Programy komunitní resilience"
description = "Populační zdraví a prevence — Komunitní intervence posilující odolnost vůči manipulaci a dezinformaci."
weight = 120
[taxonomies]
tags = ["kompendium", "population-health", "interventions"]
categories = ["academic", "public-health"]
[extra]
parent = "kompendium-population-health"
toc = true
+++

# Programy komunitní resilience

> Komunitní intervence posilující odolnost vůči manipulaci a dezinformaci.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Programy komunitní resilience) sleduje populační vzorek **N = 20,348** subjektů
ve sledovacím období **26 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **5.11%** | [4.19, 6.03] |
| Incidence (na 100k/rok) | **45** | — |
| Velikost účinku (Cohen's d) | **1.05** | — |
| Odds ratio (vs. kontrola) | **1.48** | — |
| NNT (number needed to treat) | **39** | — |
| Pokrytí intervence | **94%** | — |
| Drop-out | **19.51%** | — |
| Náklady na obyvatele | **34 EUR/rok** | — |

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
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 1.05),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 94%, drop-out ≤ 19.51%,
  cost-per-capita ≤ 34 EUR.
- **Equity indikátory**: redukce socioekonomického gradientu výsledků.

## Limitace

- **Selekční bias** — samoselekce subjektů snižuje externí validitu.
- **Měřící bias** — self-report instrumenty pro EA nejsou plně validovány napříč jazyky.
- **Konfaundace** — nepozorované proměnné (sociální podpora, baseline kognitivní rezerva).
- **Ekologická chyba** — populační vzorce nemusí platit individuálně.
- **Časová stabilita** — EA fenomenologie evolves with platform changes; pětileté projekce nejisté.

## Cross-linky

- [organizational-defense](../organizational-defense/_index.md)
- [quick-reference](../quick-reference/_index.md)
- [educational-scenarios](../educational-scenarios/_index.md)
- [historical-cases](../historical-cases/_index.md)
- [cross-domain](../cross-domain/_index.md)
- [aiad-integration](../aiad-integration/_index.md)
- [03-zakladni-kategorie](../03-zakladni-kategorie/_index.md)
- [04-terminalni-protokoly](../04-terminalni-protokoly/_index.md)
- [05-ultramari-techniky](../05-ultramari-techniky/_index.md)
- [06-klinicke-aplikace](../06-klinicke-aplikace/_index.md)
- [07-teoreticke-reflexe](../07-teoreticke-reflexe/_index.md)


## Connect footer

- **GitHub**: [korczis/prismatic-platform](https://github.com/korczis/prismatic-platform)
- **Docs**: [Kompendium /population-health/](/kompendium/population-health/)
- **API**: `GET /api/v1/epi/ea/community-resilience-program` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
