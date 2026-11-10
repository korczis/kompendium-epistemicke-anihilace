+++
title = "Řízení přístupů s EA fokusem"
description = "Kdo má přístup, určuje, kdo co vidí a kdo může měnit záznamy. Kapitola popisuje nejmenší nutná oprávnění, recertifikaci, odebírání přístupů a zneužití přístupu k izolaci lidí."
weight = 280

[taxonomies]
tags = ["kompendium", "organizational-defense", "operational"]
categories = ["academic", "organizational", "governance"]

[extra]
related_terms = ["27-information-classification", "29-segregation-duties", "26-contractor-vetting", "24-documentation-standards"]
toc = true
+++

# Řízení přístupů s EA fokusem

> **Pilíř:** Provoz · **Oddíl:** [Organizační obrana](@/kompendium/organizational-defense/_index.md)

Řízení přístupů (access control) se obvykle chápe jako bezpečnostní disciplína: kdo se smí
přihlásit, kam a s jakými právy. Saltzer a Schroeder (1975) z něj v klasické formulaci udělali
soubor konstrukčních zásad informačních systémů, z nichž nejznámější je zásada nejmenších
nutných oprávnění (least privilege) a zásada odděleného oprávnění (separation of privilege).
Z hlediska Kompendia má téma ještě dva rozměry, které bezpečnostní literatura zmiňuje jen
okrajově. Kdo má přístup k informacím, ovládá, co ostatní mohou vědět; kdo má právo měnit
záznamy, ovládá, co bude platit za minulost. A odebrání přístupu je jedním z nejtišších
způsobů, jak člověka vyřadit z organizace, aniž by ho kdo formálně vyloučil. Kapitola proto
řeší přístupy jako otázku bezpečnosti i
[epistemické bezpečnosti](@/glossary/epistemic-security.md) organizace; toto propojení je
interpretací knihy, nikoli tezí citovaných bezpečnostních prací.

## Vymezení a vývoj pojmu

Saltzer a Schroeder (1975) formulovali osm zásad ochrany informací, mezi nimi úplné
zprostředkování (každý přístup se ověřuje), bezpečné výchozí nastavení (co není výslovně
povoleno, je zakázáno) a psychologickou přijatelnost (ochrana nesmí být tak obtížná, aby ji
uživatelé obcházeli). Poslední zásada je pro Kompendium podstatná: přístupová politika, kterou
lidé vnímají jako šikanu nebo překážku, vede ke sdílení účtů, a tím k přesnému opaku toho, co
měla zajistit. Další krok představovalo řízení přístupu podle rolí (role-based access control),
které Sandhu a kol. (1996) rozpracovali do rodiny modelů s hierarchií rolí a s omezeními, mezi
něž patří i neslučitelnost rolí; tím se řízení přístupů propojuje s
[oddělením povinností](@/kompendium/organizational-defense/29-segregation-duties.md).

Současné katalogy opatření převádějí tyto zásady do auditovatelné podoby. Katalog NIST (2020)
obsahuje samostatnou rodinu opatření pro řízení přístupu, včetně správy účtů, nejmenších
oprávnění, oddělení povinností a dočasných a nouzových účtů, a samostatnou rodinu pro záznamy a
jejich ochranu před úpravou. Norma ISO/IEC (2022) pro systémy řízení bezpečnosti informací
předpokládá, že přístupová práva se přidělují, přezkoumávají a odebírají podle stanovených
pravidel. Model nulové důvěry (zero trust), jak ho popisují Rose a kol. (2020), opouští
představu bezpečného vnitřního perimetru a ověřuje každý požadavek zvlášť; pro epistemickou
obranu z toho kniha vyvozuje, že ani vnitřní postavení člověka nemá automaticky znamenat
neomezený přístup k informacím o druhých.

## Riziko v daném prostředí

Typickým jevem je postupné hromadění oprávnění (privilege creep): lidé léta získávají práva a
nikdo jim je neodebírá, až vzniknou správci, které nikdo nekontroluje. Cappelli a kol. (2012)
na případech vnitřních hrozeb ukazují, že k sabotáži a krádeži dat se opakovaně využívaly
přístupy, které měly být dávno zrušeny, a oprávnění, o nichž organizace nevěděla. V nemocnici
jde o přístup do zdravotnické dokumentace, kterou zákon č. 372/2011 Sb., o zdravotních
službách, zpřístupňuje jen vymezenému okruhu osob; nahlížení bez důvodu, například do záznamů
známé osoby nebo kolegy, je vážným porušením. Ve škole jde o to, kdo může měnit známky a
záznamy o chování v elektronické evidenci, na univerzitě o přístup k výzkumným datům a k
hodnocení.

