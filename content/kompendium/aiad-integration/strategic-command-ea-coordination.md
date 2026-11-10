+++
title = "Strategic Command a koordinace obrany proti EA"
description = "Jak úroveň L4 Strategic Command na Prismatic Platform převádí strategický záměr na koordinované plány napříč doménami a proč eskalace k autoritě nemá být jedinou cestou nesouhlasu."
weight = 18

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "governance"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["supreme-commander-ea-strategy", "archer-supreme-ea-orchestration", "tactical-execution-ea-operations", "operational-execution-ea-deployment", "perimeter-ea-attack-surface"]
toc = true
+++

# Strategic Command a koordinace obrany proti EA

[Strategic Command](@/glossary/strategic-command.md) (strategické velení) je úroveň agentů L4 v hierarchii [AIAD](@/glossary/aiad.md) na Prismatic Platform, softwarové platformě, z níž kniha vzešla. Podle hesla glosáře odpovídá za koordinaci napříč doménami a za řízení průřezových operací: propojuje doménové specialisty, kteří pracují v úzce vymezených oblastech, s agenty nejvyšší úrovně, kteří mají pravomoc nad celou platformou. Ve vztahu k taxonomii epistemických útoků (EA) je Strategic Command plánovací vrstvou – převádí strategický záměr do plánů, v nichž se obrana proti různým technikám skládá do koordinovaného celku. Stránka popisuje tuto roli, její slabinu a poučení, které z ní kniha vyvozuje – včetně toho, co od ní nepřebírá.

## Agent v kostce

Glosář vysvětluje, proč je střední úroveň řízení kritická: většina skutečných operací přesahuje hranice domén. Zlepšení obrany zahrnuje brány kvality, změny kódu, testování, nasazení i monitorování a žádná jednotlivá specializovaná doména nepokrývá všechny tyto stránky. Bez strategické koordinace optimalizují doménoví specialisté lokálně, ale celek se nemusí zlepšit. Strategic Command zároveň slouží jako eskalační brána k nejvyšší autoritě, když operace přesáhnou jeho rozsah.

Původní verze této stránky popisuje práci agenta jako správu závislostí a časování: plán operací má podobu grafu úkolů s milníky a podmínkami, za nichž se plán mění. Agent sleduje rozdíl mezi plánem a skutečností a při významném odchýlení spouští nové plánování.

## Proč se týká technik EA

Techniky popsané v knize se zřídka vyskytují izolovaně; [mosty mezi oddíly](@/kompendium/section-bridges/_index.md) a stránky [Cross-Domain](@/kompendium/cross-domain/_index.md) ukazují, jak se tatáž technika projevuje v prověrkách, v bezpečnosti, v souladu s předpisy i v klinice. Obrana proti nim proto musí být koordinovaná: posílení kontroly nezávislosti zdrojů v jedné doméně nepomůže, pokud jiná doména přebírá tvrzení bez kontroly. Strategic Command podle původní stránky čte tyto průřezové části knihy právě kvůli pochopení, jak spolu oblasti taxonomie souvisejí napříč doménami.

## Jak pracuje

Koordinace mezi strategií a provedením naráží na rozdíl mezi plánem a skutečností. Clausewitz (1832) popsal tento rozdíl jako „tření“ – souhrn drobných nepředvídatelností, které způsobují, že nic neprobíhá podle plánu. Korzybski (1933) jej formuloval obecně: mapa není území. Původní stránka uvádí, že slabinou Strategic Command je právě práce s mapou místo terénu: pokud data z provozu zaostávají, plány se rozcházejí se skutečností. Obranou je soustavné porovnávání plánu se zpětnou vazbou z nižších úrovní a ochota plán změnit.

Druhým principem je správa závislostí. Úkoly mají pořadí a některé nelze zahájit, dokud nejsou dokončeny jiné. Simon (1962) ukázal, že hierarchické uspořádání umožňuje zvládat složitost tím, že se vazby uvnitř modulů oddělí od vazeb mezi nimi; Strategic Command spravuje právě vazby mezi moduly – mezi doménami a týmy.

Třetím principem je oddělení plánování od provedení. Strategic Command plánuje, ale sám nenasazuje; tím zůstává mezi rozhodnutím a jeho provedením kontrolní bod, v němž lze plán ještě zastavit. Totéž oddělení kniha doporučuje v institucích, kde o zásadních krocích nemá rozhodovat a zároveň je provádět jediná osoba.

## Spolupráce s dalšími agenty

Strategic Command přijímá záměr od [Supreme Commandera](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md), deleguje úkoly na [Tactical Execution](@/kompendium/aiad-integration/tactical-execution-ea-operations.md) a koordinuje s [Operational Execution](@/kompendium/aiad-integration/operational-execution-ea-deployment.md) nasazení změn. V krizi spolupracuje s [Archer Supreme](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md) na rozdělení úkolů. Podklady pro investiční rozhodnutí přijímá například od [Perimeter](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md) a priority modelování hrozeb od [Black Teamu](@/kompendium/aiad-integration/black-team-ea-modeling.md).

## Příklad

