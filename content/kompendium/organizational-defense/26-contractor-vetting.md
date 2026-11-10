+++
title = "Prověřování kontraktorů"
description = "Externí spolupracovníci mívají přístup jako zaměstnanci, ale slabší prověrku i dohled. Kapitola popisuje přiměřené prověření, stupňovaný přístup, časově omezená oprávnění a ukončení spolupráce."
weight = 260

[taxonomies]
tags = ["kompendium", "organizational-defense", "operational"]
categories = ["academic", "organizational", "governance"]

[extra]
related_terms = ["25-vendor-management-EA", "28-access-control-EA", "27-information-classification", "3-conflict-of-interest-policy"]
toc = true
+++

# Prověřování kontraktorů

> **Pilíř:** Provoz · **Oddíl:** [Organizační obrana](@/kompendium/organizational-defense/_index.md)

Externí spolupracovníci, tedy OSVČ, agenturní pracovníci, konzultanti, lektoři, externí
vyšetřovatelé a dobrovolníci, dnes tvoří významnou část lidí, kteří mají přístup k systémům, datům
a lidem organizace. Často však procházejí slabší prověrkou než zaměstnanci, mají méně jasná
pravidla a po skončení spolupráce si ponechají přístupy. Externí osoba tak může být nástrojem
vlivu, zdrojem úniku informací nebo „prostředníkem“, přes kterého někdo uvnitř obchází pravidla,
která by na něj jinak dopadla. Sociologie práce popisuje růst nestandardních pracovních vztahů
jako dlouhodobý trend (Kalleberg, 2000); kapitola popisuje, jak s ním sladit ochranu organizace i
lidí, s nimiž externí osoby pracují.

## Pojem a výzkumná východiska

Kalleberg (2000) shrnul výzkum nestandardních pracovních vztahů, k nimž patří práce na dobu
určitou, agenturní zaměstnávání a smluvní práce, a ukázal, že se v nich oslabuje vazba mezi
pracovníkem a organizací, pro niž práci fakticky vykonává. Weil (2014) popsal „rozštěpené
pracoviště“ (fissured workplace), v němž velké organizace přesouvají práci na řetězce
subdodavatelů, takže odpovědnost za podmínky práce i za chování pracovníků se rozptyluje.

Bezpečnostní výzkum k tomu přidává pohled vnitřní hrozby. Cappelli, Moore a Trzeciak (2012) na
základě rozboru případů shromážděných v programu CERT ukázali, že mezi pachateli incidentů jsou i
důvěryhodní obchodní partneři a smluvní pracovníci a že k řadě incidentů přispěly přístupy
neodebrané po skončení spolupráce. Že externí osoba je zvlášť vhodným „prostředníkem“ pro
obcházení pravidel, je interpretací Kompendia, kterou rozptýlení odpovědnosti popsané Weilem
podporuje.

## Riziko v daném prostředí

Ve firmě mají externí vývojáři a správci systémů nezřídka nejvyšší oprávnění. Na univerzitě a ve
výzkumu se externí spolupracovníci a hostující výzkumníci dostávají k datům bez formální smlouvy.
V nemocnici jde o agenturní personál a servisní techniky, ve veřejné správě o externí poradce s
přístupem k rozpracovaným rozhodnutím a v médiích o externí spolupracovníky s přístupem ke
zdrojům. Obecný rámec dává [insider threat](@/kompendium/cross-domain/20-ea-security-insider-threat.md),
jak ho rozebírají Cappelli, Moore a Trzeciak (2012).

Ve škole a v organizacích pracujících s dětmi, jako jsou kroužky, tábory a sportovní kluby, jsou
externí lektoři a dobrovolníci v přímém kontaktu s dětmi. Zákon č. 563/2004 Sb., o pedagogických
pracovnících, vyžaduje bezúhonnost u pedagogů, ale u externích osob mimo tento režim taková
kontrola často chybí. Royal Commission into Institutional Responses to Child Sexual Abuse (2017)
v závěrečné zprávě zařadila mezi standardy bezpečné organizace pro děti i výběr, prověrku a
dohled nad všemi, kdo s dětmi pracují, včetně dobrovolníků.

## Strukturální zranitelnosti

