+++
title = "Klasifikace informací"
description = "Bez klasifikace nelze chránit citlivé informace, nadměrné utajení však skrývá problémy před kontrolou. Kapitola popisuje úrovně, přístupy, selektivní úniky a transparentnost."
weight = 270

[taxonomies]
tags = ["kompendium", "organizational-defense", "operational"]
categories = ["academic", "organizational", "governance"]

[extra]
related_terms = ["28-access-control-EA", "23-communication-policy", "24-documentation-standards", "26-contractor-vetting"]
toc = true
+++

# Klasifikace informací

> **Pilíř:** Provoz · **Oddíl:** [Organizační obrana](@/kompendium/organizational-defense/_index.md)

Klasifikace informací určuje, jak citlivá je která informace a kdo s ní smí zacházet. Bez ní je
všechno „interní“ a citlivé dokumenty leží na sdílených discích bez omezení. Klasifikace má ale i
druhou, méně zřejmou epistemickou stránku: informace lze ukrýt také tím, že se označí za důvěrné.
Nadměrné utajení chrání problémy před kontrolními orgány, zaměstnanci i veřejností; Bok (1982)
připomíná, že tajemství chrání oprávněné zájmy, ale zároveň dává tomu, kdo ho drží, moc nad těmi,
kdo nevědí. Kapitola proto popisuje klasifikaci jako nástroj ochrany i jako místo, kde je třeba
hlídat zneužití.

## Pojem a výzkumná východiska

Moderní klasifikační systémy vznikly ve státní správě. Federální standard USA kategorizuje
informace a systémy podle dopadu, který by mělo narušení jejich důvěrnosti, integrity a
dostupnosti, na úrovních nízký, střední a vysoký (National Institute of Standards and
Technology, 2004). Tento přístup se přenesl do firemní praxe, kde se informace třídí podle
škody, kterou by způsobil jejich únik, a nikoli podle toho, kdo je vytvořil.

Zároveň se ukázala odvrácená strana. Moynihan (1998) popsal utajování jako regulaci, která má
vlastní byrokratickou dynamiku a sklon k nadměrnému rozšiřování, a Galison (2004) upozornil, že
objem utajovaných dokumentů v USA soupeří s objemem otevřeně publikovaného poznání. Exekutivní
příkaz, který v USA upravuje utajování, proto výslovně zakazuje utajovat informace za účelem
zakrytí porušení zákona, neefektivity nebo administrativní chyby či kvůli zabránění ztrapnění
(Executive Order 13526, 2009). Přenesení tohoto zákazu do organizační klasifikace je návrhem
Kompendia.

## Riziko v daném prostředí

V nemocnici jsou údaje o zdravotním stavu zvláštní kategorií osobních údajů podle nařízení (EU)
2016/679 (GDPR) a jejich únik může pacienta vážně poškodit; zároveň nesmí utajení bránit
vyšetření nežádoucích událostí. Ve škole jde o údaje o žácích, výchovných opatřeních a
poradenství, ve výzkumu o neveřejná data, rukopisy a posudky a ve firmě o obchodní tajemství,
které vymezuje zákon č. 89/2012 Sb., občanský zákoník, o personální data a o informace o
vyšetřováních. V médiích jde o ochranu zdrojů, bez níž nemůže investigativní žurnalistika
existovat; Evropský soud pro lidská práva (1996) ji ve věci Goodwin proti Spojenému království
označil za jednu ze základních podmínek svobody tisku.

Ve veřejné správě platí pro utajované informace zákon č. 412/2005 Sb., o ochraně utajovaných
informací a o bezpečnostní způsobilosti, se stupni utajení vyhrazené, důvěrné, tajné a přísně
tajné, a zároveň právo na informace podle zákona č. 106/1999 Sb., o svobodném přístupu k
informacím. Skutečnost, že dokument je označen jako „interní“, sama o sobě poskytnutí informace
nebrání. Zvláštním rizikem je selektivní únik: informace se „náhodou“ dostane ven ve vybrané
podobě, aby ovlivnila veřejný obraz (srov. [injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md)).
Pozen (2013) ukázal, že vlády nezákonné úniky veřejně odsuzují, ale samy je běžně využívají jako
nástroj komunikace, a že stíhány bývají jen některé.

