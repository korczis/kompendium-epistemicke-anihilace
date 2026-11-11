+++
title = "OSINT: ověřování subjektů v ARES a veřejných rejstřících"
description = "Co registrová data o českých firmách dokládají a co ne: ARES, veřejný rejstřík, skutečný majitel, párování entit a vzorce, jimiž se buduje zdání legitimity."
weight = 20

[taxonomies]
tags = ["kompendium", "cross-domain", "osint"]
categories = ["academic"]

[extra]
related_terms = ["3-ea-osint-justice-cz-screening", "13-ea-dd-beneficial-ownership-disinformation", "1-ea-osint-source-credibility", "29-ea-compliance-kyc-narrative-validation"]
toc = true
+++

Administrativní registr ekonomických subjektů (ARES), který provozuje Ministerstvo financí,
zpřístupňuje na jednom místě údaje z řady veřejných rejstříků – obchodního, živnostenského,
registru ekonomických subjektů a dalších. Pro prověrku protistrany v Česku je to první
a nejčastější zdroj: IČO, sídlo, statutární orgány, předmět činnosti, historie změn. Právě
proto je ARES i místem, kde se snadno zaměňuje **úřední záznam** za **ověřený fakt**. Rejstřík
dokládá, co bylo zapsáno a kdy; nedokládá, že zapsané odpovídá skutečnosti.

Tato stránka popisuje, jak s registrovými daty pracovat tak, aby sloužila k poznání, a ne
k vytváření falešné jistoty.

## Doména a problém

Veřejné rejstříky právnických osob upravuje zákon č. 304/2013 Sb., o veřejných rejstřících
právnických a fyzických osob. Zápis do obchodního rejstříku provádí rejstříkový soud a údaje
jsou chráněny zásadou materiální publicity: třetí osoba se může na zapsané údaje spolehnout.
To je právní ochrana obchodního styku, nikoli záruka, že ve firmě skutečně rozhoduje ten,
kdo je zapsán. Rejstřík nezjišťuje, zda je jednatel jen „bílým koněm“, zda sídlo není
virtuální adresou sdílenou stovkami firem, ani zda za firmou nestojí osoba, která se v
rejstříku vůbec neobjeví.

Druhým problémem je **párování entit** ([entity resolution](@/glossary/entity-resolution.md)).
Stejná osoba se v různých rejstřících může objevit s odlišným zápisem jména, datem narození
nebo adresou, a naopak dvě různé osoby mohou mít stejné jméno. Teorii pravděpodobnostního
párování záznamů formulovali Fellegi a Sunter (1969); Christen (2012) shrnuje moderní
metody. Každá metoda dělá dva druhy chyb – nespojí, co patří k sobě, a spojí, co k sobě
nepatří. Druhá chyba je zvlášť nebezpečná, protože připisuje člověku cizí minulost.

## Průnik s epistemickou anihilací

Registrová data jsou typickým nositelem toho, co kniha nazývá **zdáním epistemické autority**:
úřední podoba propůjčuje informaci váhu, kterou si nemusí zasloužit. Struktury, které mají
zakrýt skutečné poměry – řetězce firem, opakovaně měněné statutární orgány, sídla na
adresách s desítkami subjektů – využívají toho, že analytik i automatický systém obvykle
ověří *existenci* zápisu, ne jeho *smysl*. Jde o institucionální obdobu [iluzorní komplexity](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md):
složitost struktury není náhodná, ale odrazuje od dalšího zkoumání.

Opačné riziko nese osoba, která se stane předmětem chybného spojení. Pokud ji systém
spojí s insolvencí, trestní věcí nebo sankcí jmenovce, vzniká záznam, který může ovlivnit
její přístup k úvěru, zaměstnání nebo zakázkám – a jehož opravu musí iniciovat sama, často
bez vědomí, že existuje (srov. [GDPR a ochrana před chybným narativem](@/kompendium/cross-domain/27-ea-compliance-gdpr-narrative-protection.md)).

## Rozpoznávací znaky

Mezi znaky, které vyžadují hlubší prověrku, patří **vysoká frekvence změn** statutárních
orgánů a společníků, zvlášť krátce před transakcí; **sídlo na adrese** registrované pro velký
počet subjektů; **statutární orgán**, který je současně zapsán v desítkách nesouvisejících
firem; **nesoulad** mezi předmětem činnosti, velikostí a tím, co firma deklaruje navenek;
**chybějící listiny** ve Sbírce listin (zejména účetní závěrky) při současné aktivní
obchodní komunikaci; a **řetězení** vlastnictví přes zahraniční subjekty bez zjevného
ekonomického důvodu. Žádný z těchto znaků sám o sobě nedokazuje nic nekalého – virtuální
sídla využívají i drobní podnikatelé a malé firmy často nepodávají listiny z nedbalosti.
Význam má teprve kombinace znaků a jejich souvislost s ostatními zdroji.

## Rámec: právo, standardy a odpovědnost

Vedle zákona o veřejných rejstřících je pro prověrky podstatný zákon č. 37/2021 Sb.,
o evidenci skutečných majitelů, a zákon č. 253/2008 Sb., o některých opatřeních proti
legalizaci výnosů z trestné činnosti a financování terorismu, který povinným osobám ukládá
identifikaci a kontrolu klienta. Mezinárodním rámcem jsou doporučení FATF, zejména
doporučení 24 o transparentnosti právnických osob (FATF 2012, s pozdějšími aktualizacemi).
Při zpracování údajů o fyzických osobách – jednatelích, společnících – platí GDPR.

