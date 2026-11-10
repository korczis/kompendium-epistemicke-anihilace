+++
title = "Kauzální inference bez experimentu"
description = "Jak vyvozovat příčiny z observačních dat o epistemické manipulaci: kauzální grafy, zavádějící proměnné, párování, přirozené experimenty a citlivostní analýzy."
weight = 17

[taxonomies]
tags = ["kompendium", "research-methodology", "quantitative"]
categories = ["academic", "methodology", "research"]

[extra]
related_terms = ["RCT-EA-considerations", "longitudinal-study-EA", "time-series-EA", "effect-size-EA"]
parent = "kompendium-research-methodology"
toc = true
+++

Nejdůležitější otázky o [epistemické anihilaci](@/glossary/epistemicka-anihilace.md) jsou
kauzální: způsobuje dlouhodobé zpochybňování vnímání trvalé obtíže s důvěrou ve vlastní
úsudek? Chrání před ní sociální opora? Experimentálně je zkoumat nelze, protože nikoho nelze
manipulaci vystavit (viz [Randomizované studie a jejich etické meze](@/kompendium/research-methodology/RCT-EA-considerations.md)).
Zbývají observační data – a soubor metod, které z nich umožňují opatrné kauzální závěry.

## Vymezení

Kauzální inference je obor, který formálně popisuje, za jakých předpokladů lze z dat vyvodit
příčinný účinek. Dvě hlavní tradice se doplňují: **rámec potenciálních výsledků**
(Rubinův model – účinek je rozdíl mezi tím, co se stalo, a tím, co by se stalo bez expozice)
a **strukturní kauzální modely** s kauzálními grafy (Pearl 2009). Klasický rámec validity
pro kvaziexperimenty shrnují Shadish, Cook a Campbell (2002). Přístupný úvod do praktické
epidemiologické podoby nabízí Hernán a Robins.

## Kdy metodu použít

- Když expozici **nelze randomizovat**: zkušenost s [coercive control](@/glossary/coercive-control.md),
  členství ve [vysoce kontrolující skupině](@/glossary/high-control-group.md), vystavení
  koordinované dezinformační kampani.
- Když existují **přirozené experimenty**: změna pravidel, uzavření skupiny, zavedení nového
  zákona – událost, která rozdělí lidi „jako by náhodně“.
- Když je třeba **odlišit výběr od účinku**: lidé s určitými rysy mohou do manipulativních
  vztahů vstupovat častěji; bez kauzálního rámce se snadno zamění příčina a důsledek.

## Postup

1. **Přesná kauzální otázka.** Co je expozice, co výsledek, v jaké populaci a v jakém čase.
2. **Kauzální graf (DAG).** Nakreslit předpokládané vztahy mezi expozicí, výsledkem
   a dalšími proměnnými. Graf ukáže, které proměnné je třeba kontrolovat (zavádějící
   proměnné), a které naopak kontrolovat nesmíme (prostředníci, společné důsledky – tzv.
   *collider*, jehož kontrola vytváří falešné souvislosti).
3. **Volba identifikační strategie:**
   - úprava na zavádějící proměnné (regrese, párování podle propenzitního skóre, vážení);
   - instrumentální proměnná – faktor, který ovlivňuje expozici, ale výsledek jen skrze ni;
   - rozdíl v rozdílech – srovnání změny u exponované a neexponované skupiny;
   - regresní diskontinuita – srovnání lidí těsně nad a pod pravidlovým prahem;
   - přerušené časové řady (viz [Časové řady](@/kompendium/research-methodology/time-series-EA.md)).
4. **Ověření předpokladů**, která lze ověřit (překryv skupin, paralelní trendy před událostí).
5. **Citlivostní analýza** pro předpoklady, které ověřit nelze: jak silná by musela být
   neměřená zavádějící proměnná, aby výsledek zmizel.
6. **Opatrná formulace závěru** – „za předpokladů X a Y odpovídá výsledek účinku o velikosti Z“.