## Strukturální zranitelnosti

První zranitelností je stav, kdy je všechno „interní“, nic se neoznačuje a citlivé dokumenty
nemají omezený přístup. Druhou je opačný extrém: všechno je „důvěrné“, i informace, které by měly
znát kontrolní orgány. Moynihan (1998) upozorňuje, že nadměrné utajení oslabuje i ochranu toho,
co utajeno být má, protože lidé přestanou označení brát vážně.

Třetí zranitelností je klasifikace, kterou určuje autor dokumentu podle vlastního zájmu. Když o
utajení rozhoduje ten, koho by zveřejnění poškodilo, klasifikace přestává měřit škodu z úniku a
začíná měřit škodu pro autora, což je přesně zneužití, které zakazuje Executive Order 13526
(2009).

Čtvrtou zranitelností je chybějící evidence, kdo měl k citlivé informaci přístup, a pátou úniky,
které se nevyšetřují, nebo se vyšetřují výběrově, jen ty, které škodí vedení. Výběrové
vyšetřování odpovídá vzorci, který popsal Pozen (2013): únik je trestán podle toho, komu slouží,
nikoli podle toho, co prozradil.

## Ochranné struktury

Základem je jednoduchý systém úrovní, například veřejné, interní, důvěrné a přísně omezené, s
příklady pro každou úroveň. Pro sdílení s partnery se osvědčil protokol semaforu (Traffic Light
Protocol), který barevnými označeními určuje, komu smí příjemce informaci dál předat (FIRST, 2022).
Jednoduchost je podmínkou, aby lidé systém dodržovali.

Dokumenty se označují od vzniku a pro každou úroveň platí pravidla zacházení: sdílení, tisk,
odesílání a ukládání. Přístupy se řídí potřebou znát, jak popisuje
[řízení přístupů](@/kompendium/organizational-defense/28-access-control-EA.md), a míra ochrany
odpovídá dopadu, který by mělo narušení důvěrnosti, integrity či dostupnosti (National Institute
of Standards and Technology, 2004).

Klíčové je pravidlo, že klasifikace nesmí bránit kontrolním orgánům, tedy internímu auditu,
auditnímu výboru, příslušné osobě podle zákona č. 171/2023 Sb., o ochraně oznamovatelů, a
regulátorovi, v přístupu. Klasifikace se pravidelně přezkoumává: co už nemusí být důvěrné a co
bylo utajeno bez důvodu. Technické nástroje proti úniku dat (DLP) jsou přiměřené riziku a v
souladu s ochranou soukromí zaměstnanců, protože plošné sledování komunikace vyvolává nedůvěru a
odpor (Ball, 2010).

## Role a odpovědnosti

Vlastník informace určuje klasifikaci a přístupy, bezpečnostní manažer nebo IT zajišťuje
technická opatření a pověřenec pro ochranu osobních údajů dohlíží na zacházení s osobními údaji.
Compliance nebo interní audit kontroluje, zda klasifikace není zneužívána k zakrývání, a každý
uživatel odpovídá za dodržování pravidel zacházení. Oddělení toho, kdo klasifikuje, od toho, kdo
klasifikaci kontroluje, odpovídá poznatku, že utajování bez vnějšího dohledu má sklon k
rozšiřování (Moynihan, 1998).

## Politiky a postupy

Klasifikační politika stanoví úrovně, příklady a pravidla zacházení a výchozí klasifikaci pro
typy dokumentů, jako jsou personální spisy, zdravotní údaje a vyšetřování. Postup sporu o
klasifikaci určuje, kdo může klasifikaci napadnout a kdo rozhoduje; možnost napadnout utajení
zevnitř je pojistkou proti tomu, aby se z klasifikace stal nástroj zakrývání (Executive Order
13526, 2009).

