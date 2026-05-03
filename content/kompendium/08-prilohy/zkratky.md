+++
title = "Zkratky a notace"
description = "Konsolidovaný rejstřík všech zkratek a notačních konvencí používaných v kompendiu — EA, KA, NABLA, NMND, NWB, FLLM a dalších doctrine zkratek platformy Prismatic, plus per-section notační konvence."
weight = 7
sort_by = "weight"

[extra]
kompendium = ["08-prilohy"]
prilohy = ["zkratky", "notace", "konvence"]
section_icon = "🔠"
toc = true
insert_anchor_links = "right"
parent = "kompendium-08-prilohy"
access_level = "L1-L4"
status = "complete"
+++

# Zkratky a notace

> **Konsolidovaný rejstřík všech zkratek a notačních konvencí** používaných v kompendiu a v širším platformovém ekosystému Prismatic. Sjednocuje akronymy doménové (EA, KA), platformové (NMND, NWB, FLLM, ZERO, SEAL atd.) a notační konvence per-section.

## 1. Doménové akronymy

| Zkratka | Plný název (CS) | Plný název (EN) | Lokace |
|---------|-----------------|-----------------|--------|
| **EA** | Epistemická anihilace | Epistemic annihilation | [Glossary](@/glossary/epistemicka-anihilace.md) |
| **KA** | Kognitivní anihilace | Cognitive annihilation | [Glossary](@/glossary/kognitivni-anihilace.md) |
| **OA** | Ontologická anihilace | Ontological annihilation | [Glossary](@/glossary/ontologicka-anihilace.md) |
| **MD** | Metakognitivní destrukce | Metacognitive destruction | [Glossary](@/glossary/metakognitivni-destrukce.md) |
| **EAlien** | Epistemická alienace | Epistemic alienation | [Glossary](@/glossary/epistemicka-alienace.md) |
| **CAR** | Kognitivní anti-rekurzivita | Cognitive anti-recursivity | [Glossary](@/glossary/kognitivni-anti-rekurzivita.md) |
| **AR** | Anankastický režim | Anankastic regime | [Glossary](@/glossary/anankasticky-rezim.md) |

## 2. Notace technik kompendia

### 2.1 Hlavní formát

```
EA-X.Y.Z[-α]
```

| Komponenta | Význam | Doména |
|------------|--------|--------|
| **EA** | Konstantní prefix | Pevné |
| **X** | Kapitola (1–10) | 1, 2, ..., 10 |
| **Y** | Subkategorie (1–9) | 1, 2, ..., 9 |
| **Z** | Specifický fenomén | 1, 2, ..., 99 |
| **α** | Volitelná varianta | a, b, c, ... |

Plná specifikace v [Klasifikačním schématu](@/kompendium/08-prilohy/klasifikace.md).

### 2.2 Příklady

- `EA-1.1.1` — [Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md)
- `EA-5.1.30` — Apoteoza prázdna (Kap. 5)
- `EA-1.4.2-a` — Latentní emocionální modulace, varianta a

## 3. Klinické zkratky

| Zkratka | Plný název | Použití |
|---------|------------|---------|
| **PTSD** | Post-Traumatic Stress Disorder | Diagnóza |
| **C-PTSD** | Complex PTSD | Komplexní trauma |
| **DSM-5** | Diagnostic and Statistical Manual of Mental Disorders, 5th ed. | Klasifikace |
| **ICD-11** | International Classification of Diseases, 11th rev. | Klasifikace |
| **EMDR** | Eye Movement Desensitization and Reprocessing | Terapie |
| **CPT** | Cognitive Processing Therapy | Terapie |
| **CBT** | Cognitive Behavioral Therapy | Terapie |
| **BITE** | Behavior, Information, Thought, Emotional control | Hassanův model → [Diagnostika](@/kompendium/08-prilohy/diagnosticke-nastroje.md) |
| **BFI-2** | Big Five Inventory–2 | Osobnostní dotazník → [Diagnostika](@/kompendium/08-prilohy/diagnosticke-nastroje.md) |
| **ECRI** | Ex-Cult Recovery Instrument | Recovery instrument |
| **IES-R** | Impact of Event Scale–Revised | PTSD screening |
| **DES-II** | Dissociative Experiences Scale–II | Disociace screening |

## 4. Etické a institucionální zkratky

