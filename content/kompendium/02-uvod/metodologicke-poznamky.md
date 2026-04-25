+++
title = "2.4 Metodologické poznámky k taxonomii"
description = "Metodologické přístupy ke konstrukci taxonomie — klasifikační principy, validační kritéria, metodologické výzvy a jejich řešení."
weight = 4
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "uvod", "metodologie", "klasifikace", "validace"]
categories = ["academic", "methodology"]

[extra]
parent = "kompendium-02-uvod"
section_icon = "🧬"
toc = true
+++

# 2.4 Metodologické poznámky k taxonomii

Tato kapitola **explicitně vystavuje** metodologické základy — kritéria klasifikace, validační principy, omezení. Bez metodologické transparentnosti by taxonomie byla **neauditovatelná** a tudíž neopravitelná.

## Klasifikační principy

### Princip strukturální distinktivity

Každá taxonomická jednotka (technika) musí být **strukturálně distinktivní** — od ostatních se liší **identifikovatelnými strukturálními znaky**, nejen povrchovou prezentací.

> **Příklad**: *Falešné dilema* (EA-1.2.1) a *falešná ekvivalence* (EA-1.2.2) jsou strukturálně distinktivní:
> - Falešné dilema vyžaduje **artificiální polarizaci** (binární redukce kontinua)
> - Falešná ekvivalence vyžaduje **artificiální symetrii** (vyrovnání asymetrických entit)
> Povrchově obojí "uměle deformuje strukturu volby", ale mechanismy jsou odlišné.

### Princip kompoziční úplnosti

Taxonomie musí být **kompozičně úplná** — komplexní techniky lze popsat jako kombinaci základních jednotek; obráceně, ze základních jednotek lze rekonstruovat komplexní techniky.

> **Příklad**: *Vzorec "Guru a adept"* (EA-1.6.1) je kompozicí:
> - EA-1.5.2 (dominantní tělesné hieroglyfy)
> - EA-1.4.1 (prosodická dominance)
> - EA-1.3.3 (tematická diverze při kritice)
> - EA-1.1.1 (selektivní expozice)
> - + temporální dynamika (kultivace závislosti)

### Princip operační specifikace

Každá technika musí mít **explicitní operační modus** — popis mechanismu na úrovni umožňující detekci a neutralizaci.

### Princip fenomenologické validace

Klasifikace musí být **konzistentní** s fenomenologickou zkušeností postižených subjektů — pokud subjekt nedokáže rozlišit dvě údajně distinktivní techniky, je to signál ke konsolidaci nebo k upřesnění operačního modu.

## Validační kritéria

### 1. Inter-rater reliabilita

Dva nezávislí klasifikátoři by měli při klasifikaci téhož případu dospět ke stejné taxonomické jednotce. **Cílový práh**: ≥ 0.7 Cohen's kappa pro hlavní kategorie.

### 2. Diferenciální diagnostika

Pro každou techniku musí být specifikována **diferenciální kritéria** vůči podobným technikám.

### 3. Predikční validita

Identifikace techniky musí mít **predikční hodnotu** pro průběh a vývoj — pokud klasifikace neumožňuje predikci, postrádá klinickou užitečnost.

### 4. Interventivní validita

Klasifikace musí korespondovat s **diferenciální účinností intervence** — různé techniky vyžadují různé neutralizační strategie.

### 5. Cross-cultural konzistence

Taxonomie by měla být **transkulturálně použitelná** — i když specifická manifestace se liší, **strukturální mechanismus** by měl zůstat invariantní.

## Metodologické výzvy

### Výzva 1: Etická omezení empirického studia

> **Problém**: Z etických důvodů nelze epistemicky destruktivní techniky aplikovat experimentálně.

**Řešení**:
- **Retrospektivní case studies** — analýza dokumentovaných historických případů
- **Naturalistická observace** — klinické případy bez experimentální indukce
- **Strukturální analýza** dokumentovaných systémů (totalitní propaganda, sektářské skupiny)
- **Computer simulation** — modelování dynamiky bez lidských subjektů
- **Etnografická metoda** — rozhovory s ex-členy manipulativních skupin