Postup při úniku zahrnuje hlášení, vyhodnocení a oznámení dotčeným a dozorovému úřadu tam, kde to
GDPR vyžaduje; v Česku je dozorovým úřadem Úřad pro ochranu osobních údajů podle zákona č.
110/2019 Sb., o zpracování osobních údajů. Politika výslovně stanoví, že oznámení podle zákona č.
171/2023 Sb. není porušením mlčenlivosti v rozsahu, který zákon stanoví; i směrnice (EU) 2016/943
o ochraně obchodního tajemství stanoví výjimku z ochrany pro případ, kdy bylo tajemství
prozrazeno za účelem odhalení protiprávního jednání ve veřejném zájmu.

## Vzdělávání a trénink

Uživatelé se učí klasifikovat na praktických příkladech z vlastní práce a zacházet s citlivými
informacemi při běžných činnostech, jako je e-mail, sdílení a práce na mobilu. Vedoucí se učí, že
utajení musí mít důvod a že utajení před kontrolou je varovným signálem. Bok (1982) rozlišuje
oprávněné důvody tajemství, jako je ochrana soukromí a připravovaných plánů, od tajemství, která
zakrývají škodu; pro každé označení „přísně omezené“ z toho plyne užitečná otázka, zda by důvod
utajení obstál, kdyby ho znali ti, před nimiž se tají.

Lidé, kteří pracují s citlivými informacemi, se učí rozpoznat pokusy o jejich získání, tedy
[sociální inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md),
předstíranou autoritu a časový tlak. Mitnick a Simon (2002) dokládají, že útočník se často
spoléhá spíše na ochotu a důvěřivost lidí než na technickou slabinu; cílem tréninku je rozpoznání
těchto znaků.

## Řešení incidentu

Při úniku citlivé informace se zjistí rozsah a dotčené osoby a omezí se další šíření. Zajistí se
záznamy o přístupech a sdílení a posoudí se povinnost oznámení dozorovému úřadu a dotčeným osobám.
Příčina se vyšetřuje bez předpokladu viny konkrétní osoby a únik se odlišuje od chráněného
oznámení, protože zákon č. 171/2023 Sb. chrání oznamovatele i tehdy, když při oznámení použil
interní informace v rozsahu, který zákon připouští.

Při podezření na zneužití klasifikace k zakrytí problému si kontrolní orgán vyžádá přístup k
dokumentům a posoudí důvod utajení; neodůvodněné utajení se zruší a zaznamená jako zjištění.
Anonymizovaný kompozitní příklad: vedení výzkumného ústavu označilo za přísně důvěrnou interní
zprávu o problémech s integritou dat a odmítlo ji předat etické komisi. Po zásahu správní rady se
ukázalo, že klasifikace neměla jiný důvod než ochranu pověsti vedoucího projektu. Případ
odpovídá situaci, kterou zakazuje Executive Order 13526 (2009): utajení kvůli ztrapnění.

## Ochrana dotčené osoby

Osoby, jejichž údaje unikly, tedy pacienti, žáci a zaměstnanci, mají právo být informovány a
dostat pomoc, například při zneužití údajů k [doxingu](@/glossary/doxing.md) nebo k útoku na
pověst. Nissenbaum (2010) vysvětluje, proč únik zraňuje i tehdy, když jde o údaje, které „někdo
znal“: porušuje normy kontextu, v němž byly sdíleny.

Zaměstnanec, který oznámil protiprávní jednání a použil při tom interní informace, nesmí být
automaticky postižen za porušení klasifikace; je třeba posoudit, zda šlo o chráněné oznámení podle
zákona č. 171/2023 Sb. Organizace, která oznamovatele trestá za formu a k obsahu oznámení se
nevyjádří, mu působí újmu, kterou Smith a Freyd (2014) nazývají institucionální zradou.

## Vyhodnocení a indikátory selhání