První zranitelností je chybějící prověrka i identifikace skutečného zaměstnavatele či majitele
dodavatelské firmy. V řetězci subdodavatelů organizace často neví, kdo pro ni konkrétně pracuje,
což je přímý důsledek rozštěpení, které popsal Weil (2014).

Druhou zranitelností jsou široká oprávnění udělená externím osobám „pro jistotu“. Saltzer a
Schroeder (1975) formulovali princip nejmenších oprávnění, podle něhož má každý uživatel a každý
program pracovat jen s oprávněními, která pro svou úlohu nezbytně potřebuje; široká oprávnění
tento princip porušují a zvětšují škodu, kterou může způsobit chyba i úmysl.

Třetí zranitelností je chybějící ukončovací postup, takže přístupy zůstávají po skončení
spolupráce, a čtvrtou, že kontraktoři nepodléhají kodexu, školení ani oznamovacím mechanismům
organizace. Cappelli, Moore a Trzeciak (2012) uvádějí neodebrané přístupy mezi opakujícími se
faktory incidentů.

Pátou zranitelností je vnitřní aktér, který si najímá „svého“ externistu, aby obešel pravidla
náboru nebo střetu zájmů. Externí smlouva tu slouží jako kanál, jímž se do organizace dostává
vliv mimo standardní kontrolu; z hlediska teorie zastoupení jde o situaci, kdy zmocněnec
(objednatel) jedná ve vlastním zájmu a organizace nemá prostředky to zjistit; obdobné rozptýlení
kontroly v řetězcích subdodavatelů popisuje Weil (2014).

## Ochranné struktury

Prověrka je přiměřená riziku role: ověřuje identitu a firmu, skutečného majitele podle zákona č.
37/2021 Sb., o evidenci skutečných majitelů, střet zájmů, u vybraných rolí sankční seznamy
([sanctions screening](@/glossary/sanctions-screening.md)) a reference. U práce s dětmi nebo
zranitelnými osobami se ověřuje bezúhonnost tam, kde to právní rámec připouští, například výpisem
z evidence Rejstříku trestů podle zákona č. 269/1994 Sb., o Rejstříku trestů. Přiměřenost je
zásadní, protože prověrka nad rámec rizika je sama zásahem do soukromí.

Model přístupu je stupňovaný: minimum nutných oprávnění, časově omezené účty a schvalování
vlastníkem dat, jak popisuje [řízení přístupů](@/kompendium/organizational-defense/28-access-control-EA.md)
a jak vyžaduje princip nejmenších oprávnění (Saltzer a Schroeder, 1975). Katalog bezpečnostních
opatření, který vydává National Institute of Standards and Technology (2020), zahrnuje i
samostatná opatření pro bezpečnost externího personálu a pro ukončení spolupráce.

Smlouva obsahuje mlčenlivost, pravidla zacházení s daty a povinnost dodržovat kodex chování.
Ukončovací postup zajišťuje okamžité odebrání přístupů a vrácení zařízení a dat. Kontraktoři jsou
zahrnuti do školení a do [vnitřního oznamovacího systému](@/kompendium/organizational-defense/4-whistleblower-mechanism.md);
zákon č. 171/2023 Sb., o ochraně oznamovatelů, chrání i osoby vykonávající práci pro organizaci na
jiném základě než pracovní smlouvou, například samostatně výdělečně činné osoby nebo dobrovolníky.

## Role a odpovědnosti

Objednatel, tedy věcný útvar, odpovídá za odůvodnění potřeby a za dohled nad prací. Nákupní nebo
personální útvar provádí prověrku, IT a vlastníci dat přidělují a odebírají přístupy a compliance
posuzuje střet zájmů a vazby. Vedoucí útvaru odpovídá za to, že kontraktor je veden v evidenci a
že se jeho přístupy pravidelně přezkoumávají. Rozdělení rolí brání tomu, aby objednatel sám
vybral, prověřil i oprávnil „svého“ člověka, což je situace, kterou Cappelli, Moore a Trzeciak
(2012) řadí k rizikovým.

## Politiky a postupy

