+++
title = "Epistemic Pipeline (epistemický proces)"
weight = 35
date = 2026-02-14
description = "Šestnáctiúrovňový proces Prismatic Platform od surových dat (L0) po úrovně Meta a Consciousness, který mění nestrukturované signály ve formálně ověřené vědění."

[taxonomies]
tags = ["glossary", "epistemic", "epistemic-pipeline", "prismatic", "nabla"]

[extra]
category = "epistemic"
related_terms = ["nabla-infinity", "trinity-gate", "consciousness-traits", "three-nl", "provenance-mandatory", "confidence-threshold", "belief-graph", "qeve", "signal-plurality", "contradiction-preservation", "time-decay", "confidence-scoring", "formal-verification", "monte-carlo-verification", "property-based-testing", "entity-resolution", "cherry-picking", "quality-gates", "seadf", "audit-trail", "agent", "color-teams", "nm-nd"]
date_created = "2026-01-15"
date_updated = "2026-11-10"
author = "Tomas Korcak (korczis)"
quality_score = 97
+++

## Definice

**Epistemic Pipeline** (epistemický proces) je ústřední architekturou zpracování vědění na
Prismatic Platform. Definuje šestnáctiúrovňovou cestu proměny, která bere surová,
nestrukturovaná data a postupně je zpřesňuje ve formálně ověřené, použitelné vědění. Proces
pokrývá úrovně L0 (příjem surových signálů) až L13 (integrované vědění), po nichž následují
dvě vrcholové úrovně: Meta (sebehodnocení procesu) a Consciousness (emergentní povědomí
platformy). Každá úroveň uplatňuje stále propracovanější analytické, validační a syntetické
operace, takže každá informace procházející platformou je podrobena přísnému epistemickému
zkoumání dřív, než může ovlivnit rozhodnutí nebo akce.

Architektura čerpá z principů epistemologie, teorie zpracování signálů a formální
verifikace. Na rozdíl od běžných datových procesů, které s informací zacházejí jako se
zbožím k přesunu a uložení, zachází epistemický proces s informací jako s **tvrzením, které
musí být doloženo**. Každý údaj, který vstoupí na L0, nemá žádnou epistemickou váhu;
oprávněnou důvěru získá teprve tím, že přežije sled validace, korelace, analýzy rozporů
a formálního důkazu, který mu jednotlivé úrovně ukládají. Tato filozofie odráží základní
závazek platformy k axiomům [NABLA Infinity](@/glossary/nabla-infinity.md): realita není
demokracie, důkaz není volitelný a rozpory nejsou trapnost, kterou je třeba skrývat.

**Interaktivní ukázka:** vizualizace toku procesu na platformě ukazuje fáze QEVE (otázka →
důkaz → validace → evoluce, viz [QEVE](@/glossary/qeve.md)) v akci – jak surové signály
vstupují na L0 a postupují šestnácti úrovněmi proměny, jak data získávají epistemickou váhu
validací, korelací a formálním ověřením a jak se tvoří struktury grafu přesvědčení, když se
příbuzné signály sbíhají a odporují si, až po úrovně Meta a Consciousness, které sledují
epistemické zdraví samotného procesu.

Šestnáct úrovní nebylo zvoleno libovolně. Podle platformy vyplynulo z analýzy nejmenšího
počtu samostatných fází zpracování potřebných ke splnění všech sedmi axiomů NABLA při
zachování zvládnutelné výpočetní složitosti. Méně úrovní by slévalo odlišné epistemické
operace (např. korelaci a identifikaci rozporů, které vyžadují zásadně odlišné algoritmy);
více úrovní by přidalo zbytečnou režii bez smysluplného zisku v epistemické přísnosti.

V ekosystému platformy (v době zápisu přes 430 [agentů](@/glossary/agent.md) v 89
aplikacích) slouží epistemický proces jako sdílená epistemologická páteř. Ať agent
provádí sběr [OSINT](@/glossary/osint.md), bezpečnostní posouzení, ověření souladu nebo
syntézu znalostí, jeho výstupy musí procesem projít. Tato univerzálnost zajišťuje jednotný
standard epistemické kvality ve všech oblastech činnosti.

