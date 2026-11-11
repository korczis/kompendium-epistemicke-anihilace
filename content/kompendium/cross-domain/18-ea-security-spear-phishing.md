+++
title = "Bezpečnost: cílený phishing (spear phishing)"
description = "Proč cílené podvodné zprávy fungují i na vzdělané a opatrné lidi, jaké znaky je prozrazují, jaká technická a organizační opatření pomáhají a proč trestání obětí škodí."
weight = 180

[taxonomies]
tags = ["kompendium", "cross-domain", "security"]
categories = ["academic"]

[extra]
related_terms = ["17-ea-security-social-engineering", "22-ea-security-incident-response-narrative", "20-ea-security-insider-threat", "6-ea-osint-bot-detection"]
toc = true
+++

Phishing je podvodná zpráva, která má příjemce přimět k vydání přihlašovacích údajů, spuštění
škodlivého souboru nebo provedení platby. **Cílený phishing** (*spear phishing*) se od
hromadného liší tím, že je připraven pro konkrétního člověka nebo malou skupinu: využívá
jmen kolegů, aktuálních projektů, veřejně dostupných informací o organizaci. Je jednou
z nejčastějších vstupních cest do organizací a zároveň jedním z nejčistších případů
epistemického útoku – úspěch závisí jen na tom, zda příjemce uvěří obrazu, který zpráva
vytváří. Tato stránka popisuje rozpoznání a obranu, nikoli tvorbu takových zpráv.

## Doména a problém

Hong (2012) shrnul stav výzkumu phishingu a ukázal, že jde o problém technický i lidský:
technická opatření zachytí velkou část hromadných útoků, ale cílené zprávy, které napodobují
legitimní komunikaci, procházejí. Vishwanath a kolegové (2011) zjistili, že náchylnost
k phishingu souvisí s tím, jak lidé zpracovávají e-maily – kdo je zahlcen a jedná zvykově,
klikne snáze – a s tím, jak silně zpráva aktivuje naléhavost.

Lain, Kostiainen a Čapkun (2022) v rozsáhlé dlouhodobé studii ve velké organizaci ukázali,
že náchylnost k phishingu je rozšířená napříč zaměstnanci, že opakované vystavení zvyšuje
riziko, že někdo nakonec klikne, a že některé formy školení vložené do simulovaných útoků
nepřinesly očekávaný účinek a mohly být i kontraproduktivní. Zároveň doložili, že zaměstnanci
jako celek jsou užitečným detektorem: hlášení podezřelých zpráv kolegy umožňuje rychle
reagovat.

Technicky se cílený phishing opírá o napodobení identity – podobné domény, podvržené
zobrazované jméno, kompromitované účty skutečných partnerů. Standardy jako SPF, DKIM
a DMARC (RFC 7489) omezují podvržení domény odesílatele, ale nechrání před kompromitovaným
účtem nebo doménou, která je podobná.

## Průnik s epistemickou anihilací

Cílený phishing je zhuštěnou podobou toho, co kniha popisuje jako konstrukci falešného
kontextu. Útočník nepotřebuje měnit přesvědčení příjemce; stačí, když vytvoří situaci,
v níž se požadované jednání jeví jako běžné. Využívá k tomu [kontext](@/kompendium/techniques/ea-2-3-2-context-collapse.md),
který příjemce zná (projekt, kolega, dodavatel), [časový tlak](@/kompendium/detection-signatures/14-behavioral-time-pressure-creation.md)
a [emocionální modulaci](@/kompendium/detection-signatures/16-behavioral-emotional-modulation.md).
Informace pro přípravu útoku pocházejí často z otevřených zdrojů – profesních sítí, webu
organizace, médií –, což je odvrácená strana [OSINT](@/glossary/osint.md).

Druhým průnikem je dopad na oběť. Lidé, kteří na phishing naletí, často popisují pocit,
že „to přece museli poznat“, a ztrátu důvěry ve vlastní úsudek. Pokud je organizace
zostudí nebo potrestá, prohlubuje se tento stav a vzniká nedůvěra k vlastnímu vnímání,
která je v knize popsána jako [skok sebepochybnosti](@/kompendium/detection-signatures/26-phenomenological-self-doubt-spike.md).

Třetím průnikem je opakování. Organizace, která je terčem cílených kampaní dlouhodobě,
vystavuje zaměstnance stálému proudu zpráv, z nichž každá může být podvodem. Výsledkem
může být únava a rezignace („stejně to nepoznám“), nebo naopak přehnaná podezíravost
k legitimní komunikaci, která zdržuje práci. Obojí je obdobou toho, co kniha u jednotlivce
popisuje jako narušení kalibrace důvěry, a obojí se řeší spíš systémovým ověřováním než
vyšší individuální ostražitostí.

## Rozpoznávací znaky

Cílenou podvodnou zprávu prozrazují **nesoulad odesílatele** (adresa, doména, zobrazované
jméno se neshodují s obvyklými), **neobvyklý požadavek** v jinak věrohodném kontextu,
**naléhavost a hrozba** následků, **odkaz nebo příloha**, které vedou mimo obvyklé systémy,
**žádost o přihlášení** přes odkaz ve zprávě a **změna zavedeného postupu** („nový portál“,
„nové číslo účtu“). Zpráva může být jazykově bezchybná a obsahově přesná – absence chyb
dnes nic nedokazuje.

## Rámec: právo, standardy a odpovědnost

NIS2 (směrnice (EU) 2022/2555) vyžaduje u subjektů v rozsahu opatření řízení rizik včetně
kybernetické hygieny a školení a hlášení významných incidentů (čl. 23). GDPR vyžaduje
ohlášení porušení zabezpečení osobních údajů dozorovému úřadu (čl. 33) a v případě vysokého
rizika i dotčeným osobám (čl. 34). Pro organizaci je podstatné, že odpovědnost za ochranu
nenese jednotlivý zaměstnanec, ale systém opatření, za nějž odpovídá vedení.