Ve veřejné správě je rizikem přístup do registrů a jeho zneužití k soukromým účelům, v médiích
to, kdo může tiše upravit již publikovaný článek, a ve firmě přístup bývalých zaměstnanců a
externistů, který nikdo neukončil (Cappelli a kol., 2012). Ve všech prostředích se navíc
objevuje vzorec, který bezpečnostní katalogy neřeší: přístup jako nástroj moci. Člověku se
„zapomene“ přidělit přístup k informacím, které potřebuje, nebo se mu odebere po konfliktu, a
tím se vytlačí na okraj. Kniha tento vzorec popisuje jako
[institucionální vyloučení](@/kompendium/techniques/ea-2-1-7-institucionalni-vyloucenni.md);
ve světle pojmu, který zavedla Fricker (2007), jde o interpretaci, podle níž odepření přístupu k informacím brání
člověku porozumět vlastní situaci, a blíží se tak
[hermeneutické marginalizaci](@/glossary/hermeneuticka-marginalizace.md).

## Strukturální zranitelnosti a detekční znaky

Prvním znakem je asymetrie: přístupy se přidělují snadno a odebírají zřídka. Bývalí
zaměstnanci a externisté mají stále vzdálený přístup, správcovské účty jsou sdílené, bez
rotace hesel a bez vícefaktorového ověření, a nezaznamenává se, kdo co viděl a změnil, nebo se
záznamy nikdo nečte. Katalog NIST (2020) proto zdůrazňuje nejen vznik záznamů, ale i jejich
ochranu a pravidelný přezkum; záznam, který nikdo nečte, chrání jen formálně. Nejzávažnější je
situace, kdy jedna osoba může měnit data i záznamy o jejich změnách, protože pak lze přepsat
nejen fakta, ale i stopy po jejich přepsání.

Druhým znakem je přístup používaný selektivně vůči lidem. Pozorovatel ho pozná podle toho, že
omezení postihuje konkrétní osobu po stížnosti nebo nesouhlasu, není nikde zaznamenáno a
odůvodněno a dotčený se o něm dozví až ve chvíli, kdy mu chybí informace pro práci. Takový
vzorec je třeba odlišit od legitimních změn, například od přeřazení na jinou agendu nebo od
omezení během vyšetřování, které je zaznamenané, časově omezené a dotčenému vysvětlené. Rozdíl
neleží v samotném odebrání přístupu, ale v jeho průhlednosti a přezkoumatelnosti, což odpovídá
obecné zásadě procesní spravedlnosti (Lind a Tyler, 1988).

## Ochranné struktury

Základem je zásada nejmenších nutných oprávnění a přístup podle role (Saltzer a Schroeder,
1975; Sandhu a kol., 1996). Na ni navazuje pravidelná recertifikace, při níž vlastníci dat a
vedoucí v pevném intervalu potvrzují, že přístupy jsou stále potřebné, a automatické odebírání
nepoužívaných oprávnění po stanovené době spolu s okamžitým odebráním při odchodu (ISO/IEC,
2022). Recertifikace má smysl jen tehdy, když vedoucí skutečně posuzuje jednotlivé přístupy;
hromadné potvrzení celého seznamu je ritualizovaná kontrola, kterou Power (1997) popisuje jako
ověřování, které vytváří pocit jistoty, aniž by cokoli ověřilo.

U kritických systémů patří k ochranným strukturám vícefaktorové ověření, osobní správcovské
účty místo sdílených a přístup na dobu nezbytně nutnou (NIST, 2020). Záznamy o přístupech a
změnách mají být neměnné a spravované někým jiným než tím, koho zaznamenávají, což navazuje na
oddělení povinností a na
[dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md).
Pro epistemický rozměr je klíčové pravidlo, že omezení přístupu zaměstnance k informacím
potřebným pro práci musí být odůvodněné, zaznamenané a dotčenému sdělené; jen tak lze
institucionální vyloučení odlišit od běžné správy oprávnění (Lind a Tyler, 1988).

## Role, odpovědnosti a právní rámec

Vlastník dat rozhoduje, kdo k nim smí, IT přístupy technicky spravuje, ale o nich
nerozhoduje, personální útvar hlásí nástupy, změny a odchody a bezpečnostní manažer nebo
interní audit kontroluje recertifikaci a záznamy. Toto rozdělení odpovídá modelu tří linií,
jak ho formuloval IIA (2020): provozní vedení nese riziko, druhá linie stanoví pravidla a
dohlíží na ně a interní audit poskytuje nezávislé ujištění. Vedoucí odpovídají za to, že jejich
lidé mají přístupy, které potřebují – ne víc a ne méně.

