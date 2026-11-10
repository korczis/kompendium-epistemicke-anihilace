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

„Bot“ je v běžné řeči nálepka pro jakýkoli nepříjemný účet; analyticky je užitečnější mluvit
o **koordinovaném neautentickém chování**, kdy skupina účtů – automatizovaných, poloautomatizovaných
nebo ovládaných lidmi – jedná společně a skrývá, že jde o jednoho aktéra. Na jednom účtu se to
obvykle poznat nedá, poznává se to na vztazích mezi účty, a i spolehlivé rozlišení automatu od
člověka je samo o sobě obtížné a předmětem aktivního výzkumu (Ferrara et al., 2016). Scénář navazuje
na [injekci narativu](@/kompendium/educational-scenarios/15-narrative-injection.md) a přidává
kvantitativní rovinu, protože síla takových sítí nespočívá v jednotlivém příspěvku, ale v souhře mnoha
účtů, jejíž dopad na veřejnou debatu dokládá rostoucí literatura o výpočetní propagandě (Woolley &
Howard, 2019).

## Učební cíle a jejich zdůvodnění

Cvičení směřuje k tomu, aby účastník popsal tři nezávislé roviny detekce – časovou, síťovou a
obsahovou – aby v datech našel časové shluky, překrývající se sítě sledujících a opakované textové
vzorce a aby vysvětlil, proč silný závěr vyžaduje shodu více rovin. Zdůraznění shody rovin je
nezbytné proto, že každý jednotlivý marker má přirozené, nekoordinované vysvětlení, a teprve jejich
souběh odlišuje neautentickou síť od organizované, avšak legitimní kampaně skutečných lidí; právě
tuto souhru využily empirické analýzy, které doložily vliv automatizovaných účtů na online debatu
při konkrétních politických událostech (Bessi & Ferrara, 2016). Dalším cílem je rozpoznat zdroje
falešně pozitivních nálezů (fanouškovské komunity, plánované příspěvky institucí) a sepsat zjištění
tak, aby je bylo možné předat platformě nebo zveřejnit bez poškození skutečných uživatelů.

## Scénář

Výzkumný tým dostane anonymizovaný, synteticky připravený datový soubor dvou set účtů, které se během
jednoho týdne vyjadřovaly k fiktivnímu zákonu o ochraně podzemních vod; pro každý účet jsou k dispozici
datum založení, počet sledujících a sledovaných, seznam sledovaných účtů, časové značky příspěvků,
texty příspěvků a sdílené odkazy. Facilitátor do souboru vložil tři skupiny. První skupina (asi
šedesát účtů) je koordinovaná síť: účty založené v rozmezí dvou týdnů se vzájemně sledují, publikují
v minutových intervalech po „startovním“ příspěvku jednoho účtu a texty jsou variacemi tří šablon.
Druhá skupina (asi čtyřicet účtů) je skutečná ekologická iniciativa, která se domluvila na „dni
sdílení“: účty jsou staré, různorodé a publikují ve shluku, ale vlastními slovy. Třetí skupina (asi
sto účtů) jsou běžní uživatelé s nepravidelnou aktivitou. Týmy pracují ve třech krocích: nejprve
provedou časovou analýzu (histogram příspěvků po minutách, hledání shluků a jejich „startérů“), poté
síťovou analýzu (graf vzájemného sledování a hledání hustě propojených skupin s malým napojením na
zbytek sítě, viz [graph theory](@/glossary/graph-theory.md)) a nakonec obsahovou analýzu (podobnost
textů, opakované fráze, sdílené odkazy); v závěru porovnají výsledky všech tří rovin a rozhodnou
o každé skupině. Trojí členění souboru záměrně staví vedle sebe neautentickou síť a legitimní, avšak
koordinovanou iniciativu, protože právě jejich záměna je nejčastější chybou analýz, které se opírají
jen o povrchové znaky synchronizace (Bessi & Ferrara, 2016).

## Jak se vzorec pozná

Nejnápadnějším markerem je časová synchronizace, tedy nástup mnoha účtů v rozmezí minut po jednom
příspěvku ([signatura bot coordination](@/kompendium/detection-signatures/20-network-bot-coordination.md)),
doplněná o kohortu založení, kdy mnoho účtů vzniklo v krátkém období. V síťové vrstvě je to uzavřený
klastr, v němž se účty sledují hlavně navzájem a spojení se zbytkem sítě je slabé, a v obsahové vrstvě
šablonový obsah, jehož texty se liší jen povrchně (záměna slov, pořadí vět), spolu s monotematičností.
Doplňuje je asymetrie amplifikace, tedy velký dosah z malého počtu původních textů
([signatura](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md)), a přesah
platforem, kdy se stejné šablony objeví na více sítích
([EA-9.4.7 Cross-Platform Bot Cascade](@/kompendium/techniques/ea-9-4-7-cross-platform-bot-cascade.md)).
Žádný z těchto markerů není sám o sobě důkaz: u koordinované sítě se shodují všechny tři roviny,
kdežto skutečná iniciativa má sice časový shluk, ale staré účty s rozmanitou historií, bez uzavřeného
klastru a s vlastními slovy. Empirické studie přitom ukazují, že expozice dezinformacím bývá silně
koncentrovaná u malého počtu účtů, takže objem příspěvků sám o sobě nevypovídá o skutečném zásahu
publika (Grinberg et al., 2019).

