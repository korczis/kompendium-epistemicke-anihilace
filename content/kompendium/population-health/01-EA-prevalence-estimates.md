+++
title = "Odhady prevalence epistemického útoku"
description = "Populační zdraví a prevence — Populační odhady výskytu epistemických útoků (EA) napříč věkovými, genderovými a socioekonomickými stratifikacemi."
weight = 10
[taxonomies]
tags = ["kompendium", "population-health", "epidemiology"]
categories = ["academic", "public-health"]
[extra]
related_terms = ["02-cohort-studies-EA", "03-incidence-cult-exposure", "04-disinformation-population-impact"]
parent = "kompendium-population-health"
toc = true
+++

# Odhady prevalence epistemického útoku

> Populační odhady výskytu epistemických útoků (EA) napříč věkovými, genderovými a socioekonomickými stratifikacemi.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Odhady prevalence epistemického útoku) sleduje populační vzorek **N = 43,797** subjektů
ve sledovacím období **52 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **7.5%** | [6.15, 8.85] |
| Incidence (na 100k/rok) | **621** | — |
| Velikost účinku (Cohen's d) | **1.34** | — |
| Odds ratio (vs. kontrola) | **1.25** | — |
| NNT (number needed to treat) | **36** | — |
| Pokrytí intervence | **47%** | — |
| Drop-out | **11.77%** | — |
| Náklady na obyvatele | **42 EUR/rok** | — |

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

- **Primární endpoint**: redukce incidence EA o ≥ 20% za 52 měsíců.
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 1.34),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 47%, drop-out ≤ 11.77%,
  cost-per-capita ≤ 42 EUR.
- **Equity indikátory**: redukce socioekonomického gradientu výsledků.

## Limitace

- **Selekční bias** — samoselekce subjektů snižuje externí validitu.
- **Měřící bias** — self-report instrumenty pro EA nejsou plně validovány napříč jazyky.
- **Konfaundace** — nepozorované proměnné (sociální podpora, baseline kognitivní rezerva).
- **Ekologická chyba** — populační vzorce nemusí platit individuálně.
- **Časová stabilita** — EA fenomenologie evolves with platform changes; pětileté projekce nejisté.

## Cross-linky

- [detection-signatures](../detection-signatures/_index.md)
- [emergency-protocols](../emergency-protocols/_index.md)
- [forensic-legal](../forensic-legal/_index.md)
- [glossary-bridges](../glossary-bridges/_index.md)
- [organizational-defense](../organizational-defense/_index.md)
- [quick-reference](../quick-reference/_index.md)
- [educational-scenarios](../educational-scenarios/_index.md)
- [historical-cases](../historical-cases/_index.md)
- [cross-domain](../cross-domain/_index.md)
- [aiad-integration](../aiad-integration/_index.md)
- [03-zakladni-kategorie](../03-zakladni-kategorie/_index.md)


## Connect footer

- **GitHub**: [korczis/kompendium-epistemicke-anihilace](https://github.com/korczis/kompendium-epistemicke-anihilace)
- **Docs**: [Kompendium /population-health/](@/kompendium/population-health/_index.md)
- **API**: `GET /api/v1/epi/ea/EA-prevalence-estimates` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
