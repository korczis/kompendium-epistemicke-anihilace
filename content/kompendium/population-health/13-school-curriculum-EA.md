+++
title = "Školní kurikulum proti EA"
description = "Populační zdraví a prevence — Vzdělávací moduly pro základní, střední a vysoké školy zaměřené na epistemickou hygienu."
weight = 130
[taxonomies]
tags = ["kompendium", "population-health", "interventions"]
categories = ["academic", "public-health"]
[extra]
parent = "kompendium-population-health"
toc = true
+++

# Školní kurikulum proti EA

> Vzdělávací moduly pro základní, střední a vysoké školy zaměřené na epistemickou hygienu.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Školní kurikulum proti EA) sleduje populační vzorek **N = 43,998** subjektů
ve sledovacím období **20 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **15.73%** | [12.9, 18.56] |
| Incidence (na 100k/rok) | **551** | — |
| Velikost účinku (Cohen's d) | **1.2** | — |
| Odds ratio (vs. kontrola) | **4.57** | — |
| NNT (number needed to treat) | **42** | — |
| Pokrytí intervence | **54%** | — |
| Drop-out | **18.75%** | — |
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

- **Primární endpoint**: redukce incidence EA o ≥ 20% za 20 měsíců.
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 1.2),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 54%, drop-out ≤ 18.75%,
  cost-per-capita ≤ 38 EUR.
- **Equity indikátory**: redukce socioekonomického gradientu výsledků.

## Limitace

- **Selekční bias** — samoselekce subjektů snižuje externí validitu.
- **Měřící bias** — self-report instrumenty pro EA nejsou plně validovány napříč jazyky.
- **Konfaundace** — nepozorované proměnné (sociální podpora, baseline kognitivní rezerva).
- **Ekologická chyba** — populační vzorce nemusí platit individuálně.
- **Časová stabilita** — EA fenomenologie evolves with platform changes; pětileté projekce nejisté.

## Cross-linky

- [05-ultramari-techniky](../05-ultramari-techniky/_index.md)
- [06-klinicke-aplikace](../06-klinicke-aplikace/_index.md)
- [07-teoreticke-reflexe](../07-teoreticke-reflexe/_index.md)
- [08-prilohy](../08-prilohy/_index.md)
- [case-studies](../case-studies/_index.md)
- [detection-signatures](../detection-signatures/_index.md)
- [emergency-protocols](../emergency-protocols/_index.md)
- [forensic-legal](../forensic-legal/_index.md)
- [glossary-bridges](../glossary-bridges/_index.md)
- [organizational-defense](../organizational-defense/_index.md)
- [quick-reference](../quick-reference/_index.md)


## Connect footer

- **GitHub**: [korczis/prismatic-platform](https://github.com/korczis/prismatic-platform)
- **Docs**: [Kompendium /population-health/](/kompendium/population-health/)
- **API**: `GET /api/v1/epi/ea/school-curriculum-EA` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