## Odlišení koordinace legitimní od manipulativní

Rozlišujícím pojmem je *neautentické*: skuteční lidé se mohou domluvit, že budou sdílet, a taková
koordinace je legitimní. Manipulací se stává tehdy, když skrývá, že jde o jednoho aktéra, a vytváří
dojem nezávislých hlasů
([EA-9.4.2 Coordinated Inauthentic Behavior](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md)).
Druhá skupina ve scénáři je přesně ten falešně pozitivní nález, kterému má analýza předejít: kdyby
účty patřily skutečným lidem s doložitelnou identitou, kteří se zaregistrovali kvůli tématu, a texty
vznikly z veřejně sdílené šablony, šlo by o organizovanou kampaň, nikoli o neautentickou síť. Je také
třeba přesně odlišit, co data ukazují: dosah a synchronizaci, nikoli změnu názorů. Tvrzení o dopadu
na veřejné mínění vyžaduje jiný typ důkazu a analytik by je neměl vyvozovat z počtu sdílení, zvláště
když se ukazuje, že vliv sociálních sítí na postoje je slabší a složitější, než se běžně předpokládá
(Bail, 2021).

## Obrana a zotavení

Obrana spočívá ve zveřejnění vzorce a agregovaných dat, nikoli seznamů jmen: druhou skupinu je třeba
výslovně neoznačit a platformě předat podklady se zdůvodněním
([bot detection v investigativním workflow](@/kompendium/cross-domain/6-ea-osint-bot-detection.md)).
Toto omezení není jen etické, ale i metodické, protože zveřejnění seznamu účtů bez přezkumu poškozuje
skutečné lidi, vystavuje je obtěžování a zároveň znehodnocuje analýzu nálepkou, kterou nelze doložit.
Zotavení zasaženého prostředí – diskuse, komunity, platformy – spočívá v obnově rozlišení mezi
autentickým a neautentickým hlasem, protože hlavní škodou koordinovaných sítí není jen šíření
konkrétního obsahu, nýbrž eroze důvěry ke všem hlasům, po níž začnou být i skuteční lidé podezíráni,
že jsou „boti“. Dlouhodobou odpovědí je proto spíše posilování ověřitelnosti a transparentnosti
původu než plošné mazání, jak zdůrazňuje výzkum výpočetní propagandy (Woolley & Howard, 2019).

## Debriefing pro facilitátora

Facilitátor odhalí skladbu souboru a nechá týmy porovnat, jak zařadily druhou skupinu; pokud ji
některý tým označil za koordinovanou síť, rozebere, který marker k tomu vedl, neboť to je hlavní
učební moment. Poté se věnuje otázce dopadu, protože analytici mají tendenci přeceňovat vliv, který
nelze přímo vidět; data o koncentraci expozice ukazují, proč je tato opatrnost namístě (Grinberg
et al., 2019). Je třeba hlídat čtyři časté chyby: ztotožnění nového účtu s botem, spoléhání na jedinou
rovinu, nadsazení dopadu z dosahu a zveřejnění jmen. Facilitátor zdůrazní etiku práce s daty, protože
i synteticky připravený soubor modeluje skutečné lidi a při práci s reálnými daty platí pravidla
ochrany osobních údajů a minimalizace.

## Meze a otevřené otázky

Scénář pracuje s čistým, předem připraveným souborem; reálná data bývají neúplná, účty lze cíleně
„stárnout“ a nejpokročilejší sítě napodobují organické chování natolik, že je čistě statistická
detekce nespolehlivá. Otevřenou otázkou zůstává, jak kvantifikovat skutečný dopad koordinované
aktivity na postoje a chování, když dosah a přesvědčení nejsou totéž a kauzální důkaz je obtížné
získat. Diskutovat je rovněž třeba rostoucí roli generativních jazykových modelů, které umožňují
levně vytvářet obsahově rozmanité texty a tím oslabují obsahovou rovinu detekce, takže váha se
přesouvá na rovinu časovou a síťovou, přičemž i tyto roviny selhávají u sítí, které jsou navrženy tak,
aby organické chování co nejvěrněji napodobily, a jejich spolehlivé rozlišení zůstává otevřeným
výzkumným problémem (Ferrara et al., 2016).

## Literatura

- Bail, C. A. (2021). *Breaking the Social Media Prism: How to Make Our Platforms Less Polarizing*. Princeton University Press.
- Bessi, A., & Ferrara, E. (2016). Social Bots Distort the 2016 U.S. Presidential Election Online Discussion. *First Monday*, 21(11).
- Ferrara, E., Varol, O., Davis, C., Menczer, F., & Flammini, A. (2016). The Rise of Social Bots. *Communications of the ACM*, 59(7).
- Grinberg, N., Joseph, K., Friedland, L., Swire-Thompson, B., & Lazer, D. (2019). Fake News on Twitter During the 2016 U.S. Presidential Election. *Science*, 363(6425).
- Woolley, S. C., & Howard, P. N. (2019). *Computational Propaganda: Political Parties, Politicians, and Political Manipulation on Social Media*. Oxford University Press.

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