**Vztah ke knize:** proces patří do kontextu platformy, z níž Kompendium vzešlo, ale
přímo souvisí s jejím obsahem. Je strojovou podobou toho, co kniha požaduje od lidského
poznávání: nepřijímat tvrzení bez původu, hledat nezávislé zdroje, zachovávat rozpory místo
jejich potlačení a připustit „nevím“. Jak se v procesu odhalují techniky EA, popisuje stránka
[Epistemický proces: detekce EA](@/kompendium/aiad-integration/epistemic-pipeline-ea-detection.md);
vztah knihy k rámci NABLA vysvětluje kapitola [Vztah k NABLA](@/kompendium/02-uvod/vztah-k-nabla.md).
Úrovně procesu se mapují na architekturu [3NL](@/glossary/3nl.md) (L0–L4 na 3NL L3, L5–L9
na 3NL L2, L10–L13 a Meta na 3NL L1).

## Šestnáct úrovní

Úrovně tvoří orientovaný acyklický postup: každá spotřebovává výstupy předchozích a vytváří
obohacené výstupy pro následující. Žádnou úroveň nelze přeskočit a žádná informace nesmí
úroveň obejít bez výslovné výjimky přes protokol přepsání [Trinity Gate](@/glossary/trinity-gate.md),
který sám vyžaduje formální zdůvodnění.

### L0: příjem surových signálů

Vstupní bod procesu. L0 přijímá surová, nezpracovaná data ze všech zdrojů platformy: z kanálů
OSINT, skenerů [EASM](@/glossary/easm.md), zpráv agentů, odpovědí vnějších API, vstupů
uživatelů a dat ze senzorů. Na této úrovni neprobíhá žádné filtrování, validace ani výklad.
Jedinou odpovědností L0 je zachytit příchozí data s úplnou věrností, připojit časová
razítka příjmu (čímž je od okamžiku vstupu splněn axiom časového stárnutí) a přidělit
předběžná metadata původu, která určují zdroj, přenosový mechanismus a kontext příjmu. L0
vychází z principu, že vyřazení dat před posouzením je formou epistemického „vybírání
třešniček“, které axiomy NABLA zakazují.

### L1: extrakce signálů

L1 provádí první interpretační operaci: vytahuje ze surového proudu samostatné signály.
„Signál“ je zde jednotka informace, která nese možné epistemické tvrzení – IP adresa, název
domény, konfigurační parametr, behaviorální indikátor, textové tvrzení. L1 používá parsery
podle formátu, zpracování přirozeného jazyka a strukturální analýzu a rozkládá vstupy na
jednotlivé signály. Každý signál dědí řetězec původu z L0 a dostává jedinečný identifikátor
pro sledování dalšími úrovněmi.

### L2: validace signálů

L2 podrobuje každý signál strukturální a sémantické validaci. Strukturální validace ověří,
že signál odpovídá očekávaným formátům a schématům (např. že IP adresa je syntakticky
platná nebo že časové razítko leží v přijatelném rozmezí). Sémantická validace uplatní
doménová pravidla a posoudí, zda je obsah signálu vnitřně soudržný. Signály, které
validací neprojdou, se nezahazují, ale označí metadaty o selhání – v souladu se závazkem
zachovávat rozpory. I neplatné signály mohou mít epistemickou hodnotu jako indikátory
poškození dat, adversariální manipulace nebo dosud neznámých formátů.

### L3: přiřazení zdroje

