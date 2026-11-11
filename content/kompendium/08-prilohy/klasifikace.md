+++
title = "Klasifikační schéma a taxonomie — meta-úroveň"
description = "Meta-popis klasifikačního systému kompendia — notace EA-X.Y.Z, dimenzionální osy, kategoriální struktura, principy přiřazování kódů, vztah k jiným taxonomiím (DSM-5, ICD-11."
weight = 6
sort_by = "weight"

[taxonomies]
tags = ["kompendium", "08-prilohy"]

[extra]
related_terms = ["eticky-kodex", "index-pojmu", "rejstrik-technik", "zkratky"]
kompendium = ["08-prilohy"]
prilohy = ["klasifikace", "taxonomie", "metodologie"]
section_icon = "🗂️"
toc = true
insert_anchor_links = "right"
access_level = "L1-L4"
status = "complete"
+++

# Klasifikační schéma a taxonomie — meta-úroveň

> **Meta-popis klasifikačního systému kompendia** — notace, dimenzionální osy, principy kanonizace, vztah k externím taxonomiím (DSM-5, ICD-11, [BITE Model](@/glossary/bite-model.md)). Slouží jako referenční dokument pro výzkumníky přidávající nové techniky do taxonomie a pro recenzenty hodnotící konzistenci klasifikace.

## 1. Notační systém

### 1.1 Základní notace

Každá technika je identifikována kanonickým kódem:

```
EA-X.Y.Z[-α]
```

| Komponenta | Význam | Doména hodnot |
|------------|--------|---------------|
| **EA** | Konstantní prefix: [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) | Pevné |
| **X** | Primární kategorie / kapitola | 1–10 |
| **Y** | Subkategorie | 1–9 |
| **Z** | Specifický fenomén | 1–99 |
| **α** | Volitelná varianta | a, b, c, … |

### 1.2 Příklady

| Kód | Význam |
|-----|--------|
| `EA-1.1.1` | Selektivní expozice (Kap. 1, podkat. 1, fenomén 1) |
| `EA-5.1.30` | Apoteoza prázdna (Kap. 5, podkat. 1, fenomén 30) |
| `EA-1.4.2-a` | Latentní emocionální modulace, varianta a |

### 1.3 Mapování kapitol

| X | Kapitola | Doménový rámec |
|---|----------|----------------|
| 1 | Akademické techniky | Intelektuální / akademické prostředí |
| 2 | Delegitimizační techniky | Útok na zdrojovou věrohodnost |
| 3 | [Edukativní implementace](@/glossary/edukativni-implementace.md) | Sebe-manipulace učenou skrze pedagogiku |
| 4 | Terminální protokoly | Komplexní destrukční sekvence |
| 5 | Ultramární techniky | Fundamentální dekonstrukce poznávání |
| 6 | Klinické aplikace | Diagnostika a terapie |
| 7 | Teoretické reflexe | Filozofické a interdisciplinární implikace |
| 8 | Epistemická obrana (rezerva) | Rezilience a defenzivní techniky |
| 9 | Institucionální dimenze (rezerva) | Politika, právo, regulace |
| 10 | Meta-úroveň (rezerva) | Taxonomie taxonomie |

## 2. Dimenzionální osy

Vedle hierarchické notace EA-X.Y.Z je každá technika klasifikována podle **čtyř ortogonálních dimenzí**, které tvoří **klasifikační prostor**.

### 2.1 Strukturální vs. obsahová

| Hodnota | Význam | Příklad |
|---------|--------|---------|
| **Strukturální** | Útok na *procesy* poznávání (logika, paměť, percepce) | [`EA-5.1.16`](@/kompendium/techniques/ea-5-1-16-inferencni-paralyza.md) Inferenční paralýza |
| **Obsahová** | Útok na *specifická přesvědčení* nebo identitární obsah | [`EA-1.1.1`](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) Selektivní expozice |

