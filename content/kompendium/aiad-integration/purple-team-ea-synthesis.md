+++
title = "Purple Team a syntéza útoku a obrany proti EA"
description = "Jak Purple Team Prismatic Platform propojuje nálezy Red a Blue Teamu a má výhradní pravomoc uzavírat bezpečnostní nálezy – a proč „uzavřít“ smí jen ten, kdo ověřil nápravu."
weight = 12

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "color-teams"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["red-team-ea-detection", "blue-team-ea-defense", "white-team-ea-verification", "autoevolve-ea-pattern-evolution", "gray-team-ea-edge-cases"]
toc = true
+++

# Purple Team a syntéza útoku a obrany proti EA

[Purple Team](@/glossary/purple-team.md) je ústředním syntetickým uzlem [barevných týmů](@/glossary/color-teams.md) Prismatic Platform, softwarové platformy, z níž kniha vzešla. Stojí mezi útočným [Red Teamem](@/kompendium/aiad-integration/red-team-ea-detection.md) a obranným [Blue Teamem](@/kompendium/aiad-integration/blue-team-ea-defense.md): přiřazuje útočná zjištění obranným schopnostem, udržuje zpětnou vazbu mezi oběma stranami a – podle hesla glosáře – má výhradní pravomoc rozhodnout, že je bezpečnostní nález uzavřen. Tato stránka popisuje, jak Purple Team pracuje s taxonomií epistemických útoků (EA), proč je výhradní pravomoc k uzavření důležitá a co z jeho principu plyne pro kliniky, vyšetřovatele a organizace, které s knihou pracují.

## Agent v kostce

Purple teaming vznikl v bezpečnostní praxi z poznání, že Red a [Blue Team](@/glossary/blue-team.md) pracující odděleně si nálezy předávají neúčinně: zjištění se ztrácejí, obrana zůstává netestovaná proti známým útokům a vznikají slepá místa. Glosář uvádí, že model Purple Teamu to řeší vyhrazenou syntetickou funkcí – každý scénář útoku má odpovídat ověřené obraně a každá obrana má být ověřena proti scénáři. Purple Team tedy neútočí ani nebrání; jeho výstupem jsou mapy pokrytí, nálezy mezer a rozhodnutí o uzavření.

Původní verze této stránky popisuje jeho činnost jako meta-analýzu: porovnává matici útoků Red Teamu se záchyty Blue Teamu, hledá kombinace, které prošly nezachyceny, a z nich formuluje hypotézy pro nové detekční vzorce. Zvláštní pozornost věnuje **vzájemně se posilujícím kombinacím technik**, které jednotlivé týmy samy nepostřehnou, protože každý vidí jen svou část.

## Proč se týká technik EA

Taxonomie knihy popisuje techniky jednotlivě, ale v praxi se vyskytují v kombinacích. Stránky technik uvádějí konjunkce a eskalační řetězce, [terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md) popisují sekvence, v nichž se techniky vzájemně posilují, a [případové studie](@/kompendium/case-studies/_index.md) ukazují, jak taková kombinace vypadá v průběhu. Purple Team pracuje s týmž poznatkem na straně platformy: obrana, která zachytí každou techniku zvlášť, může selhat proti jejich kombinaci, protože žádný jednotlivý krok nepřekročí práh. Kniha tento jev popisuje u člověka jako rozdíl mezi technikou a sekvencí (viz [most Základní kategorie → Terminální protokoly](@/kompendium/section-bridges/bridge-03-to-04-zakladni-terminalni.md)).

## Jak pracuje

Jádrem práce Purple Teamu je **uzavírání smyčky**. Nález Red Teamu se stává úkolem pro Blue Team; Blue Team navrhne a nasadí obranu; Purple Team ověří, zda obrana skutečně zachytí původní scénář i jeho varianty, a teprve pak nález uzavře. [White Team](@/kompendium/aiad-integration/white-team-ea-verification.md) k tomu dodává konstruktivní důkazy o tom, že opravené vlastnosti drží. Glosář barevných týmů uvádí, že rozhodnutí o uzavření kombinuje útočná zjištění, obranné postavení a konstruktivní důkazy.

Tento postup odpovídá tomu, co literatura o organizačním učení po incidentech považuje za podmínku skutečné nápravy. Dekker (2006) upozorňuje, že organizace mají sklon uzavírat vyšetřování ve chvíli, kdy najdou „lidskou chybu“, místo aby změnily podmínky, které chybu umožnily. Weick a Sutcliffe (2007) popsali organizace s vysokou spolehlivostí jako ty, které se zdráhají zjednodušovat výklad selhání a soustavně sledují slabé signály. Purple Team je institucionální pojistkou proti předčasnému uzavření: kdo nemá ověřenou nápravu, nesmí nález označit za vyřešený.

## Spolupráce s dalšími agenty

Purple Team přijímá vstupy od [Red Teamu](@/kompendium/aiad-integration/red-team-ea-detection.md) a [Blue Teamu](@/kompendium/aiad-integration/blue-team-ea-defense.md), od [Gray Teamu](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md) přebírá nálezy mezer ve specifikacích a dilemata klasifikace a od [White Teamu](@/kompendium/aiad-integration/white-team-ea-verification.md) konstruktivní důkazy. Kandidátní detekční vzorce předává [AutoEvolve](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) a jeho výstupy jsou podkladem pro [QEVE](@/kompendium/aiad-integration/qeve-ea-quality-validation.md), které ověřuje kvalitu závěrů.

## Příklad