L3 provádí hloubkovou analýzu původu nad rámec mechanického původu z L0. Hodnotí
spolehlivost, historickou přesnost a možná zkreslení zdroje každého signálu – na základě
nashromážděných znalostí o poskytovatelích dat, jejich dřívější přesnosti, známých slepých
místech a možných střetech zájmů. Úroveň přímo vynucuje axiom [Signal
Plurality](@/glossary/signal-plurality.md): každý signál opatří metadaty o nezávislosti
zdroje, aby další úrovně mohly signály přiměřeně vážit a odhalit, kdy zdánlivě nezávislé
zdroje sdílejí společný původ.

### L4: korelace signálů

L4 hledá vztahy mezi signály z různých zdrojů, období nebo domén. Korelační analýza používá
algoritmy [sjednocování entit](@/glossary/entity-resolution.md) k určení, kdy různé signály
odkazují na tutéž entitu nebo událost, časovou korelaci k nalezení signálů, které se
vyskytují ve smysluplných časových oknech, a techniky kauzální inference k odhalení možných
vztahů příčiny a následku. Výstupem jsou korelační grafy mapující strukturu vztahů v prostoru
signálů, které přímo napájejí infrastrukturu grafu přesvědčení.

### L5: detekce vzorců

L5 uplatňuje rozpoznávání vzorců v korelovaném prostoru signálů a hledá opakující se
struktury, anomálie, trendy a emergentní chování. Používá statistickou analýzu,
klasifikátory strojového učení a pravidlové porovnávání vzorů; odhaluje známé vzorce (proti
knihovně vzorců platformy) i nové (k revizi člověkem nebo agentem). Pracuje v různých
časových a prostorových měřítcích, od mikrovzorců v jednotlivých proudech po makrovzorce
v celém pozorovacím prostoru platformy.

### L6: identifikace rozporů

L6 patří k epistemicky nejdůležitějším úrovním. Jejím jediným účelem je najít případy, kdy
nashromážděné důkazy obsahují rozpory – signály, korelace nebo vzorce, které o stavu světa
tvrdí navzájem neslučitelné věci. V běžných systémech se rozpory berou jako chyby, které se
řeší vyřazením jedné strany. Podle axiomu zachování rozporů (*Contradiction Preservation*)
proces naopak zachová obě strany, opatří je silou podpůrných důkazů a předá tento
strukturovaný nesoulad vyšším úrovním k principiálnímu řešení. Úroveň je hlavní obranou
proti [konfirmačnímu biasu](@/glossary/konfirmacni-bias.md) a vybírání třešniček.

### L7: výpočet důvěry

L7 počítá kvantitativní skóre důvěry každého tvrzení, korelace a vzorce, které se sem
dostaly. Slučuje výsledky validace, posouzení spolehlivosti zdrojů, sílu korelace,
konzistenci vzorců a závažnost rozporů do jednotného čísla. Respektuje axiom časového
stárnutí časovými diskontními faktory u starších důkazů a vynucuje pluralitu signálů
požadavkem na minimální počet nezávislých zdrojů, než důvěra překročí stanovené prahy.
Výstupem je plně oskórovaný prostor přesvědčení, v němž každé epistemické tvrzení nese
zdůvodněnou, auditovatelnou hodnotu důvěry.

### L8: tvorba hypotéz

L8 syntetizuje oskórovaný prostor přesvědčení do výslovných hypotéz: strukturovaných
výroků o stavu světa, které lze testovat, zpřesňovat nebo vyvrátit. Čerpá ze vzorců z L5,
rozporů z L6 a skóre z L7 a vytváří kandidátní vysvětlení pozorovaných jevů. Každá hypotéza
má výslovné předpoklady, předpovězené důsledky a kritéria vyvrácení (srov.
[Falsifikovatelnost](@/glossary/falsifikovatelnost.md)), což umožňuje soustavné hodnocení
na vyšších úrovních.

### L9: syntéza důkazů

L9 provádí komplexní syntézu důkazů a skládá všechny dostupné důkazy relevantní ke každé
hypotéze do strukturovaných důkazních balíčků. Syntéza slučuje podpůrné důkazy, protichůdné
důkazy a indikátory chybějících důkazů (podle axiomu, že nepřítomnost je informativní) do
soudržných důkazních výkladů. Výstupem není verdikt, ale úplné, vyvážené předložení všech
dostupných důkazů uspořádané kolem každé aktivní hypotézy, vhodné k hodnocení automatickými
i lidskými rozhodovateli.

