+++
title = "Entity Resolution (sjednocování entit)"
weight = 44
description = "Zpravodajský proces, který určuje, zda záznamy z různých zdrojů patří téže skutečné entitě, a umožňuje sjednotit identity napříč nesourodými daty s kalibrovanou důvěrou."

[taxonomies]
tags = ["glossary", "entity-resolution", "osint", "due-diligence"]

[extra]
category = "intelligence"
related_terms = ["osint", "due-diligence", "sanctions-screening", "graph-theory"]
tier = "TIER 1"
domain = "Intelligence Processing"
maturity = "Production"
complexity = "Advanced"
audience = ["intelligence-analysts", "data-engineers", "osint-practitioners"]
key_benefits = ["identity-consolidation", "cross-source-correlation", "deduplication", "entity-linking"]
prerequisites = ["knowledge-graph", "ontology", "confidence-scoring"]
matching_strategies = ["deterministic", "probabilistic", "graph-based"]
blocking_methods = ["exact-key", "sorted-neighborhood", "canopy", "lsh", "phonetic"]
similarity_metrics = ["jaro-winkler", "levenshtein", "jaccard", "cosine"]
confidence_threshold = 0.80
pipeline_model = "Broadway stream processing"
false_positive_impact = "Incorrectly merged entities"
false_negative_impact = "Missed entity connections"
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-10"
+++

## Definice

**Entity resolution** (česky *sjednocování entit*, též *propojování záznamů*, *deduplikace*,
*párování entit* nebo *sjednocování identit*) je proces, který určuje, zda různé datové
záznamy – případně ze zcela odlišných zdrojů, s jinými identifikátory, formáty, pravopisem
a úplností – patří téže skutečné entitě. Ve zpravodajství a kybernetické bezpečnosti to
znamená propojovat osoby, organizace, domény, IP adresy, e-mailové adresy, účty na
sociálních sítích a digitální aktiva napříč zdroji, které nemají společný identifikátor.
Sjednocování entit je klíčovým krokem, který mění roztříštěná a zdvojená surová data
v souvislý, sjednocený obraz skutečnosti.

Jde v podstatě o práci s nejistotou. Osoba „Jan Novák“ v českém obchodním rejstříku,
„J. Novak“ jako držitel domény a adresa „jan.novak@example.com“ v uniklé databázi mohou, ale
nemusí být týž člověk. Sjednocování kombinuje **deterministické** párování (přesné shody
jedinečných identifikátorů – e-mailu, daňového čísla, domény), **pravděpodobnostní** párování
(přibližné skóre podobnosti jmen, adres a dalších atributů) a **grafové** párování (analýzu
vzorců vztahů – sdílejí-li dva záznamy tři společné spolupracovníky, spíše jde o tutéž
entitu). Výstupem není binární ano/ne, ale tvrzení s mírou důvěry: „tyto záznamy představují
tutéž entitu s důvěrou 87 % na základě podobnosti jména, sdíleného rozsahu IP a překrývajících
se dat registrace“.

Sjednocování entit stojí na průsečíku datového inženýrství, teorie informace a oborové
znalosti. Ve velkém měřítku vyžaduje efektivní strategie *blokování* (zmenšení prostoru
porovnání O(n²) na zvládnutelné množiny kandidátů), propracované metriky podobnosti
(Jaro-Winkler pro jména, Levenshtein pro řetězce, geografická blízkost pro adresy)
a principiální kalibraci důvěry (aby propojení s „důvěrou 90 %“ bylo skutečně v 90 %
případů správné). Falešně pozitivní výsledky (chybné sloučení různých entit) i falešně
negativní (nepropojení záznamů téže entity) mají ve zpravodajské práci vážné důsledky.

**Vztah ke knize:** pojem patří do kontextu prověrek (viz [Due
Diligence](@/glossary/due-diligence.md)). Pro knihu je důležitá jeho
etická stránka: chybné sloučení dvou lidí do jedné „entity“ může poškodit nevinného člověka
a sjednocování osobních údajů napříč zdroji je zároveň mechanismem [doxingu](@/glossary/doxing.md)
(srov. [EA-2.3.8 Doxxing epistemický](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md)).
Proto platí přísná pravidla důvěry, původu a lidské revize a práce s osobními údaji musí
respektovat právo na ochranu soukromí (viz [OSINT](@/glossary/osint.md) a [Pomluva
a EA](@/kompendium/forensic-legal/14-defamation-EA.md)).

## Proces sjednocování entit

Proces má několik fází; každá zmenšuje prostor kandidátů a zvyšuje přesnost párování:

```
Raw Records (N sources)
      |
      v
  1. Normalization
      |  Name standardization, address parsing, format unification
      v
  2. Blocking
      |  Partition records into candidate groups (O(n) instead of O(n^2))
      v
  3. Pairwise Comparison
      |  Compute similarity scores across multiple attributes
      v
  4. Classification
      |  Determine match/non-match/uncertain using trained thresholds
      v
  5. Clustering
      |  Group matched records into entity clusters
      v
  6. Confidence Scoring
      |  Assign calibrated confidence to each entity link
      v
  7. Knowledge Graph Integration
      |  Merge into master entity records with provenance
      v
  Master Entity Records
```
## Fáze normalizace

