+++
title = "Agent"
aliases = ["/glossary/agent-registry/", "/glossary/agent-tier/", "/glossary/aiad/", "/glossary/archer-supreme/", "/glossary/strategic-command/", "/glossary/supreme-commander/", "/glossary/tactical-execution/", "/kompendium/glossary-bridges/bridge-agent-registry/", "/kompendium/glossary-bridges/bridge-agent-tier/", "/kompendium/glossary-bridges/bridge-aiad/", "/kompendium/glossary-bridges/bridge-archer-supreme/", "/kompendium/glossary-bridges/bridge-strategic-command/", "/kompendium/glossary-bridges/bridge-supreme-commander/", "/kompendium/glossary-bridges/bridge-tactical-execution/"]
weight = 10
description = "Autonomní softwarová entita, která vykonává specializované úkoly v přesně vymezeném rozsahu a s definovanou úrovní oprávnění."

[taxonomies]
tags = ["glossary", "architecture", "agent"]

[extra]
category = "architecture"
abbreviation = "N/A"
related_terms = ["red-team", "blue-team", "purple-team"]
domain = "agent-systems"
complexity = "advanced"
stability = "stable"
since_generation = 1
beam_related = true
otp_behaviour = true
phoenix_component = false
security_relevant = true
compliance_relevant = true
osint_relevant = true
performance_critical = false
version = "2.0.0"
tier_levels = ["L1", "L2", "L3", "L4", "L5"]
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-10"
+++

## Definice

**Agent** je autonomní softwarová entita, která působí v přesně vymezeném rozsahu: má
klasifikační úroveň (L1 až L5), která určuje jeho provozní oprávnění, doménovou
specializaci, která vymezuje oblast jeho odbornosti, a soubor schopností, které určují,
jaké akce smí provádět.

Tento model agenta se liší od pojmu „agent“ ve většině platforem umělé inteligence, kde
agentem bývá jazykový model s přístupem k nástrojům: agent je zde procesem pod supervizí
OTP s formálně specifikovanými vstupy, výstupy a omezeními oprávnění. Agenti nepůsobí
s neomezenou autonomií – rozhodují nezávisle jen v mezích svého oprávnění.

**Vztah ke knize:** obecný model agenta
(vnímání–rozhodnutí–akce–zpětná vazba) je užitečnou analogií pro to, co
manipulace v lidském poznávání narušuje: vnímání (zúžením vstupů), rozhodování (zkreslením
kritérií) i zpětnou vazbu (zpochybněním výsledků).

## Přehled

Ekosystém agentů je záměrnou architektonickou volbou: místo monolitických systémů, které by
se snažily obsloužit všechny potřeby systému, rozkládá se každá provozní oblast
na autonomní agenty s jasnými odpovědnostmi, explicitními rozhraními a vynutitelnými
omezeními. Rozklad sleduje princip OTP – oddělit odpovědnosti do nezávislých procesů –
a rozšiřuje jej o formální specifikaci agentů a hierarchii oprávnění systémem úrovní.

Architektura agentů čerpá ze tří myšlenkových tradic: z autonomních agentů ve výzkumu umělé
inteligence, z modelu aktorů v souběžném programování (jak jej implementuje Erlang/OTP)
a z vojenských velitelských struktur pro hierarchickou koordinaci. Výsledkem jsou agenti,
kteří jsou zároveň autonomní (rozhodují nezávisle v mezích oprávnění), supervidovaní
(sledovaní a restartovaní supervizory OTP) a koordinovaní (působí ve velitelské hierarchii,
která brání konfliktům a zajišťuje soudržné chování ekosystému).

## Architektura agenta: smyčka vnímání–rozhodnutí–akce

Každý agent sleduje společný architektonický vzor odvozený z klasické teorie
autonomních systémů: smyčku vnímání–rozhodnutí–akce (PDA). Vzor zajišťuje, že agenti
pracují soustavně, nikoli jen reaktivně.

