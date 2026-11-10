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

Klasifikace informací určuje, jak citlivá je která informace a kdo s ní smí zacházet. Bez ní
je všechno „interní“ a citlivé dokumenty leží na sdílených discích bez omezení. Klasifikace
má ale i druhou, méně zřejmou epistemickou stránku: informace lze ukrýt také tím, že se
označí za důvěrné. Nadměrné utajení chrání problémy před kontrolními orgány, zaměstnanci i
veřejností. Kapitola proto popisuje klasifikaci jako nástroj ochrany i jako místo, kde je
třeba hlídat zneužití.

## Riziko v daném prostředí

V nemocnici jsou údaje o zdravotním stavu zvláštní kategorií osobních údajů podle GDPR a
jejich únik může pacienta vážně poškodit; zároveň nesmí utajení bránit vyšetření
nežádoucích událostí. Ve škole jde o údaje o žácích, výchovných opatřeních a poradenství. Ve
výzkumu o neveřejná data, rukopisy a posudky. V médiích o ochranu zdrojů, bez níž nemůže
investigativní žurnalistika existovat. Ve firmě o obchodní tajemství, personální data a
informace o vyšetřováních. Ve veřejné správě platí pro utajované informace zákon č.
412/2005 Sb., o ochraně utajovaných informací, a zároveň právo na informace podle zákona č.
106/1999 Sb.; skutečnost, že dokument je „interní“, sama o sobě poskytnutí informace
nebrání. Zvláštním rizikem je selektivní únik: informace se „náhodou“ dostane ven ve
vybrané podobě, aby ovlivnila veřejný obraz (srov. [injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md)).

## Strukturální zranitelnosti

- Všechno je „interní“, žádné označování; citlivé dokumenty bez omezení přístupu.
- Opačný extrém: všechno je „důvěrné“, i informace, které by měly znát kontrolní orgány.
- Klasifikaci určuje autor dokumentu podle vlastního zájmu.
- Neexistuje evidence, kdo měl k citlivé informaci přístup.
- Úniky se nevyšetřují, nebo se vyšetřují výběrově (jen ty, které škodí vedení).

## Ochranné struktury

- Jednoduchý systém úrovní, například veřejné / interní / důvěrné / přísně omezené, s
  příklady pro každou úroveň.
- Označování od vzniku dokumentu a pravidla zacházení pro každou úroveň (sdílení, tisk,
  odesílání, ukládání).
- Přístupy podle potřeby znát – viz [řízení přístupů](@/kompendium/organizational-defense/28-access-control-EA.md).
- Pravidlo, že klasifikace nesmí bránit kontrolním orgánům (interní audit, auditní výbor,
  příslušná osoba, regulátor) v přístupu.
- Pravidelný přezkum klasifikace: co už nemusí být důvěrné, co bylo utajeno bez důvodu.
- Technické nástroje proti úniku dat (DLP) přiměřené riziku a v souladu s ochranou soukromí
  zaměstnanců.

## Role a odpovědnosti

Vlastník informace určuje klasifikaci a přístupy. Bezpečnostní manažer nebo IT zajišťuje
technická opatření. Pověřenec pro ochranu osobních údajů dohlíží na zacházení s osobními
údaji. Compliance nebo interní audit kontroluje, zda klasifikace není zneužívána k
zakrývání. Každý uživatel odpovídá za dodržování pravidel zacházení.

## Politiky a postupy

1. Klasifikační politika s úrovněmi, příklady a pravidly zacházení.
2. Výchozí klasifikace pro typy dokumentů (personální spisy, zdravotní údaje, vyšetřování).
3. Postup sporu o klasifikaci: kdo může klasifikaci napadnout a kdo rozhoduje.
4. Postup při úniku: hlášení, vyhodnocení, oznámení dotčeným a dozorovému úřadu tam, kde to
   GDPR vyžaduje.
5. Výslovné pravidlo, že oznámení podle zákona č. 171/2023 Sb. není porušením mlčenlivosti v
   rozsahu, který zákon stanoví.

## Vzdělávání a trénink

Uživatelé se učí klasifikovat na praktických příkladech z vlastní práce a zacházet s
citlivými informacemi při běžných činnostech (e-mail, sdílení, mobil). Vedoucí se učí, že
utajení musí mít důvod a že utajení před kontrolou je varovným signálem. Lidé, kteří pracují
s citlivými informacemi, se učí rozpoznat pokusy o jejich získání –
[sociální inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md),
předstíranou autoritu, časový tlak.

## Řešení incidentu

Při úniku citlivé informace:

1. Zjistit rozsah a dotčené osoby; omezit další šíření.
2. Zajistit záznamy o přístupech a sdílení.
3. Posoudit povinnost oznámení dozorovému úřadu a dotčeným osobám.
4. Vyšetřit příčinu bez předpokladu viny konkrétní osoby a odlišit únik od chráněného
   oznámení.

Při podezření na zneužití klasifikace k zakrytí problému:

1. Kontrolní orgán si vyžádá přístup k dokumentům a posoudí důvod utajení.
2. Neodůvodněné utajení se zruší a zaznamená jako zjištění.

**Příklad (anonymizovaný kompozit).** Vedení výzkumného ústavu označilo za přísně
důvěrnou interní zprávu o problémech s integritou dat a odmítlo ji předat etické komisi. Po
zásahu správní rady se ukázalo, že klasifikace neměla jiný důvod než ochranu pověsti
vedoucího projektu.

## Ochrana dotčené osoby

Osoby, jejichž údaje unikly (pacienti, žáci, zaměstnanci), mají právo být informovány a
dostat pomoc, například při zneužití údajů k [doxingu](@/glossary/doxing.md) nebo k útoku na
pověst. Zaměstnanec, který oznámil protiprávní jednání a při tom použil interní informace,
nesmí být automaticky postižen za porušení klasifikace; je třeba posoudit, zda šlo o chráněné
oznámení.

## Vyhodnocení a indikátory selhání

- Vše je „interní“, žádné označování, citlivé dokumenty na sdílených discích bez omezení.
- Kontrolní orgány narážejí na „důvěrnost“ při každém dotazu.
- Úniky se vyšetřují jen tehdy, když škodí vedení.
- Nikdo neví, kdo měl k citlivým informacím přístup.

## Meze a otevřené otázky

Klasifikace je tak dobrá, jak ji lidé dodržují; složitý systém se obchází. Automatická
klasifikace pomocí nástrojů umělé inteligence je pohodlná, ale chybuje. Otevřené zůstává,
jak najít rovnováhu mezi ochranou informací a transparentností, zejména ve veřejném sektoru
a v neziskových organizacích, které stojí na důvěře veřejnosti.

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

**Signatury a pojmy**

- [Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md) –
  selektivní úniky jako nástroj.
- [Doxing](@/glossary/doxing.md) – zneužití uniklých osobních údajů.
