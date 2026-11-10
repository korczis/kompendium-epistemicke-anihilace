+++
title = "EA-9.2.5 Video Manipulation EA"
description = "Vzorec, v němž se v pravém videu AI nástroji změní jen dílčí prvek – předmět, nápis, gesto – a záznam tak dokládá něco jiného, než se stalo. Znaky a obrana."
weight = 925

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-2", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-2-1-deepfake-personality", "ea-9-2-4-image-manipulation-EA", "ea-9-2-8-AI-eyewitness-fabrication"]
ea_code = "EA-9.2.5"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.2 Generativní média"
section_icon = "🎬"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.2.5 Video Manipulation EA

> *Subkategorie 🎬 **9.2 Generativní média** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.2.5`
**Název:** Video Manipulation EA
**Subkategorie:** 9.2 Generativní média
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*Video manipulation EA* je úprava vybraných prvků skutečného videozáznamu – předmětu v ruce, nápisu, loga, gesta, pozadí – generativními nástroji, přičemž zbytek záznamu zůstává pravý. Na rozdíl od úplného [deepfaku](@/glossary/deepfake.md) se nevytváří nový projev osoby, ale mění se detail, na němž závisí výklad události.

## 3. Mechanismus (strukturálně)

Vzorec stojí na tom, že pravá část záznamu propůjčuje věrohodnost upravené části. Pozorovatel ověřuje, co může: místo, osoby, čas – a to vše sedí. Sporný detail (držel nůž, nebo telefon? jaký nápis měl transparent?) se ověřuje mnohem hůř. Patří sem i jednodušší zásahy, které nevyžadují AI: zpomalení, zrychlení, vystřižení úseku, zavádějící střih. Společné je, že záznam se stává argumentem pro výklad, který neodpovídá události.

## 4. Detekční markery

- Existuje delší nebo jiná verze záznamu, v níž sporný detail vypadá jinak.
- Nepravidelnosti v pohybu, osvětlení nebo okrajích předmětu mezi snímky; „plavání“ textur.
- Záznam je zkrácený přesně kolem sporného okamžiku; chybí, co předcházelo a následovalo.
- Šířená verze má horší kvalitu než očekávaný originál; metadata chybějí.
- Svědci nebo jiné kamery zachycují situaci odlišně.

## 5. Odlišení

*Střih a kontext*: pravé záběry poskládané zavádějícím způsobem; manipulace výkladem, ne obrazem. *[EA-9.2.1 Deepfake Personality](@/kompendium/techniques/ea-9-2-1-deepfake-personality.md)*: syntetický projev osoby jako celek. *Technické artefakty*: komprese a nízké rozlišení vytvářejí podobné vady bez úmyslu; rozhodne originál.

## 6. Dopad a rámec

Upravené video může ovlivnit vyšetřování, soudní řízení i veřejnou reakci na incident (protest, zákrok, nehodu). Pro posouzení je nezbytný originální záznam s metadaty a dokumentovaný původ ([Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md)). Právní hodnocení závisí na účelu: pomluva, padělání důkazu, podněcování.

## 7. Obrana a zotavení

*Čtenář*: hledat původní a delší verzi, další úhly pohledu a zdroj prvního zveřejnění. *Redakce*: pracovat s originálem, porovnávat více zdrojů, při nejistotě to otevřeně uvést. *Vyšetřovatelé*: zajistit originály ze zařízení a kamer co nejdříve, než se rozšíří upravené verze. *Postižená osoba*: získat vlastní nebo nezávislé záznamy, požádat o forenzní posouzení.

## 8. Příklad (anonymizovaný kompozit)

Po potyčce na demonstraci se šíří krátké video, na němž má jeden z účastníků v ruce předmět připomínající zbraň. Novinář získá původní záznam od autora: předmět je skládací deštník, šířená verze je zkrácená a v místě předmětu nese stopy úpravy. Redakce zveřejní srovnání obou verzí a postup ověření. Šiřitelé upravené verze tvrdí, že „originál je ten zfalšovaný“ – spor se přesune k otázce původu, kterou lze doložit.

## 9. Meze a otevřené otázky

Rozpoznat malou úpravu ve videu je technicky náročné a vyžaduje originál; bez něj zůstává posouzení nejisté. Otevřenou otázkou je, jak zajistit dostupnost originálů, aniž by se ohrozilo soukromí lidí na záznamech.

Zůstává také otázkou, jak informovat veřejnost o manipulacích, aniž by se upravená verze dál šířila; srovnání obou verzí může nechtěně zvýšit dosah té nepravé.

Další otevřenou otázkou je dlouhodobá archivace originálů, bez níž nebude možné ani po letech doložit, jak záznam vypadal.

## 10. Pohled zevnitř a práce s postiženým

Člověk, kterého upravené video vykresluje jako agresora, čelí rychlé sociální odsouzení, často dřív, než se může bránit. Prožívá šok a bezmoc; okolí mu nemusí věřit. Užitečná je rychlá právní a komunikační pomoc, ale i psychická podpora při zvládání vlny nenávisti. Po očištění pomáhá veřejná oprava stejně viditelná jako původní obvinění.

Pro rodinu postiženého je důležité vědět, že i jejich soukromí může být zasaženo, a mít podporu při jednání s médii a při ochraně dětí před vlnou nenávisti, která se často přelévá i do školy a sousedství.

## 11. Vztah k ostatním kategoriím EA

Starší, netechnologickou podobou je [EA-2.3.1 Clip Takeout](@/kompendium/techniques/ea-2-3-1-clip-takeout.md) – vystřižení úseku z kontextu – a [EA-2.3.2 Context Collapse](@/kompendium/techniques/ea-2-3-2-context-collapse.md). Generativní úprava přidává možnost změnit i samotný obsah záběru, takže kontrola kontextu už nestačí a rozhoduje původ záznamu.

Pro klinickou a forenzní praxi z toho plyne obecné pravidlo celé subkategorie 9.2: videozáznam je stopa, nikoli svědectví, a jeho váha závisí na tom, jak dobře je doložen jeho vznik a cesta k posuzovateli. Kde tato cesta chybí, je namístě opatrnost i u záznamů, které působí přesvědčivě, a zároveň respekt k lidem, jejichž výpověď záznamu odporuje.

## 12. Postup při sporném videu

1. **Najít první zveřejnění** a autora záznamu.
2. **Získat delší nebo původní verzi** a porovnat ji se šířenou.
3. **Hledat další úhly pohledu** – jiné kamery, svědky, oficiální záznamy.
4. **Zajistit originál** forenzně, pokud jde o řízení.
5. **Zveřejnit srovnání** s postupem ověření, ne jen vyvrácení.

## 13. Prevence a odolnost

Prevence stojí na návyku hledat původní a delší verzi záznamu a na pochopení, že pravá část videa nedokládá pravost celku. Pro organizace, jejichž činnost je často natáčena (policie, pořadatelé akcí, školy), je užitečné uchovávat vlastní záznamy s doloženým původem. Systémově pomáhají standardy původu obsahu a pravidla redakcí, podle nichž se sporné záznamy zveřejňují jen s popsaným postupem ověření a s otevřeně uvedenou nejistotou tam, kde originál chybí.

## Odborný kontext

Výzkum dezinformací rozlišuje plně vymyšlený obsah od obsahu, který je pravý, ale zmanipulovaný nebo vytržený z kontextu (Wardle a Derakhshan 2017). Dílčí úprava videa patří mezi nejobtížněji odhalitelné formy, protože většina záznamu obstojí při jakékoli kontrole. Chesney a Citron (2019) upozorňují, že s rozšířením manipulací roste „dividenda lháře“ – i pravý záznam lze zpochybnit tvrzením, že byl upraven; spor se pak vede o původ, nikoli o obsah.

Psychologie svědectví ukazuje, že i drobná změna informace po události ovlivňuje, jak si ji lidé pamatují: klasické experimenty Loftusové a Palmera (1974) doložily, že formulace otázky změnila odhad rychlosti aut ve videu i vzpomínku na rozbité sklo, které ve videu nebylo. Upravené video tak může ovlivnit nejen veřejnost, ale i skutečné svědky, kteří ho uvidí dřív, než vypovídají. Proto vyšetřovací praxe doporučuje vyslechnout svědky co nejdříve a zaznamenat, jaký obsah o události viděli (Wells a Olson 2003).

## Souvislosti pro praxi

Pro vyšetřovatele je důležité zajistit originály záznamů ze zařízení a kamer okamžitě, protože upravené verze se šíří rychle a originály mohou zmizet. Pro redakce platí, že srovnání upravené a původní verze, zveřejněné s postupem ověření, je účinnější než pouhé vyvrácení. Pro obhájce a zástupce obětí je užitečné trvat na forenzním posouzení u záznamů, které rozhodují o výkladu události.

## Literatura

- Chesney, R., & Citron, D. K. (2019). Deep fakes: A looming challenge for privacy, democracy, and national security. *California Law Review*.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*.
- Wardle, C., & Derakhshan, H. (2017). *Information Disorder*. Council of Europe.
- Wells, G. L., & Olson, E. A. (2003). Eyewitness testimony. *Annual Review of Psychology*.

## Související

**Sourozenecké techniky**

- [EA-9.2.1 Deepfake Personality](@/kompendium/techniques/ea-9-2-1-deepfake-personality.md) – syntetický projev osoby.
- [EA-9.2.4 Image Manipulation EA](@/kompendium/techniques/ea-9-2-4-image-manipulation-EA.md) – tentýž princip u fotografie.
- [EA-9.2.8 AI Eyewitness Fabrication](@/kompendium/techniques/ea-9-2-8-AI-eyewitness-fabrication.md) – celá smyšlená událost.

**Forenzika**

- [Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) – originál a metadata.
- [Zachování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md) – včasné zajištění záznamů.

**Detekce a obrana**

- [Detekční signatura: Posun rámování](@/kompendium/detection-signatures/4-linguistic-framing-shift.md) – změna výkladu události.
- [Sebe-obrana: Detekce AI obsahu](@/kompendium/self-defense-guides/40-ai-content-detection.md) – praktické kontroly.