**Fáze vnímání:** agent přijímá vstupní signály z prostředí – telemetrii ze sledovaných
systémů, příkazy od agentů s vyšším oprávněním nebo od operátorů, zjištění jiných agentů
nebo plánované spouštěcí události. Vnímání je filtrováno doménovou specializací:
bezpečnostní agent vnímá signály relevantní pro bezpečnost a metriky kvality ignoruje,
a naopak.

**Fáze rozhodnutí:** agent hodnotí vnímané signály podle své znalostní báze, doménových
pravidel a provozních omezení. Výstupem fáze je akční plán s explicitní mírou důvěry.

**Fáze akce:** agent provede plán v rámci svého oprávnění. Akcemi mohou být zprávy, úpravy
kódu, výstrahy, zveřejnění zjištění jiným agentům nebo spuštění navazujících procesů. Každá
akce je zaznamenána s úplným původem kvůli auditovatelnosti.

**Fáze zpětné vazby:** výsledky akcí se vracejí do fáze vnímání a umožňují adaptivní
chování. Selže-li akce nebo přinese nečekané výsledky, agent podle toho upraví rozhodování.
Tato uzavřená smyčka umožňuje průběžné zlepšování bez vnějšího zásahu.

## Systém úrovní (L1 až L5)

Úrovně oprávnění agentů tvoří přísnou hierarchii, která určuje provozní rozsah, autonomii
rozhodování a přístup ke zdrojům. Systém není jen doporučením – vynucuje se za běhu
kontrolami schopností v každé operaci agenta.

| Úroveň | Klasifikace | Rozsah oprávnění | Autonomie rozhodování | Příklady |
|------|---------------|-----------------|-------------------|----------|
| **L1** | taktický specialista | jeden úkol, jedna doména | provádí podle předem daných pravidel | skener souborů, kontrola syntaxe |
| **L2** | provozní specialista | více úkolů, jedna doména | volí ze schválených strategií | detektor posunu, extraktor důkazů |
| **L3** | strategický velitel | koordinace úkolů, oprávnění v doméně | navrhuje a provádí kampaně | blue commander, red commander |
| **L4** | specialista kritický pro bezpečnost | oprávnění k přepsání v bezpečnostní doméně | zastavuje operace, vynucuje omezení | escalation guard, regression guard |

Systém úrovní uplatňuje na úrovni agentů princip nejmenších oprávnění. Agent L1 nemůže
měnit konfiguraci systému, agent L2 nemůže koordinovat operace napříč doménami a agent
L3 nemůže přepsat bezpečnostní omezení. Zastavit operace mohou jen agenti L4 s výslovným
označením kritičnosti pro bezpečnost a přepsat rozhodnutí jiných agentů jen agenti L5.

## Životní cyklus agenta

Životní cyklus agenta probíhá v dobře definovaném sledu od specifikace po vyřazení, se
správními kontrolními body při každém přechodu. Řídí jej supervize OTP a registr agentů.

1. **Specifikace:** agent je definován samostatnou specifikací – včetně úrovně, domény,
   schopností a požadavků na vynucení.
2. **Registrace:** agent je zapsán do registru, který jej indexuje podle domény, úrovně
   a schopnosti. Registr vede úplný soupis agentů a jejich aktuálního stavu.
3. **Vytvoření instance:** když je třeba, spustí se proces OTP agenta pod supervizorem.
   Proces se inicializuje s konfigurací agenta, načte doménově specifické znalosti a zapíše
   se do běhového registru.
4. **Provoz:** agent vstoupí do smyčky vnímání–rozhodnutí–akce, zpracovává signály
   a vytváří výstupy v rámci svého oprávnění. Všechny operace se zaznamenávají a sleduje se
   jejich původ.
5. **Evoluce:** potřebuje-li agent aktualizaci znalostí nebo schopností, nasadí se nová
   verze postupnou aktualizací, která zachová provozní stav agenta.
6. **Vyřazení:** když agent už není potřeba, supervizor jej řízeně ukončí, záznam
   v registru se označí jako neaktivní a historická data se uchovají kvůli auditu.