| Zkratka | Plný název | Použití |
|---------|------------|---------|
| **IRB** | Institutional Review Board | Etický komitét → [Etický kodex](@/kompendium/08-prilohy/eticky-kodex.md) |
| **APA** | American Psychological Association | Etické standardy |
| **WMA** | World Medical Association | Helsinská deklarace |
| **CIOMS** | Council for International Organizations of Medical Sciences | Mezinárodní guidelines |
| **GDPR** | General Data Protection Regulation (EU 2016/679) | Datová ochrana |
| **COI** | Conflict of Interest | Disclosure |
| **DSMB** | Data Safety Monitoring Board | Monitoring rizikových studií |

## 5. Platformové doctrine zkratky (Prismatic)

Kompendium operuje uvnitř širšího platformového ekosystému Prismatic, který je řízen **18-pillar doctrine**. Zkratky uvedené níže jsou **operativní zkratky platformy**, ne kompendia samotného, ale objevují se v cross-referencích a v citacích.

| Zkratka | Plný název | Doména |
|---------|------------|--------|
| **3NL** | Three-Nested-Loops (L1+L2+L3) | Architektura |
| **NMND** | No Mercy, No Doubts | Execution discipline |
| **NWB** | No Way Back | Permanence |
| **FLLM** | Flowbite LLM (CSS hygiene) | UI design |
| **M5M** | Max 5 Minutes | Granular execution |
| **NCLB** | No Claim Left Behind | Evidence integrity |
| **TACH** | Total Assurance Comprehensive Hardened | Testing |
| **ZERO** | Zero Error Runtime Operations | Runtime safety |
| **PERF** | Performance Engineering Runtime Fence | Performance |
| **SEAL** | Security Enforcement Absolute Lock | Security |
| **DEPS** | Dependency Engineering Protection Standard | Dependencies |
| **DOCS** | Documentation Omnipresent Comprehensive Standard | Documentation |
| **OTEL** | Observability Telemetry Enforcement Layer | Telemetry |
| **GITL** | GitLab Integration & Traceability Linkage | Traceability |
| **KNOW** | Knowledge Coverage | Glossary |
| **RDME** | README enforcement | Repo hygiene |
| **NLLB** | No Link Left Behind | Link integrity |
| **HYGIENE** | Repository hygiene | Repo cleanliness |

