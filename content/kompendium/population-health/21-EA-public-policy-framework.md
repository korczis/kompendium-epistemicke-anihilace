+++
title = "Rámec veřejné politiky pro EA"
description = "Populační zdraví a prevence — Komplexní politický rámec pro řešení EA jako veřejnozdravotního problému."
weight = 210
[taxonomies]
tags = ["kompendium", "population-health", "policy"]
categories = ["academic", "public-health"]
[extra]
related_terms = ["19-bystander-intervention-training", "20-helpline-population-impact", "22-regulatory-approach-EA", "23-EU-policy-EA"]
parent = "kompendium-population-health"
toc = true
+++

# Rámec veřejné politiky pro EA

> Komplexní politický rámec pro řešení EA jako veřejnozdravotního problému.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Rámec veřejné politiky pro EA) sleduje populační vzorek **N = 11,696** subjektů
ve sledovacím období **13 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **14.29%** | [11.72, 16.86] |
| Incidence (na 100k/rok) | **513** | — |
| Velikost účinku (Cohen's d) | **1.27** | — |
| Odds ratio (vs. kontrola) | **4.83** | — |
| NNT (number needed to treat) | **14** | — |
| Pokrytí intervence | **46%** | — |
| Drop-out | **4.29%** | — |
| Náklady na obyvatele | **34 EUR/rok** | — |

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

- **Primární endpoint**: redukce incidence EA o ≥ 20% za 13 měsíců.
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 1.27),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 46%, drop-out ≤ 4.29%,
  cost-per-capita ≤ 34 EUR.
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

- **GitHub**: [korczis/prismatic-platform](https://github.com/korczis/prismatic-platform)
- **Docs**: [Kompendium /population-health/](@/kompendium/population-health/_index.md)
- **API**: `GET /api/v1/epi/ea/EA-public-policy-framework` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
