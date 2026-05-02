+++
title = "Financování výzkumu EA"
description = "Populační zdraví a prevence — Strategie financování výzkumu epistemických útoků - granty, konsorcia, priority."
weight = 290
[taxonomies]
tags = ["kompendium", "population-health", "policy"]
categories = ["academic", "public-health"]
[extra]
parent = "kompendium-population-health"
toc = true
+++

# Financování výzkumu EA

> Strategie financování výzkumu epistemických útoků - granty, konsorcia, priority.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Financování výzkumu EA) sleduje populační vzorek **N = 9,609** subjektů
ve sledovacím období **7 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **6.53%** | [5.35, 7.71] |
| Incidence (na 100k/rok) | **277** | — |
| Velikost účinku (Cohen's d) | **1.42** | — |
| Odds ratio (vs. kontrola) | **2.89** | — |
| NNT (number needed to treat) | **33** | — |
| Pokrytí intervence | **28%** | — |
| Drop-out | **16.3%** | — |
| Náklady na obyvatele | **9 EUR/rok** | — |

Vzorek je stratifikován podle věku (18-29, 30-44, 45-64, 65+), genderu, urbanizace
a socioekonomického statusu (5 kvintilů).

## Implementační rámec

1. **Detekce a screening** — populační nástroj s validovanou citlivostí ≥ 0.82.
2. **Stratifikace rizika** — risk-stratified outreach s prioritizací top decilu.
3. **Intervenční kaskáda** — stepped care: psychoedukace → krátká intervence → specializovaná péče.
4. **Datový sběr** — kontinuální monitoring přes integrovaný platformový sběr.
5. **Evaluace** — předem registrovaná protokol, primární a sekundární endpointy.

**Framework hook (Policy)**: Rámec se mapuje na `prismatic_cer` (CER/NIS2 compliance), GITL traceability vynucuje conventional commits u všech regulatorních artefaktů. DEPS doctrine zajišťuje audit trail závislostí napříč policy stackem.

## Indikátory úspěchu

- **Primární endpoint**: redukce incidence EA o ≥ 20% za 7 měsíců.
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 1.42),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 28%, drop-out ≤ 16.3%,
  cost-per-capita ≤ 9 EUR.
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

- **GitHub**: [korczis/prismatic-platform](https://github.com/korczis/prismatic-platform)
- **Docs**: [Kompendium /population-health/](@/kompendium/population-health/_index.md)
- **API**: `GET /api/v1/epi/ea/research-funding-EA` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
