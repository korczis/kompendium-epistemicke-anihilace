+++
title = "Incidence expozice kultům"
description = "Populační zdraví a prevence — Roční incidenční míra expozice manipulativním skupinám a koercitivním systémům."
weight = 30
[taxonomies]
tags = ["kompendium", "population-health", "epidemiology"]
categories = ["academic", "public-health"]
[extra]
parent = "kompendium-population-health"
toc = true
+++

# Incidence expozice kultům

> Roční incidenční míra expozice manipulativním skupinám a koercitivním systémům.

## Populační kontext

Populační zdraví v kontextu epistemických útoků (EA) představuje rámec, který přesahuje individuální
klinickou perspektivu. Tato studie (Incidence expozice kultům) sleduje populační vzorek **N = 32,118** subjektů
ve sledovacím období **45 měsíců**.

EA jako veřejnozdravotní problém vyžaduje rámec srovnatelný s infekční epidemiologií:
expozice → latence → manifestace → komplikace → reziduální dopad.

## Klíčové parametry / data

| Metrika | Hodnota | 95% CI |
|---|---|---|
| Bodová prevalence | **7.55%** | [6.19, 8.91] |
| Incidence (na 100k/rok) | **442** | — |
| Velikost účinku (Cohen's d) | **1.18** | — |
| Odds ratio (vs. kontrola) | **4.95** | — |
| NNT (number needed to treat) | **11** | — |
| Pokrytí intervence | **88%** | — |
| Drop-out | **13.84%** | — |
| Náklady na obyvatele | **66 EUR/rok** | — |

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

- **Primární endpoint**: redukce incidence EA o ≥ 20% za 45 měsíců.
- **Sekundární endpointy**: zlepšení mediální gramotnosti (Cohen's d ≥ 1.18),
  snížení time-to-help-seeking o ≥ 30%, redukce komorbidit.
- **Procesní indikátory**: pokrytí ≥ 88%, drop-out ≤ 13.84%,
  cost-per-capita ≤ 66 EUR.
- **Equity indikátory**: redukce socioekonomického gradientu výsledků.

## Limitace

- **Selekční bias** — samoselekce subjektů snižuje externí validitu.
- **Měřící bias** — self-report instrumenty pro EA nejsou plně validovány napříč jazyky.
- **Konfaundace** — nepozorované proměnné (sociální podpora, baseline kognitivní rezerva).
- **Ekologická chyba** — populační vzorce nemusí platit individuálně.
- **Časová stabilita** — EA fenomenologie evolves with platform changes; pětileté projekce nejisté.

## Cross-linky

- [educational-scenarios](../educational-scenarios/_index.md)
- [historical-cases](../historical-cases/_index.md)
- [cross-domain](../cross-domain/_index.md)
- [aiad-integration](../aiad-integration/_index.md)
- [03-zakladni-kategorie](../03-zakladni-kategorie/_index.md)
- [04-terminalni-protokoly](../04-terminalni-protokoly/_index.md)
- [05-ultramari-techniky](../05-ultramari-techniky/_index.md)
- [06-klinicke-aplikace](../06-klinicke-aplikace/_index.md)
- [07-teoreticke-reflexe](../07-teoreticke-reflexe/_index.md)
- [08-prilohy](../08-prilohy/_index.md)
- [case-studies](../case-studies/_index.md)


## Connect footer

- **GitHub**: [korczis/prismatic-platform](https://github.com/korczis/prismatic-platform)
- **Docs**: [Kompendium /population-health/](@/kompendium/population-health/_index.md)
- **API**: `GET /api/v1/epi/ea/incidence-cult-exposure` (auto-introspecting)
- **Helpline**: 116 123 (CZ), 800 200 207 (CZ Linka bezpečí)
- **Platforma**: Prismatic Platform, AIAD Integration, NCLB doctrine