## Specifika výzkumu epistemické manipulace

**Obrácená kauzalita.** Nízká důvěra ve vlastní úsudek může být důsledkem manipulace i její
podmínkou (zranitelnost). Ze stejného průřezového vzorku nelze tyto směry odlišit.
[Longitudinální data](@/kompendium/research-methodology/longitudinal-study-EA.md) s měřením
před expozicí jsou vzácná, ale cenná – vznikají například v obecných kohortových studiích,
které nebyly navrženy pro toto téma.

**Výběr do vzorku jako collider.** Studie, která nabírá jen lidi v terapii, podmiňuje vzorek
na společném důsledku expozice i obtíží. To může vytvořit nebo skrýt souvislosti. Kauzální
graf takové riziko zviditelní.

**Měření expozice.** Expozice („byl vystaven gaslightingu“) se měří zpětně a hodnocení je
ovlivněno současným stavem. Chyba v měření expozice závislá na výsledku je zdrojem zkreslení,
který nelze odstranit statisticky, jen lepším měřením (dokumenty z doby, výpovědi třetích
osob – viz [třetiosobní potvrzení](@/kompendium/forensic-legal/37-third-party-corroboration.md)).

**Pokušení příběhu.** Kauzální příběh „manipulace způsobila X“ je morálně přitažlivý. Kauzální
rámec vyžaduje formulovat i alternativní cesty a testovat je – což je zároveň ochrana proti
tomu, co kniha nazývá [kruhovým uvažováním v EA detekci](@/kompendium/critical-perspectives/4-circular-reasoning-risk.md).

## Kritéria kvality

| Oblast | Co doložit |
|---|---|
| Otázka | přesně definovaná expozice, výsledek, populace, čas |
| Graf | zveřejněný DAG a zdůvodnění hran |
| Strategie | proč zvolená identifikace odpovídá datům |
| Předpoklady | testy ověřitelných, citlivostní analýzy neověřitelných |
| Výsledek | odhad účinku s intervalem, ne jen „souvislost“ |
| Formulace | podmíněnost závěru na předpokladech |

## Etika a ochrana účastníků

Kauzální závěry mají praktické důsledky – v soudních sporech, v politice, v klinické praxi.
Nadsazený kauzální závěr může poškodit konkrétní lidi (např. zjednodušené „X vždy způsobuje Y“
v rodinněprávních sporech; viz [rodinné právo](@/kompendium/forensic-legal/41-family-court-EA.md)).
Odpovědné sdělení výsledků proto patří k etice metody stejně jako ochrana dat.

## Časté chyby

- „kontrolovali jsme vše, co jsme měli“ místo zdůvodněného výběru proměnných;
- kontrola prostředníka (proměnné na cestě od expozice k výsledku), která účinek „zmizí“;
- párování podle propenzitního skóre prezentované jako náhrada randomizace bez citlivostní analýzy;
- slabý instrument, který zkreslení zvětší místo zmenšení;
- kauzální jazyk v závěru studie, která v metodách tvrdí, že zkoumá „jen souvislosti“.

## Ilustrativní příklad

*Hypotetický návrh.* Obecná populační kohorta měřila sociální oporu a psychickou pohodu
dlouho předtím, než část účastníků později uvedla zkušenost s kontrolujícím vztahem. Tým
nakreslí graf (věk, předchozí psychické obtíže, socioekonomická situace jako zavádějící
proměnné; terapie jako prostředník) a použije vážení podle propenzitního skóre. Citlivostní
analýza ukáže, jak silná by musela být neměřená proměnná, aby odhad zmizel. Závěr se formuluje
jako podmíněný odhad, ne jako důkaz.

Tým zároveň testuje alternativní vysvětlení: zda lidé s nižší výchozí sociální oporou
nevstupovali do kontrolujících vztahů častěji (výběr), a zda souvislost nevzniká jen tím,
že lidé s horší pohodou zpětně častěji hlásí kontrolující chování (chyba měření expozice).
Pokud odhad obstojí v obou kontrolách, je závěr silnější; pokud ne, zpráva to otevřeně
uvede. Obě varianty jsou užitečné – ta druhá chrání praxi před přehnanými tvrzeními.