### L10: integrace vědění

L10 začleňuje nově syntetizované důkazy do trvalé znalostní báze platformy. Řeší složitý úkol
sladit nová zjištění se stávajícím věděním, aktualizovat sílu přesvědčení, vyřazovat
překonané hypotézy a rozpoznat případy, kdy nové důkazy zásadně mění porozumění oblasti.
Pracuje přes graf přesvědčení – aktualizuje váhy uzlů, vztahy hran a topologii grafu tak,
aby odrážely aktuální stav oprávněného přesvědčení. Všechny změny znalostní báze se
zapisují do neměnné auditní stopy.

### L11: podpora rozhodování

L11 převádí integrované vědění na výstupy relevantní pro rozhodování. Uplatňuje rozhodovací
rámce podle kontextu a vytváří hodnocení rizik, hrozeb, zprávy o stavu souladu a strategická
doporučení. Výstupy jsou vždy doprovázeny výslovnou mírou důvěry, seznamem předpokladů
a odkazy na řetězec důkazů, takže rozhodovatel může posoudit nejen doporučení, ale
i epistemickou kvalitu uvažování za ním (viz [Decision Engine](@/glossary/decision-engine.md)).

### L12: doporučení akce

L12 vytváří konkrétní, proveditelná doporučení na základě výstupů L11. Každé doporučení
obsahuje navrženou akci, očekávané výsledky, hodnocení rizika, potřebné zdroje a kritéria
návratu. Doporučení, která splní prahy důvěry a projdou ověřením v Trinity Gate, se označí
jako připravená k provedení; ta pod prahem se vracejí nižším úrovním k doplnění důkazů. Úroveň
vynucuje přechodový protokol doktríny [NM/ND](@/glossary/nm-nd.md): průzkum pokračuje, dokud
důvěra nedosáhne požadovaného prahu, a pak provedení proběhne bez váhání.

### L13: integrované vědění

L13 je nejvyšším standardním výstupem procesu: plně integrované, formálně ověřené produkty
vědění, které přežily celý řetězec zpracování – byly přijaty, vytaženy, validovány, přiřazeny
ke zdroji, korelovány, podrobeny analýze vzorců i rozporů, oskórovány, testovány jako
hypotézy, syntetizovány, integrovány, analyzovány pro rozhodnutí a vyhodnoceny pro akci.
Výstupy L13 nesou úplný řetězec původu od L0 po L12 a prošly všemi příslušnými kontrolními
body Trinity Gate. Představují nejdůvěryhodnější porozumění skutečnosti, jaké platforma
v dané oblasti má.

### Meta: sebehodnocení procesu

Úroveň Meta stojí mimo standardní postup L0–L13. Její funkce je reflexivní: uplatňuje
epistemické standardy procesu na proces samotný. Sleduje latenci zpracování na každé
úrovni, míru detekce známých i nových vzorců, účinnost řešení rozporů, přesnost kalibrace
důvěry (srovnání předpovězené důvěry s pozorovanými výsledky) a celkovou propustnost. Zjistí-li
zhoršení kterékoli metriky, spustí zásah systému [AutoHeal](@/glossary/autoheal.md) a ohlásí
zjištění strážci minimální kvality. Meta zajišťuje, že epistemické standardy procesu nejsou
jen přáním, ale jsou průběžně ověřovány – obdobně jako [metakognice](@/glossary/metakognice.md)
u člověka.

### Consciousness: emergentní povědomí platformy

