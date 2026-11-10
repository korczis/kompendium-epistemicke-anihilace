+++
title = "Vzdělávací scénář: Koordinace botů"
date = 2026-04-26
description = "Datový soubor 200 účtů: časová synchronizace, překrývající se sítě sledujících a opakované texty jako znaky koordinovaného neautentického chování."
weight = 100
draft = false

[taxonomies]
tags = ["kompendium", "educational-scenario", "intermediate", "boti"]

[extra]
level = "Intermediate"
type = "educational-scenario"
+++

# Vzdělávací scénář: Koordinace botů

> **Úroveň**: Intermediate
> **Učební cíl**: Detekovat synchronizované neautentické chování (*coordinated inauthentic behavior*) v datech a odlišit ho od organické aktivity
> **Doporučená délka**: 150 minut (práce s tabulkovým procesorem nebo jednoduchým grafovým nástrojem)
> **Pro koho**: analytici OSINT, výzkumníci sociálních médií, bezpečnostní týmy, datoví novináři

„Bot“ je v běžné řeči nálepka pro jakýkoli nepříjemný účet. Analyticky je užitečnější mluvit
o **koordinovaném neautentickém chování**: skupina účtů – automatizovaných, polo-automatizovaných
nebo ovládaných lidmi – jedná společně a skrývá, že jde o jednoho aktéra. Na jednom účtu se
to obvykle poznat nedá; poznává se to na vztazích mezi účty. Scénář navazuje na
[injekci narativu](@/kompendium/educational-scenarios/15-narrative-injection.md) a přidává
kvantitativní rovinu.

## Učební cíle

Účastník po cvičení:

1. popíše tři nezávislé roviny detekce: časovou, síťovou a obsahovou;
2. v datech najde časové shluky, překrývající se sítě sledujících a opakované textové vzorce;
3. vysvětlí, proč silný závěr vyžaduje shodu více rovin, a pozná zdroje falešně pozitivních
   nálezů (fanouškovské komunity, organizované kampaně skutečných lidí, plánované příspěvky
   institucí);
4. sepíše zjištění tak, aby je bylo možné předat platformě nebo zveřejnit bez poškození
   skutečných uživatelů.

## Scénář

Výzkumný tým dostane anonymizovaný, synteticky připravený datový soubor 200 účtů, které se
během jednoho týdne vyjadřovaly k fiktivnímu zákonu o ochraně podzemních vod. Pro každý účet
jsou k dispozici: datum založení, počet sledujících a sledovaných, seznam sledovaných účtů,
časové značky příspěvků, texty příspěvků a sdílené odkazy.

Facilitátor do souboru vložil tři skupiny:

- **Skupina 1 (cca 60 účtů):** koordinovaná síť; účty založené v rozmezí dvou týdnů, vzájemně
  se sledují, publikují v minutových intervalech po „startovním“ příspěvku jednoho účtu,
  texty jsou variacemi tří šablon.
- **Skupina 2 (cca 40 účtů):** skutečná ekologická iniciativa, která se domluvila na „dni
  sdílení“; účty jsou staré, různorodé, publikují ve shluku, ale vlastními slovy.
- **Skupina 3 (cca 100 účtů):** běžní uživatelé s nepravidelnou aktivitou.

Týmy pracují ve třech krocích po 30 minutách:

1. **Časová analýza** – histogram příspěvků po minutách, hledání shluků a jejich „startérů“.
2. **Síťová analýza** – graf vzájemného sledování; hledání hustě propojených skupin s malým
   napojením na zbytek sítě (základní pojmy viz [graph theory](@/glossary/graph-theory.md)).
3. **Obsahová analýza** – podobnost textů, opakované fráze, sdílené odkazy.

V závěrečných 40 minutách týmy porovnají výsledky všech tří rovin a rozhodnou o každé skupině.

## Signály, kterých si všimnout

- **Časová synchronizace** – nástup mnoha účtů v rozmezí minut po jednom příspěvku; viz
  [signatura bot coordination](@/kompendium/detection-signatures/20-network-bot-coordination.md).
- **Kohorta založení** – mnoho účtů vzniklo v krátkém období.
- **Uzavřený klastr** – účty se sledují hlavně navzájem; spojení se zbytkem sítě je slabé.
- **Šablonový obsah** – texty se liší jen povrchně (záměna slov, pořadí vět).
- **Monotematičnost** – účty nemají jinou činnost než dané téma.
- **Asymetrie amplifikace** – velký dosah z malého počtu původních textů;
  [signatura](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md).
- **Přesah platforem** – stejné šablony na více platformách, viz
  [EA-9.4.7 Cross-Platform Bot Cascade](@/kompendium/techniques/ea-9-4-7-cross-platform-bot-cascade.md).

## Diskusní otázky