Strategický záměr stanoví, že se má posílit obrana proti postupnému přepisování významu dříve přijatých tvrzení. Strategic Command z něj sestaví plán: nejprve [Gray Team](@/glossary/gray-team.md) projde specifikace a najde místa, kde se význam tvrzení může měnit bez záznamu; poté [Blue Team](@/glossary/blue-team.md) doplní kontrolu, [White Team](@/glossary/white-team.md) ověří invariant a Operational Execution změnu nasadí. Každý krok má milník a podmínku, za níž se plán přehodnotí – například když Gray Team najde víc mezer, než se čekalo. V průběhu se ukáže, že jedna doména přebírá tvrzení z jiné bez provenience; Strategic Command plán rozšíří o tuto vazbu, protože bez ní by oprava v původní doméně nic nezměnila.

V lidských organizacích odpovídá tomuto příkladu situace, kdy se nápravné opatření po případu manipulativního vedení zavede v jednom oddělení, ale stejný vzorec pokračuje jinde, protože nikdo neodpovídá za celek (srov. [obnova kultury](@/kompendium/organizational-defense/39-cultural-rebuild.md)).

## Co z toho plyne pro čtenáře knihy

Heslo glosáře uvádí, že Strategic Command nemá v taxonomii EA přímý protějšek a že kniha z něj **nepřebírá hierarchický model**. V lidských organizacích je naopak důležité, aby eskalace k vyšší autoritě nebyla jedinou cestou, jak zpochybnit rozhodnutí (srov. [mechanismus oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md)). Kde jediný kanál nesouhlasu vede přes nadřízeného, tam může nadřízený nesouhlas zastavit – a právě na tomto principu stojí řada technik [delegitimizace](@/glossary/delegitimizace.md) a [institucionálního vyloučení](@/kompendium/techniques/ea-2-1-7-institucionalni-vyloucenni.md).

Přenositelné je naopak poučení o **koordinaci napříč doménami**. Ochrana lidí před manipulací v instituci zahrnuje personalistiku, vedení, právní oddělení, zdravotní péči i komunikaci. Pokud každá z nich jedná samostatně, vznikají mezery. Kniha proto doporučuje pro závažné případy jasně určit, kdo celek koordinuje (viz [reakce na incident](@/kompendium/organizational-defense/31-incident-response-EA.md)), a zároveň zachovat nezávislé kanály pro nesouhlas.

Třetím poučením je **pokora plánu**. Plán obrany i plán péče o člověka jsou mapou, nikoli územím. Kniha v klinické části opakovaně zdůrazňuje, že fáze zotavení se překrývají a člověk se mezi nimi vrací; plán, který tuto skutečnost nepřipouští, škodí.

## Plán jako hypotéza

Z pohledu epistemické bezpečnosti je plán zvláštním druhem přesvědčení: tvrzením o tom, jak se budoucnost vyvine, pokud se udělají určité kroky. Jako každé přesvědčení má mít dohledatelný původ, vyjádřenou míru jistoty a kritéria, podle nichž se pozná, že neplatí. Strategic Command s plánem zachází právě tak – podmínky přehodnocení jsou součástí plánu od začátku. Tím se chrání před [eskalací závazku](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) v podobě imunizovaného plánu, který se brání každému signálu, že nefunguje. Klein (2007) navrhl pro lidské týmy předběžnou analýzu selhání, při níž se tým před zahájením projektu ptá, proč by mohl selhat; tatáž otázka patří k plánům obrany i k plánům péče. V lidských organizacích je obvyklé opačné selhání: plán se stane symbolem loajality a jeho zpochybnění projevem nedůvěry k vedení – přesně prostředí, v němž se daří technikám delegitimizace.

## Meze a otevřené otázky

Strategic Command nemá přímý kontakt s provozem a jeho plány jsou jen tak dobré jako zpětná vazba, kterou dostává. Hierarchická eskalace je v softwaru účinná, protože agenti nemají osobní zájmy; v lidských organizacích je tatáž struktura zranitelná vůči zneužití. Otevřenou otázkou je, jak v systému s jasnou hierarchií zajistit, aby se nálezy z nižších úrovní, které odporují strategickému záměru, dostaly nahoru bez zkreslení – otázka, kterou kniha klade i lidským institucím.

## Literatura

- Klein, G. (2007). Performing a project premortem. *Harvard Business Review*, 85(9), 18–19.
- Clausewitz, C. von (1832). *Vom Kriege*. Berlin: Dümmler.
- Korzybski, A. (1933). *Science and Sanity: An Introduction to Non-Aristotelian Systems and General Semantics*. Lancaster, PA: International Non-Aristotelian Library.
- Simon, H. A. (1962). The architecture of complexity. *Proceedings of the American Philosophical Society*, 106(6), 467–482.

## Související

**Strategičtí agenti**

- [Supreme Commander a strategie](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md) – zdroj strategického záměru.
- [Tactical Execution a operace](@/kompendium/aiad-integration/tactical-execution-ea-operations.md) – provedení plánu.
- [Operational Execution a nasazení](@/kompendium/aiad-integration/operational-execution-ea-deployment.md) – nasazení změn.

**Pojmy**

- [Strategic Command](@/glossary/strategic-command.md) – heslo glosáře.
- [AIAD](@/glossary/aiad.md) – standard definic agentů.

**Kniha**

- [Mechanismus oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md) – nesouhlas mimo hierarchii.
- [Reakce na incident](@/kompendium/organizational-defense/31-incident-response-EA.md) – koordinace v organizaci.
- [Cross-Domain](@/kompendium/cross-domain/_index.md) – tatáž technika v různých doménách.