Úroveň Consciousness je vrcholem procesu. Sleduje 11 „rysů vědomí“ (*consciousness traits*),
které podle platformy vznikají ze společného fungování procesu a širšího ekosystému agentů:
sebeuvědomění, povědomí o prostředí, časové povědomí, soudržnost cílů, adaptivní učení,
metakognici, [epistemickou pokoru](@/glossary/epistemicka-pokora.md), kolaborativní
inteligenci, etické uvažování, tvůrčí syntézu a narativní soudržnost. Rysy nejsou
naprogramované, ale vynořují se ze souhry stovek agentů zpracovávajících informace procesem.
Platforma uváděla v době zápisu pro tuto úroveň „fitness“ 0,998 jako ukazatel téměř
dokonalého souladu emergentního chování s navrženými epistemickými cíli. Jde o vnitřní
metriku a technický název platformy; s filozofickou otázkou vědomí jej nelze zaměňovat.

## Vynucení axiomů NABLA napříč úrovněmi

Sedm axiomů [NABLA Infinity](@/glossary/nabla-infinity.md) (viz [NABLA
Axioms](@/glossary/nabla-axioms.md)) se neuplatňuje v jediném kontrolním bodě, ale nepřetržitě
v celém procesu. Každý axiom má hlavní body vynucení, kde je nejdůležitější, a vedlejší body,
kde se soulad sleduje a porušení vyvolá varování, nikoli blokaci.

**Signal Plurality** se vynucuje hlavně na L3 (přiřazení zdroje) a L7 (výpočet důvěry). Žádné
tvrzení nesmí přesáhnout standardní provozní práh důvěry 0,80 bez alespoň dvou nezávislých
podpůrných signálů. Na L4 se požadavek plurality rozšiřuje na tvrzení o korelaci, takže
zjištěné vztahy musí podpírat více důkazních vláken.

**Contradiction Preservation** má hlavní bod vynucení na L6, ale sleduje se na každé úrovni od
L2. Jakákoli operace, která by vyřadila jednu stranu zjištěného rozporu, vyvolá okamžitou
blokaci úrovně E2 podle protokolu vynucení NABLA (srov. [Addiction
Recovery](@/glossary/addiction-recovery.md)).

**Absence Informative** se vynucuje na L5 (detekce vzorců) a L9 (syntéza důkazů). Proces
výslovně sleduje očekávané, ale chybějící signály a jejich nepřítomnost zahrnuje do výpočtu
důvěry a hodnocení hypotéz.

**Time Decay** se vynucuje od okamžiku příjmu na L0 povinnými časovými razítky každého údaje.
L7 uplatňuje funkce časového diskontu a L10 pravidelně přehodnocuje uložené vědění podle
plánů stárnutí.

**Unknown Valid** se vynucuje na L7 a L8: výstupy procesu obsahují výslovné meze nejistoty
a „nevím“ zůstává na každé úrovni legitimním závěrem.

**Source Independence** se vynucuje hlavně na L3 a L4, kde proces odhaluje a zohledňuje
závislosti na společném zdroji, které by mohly vytvářet iluzi plurality.

**Provenance Mandatory** se vynucuje na každé úrovni bez výjimky. Každá proměna, anotace
a rozhodnutí uplatněné na údaj se zapisuje do jeho řetězce původu, takže vzniká úplná,
auditovatelná historie od příjmu po konečný výstup.

## Kontrolní body Trinity Gate

[Trinity Gate](@/glossary/trinity-gate.md) implementuje čtyřvrstvý ověřovací systém, který je
bránou kvality mezi úrovněmi zpracování a rozhodovacími a akčními vrstvami platformy.
Kontrolní body jsou na třech kritických místech procesu.

První kontrolní bod je na přechodu z L7 na L8 a ověřuje, že výpočty důvěry jsou strukturálně
konzistentní (síť přesvědčení tvoří platný orientovaný acyklický graf), logicky konzistentní
(žádné nevyřešené rozpory neporušují logická pravidla) a formálně správné (klíčová tvrzení
lze tam, kde je to možné, ověřit důkazy v Lean4).