> **Klíčový rozdíl**: Strukturální techniky jsou **paradigm-independent** (působí napříč obsahy), obsahové **paradigm-dependent**.

### 2.2 Akutní vs. chronická

| Hodnota | Význam | Časový rámec |
|---------|--------|--------------|
| **Akutní** | Krátkodobá, intenzivní expozice | Sekundy až dny |
| **Chronická** | Dlouhodobá, kumulativní expozice | Týdny až roky |

> Akutní techniky často patří do Kap. 5 (Ultramární); chronické do Kap. 1, 3, 4.

### 2.3 Explicitní vs. implicitní

| Hodnota | Význam | Detekce |
|---------|--------|---------|
| **Explicitní** | Detekovatelná vědomou reflexí | Jednodušší |
| **Implicitní** | Operující pod prahem vědomé detekce | Vyžaduje strukturovanou analýzu |

> Implicitní techniky vyžadují diagnostické instrumenty ([Diagnostika](@/kompendium/08-prilohy/diagnosticke-nastroje.md)).

### 2.4 Reverzibilní vs. ireverzibilní

| Hodnota | Význam | Klinická implikace |
|---------|--------|--------------------|
| **Reverzibilní** | Plná epistemická rekonstrukce možná | Standardní terapie |
| **Částečně reverzibilní** | Funkce obnovitelné, ne plné pre-stavový | Adaptivní terapie |
| **Ireverzibilní** | Strukturní změna trvalá | Adaptivní podpora, ne rekonstrukce |

> Ireverzibilita není binární — existuje **gradient**, který se zužuje s dobou expozice a typem techniky.

## 3. Klasifikační prostor

Kombinace 4 dimenzí × kategoriální (X.Y.Z) struktura tvoří **klasifikační prostor** o velikosti:

```
2 (struktur.) × 2 (akut.) × 2 (explic.) × 3 (revers.) = 24 pozic
```

Každá technika **EA-X.Y.Z** zaujímá pozici v tomto prostoru. Vizualizace:

```
                  REVERSIBLE  PARTIAL  IRREVERSIBLE
                       │         │         │
    ACUTE              ●         ◆         ●
    CHRONIC            ◆         ●         ◆
    EXPLICIT           ●         ●         ◆
    IMPLICIT           ◆         ◆         ●
    STRUCTURAL         ●         ◆         ◆
    CONTENT            ◆         ●         ●
```

> **Klastery**: Techniky stejné kapitoly (např. Kap. 5) sdílejí podobné pozice v klasifikačním prostoru — to **validuje** kategoriální rozhodnutí.

## 4. Princip kanonizace nové techniky

Postup pro přidání nové techniky do taxonomie:

### Krok 1 — Identifikace fenoménu

- **Empirické pozorování** ve výzkumu nebo klinice.
- **Historická literatura** (kapitola II Bibliografie atd.).
- **Adversariální simulace** [Red Team](@/glossary/red-team.md) scénáře.

### Krok 2 — Diferenciální analýza

- Je fenomén **nová technika**, nebo **varianta** existující?
- Pokud varianta → přiřazení suffixu `-α`.
- Pokud nová → přiřazení nového Z (případně nové Y/X).

### Krok 3 — Klasifikační dotazník

| Otázka | Odpověď |
|--------|---------|
| Strukturální nebo obsahová? | … |
| Akutní nebo chronická? | … |
| Explicitní nebo implicitní? | … |
| Reverzibilní / částečná / ireverzibilní? | … |
| Doménový rámec (Kap. 1–10)? | … |
| Korespondence s existujícími taxonomiemi? | … |

### Krok 4 — Peer review

- **Dual review**: 2 nezávislí výzkumníci přiřadí klasifikaci nezávisle.
- **Inter-rater agreement** musí být ≥ 0.80 (Cohenova κ).
- V případě nesouladu → **arbitrace** taxonomické komise.

### Krok 5 — Publikace

