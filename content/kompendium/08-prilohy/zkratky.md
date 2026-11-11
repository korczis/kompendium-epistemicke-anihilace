+++
title = "Zkratky a notace"
description = "Konsolidovaný rejstřík všech zkratek a notačních konvencí používaných v kompendiu — doménové akronymy, klinické a institucionální zkratky a per-section notační konvence."
weight = 7
sort_by = "weight"

[taxonomies]
tags = ["kompendium", "08-prilohy"]

[extra]
related_terms = ["klasifikace", "rejstrik-technik", "index-pojmu"]
kompendium = ["08-prilohy"]
prilohy = ["zkratky", "notace", "konvence"]
section_icon = "🔠"
toc = true
insert_anchor_links = "right"
access_level = "L1-L4"
status = "complete"
+++

# Zkratky a notace

> **Konsolidovaný rejstřík všech zkratek a notačních konvencí** používaných v kompendiu. Sjednocuje doménové akronymy (EA, KA), klinické a institucionální zkratky a notační konvence per-section.

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
| **X** | Kapitola (1–10) | 1, 2, …, 10 |
| **Y** | Subkategorie (1–9) | 1, 2, …, 9 |
| **Z** | Specifický fenomén | 1, 2, …, 99 |
| **α** | Volitelná varianta | a, b, c, … |

Plná specifikace v [Klasifikačním schématu](@/kompendium/08-prilohy/klasifikace.md).

### 2.2 Příklady

- `EA-1.1.1` — [Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md)
- `EA-5.1.30` — Apoteoza prázdna (Kap. 5)
- `EA-1.4.2-a` — Latentní emocionální modulace, varianta a

## 3. Klinické zkratky

| Zkratka | Plný název | Použití |
|---------|------------|---------|
| **PTSD** | Post-Traumatic Stress Disorder | Diagnóza |
| **C-PTSD** | Complex PTSD | [Komplexní trauma](@/glossary/complex-trauma.md) |
| **DSM-5** | Diagnostic and Statistical Manual of Mental Disorders, 5th ed. | Klasifikace |
| **ICD-11** | International Classification of Diseases, 11th rev. | Klasifikace |
| **EMDR** | Eye Movement Desensitization and Reprocessing | Terapie |
| **CPT** | Cognitive Processing Therapy | Terapie |
| **CBT** | Cognitive Behavioral Therapy | Terapie |
| **BITE** | Behavior, Information, Thought, Emotional control | Hassanův model → [Diagnostika](@/kompendium/08-prilohy/diagnosticke-nastroje.md) |
| **BFI-2** | Big Five Inventory–2 | Osobnostní dotazník → [Diagnostika](@/kompendium/08-prilohy/diagnosticke-nastroje.md) |
| **ECRI** | Ex-Cult Recovery Instrument | Recovery instrument |
| **IES-R** | Impact of Event Scale–Revised | PTSD screening |
| **DES-II** | Dissociative Experiences Scale–II | [Disociace](@/glossary/disociace.md) screening |

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

## 5. Per-section notační konvence

### Sekce 01 — Předmluva

Bez specifické notace; používá běžné citační formáty.

### Sekce 02 — Úvod

| Notace | Význam |
|--------|--------|
| **§ X.Y** | Odkaz na podsekci |
| *italika* | Zavedení nového termínu |
| **bold** | Zdůraznění |

### Sekce 03 — Základní kategorie

Notace EA-X.Y.Z plně zavedena. Tabulky obsahují sloupce: **Kód**, **Název**, Riziko, **Reverzibilita**, **Status publikace**.

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

## 6. Citační konvence

Kompendium používá **modifikovaný APA 7. styl**:

- **In-text**: (Autor, rok)
- **Bibliografie**: tematicky seskupená, ne abecedně.
- **Filozofické klasiky**: rok prvního vydání + rok edice použité.
- **Cross-reference uvnitř kompendia**: Markdown odkazy na relativní cesty.

Od listopadu 2026 platí pro odborné stránky knihy přísnější podoba této konvence. Každý podstatný odstavec se opírá o odkaz v podobě autor–rok, například (Herman 1992), na dílo, o jehož existenci a obsahu není pochyb, a stránka končí oddílem **Literatura** před oddílem **Související**. Kde jistý zdroj chybí, odstavec zůstává bez citace a myšlenka se uvádí jako výklad autora; vymyšlený nebo nejistý odkaz je vždy horší než žádný. Výčty se používají jen tam, kde jde o skutečný výčet – kroky protokolu, kontakty krizových služeb, seznamy odkazů –, ostatní obsah se píše souvislým textem. Citovanou literaturu ze všech stránek shromažďuje generovaný [přehled literatury](@/references.md).

### 6.1 Sigla filosofických klasiků

U děl, která se citují po desetiletí v různých vydáních a překladech, se v odborné literatuře užívají ustálená sigla: odkazuje se na místo v samotném textu, ne na stránku jedné edice, takže údaj zůstává ověřitelný napříč vydáními a jazyky. Kompendium tuto zvyklost přejímá u autorů, jimž věnuje samostatné stránky oddílu 07.

| Sigla | Dílo | Způsob odkazu |
|---|---|---|
| TLP | Wittgenstein, *Tractatus logico-philosophicus* | číslo teze (TLP 5.6) |
| PU (angl. PI) | Wittgenstein, *Philosophische Untersuchungen* | číslo paragrafu (PU § 201) |
| ÜG | Wittgenstein, *Über Gewissheit* | číslo poznámky (ÜG § 115) |
| KrV | Kant, *Kritik der reinen Vernunft* | paginace prvního a druhého vydání (KrV A 51 / B 75) |