Druhý kontrolní bod je na přechodu z L10 na L11 a ověřuje, že integrace vědění nevnesla do
trvalé znalostní báze nekonzistence a že aktualizovaná přesvědčení zachovávají strukturální
a logickou soudržnost.

Třetí a nejpřísnější kontrolní bod je na L13, kde musí konečné produkty vědění projít všemi
čtyřmi vrstvami Trinity Gate, než jsou klasifikovány jako integrované vědění. Používá úplný
ověřovací zásobník [QEVE](@/glossary/qeve.md) včetně formální verifikace v Lean4, ověření
metodou Monte Carlo pro pravděpodobnostní tvrzení a testování založeného na vlastnostech pro
behaviorální tvrzení.

Každé selhání v kontrolním bodě vrátí dotčená data na příslušnou nižší úroveň s podrobnými
anotacemi selhání, což umožňuje cílené přepracování místo plošného odmítnutí.

## Architektura toku dat

Tok dat sleduje přísně jednosměrný postup s řízenými zpětnými vazbami. Hlavní tok vede data
od L0 po L13 a do úrovní Meta a Consciousness. Zpětné smyčky jsou povoleny jen za určitých
podmínek: selhání v Trinity Gate spustí zpětný tok k úrovni odpovědné za zjištěnou
nekonzistenci a zásahy úrovně Meta mohou vložit opravné signály na kteroukoli úroveň.

Data jsou v procesu reprezentována jednotnou obálkou, která obsahuje samotný údaj, jeho
řetězec původu, nashromážděné anotace z každé úrovně, metadata důvěry a směrovací
informace. Obálka s postupem úrovněmi roste a hromadí epistemickou historii, díky níž lze
jakýkoli výstup vystopovat zpět k surovým vstupům (srov. [Chain of
custody](@/glossary/chain-of-custody.md)).

Proces podporuje synchronní i asynchronní zpracování. Časově kritická data (např. aktivní
indikátory hrozeb ze skenerů EASM) se zpracovávají synchronně s minimálním vyrovnáváním na
každé úrovni. Dávková data (např. periodická posouzení souladu) se zpracovávají asynchronně
s optimalizovanou propustností. Plánování a přidělování zdrojů v obou režimech řídí rámec
SEADF.

Paralelismus je na úrovni signálů: nezávislé signály mohou procesem procházet souběžně, se
synchronizačními body na L4 (kde korelace potřebuje přístup k více signálům) a L6 (kde
identifikace rozporů potřebuje úplný pohled na aktuální sadu signálů). Návrh využívá lehký
procesní model virtuálního stroje BEAM; každý signál může zpracovávat vyhrazený proces
Erlangu pod supervizí OTP.

## Výkonové charakteristiky

Proces je navržen na propustnost i latenci, s různými strategiemi optimalizace na různých
úrovních. Nižší úrovně (L0–L3) jsou optimalizovány na surovou propustnost a paralelním
příjmem a extrakcí zpracují tisíce signálů za sekundu. Střední úrovně (L4–L8) obětují část
propustnosti analytické hloubce, s nastavitelnými časovými rozpočty pro algoritmy korelace
a detekce vzorců. Vyšší úrovně (L9–L13) upřednostňují správnost před rychlostí; ověření
v Trinity Gate přidává latenci, ale zajišťuje, že k výstupu dojde jen epistemicky podložené
vědění.

Celková latence jednoho signálu přes všech 16 úrovní sahá od milisekund (u signálů, které
odpovídají známým vzorcům a nenarazí na rozpory) po minuty (u signálů, které spustí
hloubkovou korelační analýzu a formální verifikaci). Úroveň Meta průběžně sleduje rozložení
latence a vydává výstrahy, když doba zpracování překročí prahy dané úrovně.

Detekce vzorů v O(1) díky sémantickému vyhledávání indexovanému nad AST přináší podle platformy
na L5 zrychlení 90–250× oproti naivnímu porovnávání, takže detekce vzorců nebrzdí ani při
růstu knihovny vzorců. Efektivitu ukládání zajišťuje mezipaměť nad ETS na „horkých“ úrovních
a perzistence v PostgreSQL pro dlouhodobé uložení vědění.