## Hierarchie agentů

Ekosystém není plochou sbírkou, ale hierarchickou velitelskou strukturou. Agenti L5
koordinují velitele L3, ti řídí specialisty L2 a ti mohou delegovat na taktické agenty L1.
Hierarchie zrcadlí vojenské velitelské struktury a zajišťuje, že režie koordinace roste
s počtem agentů logaritmicky, nikoli lineárně.

## Vztah ke stromům supervize

Každý běžící proces agenta existuje ve stromu supervize OTP. Tento vztah není volitelný –
žádný GenServer nemá existovat bez supervize. Supervize zajišťuje:

- **automatický restart** – když proces agenta spadne, supervizor jej restartuje s čistým
  stavem;
- **pořadí závislostí** – agenti závislí na jiných agentech se spouštějí ve správném pořadí
  pomocí strategie `rest_for_one`;
- **úklid zdrojů** – při ukončení agenta supervizor zajistí řádné uvolnění zdrojů;
- **eskalaci** – opakované pády se šíří vzhůru a nakonec spustí samoopravu na vyšších
  úrovních.

## Vzorce komunikace agentů

Agenti komunikují několika vzorci, volenými podle naléhavosti a významu interakce:

| Vzorec | Mechanismus | Latence | Provázanost | Použití |
|---------|-----------|---------|----------|----------|
| **Přímé volání** | GenServer.call/3 | synchronní | vysoká | kontroly oprávnění, dotazy na stav |
| **Asynchronní zpráva** | GenServer.cast/2 | asynchronní | nízká | oznámení událostí, zjištění |
| **PubSub** | Phoenix.PubSub | vysílání | žádná | výstrahy pro celý systém, telemetrie |
| **Registr** | vyhledání v Registry | synchronní | střední | dynamické vyhledání agentů |
| **Proces** | Broadway/GenStage | řízený poptávkou | nízká | řetězce zpracování dat |

## Osvědčené postupy

1. **Definovat před implementací:** vždy nejprve vytvořit specifikaci `.agent.md`, teprve
   pak psát kód agenta. Specifikace nutí výslovně promyslet oprávnění, rozsah a rozhraní.
   Agent bez specifikace je proces bez kontraktu.
2. **Respektovat systém úrovní:** nikdy neimplementovat schopnosti nad rámec oprávnění
   úrovně. Potřebuje-li agent operace s vyšším oprávněním, musí o ně požádat agenta vyšší
   úrovně řádnou cestou.
3. **Vysílat telemetrii:** každý agent má vysílat telemetrické události o klíčových
   operacích. To umožňuje pozorovatelnost celého systému.
4. **Obsloužit všechny zprávy:** agenti musí obsloužit všechny možné zprávy své domény.
   Neobsloužené zprávy způsobují pády, které se šíří stromem supervize. Na nečekané zprávy
   slouží zachycující klauzule s odpovídajícím logováním.
5. **Udržovat původ:** každý výstup agenta musí nést metadata o původu – který agent jej
   vytvořil, kdy, s jakou důvěrou a z jakých vstupů.

## Související

**Poznávání strojů a lidí**

- [Inference](@/glossary/inference.md) – spuštění natrénovaného modelu nad novými vstupy
- [Prediktivní zpracování](@/glossary/predictive-processing.md) – rámec, který poznávání čte jako předvídání
- [Teorie mysli](@/glossary/theory-of-mind.md) – připisování duševních stavů, které software nemá

**Kde se pojem v knize potkává s rizikem**

- [Dual-use poznání](@/glossary/dual-use-poznani.md) – stejné porozumění použitelné k obraně i útoku
- [Epistemická bezpečnost](@/glossary/epistemic-security.md) – obrana poznávacího prostředí
- [Deepfake](@/glossary/deepfake.md) – syntetické médium jako nástroj epistemické anihilace

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: agent](@/kompendium/glossary-bridges/bridge-agent.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
