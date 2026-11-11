+++
title = "Bezpečnost: validace zpravodajství o hrozbách"
description = "Jak hodnotit zprávy o kybernetických hrozbách: zdroj a věrohodnost, indikátory a jejich stárnutí, sdílení podle TLP, zkreslení dodavatelů a otrávené zdroje."
weight = 240

[taxonomies]
tags = ["kompendium", "cross-domain", "security"]
categories = ["academic"]

[extra]
related_terms = ["23-ea-security-attribution-bias", "1-ea-osint-source-credibility", "8-ea-osint-cross-source-triangulation", "21-ea-security-supply-chain-narrative"]
toc = true
+++

Zpravodajství o hrozbách (*cyber threat intelligence*) má organizacím pomoci rozhodovat:
které hrozby jsou pro ně relevantní, jak útočníci postupují, co hledat v sítích a jak se
připravit. Organizace přijímají zprávy od komerčních dodavatelů, národních týmů CERT,
oborových sdílecích skupin i z otevřených zdrojů. Hodnota těchto informací závisí na tom,
jak dobře je organizace umí hodnotit – a zpravodajství o hrozbách je samo terčem i nástrojem
manipulace. Tato stránka přenáší principy hodnocení zdrojů, které kniha uplatňuje na
lidské poznání, do bezpečnostní praxe.

## Doména a problém

Zpravodajství o hrozbách se tradičně dělí na **strategické** (trendy a aktéři pro vedení),
**operační** (kampaně a jejich cíle), **taktické** (postupy útočníků) a **technické**
(konkrétní indikátory kompromitace – adresy, domény, otisky souborů). Pro popis postupů
útočníků se ustálily rámce jako Cyber Kill Chain (Hutchins, Cloppert a Amin 2011), Diamond
Model (Caltagirone, Pendergast a Betz 2013) a znalostní báze MITRE ATT&CK. Pro sdílení
se používají standardy STIX a TAXII a protokol semaforu TLP (Traffic Light Protocol), jehož
verzi 2.0 vydalo fórum FIRST v roce 2022.

Technické indikátory rychle stárnou: útočník změní infrastrukturu a adresa, která byla
včera škodlivá, je dnes neutrální nebo patří někomu jinému. Bianco (2013) to vyjádřil
„pyramidou bolesti“: indikátory na spodku (otisky souborů, IP adresy) útočník změní snadno,
postupy a nástroje na vrcholu obtížně. Zpravodajství zaměřené jen na indikátory proto
přináší krátkodobý užitek a velké množství falešných poplachů.

Komerční zpravodajství o hrozbách má vlastní zkreslení. Dodavatelé mají zájem na tom, aby
hrozby vypadaly závažně a aby jejich vlastní analýzy byly vnímány jako unikátní;
pojmenovávají skupiny útočníků vlastními jmény, takže tatáž skupina má v různých zprávách
různá jména a zdánlivě nezávislé zprávy mohou popisovat totéž. Viditelnost dodavatelů je
navíc nerovnoměrná – vidí hlavně to, co se děje u jejich zákazníků.

## Průnik s epistemickou anihilací

Kniha popisuje, jak se u jednotlivce narušuje schopnost hodnotit zdroje a jak se vytváří
dojem shody, který neodpovídá skutečnosti. Ve zpravodajství o hrozbách se tytéž mechanismy
uplatňují v profesionálním prostředí. [Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md)
má podobu zpráv, které se navzájem citují; [pseudo-konsenzus](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md)
podobu „všichni dodavatelé varují“, i když všichni vycházejí z jedné analýzy; [informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md)
podobu tisíců indikátorů denně, mezi nimiž se podstatné ztratí.

Zpravodajství může být i záměrně **otráveno**: útočník, který ví, že obránci sdílejí
indikátory, může do sdílecích kanálů podstrčit falešné, aby obránci zablokovali legitimní
služby nebo přehlédli skutečný útok. Falešné stopy v útocích (viz [zkreslení při atribuci](@/kompendium/cross-domain/23-ea-security-attribution-bias.md))
mají stejný účel: zavést analytiky špatným směrem.