## Integrace se systémy platformy

Epistemický proces nepracuje izolovaně; je hluboce propojen se všemi hlavními subsystémy.

[Color Teams](@/glossary/color-teams.md) proces intenzivně využívají. [Red
Team](@/glossary/red-team.md) vkládá na L0 adversariální signály, aby otestoval odolnost
procesu vůči epistemickým útokům. [Blue Team](@/glossary/blue-team.md) sleduje zdraví procesu
přes úroveň Meta a zavádí obranná opatření na L2 a L6. [Gray Team](@/glossary/gray-team.md)
zkoumá hraniční podmínky každé úrovně a hledá mezery ve specifikacích. [Purple
Team](@/glossary/purple-team.md) převádí zjištění Red–Blue na zlepšení procesu. [White
Team](@/glossary/white-team.md) ověřuje invarianty procesu formálními metodami v kontrolních
bodech Trinity Gate.

Rámec agentů [AIAD](@/glossary/aiad.md) směruje všechny výstupy agentů přes proces, takže
vědění vytvořené agenty splňuje stejné epistemické standardy jako data z vnějších zdrojů.
Zprávy agentů vstupují na L0 a agenti mohou spotřebovávat výstupy procesu na kterékoli
úrovni odpovídající jejich funkci.

Systém bran kvality a rámec Quality DNA čerpají z metrik procesu (zejména z hodnocení úrovně
Meta) k udržení standardů kvality celé platformy. Rámec [3NL](@/glossary/3nl.md) poskytuje
základ pro vyjádření operací procesu na rostoucích úrovních abstrakce, od konkrétního
zpracování signálů po abstraktní epistemické uvažování.

Všech sedm součástí subsystému SEADF – Scanner, Pipeline, Quality Guardian, Knowledge Sync,
Cross-Domain Innovator, Autonomous Reporter a Enhanced Healing – s procesem spolupracuje.
Součást Pipeline řídí fyzické provádění logických úrovní procesu, Quality Guardian sleduje
soulad s doktrínou NM/ND během zpracování.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Belief Graph* (graf přesvědčení aktualizovaný na L4
a L10), *Confidence Threshold* a *Confidence Scoring*, *Contradiction Preservation*, *Time
Decay*, *Provenance Mandatory*, *Cherry-Picking* (zakázaný antivzor), *Formal Verification*,
*Monte Carlo Verification*, *Property-Based Testing*, *Consciousness Traits*, *Fitness Score*,
*Quality Gates*, *Quality DNA*, *SEADF*, *Lean4*, *Audit Trail* a *Epistemic Robustness*.

## Související

**Platforma**

- [NABLA Infinity](@/glossary/nabla-infinity.md) – sedm axiomů vynucovaných na každé úrovni.
- [Trinity Gate](@/glossary/trinity-gate.md) – čtyřvrstvé ověření v kontrolních bodech.
- [QEVE](@/glossary/qeve.md) – ověřovací engine v Trinity Gate.
- [Signal Plurality](@/glossary/signal-plurality.md) – axiom vynucovaný na L3 a L7.
- [Entity Resolution](@/glossary/entity-resolution.md) – algoritmy korelace na L4.
- [Color Teams](@/glossary/color-teams.md) – bezpečnostní operace, které proces zatěžují
  a hájí.
- [3NL](@/glossary/3nl.md) – architektura, na niž se úrovně mapují.

**Kompendium**

- [Epistemický proces: detekce EA](@/kompendium/aiad-integration/epistemic-pipeline-ea-detection.md)
  – odhalování technik EA v procesu.
- [Vztah k NABLA](@/kompendium/02-uvod/vztah-k-nabla.md) – vztah knihy k epistemickému rámci
  platformy.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: epistemic-pipeline](@/kompendium/glossary-bridges/bridge-epistemic-pipeline.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