[Red Team](@/glossary/red-team.md) v simulaci ukáže, že tvrzení podložené řadou zdrojů s jedním společným původem projde obranou, pokud jsou zdroje přidávány postupně v delším časovém odstupu. Blue Team na nález reaguje úpravou kontroly nezávislosti zdrojů. Purple Team nález neuzavře okamžitě: nejprve si vyžádá opakování původního scénáře a dvou jeho variant – s jiným tempem přidávání zdrojů a s jiným typem zdroje – a ověří, že obrana zachytí všechny tři. Teprve s doložením od White Teamu, že kontrola nezávislosti funguje i na okrajových vstupech, je nález uzavřen. Zjištěná kombinace „postupné přidávání + společný původ“ se zároveň zapíše jako vzorec, na který je třeba myslet i u jiných obran.

V lidském světě má tento příklad přesnou obdobu v technice [pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) a v detekční signatuře [cirkularity citací](@/kompendium/detection-signatures/18-network-citation-circularity.md): zdánlivá shoda mnoha hlasů, které ve skutečnosti opakují jeden zdroj, je přesvědčivější, když přichází postupně.

## Co z toho plyne pro čtenáře knihy

Heslo glosáře shrnuje, co kniha z Purple Teamu přebírá: myšlenku, že **„uzavřít“ problém smí jen ten, kdo ověřil skutečnou nápravu, nikoli ten, komu uzavření přináší úlevu**. V oblasti EA to platí pro intervence i pro hodnocení zotavení. Instituce, která po stížnosti na manipulativní vedení provede jedno školení a věc uzavře, jedná opačně než Purple Team: uzavírá na základě úlevy, ne ověření. Kniha proto v organizační obraně zdůrazňuje [poincidentní učení](@/kompendium/organizational-defense/40-post-incident-learning.md) a [interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md), které končí doloženou změnou, a v klinice [dlouhodobou prevenci relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md), která nepovažuje odeznění akutních obtíží za konec péče.

Druhým přenositelným principem je **pohled na kombinace**. Klinik, který posuzuje jednotlivé zážitky klienta odděleně, může přehlédnout vzorec, který vzniká teprve jejich součtem – přesně jako obrana, která zachytí každou techniku zvlášť. Purple Team tak ilustruje, proč kniha klade důraz na průběh v čase a na [rekonstrukci časové osy](@/kompendium/06-klinicke-aplikace/biographical-timeline-rekonstrukce.md).

## Uzavření jako rozhodnutí s následky

Rozhodnutí, že je problém vyřešen, není neutrální administrativní krok. Uzavřený nález přestává být sledován, přestává čerpat pozornost a zdroje a jeho opětovné otevření vyžaduje nový důvod. Proto je tak lákavé uzavírat předčasně – a proto platforma tuto pravomoc svěřuje jedinému týmu s jasnými kritérii. Power (1997) ukázal na příkladu auditu, že organizace mohou vytvářet „rituály ověřování“, které vyvolávají dojem kontroly, aniž by ověřovaly skutečný stav; uzavírání nálezů bez doložené nápravy je přesně takovým rituálem.

Pro lidské instituce plyne z tohoto pohledu jednoduchá kontrolní otázka: kdo u nás rozhoduje, že stížnost na manipulativní chování je vyřešena, a podle čeho? Pokud o tom rozhoduje ten, kdo je stížností dotčen, nebo ten, komu uzavření ulehčí práci, chybí funkce, kterou na platformě plní Purple Team. Kniha k tomu nabízí stránky o [výboru pro audit](@/kompendium/organizational-defense/5-audit-committee-EA.md) a o [roli ombudsmana](@/kompendium/organizational-defense/6-ombudsman-role.md).

## Meze a otevřené otázky

Kvalita syntézy závisí na kvalitě vstupů: pokud Red Team nebo Blue Team dodávají málo dat, zdegeneruje syntéza na vágní zobecnění. Výhradní pravomoc k uzavření je silnou pojistkou, ale soustředí odpovědnost do jednoho místa; i Purple Team proto podléhá auditu White Teamu. Otevřenou otázkou je, jak dlouho po uzavření sledovat, zda se nález nevrací – stejná otázka, kterou si kniha klade u zotavení lidí.

## Literatura

- Power, M. (1997). *The Audit Society: Rituals of Verification*. Oxford: Oxford University Press.
- Dekker, S. (2006). *The Field Guide to Understanding Human Error*. Aldershot: Ashgate.
- Weick, K. E., & Sutcliffe, K. M. (2007). *Managing the Unexpected: Resilient Performance in an Age of Uncertainty* (2nd ed.). San Francisco: Jossey-Bass.
- Zenko, M. (2015). *Red Team: How to Succeed by Thinking Like the Enemy*. New York: Basic Books.

## Související

**Barevné týmy a agenti**

- [Red Team a detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md) – zdroj útočných nálezů.
- [Blue Team a obrana](@/kompendium/aiad-integration/blue-team-ea-defense.md) – navrhuje obranu.
- [White Team a ověřování](@/kompendium/aiad-integration/white-team-ea-verification.md) – dodává konstruktivní důkazy.
- [AutoEvolve a evoluce vzorců](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) – přebírá kandidátní vzorce.

**Pojmy**

- [Purple Team](@/glossary/purple-team.md) – heslo glosáře.
- [Color Teams](@/glossary/color-teams.md) – architektura toku signálů.

**Kniha**

- [Poincidentní učení](@/kompendium/organizational-defense/40-post-incident-learning.md) – lidská obdoba uzavírání smyčky.
- [Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md) – techniky v kombinacích.
