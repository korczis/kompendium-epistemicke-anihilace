+++
title = "OSINT: prověrka v justice.cz, Sbírce listin a ISIR"
description = "Jak číst soudní, insolvenční a rejstříkové záznamy při prověrce osob a firem: presumpce neviny, jmenovci, neúplnost záznamů a riziko trvalého stigmatu."
weight = 30

[taxonomies]
tags = ["kompendium", "cross-domain", "osint"]
categories = ["academic"]

[extra]
related_terms = ["2-ea-osint-czech-ares-validation", "4-ea-osint-sanctions-list-bias", "27-ea-compliance-gdpr-narrative-protection", "15-ea-dd-evidence-quality-assessment"]
toc = true
+++

Portál justice.cz zpřístupňuje veřejný rejstřík a Sbírku listin, insolvenční rejstřík (ISIR)
a další informace české justice. Pro prověrku osob a firem jsou to zdroje mimořádné hodnoty:
ukazují insolvenční řízení, změny ve vedení firem, účetní závěrky, zakladatelské dokumenty.
Zároveň jsou to zdroje, jejichž čtení vyžaduje právní porozumění. Záznam o zahájení řízení
není rozhodnutím, insolvenční návrh není úpadek, a podání věřitele může být nástrojem tlaku,
ne důkazem dluhu. Analytik, který tyto rozdíly přehlíží, vytváří z úředních dat příběh,
který úřední data nenesou.

## Doména a problém

Insolvenční rejstřík vede soud podle zákona č. 182/2006 Sb., o úpadku a způsobech jeho
řešení (insolvenční zákon). Je veřejný a zobrazuje i řízení, v nichž byl návrh odmítnut
nebo zamítnut. Insolvenční návrh může podat i věřitel a samotné zahájení řízení má pro
dlužníka okamžité důsledky – zápis se objeví v prověrkách bank, dodavatelů i zaměstnavatelů.
Proto zákon postihuje návrhy podané zjevně bezdůvodně a právní praxe se opakovaně zabývá
šikanózními insolvenčními návrhy jako nástrojem tlaku na konkurenta.

Sbírka listin obsahuje dokumenty, které firmy samy předkládají – účetní závěrky, výroční
zprávy, zakladatelská jednání. Jejich pravdivost rejstříkový soud věcně nepřezkoumává;
odpovědnost nese firma a její auditor (pokud existuje). Chybějící listina může znamenat
problém, ale také jen nedbalost.

## Průnik s epistemickou anihilací

Soudní a insolvenční záznamy mají ve veřejném vnímání silnou autoritu: „je to v rejstříku“
zní jako konečný verdikt. Právě tato autorita z nich dělá účinný nástroj
[delegitimizace](@/glossary/delegitimizace.md). Kniha popisuje [clip takeout](@/kompendium/techniques/ea-2-3-1-clip-takeout.md)
a [quote mining](@/kompendium/techniques/ea-2-3-3-quote-mining.md) jako vytržení části
z celku tak, že se změní její význam. U rejstříkových dat je obdobou zmínka o „insolvenčním
řízení“ bez informace, že návrh byl odmítnut, nebo o „trestním oznámení“ bez informace,
že věc byla odložena.

Z hlediska osoby, jíž se záznam týká, jde o zkušenost, kterou literatura o [epistemické injustici](@/glossary/epistemicka-injustice.md)
popisuje jako snížení důvěryhodnosti: její vlastní vysvětlení má menší váhu než úřední
záznam, i když záznam sám o sobě nic nedokazuje (Fricker 2007). Pokud se záznam šíří
v profilech a databázích dál, osoba ztrácí kontrolu nad tím, jak je vnímána – mechanismus,
který kniha zkoumá v souvislosti s [narativním traumatem](@/glossary/narrative-trauma.md).

## Rozpoznávací znaky

Při čtení záznamů je třeba všímat si **stavu řízení** (zahájeno, odmítnuto, zamítnuto,
rozhodnuto, zrušeno), **osoby navrhovatele** (dlužník, věřitel, opakovaný navrhovatel
u více subjektů), **časové souvislosti** (návrh podaný těsně před transakcí, volbami,
výběrovým řízením), a **shody identifikátorů** (jméno, datum narození, adresa). U Sbírky
listin je třeba sledovat **úplnost a vnitřní konzistenci** listin v čase – náhlé změny
v účetních výkazech, opožděné podání více let najednou, rozpory mezi výroční zprávou
a závěrkou. Varovným znakem manipulace s pověstí je, když se záznam o neúspěšném řízení
objevuje v médiích nebo na sociálních sítích bez informace o jeho výsledku, a to opakovaně
a koordinovaně (viz [injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md)).

## Rámec: právo, standardy a odpovědnost

Pro zpracování údajů o trestních věcech fyzických osob stanoví GDPR v čl. 10 zvláštní
omezení; zpracování údajů o rozsudcích v trestních věcech a trestných činech je možné jen
pod dozorem orgánu veřejné moci nebo tam, kde to povoluje právo. Pro prověrky to znamená,
že informace o trestní minulosti osob nelze volně shromažďovat ani uchovávat. Presumpce
neviny (čl. 40 odst. 2 Listiny základních práv a svobod; čl. 6 odst. 2 Evropské úmluvy
o lidských právech) není jen procesní zásada pro soudy – je to i etický standard pro každého,
kdo s informacemi o řízeních pracuje. U právnických osob vede rejstřík trestů i záznamy
podle zákona č. 418/2011 Sb., o trestní odpovědnosti právnických osob.

## Ochranná opatření

