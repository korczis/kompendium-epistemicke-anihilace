+++
title = "Síťová analýza symptomů a sociálních vazeb"
description = "Dvě síťové metody ve výzkumu epistemické manipulace: psychometrické sítě symptomů a analýza sociálních sítí izolace, kontroly a šíření narativů."
weight = 15

[taxonomies]
tags = ["kompendium", "research-methodology", "quantitative"]
categories = ["academic", "methodology", "research"]

[extra]
related_terms = ["time-series-EA", "causal-inference-EA", "power-analysis-EA", "document-analysis-EA"]
toc = true
+++

Pod názvem „síťová analýza“ se ve výzkumu skrývají dvě odlišné metody a obě jsou pro
[epistemickou anihilaci](@/glossary/epistemicka-anihilace.md) užitečné. **Psychometrické sítě**
zkoumají, jak spolu souvisejí jednotlivé symptomy či prožitky uvnitř člověka. **Analýza
sociálních sítí** zkoumá vztahy mezi lidmi – kdo s kým mluví, odkud kdo bere informace a jak
se síť mění, když se člověk ocitne v izolaci. Tato stránka popisuje obě a varuje před
nejčastějšími nadinterpretacemi.

## Vymezení

**Síťový přístup k psychopatologii** (Borsboom a Cramer 2013) chápe poruchu nikoli jako
skrytou příčinu symptomů, ale jako síť symptomů, které se vzájemně udržují – nespavost zvyšuje
únavu, únava zhoršuje soustředění, horší soustředění posiluje pochybnost o vlastní paměti.
Odhadují se sítě parciálních korelací, v nichž hrana znamená souvislost dvou proměnných po
odečtení vlivu ostatních.

**Analýza sociálních sítí** (Wasserman a Faust 1994) popisuje uzly (lidi, účty, zdroje)
a vazby mezi nimi a měří vlastnosti jako hustota, centralita nebo shlukování. Opírá se
o [teorii grafů](@/glossary/graph-theory.md).

## Kdy metodu použít

- **Struktura následků**: které prožitky po zkušenosti s manipulací spolu nejtěsněji
  souvisejí – například zda nejistota o vlastní paměti souvisí víc s disociací, nebo se
  sociální izolací ([detekční signatura: nejistota o realitě](@/kompendium/detection-signatures/28-phenomenological-reality-uncertainty.md)).
- **Izolace v osobní síti**: jak se zmenšuje a uzavírá egocentrická síť člověka v kontrolujícím
  vztahu nebo skupině ([akcelerace izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md)).
- **Informační monokultura**: z kolika nezávislých zdrojů člověk či skupina čerpá
  ([monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md),
  [epistemická monokultura](@/glossary/epistemicka-monokultura.md)).
- **Šíření narativů a koordinace** v online prostředí: citační kruhy, koordinované sdílení
  ([cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md)).

## Postup

**Psychometrická síť**

1. Volba proměnných – každá má měřit odlišný jev; dvě téměř stejné položky vytvoří silnou,
   ale bezobsažnou hranu.
2. Odhad sítě s regularizací (např. grafický LASSO), vhodný pro malé vzorky.
3. Ověření stability: bootstrap intervalů hran a stability ukazatelů centrality
   (Epskamp, Borsboom a Fried 2018). Bez této kontroly nelze centralitu interpretovat.
4. Opatrný výklad: průřezová síť ukazuje souvislosti, ne směr působení.

**Sociální síť**

1. Vymezení hranic sítě (celá skupina, nebo egocentrická síť jednoho člověka).
2. Sběr vztahových dat – rozhovorem (generátory jmen), z dokumentů nebo z veřejně dostupných
   online dat.
3. Výpočet ukazatelů a jejich změny v čase.
4. Srovnání s náhodnými sítěmi nebo s kontrolní skupinou, aby bylo zřejmé, co je neobvyklé.

## Specifika výzkumu epistemické manipulace

**Centralita není cíl zásahu automaticky.** Populární závěr „nejcentrálnější symptom je
nejlepší cíl léčby“ z průřezových dat neplyne. Pokud vůbec, opírá se o intraindividuální
sítě z [časových řad](@/kompendium/research-methodology/time-series-EA.md) a o experimentální
ověření.

**Síťová data o lidech, kteří nejsou účastníky.** Egocentrická síť obsahuje údaje o třetích
osobách – partnerovi, vůdci skupiny, rodině. Ti nedali souhlas. Data se proto sbírají
v podobě rolí („osoba s autoritou ve skupině“) a ne jmen, a nikdy se nezveřejňují způsobem,
který by síť zrekonstruoval.

**Online sítě a riziko dvojího užití.** Mapa toho, kdo v komunitě koho ovlivňuje, je zároveň
mapou cílů. Publikovat lze vzorce a agregované ukazatele, ne seznamy klíčových uzlů nebo
zranitelných účtů (viz [dual-use poznání](@/glossary/dual-use-poznani.md) a
[přílohu Dual Use](@/kompendium/08-prilohy/dual-use.md)).

**Koordinace versus shoda.** Lidé, kteří sdílejí stejný obsah ve stejnou dobu, nemusí být
koordinovaní – mohou reagovat na stejnou událost. Závěr o koordinaci vyžaduje srovnání
s věrohodným nulovým modelem a další znaky (viz [detekční signatura: Bot coordination](@/kompendium/detection-signatures/20-network-bot-coordination.md)).

## Kritéria kvality

| Oblast | Co doložit |
|---|---|
| Proměnné / uzly | zdůvodnění výběru, překryv položek |
| Odhad | metoda, regularizace, ladicí parametry |
| Stabilita | bootstrap hran a centrality, korelační koeficient stability |
| Hranice sítě | jak byla vymezena, chybějící uzly |
| Srovnání | nulový model nebo kontrolní síť |
| Výklad | jasné odlišení souvislosti a kauzality |

