+++
title = "Bridge: Gray Team (šedý tým)"
description = "Most mezi heslem Gray Team a knihou: hledání mezer ve specifikacích a driftu možností a jejich lidská obdoba – nejasná pravidla a pozvolný posun norem."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "gray-team", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["gray-team", "color-teams", "white-team", "purple-team", "bridge-black-team", "bridge-red-team"]
glossary_target = "gray-team"
toc = false
+++

# Bridge: Gray Team (šedý tým)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Gray Team](@/glossary/gray-team.md) (šedý tým) je v architektuře [Color Teams](@/glossary/color-teams.md)
platformy Prismatic, z níž kniha vzešla, tým, který provádí **výhradně čtecí** průzkum mezer ve
specifikacích, okrajových případů a takzvaného *driftu možností* (*affordance drift*). Heslo glosáře
vychází z poznatku bezpečnostního inženýrství, že nejnebezpečnější zranitelnosti často neleží v kódu,
který je zjevně chybný, ale ve specifikacích, které jsou nejednoznačné: funkce „má validovat vstup“,
ale nikde není řečeno, co se stane s prázdnou nebo částečně platnou hodnotou. Drift možností nastává,
když se skutečné schopnosti systému postupně odchylují od zamýšlených – drobnými změnami konfigurace,
aktualizacemi a úpravami, z nichž žádná sama nespustí revizi, ale jejich součet vytvoří útočnou plochu,
kterou nikdo nenavrhl.

Šedý tým nálezy neopravuje ani nehodnotí; katalogizuje nejednoznačnost v surové podobě a předává ji
dál. Heslo glosáře to spojuje s axiomem [NABLA Infinity](@/glossary/nabla-infinity.md) o
**zachování rozporu**: mezera může být chybou, funkcí, nebo obojím, a předčasné rozhodnutí by tuto
informaci zničilo.

## Pojem v jeho vlastním oboru

Pojem *možnosti* (*affordance*) pochází z ekologické psychologie. Gibson (1979) jím označil to, co
prostředí nabízí jednajícímu organismu – povrch, na který lze šlápnout, předmět, který lze uchopit.
Norman (1988) pojem přenesl do návrhu předmětů a rozhraní: dobře navržený předmět svými možnostmi
napovídá, jak se má použít, špatně navržený svádí k chybám. V bezpečnosti softwaru se z toho stává
otázka, co systém *ve skutečnosti umožňuje*, bez ohledu na to, co jeho autoři zamýšleli.

Fenomén pozvolného posunu má v jiných oborech výstižná jména. Vaughan (1996) popsala *normalizaci
odchylky* v organizaci, kde se opakované drobné anomálie staly přijatelnými, až přestaly být vnímány
jako varování. Pauly (1995) popsal v rybářské vědě *syndrom posouvající se výchozí hodnoty*: každá
generace považuje za normální stav, který zažila na začátku, a pozvolný úbytek proto uniká pozornosti.
Šedý tým je pokusem tento slepý bod systematicky hlídat.

## Analogie, kterou kniha činí

Heslo glosáře shrnuje analogii přesně: manipulace často nepracuje se zjevnou lží, ale s
**nejednoznačností**. Kniha popisuje nedefinované pojmy, které si mluvčí vykládá podle potřeby, jako
[EA-1.1.3 Terminologickou mystifikaci](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md);
pravidla, která „platí, jak se to hodí“, jako [EA-2.4.2 Skryté přepisování pravidel](@/kompendium/techniques/ea-2-4-2-policy-rewriting-skryta.md);
a postupné rozšiřování nároků jako detekční signaturu [Posun rozsahu](@/kompendium/detection-signatures/7-linguistic-scope-creep.md).
Mezera mezi tím, co skupina nebo instituce tvrdí, a tím, co dělá, je lidskou obdobou mezery ve
specifikaci.

Drift možností má obdobu v kontrolujících vztazích a organizacích. Každý krok je malý – jedna nová
povinnost, jedno omezení kontaktu, jedno „výjimečné“ porušení soukromí – a nikdo ho výslovně
neschválil. Výsledkem je stav, který by na začátku nikdo nepřijal. Kniha tento průběh zachycuje
v detekční signatuře [Akcelerace izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md)
a v rámci [coercive control](@/kompendium/glossary-bridges/bridge-coercive-control.md), jak ho
popsal Stark (2007): kontrola spočívá v nahromadění mnoha drobných omezení, nikoli v jednotlivých
incidentech.

## Kde se pojem v knize vyskytuje

Platformní použití popisuje stránka [Gray Team a okrajové případy EA](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md),
která ukazuje, jak šedý tým hledá okrajové případy v detekci technik – situace, kdy vzorec není
zřetelně manipulací ani zřetelně neškodný. Vztah k ostatním týmům popisují stránky
[White Team a ověřování](@/kompendium/aiad-integration/white-team-ea-verification.md) a
[Purple Team a syntéza](@/kompendium/aiad-integration/purple-team-ea-synthesis.md). Organizační
stránku nejasných pravidel rozebírá oddíl [Organizační obrana](@/kompendium/organizational-defense/_index.md).

## Od pojmu k praxi

### Rozpoznání

Lidskou obdobou práce šedého týmu je otázka: *co tato pravidla ve skutečnosti umožňují?* Varovným
znakem je pravidlo, jehož výklad má vždy jen jedna strana; povinnost bez jasných hranic („musíš být
k dispozici, když je potřeba“); a odpor proti vyjasnění, který kniha popisuje v detekční signatuře
[Odpor k vyjasnění](@/kompendium/detection-signatures/10-behavioral-resistance-to-clarification.md).
U driftu je klíčovým znakem srovnání s výchozím stavem: člověk si uvědomí, že dnes považuje za
normální věci, které by před rokem odmítl.