Pravidlo je jediné: sigla se při prvním výskytu na stránce uvede v plném znění a oddíl Literatura doplní vydání, z něhož se cituje. Zkratka, jejíž rozpis čtenář na téže stránce nenajde, je chybou stránky, nikoli nedostatkem čtenáře.

## 7. URL konvence

| Pattern | Použití |
|---------|---------|
| `/kompendium/<sekce>/` | Sekce kompendia |
| `/kompendium/techniques/ea-X-Y-Z-<slug>/` | Per-technique článek |
| `/kompendium/08-prilohy/<slug>/` | Přílohy sekce 08 |
| `/glossary/<slug>/` | Glosářové heslo |
| `/philosophy/<slug>/` | Filozofická vrstva |

## 8. Status značky

| Značka | Význam |
|--------|--------|
| `✓ kompletní` | Plně publikovaný a recenzovaný obsah |
| `⏳ příprava` | Práce v rozpracovanosti |
| `🔒 omezený` | Vyžaduje úroveň přístupu L2+ |
| `⚠️ rizikový` | Obsahuje materiál vyšší citlivosti |

## 9. Zkratka jako nástroj a jako riziko

Rejstřík zkratek není jen pomůcka k rychlému dohledání. Zkratka je zhuštěný pojem, a tím se stává dvojznačným nástrojem: usnadňuje práci těm, kdo její rozpis znají, a současně vytváří hranici mezi nimi a ostatními. Lifton (1961) popsal „zatížený jazyk“ (*[loading the language](@/glossary/loading-the-language.md)*) jako jeden ze znaků myšlenkové reformy: skupina si vytvoří vlastní heslový slovník, jímž nahradí složité skutečnosti krátkými výrazy, a dosáhne tím dvojího — hovor je rychlejší, ale myšlení chudší, protože hesla již obsahují hotové hodnocení. Orwell (1949) tvrdí v doslovu o zásadách newspeaku totéž o složených zkratkách: stažením názvu do jediného slova se odřízne okruh představ, které by plný tvar vyvolal.

Z toho plyne pravidlo, jímž se tato příloha řídí: každá zkratka má v knize uveden plný tvar i místo, kde se pojem zavádí, a kompendium neužívá zkratku, kterou by si čtenář nemohl rozepsat. Zkratky vlastní taxonomie (EA, KA, OA, MD) jsou proto vázány na glosářová hesla, nikoli pouze na tabulku v oddílu 1, a klinické zkratky v oddílu 3 na nástroje, u nichž je uveden autor a rok (například Cohenova κ podle Cohena (1960) nebo model BITE podle Hassana (1988)). Rejstřík má přitom i vlastní mez: o významu zkratky nerozhoduje tabulka, nýbrž obor, v němž je
zkratka užita. Táž tři písmena znamenají v různých oborech různé věci — zkratka CPT označuje
v péči o trauma terapii zpracováním poznatků, v americkém zdravotním účtování však nomenklaturu
výkonů, a zkratka DES se vyskytuje jak u dotazníku disociativních zkušeností, tak u látky, s níž
nemá nic společného. Proto k rozpisu klinických zkratek v oddílu 3 patří i obor užití
a u nástrojů odkaz na stránku, kde jsou popsány v kontextu; bez oboru je rozpis neúplný. *Interpretace knihy*: znakem uzavřené skupiny
není mnoho zkratek, nýbrž zkratky, jejichž rozpis se od členů neočekává — kdo užívá slovo, jehož plný tvar nezná, přijal kus výkladu, který neprověřil.

## Vazby na další přílohy

- [Bibliografie](@/kompendium/08-prilohy/bibliografie.md) — citační konvence v kontextu primární literatury.
- [Rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md) — operativní použití EA notace.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) — bilingvní mapování zkratek.
- [Diagnostické nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md) — klinické zkratky v kontextu.
- [Etický kodex](@/kompendium/08-prilohy/eticky-kodex.md) — institucionální zkratky.
- [Klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) — meta-úroveň notace.
- [Glosář](@/glossary/_index.md) — všechny domain zkratky mají glosářová hesla.

## Kritický krok

**Tato příloha je referenční nástroj** — není k četbě od začátku do konce.
Místo lineární četby:

1. Identifikuj **konkrétní termín / techniku / nástroj**, který právě potřebuješ
2. Použij vyhledávání (Cmd+F / Ctrl+F) v této stránce
3. Pokud nenajdeš, zkontroluj [glosář](@/glossary/_index.md) a [rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md)

> **Mandatorní akce**: použití přílohy bez konkrétní otázky je obvykle
> formou prokrastinace. Definuj si nejprve, **co hledáš**, teprve pak
> otevři přílohu.

## Literatura

- Cohen, J. (1960). A coefficient of agreement for nominal scales. *Educational and Psychological Measurement*.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Park Street Press.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. W. W. Norton.
- Orwell, G. (1949). *Nineteen Eighty-Four*. Secker & Warburg.

## Související

**Přílohy knihy**

- [Klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) – úplná specifikace notace EA-X.Y.Z.
- [Kompletní rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md) – všechny kódy na jednom místě.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) – dvojjazyčné mapování pojmů a zkratek.

**Platformní zkratky**

- [1.6 Odkud kniha pochází](@/kompendium/01-predmluva/vztah-k-platforme.md) – odkud se v knize vzal technický slovník.

**Doménové pojmy**

- [Taxonomie EA](@/glossary/taxonomie-ea.md) – systém kódů technik.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – pojem za zkratkou EA.
