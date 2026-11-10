+++
title = "Anonymizace EA Výzkumných Dat"
description = "Výzkumná metodologie EA — anonymizace ea výzkumných dat."
weight = 34

[taxonomies]
tags = ["kompendium", "research-methodology", "ethics"]
categories = ["academic", "methodology", "research"]

[extra]
related_terms = ["IRB-protocol-design-EA", "RCT-EA-considerations", "case-study-design-EA", "causal-inference-EA"]
parent = "kompendium-research-methodology"
toc = true
+++

## Metodologický kontext

Tento článek pokrývá **Anonymizace EA Výzkumných Dat** v rámci etické a governanceho výzkumu Ego-Annihilation procesů. EA výzkum stojí na rozhraní klinické psychologie, fenomenologie a bezpečnostně-etické governance — žádný jednotlivý paradigma nestačí. Metodologická pluralita je nutná, ale vyžaduje rigorózní disciplínu v každé z dimenzí.

**Specifický metodologický háček EA výzkumu:** K-anonymity ≥ 5, l-diversity ≥ 3, t-closeness pro citlivé atributy. Removal of direct + quasi-identifiers. Differential privacy pro agregované statistiky. Re-identification risk audit.

EA výzkumník nesmí redukovat fenomén na pouhý měřitelný behavior, ani naopak utopit data v interpretativní mlze. Cílem je **triangulační konvergence** mezi behaviorálními markery, subjektivním prožitkem a strukturálními invarianty deformace ega.

## Klíčové principy

1. **Konstruktová validita má přednost** — EA fenomény jsou neostře definované, špatně operacionalizované measure devalvují celou studii.
2. **Pre-registrace povinná** — bez OSF/AsPredicted protokolu otevíráte dveře HARKing a p-hackingu.
3. **Dvojitá triangulace** — minimálně 3 zdroje dat ([self-report](@/glossary/self-report.md), behavioral, physiological/observational).
4. **Reflexivita explicitní** — výzkumník není neutrální nástroj, jeho pozice formuje data.
5. **Etický gating na prvním místě** — žádná data nejsou dost cenná, aby ospravedlnila neetický design.
6. **Replikovatelnost build-in** — kód, data (anonymizovaná), materiály do veřejného repozitáře.

## Procedurální postup

**Fáze 1 — Příprava (4-12 týdnů)**

- Literature review s PRISMA flow chart
- Pre-registrace na OSF (hypotézy, design, analýza uzamčeny)
- IRB submission + amendments
- Pilot study (n=10-30) pro feasibility a item refinement

**Fáze 2 — Sběr dat (variabilní)**

- Strict protocol adherence — deviations log povinný
- Real-time data quality checks (missingness, výpadky)
- Periodic safety review (DSMB pro intervenční studie)

**Fáze 3 — Analýza (4-8 týdnů)**

- Pre-registered analysis first, exploratory analyses jasně označené
- Sensitivity analyses (alternative model specifications)
- Multiple comparison correction (Bonferroni/FDR/Holm)

**Fáze 4 — Reporting (4-12 týdnů)**

- CONSORT/STROBE/COREQ checklist dle designu
- Open materials/data/code (FAIR principles)
- Limitations sekce explicitní, ne defenzivní

## Riziková místa

- **Selection bias** — kdo se hlásí na EA výzkum není reprezentativní vzorek populace.
- **Demand characteristics** — participanti tuší, co výzkumník chce, a chovají se podle toho.
- **Researcher allegiance effect** — přesvědčení výzkumníka o efektu inflatuje pozorovaný účinek.
- **Attrition selectivní** — kdo odejde ze studie není random podmnožina, vytváří survivorship bias.
- **Construct drift** — operacionalizace EA pojmu se mezi studiemi liší, brání meta-analýze.
- **Ethical creep** — postupné rozšiřování invazivnosti bez re-konzultace s IRB.

## Best practices

1. **Multi-method assessment** — žádný jednotlivý nástroj nezachytí EA fenomén kompletně.
2. **Standardizované administrace** — videozáznam pro inter-rater reliability check.
3. **Blinding kdekoliv to jde** — účastník vůči podmínce, hodnotitel vůči hypotéze.
4. **Manipulation checks** — ověřte, že intervence skutečně manipulovala, co jste zamýšleli.
5. **Effect size + CI** — p-hodnoty samotné nestačí, hlaste velikost účinku s 95% CI.
6. **Data audit trail** — každá transformace dat dokumentovaná, reprodukovatelná skript.
7. **Independent replication budget** — alokujte prostředky na nezávislou replikaci klíčových nálezů.

## Validační kritéria

| Kritérium | Minimální standard |
|-----------|-------------------|
| Pre-registrace | OSF/AsPredicted před sběrem dat |
| IRB approval | Aktivní, s amendments dokumentovanými |
| Sample size | [A priori](@/glossary/apriori.md) power analysis, n ≥ vypočtené |
| Reliability | α ≥ 0.70, ICC ≥ 0.75 pro kontinuální measures |
| Validity | Konvergentní + diskriminantní evidence |
| Transparency | Materials, data (anonym.), code veřejně |
| Ethical compliance | Helsinki + Belmont + lokální regulace |
| Reporting | CONSORT/STROBE/COREQ checklist |

## Cross-linky

- [Etický rámec EA výzkumu](@/kompendium/07-teoreticke-reflexe/_index.md)
- [IRB protokol design](@/kompendium/research-methodology/IRB-protocol-design-EA.md)
- [Informovaný souhlas v EA výzkumu](@/kompendium/research-methodology/informed-consent-EA-research.md)
- [Anonymizace dat](@/kompendium/research-methodology/anonymization-EA-research.md)
- [Pre-registrace](@/kompendium/research-methodology/pre-registration-EA-research.md)
- [Power analysis](https://prismatic-reality-com.github.io/prismatic-promo/kompendium/research-methodology/power-analysis-EA-research/)
- [Effect size](@/kompendium/research-methodology/effect-size-EA.md)
- [Mixed methods design](@/kompendium/research-methodology/mixed-methods-EA.md)
- [Replikační výzkum](@/kompendium/research-methodology/replication-EA-research.md)
- [Glossary — výzkumné termíny](@/glossary/_index.md)
- [Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md)
- [Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md)

---

## Connect

**Sekce**: [Research Methodology Index](@/kompendium/research-methodology/_index.md) | **Bucket**: etické a governance metody | **Kompendium**: [Index](@/kompendium/_index.md)

**Související domény**: Klinická psychologie · Fenomenologie · Výzkumná etika · Statistická metodologie · Bezpečnostní governance
