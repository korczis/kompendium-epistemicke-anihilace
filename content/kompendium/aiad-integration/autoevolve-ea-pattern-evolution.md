+++
title = "AutoEvolve a vývoj detekčních vzorců EA"
description = "Jak systém AutoEvolve na Prismatic Platform hledá a ověřuje vylepšení detekce technik EA, proč optimalizace podle jediné míry hrozí slepotou a co z toho plyne pro lidské učení."
weight = 21

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "quality"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["autoheal-ea-regression-repair", "purple-team-ea-synthesis", "qeve-ea-quality-validation", "quality-monitor-ea-tracking", "black-team-ea-modeling"]
parent = "kompendium-aiad-integration"
toc = true
+++

# AutoEvolve a vývoj detekčních vzorců EA

[AutoEvolve](@/glossary/autoevolve.md) je autonomní systém zlepšování Prismatic Platform, softwarové platformy, z níž kniha vzešla. Podle hesla glosáře průběžně vyhledává příležitosti k optimalizaci, aplikuje ověřená vylepšení s možností návratu a ověřuje je branami kvality. Na rozdíl od [AutoHeal](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md), který opravuje regrese a obnovuje známý dobrý stav, posouvá AutoEvolve platformu vpřed. Ve vztahu k taxonomii epistemických útoků (EA) se tato schopnost uplatňuje při vývoji detekčních vzorců: obrana, která se nemění, zastarává, protože techniky manipulace se proměňují. Stránka popisuje, jak AutoEvolve pracuje, jaká rizika nese automatické zlepšování a co z jeho principu kniha přenáší na lidské poznávání.

## Agent v kostce

Glosář popisuje třífázový cyklus AutoEvolve: **detekci** příležitostí ke zlepšení, **aplikaci** ověřených vylepšení s možností automatického návratu a **validaci** vylepšení branami kvality. Každé vylepšení musí projít stejně přísnou kontrolou jako jakákoli jiná změna kódu – bez varování kompilátoru, bez porušení statické analýzy a s úspěšným během celé sady testů (viz heslo [Clean Run](@/glossary/clean-run.md)). Dohromady s [AutoHeal](@/glossary/autoheal.md) tvoří AutoEvolve autonomní systém udržování kvality: AutoHeal brání regresi, AutoEvolve pohání zlepšování.

Původní verze této stránky popisuje použití AutoEvolve v detekci technik EA jako evoluční proces: kandidátní detekční pravidla se generují, testují proti telemetrii a nejlepší z nich se navrhují k zařazení. Meta-detekcí je rozpoznání, kdy současná pravidla začínají stagnovat, tedy kdy jejich účinnost klesá. Kandidátní pravidla nejdou přímo do provozu; nejprve je posoudí [Purple Team](@/kompendium/aiad-integration/purple-team-ea-synthesis.md).

## Proč se týká technik EA

Techniky popsané v knize nejsou statické. Nové platformy, nové formy komunikace a nové technologie, například syntetická média (viz [deepfake](@/glossary/deepfake.md)), mění podobu manipulace. Kniha to odráží tím, že taxonomii popisuje jako otevřenou a revidovatelnou ([metodologické poznámky](@/kompendium/02-uvod/metodologicke-poznamky.md)). Obrana platformy musí sledovat totéž: pravidlo, které spolehlivě zachytávalo určitý vzorec, může ztratit účinnost, když se vzorec změní. AutoEvolve je odpovědí na tuto proměnlivost – soustavně hledá, kde obrana zaostává, a navrhuje její zlepšení.

## Jak pracuje

Evoluční přístup k hledání řešení má v informatice dlouhou tradici; Holland (1975) popsal genetické algoritmy jako způsob, jak hledat dobrá řešení ve velkém prostoru možností pomocí variace a výběru. Síla tohoto přístupu je v tom, že dokáže najít řešení, která by člověk nenavrhl. Slabina je v tom, že výsledek je jen tak dobrý jako míra, podle níž se vybírá. Původní stránka výslovně uvádí riziko konvergence k místnímu optimu: pravidla, která výborně fungují na známé útoky, ale jsou slepá k novým variantám. Doporučuje proto pravidelně do procesu vnášet rozmanitost.

S tím souvisí obecnější problém měření. Campbell (1979) upozornil, že kvantitativní ukazatel používaný k rozhodování podléhá tlakům, které jej zkreslují, a Strathernová (1997) jej shrnula tak, že když se míra stane cílem, přestává být dobrou mírou. Evoluční systém, který optimalizuje míru zachycení na známých vzorcích, se může naučit „hrát“ na tuto míru místo skutečné odolnosti. Platforma toto riziko tlumí tím, že kandidáty posuzuje [Purple Team](@/kompendium/aiad-integration/purple-team-ea-synthesis.md), jejich kvalitu ověřuje [QEVE](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) a nové vzorce, které ještě nejsou v datech, dodává abstraktní modelování [Black Teamu](@/kompendium/aiad-integration/black-team-ea-modeling.md).

Důležité je i to, že AutoEvolve nemá pravomoc měnit kritéria, podle nichž se jeho výsledky hodnotí. Kdyby si systém mohl sám upravovat měřítko úspěchu, mohl by vykázat zlepšení, které by bylo jen změnou pravidel hodnocení – jev, který kniha u lidských institucí popisuje jako [přepisování kritérií hodnocení](@/kompendium/techniques/ea-2-4-5-evaluation-criteria-rewrite.md).

## Spolupráce s dalšími agenty

AutoEvolve čerpá data od [Purple Teamu](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) a [Blue Teamu](@/kompendium/aiad-integration/blue-team-ea-defense.md), signály stagnace od [Quality Monitor](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md) a [QEVE](@/kompendium/aiad-integration/qeve-ea-quality-validation.md). Dlouhodobé opravy připravuje ve spolupráci s [AutoHeal](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) a jeho výsledky ověřuje [White Team](@/kompendium/aiad-integration/white-team-ea-verification.md).

