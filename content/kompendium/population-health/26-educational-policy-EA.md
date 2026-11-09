+++
title = "Vzdělávací politika a EA"
description = "Populační zdraví a prevence — Národní strategie vzdělávání včleňující epistemickou hygienu a kritické myšlení."
weight = 260
[taxonomies]
tags = ["kompendium", "population-health", "policy"]
categories = ["academic", "public-health"]
[extra]
related_terms = ["24-WHO-EA-framework", "25-platform-regulation-EA", "27-mental-health-policy-EA", "28-international-cooperation-EA"]
parent = "kompendium-population-health"
toc = true
+++

# Vzdělávací politika a EA

> Národní strategie vzdělávání včleňující epistemickou hygienu a kritické myšlení.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Vzdělávací politika a EA) sleduje populační vzorek **N = 25,531** subjektů
ve sledovacím období **52 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **17.03%** | [13.96, 20.1] |
| Incidence (na 100k/rok) | **215** | — |
| Velikost účinku (Cohen's d) | **1.48** | — |
| Odds ratio (vs. kontrola) | **3.57** | — |
| NNT (number needed to treat) | **38** | — |
| Pokrytí intervence | **61%** | — |
| Drop-out | **20.88%** | — |
| Náklady na obyvatele | **35 EUR/rok** | — |

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

- **Primární endpoint**: redukce incidence EA o ≥ 20% za 52 měsíců.
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 1.48),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 61%, drop-out ≤ 20.88%,
  cost-per-capita ≤ 35 EUR.
- **Equity indikátory**: redukce socioekonomického gradientu výsledků.

## Limitace

- **Selekční bias** — samoselekce subjektů snižuje externí validitu.
- **Měřící bias** — self-report instrumenty pro EA nejsou plně validovány napříč jazyky.
- **Konfaundace** — nepozorované proměnné (sociální podpora, baseline kognitivní rezerva).
- **Ekologická chyba** — populační vzorce nemusí platit individuálně.
- **Časová stabilita** — EA fenomenologie evolves with platform changes; pětileté projekce nejisté.

## Cross-linky

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
- [educational-scenarios](../educational-scenarios/_index.md)


## Connect footer

- **GitHub**: [korczis/kompendium-epistemicke-anihilace](https://github.com/korczis/kompendium-epistemicke-anihilace)
- **Docs**: [Kompendium /population-health/](@/kompendium/population-health/_index.md)
- **API**: `GET /api/v1/epi/ea/educational-policy-EA` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