## Jak číst studii tohoto typu

Observační studie s kauzálními ambicemi se dají číst podle několika otázek, které nevyžadují
pokročilou statistiku:

- **Je kauzální otázka vyslovena?** Studie, která mluví o „rizikových faktorech“ a „dopadech“,
  ale v metodách tvrdí, že zkoumá jen souvislosti, by měla přiznat, co vlastně chce vědět.
- **Je zveřejněn kauzální graf nebo aspoň zdůvodnění výběru kontrolních proměnných?** Seznam
  „kontrolovali jsme věk, pohlaví a vzdělání“ bez zdůvodnění nic neříká o tom, zda byly
  kontrolovány ty správné proměnné.
- **Předcházela expozice výsledku?** U průřezových dat to zpravidla nelze doložit.
- **Byla provedena citlivostní analýza?** A pokud ano, je výsledek robustní vůči
  neměřeným vlivům věrohodné velikosti?
- **Shodují se výsledky různých strategií?** Pokud regresní úprava, párování a přirozený
  experiment ukazují stejným směrem, je závěr výrazně silnější.
- **Jak velký je odhadnutý účinek a s jakou nejistotou?** Velký účinek s velmi širokým
  intervalem je slabší sdělení, než se zdá.

Zvlášť opatrně je třeba číst studie, z nichž by plynul jednoduchý vzorec pro soudní nebo
sociální praxi („kdo zažil X, nemůže Y“). Kauzální účinek na úrovni populace je průměrem
a neříká, co se stalo konkrétnímu člověku. Pro posouzení jednotlivého případu je nutná
individuální odborná práce – viz [posuzování věrohodnosti](@/kompendium/forensic-legal/2-credibility-assessment.md)
a [pattern důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md).

## Meze a otevřené otázky

Žádná metoda nevytvoří kauzalitu z dat, která pro ni nemají oporu. Otevřené zůstává, jak
modelovat procesy, kde se expozice a výsledek ovlivňují navzájem v čase (zpětné vazby, které
kniha popisuje jako autoamplifikaci), a jak měřit expozici, jejíž rozpoznání je samo
výsledkem zotavení.

## Literatura

- Shadish, W. R., Cook, T. D., Campbell, D. T. (2002). *Experimental and Quasi-Experimental Designs for Generalized Causal Inference.*
- Pearl, J. (2009). *Causality: Models, Reasoning, and Inference* (2. vyd.).
- Hernán, M. A., Robins, J. M. *Causal Inference: What If.*
- Rosenbaum, P. R., Rubin, D. B. (1983). The central role of the propensity score in observational studies for causal effects.

## Související

**Metody v této sekci**

- [Randomizované studie](@/kompendium/research-methodology/RCT-EA-considerations.md) – kde randomizace možná je.
- [Longitudinální studie](@/kompendium/research-methodology/longitudinal-study-EA.md) – časové pořadí jako podmínka kauzálního výkladu.
- [Časové řady](@/kompendium/research-methodology/time-series-EA.md) – přerušené řady a přirozené experimenty.
- [Velikost účinku](@/kompendium/research-methodology/effect-size-EA.md) – jak výsledný odhad vyjádřit.

**Kritika**

- [Kruhové uvažování v EA detekci](@/kompendium/critical-perspectives/4-circular-reasoning-risk.md) – riziko potvrzování vlastního rámce.
- [Framework overreach](@/kompendium/critical-perspectives/3-framework-overreach.md) – když rámec vysvětluje vše.

**Forenzní rovina**

- [Třetiosobní potvrzení](@/kompendium/forensic-legal/37-third-party-corroboration.md) – nezávislé měření expozice.

**Pojmy**

- [Konfirmační bias](@/glossary/konfirmacni-bias.md) – proč je třeba testovat alternativní cesty.