### Výzva 2: Self-deception u postižených

> **Problém**: Postižené subjekty často **nerozpoznávají** svou postiženost.

**Řešení**:
- **Triangulace** — výpověď subjektu + vnější pozorování + dokumentace
- **Longitudinální observace** — změny v čase
- **Strukturální markery** — pozorovatelné vzorce (řečová produkce, sociální chování) nezávisle na subjektivní výpovědi

### Výzva 3: Cirkularita validace

> **Problém**: Riziko, že kritéria pro identifikaci techniky jsou **cirkulárně** odvozena z případů, na kterých je technika definována.

**Řešení**:
- **Prospektivní predikce** na nově shromážděných případech
- **Out-of-sample testing**
- **Konvergentní validace** — různé metodologie vedoucí ke stejné taxonomické jednotce

### Výzva 4: Hranice mezi technikami

> **Problém**: Mnoho reálných případů kombinuje multiple techniky — pure cases jsou vzácné.

**Řešení**:
- **Polynomiální klasifikace** — případ může být označen multiple kódy
- **Primary/secondary** technique distinction
- **Compositional analysis** — explicitní rozklad

### Výzva 5: Kulturní variabilita

> **Problém**: Techniky se manifestují **kulturně specificky**, ale taxonomie aspiruje na univerzálnost.

**Řešení**:
- **Strukturální vs. fenomenální distinction** — strukturální mechanismus invariantní, fenomenální manifestace variabilní
- **Cultural adaptation guides** pro klinickou praxi
- **Cross-cultural validation** ve více kontextech

## Notační systém — metodologické zdůvodnění

Notace `EA-X.Y.Z-α` je navržena s pěti vlastnostmi:

| Vlastnost | Důvod |
|-----------|-------|
| **Stabilita** | EA kód se nemění ani při refaktorizaci prezentačních URL |
| **Hierarchická čitelnost** | Z kódu lze přečíst kategorii a subkategorii |
| **Variantní rozšiřitelnost** | Suffix `α` umožňuje označit varianty bez restrukturalizace |
| **Strojová indexace** | Snadné parsování pro automatizovanou analýzu |
| **Auditovatelnost** | Jednoznačná reference v cross-disciplinárním diskurzu |

## Verzování taxonomie

Taxonomie podléhá **semverové disciplíně**:

| Změna | Verze |
|-------|-------|
| Oprava klasifikační chyby (přesun techniky, oprava kódu) | **Patch** (1.0.0 → 1.0.1) |
| Přidání nové techniky | **Minor** (1.0.0 → 1.1.0) |
| Restrukturalizace kategorií, breaking change v kódování | **Major** (1.0.0 → 2.0.0) |

Aktuální verze: **v0.1.0** (počáteční publikace, taxonomie v aktivní expanzi).

## Otevřená otázka

Taxonomie **není** dokončený artefakt — je **živý systém**. Klíčové otevřené otázky:

- **AI-mediated manipulace** — jak transformuje stávající techniky algoritmická amplifikace?
- **Kolektivní subjekty** — lze taxonomii aplikovat na skupinové subjekty (instituce, společnosti)?
- **Self-induced anihilace** — jak klasifikovat manipulaci aplikovanou na sebe samého?
- **Reverzibilita** — empirická data jsou stále nedostatečná pro spolehlivou predikci

## Související

- [Definice](/kompendium/02-uvod/definice/)
- [Historický kontext](/kompendium/02-uvod/historicky-kontext/)
- [Teoretické základy](/kompendium/02-uvod/teoreticke-zaklady/)
- [Sekce 03 — Základní kategorie](/kompendium/03-zakladni-kategorie/)

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [Glossary](/glossary/) | [Philosophy](/philosophy/) | [Developer Portal](/developers/)
