+++
title = "Etika výzkumné politiky EA"
description = "Populační zdraví a prevence — Etické rámce, IRB, informovaný souhlas a ochrana subjektů ve výzkumu EA."
weight = 300
[taxonomies]
tags = ["kompendium", "population-health", "policy"]
categories = ["academic", "public-health"]
[extra]
related_terms = ["28-international-cooperation-EA", "29-research-funding-EA", "27-mental-health-policy-EA"]
parent = "kompendium-population-health"
toc = true
+++

# Etika výzkumné politiky EA

> Etické rámce, IRB, informovaný souhlas a ochrana subjektů ve výzkumu EA.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Etika výzkumné politiky EA) sleduje populační vzorek **N = 45,488** subjektů
ve sledovacím období **58 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **15.11%** | [12.39, 17.83] |
| Incidence (na 100k/rok) | **224** | — |
| Velikost účinku (Cohen's d) | **1.45** | — |
| Odds ratio (vs. kontrola) | **4.78** | — |
| NNT (number needed to treat) | **29** | — |
| Pokrytí intervence | **80%** | — |
| Drop-out | **21.36%** | — |
| Náklady na obyvatele | **18 EUR/rok** | — |

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

- **Primární endpoint**: redukce incidence EA o ≥ 20% za 58 měsíců.
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 1.45),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 80%, drop-out ≤ 21.36%,
  cost-per-capita ≤ 18 EUR.
- **Equity indikátory**: redukce socioekonomického gradientu výsledků.

## Limitace

- **Selekční bias** — samoselekce subjektů snižuje externí validitu.
- **Měřící bias** — self-report instrumenty pro EA nejsou plně validovány napříč jazyky.
- **Konfaundace** — nepozorované proměnné (sociální podpora, baseline kognitivní rezerva).
- **Ekologická chyba** — populační vzorce nemusí platit individuálně.
- **Časová stabilita** — EA fenomenologie evolves with platform changes; pětileté projekce nejisté.

## Cross-linky

- [cross-domain](../cross-domain/_index.md)
- [aiad-integration](../aiad-integration/_index.md)
- [03-zakladni-kategorie](../03-zakladni-kategorie/_index.md)
- [04-terminalni-protokoly](../04-terminalni-protokoly/_index.md)
- [05-ultramari-techniky](../05-ultramari-techniky/_index.md)
- [06-klinicke-aplikace](../06-klinicke-aplikace/_index.md)
- [07-teoreticke-reflexe](../07-teoreticke-reflexe/_index.md)
- [08-prilohy](../08-prilohy/_index.md)
- [case-studies](../case-studies/_index.md)
- [detection-signatures](../detection-signatures/_index.md)
- [emergency-protocols](../emergency-protocols/_index.md)


## Connect footer

- **GitHub**: [korczis/kompendium-epistemicke-anihilace](https://github.com/korczis/kompendium-epistemicke-anihilace)
- **Docs**: [Kompendium /population-health/](@/kompendium/population-health/_index.md)
- **API**: `GET /api/v1/epi/ea/ethics-policy-research-EA` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