Právní rámec tvoří především ochrana osobních údajů. Nařízení (EU) 2016/679 (GDPR) ukládá
správci zajistit důvěrnost a integritu zpracování a porušení zabezpečení ohlásit dozorovému
úřadu a v závažných případech i dotčeným osobám; český zákon č. 110/2019 Sb., o zpracování
osobních údajů, na nařízení navazuje. V oblasti kybernetické bezpečnosti stanoví požadavky na
řízení přístupů pro regulované subjekty směrnice (EU) 2022/2555 (NIS2) a české předpisy, které
ji provádějí; konkrétní povinnosti je třeba posoudit podle postavení organizace (srov.
[NIS2 a integrita informací](@/kompendium/cross-domain/25-ea-compliance-nis2-integrity.md)).
Zaměstnanec, kterému byl přístup odebrán po oznámení protiprávního jednání, může být obětí
odvetného opatření ve smyslu zákona č. 171/2023 Sb., o ochraně oznamovatelů.

## Vzdělávání a trénink

Uživatelé se učí, proč nesdílet hesla a účty a proč hlásit oprávnění, která nepotřebují;
psychologická přijatelnost pravidel přitom rozhoduje o tom, zda je budou dodržovat (Saltzer a
Schroeder, 1975). Vedoucí se učí recertifikovat skutečně, a ne hromadným potvrzením. Správci
systémů se učí rozpoznat a odmítnout tlak na mimořádné přístupy („ředitel to potřebuje hned“),
což je vzorec
[sociálního inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md)
spojený s autoritou a časovým tlakem; Cialdini (2001) popisuje autoritu a nedostatek, včetně
časově omezené příležitosti, jako obecné principy ovlivňování, které oslabují pečlivé posouzení
žádosti. Cílem tréninku je rozpoznání a správná eskalace, nikoli nácvik ovlivňování.

## Řešení incidentu

Při podezření na zneužití přístupu, tedy na nahlížení bez důvodu, změnu záznamů nebo únik, je
prvním krokem zajistit záznamy o přístupech a změnách dřív, než mohou být přepsány, a teprve
potom omezit přístupy dotčeného účtu. Následuje zjištění rozsahu (jaká data, jaké změny, kdo je
dotčen), obnova původního stavu dat z neměnných záloh s doložením rozdílu a informování
dotčených osob, případně dozorového úřadu podle pravidel GDPR, která v Česku doplňuje zákon
č. 110/2019 Sb. Postup odpovídá obecnému cyklu reakce na incident – příprava, detekce a
analýza, omezení a obnova, vyhodnocení – jak ho popisují Cichonski a kol. (2012); záznamy o
přístupech jsou zároveň
[elektronickým důkazem](@/kompendium/forensic-legal/35-electronic-evidence-EA.md), u něhož
záleží na zachování [řetězce úschovy](@/glossary/chain-of-custody.md).

Při podezření, že přístup byl odebrán jako forma vyloučení, se postupuje jinak. Ověří se, kdo
a proč přístup omezil a zda to bylo zaznamenáno a odůvodněno; pokud důvod chyběl, přístup se
obnoví a posoudí se, zda nejde o odvetu za oznámení, která by spadala pod zákon č. 171/2023 Sb.
Šetření nevede osoba, která o omezení rozhodla, ale někdo nezávislý, jak to popisuje kapitola o
[interním vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md).

### Anonymizovaný příklad

V redakci se ukázalo, že u několika publikovaných článků byly bez poznámky změněny pasáže,
které se nelíbily inzerentovi. Systém umožňoval úpravy bez záznamu verzí. Po zavedení
povinného záznamu úprav a veřejné poznámky o opravě se tichá změna publikovaného textu stala
dohledatelnou. Příklad je kompozitem; ilustruje zásadu, kterou Kovach a Rosenstiel (2001)
považují za jádro novinářské práce, totiž disciplínu ověřování, jejíž součástí je i přiznaná a
dohledatelná oprava.

## Ochrana dotčené osoby

Osoba, jejíž údaje byly neoprávněně zobrazeny nebo změněny (pacient, žák, zaměstnanec), má
právo to vědět a domáhat se nápravy; nařízení GDPR jí přiznává právo na přístup k vlastním
údajům a na jejich opravu a zákon č. 110/2019 Sb. upravuje dozor nad jeho dodržováním. Pro
člověka, kterému se náhle „ztratí“ přístupy a informace, je situace dezorientující a může vést
k pochybnostem o vlastním úsudku i k [sociální izolaci](@/glossary/socialni-izolace.md) v
kolektivu. Potřebuje rychlé vysvětlení, nápravu a, jde-li o odvetu, ochranu podle zákona
č. 171/2023 Sb.

## Vyhodnocení a indikátory selhání

