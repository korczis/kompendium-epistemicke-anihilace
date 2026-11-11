+++
title = "EA-9.6.2 AI Judgment Laundering"
description = "Vzorec, v němž instituce použije AI systém k „praní“ vlastního rozhodnutí: předem daný závěr získá auru objektivity a odpovědnost se rozplyne v „algoritmu“."
weight = 962

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-6", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-6-1-algorithmic-decision-bias", "ea-9-6-6-AI-hiring-narrative", "ea-9-6-8-AI-legal-decision-EA", "ea-2-4-5-evaluation-criteria-rewrite"]
ea_code = "EA-9.6.2"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.6 Algoritmická governance"
section_icon = "⚖️"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.6.2 AI Judgment Laundering

> *Subkategorie ⚖️ **9.6 Algoritmická governance** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.6.2`
**Název:** AI Judgment Laundering
**Subkategorie:** 9.6 Algoritmická governance
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High

## 2. Definice

*AI judgment laundering* je použití automatizovaného systému k tomu, aby lidské, hodnotové nebo předem učiněné rozhodnutí získalo zdání objektivity. Systém je navržen, nastaven nebo vybrán tak, aby potvrdil žádaný závěr; rozhodnutí se pak prezentuje jako „výsledek algoritmu“ a odpovědnost lidí, kteří ho učinili, se rozplývá.

## 3. Mechanismus (strukturálně)

Rozhodnutí podložené výpočtem se hůře napadá: působí neutrálně, odborně a nezávisle na zájmech. Instituce tak může přenést nepopulární nebo sporné rozhodnutí na systém („nemůžeme nic dělat, systém to vyhodnotil“). Volby, které rozhodnutí skutečně určují – co se měří, jaké jsou prahy, jaká data se použijí –, zůstávají skryté v technickém nastavení, k němuž nemá přístup ani postižený, ani veřejnost. Vzorec je institucionální obdobou [hermeneutického outsourcingu](@/glossary/hermeneuticky-outsourcing.md): výklad a úsudek se formálně předají nástroji, ale ve skutečnosti zůstávají u těch, kdo nástroj nastavili.

## 4. Detekční markery

- Výsledek systému přesně odpovídá tomu, co instituce chtěla prosadit, a byl oznámen dřív, než by analýza mohla proběhnout.
- Na otázky po kritériích se odpovídá odkazem na „algoritmus“ místo na lidi, kteří ho nastavili.
- Nastavení systému (prahy, váhy, data) se měnilo těsně před sporným rozhodnutím.
- Lidský přezkum existuje formálně, ale nikdy nevede ke změně.
- Odpovědnost se přesouvá mezi dodavatelem systému a institucí.

## 5. Odlišení

*Poctivě použitý podpůrný nástroj*: systém doporučuje, lidé rozhodují a za rozhodnutí ručí pod jménem. *[EA-9.6.1 Algorithmic Decision Bias](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md)*: zaujatost může vzniknout neúmyslně; laundering je o využití autority systému. *Automatizační zkreslení*: lidé přeceňují výstup systému z pohodlnosti, ne kvůli zakrytí vlastního rozhodnutí.

## 6. Dopad a rámec

Vzorec podkopává odpovědnost veřejné správy a firem: rozhodnutí bez autora nelze napadnout ani z něj vyvodit důsledky. Právně se uplatní požadavky na odůvodnění správních rozhodnutí, pravidla automatizovaného rozhodování (GDPR čl. 22) a povinnosti lidského dohledu podle aktu o umělé inteligenci u vysoce rizikových systémů. Pro organizace je ochranou [sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md).

## 7. Obrana a zotavení

*Postižený*: ptát se, kdo rozhodnutí učinil a podle jakých kritérií; trvat na lidském odůvodnění. *Zaměstnanci instituce*: dokumentovat, kdo nastavil systém a jak; využít [mechanismus whistleblowingu](@/kompendium/organizational-defense/4-whistleblower-mechanism.md), pokud je systém zneužíván. *Kontrolní orgány*: posuzovat celý proces rozhodování, nejen výstup systému. *Veřejnost a média*: odmítat „algoritmus rozhodl“ jako odpověď.

## 8. Příklad (anonymizovaný kompozit)

Vedení firmy chce snížit počet zaměstnanců na jednom oddělení. Koupí nástroj na „hodnocení výkonu“, nastaví váhy tak, že znevýhodňují práci tohoto oddělení, a výsledky oznámí jako „objektivní data“. Odbory si vyžádají dokumentaci nastavení a zjistí, že váhy byly změněny týden před hodnocením. Inspekce práce rozhodnutí přezkoumá; firma musí výpovědi znovu posoudit.

## 9. Meze a otevřené otázky

Prokázat úmysl je obtížné; častěji lze doložit jen to, že systém byl použit nekriticky. Kniha proto nepředpokládá zlý úmysl u každého použití AI v rozhodování. Otevřenou otázkou je, jak zajistit, aby „lidský dohled“ byl skutečný a ne jen formální podpis.

## 10. Pohled zevnitř a práce s postiženým

Postižený narazí na zeď: nikdo nerozhodl, a tedy nikdo neodpovídá. To vyvolává bezmoc a hněv. Pomáhá pojmenovat, že rozhodnutí vždy učinil někdo, a pomoci najít, kdo. Pro zaměstnance instituce, kteří systém obsluhují, může být vzorec morálně zatěžující – pomáhá jasné vymezení odpovědnosti.

## 11. Vztah k ostatním kategoriím EA

Praní úsudku navazuje na [EA-2.4.5 Evaluation Criteria Rewrite](@/kompendium/techniques/ea-2-4-5-evaluation-criteria-rewrite.md) – skryté přepsání kritérií hodnocení – a na Arendtovou analýzu rozptýlené odpovědnosti v byrokracii ([Arendt: Banalita zla](@/kompendium/07-teoreticke-reflexe/arendt-banalita-zla.md)).

## 12. Otázky pro rozhovor a šetření

- Kdo rozhodl o nasazení systému a o jeho nastavení?
- Kdy a proč se nastavení měnilo?
- Vedl lidský přezkum někdy ke změně výsledku?
- Bylo rozhodnutí oznámeno dřív, než mohla analýza proběhnout?
- Kdo nese odpovědnost, pokud je rozhodnutí chybné?

## 13. Postup pro profesionály

1. **Právník:** vyžádat si dokumentaci nastavení systému a historii změn; posoudit odůvodnění rozhodnutí.
2. **Auditor:** ověřit, zda kritéria odpovídají deklarovanému účelu.
3. **Odborová organizace nebo zástupce zaměstnanců:** trvat na transparentnosti hodnoticích nástrojů.
4. **Etický útvar instituce:** zavést pravidlo, že každé rozhodnutí má pojmenovaného lidského autora.
5. **Novinář:** sledovat, jak instituce používají „algoritmus“ jako argument.

## 14. Prevence a odolnost

Prevence spočívá v jasném pravidle: systém doporučuje, lidé rozhodují a podepisují. K tomu patří dokumentace nastavení, auditovatelná historie změn a ochrana zaměstnanců, kteří upozorní na zneužití. Veřejnost by měla vnímat „rozhodl algoritmus“ jako začátek otázek, ne jako jejich konec.

## 15. Typický průběh

Na počátku stojí rozhodnutí, které je sporné nebo nepopulární. Instituce hledá cestu, jak ho prosadit s menším odporem, a nabízí se „datové“ řešení. Systém se zavede s rétorikou modernizace. Výsledky potvrdí předem žádaný závěr a jsou oznámeny jako neutrální. Pokud postižení protestují, instituce odkazuje na technologii; pokud se ukáže chyba, odpovědnost se přesune na dodavatele. Teprve dokumentace nastavení a jeho změn ukáže, kde se rozhodnutí skutečně odehrálo.

## 16. Dokumentace a důkazy

Klíčovými důkazy bývají zadávací dokumentace systému, záznamy o nastavení a jeho změnách, interní komunikace o očekávaných výsledcích a časová osa rozhodnutí. Postižení by si měli uchovat oznámení o rozhodnutí a odpovědi na žádosti o vysvětlení. Rozpor mezi „objektivním výstupem“ a dříve deklarovaným záměrem je silným signálem.

## Odborný kontext

Pasquale (2015) popsal, jak se v ekonomice a veřejné správě rozhodnutí přesouvají do neprůhledných systémů, jejichž logika je chráněna obchodním tajemstvím, a jak tím slábne možnost uplatnit odpovědnost. Praní úsudku je zvláštní případ tohoto procesu: neprůhlednost neslouží jen ochraně know-how, ale i odpovědnosti těch, kdo rozhodli. Citron a Pasquale (2014) v článku o „skórované společnosti“ požadovali pro automatizované hodnocení lidí záruky řádného procesu – oznámení, možnost nahlédnout a napadnout –, které jsou dnes zčásti zakotveny v obecném nařízení o ochraně osobních údajů a v aktu o umělé inteligenci.

Psychologickou oporu vzorce popisuje výzkum automatizace: lidé mají sklon přijímat výstupy systému s menší kontrolou a přenášet na ně odpovědnost (Parasuraman a Manzey 2010). Na úrovni instituce se tento sklon mění v rétorickou strategii. Arendt (1963) v jiném a mnohem vážnějším kontextu ukázala, jak byrokracie rozptyluje odpovědnost tak, že „nikdo“ nerozhodl; kniha tuto analýzu nepřenáší doslova, ale přebírá z ní otázku, kterou je třeba klást vždy: kdo konkrétně tu volbu učinil.

## Souvislosti pro praxi

Pro kontrolní orgány, odbory a novináře se osvědčuje otázka položená v opačném pořadí: nejdřív zjistit, jaké rozhodnutí instituce chtěla nebo očekávala, a teprve potom, co „vyhodnotil systém“. Shoda obou bez nezávislého podkladu je varovným znamením. U interních postupů pomáhá pravidlo, že každý výstup systému použitý v rozhodnutí musí být doplněn podepsaným lidským komentářem, který vysvětlí, proč se mu dává váha.

## Literatura

- Arendt, H. (1963). *Eichmann in Jerusalem: A Report on the Banality of Evil*. Viking Press.
- Citron, D. K., & Pasquale, F. (2014). The scored society: Due process for automated predictions. *Washington Law Review*.
- Parasuraman, R., & Manzey, D. H. (2010). Complacency and bias in human use of automation: An attentional integration. *Human Factors*.
- Pasquale, F. (2015). *The Black Box Society*. Harvard University Press.

## Související

**Sourozenecké techniky**

- [EA-9.6.1 Algorithmic Decision Bias](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md) – zaujatost systémů.
- [EA-9.6.6 AI Hiring Narrative](@/kompendium/techniques/ea-9-6-6-AI-hiring-narrative.md) – „objektivní“ nábor.
- [EA-9.6.8 AI Legal Decision EA](@/kompendium/techniques/ea-9-6-8-AI-legal-decision-EA.md) – skóre v justici.

**Organizace a teorie**

- [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md) – kdo co rozhodl.
- [Mechanismus whistleblowingu](@/kompendium/organizational-defense/4-whistleblower-mechanism.md) – ochrana těch, kdo upozorní.
- [Arendt: Banalita zla](@/kompendium/07-teoreticke-reflexe/arendt-banalita-zla.md) – rozptýlená odpovědnost.

**Pojmy a kapitola 2**

- [Hermeneutický outsourcing](@/glossary/hermeneuticky-outsourcing.md) – předání úsudku nástroji.
- [EA-2.4.5 Evaluation Criteria Rewrite](@/kompendium/techniques/ea-2-4-5-evaluation-criteria-rewrite.md) – přepis kritérií hodnocení.