- Nový EA-X.Y.Z kód přidán do [Rejstříku technik](@/kompendium/08-prilohy/rejstrik-technik.md).
- Per-technique článek vytvořen v `/kompendium/techniques/`.
- Glosářové heslo přidáno do [Glosář](@/glossary/_index.md).
- Index pojmů aktualizován v [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md).

## 5. Vztah k externím taxonomiím

### 5.1 DSM-5 (Diagnostic and Statistical Manual of Mental Disorders, 5th ed.)

EA techniky **nejsou nahrazeny** DSM-5 diagnózami — jsou **komplementární**:

| EA technika | DSM-5 koreláty |
|-------------|----------------|
| Chronická Kap. 4 expozice | F43.1 PTSD, F43.2 Adjustment Disorder |
| Kap. 5 ultramární | F44.x Disociativní poruchy |
| Identitární dezintegrace | F44.81 Dissociative Identity Disorder |
| Existenciální derealizace | F48.1 Depersonalization-Derealization |

> EA klasifikace popisuje **etiologii** (manipulační origin), DSM-5 popisuje **fenotyp** (klinický obraz). Obě potřebné.

### 5.2 ICD-11 (International Classification of Diseases, 11th ed.)

| EA technika | ICD-11 koreláty |
|-------------|-----------------|
| Komplexní Kap. 4 | 6B41 Complex PTSD |
| Disociativní z Kap. 5 | 6B6x Dissociative Disorders |
| Stresová reakce | QE84 Acculturation Difficulty |

### 5.3 BITE Model (Hassan)

Mapování BITE → EA viz [Diagnostika §1](@/kompendium/08-prilohy/diagnosticke-nastroje.md). BITE poskytuje **environmentální** rámec; EA poskytuje **technicky-specifický** rámec. BITE je makro-úroveň, EA je mikro-úroveň.

### 5.4 Lifton 8 kritérií Thought Reform

| Liftonovo kritérium | Odpovídající EA techniky |
|---------------------|--------------------------|
| [Milieu Control](@/glossary/milieu-control.md) | [`EA-1.1.1`](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md), `EA-3.2.1` |
| Mystical Manipulation | [`EA-5.1.19`](@/kompendium/techniques/ea-5-1-19-kvazi-mysticka-anihilace.md) |
| Demand for Purity | `EA-3.3.1`, Kap. 4 |
| Confession | `EA-3.2.1` |
| Sacred Science | [`EA-1.3.1`](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) |
| [Loading the Language](@/glossary/loading-the-language.md) | [`EA-1.1.3`](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md), `EA-5.1.5` |
| Dispensing of Existence | Kap. 4 + 5 finální fáze |

## 6. Principy konzistence

### 6.1 Mutual exclusivity (vzájemná výlučnost)

V rámci jedné kapitoly platí: **každý fenomén má právě jeden EA-X.Y.Z kód**. Pokud fenomén lze umístit do více míst, je to signál pro **revizi taxonomie**, nikoliv duplicita kódů.

### 6.2 Collective exhaustivity (kolektivní vyčerpávajícnost)

Cílem je, aby **každá empiricky pozorovaná technika** měla v taxonomii své místo. Existuje rezervní prostor pro nové techniky (X = 8, 9, 10) a v rámci kapitol (Y, Z) prostor pro inkrementální růst.

### 6.3 Hierarchická konzistence

Subkategorie Y musí být **všechny ze stejné dimenze** v rámci kapitoly X. Příklad: Kap. 1 dělí podle **akademických aktivit** (akvizice, logika, [falsifikace](@/glossary/falsifikace.md), prosodie, proxemika), Kap. 5 dělí podle **úrovně rozpadu** (sémantická, narativní, identitární, ontologická).

### 6.4 Reproducibilita klasifikace

Inter-rater agreement (Cohenova κ) na úrovni X je **> 0.95** v platných taxonomiích. Pro Y a Z přijatelná hranice je **> 0.80**. Hodnoty pod tuto hranici signalizují potřebu revize.