Třetím průnikem je strach jako měna. Zprávy o hrozbách se snáze prodávají a čtou, když
jsou dramatické; dramatické zprávy vytvářejí tlak na rychlé a nákladné reakce. Organizace,
jejíž rozhodování řídí nejhlasitější varování, se dostává do stavu, který kniha u jednotlivců
popisuje jako chronickou hypervigilanci: všechno je hrozba, a proto nic není prioritou.

## Rozpoznávací znaky

Na problematické zpravodajství ukazuje **chybějící hodnocení zdroje a jistoty**, **indikátory
bez kontextu** (bez data, kampaně, způsobu získání), **neúměrná naléhavost** bez doložení,
**nemožnost ověřit** tvrzení z vlastních dat, **opakování stejného obsahu** ve více zdrojích
bez vlastní analýzy a **nesoulad s vlastní telemetrií** organizace. Na otrávení zdroje ukazují
indikátory, které vedou na **legitimní a široce používané služby**, nebo náhlá vlna indikátorů
od **nového nebo neznámého přispěvatele** do sdílecí skupiny.

## Rámec: standardy a odpovědnost

NIS2 (směrnice (EU) 2022/2555, čl. 29) výslovně podporuje dobrovolné sdílení informací
o kybernetické bezpečnosti mezi subjekty včetně informací o hrozbách, zranitelnostech
a indikátorech, v rámci důvěryhodných komunit a s ohledem na ochranu citlivých informací.
TLP 2.0 stanoví, s kým lze informaci sdílet; jeho porušení podkopává důvěru, na níž sdílení
stojí. Při sdílení indikátorů obsahujících osobní údaje (např. IP adresy fyzických osob)
platí GDPR.

## Ochranná opatření

Prvním opatřením je **hodnocení každého zdroje a každé zprávy** – spolehlivost zdroje
a věrohodnost informace zvlášť, jak to dělá zpravodajská praxe (srov. [důvěryhodnost zdrojů v OSINT](@/kompendium/cross-domain/1-ea-osint-source-credibility.md)).
Druhým je **mapování pojmenování** skupin útočníků mezi dodavateli, aby se tatáž informace
nepočítala vícekrát. Třetím je **ověření proti vlastním datům** a **testování indikátorů**
před nasazením blokací (zejména u indikátorů vedoucích na sdílenou infrastrukturu). Čtvrtým
je **stárnutí indikátorů** – automatické vyřazování po určité době, pokud nejsou znovu
potvrzeny. Pátým je **zaměření na postupy** (TTP) spíše než na jednotlivé indikátory. Šestým
je **zpětná vazba** zdrojům: co se potvrdilo a co ne.

## Lidský rozměr a zotavení

Analytici bezpečnostních týmů pracují pod neustálým proudem varování. Dlouhodobé vystavení
vede k únavě z poplachů, cynismu a vyhoření – stavům, v nichž klesá schopnost rozlišit
podstatné od nepodstatného. Pomáhá kvalita místo kvantity (méně, ale ověřených zpráv),
rotace, supervize a kultura, v níž je přijatelné říct, že zpráva je nedůvěryhodná.
Obecné principy péče o pozornost popisuje [Řízení kognitivní zátěže](@/kompendium/self-defense-guides/10-cognitive-load-management.md).

## Přesah do dalších oborů