Organizace vede evidenci všech externích osob s přístupem k systémům, datům nebo lidem a matici
prověrky podle rizika role. Pravidla pro přidělování oprávnění stanoví výchozí lhůtu platnosti a
přístupy externích osob se přezkoumávají čtvrtletně. Výchozí expirace oprávnění převádí princip
nejmenších oprávnění do časové dimenze: oprávnění, které nikdo neprodloužil, zaniká (Saltzer a
Schroeder, 1975).

Ukončovací kontrolní seznam vyžaduje potvrzení vlastníků dat. Najímání externích osob se vztahem k
rozhodovateli bez schválení je zakázáno, což navazuje na
[politiku střetu zájmů](@/kompendium/organizational-defense/3-conflict-of-interest-policy.md). U
organizací pracujících s dětmi platí pravidla komunikace a dohledu pro všechny, kdo s dětmi
pracují, bez ohledu na formu smlouvy (Royal Commission into Institutional Responses to Child
Sexual Abuse, 2017).

## Vzdělávání a trénink

Objednatelé se učí, že externí osoba je součástí bezpečnostního a kulturního prostředí
organizace. Kontraktoři dostávají zkrácené úvodní školení: kodex, zacházení s daty a kanály pro
hlášení. Oslabená vazba mezi nestandardním pracovníkem a organizací, kterou popisuje Kalleberg
(2000), se projevuje i tím, že kontraktoři často nejsou zahrnuti do pravidel a kultury
organizace; školení je jedním z nástrojů, jak tuto mezeru zmenšit.

Zaměstnanci, kteří s externími osobami pracují, se učí rozpoznat
[sociální inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md), například
když externista tlačí na rozšíření oprávnění pod časovým tlakem nebo s odkazem na vysoko
postaveného objednatele. Mitnick a Simon (2002) popsali, jak se předstíraná autorita a naléhavost
opakují v incidentech sociálního inženýrství; cílem tréninku je rozpoznání těchto znaků, nikoli
jejich nácvik.

## Řešení incidentu

Při podezření na zneužití přístupu nebo vlivu se okamžitě omezí přístupy kontraktora a zajistí se
záznamy o přístupech a činnosti podle zásad pro
[elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md). Zjistí se, kdo
kontraktora najal a schvaloval jeho oprávnění, posoudí se smluvní a případně trestněprávní kroky a
přezkoumají se ostatní externí přístupy se stejným vzorcem. Rozbor má vést i ke změně
procesu, nikoli jen k postihu jednotlivce, protože vzorce, které popisují Cappelli, Moore a
Trzeciak (2012), se opakují napříč případy.

Anonymizovaný kompozitní příklad: ve sportovním klubu vedl externí trenér mládeže tréninky dva
roky bez jakékoli smlouvy a prověrky, protože ho „doporučil“ člen výboru. Rodiče si stěžovali na
jeho soukromou komunikaci s dětmi, ale klub neměl pravidla ani kanál, kam stížnosti směřovat. Po
incidentu zavedl evidenci všech osob pracujících s dětmi, pravidla komunikace a ověřování. Příklad
odpovídá doporučení, aby standardy bezpečnosti dětí platily pro každého, kdo s nimi pracuje (Royal
Commission into Institutional Responses to Child Sexual Abuse, 2017).

## Ochrana dotčené osoby

Pokud kontraktor poškodil zaměstnance, klienty nebo děti, mají dotčení stejné právo na ochranu a
podporu, jako kdyby šlo o zaměstnance; u dětí se postupuje podle zásad
[ochrany dětí](@/kompendium/forensic-legal/47-child-protection-EA.md). Smith a Freyd (2014)
popisují institucionální zradu jako újmu, kterou instituce působí, když nechrání ty, kdo na ni
spoléhají; Kompendium k ní řadí i distancování se od odpovědnosti poukazem na formu smlouvy.

Zároveň kontraktor sám může být obětí manipulace uvnitř organizace a je v ještě slabší pozici než
zaměstnanec, protože jeho spolupráci lze ukončit bez důvodu. Organizace musí zajistit, aby ukončení
spolupráce nebylo odvetou za oznámení; zákon č. 171/2023 Sb. zakazuje odvetná opatření i vůči
osobám, které pro organizaci pracují na jiném základě než pracovní smlouvou.

## Vyhodnocení a indikátory selhání