Indikátory selhání jsou stav, kdy je vše „interní“ a nic se neoznačuje, citlivé dokumenty na
sdílených discích bez omezení, kontrolní orgány, které narážejí na „důvěrnost“ při každém dotazu,
úniky vyšetřované jen tehdy, když škodí vedení, a nevědomost o tom, kdo měl k citlivým informacím
přístup. Druhý a třetí signál ukazují na zneužití klasifikace, které popisují Moynihan (1998) i
Pozen (2013).

Funkční klasifikace se naopak pozná podle toho, že se označení drží škody z úniku, že kontrolní
orgány mají přístup bez vyjednávání a že přezkum klasifikace některá označení skutečně ruší.
Rušení zbytečných označení je známkou, že systém měří citlivost, a ne moc (Galison, 2004).

## Meze a otevřené otázky

Klasifikace je tak dobrá, jak ji lidé dodržují, a složitý systém se obchází. Automatická
klasifikace pomocí nástrojů umělé inteligence je pohodlná, ale chybuje a přenáší odpovědnost za
rozhodnutí na nástroj, jehož kritéria nikdo nezná. Moynihan (1998) navíc ukazuje, že ani dobře
míněná pravidla nadměrné utajování sama nezastaví, pokud za utajení nikdo neodpovídá.

Otevřené zůstává, jak najít rovnováhu mezi ochranou informací a transparentností, zejména ve
veřejném sektoru a v neziskových organizacích, které stojí na důvěře veřejnosti. Bok (1982)
upozorňuje, že tajemství i jeho prozrazení mohou být zneužity, a etika klasifikace proto nemůže
stát jen na jednom z obou principů.

## Literatura

- Ball, K. (2010). Workplace surveillance: An overview. *Labor History*.
- Bok, S. (1982). *Secrets: On the Ethics of Concealment and Revelation*. Pantheon Books.
- Evropský soud pro lidská práva (1996). *Goodwin proti Spojenému království*, rozsudek, stížnost č. 17488/90.
- Executive Order 13526 (2009). *Classified National Security Information*. Federal Register.
- FIRST (2022). *Traffic Light Protocol (TLP) Version 2.0*. Forum of Incident Response and Security Teams.
- Galison, P. (2004). Removing knowledge. *Critical Inquiry*.
- Mitnick, K. D., & Simon, W. L. (2002). *The Art of Deception: Controlling the Human Element of Security*. Wiley.
- Moynihan, D. P. (1998). *Secrecy: The American Experience*. Yale University Press.
- National Institute of Standards and Technology (2004). *Standards for Security Categorization of Federal Information and Information Systems* (FIPS PUB 199). U.S. Department of Commerce.
- Nissenbaum, H. (2010). *Privacy in Context: Technology, Policy, and the Integrity of Social Life*. Stanford University Press.
- Pozen, D. E. (2013). The leaky leviathan: Why the government condemns and condones unlawful disclosures of information. *Harvard Law Review*.
- Smith, C. P., & Freyd, J. J. (2014). Institutional betrayal. *American Psychologist*.

## Související

**Sesterské kapitoly**

- [Řízení přístupů s EA fokusem](@/kompendium/organizational-defense/28-access-control-EA.md)
  – kdo k informaci smí.
- [Komunikační politika](@/kompendium/organizational-defense/23-communication-policy.md) –
  kanály pro citlivé informace.
- [Dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md)
  – metadata včetně klasifikace.
- [Prověřování kontraktorů](@/kompendium/organizational-defense/26-contractor-vetting.md) –
  externí osoby a citlivé informace.

**Právo a compliance**

- [EA × Compliance: GDPR & Personal Narrative Right](@/kompendium/cross-domain/27-ea-compliance-gdpr-narrative-protection.md)
  – ochrana osobních údajů v souvislostech Kompendia.
- [Důvěrnost v EA detekci](@/kompendium/critical-perspectives/17-confidentiality-EA.md) –
  etika důvěrnosti.
- [Mechanismus oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md)
  – kanál, kterému klasifikace nesmí bránit.

**Signatury a pojmy**

- [Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md) –
  selektivní úniky jako nástroj.
- [Doxing](@/glossary/doxing.md) – zneužití uniklých osobních údajů.