## Ochranná opatření

Prvním opatřením je **odlišit v záznamu** úroveň doložení: „zapsáno v rejstříku“, „potvrzeno
listinou“, „potvrzeno nezávislým zdrojem“, „ověřeno osobně“. Druhým je **historie, ne snímek**:
analyzovat vývoj zápisů v čase, ne jen současný stav. Třetím je **opatrnost při párování**:
každé spojení osoby napříč rejstříky zaznamenat s mírou jistoty a u spojení s negativním
dopadem vyžadovat druhý nezávislý identifikátor. Čtvrtým je **kontrola adres a osob
v síti**: kolik dalších subjektů sdílí sídlo či statutára a co mají společného
(viz [síťová analýza](@/kompendium/research-methodology/network-analysis-EA.md)). Pátým
je **lidské posouzení** automaticky generovaných varování, zvlášť pokud vedou k odmítnutí
klienta.

## Lidský rozměr a zotavení

Lidé zapsaní jako statutární orgány firem, které slouží k zakrývání skutečných poměrů,
nejsou vždy pachateli. Mezi „bílými koni“ bývají lidé v tíživé situaci, které někdo
přesvědčil k podpisu za malou odměnu nebo pod tlakem, a kteří pak nesou odpovědnost za
dluhy a jednání, o nichž nevěděli. Pro ně je situace podobná tomu, co kniha popisuje
u [nepřípustného vlivu](@/glossary/undue-influence.md): rozhodnutí bylo formálně jejich,
ale svobodné nebylo. Prověrka, která je identifikuje, by měla rozlišovat mezi strůjcem
struktury a jejím nástrojem – a ve vztahu k nim volit postup, který neprohlubuje jejich
poškození.

## Přesah do dalších oborů

Záměna úředního záznamu za ověřený fakt se opakuje v mnoha oborech. V medicíně má podobu
diagnózy, která se jednou zapíše do dokumentace a dál se přebírá bez nového posouzení;
v sociální práci podobu spisu, v němž se první hodnocení rodiny stává rámcem pro všechna
další; v personalistice podobu referencí, které se předávají bez ověření. Ve všech případech
platí, že záznam má autoritu instituce, která ho vede, ale jeho obsah je jen tak spolehlivý
jako jeho původní zdroj. Christen (2012) zdůrazňuje, že chyby při spojování záznamů se
v navazujících systémech kumulují: jednou chybně spojená identita se šíří dalšími databázemi
a její oprava je mnohem pracnější než její vznik. Pro profesionály v jakémkoli oboru plyne
stejné pravidlo – u každého záznamu, z něhož plyne rozhodnutí o člověku, se ptát, kdo ho
vytvořil, na základě čeho a zda byl od té doby ověřen. Organizační obdobu popisují
[dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md).

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Prověrka dodavatele ukáže firmu založenou před rokem,
se sídlem na adrese, kde je zapsáno přes dvě stě dalších subjektů, a s jednatelem, který je
zapsán ve třiceti firmách. Automatický systém firmu označí jako vysoce rizikovou. Analytik
ale zjistí, že adresa patří běžnému poskytovateli virtuálních sídel, jednatel je profesionální
správce firem pro zahraniční klienty a firma má řádně podané listiny. Riziko přeřadí na
střední a doporučí zjistit skutečného majitele přímo od firmy. Firma doloží vlastnickou
strukturu; ta souhlasí s evidencí skutečných majitelů. Prověrka tak skončí bez nálezu –
ale se záznamem, proč bylo původní varování přehodnoceno.

## Meze a otevřené otázky

Rejstříková data jsou nezbytná, ale z povahy věci zaostávají za realitou a nezachycují
neformální vztahy. Otevřenou otázkou je, jak automatizované prověrky vyvážit tak, aby
zachytily skutečné zakrývací struktury a přitom systematicky nepoškozovaly drobné podnikatele
a lidi se jmény, která sdílejí s jinými.

## Literatura

- Christen, P. (2012). *Data Matching: Concepts and Techniques for Record Linkage, Entity Resolution, and Duplicate Detection.*
- FATF (2012, aktualizováno). *International Standards on Combating Money Laundering and the Financing of Terrorism & Proliferation: The FATF Recommendations.*
- Fellegi, I. P., Sunter, A. B. (1969). A theory for record linkage.
- Zákon č. 304/2013 Sb., o veřejných rejstřících právnických a fyzických osob.
- Zákon č. 37/2021 Sb., o evidenci skutečných majitelů.

## Související

**Mezioborové mosty**

- [Prověrka v justice.cz a ISIR](@/kompendium/cross-domain/3-ea-osint-justice-cz-screening.md) – soudní a insolvenční záznamy.
- [Dezinformace o skutečném majiteli](@/kompendium/cross-domain/13-ea-dd-beneficial-ownership-disinformation.md) – zakrývání vlastnictví.
- [KYC a ověřování narativu klienta](@/kompendium/cross-domain/29-ea-compliance-kyc-narrative-validation.md) – identifikace klienta.

**Kontext platformy a pojmy**

- [Entity resolution](@/glossary/entity-resolution.md) – párování záznamů.
- [Due diligence](@/glossary/due-diligence.md) – rámec prověrky.

**Techniky a metody**

- [EA-1.2.3 Iluzorní komplexita](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) – složitost, která odrazuje od zkoumání.
- [Síťová analýza](@/kompendium/research-methodology/network-analysis-EA.md) – sdílené adresy a osoby.
