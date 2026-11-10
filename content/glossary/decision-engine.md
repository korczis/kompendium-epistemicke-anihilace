+++
title = "Decision engine"
weight = 100
description = "Decision engine jako systém podpory rozhodování: kořeny v teorii rozhodování, kalibrace a statistická predikce, automatizační zkreslení a epistemická obrana."

[taxonomies]
tags = ["glossary", "teorie-rozhodovani", "metodologie", "epistemologie", "kompendium"]

[extra]
category = "metodologie"
related_terms = ["decision-core", "inference", "risk-score", "signal-plurality", "kognitivni-bias", "paralysis-by-analysis"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
+++

## Vymezení

Decision engine, česky rozhodovací systém nebo jádro systému podpory rozhodování, označuje
formalizovaný postup, který z mnoha vstupů, například zjištění, signálů a předpokladů, vytváří
strukturované rozhodnutí nebo doporučení spolu s vyjádřením míry jistoty. Může být založen na
explicitních pravidlech, na pravděpodobnostním modelu nebo na statistickém učení. Teoretickým
základem je normativní teorie rozhodování, která popisuje, jak by se měl racionální aktér
rozhodovat za nejistoty, a deskriptivní psychologie úsudku, která ukazuje, jak se lidé ve
skutečnosti rozhodují a kde chybují (Raiffa, 1968; Kahneman, 2011).

V kompendiu pojem vstupuje z rodové linie platformy, z níž kniha vzešla; kapitola
[2.7 Vztah ke Decision Engine a Color Teams](@/kompendium/02-uvod/vztah-k-decision-engine.md)
popisuje, jak tato linie chápala rozhodovací vrstvu, a heslo
[Decision Core](@/glossary/decision-core.md) její konkrétní architekturu. Toto heslo se
zaměřuje na obecný pojem a jeho akademické kořeny: proč může formalizované rozhodování sloužit
jako obrana proti epistemické manipulaci a kde jsou jeho meze (Meehl, 1954; Kahneman, 2011).
Nepopisuje vlastnosti žádného
konkrétního softwaru jako ověřený fakt.

## Teoretický původ

Moderní teorie rozhodování vychází z axiomatické teorie očekávaného užitku, kterou formulovali
John von Neumann a Oskar Morgenstern (von Neumann a Morgenstern, 1944), a z díla Leonarda
Savage, který ji spojil se subjektivní pravděpodobností a ukázal, za jakých podmínek lze
racionální volbu popsat jako maximalizaci očekávaného užitku při osobních pravděpodobnostech
(Savage, 1954). Howard Raiffa z těchto základů vytvořil praktickou rozhodovací analýzu, tedy
postup, jak rozložit složité rozhodnutí na pravděpodobnosti, důsledky a hodnoty a ty pak
výslovně posoudit (Raiffa, 1968).

Herbert Simon proti idealizovanému modelu postavil pojem omezené racionality: skutečný aktér má
omezené informace, čas i výpočetní kapacitu, a proto nehledá optimum, ale uspokojivé řešení
(Simon, 1955). Amos Tversky a Daniel Kahneman pak systematicky popsali heuristiky a zkreslení,
jimiž se lidský úsudek odchyluje od normativních pravidel, například ukotvení, dostupnost a
přehlížení základní míry (Tversky a Kahneman, 1974). Z těchto zjištění vychází myšlenka, že
formalizovaný postup může některé chyby lidského úsudku vyrovnat.

Klíčovým empirickým argumentem je spor o klinickou a statistickou predikci. Paul Meehl ukázal,
že jednoduché statistické postupy předpovídají výsledky často stejně dobře nebo lépe než
zkušení klinici (Meehl, 1954), a Robyn Dawes doložil, že i nevážené lineární modely s rozumně
zvolenými proměnnými překonávají intuitivní úsudek (Dawes, 1979). Pro hodnocení pravděpodobnostních
předpovědí navrhl Glenn Brier skóre, které měří odchylku předpovězené pravděpodobnosti od
skutečného výsledku a odměňuje dobře kalibrované předpovědi (Brier, 1950).

## Mechanismus a pozorovatelné znaky

Z hlediska epistemické obrany má formalizované rozhodování tři ochranné vlastnosti. Zaprvé
vynucuje explicitnost: předpoklady, váhy a zdroje musí být vysloveny, takže je lze přezkoumat a
zpochybnit (Raiffa, 1968). Zadruhé odděluje odhad pravděpodobnosti od hodnocení důsledků, a tím
ztěžuje manipulaci, která mísí strach s pravděpodobností. Zatřetí umožňuje zpětnou kontrolu
kalibrace: pokud systém nebo člověk tvrdí devadesátiprocentní jistotu, mělo by se to, co
předpověděl, splnit přibližně v devíti případech z deseti (Brier, 1950). Philip Tetlock na
rozsáhlém souboru expertních předpovědí ukázal, že právě kalibrace a ochota revidovat odhady
odlišují spolehlivé posuzovatele od přesvědčivých, ale nespolehlivých (Tetlock, 2005).

Manipulace může formalizovaný postup obejít na vstupu i na výstupu. Na vstupu jde o zdánlivou
mnohost zdrojů, které ve skutečnosti opakují jediný původ; heslo
[pluralita signálů](@/glossary/signal-plurality.md) popisuje, proč je nezávislost zdrojů
důležitější než jejich počet. Na výstupu jde o přenesení autority: číslo nebo verdikt systému se
přijímá jako nezpochybnitelný, i když vychází ze sporných předpokladů. Raja Parasuraman a
Victor Riley popsali, jak lidé automatizaci nadužívají, spoléhají na ni i tam, kde selhává, a
přestávají ji kontrolovat (Parasuraman a Riley, 1997).

## Odlišení od příbuzných jevů

Rozhodovací systém je třeba odlišit od pouhého skóre rizika. Skóre je jedním vstupem nebo
výstupem, kdežto rozhodovací systém zahrnuje i pravidla, jak se skóre interpretuje, jak se
zachází s nejistotou a kdo nese odpovědnost; heslo [risk score](@/glossary/risk-score.md) tento
rozdíl rozvádí. Odlišný je i od [inference](@/glossary/inference.md) jako obecného procesu
vyvozování: rozhodovací systém inferenci využívá, ale přidává k ní hodnoty a volbu jednání
(Savage, 1954).

Důležité je i odlišení od algoritmického rozhodování, které nahrazuje lidský úsudek bez možnosti
přezkumu. Literatura o automatizaci zdůrazňuje, že systém podpory rozhodování má lidský úsudek
informovat, nikoli nahradit, a že odpovědnost za rozhodnutí zůstává na člověku (Parasuraman a
Riley, 1997). Rizika zkresleného algoritmického rozhodování kompendium rozebírá na stránce
[algoritmické zkreslení rozhodování](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md).

## Klinický, právní a organizační rámec

V klinické oblasti se formalizované rozhodování uplatňuje ve strukturovaných posudkových
nástrojích, které doplňují klinický rozhovor. Meehlova práce vedla k širokému přijetí
strukturovaných nástrojů, zároveň však ukázala, že jejich hodnota závisí na kvalitě proměnných a
na tom, zda se používají pro populaci, na níž byly ověřeny (Meehl, 1954). Posouzení
rozhodovací způsobilosti člověka, které kompendium popisuje na stránce
[škála rozhodovací způsobilosti](@/kompendium/techniques/ea-8-1-10-decision-making-capacity-scale.md),
je příkladem strukturovaného postupu v klinické praxi.

V organizacích a v [due diligence](@/glossary/due-diligence.md) slouží formalizované rozhodování ke sledovatelnosti: z
dokumentace má být zřejmé, na jakých zjištěních rozhodnutí stálo a kdo ho učinil. Tento princip
rozvádí oddíl [sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md)
a stránka [kalibrace v due diligence](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md).
Kahneman zdůrazňuje, že strukturované postupy jsou užitečné zejména tam, kde je prostředí
nepravidelné a kde intuice nemá možnost učit se ze zpětné vazby (Kahneman, 2011).

## Obrana a zotavení

Pro jednotlivce lze principy rozhodovacích systémů převést do jednoduchých návyků: výslovně
napsat, co je známo a co je předpokládáno, odhadnout pravděpodobnost dříve, než se rozhodne o
jednání, a zpětně si ověřovat, jak přesné byly vlastní odhady (Tetlock, 2005). Tyto návyky
chrání proti manipulaci, která vytváří časový tlak nebo směšuje emoce s pravděpodobností.
Kompendium je popisuje na stránce
[kalibrace důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md).

Zotavení po zkušenosti, v níž člověk ztratil důvěru ve vlastní úsudek, může využít strukturu
jako dočasnou oporu: pravidla, která rozhodování zpomalují a zviditelňují, umožňují postupně
znovu budovat sebedůvěru na základě ověřených výsledků. Zároveň je třeba se vyhnout opačnému
extrému, kdy se hledání další evidence stává nekonečným odkladem; heslo
[paralysis by analysis](@/glossary/paralysis-by-analysis.md) tento vzorec popisuje (Simon, 1955).

## Meze a otevřené otázky

Formalizované rozhodování není neutrální: volba proměnných, vah a prahů vyjadřuje hodnoty těch,
kdo systém navrhli, a model může zkreslení spíše skrýt než odstranit (Kahneman, 2011). Simonova
lekce o omezené racionalitě platí i pro systémy, které nemohou zahrnout vše podstatné (Simon,
1955). Otevřenou otázkou zůstává, jak zachovat výhody statistické predikce a zároveň udržet
lidskou odpovědnost a možnost přezkumu, zejména tam, kde je model složitý a jeho fungování
obtížně vysvětlitelné; tuto otázku literatura o automatizaci zatím nevyřešila (Parasuraman a
Riley, 1997).

## Literatura

- Brier, G. W. (1950). Verification of forecasts expressed in terms of probability. *Monthly
  Weather Review, 78*(1), 1–3.
- Dawes, R. M. (1979). The robust beauty of improper linear models in decision making.
  *American Psychologist, 34*(7), 571–582.
- Kahneman, D. (2011). *Thinking, fast and slow*. Farrar, Straus and Giroux.
- Meehl, P. E. (1954). *Clinical versus statistical prediction: A theoretical analysis and a
  review of the evidence*. University of Minnesota Press.
- Parasuraman, R., & Riley, V. (1997). Humans and automation: Use, misuse, disuse, abuse.
  *Human Factors, 39*(2), 230–253.
- Raiffa, H. (1968). *Decision analysis: Introductory lectures on choices under uncertainty*.
  Addison-Wesley.
- Savage, L. J. (1954). *The foundations of statistics*. John Wiley & Sons.
- Simon, H. A. (1955). A behavioral model of rational choice. *The Quarterly Journal of
  Economics, 69*(1), 99–118.
- Tetlock, P. E. (2005). *Expert political judgment: How good is it? How can we know?*
  Princeton University Press.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases.
  *Science, 185*(4157), 1124–1131.
- von Neumann, J., & Morgenstern, O. (1944). *Theory of games and economic behavior*.
  Princeton University Press.

## Související

**Pojmy glosáře**

- [Decision Core](@/glossary/decision-core.md) – architektura rozhodovací vrstvy v rodové linii
  platformy.
- [Inference](@/glossary/inference.md) – vyvozování, na němž rozhodování stojí.
- [Risk score](@/glossary/risk-score.md) – dílčí výstup, který rozhodovací systém interpretuje.
- [Pluralita signálů](@/glossary/signal-plurality.md) – nezávislost zdrojů jako podmínka
  spolehlivého vstupu.
- [Kognitivní bias](@/glossary/kognitivni-bias.md) – zkreslení, která má formalizace vyrovnávat.

**Kapitoly a mosty**

- [Vztah ke Decision Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md) – kapitola o
  rozhodovací vrstvě v rámci knihy.
- [Bridge: decision-engine](@/kompendium/glossary-bridges/bridge-decision-engine.md) – propojení
  hesla s kapitolami.
- [Kalibrace v due diligence](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md) –
  uplatnění v hloubkové prověrce.

**Obrana a rizika**

- [Kalibrace důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md) – osobní návyk
  kalibrovaného úsudku.
- [Algoritmické zkreslení rozhodování](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md)
  – riziko automatizace bez přezkumu.
