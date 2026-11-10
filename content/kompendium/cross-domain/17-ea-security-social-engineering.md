+++
title = "Bezpečnost: sociální inženýrství"
description = "Sociální inženýrství jako manipulace důvěrou v organizaci: principy vlivu, znaky pokusu, ověřovací postupy, kultura bez obviňování a péče o zaměstnance, kteří byli oklamáni."
weight = 170

[taxonomies]
tags = ["kompendium", "cross-domain", "security"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["18-ea-security-spear-phishing", "20-ea-security-insider-threat", "22-ea-security-incident-response-narrative", "12-ea-dd-counterparty-manipulation"]
parent = "kompendium-cross-domain"
toc = true
+++

Sociální inženýrství je souhrnný název pro útoky, které nemíří na technické slabiny systému,
ale na lidi, kteří ho obsluhují: přesvědčí je, aby prozradili heslo, provedli platbu, otevřeli
dveře nebo spustili soubor. Je to nejbližší bezpečnostní obdoba toho, co kniha popisuje jako
epistemickou manipulaci – útočník vytváří u oběti nepravdivý obraz situace (kdo volá, co
se děje, co je naléhavé), v němž se škodlivé jednání jeví jako rozumné. Tato stránka
popisuje sociální inženýrství z pohledu rozpoznání a obrany; nepopisuje, jak útoky vést.

## Doména a problém

Mitnick a Simon (2002) popsali sociální inženýrství na základě vlastní zkušenosti bývalého
útočníka a zdůraznili, že nejslabším článkem bezpečnosti je důvěra – ochota lidí pomoci,
vyhovět autoritě a nezdržovat. Hadnagy (2010) shrnul obor jako soubor technik, v nichž
útočník vytváří „předstíranou situaci“ (*pretext*), která oběti dává důvod jednat. Útok
může mít podobu telefonátu („volám z IT podpory“), e-mailu, zprávy v chatu, osobní návštěvy
nebo kombinace kanálů.

Psychologicky stojí sociální inženýrství na principech vlivu, které Cialdini (1984) popsal
jako univerzální: **autorita** (požadavek přichází od nadřízeného nebo instituce), **naléhavost
a nedostatek** (je třeba jednat hned), **reciprocita** (útočník nejprve něco nabídne),
**sympatie** (útočník je milý a podobný oběti), **sociální důkaz** (kolegové to už udělali)
a **závazek** (malý první krok vede k většímu). Tyto principy nejsou samy o sobě zlé – řídí
běžnou spolupráci. Manipulace spočívá v tom, že jsou použity ve falešném rámci.

Moderní podobou je podvod se zfalšovanou identitou vedoucího pracovníka (*business email
compromise*, tzv. CEO fraud), v němž útočník napodobí komunikaci ředitele nebo dodavatele
a požaduje urgentní platbu. Generativní technologie umožňují napodobit i hlas nebo obraz
(viz [deepfake](@/glossary/deepfake.md)), čímž se oslabuje tradiční ochrana „ověř si to
telefonem“.

## Průnik s epistemickou anihilací

Sociální inženýrství využívá mechanismy, které kniha popisuje u dlouhodobé manipulace,
ve zhuštěné podobě. [Vytváření časového tlaku](@/kompendium/detection-signatures/14-behavioral-time-pressure-creation.md)
omezuje prostor pro ověření; [emocionální modulace](@/kompendium/detection-signatures/16-behavioral-emotional-modulation.md)
(strach z průšvihu, touha pomoci) zužuje pozornost; [asymetrické odhalování](@/kompendium/detection-signatures/15-behavioral-asymmetric-disclosure.md)
dává oběti jen ty informace, které podporují předstíranou situaci. Útočník také často
izoluje oběť od ověření („je to důvěrné, s nikým to neřešte“) – miniaturní podoba
[izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md).

Rozdíl je v čase: sociální inženýr potřebuje minuty nebo dny, nikoli měsíce. Proto
nemění dlouhodobě přesvědčení oběti, ale využívá jejích existujících předpokladů (důvěra
v nadřízené, ochota pomoci, strach z chyby). Organizace, v níž se nesouhlas s nadřízeným
trestá nebo v níž se chyby skrývají, je proto pro sociální inženýrství zranitelnější.

Třetím průnikem je využití dobrých vlastností. Sociální inženýrství působí nejsilněji na
lidi, kteří jsou ochotní, loajální a nechtějí zdržovat – tedy na vlastnosti, které organizace
jinak oceňuje. Obrana proto nemůže spočívat v tom, že lidé přestanou být ochotní; musí jim
dát bezpečný způsob, jak ochotu spojit s ověřením.

## Rozpoznávací znaky

Pokus o sociální inženýrství se typicky vyznačuje **neobvyklým požadavkem** (změna čísla
účtu, sdílení přístupu, obejití postupu), **naléhavostí a výjimečností** („musí to být dnes,
ředitel je v letadle“), **požadavkem na utajení** nebo obejití běžné kontroly, **tlakem
autority** spojeným s nedostupností autority pro ověření, **emocionálním nábojem** (hrozba
sankce, lichotka, soucit) a **nesouladem kanálu** – požadavek přichází jinou cestou, než je
obvyklé. Kombinace dvou a více znaků je důvodem zastavit se a ověřit.

## Rámec: právo, standardy a odpovědnost

Směrnice (EU) 2022/2555 (NIS2) ukládá subjektům v jejím rozsahu přijmout opatření řízení
kybernetických rizik včetně základních postupů kybernetické hygieny a školení (čl. 21)
a odpovědnost za tato opatření nese řídicí orgán (čl. 20). Norma ISO/IEC 27001 a navazující
ISO/IEC 27002 obsahují opatření týkající se povědomí o bezpečnosti a školení. Podvodné
vylákání plnění může naplnit znaky trestného činu podvodu podle trestního zákoníku
(zákon č. 40/2009 Sb.).

## Ochranná opatření

Nejúčinnější obranou je **postup, který nestojí na úsudku jednotlivce**: platby a změny
bankovních údajů se ověřují zpětným kontaktem na předem známé číslo, nikoli na číslo
z požadavku; citlivé operace vyžadují schválení dvou osob ([oddělení povinností](@/kompendium/organizational-defense/29-segregation-duties.md));
přístupová práva se nesdílejí ani na žádost nadřízeného. Druhou obranou je **kultura, která
dovoluje zdržet a zeptat se**: zaměstnanec, který odmítne urgentní požadavek „ředitele“ a
ověří ho, má být oceněn, i když šlo o skutečného ředitele. Třetí obranou je **školení
zaměřené na rozpoznání vzorců**, nikoli na zastrašování – lidé, kteří vědí, jak manipulace
působí, ji snáze poznají i v nové podobě (srov. [Tréninky odolnosti](@/kompendium/organizational-defense/12-training-resilience.md)).
Čtvrtou je **snadné hlášení** podezření bez obav z postihu.

Simulované útoky (cvičné phishingové kampaně a podobně) mohou být užitečné, ale jen pokud
slouží učení. Pokud vedou k veřejnému zostuzení nebo trestům, snižují ochotu hlásit
skutečné incidenty a poškozují důvěru mezi zaměstnanci a bezpečnostním týmem.

## Lidský rozměr a zotavení

Zaměstnanci, kteří byli oklamáni, prožívají silný stud, strach o práci a často si vyčítají
„naivitu“. Kniha popisuje podobné reakce u obětí dlouhodobé manipulace. Je důležité vysvětlit,
že útok byl navržen tak, aby fungoval na kompetentní a ochotné lidi, a že jejich ochota
pomoci je pro organizaci cenná. Organizace, která oběť potrestá, ztratí důvěru ostatních
a příště se o incidentu dozví později. Postupy popisují [Asistence zaměstnancům v krizi](@/kompendium/organizational-defense/35-employee-assistance-EA.md)
a [Odolnost vůči studu](@/kompendium/self-defense-guides/18-shame-resilience.md).

## Přesah do dalších oborů

Struktura sociálního inženýrství – falešný rámec, autorita, naléhavost, izolace od ověření –
se opakuje v podvodech na seniorech („vnuk v nesnázích“, falešný policista), v romantických
podvodech (Whitty 2013), v náboru do manipulativních skupin i ve zdravotnictví, kde se
podvodníci vydávají za zdravotnický personál. Ve všech těchto oblastech je ochrana podobná:
zpomalit, ověřit jinou cestou, zapojit druhou osobu. Pro jednotlivce kniha nabízí návod
[Verifikace tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md); pro
kontext zneužívání seniorů viz [Elder abuse](@/glossary/elder-abuse.md).

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Účetní střední firmy dostane v pátek odpoledne e-mail
od „ředitele“, který je na služební cestě: kvůli důvěrné akvizici je třeba okamžitě uhradit
zálohu na nový účet, nikomu o tom neříkat a volat jen na číslo v podpisu. Účetní si všimne,
že e-mail přišel z adresy s drobnou odchylkou a že ředitel nikdy nežádá platby e-mailem.
Zavolá řediteli na číslo ze seznamu firmy. Ten o ničem neví. Účetní incident nahlásí;
bezpečnostní tým zjistí, že podobný e-mail dostali i dva další zaměstnanci.

Na pondělní poradě ředitel účetní poděkuje před celým týmem – nikoli za to, že „neudělala
chybu“, ale za to, že se odvážila zdržet jeho domnělý pokyn. Firma pak do směrnice doplní,
že ověření pokynu jiným kanálem je vždy správné a nikdy se nepovažuje za neposlušnost.

## Meze a otevřené otázky

S generativními technologiemi se zvyšuje věrohodnost falešných hlasů a videí a tradiční
ověřovací kanály se oslabují. Otevřenou otázkou je, jak budovat ověřovací postupy, které
neselžou, když útočník dokáže věrohodně napodobit kohokoli, a jak přitom nevytvořit kulturu
všeobecné podezíravosti.

## Literatura

- Cialdini, R. B. (1984). *Influence: The Psychology of Persuasion.*
- Hadnagy, C. (2010). *Social Engineering: The Art of Human Hacking.*
- Mitnick, K. D., Simon, W. L. (2002). *The Art of Deception.*
- Whitty, M. T. (2013). The scammers persuasive techniques model.
- Směrnice (EU) 2022/2555 (NIS2), čl. 20 a 21.

## Související

**Mezioborové mosty**

- [Spear phishing](@/kompendium/cross-domain/18-ea-security-spear-phishing.md) – cílené e-mailové útoky.
- [Vnitřní hrozba](@/kompendium/cross-domain/20-ea-security-insider-threat.md) – manipulace zaměstnanců zevnitř.
- [Manipulace ze strany protistrany](@/kompendium/cross-domain/12-ea-dd-counterparty-manipulation.md) – vliv v jednání.

**Signatury**

- [Vytváření časového tlaku](@/kompendium/detection-signatures/14-behavioral-time-pressure-creation.md) – naléhavost jako nástroj.
- [Emocionální modulace](@/kompendium/detection-signatures/16-behavioral-emotional-modulation.md) – strach a lichotka.

**Organizace a sebeobrana**

- [Oddělení povinností](@/kompendium/organizational-defense/29-segregation-duties.md) – kontrola čtyř očí.
- [Tréninky odolnosti](@/kompendium/organizational-defense/12-training-resilience.md) – školení bez zastrašování.
- [Verifikace tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) – osobní praxe.

**Pojmy**

- [Deepfake](@/glossary/deepfake.md) – napodobení hlasu a obrazu.