## 7. Verzování taxonomie

| Verze | Změna | Implikace |
|-------|-------|-----------|
| **Major (X.0.0)** | Reorganizace kapitol | Re-kódování všech technik |
| **Minor (X.Y.0)** | Přidání kapitoly nebo subkategorie | Kompatibilní rozšíření |
| **Patch (X.Y.Z)** | Přidání techniky / oprava popisu | Plně kompatibilní |

Aktuální verze taxonomie: **v1.0.0** (kanonický stav 2026-04-25).

## 8. Co klasifikace nedokazuje

Kód EA-X.Y.Z je rozhodnutí o popisu, nikoli diagnóza, a tím méně nález o konkrétním člověku.
Z toho plynou tři omezení. Za prvé: míra shody mezi posuzovateli, na niž se odvolávají oddíly 4
a 6, je ukazatelem konzistence, ne správnosti; Cohen (1960) ji zavedl jako korekci shody
očekávatelné náhodou, a dva posuzovatelé školení týmž schématem se mohou shodnout i tam, kde je
schéma chybné. Za druhé: zařazení jednání pod kód nevypovídá o záměru toho, kdo je vykonal —
dimenze z oddílu 2 popisují strukturu a dopad, nikoli pohnutku. Za třetí: klasifikace lidí
a jejich zkušeností působí zpětně na své předměty; Hacking (1995) tento jev nazval smyčkovým
efektem lidských druhů — pojmenovaní lidé se k pojmu vztahují, přejímají jej nebo se mu brání,
a tím mění právě to, co měl pojem popisovat. *Interpretace knihy*: proto se kód v klinickém
i právním kontextu uvádí jako nástroj popisu, s nímž dotčený člověk může nesouhlasit, a nikdy
jako údaj o jeho osobě.

## 9. Vazby na další přílohy

- [Bibliografie](@/kompendium/08-prilohy/bibliografie.md) — primární literatura k taxonomické metodě.
- [Rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md) — operativní výstup tohoto schématu.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) — kanonizace termínů.
- [Diagnostické nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md) — instrumenty operacionalizující dimenze.
- [Etický kodex](@/kompendium/08-prilohy/eticky-kodex.md) — etické předpoklady taxonomie.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) — formální notační konvence.
- [Glosář](@/glossary/_index.md) — kanonizace termínů recipročně s touto taxonomií.

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
- Hacking, I. (1995). The looping effects of human kinds. In D. Sperber, D. Premack, & A. J. Premack (Eds.), *Causal Cognition: A Multidisciplinary Debate*. Clarendon Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Park Street Press.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. W. W. Norton.

## Související

**Přílohy knihy**

- [Kompletní rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md) – kódy přidělené podle tohoto schématu.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – notační konvence všech sekcí.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) – terminologický rejstřík s anglickými ekvivalenty.

**Metodologie**

- [2.4 Metodologické poznámky k taxonomii](@/kompendium/02-uvod/metodologicke-poznamky.md) – klasifikační a validační principy v úvodu.
- [Taxonomie EA](@/glossary/taxonomie-ea.md) – heslo glosáře o systému kódů.
- [Knihovna technik](@/kompendium/techniques/_index.md) – články, které schéma třídí.

**Externí taxonomie**

- [BITE model](@/glossary/bite-model.md) – Hassanův rámec, s nímž se schéma porovnává.
- [Thought reform](@/glossary/thought-reform.md) – Liftonova kritéria myšlenkové reformy.

---

## Kontakt a příspěvky

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Hub kompendia](@/kompendium/_index.md) | [Přílohy](@/kompendium/08-prilohy/_index.md) | [Techniky](@/kompendium/techniques/_index.md) | [Glosář](@/glossary/_index.md) | [Filozofie](@/philosophy/_index.md) | [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/)