## Příklad

Quality Monitor zaznamená, že účinnost pravidla pro odhalování zdánlivé shody mnoha zdrojů se společným původem postupně klesá. AutoEvolve spustí cyklus: vytvoří několik kandidátních úprav pravidla a otestuje je na záznamech z provozu i na scénářích Red Teamu. Nejlepší kandidát zvyšuje zachycení, ale [Purple Team](@/glossary/purple-team.md) si všimne, že jeho zlepšení stojí na jediném rysu – na časovém odstupu mezi zdroji –, který lze snadno změnit. Kandidát se proto nezařadí v této podobě; AutoEvolve dostane zadání hledat řešení, které nestojí na jediném povrchovém rysu. Teprve druhá generace, ověřená i na variantách, projde validací a je nasazena s možností návratu.

Lidskou obdobou je učení, které kniha popisuje v [detekčním tréninku](@/kompendium/recovery-protocols/subacute-detection-training.md): kdo se naučí rozpoznávat manipulaci podle jediného povrchového znaku, snadno přehlédne její jinou podobu.

## Co z toho plyne pro čtenáře knihy

Heslo glosáře uvádí, že obdobný princip – sledovat vlastní stav, nacházet slabiny a opravovat je ověřitelně – kniha uplatňuje na lidské poznávání (viz [metakognice](@/glossary/metakognice.md)). Člověk, který se zotavuje z manipulace, i odborník, který s takovými lidmi pracuje, potřebuje schopnost revidovat vlastní představy o tom, jak manipulace vypadá. Kniha k tomu nabízí [revizi přesvědčení](@/kompendium/self-defense-guides/7-belief-revision.md), [osobní audit zkreslení](@/kompendium/self-defense-guides/38-bias-audit-personal.md) a [kognitivní flexibilitu](@/kompendium/self-defense-guides/8-cognitive-flexibility.md).

Druhým poučením je **varování před optimalizací podle jediné míry**. Instituce, která hodnotí prevenci jen podle počtu proškolených zaměstnanců, nebo terapie, která hodnotí zotavení jen podle jedné škály, se vystavuje stejnému riziku jako evoluční systém: zlepší číslo, ale ne skutečnost. Kniha proto doporučuje kombinovat měření s kvalitativním posouzením a s pohledem zvenčí.

Třetím poučením je **zlepšování s možností návratu**. AutoEvolve nasazuje změny tak, aby se daly vrátit. V lidské praxi to odpovídá zkoušení nových postupů v malém, se sledováním účinků a s připraveností od nich upustit – postup bližší výzkumu než přesvědčení.

## Zlepšování a jeho hranice v knize

Myšlenka soustavného zlepšování má v knize i svůj stín. Řada prostředí, která kniha popisuje, stojí na nekonečném požadavku „růstu“ a „transformace“: člověk není nikdy dost dobrý, každý stav je jen přípravou na další, vyšší úroveň (srov. [případ kultu sebezdokonalování](@/kompendium/case-studies/14-self-help-cult.md) a [koučink pod nátlakem](@/kompendium/case-studies/17-coach-coercion.md)). Rozdíl mezi zdravým zlepšováním a takovým tlakem je v tom, kdo určuje cíl, podle čeho se úspěch pozná a zda je dovoleno přestat. AutoEvolve má cíl stanovený zvenčí, úspěch měřený ověřitelně a každé vylepšení vratné. V lidské rovině kniha doporučuje stejná tři kritéria: cíl, který si člověk volí sám, měřítko, které lze ověřit nezávisle na tom, kdo zlepšení požaduje, a právo říct „stačí“. Kde chybí kterékoli z nich, mění se zlepšování v nástroj kontroly (viz [sebesoucit](@/kompendium/self-defense-guides/16-self-compassion.md) a [vyjasnění hodnot](@/kompendium/self-defense-guides/44-axiology-clarification.md)).

## Meze a otevřené otázky

AutoEvolve může konvergovat k místnímu optimu a je slepý k vzorcům, které se v datech dosud neobjevily. Automatické zlepšování je silné tam, kde existuje dobrá míra úspěchu, a slabé tam, kde je úspěch obtížně měřitelný – a právě to je u epistemických útoků častý případ. Otevřenou otázkou je, jakou část vývoje obrany svěřit automatickému procesu a jakou ponechat lidskému úsudku a teoretickému modelování.

## Literatura

- Campbell, D. T. (1979). Assessing the impact of planned social change. *Evaluation and Program Planning*, 2(1), 67–90.
- Holland, J. H. (1975). *Adaptation in Natural and Artificial Systems*. Ann Arbor: University of Michigan Press.
- Strathern, M. (1997). 'Improving ratings': Audit in the British University system. *European Review*, 5(3), 305–321.

## Související

**Agenti**

- [AutoHeal a oprava regresí](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) – reaktivní protějšek.
- [QEVE a ověřování kvality](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) – ověřuje kvalitu závěrů.
- [Purple Team a syntéza](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) – posuzuje kandidátní vzorce.

**Pojmy**

- [AutoEvolve](@/glossary/autoevolve.md) – heslo glosáře.
- [Clean Run](@/glossary/clean-run.md) – brány kvality.
- [Metakognice](@/glossary/metakognice.md) – lidská obdoba sebezlepšování.

**Kniha**

- [Revize přesvědčení](@/kompendium/self-defense-guides/7-belief-revision.md) – ověřitelné opravování vlastních představ.
- [Metodologické poznámky](@/kompendium/02-uvod/metodologicke-poznamky.md) – taxonomie jako otevřený systém.