## Ochranná opatření

Technická opatření zahrnují ověřování odesílatele (SPF, DKIM, DMARC), označování externích
zpráv, filtrování příloh a odkazů a především **vícefaktorové ověření odolné vůči phishingu**,
které snižuje hodnotu ukradeného hesla. Organizační opatření zahrnují **ověřování požadavků
na platby a změny údajů jiným kanálem**, **jednoduché tlačítko pro hlášení** podezřelé zprávy
a **rychlou zpětnou vazbu** tomu, kdo hlásil. Vzdělávací opatření mají učit **rozpoznávat
vzorce** (naléhavost, autorita, neobvyklý požadavek), nikoli jen hledat překlepy.

Kultura je stejně důležitá jako technika. Organizace, v níž se hlášení vlastní chyby
(„klikl jsem“) trestá, se o incidentech dozvídá pozdě. Organizace, v níž je hlášení
oceňováno, může útok zastavit v prvních minutách. Postupy popisuje
[Reakce na incident s EA fokusem](@/kompendium/organizational-defense/31-incident-response-EA.md)
a [Psychologická bezpečnost](@/kompendium/organizational-defense/16-psychological-safety.md).

## Lidský rozměr a zotavení

Zaměstnanec, který na phishing naletěl, potřebuje především rychlý a nekonfrontační postup:
co udělat hned (změnit heslo, nahlásit, odpojit zařízení) a ujištění, že nahlášení je
správné. Následný rozhovor by měl rozebrat, co zprávu dělalo věrohodnou, bez hledání viny.
Lidé, kteří opakovaně slyší, že jsou „nejslabší článek“, ztrácejí ochotu se zapojit;
lidé, kteří slyší, že jsou „nejlepší detektor“, hlásí víc. Kniha k tomu nabízí obecné
postupy [Sebesoucit](@/kompendium/self-defense-guides/16-self-compassion.md) a
[Odolnost vůči studu](@/kompendium/self-defense-guides/18-shame-resilience.md).

## Přesah do dalších oborů

Struktura cíleného phishingu se objevuje i mimo organizace: v podvodech na pacienty
(zprávy jménem zdravotní pojišťovny), na studenty (zprávy jménem univerzity o stipendiu),
na seniory (zprávy jménem banky) a na oběti, které už jednou podvodu podlehly a dostávají
nabídky „pomoci s vrácením peněz“. Ve všech případech platí poučení z výzkumu Laina a kolegů
(2022): náchylnost není vlastností hloupých lidí, ale důsledkem toho, jak lidé zvládají
množství komunikace. Ochrana proto musí stát na postupech a prostředí, nejen na individuální
ostražitosti.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Výzkumnice na univerzitě dostane e-mail od „grantové
agentury“ s odkazem na portál, kde má do konce dne potvrdit údaje k probíhajícímu projektu.
Název projektu i jméno referentky jsou správné – obojí je na webu univerzity. Výzkumnice
klikne a zadá přihlašovací údaje. Po chvíli si všimne, že adresa portálu se liší, a zprávu
nahlásí. Bezpečnostní tým zablokuje přístup, změní heslo a zjistí, že stejný e-mail dostalo
dalších šest lidí, z nichž dva už údaje zadali. Díky včasnému hlášení nedojde ke zneužití účtů.

Výzkumnice se na schůzce týmu stydí; vedoucí bezpečnosti zdůrazní, že její hlášení
během několika minut zabránilo větší škodě, a požádá ji o souhlas použít anonymizovaný
příklad ve školení.

## Meze a otevřené otázky

Jazykové modely odstraňují tradiční znaky podvodných zpráv (chyby, neobratný styl) a umožňují
hromadnou personalizaci. Otevřenou otázkou je, jak učit lidi rozpoznávat phishing, když
zprávy budou k nerozeznání od legitimních, a jak přesunout váhu obrany z úsudku jednotlivce
na systémové ověřování identity.

## Literatura

- Hong, J. (2012). The state of phishing attacks.
- Lain, D., Kostiainen, K., Čapkun, S. (2022). Phishing in organizations: Findings from a large-scale and long-term study.
- Vishwanath, A., Herath, T., Chen, R., Wang, J., Rao, H. R. (2011). Why do people get phished? Testing individual differences in phishing vulnerability within an integrated, information processing model.
- Kucherawy, M., Zwicky, E. (eds.) (2015). RFC 7489: Domain-based Message Authentication, Reporting, and Conformance (DMARC).

## Související

**Mezioborové mosty**

- [Sociální inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md) – širší rámec.
- [Narativ při reakci na incident](@/kompendium/cross-domain/22-ea-security-incident-response-narrative.md) – komunikace po incidentu.
- [Vnitřní hrozba](@/kompendium/cross-domain/20-ea-security-insider-threat.md) – kompromitované účty zevnitř.

**Signatury a pojmy**

- [Skok sebepochybnosti](@/kompendium/detection-signatures/26-phenomenological-self-doubt-spike.md) – dopad na oběť.
- [OSINT](@/glossary/osint.md) – zdroj informací pro cílení.

**Organizace a sebeobrana**

- [Reakce na incident s EA fokusem](@/kompendium/organizational-defense/31-incident-response-EA.md) – postup po incidentu.
- [Psychologická bezpečnost](@/kompendium/organizational-defense/16-psychological-safety.md) – kultura hlášení.
- [Sebesoucit](@/kompendium/self-defense-guides/16-self-compassion.md) – po vlastní chybě.
