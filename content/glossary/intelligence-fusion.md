+++
title = "Intelligence fusion (fúze zpravodajství)"
aliases = ["/glossary/signal-plurality/"]
weight = 28
description = "Spojování informací z více nezávislých zdrojů do jednoho posouzení, jak se při něm hodnotí zdroje a rozpory, a proč deset zpráv opsaných z jedné není deset zdrojů."

[taxonomies]
tags = ["glossary", "osint", "intelligence-fusion", "intelligence"]

[extra]
category = "osint"
related_terms = ["osint", "entity-resolution", "sanctions-screening"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-14"
keywords = ["fúze zpravodajství", "intelligence fusion", "datová fúze", "model JDL", "hodnocení zdrojů", "nezávislost zdrojů", "analýza konkurenčních hypotéz", "kruhové zpravodajství"]
image = "/images/sections/glossary.png"
image_alt = "Intelligence fusion (fúze zpravodajství) – glosář"
+++

## Definice

**Fúze zpravodajství** (*intelligence fusion*) je spojování informací z více zdrojů do jednoho posouzení,
které je spolehlivější a úplnější, než by bylo posouzení z kteréhokoli z nich samotného. Hall a Llinas (1997)
vymezují obecnější datovou fúzi jako kombinaci údajů z více senzorů a souvisejících informací, jejímž cílem je
dosáhnout přesnějších a konkrétnějších závěrů, než jaké umožňuje jediný zdroj; zpravodajská fúze tentýž
postup uplatňuje na zprávy lidí, technické záznamy a veřejně dostupné informace.

Podstatou pojmu je rozdíl mezi spojením a součtem. Fúze nesčítá zprávy, ale posuzuje, odkud pocházejí, nakolik
jsou spolehlivé, zda jsou na sobě nezávislé a jak se vyrovnat s tím, když si odporují (Heuer, 1999). Kdo
sečte deset zpráv, které všechny opisují tutéž výchozí zprávu, nemá deset zdrojů, ale jeden.

## Původ a kontext pojmu

Pojem vychází z vojenské a státní zpravodajské analýzy, která spojuje zpravodajství z různých druhů sběru:
z elektronického průzkumu (SIGINT), z lidských zdrojů (HUMINT), ze snímkování (IMINT) a z otevřených zdrojů
([OSINT](@/glossary/osint.md)). Lowenthal (2017) popisuje, že každý z těchto druhů má jiné silné a slabé
stránky a že úplný obraz vzniká teprve jejich spojením, které nazývá zpravodajstvím ze všech zdrojů
(*all-source*).

Technickou podobu dal pojmu model datové fúze, který vypracovala laboratorní skupina amerického ministerstva
obrany (*Joint Directors of Laboratories*, JDL). Steinberg, Bowman a White (1999) jeho revizí rozlišili úrovně
fúze od zpřesnění jednotlivých signálů po hodnocení situace a dopadu, a model se stal společným jazykem
oboru (Hall a Llinas, 1997).

Ve veřejné správě se pojem rozšířil po teroristických útocích z 11. září 2001. Komise, která útoky
vyšetřovala, dospěla k závěru, že informace o útočnících existovaly v různých úřadech, ale nikdo je nespojil
(National Commission on Terrorist Attacks, 2004), a z tohoto zjištění vznikla centra, v nichž se zpravodajství
různých úřadů spojuje.

## Jak se projevuje

V praxi se fúze projevuje jako součást zpravodajského cyklu. Lowenthal (2017) ho popisuje jako sled určení
požadavků, sběru, zpracování, analýzy a šíření, k němuž patří zpětná vazba od příjemců; fúze se odehrává ve
fázi zpracování a analýzy, ale závisí na tom, zda plánování sběru zajistilo zdroje, které na sobě nejsou
závislé.

Druhým projevem je oddělené hodnocení zdroje a informace. Doktrína NATO hodnotí spolehlivost zdroje a
věrohodnost informace každou zvlášť, písmenem a číslicí, takže spolehlivý zdroj může předat nepotvrzenou
informaci a neznámý zdroj informaci, kterou potvrzují jiné (NATO, 2016). Toto oddělení brání tomu, aby se
důvěra ve zdroj automaticky přenesla na všechno, co říká.

V kybernetické bezpečnosti se fúze projevuje spojováním síťových záznamů, zpráv o hrozbách, dat o
zranitelnostech a soupisů aktiv, a stejné úrovně fúze, jaké popisuje model JDL, se v ní uplatňují od
sloučení záznamů o jednom zařízení po posouzení rizika celé organizace (Steinberg, Bowman a White, 1999).

## Mechanismus

Mechanismus fúze popisují úrovně modelu JDL (Steinberg, Bowman a White, 1999):

| Úroveň | Co se na ní děje | Příklad |
| --- | --- | --- |
| **0: pod úrovní objektu** | zpřesnění a vyčištění signálů z jednoho zdroje | převod záznamů do společného formátu |
| **1: objekt** | rozpoznání, že více záznamů popisuje tutéž entitu ([entity resolution](@/glossary/entity-resolution.md)) | sloučení údajů o jednom zařízení z více skenerů |
| **2: situace** | vztahy mezi objekty a jejich vzorce | mapa vztahů mezi organizacemi |
| **3: dopad** | odhad důsledků a hrozby | posouzení rizika |
| **4: zpřesnění procesu** | hodnocení, jak dobře fúze funguje, a úprava sběru | nalezení mezer ve sběru |

Klíčovou částí mechanismu je zacházení s rozpory. Heuer (1999) navrhl analýzu konkurenčních hypotéz, při níž
analytik každý doklad posuzuje vůči všem hypotézám najednou a hledá ty doklady, které hypotézy rozlišují,
místo aby sbíral doklady pro hypotézu, kterou už přijal. Rozpor mezi zdroji tak není chybou, kterou je třeba
odstranit, ale informací o tom, která vysvětlení zůstávají otevřená.

Druhou klíčovou částí je nezávislost zdrojů. Komise, která posuzovala zpravodajská hodnocení zbraní
hromadného ničení v Iráku, zjistila, že zdánlivě několik zpráv pocházelo z jediného nespolehlivého zdroje a že
se jejich shoda mylně četla jako potvrzení (Commission on the Intelligence Capabilities, 2005).

## Odlišení

| Odlišit od | Rozdíl |
| --- | --- |
| Agregace dat | spojení všech informací do jednoho pohledu bez posouzení jejich kvality a nezávislosti |
| Korelace událostí | hledání souvislostí mezi záznamy podle pravidel; fúze navíc hodnotí zdroje a zachovává rozpory |
| [Entity resolution](@/glossary/entity-resolution.md) | rozhodnutí, zda dva záznamy popisují tutéž entitu; v modelu JDL jedna úroveň fúze |
| [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) | totéž pravidlo nezávislých zdrojů uplatněné jednotlivcem v běžném životě |

## Význam pro Kompendium

*Interpretace knihy*: principy fúze jsou v knize obecnými pravidly epistemické hygieny, nejen technickým
postupem. **Nezávislost zdrojů**, **zachování rozporů**, **sledování původu** a **časový úbytek** jsou přesně to, co manipulace podkopává: [monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) a [citační kruhovost](@/kompendium/detection-signatures/18-network-citation-circularity.md) vytvářejí zdání mnoha zdrojů tam, kde je jen jeden; potlačení rozporů je jádrem [konfirmačního biasu](@/glossary/konfirmacni-bias.md), před nímž
analýza konkurenčních hypotéz chrání (Heuer, 1999). Pro jednotlivce tytéž principy převádí do běžného života [triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md), pro analytiky [křížová triangulace zdrojů v OSINT](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) a [validace zpravodajství o hrozbách](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md).

Druhé užití se týká toho, jak kniha zachází s vlastními zdroji. Heuer (1999) upozorňuje, že analytik
snadno přecení doklady, které do sebe zapadají, a přehlédne, že chybějí doklady, které by měly existovat,
kdyby byla hypotéza pravdivá. *Interpretace knihy*: kdo posuzuje, zda je obětí manipulace, čelí téže
pasti, a proto kniha žádá u každého závěru ptát se nejen, co ho podporuje, ale i co by ho vyvrátilo.

## Meze pojmu a kritika

Fúze vyjadřuje jistotu, ale jistotu nelze snadno změřit. Kent (1964) ukázal, že slova jako „pravděpodobně“
nebo „možná“ si různí čtenáři téže zprávy vykládají jako velmi rozdílné pravděpodobnosti, a navrhl je spojit s
číselnými rozpětími. Čísla však vypovídají o přesnosti jen tehdy, když existuje zpětná vazba o tom, jak
hodnocení dopadla; bez ní vypovídají o shodě analytiků, nikoli o skutečnosti (Heuer, 1999). Nároky na
dohledatelnost takového hodnocení v knize stanoví
[metodologické poznámky](@/kompendium/02-uvod/metodologicke-poznamky.md).

Obdobnou mez má nezávislost zdrojů. Tu nelze zjistit ze samotných zpráv, nýbrž jen ze znalosti toho, odkud
jejich autoři čerpali, a případ hodnocení iráckých zbraní ukázal, jak snadno se zdánlivá pluralita ukáže jako
jeden zdroj (Commission on the Intelligence Capabilities, 2005). *Interpretace knihy*: fúze proto dává jazyk
pro posuzování shody, ne nástroj, jímž by ji čtenář mohl změřit; k čemu je takový jazyk v knize dobrý,
vysvětluje [jak kompendium používat](@/kompendium/01-predmluva/jak-pouzivat.md).

## Literatura

- Commission on the Intelligence Capabilities of the United States Regarding Weapons of Mass Destruction. (2005). *Report to the President of the United States*. Washington, DC.
- Hall, D. L., & Llinas, J. (1997). *An introduction to multisensor data fusion*. Proceedings of the IEEE, 85(1).
- Heuer, R. J. (1999). *Psychology of Intelligence Analysis*. Washington, DC: Center for the Study of Intelligence, CIA.
- Kent, S. (1964). *Words of estimative probability*. Studies in Intelligence, 8(4).
- Lowenthal, M. M. (2017). *Intelligence: From Secrets to Policy* (7th ed.). Thousand Oaks: CQ Press.
- National Commission on Terrorist Attacks Upon the United States. (2004). *The 9/11 Commission Report*. New York: W. W. Norton.
- NATO. (2016). *AJP-2.1 Allied Joint Doctrine for Intelligence Procedures* (Edition B). Brussels: NATO Standardization Office.
- Steinberg, A. N., Bowman, C. L., & White, F. E. (1999). *Revisions to the JDL data fusion model*. Proceedings of SPIE 3719, Sensor Fusion: Architectures, Algorithms, and Applications III.

## Související

- [OSINT](@/glossary/osint.md) – hlavní metodika poskytující surové zpravodajství.
- [Entity Resolution](@/glossary/entity-resolution.md) – rozlišení identity ve fúzovaném zpravodajství.

**Kniha**

- [Křížová triangulace zdrojů v OSINT](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) – princip fúze v kontextu EA.
- [Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) – signatura, kterou fúze odhaluje.
- [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – tytéž principy pro jednotlivce.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: intelligence-fusion](@/kompendium/glossary-bridges/bridge-intelligence-fusion.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
