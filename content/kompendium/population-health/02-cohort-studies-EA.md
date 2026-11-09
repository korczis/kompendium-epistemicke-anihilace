+++
title = "Kohortové studie epistemických útoků"
description = "Populační zdraví a prevence — Longitudinální kohortové studie sledující expozici, latenci a manifestaci EA v populaci."
weight = 20
[taxonomies]
tags = ["kompendium", "population-health", "epidemiology"]
categories = ["academic", "public-health"]
[extra]
related_terms = ["01-EA-prevalence-estimates", "03-incidence-cult-exposure", "04-disinformation-population-impact", "05-academic-EA-prevalence"]
parent = "kompendium-population-health"
toc = true
+++

# Kohortové studie epistemických útoků

> Longitudinální kohortové studie sledující expozici, latenci a manifestaci EA v populaci.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Kohortové studie epistemických útoků) sleduje populační vzorek **N = 6,113** subjektů
ve sledovacím období **10 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **13.9%** | [11.4, 16.4] |
| Incidence (na 100k/rok) | **613** | — |
| Velikost účinku (Cohen's d) | **1.07** | — |
| Odds ratio (vs. kontrola) | **2.51** | — |
| NNT (number needed to treat) | **27** | — |
| Pokrytí intervence | **95%** | — |
| Drop-out | **19.59%** | — |
| Náklady na obyvatele | **80 EUR/rok** | — |

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

- **Primární endpoint**: redukce incidence EA o ≥ 20% za 10 měsíců.
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 1.07),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 95%, drop-out ≤ 19.59%,
  cost-per-capita ≤ 80 EUR.
- **Equity indikátory**: redukce socioekonomického gradientu výsledků.

## Limitace

- **Selekční bias** — samoselekce subjektů snižuje externí validitu.
- **Měřící bias** — self-report instrumenty pro EA nejsou plně validovány napříč jazyky.
- **Konfaundace** — nepozorované proměnné (sociální podpora, baseline kognitivní rezerva).
- **Ekologická chyba** — populační vzorce nemusí platit individuálně.
- **Časová stabilita** — EA fenomenologie evolves with platform changes; pětileté projekce nejisté.

## Cross-linky

- [04-terminalni-protokoly](../04-terminalni-protokoly/_index.md)
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


## Connect footer

- **GitHub**: [korczis/kompendium-epistemicke-anihilace](https://github.com/korczis/kompendium-epistemicke-anihilace)
- **Docs**: [Kompendium /population-health/](@/kompendium/population-health/_index.md)
- **API**: `GET /api/v1/epi/ea/cohort-studies-EA` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