### Odlišení

Nejednoznačnost sama není manipulací. Každý soubor pravidel má mezery a lidské vztahy nejsou smlouvy;
pružnost je často výhodou. Rozhodující je, komu nejednoznačnost systematicky slouží a zda je možné
ji vyjasnit. Stejně tak ne každý posun je driftem: vztahy a organizace se vyvíjejí a mnohé změny jsou
žádoucí. Drift se pozná podle toho, že změny jdou jedním směrem, nikdo je výslovně neschválil a
pokus o jejich pojmenování vyvolá odpor.

### Obrana

Obranou je dělat to, co šedý tým: **zaznamenávat bez okamžitého hodnocení**. Kdo si vede záznam
o tom, jak se v čase mění pravidla, povinnosti nebo omezení, vidí drift, který v jednotlivých
krocích uniká. Pomáhají příručky [Audit vztahů](@/kompendium/self-defense-guides/22-relationship-audit.md)
a [Nastavování hranic](@/kompendium/self-defense-guides/21-boundary-setting.md). Pro forenzní účely
je obdobou záznamu [Rekonstrukce časové osy](@/kompendium/forensic-legal/33-timeline-reconstruction.md),
která z jednotlivých událostí skládá vzorec.

### Rámec pro profesionály

Zásada „nejprve katalogizovat, pak hodnotit“ odpovídá dobré klinické a vyšetřovací praxi: předčasný
závěr ničí informaci, kterou by pozdější posouzení potřebovalo. Kniha proto v kapitole
[6.1 Diagnostické indikátory](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md)
doporučuje zaznamenávat nejednoznačné nálezy jako nejednoznačné, místo aby se přiklonily k jednomu
výkladu, a v supervizi je vracet k posouzení.

## Časté omyly

Omylem je chápat šedý tým jako „napůl útočný“ tým. Jeho omezení na čtení je naopak bezpečnostní
pojistkou: nehledá, jak mezery zneužít, ale kde jsou. Druhým omylem je přenášet do lidských vztahů
požadavek, aby vše bylo přesně specifikováno; vztah, v němž je každé pravidlo zapsáno, by byl spíš
znakem kontroly než bezpečí. Kniha z analogie bere jen to, že mezery a posuny mají být viditelné.
Třetím omylem je považovat drift vždy za úmysl; často vzniká z nepozornosti, a proto je jeho
pojmenování prvním krokem nápravy, ne obviněním.

## Příklad (anonymizovaný kompozit)

Asistentka v malé kanceláři má v popisu práce „podporu vedení“. Během dvou let k tomu přibude
vyřizování soukromých záležitostí ředitele, dostupnost o víkendech a nakonec kontrola jeho e-mailů,
z nichž se dozvídá citlivé údaje kolegů. Žádnou změnu nikdo výslovně nezadal. Když si na radu
odborové poradkyně sepíše, co dělala na začátku a co dělá teď, sama je překvapena rozsahem posunu.
Se seznamem jde za personalistkou a popis práce se vyjasní. Případ ukazuje, že záznam změn byl
účinnější než jakýkoli spor o jednotlivý úkol.

## Meze a otevřené otázky

Analogie mezi bezpečnostní analýzou softwaru a lidskými vztahy je omezená: lidé nemají „specifikaci“,
s níž by se dalo chování porovnat, a výchozí stav je sám výsledkem vyjednávání. Otevřenou otázkou
je, jak rozlišit drift od přirozeného vývoje a jak má profesionál pracovat s nejednoznačností,
kterou nelze rozhodnout, aniž by ji předčasně uzavřel.

## Literatura

- Gibson, J. J. (1979). *The Ecological Approach to Visual Perception*. Houghton Mifflin.
- Norman, D. A. (1988). *The Psychology of Everyday Things*. Basic Books.
- Pauly, D. (1995). Anecdotes and the shifting baseline syndrome of fisheries. *Trends in Ecology & Evolution*, 10(10), 430.
- Stark, E. (2007). *[Coercive Control](@/glossary/coercive-control.md): How Men Entrap Women in Personal Life*. Oxford University Press.
- Vaughan, D. (1996). *The Challenger Launch Decision: Risky Technology, Culture, and Deviance at NASA*. University of Chicago Press.

## Související

**Glosář**

- [Gray Team](@/glossary/gray-team.md) – heslo, které tento most propojuje s knihou.
- [Color Teams](@/glossary/color-teams.md) – architektura barevných týmů.
- [White Team](@/glossary/white-team.md) – ověřování, které na šedý tým navazuje.

**Kniha**

- [Gray Team a okrajové případy EA](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md) – použití v detekci technik.
- [EA-2.4.2 Skryté přepisování pravidel](@/kompendium/techniques/ea-2-4-2-policy-rewriting-skryta.md) – nejasná pravidla jako nástroj.
- [Detekční signatura: Posun rozsahu](@/kompendium/detection-signatures/7-linguistic-scope-creep.md) – pozvolné rozšiřování nároků.
- [Audit vztahů](@/kompendium/self-defense-guides/22-relationship-audit.md) – záznam posunu ve vztahu.

**Sesterské mosty**

- [Bridge: Black Team](@/kompendium/glossary-bridges/bridge-black-team.md) – abstraktní modelování hrozeb.
- [Bridge: Red Team](@/kompendium/glossary-bridges/bridge-red-team.md) – praktická simulace útoku.
- [Bridge: Coercive control](@/kompendium/glossary-bridges/bridge-coercive-control.md) – nahromadění drobných omezení.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Gray Team (šedý tým)](@/glossary/gray-team.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