## Etika a ochrana účastníků

Kromě obvyklého souhlasu účastníků je třeba ošetřit ochranu třetích osob v síti a zveřejňovat
jen anonymizované a agregované výsledky ([anonymizace](@/kompendium/research-methodology/anonymization-EA-research.md)).
Vizualizace sítě i bez jmen může v malé skupině umožnit identifikaci – v malých komunitách
se proto obrázky sítí nezveřejňují. Při práci s veřejnými online daty platí, že „veřejné“
neznamená „bez etických nároků“.

## Časté chyby

- síť na malém vzorku bez kontroly stability, prezentovaná jako „struktura poruchy“;
- interpretace hrany jako příčinného vlivu;
- zaměnění koordinace za pouhou souběžnost;
- grafy sítí s viditelnými jmény nebo přezdívkami;
- vynechání uzlů, které nebylo možné sledovat, bez zmínky.

## Ilustrativní příklad

*Hypotetický návrh.* Studie lidí po odchodu ze skupiny s vysokou kontrolou informací sbírá
egocentrické sítě pro období před vstupem, během členství a rok po odchodu. Agregované výsledky
mohou ukázat zúžení sítě během členství a pozvolné rozšiřování po odchodu; souběžně se sleduje
počet nezávislých zdrojů informací. Psychometrická síť na stejném vzorku hledá, zda obnova
sociálních vazeb souvisí s obnovou důvěry ve vlastní úsudek víc než například samotný čas
od odchodu.

Výstupy studie se zveřejní jen jako průměrné ukazatele (velikost sítě, podíl vazeb mimo
skupinu, počet nezávislých zdrojů) a jako stabilitně ověřená psychometrická síť bez
individuálních údajů. Obrázky osobních sítí, které by v malé komunitě umožnily poznat
konkrétní lidi nebo vedoucí postavy skupiny, zůstanou v zabezpečeném archivu týmu.

## Jak číst studii tohoto typu

Obrázek sítě působí přesvědčivě a snadno svádí k závěrům, které data nenesou. Při čtení
psychometrické sítě se vyplatí zeptat:

- **Kolik bylo účastníků a proměnných?** Malý vzorek s mnoha proměnnými dává nestabilní
  síť; bez zprávy o stabilitě nelze pořadí uzlů podle centrality brát vážně.
- **Překrývají se položky obsahově?** Dvě otázky na téměř totéž vytvoří nejsilnější hranu
  sítě a zkreslí centralitu. Dobrá studie takové páry identifikuje a sloučí.
- **Je síť průřezová, nebo z dat v čase?** Průřezová síť popisuje, jak spolu proměnné
  souvisejí napříč lidmi; o tom, co se děje uvnitř jednoho člověka, říká jen málo.
- **Jak autoři mluví o „cílových symptomech“?** Doporučení léčit nejcentrálnější symptom
  potřebuje experimentální oporu.

U analýzy sociálních sítí, zejména online, jsou klíčové jiné otázky:

- **Jak byla vymezena síť?** Data získaná přes jeden hashtag nebo klíčové slovo zachytí jen
  část konverzace a mohou zvýraznit právě ty aktéry, kteří slovo používají nejčastěji.
- **Co je srovnávací základ?** Hustota nebo souběžnost sdílení jsou neobvyklé jen ve srovnání
  s věrohodnou představou, jak by vypadala běžná, nekoordinovaná aktivita.
- **Jsou závěry o úmyslu podložené?** Síťový vzorec může ukazovat na koordinaci, ale nikoli
  na to, kdo ji řídí a proč. Atribuce vyžaduje další druhy důkazů.

Síťová studie je nejsilnější, když tvrdí málo: popisuje strukturu, odhaluje neobvyklé
vzorce a navrhuje hypotézy, které ověří jiné metody.

## Meze a otevřené otázky

Síťové metody jsou mocné v popisu, slabší ve vysvětlení. Otevřenou otázkou je, jak spojit
obě roviny – vnitřní síť prožitků a vnější síť vztahů – v jednom modelu, a jak zkoumat online
sítě bez toho, aby výzkum sám vytvářel nástroj pro cílení. Kontext ke kolektivní rovině
nabízí [sociální epistemologie](@/kompendium/07-teoreticke-reflexe/socialni-epistemologie.md).

## Literatura

- Borsboom, D., Cramer, A. O. J. (2013). Network analysis: An integrative approach to the structure of psychopathology.
- Epskamp, S., Borsboom, D., Fried, E. I. (2018). Estimating psychological networks and their accuracy: A tutorial paper.
- Wasserman, S., Faust, K. (1994). *Social Network Analysis: Methods and Applications.*
- Granovetter, M. S. (1973). The strength of weak ties.

## Související

**Metody v této sekci**

- [Časové řady](@/kompendium/research-methodology/time-series-EA.md) – sítě uvnitř jednoho člověka v čase.
- [Kauzální inference](@/kompendium/research-methodology/causal-inference-EA.md) – proč hrana není příčina.
- [Analýza dokumentů](@/kompendium/research-methodology/document-analysis-EA.md) – zdroj vztahových dat.

**Detekční signatury**

- [Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) – síťový znak informační izolace.
- [Akcelerace izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md) – změna osobní sítě.
- [Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – uzavřené citační kruhy.

**Pojmy**

- [Teorie grafů](@/glossary/graph-theory.md) – matematický základ.
- [Sociální izolace](@/glossary/socialni-izolace.md) – co síťová data zachycují.
- [Dual-use poznání](@/glossary/dual-use-poznani.md) – proč se nezveřejňují mapy cílů.