Normalizace převádí záznamy z nesourodých zdrojů do společného formátu vhodného k porovnání:

| Normalizace | Vstup | Výstup | Účel |
|--------------|-------|--------|---------|
| **jméno** | „Jan Novák“ | „jan novak“ | odstranění diakritiky, sjednocení velikosti písmen |
| **adresa** | „Ul. Karla IV 12/3“ | „karla iv 12 3“ | rozvinutí zkratek ulic |
| **telefon** | „+420 123 456 789“ | „420123456789“ | normalizace mezer a předvolby |
| **e-mail** | „Jan.Novak+work@gmail.com“ | „jan.novak@gmail.com“ | odstranění aliasu, sjednocení velikosti písmen |
| **doména** | „www.Example.COM“ | „example.com“ | odstranění protokolu a www, sjednocení velikosti písmen |

## Strategie párování

| Strategie | Mechanismus | Důvěra | Rychlost | Příklad |
|----------|-----------|-----------|-------|---------|
| **deterministická** | přesná shoda jedinečných identifikátorů | velmi vysoká (> 0,95) | rychlá | stejný e-mail, stejné daňové číslo, stejná doména |
| **pravděpodobnostní** | přibližné skóre podobnosti napříč atributy | proměnlivá (0,5–0,95) | střední | podobná jména + překrývající se adresy |
| **grafová** | analýza vzorců vztahů | vysoká (0,7–0,95) | pomalá | společní spolupracovníci, společné registrace |

### Pravděpodobnostní párování

Pravděpodobnostní párování počítá vážené skóre podobnosti napříč více atributy:

| Atribut | Metrika podobnosti | Váha | Práh |
|-----------|------------------|--------|-----------|
| **jméno osoby** | vzdálenost Jaro-Winkler | 0,30 | > 0,85 |
| **organizace** | Jaccardova podobnost tokenů | 0,25 | > 0,80 |
| **adresa** | geografická vzdálenost + podobnost řetězců | 0,15 | < 500 m nebo > 0,75 |
| **telefon** | přesná shoda po normalizaci | 0,10 | přesná po normalizaci |
| **datum narození** | přesná nebo částečná shoda | 0,10 | přesná nebo rok + měsíc |
| **doména** | Levenshtein + analýza TLD | 0,10 | > 0,90 |

### Grafové párování

Grafové sjednocování analyzuje vzorce vztahů ve znalostním grafu (srov. [Graph
Theory](@/glossary/graph-theory.md)).

## Strategie blokování

Bez blokování vyžaduje porovnání N záznamů N·(N−1)/2 párových porovnání. Blokování rozdělí
záznamy do skupin se společným atributem a prostor porovnání dramaticky zmenší:

| Strategie | Mechanismus | Zmenšení | Riziko |
|-------------------|-----------|-----------|------|
| **přesný klíč** | stejné první 3 znaky příjmení | ~100× | přehlédne překlepy |
| **seřazené sousedství** | klouzavé okno nad seřazenými klíči | ~50× | kompromis velikosti okna |
| **canopy** | předfiltr levnou metrikou vzdálenosti | ~200× | citlivost na práh |
| **LSH** (*Locality-Sensitive Hashing*) | přibližné párování přes hashe | ~500× | pravděpodobnost přehlédnutí shod |
| **fonetické** | kódování Soundex/Metaphone | ~100× | závislé na jazyce |
| **více klíčů** | sjednocení více blokovacích klíčů | ~50× | lepší úplnost, více porovnání |

## Kalibrace důvěry

Důvěra musí být kalibrována tak, aby uváděná důvěra odpovídala skutečné přesnosti. Systém,
který tvrdí důvěru 90 %, má mít pravdu v 90 % případů:

| Rozsah důvěry | Význam | Akce |
|-----------------|---------|---------------------|
| **0,95–1,00** | téměř jistá shoda (deterministická) | automatické sloučení do hlavní entity |
| **0,80–0,95** | pravděpodobnostní shoda s vysokou důvěrou | automatické sloučení s příznakem původu |
| **0,60–0,80** | kandidátní shoda | fronta k revizi analytikem |
| **0,40–0,60** | nejisté spojení | zachovat jako kandidáta, neslučovat |
| **0,00–0,40** | pravděpodobně různé entity | propojení se nevytváří |

## Integrace zdrojů OSINT

Sjednocování napříč zdroji OSINT přináší zvláštní obtíže kvůli jejich různorodosti:

