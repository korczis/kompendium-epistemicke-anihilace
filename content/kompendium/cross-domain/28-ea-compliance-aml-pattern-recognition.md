+++
title = "Compliance: AML a rozpoznávání vzorců"
description = "Monitorování transakcí proti praní peněz mezi skutečnými vzorci a falešnými poplachy: typologie, obranné hlášení, oběti podvodů jako nastrčené osoby a lidské posouzení."
weight = 280

[taxonomies]
tags = ["kompendium", "cross-domain", "compliance"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["29-ea-compliance-kyc-narrative-validation", "13-ea-dd-beneficial-ownership-disinformation", "4-ea-osint-sanctions-list-bias", "11-ea-dd-decision-engine-calibration"]
parent = "kompendium-cross-domain"
toc = true
+++

Opatření proti praní peněz (*anti-money laundering*, AML) ukládají bankám a dalším povinným
osobám znát své klienty, sledovat jejich transakce a hlásit podezřelé obchody. Jádrem
monitorování je rozpoznávání vzorců: struktura transakcí, která neodpovídá profilu klienta,
odpovídá známé typologii praní peněz nebo jinak vybočuje. Rozpoznávání vzorců je ale
oblast, v níž se snadno vidí vzorec tam, kde není, a nevidí tam, kde je. Kniha se zabývá
tím, jak se lidské poznání chybně ukotvuje ve vzorcích; v AML to má přímé důsledky
pro klienty i pro účinnost celého systému.

## Doména a problém

Mezinárodním standardem jsou doporučení FATF, která požadují mimo jiné kontrolu klienta,
monitorování obchodů a hlášení podezřelých obchodů finanční zpravodajské jednotce. V Česku
upravuje povinnosti zákon č. 253/2008 Sb., o některých opatřeních proti legalizaci výnosů
z trestné činnosti a financování terorismu, a finanční zpravodajskou jednotkou je Finanční
analytický úřad. Unijní rámec tvořily směrnice proti praní peněz (zejména směrnice (EU)
2015/849) a v roce 2024 byl přijat nový balíček, který zahrnuje přímo použitelné nařízení
a zřízení evropského orgánu pro boj proti praní peněz.

Reuter a Truman (2004) v analýze účinnosti režimů AML upozornili, že systém generuje
obrovské množství hlášení a nákladů, zatímco jeho skutečný dopad na trestnou činnost je
obtížně měřitelný. Monitorovací systémy produkují velké množství upozornění, z nichž
naprostá většina se při prošetření ukáže jako neopodstatněná. Instituce, které se obávají
sankcí za nenahlášení, mají sklon k **obrannému hlášení** – hlásí i to, co samy nepovažují
za podezřelé, aby se chránily. Tím se zahlcuje finanční zpravodajská jednotka a skutečné
signály se ztrácejí v šumu.

Zvláštní kategorií jsou **nastrčené osoby** (*money mules*) – lidé, přes jejichž účty
prochází peníze z trestné činnosti. Část z nich jedná vědomě, část je zmanipulována: oběti
romantických podvodů, lidé v tíživé situaci přesvědčení nabídkou „práce z domova“, senioři.
Whitty (2013) popsala postupné fáze romantického podvodu, v nichž oběť nejprve buduje
vztah s neexistující osobou a teprve později je žádána o peníze nebo o „pomoc“ s převody.

## Průnik s epistemickou anihilací

Pro analytika AML platí totéž, co kniha popisuje u rozpoznávání manipulace: vzorec není
důkaz. [Pattern evidence](@/glossary/pattern-evidence.md) má smysl jen tehdy, když je
porovnán s alternativními vysvětleními – sezónní podnikání, rodinné převody, nezvyklé,
ale legální obchody. Analytik, který vidí typologii všude, poškozuje klienty; analytik,
který se naučil upozornění rutinně uzavírat, přehlédne skutečný případ. Obojí je ztráta
kalibrace, kterou kniha popisuje u jednotlivců jako [epistemickou regresi](@/glossary/epistemicka-regrese.md).

Oběti romantických a investičních podvodů, jejichž účty se staly nástrojem praní peněz,
procházejí přesně tím procesem, který kniha popisuje: budování důvěry ([love bombing](@/glossary/love-bombing.md)),
postupná [izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md)
od rodiny, která by varovala, vytváření nouze a naléhavosti a nakonec zapojení do jednání,
za které mohou nést právní odpovědnost. Pro tyto lidi je AML monitorování zároveň místem,
kde může být manipulace odhalena – pokud ho banka chápe i jako ochranu klienta.

## Rozpoznávací znaky

Vedle obvyklých typologií (rozdělování transakcí pod limity, rychlé průchozí převody, nesoulad
s profilem) je z pohledu ochrany klienta důležité všímat si **náhlé změny chování** u
dlouholetého klienta (nové zahraniční převody, výběry hotovosti), **převodů na osoby, které
klient nikdy nepotkal**, **naléhavosti a utajování** při komunikaci s bankou („je to pro
přítele, potřebuje to hned“), **přítomnosti třetí osoby**, která klienta při jednání
navádí, a **neochoty vysvětlit** účel převodů, která může pramenit ze studu nebo
z instrukcí podvodníka. U seniorů je třeba myslet na finanční zneužívání blízkými
(viz [Elder abuse](@/glossary/elder-abuse.md)).

## Rámec: právo, standardy a odpovědnost

Povinné osoby musí podle zákona č. 253/2008 Sb. provádět kontrolu klienta, hodnotit rizika,
uchovávat záznamy a hlásit podezřelé obchody; zákon zároveň ukládá mlčenlivost o podaném
oznámení vůči klientovi. FATF ve svých dokumentech opakovaně upozorňuje na nežádoucí
důsledky plošného odmítání rizikových klientů (*de-risking*). Pro zpracování údajů
v monitorování platí GDPR, pro automatizované systémy i požadavky na lidský dohled.

## Ochranná opatření

Pro instituce: **kalibrace scénářů** monitorování na skutečných výsledcích (viz
[kalibrace rozhodovacích systémů](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md)),
**kvalitní prošetření** upozornění místo rychlého uzavírání, **zpětná vazba** od finanční
zpravodajské jednotky, **školení personálu** v rozpoznávání podvodů na klientech, **postup
pro rozhovor s klientem**, u něhož je podezření, že je obětí, a **spolupráce s policií
a poradnami** pro oběti. Pro analytiky: **dokumentace úvahy**, proč bylo upozornění
uzavřeno nebo nahlášeno, a **pravidelná supervize** kvality rozhodnutí.

Rozhovor s klientem, který je pravděpodobně obětí podvodu, vyžaduje citlivost: klient může
podvodníka hájit, stydět se nebo se bát. Konfrontace („jste oběť podvodu“) často vede
k odmítnutí; účinnější bývá věcné vysvětlení vzorce, nabídka času a možnost konzultovat
s blízkou osobou.

## Lidský rozměr a zotavení

Oběti, jejichž účty byly zneužity, prožívají dvojí ránu: ztrátu peněz a vztahu, který
považovaly za skutečný, a strach z právních následků. Stud jim často brání vyhledat pomoc.
Zotavení vyžaduje právní pomoc, finanční poradenství a psychologickou podporu zaměřenou
na zpracování zrady a studu (viz [Betrayal trauma](@/glossary/betrayal-trauma.md)
a [Odolnost vůči studu](@/kompendium/self-defense-guides/18-shame-resilience.md)). Klienti,
kteří byli neprávem podezříváni, potřebují srozumitelné vysvětlení a obnovení služeb.

## Přesah do dalších oborů

Rozpoznávání vzorců s asymetrickými náklady chyb se objevuje ve zdravotnictví (screening
nemocí s falešně pozitivními nálezy), v ochraně dětí (vzorce, které mohou naznačovat
zanedbávání, ale mají i nevinná vysvětlení), v pojišťovnictví (detekce podvodů) a v sociální
práci. Všude platí, že systém navržený tak, aby nic nepropustil, přetíží ty, kdo ho
vyhodnocují, a poškodí ty, kdo jsou falešně označeni. Reuter a Truman (2004) i literatura
o screeningu zdůrazňují, že účinnost se měří tím, co systém skutečně zachytí, ne tím,
kolik upozornění vytvoří.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Systém banky označí účet sedmdesátileté klientky, která
během dvou měsíců poslala na zahraniční účty většinu svých úspor. Analytik místo prostého
nahlášení požádá pobočku o rozhovor. Klientka vysvětlí, že pomáhá „snoubenci“, s nímž se
seznámila na internetu a který má potíže s celnicí. Pracovnice pobočky jí věcně vysvětlí,
jak takové podvody obvykle probíhají, nabídne odklad dalšího převodu a možnost poradit se
s dcerou. Klientka se rozhodne převod odložit. Banka podá oznámení o podezřelém obchodu
a klientce předá kontakt na policii a poradnu pro oběti. Pro klientku je nejtěžší přijmout,
že vztah nebyl skutečný; v tom jí pomáhá podpora rodiny, kterou podvodník předtím úspěšně
odstavil.

## Meze a otevřené otázky

Režim AML je drahý a jeho účinnost je sporná; zároveň je společensky nutný. Otevřenou
otázkou je, jak snížit podíl falešných poplachů bez ztráty citlivosti a jak lépe využít
monitorování k ochraně klientů, kteří jsou obětí podvodu, aniž by se porušila povinnost
mlčenlivosti o oznámení.

## Literatura

- FATF (2012, s aktualizacemi). *The FATF Recommendations.*
- Reuter, P., Truman, E. M. (2004). *Chasing Dirty Money: The Fight Against Money Laundering.*
- Whitty, M. T. (2013). The scammers persuasive techniques model: Development of a stage model to explain the online dating romance scam.
- Zákon č. 253/2008 Sb., o některých opatřeních proti legalizaci výnosů z trestné činnosti a financování terorismu.

## Související

**Mezioborové mosty**

- [KYC a ověřování narativu klienta](@/kompendium/cross-domain/29-ea-compliance-kyc-narrative-validation.md) – poznání klienta.
- [Dezinformace o skutečném majiteli](@/kompendium/cross-domain/13-ea-dd-beneficial-ownership-disinformation.md) – zakrývání vlastnictví.
- [Sankční seznamy a falešné shody](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md) – screening.
- [Kalibrace rozhodovacích systémů](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md) – monitorovací modely.

**Pojmy a ochrana**

- [Pattern Evidence](@/glossary/pattern-evidence.md) – vzorec jako doklad a jeho meze.
- [Elder Abuse](@/glossary/elder-abuse.md) – finanční zneužívání seniorů.
- [Love bombing](@/glossary/love-bombing.md) – budování důvěry v podvodu.

**Právo**

- [Podvod jako element EA](@/kompendium/forensic-legal/17-fraud-EA-element.md) – právní rámec podvodu.