O selhání svědčí bývalí zaměstnanci se stále aktivním vzdáleným přístupem, správcovské účty
bez rotace a bez vícefaktorového ověření na kritických systémech, recertifikace jako hromadné
potvrzení bez kontroly, záznamy o přístupech, které nikdo nečte nebo které lze upravit, a
přístupy odebírané bez záznamu a důvodu (NIST, 2020). Užitečnými metrikami jsou podíl přístupů
recertifikovaných v termínu, doba od odchodu do odebrání přístupů a počet správcovských účtů;
metriky však mají jen orientační hodnotu, protože splněný ukazatel nemusí znamenat skutečnou
kontrolu (Power, 1997).

## Meze, kritika a otevřené otázky

Přísné řízení přístupů může zpomalit práci a vést k obcházení, například ke sdílení účtů, což
je praktický důsledek porušení psychologické přijatelnosti (Saltzer a Schroeder, 1975). Ve
zdravotnictví je třeba mít možnost mimořádného přístupu „rozbitím skla“ (break-glass), který se
dodatečně zdůvodní a přezkoumá; katalog NIST (2020) s nouzovými účty počítá. Rozsáhlé
zaznamenávání činnosti zaměstnanců má také odvrácenou stranu: může se změnit v plošný dohled,
jehož disciplinační účinek popsal Foucault (1975) jako [panoptismus](@/glossary/panopticism.md).
Otevřené zůstává, jak řídit přístupy v cloudových nástrojích, kde si uživatelé sdílejí
dokumenty sami a organizace ztrácí přehled, a jak zajistit, aby záznamy sloužily ochraně lidí,
a ne jejich kontrole.

## Literatura

- Cappelli, D. M., Moore, A. P., & Trzeciak, R. F. (2012). *The CERT Guide to Insider Threats*.
  Addison-Wesley.
- Cialdini, R. B. (2001). *Influence: Science and Practice* (4. vyd.). Allyn & Bacon.
- Cichonski, P., Millar, T., Grance, T., & Scarfone, K. (2012). *Computer Security Incident
  Handling Guide* (NIST SP 800-61 Rev. 2). National Institute of Standards and Technology.
- Foucault, M. (1975). *Surveiller et punir: Naissance de la prison*. Gallimard.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University
  Press.
- IIA (2020). *The IIA's Three Lines Model: An Update of the Three Lines of Defense*. The
  Institute of Internal Auditors.
- ISO/IEC (2022). *ISO/IEC 27001:2022 Information security, cybersecurity and privacy
  protection – Information security management systems – Requirements*. ISO.
- Kovach, B., & Rosenstiel, T. (2001). *The Elements of Journalism*. Crown.
- Lind, E. A., & Tyler, T. R. (1988). *The Social Psychology of Procedural Justice*. Plenum.
- NIST (2020). *Security and Privacy Controls for Information Systems and Organizations* (SP
  800-53 Rev. 5). National Institute of Standards and Technology.
- Power, M. (1997). *The Audit Society: Rituals of Verification*. Oxford University Press.
- Rose, S., Borchert, O., Mitchell, S., & Connelly, S. (2020). *Zero Trust Architecture* (NIST SP
  800-207). National Institute of Standards and Technology.
- Saltzer, J. H., & Schroeder, M. D. (1975). The protection of information in computer systems.
  *Proceedings of the IEEE*, 63(9).
- Sandhu, R. S., Coyne, E. J., Feinstein, H. L., & Youman, C. E. (1996). Role-based access control
  models. *IEEE Computer*, 29(2).

## Související

**Sesterské kapitoly**

- [Klasifikace informací](@/kompendium/organizational-defense/27-information-classification.md)
  – co je citlivé.
- [Oddělení povinností](@/kompendium/organizational-defense/29-segregation-duties.md) – kdo
  smí měnit data a kdo záznamy.
- [Prověřování kontraktorů](@/kompendium/organizational-defense/26-contractor-vetting.md) –
  přístupy externích osob.
- [Dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md)
  – verze a ochrana proti přepisu.

**Analýza a bezpečnost**

- [EA × Security: Insider Threat](@/kompendium/cross-domain/20-ea-security-insider-threat.md)
  – zneužití legitimního přístupu.
- [EA × Compliance: NIS2 – Information Integrity Pillar](@/kompendium/cross-domain/25-ea-compliance-nis2-integrity.md)
  – integrita informací jako požadavek.
- [Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) – záznamy
  o přístupech jako důkaz.

**Techniky a pojmy**

- [EA-2.1.7 Institucionální vyloučení](@/kompendium/techniques/ea-2-1-7-institucionalni-vyloucenni.md)
  – odebrání přístupu jako vyloučení.
- [Hermeneutická marginalizace](@/glossary/hermeneuticka-marginalizace.md) – odepření
  informací, bez nichž nelze porozumět vlastní situaci.
- [Panoptismus](@/glossary/panopticism.md) – kdy se záznam mění v dohled.