Každý záznam z rejstříku se v prověrce uvádí **s jeho stavem a výsledkem**, nikoli jen
s existencí. Spojení záznamu s osobou vyžaduje **shodu více identifikátorů**; shoda jména
nestačí. Záznamy se hodnotí **v kontextu** – kdo byl navrhovatelem, zda šlo o spor, jak
skončil. U negativních záznamů je vhodné dát subjektu **možnost vyjádřit se** dřív, než
z nich vznikne rozhodnutí. A konečně, prověrka by měla mít **lhůtu relevance**: řízení
skončené před mnoha lety s výsledkem příznivým pro subjekt nemá v profilu figurovat jako
riziko. Tato opatření navazují na [hodnocení kvality důkazů](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md)
a na organizační standard [sledovatelnosti rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md).

## Lidský rozměr a zotavení

Lidé, kteří prošli šikanózním insolvenčním návrhem nebo neopodstatněným trestním oznámením,
popisují dlouhodobé následky, které přesahují samotné řízení: ztrátu důvěry obchodních
partnerů, opakované vysvětlování, pocit, že „to na nich zůstane“. V extrémních případech
jde o součást širší kampaně, kterou kniha popisuje jako [institucionální vyloučení](@/kompendium/techniques/ea-2-1-7-institucionalni-vyloucenni.md).
Pomáhá jim dokumentace (rozhodnutí o odmítnutí, potvrzení o skončení věci), kterou mohou
předkládat, a profesionálové, kteří záznamy čtou správně. Podporu v osobní rovině popisuje
[odolnost vůči studu](@/kompendium/self-defense-guides/18-shame-resilience.md).

## Přesah do dalších oborů

Riziko, že informace o zahájeném řízení začne žít vlastním životem, se týká i dalších
oborů. V pracovním právu může interní šetření, které skončilo bez nálezu, zůstat v pověsti
zaměstnance jako „ten, kdo byl vyšetřován“ (viz [Pracovní právo](@/kompendium/forensic-legal/44-employment-law-EA.md)).
V rodinném právu mohou obvinění vznesená v průběhu sporu přetrvat v posudcích, i když
nebyla prokázána (viz [Rodinné právo](@/kompendium/forensic-legal/41-family-court-EA.md)).
Ve zdravotnictví může stížnost na lékaře, která byla shledána neoprávněnou, ovlivnit jeho
další kariéru. Ve všech těchto oblastech platí, co Fricker (2007) popisuje jako
svědeckou křivdu: posluchač přisuzuje mluvčímu nižší důvěryhodnost kvůli předsudku, který
s obsahem výpovědi nesouvisí. Záznam o řízení funguje jako takový předsudek, pokud se
čte bez výsledku. Profesionálové, kteří s takovými záznamy pracují, by proto měli mít
pravidlo, že informace o řízení se nikdy nepředává bez informace o jeho stavu a výsledku.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Při prověrce kandidáta na místo finančního ředitele
systém vrátí záznam v ISIR. Analytik zjistí, že návrh podal před čtyřmi lety věřitel,
který v témže roce podal návrhy na další tři subjekty, a že soud návrh odmítl. Kandidát
na dotaz předloží rozhodnutí a vysvětlí, že šlo o spor o fakturu s bývalým dodavatelem.
Zpráva uvádí záznam se stavem „odmítnuto“ a hodnotí ho jako nerelevantní pro riziko.
Kdyby analytik uvedl jen „kandidát figuruje v insolvenčním rejstříku“, rozhodnutí
zaměstnavatele by stálo na informaci, která je pravdivá a zároveň zavádějící.

Kandidát přitom popsal, že stejný záznam mu v minulosti dvakrát zkomplikoval jednání
s bankou, a teprve tentokrát se ho někdo zeptal na vysvětlení. Tato zkušenost – opakované
odmítnutí bez možnosti vyjádřit se – je přesně to, čemu má správné čtení záznamů předcházet.

## Meze a otevřené otázky

Veřejnost soudních a insolvenčních záznamů je důležitá pro právní jistotu, ale v době
automatizovaných prověrek a trvalých archivů vytváří trvalou stopu i tam, kde řízení skončilo
ve prospěch dotčeného. Otevřenou otázkou je, jak vyvážit transparentnost a právo na nové
začátky, a zda by agregátory dat neměly mít povinnost zobrazovat výsledek řízení stejně
výrazně jako jeho zahájení.

## Literatura

- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing.*
- Zákon č. 182/2006 Sb., o úpadku a způsobech jeho řešení (insolvenční zákon).
- Zákon č. 418/2011 Sb., o trestní odpovědnosti právnických osob a řízení proti nim.
- Nařízení (EU) 2016/679 (GDPR), čl. 10.

## Související

**Mezioborové mosty**

- [Ověřování v ARES](@/kompendium/cross-domain/2-ea-osint-czech-ares-validation.md) – rejstříková data o subjektu.
- [GDPR a ochrana před chybným narativem](@/kompendium/cross-domain/27-ea-compliance-gdpr-narrative-protection.md) – oprava a výmaz.
- [Hodnocení kvality důkazů](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md) – co záznam dokládá.

**Techniky a signatury**

- [EA-2.3.1 Clip Takeout](@/kompendium/techniques/ea-2-3-1-clip-takeout.md) – vytržení z celku.
- [EA-2.1.7 Institucionální vyloučení](@/kompendium/techniques/ea-2-1-7-institucionalni-vyloucenni.md) – instituce jako nástroj.
- [Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md) – šíření vytržených záznamů.

**Právo a pojmy**

- [Pomluva v EA kontextu](@/kompendium/forensic-legal/14-defamation-EA.md) – právní obrana pověsti.
- [Delegitimizace](@/glossary/delegitimizace.md) – oslabení důvěryhodnosti osoby.