| Typ zdroje | Dostupné identifikátory | Kvalita | Pokrytí |
|------------|----------------------|---------|----------|
| **WHOIS domén** | jméno, e-mail a organizace držitele | klesající (GDPR) | domény po celém světě |
| **Certificate Transparency** | doména, organizace, vydavatel | vysoká | všechny veřejné certifikáty TLS |
| **obchodní rejstříky** | právní název, daňové číslo, adresa | vysoká | podle jurisdikce |
| **sociální sítě** | uživatelské jméno, zobrazované jméno, popis | proměnlivá | podle platformy |
| **záznamy DNS** | doména, IP, jmenné servery | vysoká | všechny veřejné domény |
| **české rejstříky** | IČO, právní název, statutáři, adresa | velmi vysoká | Česká republika |
| **sankční seznamy** | jméno, aliasy, identifikátory | vysoká | EU, USA, OSN (viz [Sanctions Screening](@/glossary/sanctions-screening.md)) |

## Obtíže napříč jurisdikcemi

| Obtíž | Popis | Zmírnění |
|-----------|-------------|------------|
| **přepis jmen** | totéž jméno v latince, cyrilici, arabském písmu | normalizace více písem |
| **formáty adres** | různé poštovní zvyklosti v jednotlivých zemích | parsery adres podle země |
| **formáty identifikátorů** | daňová čísla a čísla firem se liší podle jurisdikce | registr formátů a normalizátor |
| **ochrana soukromí** | GDPR, CCPA omezují propojování dat přes hranice | sledování souhlasu podle jurisdikce |
| **firemní struktury** | dceřiné firmy, holdingy, skuteční majitelé | grafové sjednocení firemního stromu |
| **zvyklosti pojmenování** | patronyma, matronyma, více příjmení | kulturně citlivé rozebírání jmen |

## Výkonová hlediska

Sjednocování ve velkém měřítku vyžaduje pečlivou optimalizaci výkonu (orientační hodnoty):

| Měřítko | Záznamy | Naivní porovnání | S blokováním | Čas (přibližně) |
|-------|---------|-------------------|---------------|---------------|
| malé | 1 000 | 500 000 | 5 000 | < 1 sekunda |
| střední | 100 000 | 5 miliard | 500 000 | < 1 minuta |
| velké | 10 000 000 | 50 bilionů | 50 000 000 | < 1 hodina |

## Odkud metoda pochází a co propojení nedokazuje

Úloha má doložitelný původ v demografii a epidemiologii. Newcombe a kol. (1959) propojovali
záznamy o narozeních a sňatcích strojově, a tím vznikla úloha automatického propojování
záznamů; Fellegi a Sunter (1969) jí dali formální podobu — rozhodovací pravidlo, které pro
každý pár záznamů poměřuje pravděpodobnost pozorované shody atributů za předpokladu téže
entity s pravděpodobností téže shody u entit různých, a zavádí tři výstupy: shodu, neshodu
a oblast ponechanou lidskému posouzení. Dnešní pravděpodobnostní párování je rozpracováním
tohoto rámce (přehled viz Christen 2012). Tři výstupy přitom nejsou technickým detailem, ale
konstrukčním přiznáním, že část párů rozhodnout nelze.

Vysoká důvěra u propojení proto nedokazuje totožnost osoby. Dokazuje, že dva záznamy jsou si
podobné natolik, nakolik model podobnost měří, a za předpokladů, které model o zdroji dat činí;
vypovídá o záznamech, ne o lidech. O záměru nevypovídá vůbec: společná adresa, společný
registrátor nebo sdílený rozsah IP jsou slučovacím signálem, nikoli důkazem vztahu mezi lidmi.
*Interpretace knihy*: obě chyby mají nesouměřitelné následky — přehlédnuté propojení zhorší
zpravodajský obraz, kdežto chybné sloučení poškodí konkrétního člověka, který se o něm nedozví
a nemůže je rozporovat. To je důvod, proč oblast nejistoty musí zůstat u člověka a proč se
o jejím vyřešení vede záznam.

## Literatura

- Christen, P. (2012). *Data Matching: Concepts and Techniques for Record Linkage, Entity Resolution, and Duplicate Detection*. Springer.
- Fellegi, I. P., & Sunter, A. B. (1969). A theory for record linkage. *Journal of the American Statistical Association*.
- Newcombe, H. B., Kennedy, J. M., Axford, S. J., & James, A. P. (1959). Automatic linkage of vital records. *Science*.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Knowledge Graph* (graf uložených vztahů sjednocených
entit), *Ontology* (schéma typů entit a kategorií vztahů), *Data Pipeline*, *Confidence
Scoring* a *Stream Processing*.

## Související

- [Due Diligence](@/glossary/due-diligence.md) – prověrky, v nichž se sjednocování uplatňuje.
- [Sanctions Screening](@/glossary/sanctions-screening.md) – porovnání sjednocených entit se
  sankčními seznamy.
- [Doxing](@/glossary/doxing.md) – zneužití propojování osobních údajů proti člověku.
- [OSINT](@/glossary/osint.md) – pravidla práce s otevřenými zdroji.
- [Pomluva a EA](@/kompendium/forensic-legal/14-defamation-EA.md) – právní rizika chybného
  přisouzení.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: entity-resolution](@/kompendium/glossary-bridges/bridge-entity-resolution.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
