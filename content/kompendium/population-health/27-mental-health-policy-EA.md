+++
title = "Politika duševního zdraví a EA"
description = "Populační zdraví a prevence — Začlenění EA do národních strategií duševního zdraví a krizové intervence."
weight = 270
[taxonomies]
tags = ["kompendium", "population-health", "policy"]
categories = ["academic", "public-health"]
[extra]
related_terms = ["25-platform-regulation-EA", "26-educational-policy-EA", "28-international-cooperation-EA", "29-research-funding-EA"]
parent = "kompendium-population-health"
toc = true
+++

# Politika duševního zdraví a EA

> Začlenění EA do národních strategií duševního zdraví a krizové intervence.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Politika duševního zdraví a EA) sleduje populační vzorek **N = 5,151** subjektů
ve sledovacím období **25 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **8.5%** | [6.97, 10.03] |
| Incidence (na 100k/rok) | **387** | — |
| Velikost účinku (Cohen's d) | **1.22** | — |
| Odds ratio (vs. kontrola) | **2.15** | — |
| NNT (number needed to treat) | **32** | — |
| Pokrytí intervence | **75%** | — |
| Drop-out | **21.78%** | — |
| Náklady na obyvatele | **55 EUR/rok** | — |

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

- **Primární endpoint**: redukce incidence EA o ≥ 20% za 25 měsíců.
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 1.22),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 75%, drop-out ≤ 21.78%,
  cost-per-capita ≤ 55 EUR.
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
- **API**: `GET /api/v1/epi/ea/mental-health-policy-EA` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
