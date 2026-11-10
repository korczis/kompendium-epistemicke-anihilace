+++
title = "EA-9.6.9 AI Immigration Decision"
description = "Vzorec automatizovaného hodnocení rizika ve vízovém, azylovém a migračním řízení, kde neprůhledné systémy ovlivňují zásadní životní rozhodnutí bez účinné obrany."
weight = 969

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-6", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-6-8-AI-legal-decision-EA", "ea-9-6-10-AI-welfare-decision-EA", "ea-9-6-1-algorithmic-decision-bias", "ea-6-4-3-uprchlik-protokol"]
ea_code = "EA-9.6.9"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.6 Algoritmická governance"
section_icon = "⚖️"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.6.9 AI Immigration Decision

> *Subkategorie ⚖️ **9.6 Algoritmická governance** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.6.9`
**Název:** AI Immigration Decision
**Subkategorie:** 9.6 Algoritmická governance
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*AI immigration decision* označuje použití automatizovaných systémů v rozhodování o vízech, azylu, pobytu a vyhoštění: hodnocení rizika žadatelů, třídění žádostí, ověřování identity, analýzy jazyka nebo dokumentů. Rozhodnutí jsou formálně „asistovaná“, ale fakticky může výstup systému určovat výsledek. Žadatelé, často ve velmi zranitelném postavení, nemají přístup k logice systému ani účinnou možnost odvolání.

## 3. Mechanismus (strukturálně)

Migrační řízení kombinuje vysoký počet žádostí, tlak na rychlost a politickou citlivost – ideální podmínky pro automatizaci i pro její zneužití. Systémy pracují s údaji, které nesou kulturní a jazykové zkreslení (jména, cestovní trasy, zemi původu, dialekt), a mohou je převádět na „riziko“. Žadatel je navíc v epistemicky nerovném postavení: neovládá jazyk ani právní systém, často nemá dokumenty a jeho výpověď o traumatu může být nekonzistentní z důvodů, které systém nechápe. Automatizace tak může prohloubit [epistemickou nespravedlnost](@/glossary/epistemicka-injustice.md), které žadatelé už čelí.

## 4. Detekční markery

- Zamítnutí se odvolávají na „rizikový profil“ bez konkrétních důvodů.
- Žadatelé z určitých zemí nebo s určitými jmény jsou systematicky odmítáni nebo podrobováni zvýšeným kontrolám.
- Systém hodnotí věrohodnost podle jazykových nebo behaviorálních znaků.
- Žadatel nemá přístup ke svému „skóre“ ani k údajům, z nichž vychází.
- Odvolání nezahrnuje přezkum výstupu systému.

## 5. Odlišení

*Kontrola bezpečnostních databází*: ověření v seznamech s právním základem a možností přezkumu. *Pomocné nástroje*: (překlady, správa spisů) – nepodílejí se na posouzení věci. *[EA-9.6.8 AI Legal Decision EA](@/kompendium/techniques/ea-9-6-8-AI-legal-decision-EA.md)*: justice; v migraci je postavení žadatele ještě slabší.

## 6. Dopad a rámec

Chybné rozhodnutí může znamenat návrat do ohrožení, rozdělení rodiny nebo dlouhodobé zdržení. Mezinárodní právo (zásada nenavracení) a právo EU vyžadují individuální posouzení; akt o umělé inteligenci řadí systémy pro migraci, azyl a ochranu hranic mezi vysoce rizikové. Pro posuzování výpovědí o traumatu viz [Azyl a EA](@/kompendium/forensic-legal/43-asylum-EA.md).

## 7. Obrana a zotavení

*Žadatel a jeho zástupce*: vyžadovat individuální posouzení a odůvodnění, napadat zamítnutí odvolávající se na neurčitý profil. *Neziskové organizace*: poskytovat právní pomoc, dokumentovat vzorce, informovat veřejnost. *Úřady*: zajistit lidské posouzení, transparentnost a přístup žadatele k údajům. *Klinici*: dokládat dopad traumatu na výpověď ([EA-6.4.3 Uprchlík/migrant protokol](@/kompendium/techniques/ea-6-4-3-uprchlik-protokol.md)).

## 8. Příklad (anonymizovaný kompozit)

Žadatelka o azyl je zařazena do zrychleného řízení, protože systém vyhodnotí její zemi původu a cestovní trasu jako „nízké riziko perzekuce“. Její výpověď o násilí je při pohovoru fragmentovaná. Právnička neziskové organizace zajistí psychologický posudek, který vysvětlí, jak trauma ovlivňuje výpověď, a napadne zařazení do zrychleného řízení. Případ je posouzen individuálně a žadatelka získá ochranu.

## 9. Meze a otevřené otázky

Automatizace může pomoci se správou velkého počtu žádostí; problémem je její vliv na samotné posouzení. Otevřenou otázkou je, jak zajistit transparentnost a účinnou obranu v systému, kde žadatelé nemají prostředky a čas.

## 10. Pohled zevnitř a práce s postiženým

Žadatelé prožívají řízení jako nepředvídatelné a nespravedlivé; automatizované rozhodnutí zvyšuje pocit, že je „posuzuje stroj, ne člověk“. U lidí s traumatem to může vést k retraumatizaci. Pomáhá srozumitelná komunikace, právní doprovod a psychologická podpora během řízení.

## 11. Vztah k ostatním kategoriím EA

Vzorec se úzce dotýká [EA-6.4.3 Uprchlík/migrant protokol](@/kompendium/techniques/ea-6-4-3-uprchlik-protokol.md) a forenzní kapitoly [Imigrace a EA](@/kompendium/forensic-legal/42-immigration-EA.md); v kritických perspektivách souvisí s [dekoloniální epistemologií](@/kompendium/critical-perspectives/27-decolonial-epistemology.md).

## 12. Otázky pro rozhovor a šetření

- Bylo vaše řízení nějak automaticky tříděno nebo hodnoceno?
- Jaké důvody zamítnutí jste dostali?
- Měli jste možnost vysvětlit nesrovnalosti ve výpovědi?
- Byl brán v úvahu dopad traumatu?
- Máte přístup ke svým údajům ve spisu?

## 13. Postup pro profesionály

1. **Právní zástupce:** vyžádat si spis včetně podkladů automatizovaného hodnocení, napadnout neurčité odůvodnění.
2. **Klinický psycholog:** posoudit dopad traumatu na výpověď a dodat posudek.
3. **Tlumočník:** upozornit na jazykové nesrovnalosti, které systém mohl zkreslit.
4. **Úřad:** zajistit individuální posouzení a dokumentovat roli systému.
5. **Neziskové organizace:** shromažďovat případy a informovat dohledové orgány.

## 14. Prevence a odolnost

Prevence stojí na zákazu automatického rozhodování o podstatě věci, na transparentnosti, na právu na tlumočníka a právní pomoc a na školení úředníků o traumatu a kulturních rozdílech.

## 15. Typický průběh

Systém se zavede pro „efektivní třídění“. Postupně začne určovat, které žádosti dostanou zrychlené řízení a které podrobné posouzení. Rozdíly mezi skupinami se objeví v datech o výsledcích. Neziskové organizace upozorňují na jednotlivé případy; teprve soudní rozhodnutí nebo zpráva dohledového orgánu vede k úpravám.

## 16. Dokumentace a důkazy

Klíčový je kompletní spis, záznamy pohovorů, posudky o traumatu a zdůvodnění rozhodnutí. Pro systémové doložení jsou třeba statistiky výsledků podle země původu a typu řízení.

## Odborný kontext

Migrační řízení spojuje rysy, které literatura o algoritmickém rozhodování považuje za nejrizikovější: neprůhlednost, velký rozsah a slabé postavení dotčených lidí (O'Neil 2016). Eubanks (2018) ukázala na sociálním systému, že automatizace dopadá nejtvrději na ty, kdo mají nejméně prostředků se bránit; žadatelé o azyl jsou v tomto ohledu ještě zranitelnější, protože často neovládají jazyk, nemají dokumenty a nemohou se bez obav obrátit na veřejnost.

Fricker (2007) rozlišuje svědeckou nespravedlnost, kdy výpověď ztrácí váhu kvůli předsudku vůči mluvčímu, a hermeneutickou nespravedlnost, kdy mluvčímu chybějí sdílené pojmy, jimiž by svou zkušenost srozumitelně popsal. Obě se v azylovém řízení objevují i bez automatizace – výpověď traumatizovaného člověka bývá fragmentovaná a kulturně vzdálená posuzovateli. Systém, který věrohodnost odvozuje z jazykových nebo behaviorálních znaků, může tyto nespravedlnosti mechanicky zesílit. Pro klinickou praxi je proto podstatná role posudků, které vysvětlují, jak trauma ovlivňuje paměť a výpověď (Herman 1992).

## Souvislosti pro praxi

Neziskové organizace poskytující právní pomoc migrantům mohou systematicky evidovat případy, v nichž rozhodnutí odkazuje na rizikový profil nebo automatické třídění, a předávat je dohledovým orgánům a ombudsmanovi. Pro klinické psychology a psychiatry je důležité umět v posudku srozumitelně vysvětlit, jak trauma ovlivňuje paměť, souvislost výpovědi a chování při pohovoru, aby rozhodující úředník nebo soud mohl nesrovnalosti správně vyložit. Tlumočníci by měli mít možnost upozornit na jazykové a kulturní nedorozumění bez obavy, že tím překračují svou roli. Pro úřady je dobrou praxí dokumentovat, jakou roli hrál automatizovaný systém v každém jednotlivém rozhodnutí, aby ji bylo možné při přezkumu posoudit.

Pro výzkumníky je obtížné získat data o migračních rozhodnutích, a proto mají zvláštní cenu zprávy dohledových orgánů a soudní rozhodnutí, která roli automatizovaných nástrojů popisují. Kniha je doporučuje jako primární zdroj informací tam, kde jiná data chybějí.

Pro samotné žadatele je nejdůležitější vědět, že mají právo na individuální posouzení a na vysvětlení, a že pomoc neziskových organizací je bezplatná.

## Literatura

- Eubanks, V. (2018). *Automating Inequality*. St. Martin's Press.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- O'Neil, C. (2016). *Weapons of Math Destruction*. Crown.

## Související

**Sourozenecké techniky**

- [EA-9.6.8 AI Legal Decision EA](@/kompendium/techniques/ea-9-6-8-AI-legal-decision-EA.md) – automatizace v justici.
- [EA-9.6.10 AI Welfare Decision EA](@/kompendium/techniques/ea-9-6-10-AI-welfare-decision-EA.md) – automatizace ve veřejné správě.
- [EA-9.6.1 Algorithmic Decision Bias](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md) – obecný vzorec.

**Klinika a právo**

- [EA-6.4.3 Uprchlík/migrant protokol](@/kompendium/techniques/ea-6-4-3-uprchlik-protokol.md) – klinická péče.
- [Azyl a EA](@/kompendium/forensic-legal/43-asylum-EA.md) – azylové řízení.
- [Imigrace a EA](@/kompendium/forensic-legal/42-immigration-EA.md) – migrační řízení.

**Pojmy a kritika**

- [Epistemická nespravedlnost](@/glossary/epistemicka-injustice.md) – nerovné postavení výpovědi.
- [Dekoloniální epistemologie](@/kompendium/critical-perspectives/27-decolonial-epistemology.md) – meze kategorií.
