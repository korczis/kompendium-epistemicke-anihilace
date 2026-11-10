+++
title = "OSINT: sankční seznamy, falešné shody a zkreslení"
description = "Sankční screening mezi povinností a omylem: shody jmen, přepis z cizích písem, hromadné odmítání klientů, politika seznamů a cesty k nápravě."
weight = 40

[taxonomies]
tags = ["kompendium", "cross-domain", "osint"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["3-ea-osint-justice-cz-screening", "28-ea-compliance-aml-pattern-recognition", "29-ea-compliance-kyc-narrative-validation", "11-ea-dd-decision-engine-calibration"]
parent = "kompendium-cross-domain"
toc = true
+++

Sankční seznamy jsou jedním z mála míst, kde má informace okamžitý a tvrdý právní účinek:
osobě na seznamu se zmrazí majetek a nikdo jí nesmí zpřístupnit finanční prostředky. Proto
banky, platební instituce a další povinné osoby prověřují klienty a transakce proti seznamům
Evropské unie, Rady bezpečnosti OSN a často i proti seznamům jiných států (např. seznam
SDN amerického úřadu OFAC). [Sanctions screening](@/glossary/sanctions-screening.md) je
povinnost, jejíž zanedbání má vážné důsledky. Je to ale také proces, který systematicky
vytváří omyly – a jehož omyly nesou konkrétní lidé.

## Doména a problém

Sankční screening porovnává jména klientů a protistran s jmény na seznamech. Protože jména
se píší různě, přepisují z cizích písem a zkracují, používá se přibližné porovnávání. Každé
nastavení prahu podobnosti je kompromisem: přísný práh propouští skutečné shody, volný práh
generuje velké množství falešných poplachů. Lidé, jejichž jména jsou běžná v určitých jazycích
nebo regionech, jsou falešnými shodami zasaženi častěji. Výsledkem je systematické zkreslení,
které nevzniká z úmyslu, ale z konstrukce systému.

Druhým problémem je **odstraňování rizika** (*de-risking*): instituce, pro které je
prověřování klientů z rizikových zemí nákladné, ukončují vztahy s celými skupinami klientů.
FATF na tento jev opakovaně upozornila jako na nežádoucí důsledek, který vytlačuje lidi
mimo regulovaný finanční systém. Třetím problémem jsou samotné seznamy: zápis je politickým
a právním rozhodnutím, které může být chybné, a jeho přezkum je zdlouhavý.

## Průnik s epistemickou anihilací

Sankční seznam je extrémním případem informace s autoritou. Kdo je zapsán, „je sankcionovaný“,
a tato nálepka přechází do dalších databází, médií a profilů – i tehdy, když byl zápis zrušen
nebo když jde jen o jmenovce. Pro osobu, která je chybně spojena se sankcí, je zkušenost
podobná tomu, co kniha popisuje jako [delegitimizaci](@/glossary/delegitimizace.md): její
vysvětlení nemá váhu proti záznamu, a protože systémy často nesdělují důvod odmítnutí,
nemá ani možnost se bránit. Nemožnost zjistit, co je vám vytýkáno a kdo rozhodl, vytváří
strukturálně podobnou bezmoc, jakou kniha u záměrné manipulace popisuje jako
[implantaci existenciální bezmoci](@/kompendium/techniques/ea-2-5-10-existential-helplessness-implantace.md)
– s tím rozdílem, že zde ji nikdo nezamýšlí.

Na úrovni analytika se projevuje [automation bias](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md):
pokud systém označí shodu, má analytik sklon ji potvrdit, protože odpovědnost za
propuštění skutečné shody je osobně rizikovější než odpovědnost za odmítnutí nevinného
klienta (Parasuraman a Manzey 2010). Tato asymetrie motivací je zdrojem systematického
zkreslení.

## Rozpoznávací znaky

Znakem falešné shody bývá **shoda jména bez shody dalších identifikátorů** (datum narození,
státní příslušnost, číslo dokladu), **neúplný záznam** na seznamu (jen jméno a přibližný
rok narození), **přepis** z jiného písma s více možnými variantami a **odlišný profil**
klienta od profilu sankcionované osoby (věk, povolání, místo pobytu). Znakem systémového
zkreslení je, když se falešné poplachy koncentrují u klientů určitého původu a když
instituce reaguje plošným odmítáním místo individuálního posouzení. Znakem problému
na straně seznamů je zápis opřený o neveřejné důvody, které dotčená osoba nemůže poznat
ani zpochybnit.

## Rámec: právo, standardy a odpovědnost

V Evropské unii se sankce zavádějí rozhodnutími Rady v rámci společné zahraniční
a bezpečnostní politiky a nařízeními, která jsou přímo použitelná; příkladem je nařízení
Rady (EU) č. 269/2014 o omezujících opatřeních vzhledem k činnostem narušujícím územní
celistvost Ukrajiny. V Česku stanoví provádění mezinárodních sankcí zákon č. 69/2006 Sb.,
o provádění mezinárodních sankcí. Soudní ochranu osob na seznamech zásadně ovlivnil rozsudek
Soudního dvora EU ve spojených věcech Kadi a Al Barakaat (C-402/05 P a C-415/05 P, 2008),
podle něhož i provedení sankcí OSN musí v unijním právu respektovat základní práva, včetně
práva na obhajobu a účinnou soudní ochranu. Ochrana osobních údajů při screeningu se řídí GDPR.

## Ochranná opatření

Prvním opatřením je **vícestupňové posouzení**: automatická shoda je jen podnětem a teprve
porovnání dalších identifikátorů rozhoduje. Druhým je **dokumentace rozhodnutí** o každé
shodě – proč byla potvrzena nebo vyloučena – aby se stejná falešná shoda neopakovala
u stejného klienta. Třetím je **sledování rozložení falešných poplachů** podle skupin
klientů jako ukazatel systémového zkreslení. Čtvrtým je **kalibrace prahů** s vědomím
nákladů obou druhů chyb. Pátým je **srozumitelná cesta k nápravě**: klient, kterému byla
zablokována platba kvůli shodě, by měl vědět, jak doložit, že nejde o něj. Pro
kontext automatizace viz [kalibrace rozhodovacího systému](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md)
a stránku platformy [Compliance Agent & EA detection](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md).

## Lidský rozměr a zotavení

Pro jednotlivce je zablokovaná platba nebo zrušený účet existenční problém: nemůže přijmout
mzdu, zaplatit nájem, poslat peníze rodině. Pokud se to opakuje u každé nové instituce,
vzniká trvalá zkušenost bezmoci. U lidí, kteří už prošli politickým pronásledováním nebo
útěkem, může tato zkušenost oživit předchozí traumata (srov. [Uprchlík v EA-emergency](@/kompendium/emergency-protocols/30-refugee-EA-emergency.md)).
Profesionálové v compliance mohou omezit škodu tím, že komunikují srozumitelně, nepoužívají
obviňující jazyk a dávají jasný postup, jak situaci vyřešit.

## Přesah do dalších oborů

Struktura sankčního screeningu – seznam, automatické porovnání, asymetrické náklady chyb –
se opakuje v mnoha oblastech. Letecké seznamy osob, jimž je odepřen nástup do letadla,
ve zdravotnictví varovné záznamy o „problémových“ pacientech, ve školství seznamy žáků
označených za rizikové, v personalistice automatické filtry životopisů. Všude se ukazuje
stejný vzorec: systém je navržen tak, aby nepropustil skutečné riziko, a cenu za falešné
poplachy nesou lidé, kteří o svém označení často nevědí. Parasuraman a Manzey (2010)
popisují, že lidé dohlížející na automatizované systémy mají sklon přijímat jejich výstupy
bez dostatečné kontroly, zvlášť při vysoké zátěži. Pro každý takový systém je proto
užitečné ptát se, kdo nese náklady chyb, jak se o nich dotčení dozvědí a jak se mohou
bránit. Pokud odpověď zní „nikdo, nijak a nemohou“, systém vytváří strukturální
[epistemickou injustici](@/glossary/epistemicka-injustice.md) bez ohledu na dobrý úmysl
těch, kdo ho provozují.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Zahraniční student s běžným příjmením z jeho země
přijde o přístup k platební kartě; systém banky ho spojil s osobou na sankčním seznamu.
Záznam na seznamu obsahuje jen jméno a rok narození, který se liší o šest let. Analytik
shodu vyloučí, ale systém ji při každé měsíční kontrole označí znovu, protože rozhodnutí
nebylo uloženo k danému klientovi. Student mezitím dostává automatické zprávy
o „bezpečnostní kontrole“ bez vysvětlení. Po úpravě postupu se výsledek posouzení ukládá
a klient dostane srozumitelnou informaci, že šlo o shodu jména, která byla vyloučena.

## Meze a otevřené otázky

Sankční režimy jsou legitimním nástrojem mezinárodní politiky, ale jejich prosazování
přes soukromé instituce přenáší rozhodování o přístupu k základním službám na algoritmy
a analytiky s asymetrickou motivací. Otevřenou otázkou je, jak měřit a zveřejňovat
falešné shody a jejich dopad na různé skupiny, a jak zajistit, aby zrušení zápisu na seznamu
skutečně zmizelo i z odvozených databází.

## Literatura

- FATF. *The FATF Recommendations* (s pozdějšími aktualizacemi) a navazující dokumenty k de-riskingu.
- Parasuraman, R., Manzey, D. H. (2010). Complacency and bias in human use of automation: An attentional integration.
- Rozsudek Soudního dvora ze dne 3. 9. 2008, Kadi a Al Barakaat International Foundation v. Rada a Komise, C-402/05 P a C-415/05 P.
- Zákon č. 69/2006 Sb., o provádění mezinárodních sankcí.

## Související

**Mezioborové mosty**

- [AML a rozpoznávání vzorců](@/kompendium/cross-domain/28-ea-compliance-aml-pattern-recognition.md) – navazující povinnosti.
- [KYC a ověřování narativu klienta](@/kompendium/cross-domain/29-ea-compliance-kyc-narrative-validation.md) – identifikace.
- [Kalibrace rozhodovacího systému](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md) – automatizace a její zkreslení.
- [Prověrka v justice.cz a ISIR](@/kompendium/cross-domain/3-ea-osint-justice-cz-screening.md) – další úřední záznamy.

**Kontext platformy a pojmy**

- [Compliance Agent & EA detection](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md) – automatizovaný screening.
- [Sanctions screening](@/glossary/sanctions-screening.md) – heslo glosáře.
- [Delegitimizace](@/glossary/delegitimizace.md) – nálepka bez možnosti obrany.

**Mezinárodní a právní rámec**

- [EU právo – EA rámec](@/kompendium/international/21-EU-law-EA/index.md) – unijní kontext.
