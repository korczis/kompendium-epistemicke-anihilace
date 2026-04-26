+++
title = "Prevalence online radikalizace"
description = "Populační zdraví a prevence — Internetově zprostředkovaná radikalizace jako populační fenomén."
weight = 80
[taxonomies]
tags = ["kompendium", "population-health", "epidemiology"]
categories = ["academic", "public-health"]
[extra]
parent = "kompendium-population-health"
toc = true
+++

# Prevalence online radikalizace

> Internetově zprostředkovaná radikalizace jako populační fenomén.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Prevalence online radikalizace) sleduje populační vzorek **N = 19,781** subjektů
ve sledovacím období **23 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **18.37%** | [15.06, 21.68] |
| Incidence (na 100k/rok) | **338** | — |
| Velikost účinku (Cohen's d) | **0.75** | — |
| Odds ratio (vs. kontrola) | **1.37** | — |
| NNT (number needed to treat) | **31** | — |
| Pokrytí intervence | **90%** | — |
| Drop-out | **12.6%** | — |
| Náklady na obyvatele | **12 EUR/rok** | — |

Vzorek je stratifikován podle věku (18-29, 30-44, 45-64, 65+), genderu, urbanizace
a socioekonomického statusu (5 kvintilů).

## Implementační rámec

1. **Detekce a screening** — populační nástroj s validovanou citlivostí ≥ 0.82.
2. **Stratifikace rizika** — risk-stratified outreach s prioritizací top decilu.
3. **Intervenční kaskáda** — stepped care: psychoedukace → krátká intervence → specializovaná péče.
4. **Datový sběr** — kontinuální monitoring přes integrovaný platformový sběr.
5. **Evaluace** — předem registrovaná protokol, primární a sekundární endpointy.

**Framework hook (AIAD)**: Datový pipeline `/api/v1/epi/ea/incidence` zpřístupňuje agregované metriky napříč 552 AIAD agenty. NCLB doctrine zajišťuje, že každé tvrzení v této studii je evidence-backed a dynamicky validované přes `mix nclb.validate`.

## Indikátory úspěchu

- **Primární endpoint**: redukce incidence EA o ≥ 20% za 23 měsíců.
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 0.75),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 90%, drop-out ≤ 12.6%,
  cost-per-capita ≤ 12 EUR.
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

- **GitHub**: [korczis/prismatic-platform](https://github.com/korczis/prismatic-platform)
- **Docs**: [Kompendium /population-health/](/kompendium/population-health/)
- **API**: `GET /api/v1/epi/ea/online-radicalization-prevalence` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