Indikátory selhání jsou chybějící prověrka, kontraktoři s nejvyššími oprávněními, chybějící
ukončovací postup a trvalé vzdálené přístupy. Dalšími signály jsou stav, kdy nikdo neví, kolik
externích osob má přístup, vazby externích osob na rozhodovatele a kontraktoři, kteří nevědí, kam
hlásit problémy. První dva signály patří k nejčastějším faktorům, které rozbory incidentů
vnitřních hrozeb opakovaně nacházejí (Cappelli, Moore a Trzeciak, 2012).

Funkční systém se naopak pozná podle toho, že evidence externích osob souhlasí se skutečnými
přístupy v systémech, že oprávnění po skončení spolupráce zanikají automaticky a že kontraktoři
znají kanály pro hlášení. Shoda evidence a skutečnosti je praktickým testem principu nejmenších
oprávnění (Saltzer a Schroeder, 1975).

## Meze a otevřené otázky

Prověrka musí být přiměřená; nadměrné zjišťování osobních údajů je v rozporu s nařízením (EU)
2016/679 (GDPR) a se zákonem č. 262/2006 Sb., zákoníkem práce, a samo může být zásahem do soukromí.
Prověrka navíc zachycuje minulost, nikoli úmysl, a vytváří falešný pocit bezpečí, pokud ji
nedoplňuje průběžný dohled a kultura, v níž lze hlásit problémy (Cappelli, Moore a Trzeciak, 2012).

Malé organizace nemají kapacitu na složité prověrky. Otevřené zůstává, jak řešit dlouhé řetězce
subdodavatelů, kde organizace neví, kdo konkrétně pro ni pracuje; Weil (2014) ukazuje, že
rozštěpení odpovědnosti je strukturální rys současné ekonomiky, který jedna organizace sama
nezvrátí.

## Literatura

- Cappelli, D. M., Moore, A. P., & Trzeciak, R. F. (2012). *The CERT Guide to Insider Threats: How to Prevent, Detect, and Respond to Information Technology Crimes*. Addison-Wesley.
- Kalleberg, A. L. (2000). Nonstandard employment relations: Part-time, temporary and contract work. *Annual Review of Sociology*.
- Mitnick, K. D., & Simon, W. L. (2002). *The Art of Deception: Controlling the Human Element of Security*. Wiley.
- National Institute of Standards and Technology (2020). *Security and Privacy Controls for Information Systems and Organizations* (NIST SP 800-53 Rev. 5). U.S. Department of Commerce.
- Royal Commission into Institutional Responses to Child Sexual Abuse (2017). *Final Report*. Commonwealth of Australia.
- Saltzer, J. H., & Schroeder, M. D. (1975). The protection of information in computer systems. *Proceedings of the IEEE*.
- Smith, C. P., & Freyd, J. J. (2014). Institutional betrayal. *American Psychologist*.
- Weil, D. (2014). *The Fissured Workplace: Why Work Became So Bad for So Many and What Can Be Done to Improve It*. Harvard University Press.

## Související

**Sesterské kapitoly**

- [Řízení dodavatelů s EA fokusem](@/kompendium/organizational-defense/25-vendor-management-EA.md)
  – vztah s firmou, která kontraktora dodává.
- [Řízení přístupů s EA fokusem](@/kompendium/organizational-defense/28-access-control-EA.md)
  – oprávnění a jejich odebírání.
- [Klasifikace informací](@/kompendium/organizational-defense/27-information-classification.md)
  – co externí osoba smí vidět.

**Analýza**

- [EA × Security: Insider Threat](@/kompendium/cross-domain/20-ea-security-insider-threat.md)
  – vnitřní hrozba včetně externích osob.
- [EA × OSINT: Sankční seznamy a atribuční bias](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md)
  – meze sankčních prověrek.
- [EA × Compliance: KYC – Narrative Validation Layer](@/kompendium/cross-domain/29-ea-compliance-kyc-narrative-validation.md)
  – ověřování příběhu protistrany.

**Pojmy a ochrana**

- [Sanctions screening](@/glossary/sanctions-screening.md) – prověrka proti seznamům.
- [Ochrana dětí](@/kompendium/forensic-legal/47-child-protection-EA.md) – právní rámec u
  práce s dětmi.