Problém validace zpravodajství má obdoby všude, kde se rozhoduje na základě varování od
třetích stran. Ve zdravotnictví jde o hlášení nežádoucích účinků léků, kde je třeba odlišit
skutečný signál od šumu a od kampaní; ve veřejném zdraví o varování před epidemiemi;
ve finančnictví o varování před podvodníky sdílená mezi bankami; ve školství o varování
před rizikovými trendy mezi žáky, která se šíří mezi rodiči a učiteli často bez ověření.
Bianco (2013) i zpravodajská tradice zdůrazňují totéž: hodnota varování neleží v jeho
naléhavosti, ale v jeho ověřitelnosti a v tom, zda vede k užitečnému jednání.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Bezpečnostní tým střední firmy obdrží od tří dodavatelů
varování před novou kampaní proti jejímu odvětví, každé s jiným jménem skupiny útočníků.
Analytik porovná zprávy a zjistí, že všechny vycházejí z jedné analýzy jednoho dodavatele;
indikátory jsou z větší části totožné. Před nasazením blokací je ověří proti vlastním datům
a zjistí, že jedna z domén patří legitimní službě, kterou firma používá. Blokuje proto jen
indikátory, které potvrdí vlastní telemetrie, a zaměří se na detekci postupů popsaných
ve zprávě. Dodavatelům pošle zpětnou vazbu o chybném indikátoru.

O dva měsíce později jiný dodavatel zprávu o kampani opraví: chybný indikátor byl do
sdílecího kanálu pravděpodobně podstrčen. Firma, která ho nezablokovala, se vyhnula
výpadku vlastní služby.

## Meze a otevřené otázky

Většina organizací nemá kapacitu hodnotit zpravodajství do hloubky a spoléhá na dodavatele.
Otevřenou otázkou je, jak budovat sdílecí komunity, které jsou důvěryhodné, odolné vůči
otrávení a dostupné i menším organizacím, a jak měřit skutečnou hodnotu zpravodajství
místo jeho objemu.

Rozpoznání těchto znaků neprokazuje, že je zpráva nepravdivá, ani že dodavatel jednal nepoctivě.
Shoda více zpráv může vzniknout z jedné analýzy i tehdy, když je ta analýza správná, a nerovnoměrná
viditelnost dodavatele je vlastností jeho pozice, nikoli známkou úmyslného zkreslení. Indikátor
vedoucí na legitimní službu bývá častěji chybou sběru než podstrčením, a protože platnost
technických indikátorů je krátká (Bianco, 2013), nemusí být nález po několika dnech vůbec
opakovatelný; rozlišit obojí lze až podle toho, zda se chyba opakuje a zda ji zdroj po upozornění
opraví.

*Interpretace knihy*: hodnocení zdroje a hodnocení informace je třeba držet odděleně i tehdy, když
se zpráva potvrdí. Rámce popisující postup útočníka (Hutchins, Cloppert a Amin 2011) proto nelze
čtení zprávy nahradit — říkají, kam tvrzení patří, ne zda je doloženo; nároky na dohledatelnost
stanoví [metodologické poznámky](@/kompendium/02-uvod/metodologicke-poznamky.md).

## Literatura

- Bianco, D. J. (2013). *The Pyramid of Pain.*
- Caltagirone, S., Pendergast, A., Betz, C. (2013). *The Diamond Model of Intrusion Analysis.*
- FIRST (2022). *Traffic Light Protocol (TLP) Version 2.0.*
- Hutchins, E. M., Cloppert, M. J., Amin, R. M. (2011). Intelligence-driven computer network defense informed by analysis of adversary campaigns and intrusion kill chains.
- Směrnice (EU) 2022/2555 (NIS2), čl. 29.

## Související

**Mezioborové mosty**

- [Zkreslení při atribuci](@/kompendium/cross-domain/23-ea-security-attribution-bias.md) – od indikátorů k aktérům.
- [Důvěryhodnost zdrojů v OSINT](@/kompendium/cross-domain/1-ea-osint-source-credibility.md) – hodnocení zdroje a informace.
- [Triangulace napříč zdroji](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) – nezávislost zpráv.
- [Dodavatelský řetězec](@/kompendium/cross-domain/21-ea-security-supply-chain-narrative.md) – varování o dodavatelích.

**Signatury, techniky a kontext platformy**

- [Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – zprávy citující zprávy.

**Pojmy**

- [Intelligence fusion](@/glossary/intelligence-fusion.md) – spojování zpravodajských zdrojů.