1. Která rovina analýzy byla pro skupinu 1 nejvýmluvnější? A pro skupinu 2?
2. Proč skupina 2 vykazuje časový shluk, a přesto nejde o neautentické chování?
3. Kdy je koordinace legitimní? Kde leží hranice mezi kampaní a manipulací?
4. Co by vaše zařazení skupiny 1 vyvrátilo?
5. Jak informovat veřejnost nebo platformu, aby se nepoškodili skuteční uživatelé?
6. Jaký je rozdíl mezi „boti mají vliv“ a „boti mění názory“? Co z toho vaše data ukazují?

## Modelové odpovědi

- **K otázce 1–2.** U skupiny 1 se shodují všechny tři roviny. Skupina 2 má časový shluk, ale
  účty jsou staré, mají rozmanitou historii, nesledují se v uzavřeném klastru a píší vlastními
  slovy. Jediný marker nestačí – a skupina 2 je přesně ten falešně pozitivní nález, kterému
  má analýza předejít.
- **K otázce 3.** Klíčové je slovo *neautentické*: skuteční lidé se mohou domluvit, že budou
  sdílet. Manipulací se koordinace stává tehdy, když skrývá, že jde o jednoho aktéra, a vytváří
  dojem nezávislých hlasů; viz [EA-9.4.2 Coordinated Inauthentic Behavior](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md).
- **K otázce 4.** Pokud by účty patřily skutečným lidem s doložitelnou identitou, kteří se
  zaregistrovali kvůli tématu (např. po společné akci), a texty vznikly z veřejně sdílené
  šablony – pak jde o organizovanou kampaň, ne o neautentickou síť.
- **K otázce 5.** Zveřejňovat vzorec a agregovaná data, ne seznamy jmen; skupinu 2 výslovně
  neoznačit; platformě předat podklady se zdůvodněním. Viz
  [bot detection v investigativním workflow](@/kompendium/cross-domain/6-ea-osint-bot-detection.md).
- **K otázce 6.** Data ukazují dosah a synchronizaci, ne změnu názorů. Tvrzení o dopadu na
  veřejné mínění vyžaduje jiný typ důkazu; analytik by ho neměl vyvozovat z počtu sdílení.

## Časté chyby

- **„Nový účet = bot.“** Mnoho lidí si zakládá účty kvůli konkrétnímu tématu.
- **Jedna rovina.** Spoléhání jen na čas, nebo jen na text.
- **Nadsazení dopadu.** Z dosahu se vyvozuje vliv na názory.
- **Zveřejnění jmen.** Seznamy účtů bez přezkumu poškozují skutečné lidi a vystavují je
  obtěžování.

## Debriefing pro facilitátora

Odhalte skladbu souboru a nechte týmy porovnat, jak zařadily skupinu 2. Pokud ji některý
tým označil za koordinovanou síť, rozeberte, který marker k tomu vedl – to je hlavní učební
moment. Poté se věnujte otázce 6; analytici mají tendenci přeceňovat dopad, protože ho nelze
přímo vidět.

Zdůrazněte etiku práce s daty: i synteticky připravený soubor modeluje skutečné lidi. Při práci
s reálnými daty platí pravidla ochrany osobních údajů a minimalizace.

## Rozšiřující úkoly

1. **Vlastní metrika.** Navrhněte skóre, které kombinuje tři roviny, a otestujte, zda správně
   oddělí skupiny 1 a 2.
2. **Mass reporting.** Prostudujte [EA-9.3.8 Mass Reporting Coordination](@/kompendium/techniques/ea-9-3-8-mass-reporting-coordination.md)
   a navrhněte, jak by se stejné tři roviny daly použít na koordinované nahlašování obsahu.
3. **Bojiště sociálních sítí.** Přečtěte si [sociální sítě jako EA bojiště](@/kompendium/cross-domain/5-ea-osint-social-media-manipulation.md)
   a zařaďte scénář do jeho typologie.

## Související

**Navazující scénáře**

- [Injekce narativu](@/kompendium/educational-scenarios/15-narrative-injection.md) – obsahová stopa téhož jevu.
- [Rozpoznání mediální smečky](@/kompendium/educational-scenarios/14-media-mob-recognition.md) – přenos do tradičních médií.
- [Emergentní vzorec](@/kompendium/educational-scenarios/29-emergent-pattern.md) – agregace jako metoda.

**Techniky**

- [EA-9.4.1 Bot Amplification Coordinated](@/kompendium/techniques/ea-9-4-1-bot-amplification-coordinated.md) – koordinovaná amplifikace.
- [EA-9.4.5 Troll Farm](@/kompendium/techniques/ea-9-4-5-troll-farm-EA.md) – lidmi ovládané sítě.

**Detekční signatury**

- [Bot coordination](@/kompendium/detection-signatures/20-network-bot-coordination.md) – kritéria a validace.
- [Platformní koordinace](@/kompendium/detection-signatures/21-network-platform-coordination.md) – koordinace napříč platformami.

**Glosář a metodologie**

- [OSINT](@/glossary/osint.md) – rámec otevřených zdrojů.
- [Časové řady v EA monitoringu](@/kompendium/research-methodology/time-series-EA.md) – metodický základ časové analýzy.
