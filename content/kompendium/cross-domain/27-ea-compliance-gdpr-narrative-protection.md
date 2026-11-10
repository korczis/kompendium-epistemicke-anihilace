+++
title = "Compliance: GDPR a ochrana před chybným narativem o člověku"
description = "Jak GDPR chrání člověka před tím, aby o něm kolovaly nepřesné záznamy a profily: přesnost, oprava, výmaz, námitka, automatizované rozhodování a právo být zapomenut."
weight = 270

[taxonomies]
tags = ["kompendium", "cross-domain", "compliance"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["3-ea-osint-justice-cz-screening", "11-ea-dd-decision-engine-calibration", "4-ea-osint-sanctions-list-bias", "29-ea-compliance-kyc-narrative-validation"]
parent = "kompendium-cross-domain"
toc = true
+++

O každém z nás existují záznamy v desítkách systémů – u bank, zaměstnavatelů, zdravotnických
zařízení, úřadů, platforem, agregátorů dat. Z těchto záznamů vznikají profily a z profilů
příběhy: „rizikový klient“, „problémový zaměstnanec“, „nespolehlivý dlužník“. Pokud je
záznam chybný, příběh se šíří a ovlivňuje rozhodnutí, o nichž člověk často ani neví.
Kniha popisuje, jak se člověku může vzít kontrola nad vlastním příběhem; obecné nařízení
o ochraně osobních údajů (GDPR, nařízení (EU) 2016/679) je jedním z mála právních nástrojů,
které mu část této kontroly vracejí.

## Doména a problém

GDPR stanoví zásady zpracování osobních údajů (čl. 5), mezi nimi **zákonnost, korektnost
a transparentnost**, **účelové omezení**, **minimalizaci údajů**, **přesnost** (údaje mají
být přesné a v případě potřeby aktualizované; nepřesné údaje mají být bez zbytečného
odkladu vymazány nebo opraveny), **omezení uložení** a **integritu a důvěrnost**. Subjekt
údajů má právo na přístup (čl. 15), opravu (čl. 16), výmaz (čl. 17), omezení zpracování
(čl. 18), námitku (čl. 21) a právo nebýt předmětem rozhodnutí založeného výhradně na
automatizovaném zpracování s právními či obdobně významnými účinky (čl. 22).

Soudní dvůr EU v rozsudku Google Spain (C-131/12, 2014) dovodil, že provozovatel internetového
vyhledávače je správcem osobních údajů a že dotčená osoba může za určitých podmínek požadovat
odstranění odkazů na informace, které jsou nepřesné, neadekvátní, irelevantní nebo
nepřiměřené vzhledem k účelu – což se ujalo jako „právo být zapomenut“ a bylo zakotveno
v čl. 17 GDPR.

Problémem je, že **práva fungují jen tehdy, když o záznamu víte**. Mnoho lidí se o chybném
profilu dozví až tehdy, když jim je odmítnut úvěr, zaměstnání nebo služba – a často
bez vysvětlení. Druhým problémem je, že se chybný záznam šíří mezi správci: oprava u jednoho
nezaručuje opravu u ostatních, i když čl. 19 GDPR ukládá správci oznámit opravu příjemcům,
jimž byly údaje zpřístupněny.

## Průnik s epistemickou anihilací

Kniha popisuje [narativní trauma](@/glossary/narrative-trauma.md) a ztrátu [narativní identity](@/glossary/narativni-identita.md)
jako stav, kdy člověk ztrácí autorství nad svým příběhem. Chybný záznam, který se šíří
systémy, vytváří institucionální obdobu: o člověku koluje příběh, který nenapsal, nemůže
ho vidět a obtížně ho mění. Pokud mu instituce na základě tohoto příběhu odmítá věřit,
jde o strukturální [epistemickou injustici](@/glossary/epistemicka-injustice.md) – jeho
vlastní svědectví o sobě má menší váhu než cizí záznam (Fricker 2007).

Zuboffová (2019) popsala „sledovací kapitalismus“ jako ekonomický model, v němž se data
o chování lidí přeměňují v předpovědi a v nástroje ovlivňování (viz [Zuboff: Surveillance
Capitalism](@/kompendium/07-teoreticke-reflexe/zuboff-surveillance-capitalism.md)). V tomto
modelu je profil nejen popisem, ale i prostředkem, jak člověka řídit – což je z pohledu
knihy nejširší rámec, v němž otázka „kdo má kontrolu nad mým příběhem“ získává politický
rozměr. GDPR je jedním z pokusů tento model omezit.

Třetím průnikem je setrvačnost záznamu. I poté, co byl údaj opraven, mohou rozhodnutí
založená na původním záznamu přetrvávat: odmítnutý klient je veden jako „dříve odmítnutý“,
zaměstnanec, o němž kolovala nepravdivá informace, zůstává „ten, o kterém se něco říkalo“.
Lewandowsky a kolegové (2012) popsali trvalý vliv opravené dezinformace u jednotlivců;
v institucích se stejný efekt projevuje přes navazující záznamy a pověst.

## Rozpoznávací znaky

Na to, že o člověku koluje chybný narativ, ukazují **opakovaná odmítnutí bez vysvětlení**
u různých institucí, **nečekané dotazy** na skutečnosti, které člověk nezná, **cílená
reklama nebo nabídky**, které prozrazují nepřesný profil, **zmínky ve vyhledávačích**
spojené s jmenovcem nebo se starou událostí, a **nesoulad mezi tím, co člověk ví o své
historii, a tím, co o ní tvrdí instituce**. Na straně organizace je varovným znakem, když
**nemá postup**, jak ověřit a opravit sporný údaj, a když **automatizované rozhodnutí**
nelze vysvětlit.

## Rámec: právo, standardy a odpovědnost

Vedle GDPR platí v Česku zákon č. 110/2019 Sb., o zpracování osobních údajů, a dozor
vykonává Úřad pro ochranu osobních údajů. Pro rozhodování založené na automatizovaném
zpracování stanoví nařízení (EU) 2024/1689 o umělé inteligenci u vysoce rizikových systémů
další povinnosti, včetně lidského dohledu. Pro údaje o trestních věcech platí čl. 10 GDPR
(viz [Prověrka v justice.cz a ISIR](@/kompendium/cross-domain/3-ea-osint-justice-cz-screening.md)).

## Ochranná opatření

Pro organizace: **postup pro sporné údaje** (kdo ověřuje, v jaké lhůtě, s jakým výsledkem),
**propagace opravy** k příjemcům údajů, **vysvětlitelnost** rozhodnutí, **lidské posouzení**
u rozhodnutí s významným dopadem, **pravidelné ověřování přesnosti** u údajů, které se
přebírají z externích zdrojů, a **minimalizace** – co se neshromáždí, nemůže se stát
chybným příběhem. Pro jednotlivce: **žádost o přístup** k údajům u institucí, kde má
podezření na chybný profil, **žádost o opravu** s doklady, **námitka** proti profilování
a **stížnost** u dozorového úřadu. Kniha k tomu nabízí osobní praxi [Správa narativu](@/kompendium/self-defense-guides/41-narrative-stewardship.md).

## Lidský rozměr a zotavení

Lidé, o nichž koloval chybný záznam, popisují zkušenost blízkou tomu, co kniha popisuje
u gaslightingu: instituce jim tvrdí něco o jejich vlastním životě, co neodpovídá jejich
paměti, a oni musejí dokazovat, že se mýlí instituce. Opakované odmítání vede k vyčerpání
a rezignaci. Pomáhá jim, když mají vlastní záznamy (smlouvy, potvrzení, korespondenci),
když jim někdo pomůže s právními kroky a když instituce uzná chybu výslovně. Kniha podobnou
obnovu důvěry popisuje v [Subakutní rekonstrukci důvěry](@/kompendium/recovery-protocols/subacute-trust-rebuilding.md).

## Přesah do dalších oborů

Chybný narativ o člověku je zvlášť škodlivý ve zdravotnictví, kde se nesprávná diagnóza
nebo poznámka o „neadherentním“ či „psychosomatickém“ pacientovi přenáší do dalších
zpráv a ovlivňuje péči; v sociální práci, kde první hodnocení rodiny určuje další postup;
ve školství, kde se hodnocení žáka přenáší mezi ročníky; a v rodinných sporech, kde se
tvrzení jedné strany stávají „fakty“ ve spisech (viz [Rodinné právo](@/kompendium/forensic-legal/41-family-court-EA.md)).
Ve všech oborech platí princip přesnosti z čl. 5 GDPR a obecnější etický princip: člověk
má mít možnost vidět a zpochybnit to, co se o něm tvrdí.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Žena je opakovaně odmítnuta při žádosti o pronájem
bytu. Teprve po několika měsících jí jeden pronajímatel řekne, že databáze, kterou používá,
ji vede jako dlužnici. Žena podá žádost o přístup k údajům u provozovatele databáze
a zjistí, že záznam se týká jmenovkyně s jiným datem narození. Podá žádost o opravu
s doklady; provozovatel záznam opraví a oznámí to pronajímatelům, kteří se na ni dotazovali.
Žena podá i stížnost u dozorového úřadu, protože provozovatel neměl postup, jak ověřit
shodu identifikátorů. Úřad zahájí kontrolu.

Pro ženu je nejtěžší ztracený čas a pocit, že musela dokazovat, kdo je. Kdyby provozovatel
ověřoval shodu více identifikátorů a kdyby pronajímatelé sdělovali důvod odmítnutí,
k celé situaci by nedošlo.

## Meze a otevřené otázky

Práva podle GDPR vyžadují aktivitu dotčeného a předpokládají, že o záznamu ví; v prostředí
mnoha správců a obchodníků s daty je to často nereálné. Otevřenou otázkou je, jak
přesunout odpovědnost za přesnost na ty, kdo údaje používají k rozhodování, a jak zajistit,
aby oprava dosáhla všech kopií chybného záznamu.

## Literatura

- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing.*
- Lewandowsky, S., Ecker, U. K. H., Seifert, C. M., Schwarz, N., Cook, J. (2012). Misinformation and its correction.
- Zuboff, S. (2019). *The Age of Surveillance Capitalism.*
- Nařízení (EU) 2016/679 (GDPR), čl. 5, 15–22.
- Rozsudek Soudního dvora ze dne 13. 5. 2014, Google Spain SL a Google Inc. v. AEPD a Mario Costeja González, C-131/12.

## Související

**Mezioborové mosty**

- [Prověrka v justice.cz a ISIR](@/kompendium/cross-domain/3-ea-osint-justice-cz-screening.md) – soudní a insolvenční záznamy.
- [Kalibrace rozhodovacích systémů](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md) – automatizované rozhodování.
- [Sankční seznamy a falešné shody](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md) – jmenovci v databázích.

**Teorie a sebeobrana**

- [Zuboff: Surveillance Capitalism](@/kompendium/07-teoreticke-reflexe/zuboff-surveillance-capitalism.md) – ekonomický rámec profilování.
- [Správa narativu](@/kompendium/self-defense-guides/41-narrative-stewardship.md) – kontrola nad vlastním příběhem.

**Pojmy**

- [Narrative Trauma](@/glossary/narrative-trauma.md) – ztráta autorství příběhu.
- [Epistemická injustice](@/glossary/epistemicka-injustice.md) – svědectví o sobě bez váhy.
- [Doxing](@/glossary/doxing.md) – zneužití osobních údajů.