> Plný popis viz [hlavní CLAUDE.md](https://github.com/korczis/prismatic-platform/blob/main/CLAUDE.md).

## 6. Platformové kapacity

| Zkratka | Plný název | Funkce |
|---------|------------|--------|
| **NABLA** | NABLA Infinity (∇∞) | Epistemic framework L0–L13 → [Glossary](@/glossary/nabla-infinity.md) |
| **AIAD** | AI-Augmented Development | Standardní rámec → [AIAD README](https://github.com/korczis/prismatic-platform/blob/main/.aiad/README.md) |
| **DD** | Due Diligence | Modul pro investigativní práci → {{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }} |
| **OSINT** | Open Source Intelligence | Adapter framework |
| **EASM** | External Attack Surface Management | Perimeter modul |
| **SEADF** | Self-Evolving Autonomous Development Framework | Evolution |
| **MCP** | Model Context Protocol | Tool exposure |

## 7. Per-section notační konvence

### Sekce 01 — Předmluva

Bez specifické notace; používá běžné citační formáty.

### Sekce 02 — Úvod

| Notace | Význam |
|--------|--------|
| **§ X.Y** | Odkaz na podsekci |
| *italika* | Zavedení nového termínu |
| **bold** | Zdůraznění |

### Sekce 03 — Základní kategorie

Notace EA-X.Y.Z plně zavedena. Tabulky obsahují sloupce: **Kód**, **Název**, **Riziko**, **Reverzibilita**, **Status publikace**.

### Sekce 04 — Terminální protokoly

Doplňková notace pro **sekvence**:

```
SEQ-N: EA-A → EA-B → EA-C
```

kde N je číslo protokolu a EA-A/B/C jsou jednotlivé techniky tvořící sekvenci.

### Sekce 05 — Ultramární techniky

Doplňková notace pro **úrovně rozpadu**:

| Úroveň | Doména rozpadu |
|--------|----------------|
| **L-S** | Sémantická (význam) |
| **L-N** | Narativní (vyprávění) |
| **L-I** | Identitární (já) |
| **L-O** | Ontologická (bytí) |
| **L-T** | Transcendentní (smysl) |

### Sekce 06 — Klinické aplikace

Notace pro **diagnostické markery**:

```
M-X.Y: <popis markeru>  (sensitivita: a, specificita: b)
```

### Sekce 07 — Teoretické reflexe

Filozofická notace bez specifických zkratek; využívá tradiční citační konvence (autor, rok).

### Sekce 08 — Přílohy

| Notace | Význam |
|--------|--------|
| **§N.M** | Odkaz na bod kodexu / sekci |
| **κ** | Cohenova kappa (inter-rater agreement) |
| **k-anonymity** | Datová pseudonymizace |

## 8. Citační konvence

Kompendium používá **modifikovaný APA 7. styl**:

- **In-text**: (Autor, rok)
- **Bibliografie**: tematicky seskupená, ne abecedně.
- **Filozofické klasiky**: rok prvního vydání + rok edice použité.
- **Cross-reference uvnitř kompendia**: Markdown odkazy na relativní cesty.

## 9. URL konvence

| Pattern | Použití |
|---------|---------|
| `/kompendium/<sekce>/` | Sekce kompendia |
| `/kompendium/techniques/ea-X-Y-Z-<slug>/` | Per-technique článek |
| `/kompendium/08-prilohy/<slug>/` | Přílohy sekce 08 |
| `/glossary/<slug>/` | Glosářové heslo |
| `/philosophy/<slug>/` | Filozofická vrstva |
| `/hub/dd/decisions/` | Decision Engine |

## 10. Status značky

| Značka | Význam |
|--------|--------|
| `✓ kompletní` | Plně publikovaný a recenzovaný obsah |
| `⏳ příprava` | Práce v rozpracovanosti |
| `🔒 omezený` | Vyžaduje úroveň přístupu L2+ |
| `⚠️ rizikový` | Obsahuje materiál vyšší citlivosti |

## Cross-referencing s dalšími přílohami

- [Bibliografie](@/kompendium/08-prilohy/bibliografie.md) — citační konvence v kontextu primární literatury.
- [Rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md) — operativní použití EA notace.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) — bilingvní mapování zkratek.
- [Diagnostické nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md) — klinické zkratky v kontextu.
- [Etický kodex](@/kompendium/08-prilohy/eticky-kodex.md) — institucionální zkratky.
- [Klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) — meta-úroveň notace.

## Platformový kontext

- [CLAUDE.md](https://github.com/korczis/prismatic-platform/blob/main/CLAUDE.md) — kanonický zdroj 18-pillar doctrine zkratek.
- [Glossary](@/glossary/_index.md) — všechny domain zkratky mají glosářová hesla.
- [NABLA Infinity](@/glossary/nabla-infinity.md) — epistemic framework.
- [3NL](@/glossary/three-nested-loops.md) — architektura platformy.
- [Color Teams](@/glossary/color-teams.md) — Red/Blue/Purple/Green týmy.
- {{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }} — operativní použití DD zkratky.


## ⚡ Kritický krok

**Tato příloha je referenční nástroj** — není k četbě od začátku do konce.
Místo lineární četby:

1. Identifikuj **konkrétní termín / techniku / nástroj**, který právě potřebuješ
2. Použij vyhledávání (Cmd+F / Ctrl+F) v této stránce
3. Pokud nenajdeš, zkontroluj [glossary](@/glossary/_index.md) a [rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md)

> **Mandatorní akce**: použití přílohy bez konkrétní otázky je obvykle
> formou prokrastinace. Definuj si nejprve, **co hledáš**, teprve pak
> otevři přílohu.

## 🔗 Křížové odkazy

### V této sekci

- [Bibliografie a primární literatura](@/kompendium/08-prilohy/bibliografie.md)
- [Diagnostické dotazníky a nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md)
- [Etický kodex výzkumníka EA](@/kompendium/08-prilohy/eticky-kodex.md)
- [Index pojmů (CS-EN bilingual)](@/kompendium/08-prilohy/index-pojmu.md)
- [Klasifikační schéma a taxonomie — meta-úroveň](@/kompendium/08-prilohy/klasifikace.md)

### Klíčové orientační body

- [Hub kompendia](@/kompendium/_index.md) — návrat na úvodní rozcestník
- [Glossary](@/glossary/_index.md) — terminologický slovník
- [Bibliografie](@/kompendium/08-prilohy/bibliografie.md) — primární zdroje
- [Etický kodex](@/kompendium/08-prilohy/eticky-kodex.md) — povinné rámce použití

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Hub kompendia](@/kompendium/_index.md) | [Přílohy](@/kompendium/08-prilohy/_index.md) | [Glossary](@/glossary/_index.md) | [Philosophy](@/philosophy/_index.md) | [Developer Portal](@/developers/_index.md)
