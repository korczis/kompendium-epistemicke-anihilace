+++
title = "EA-9.6.1 Algorithmic Decision Bias"
description = "Vzorec systematické zaujatosti automatizovaných rozhodovacích systémů – skórování, kategorizace, filtrování –, která nerovnoměrně poškozuje určité skupiny lidí."
weight = 961

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-6", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-6-2-AI-judgment-laundering", "ea-9-6-5-AI-credit-scoring-bias", "ea-9-6-10-AI-welfare-decision-EA", "ea-9-6-8-AI-legal-decision-EA"]
parent = "kompendium-techniques"
ea_code = "EA-9.6.1"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.6 Algoritmická governance"
section_icon = "⚖️"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.6.1 Algorithmic Decision Bias

> *Subkategorie ⚖️ **9.6 Algoritmická governance** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.6.1`
**Název:** Algorithmic Decision Bias
**Subkategorie:** 9.6 Algoritmická governance
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*Algorithmic decision bias* je systematická zaujatost automatizovaných rozhodovacích systémů – skórovacích modelů, klasifikátorů, filtrů –, jejímž výsledkem je, že rozhodnutí o úvěru, nájmu, zaměstnání, péči nebo dávkách nerovnoměrně poškozují určité skupiny. Zaujatost nevyžaduje úmysl: vzniká z dat, z volby proměnných a z cíle, na který je systém optimalizován. Epistemicky jde o to, že nerovnost dostane podobu „objektivního“ výpočtu.

## 3. Mechanismus (strukturálně)

Modely se učí z historických dat, a tedy i z historických nerovností: kde byla určitá skupina dříve odmítána, model se naučí ji odmítat. I když chráněné vlastnosti (pohlaví, etnicita) v datech nejsou, mohou je zastoupit zástupné proměnné – bydliště, jméno, typ školy, vzorce chování. Cíl optimalizace (minimalizovat náklady, předpovědět „úspěch“) může sám nést hodnotová rozhodnutí. Výsledek se pak prezentuje jako číslo, které působí neutrálně a je obtížně napadnutelné. Kniha tento vzorec chápe jako epistemický: zaujatost se schovává za autoritu výpočtu a člověk, kterého se týká, nemá pojmy ani přístup, jak ji zpochybnit ([epistemická nespravedlnost](@/glossary/epistemicka-injustice.md)).

## 4. Detekční markery

- Výsledky systému se systematicky liší mezi skupinami, které by se v relevantních vlastnostech lišit neměly.
- Systém používá proměnné, které úzce korelují s chráněnými vlastnostmi.
- Postižený nedostane srozumitelné zdůvodnění rozhodnutí, jen skóre nebo kategorii.
- Odvolání vyžaduje znalosti, které běžný člověk nemá, nebo neexistuje vůbec.
- Provozovatel odmítá audit s odkazem na obchodní tajemství nebo na „objektivitu“ systému.

## 5. Odlišení

*Legitimní rozlišování*: rozdíly ve výsledcích vyplývají z relevantních a ověřitelných důvodů a jsou vysvětlitelné. *Náhodná chyba*: jednotlivé chybné rozhodnutí bez systematického vzorce. *[EA-9.6.2 AI Judgment Laundering](@/kompendium/techniques/ea-9-6-2-AI-judgment-laundering.md)*: vědomé použití systému k zakrytí lidského rozhodnutí; zaujatost může být i neúmyslná.

## 6. Dopad a rámec

Zaujaté systémy mohou ve velkém měřítku reprodukovat diskriminaci a zároveň ji činit méně viditelnou. V EU se uplatní obecné nařízení o ochraně osobních údajů (GDPR, zejména čl. 22 o automatizovaném individuálním rozhodování), antidiskriminační právo a akt o umělé inteligenci (nařízení (EU) 2024/1689), který řadí systémy pro úvěrové hodnocení, zaměstnání, migraci, justici a přístup k veřejným službám mezi vysoce rizikové s povinnostmi řízení rizik, dokumentace a lidského dohledu.

## 7. Obrana a zotavení

*Postižený*: vyžádat si vysvětlení rozhodnutí a lidský přezkum; uplatnit práva podle GDPR; obrátit se na ombudsmana nebo poradnu. *Provozovatelé*: testovat systémy na rozdíly mezi skupinami před nasazením i za provozu; dokumentovat data a volby. *Regulátoři a auditoři*: vyžadovat přístup k datům a modelům pro nezávislé audity. *Novináři a výzkumníci*: zkoumat výsledky systémů a zveřejňovat vzorce.

## 8. Příklad (anonymizovaný kompozit)

Městská bytová správa nasadí systém, který třídí žadatele o obecní byt podle „rizika neplacení“. Po roce si sociální pracovnice všimnou, že žadatelé z jedné čtvrti dostávají téměř vždy nízké pořadí. Audit ukáže, že model používá adresu a historii stěhování, které v praxi odrážejí chudobu a etnické složení čtvrti. Systém je pozastaven a pořadí přezkoumáno lidmi.

## 9. Meze a otevřené otázky

Neexistuje jediná definice „spravedlivého“ algoritmu; různá matematická kritéria spravedlnosti si mohou odporovat. Volba mezi nimi je hodnotové rozhodnutí, které nemá dělat systém sám. Otevřenou otázkou je, jak zapojit dotčené skupiny do rozhodování o tom, jaká kritéria použít.

## 10. Pohled zevnitř a práce s postiženým

Člověk odmítnutý systémem často neví, proč, a hledá chybu v sobě. Pocit, že „stroj rozhodl“, vede k rezignaci. Poradce nebo sociální pracovník pomáhá, když vysvětlí, že rozhodnutí lze napadnout, a doprovodí člověka procesem. U opakovaně odmítaných lidí se zkušenost sčítá s dalšími zkušenostmi diskriminace.

## 11. Vztah k ostatním kategoriím EA

Vzorec je základem celé subkategorie 9.6: [EA-9.6.5](@/kompendium/techniques/ea-9-6-5-AI-credit-scoring-bias.md) (úvěry), [EA-9.6.6](@/kompendium/techniques/ea-9-6-6-AI-hiring-narrative.md) (nábor), [EA-9.6.7](@/kompendium/techniques/ea-9-6-7-AI-medical-decision-EA.md) (medicína), [EA-9.6.8](@/kompendium/techniques/ea-9-6-8-AI-legal-decision-EA.md) (justice), [EA-9.6.9](@/kompendium/techniques/ea-9-6-9-AI-immigration-decision.md) (migrace) a [EA-9.6.10](@/kompendium/techniques/ea-9-6-10-AI-welfare-decision-EA.md) (dávky). Teoreticky navazuje na [Foucaultovo pojetí moci a vědění](@/glossary/power-knowledge.md).

## 12. Otázky pro rozhovor a šetření

- Jaké rozhodnutí bylo učiněno a dostal jste zdůvodnění?
- Víte, zda o vás rozhodoval automatizovaný systém?
- Měl jste možnost požádat o lidský přezkum?
- Mají podobné výsledky i lidé ve vašem okolí?
- Jaké údaje o vás systém mohl použít?

## 13. Postup pro profesionály

1. **Sociální pracovník nebo poradce:** pomoci klientovi vyžádat si zdůvodnění a přezkum; dokumentovat podobné případy.
2. **Právník:** posoudit, zda rozhodnutí nenaplňuje znaky diskriminace nebo porušení pravidel automatizovaného rozhodování.
3. **Auditor:** srovnat výsledky systému mezi skupinami a analyzovat použité proměnné.
4. **Provozovatel:** zajistit lidský dohled, dokumentaci a funkční odvolací cestu.
5. **Novinář:** získat data o výsledcích systému a ověřit vzorec na jednotlivých případech.

## 14. Prevence a odolnost

Prevence stojí na posouzení dopadů před nasazením, na zapojení dotčených skupin, na transparentnosti a na tom, že u rozhodnutí s vážnými důsledky zůstává skutečná lidská odpovědnost. Pro jednotlivce je důležitá znalost práv a dostupnost bezplatného poradenství.

## 15. Typický průběh

Zaujatost se obvykle neprojeví hned. Systém je nasazen s příslibem efektivity a „objektivity“; první měsíce přinášejí úspory a rychlost. Postižení si stěžují jednotlivě a jejich stížnosti se vyřizují jako ojedinělé chyby. Vzorec se stane viditelným, až když někdo – sociální pracovník, novinář, výzkumník – sečte jednotlivé případy. Následuje fáze popírání („systém je neutrální“), pak audit a nakonec korekce nebo pozastavení. Škoda vzniklá do té doby se napravuje obtížně, protože postižení často už rezignovali.

## 16. Dokumentace a důkazy

Pro postižené i jejich zástupce je užitečné uchovávat písemná rozhodnutí, data podání, komunikaci s institucí a zdůvodnění, pokud bylo poskytnuto. Pro systémový důkaz je třeba sbírat podobné případy a jejich charakteristiky. Žádost o informace o logice automatizovaného rozhodnutí (podle GDPR) je sama o sobě důležitým krokem: odmítnutí nebo nesrozumitelná odpověď jsou také informací.

## Odborný kontext

Kritická literatura o algoritmickém rozhodování popsala tento vzorec z několika stran. O'Neil (2016) označila za nejškodlivější ty modely, které jsou neprůhledné, působí ve velkém měřítku a poškozují lidi, aniž by se mohli bránit, a ukázala, že takové modely mohou vytvářet zpětnou smyčku, v níž vlastní předpovědi potvrzují. Eubanks (2018) na případech z amerického sociálního systému doložila, že automatizace dopadá nejtvrději na chudé, kteří jsou nejvíce sledováni a mají nejméně prostředků se bránit. Barocas a Selbst (2016) z právního hlediska vysvětlili, proč zaujatost může vzniknout bez úmyslu – z výběru cílové proměnné, z historických dat a ze zástupných proměnných – a proč ji tradiční antidiskriminační právo zachycuje obtížně.

Z technické strany ukázali Kleinberg, Mullainathan a Raghavan (2017), že několik intuitivních kritérií spravedlnosti skórovacích systémů nelze až na výjimečné případy splnit současně. Volba kritéria je proto hodnotové rozhodnutí, které nelze přenechat vývojářům a které má být učiněno veřejně a s účastí dotčených skupin. Kniha tento závěr čte epistemicky: kdo určuje, co znamená „spravedlivý výsledek“, určuje i to, čí zkušenost se počítá jako relevantní.

## Literatura

- Barocas, S., & Selbst, A. D. (2016). Big data's disparate impact. *California Law Review*.
- Eubanks, V. (2018). *Automating Inequality: How High-Tech Tools Profile, Police, and Punish the Poor*. St. Martin's Press.
- Kleinberg, J., Mullainathan, S., & Raghavan, M. (2017). Inherent trade-offs in the fair determination of risk scores. *Proceedings of ITCS 2017*.
- O'Neil, C. (2016). *Weapons of Math Destruction*. Crown.

## Související

**Sourozenecké techniky**

- [EA-9.6.2 AI Judgment Laundering](@/kompendium/techniques/ea-9-6-2-AI-judgment-laundering.md) – lidské rozhodnutí skryté za systémem.
- [EA-9.6.5 AI Credit Scoring Bias](@/kompendium/techniques/ea-9-6-5-AI-credit-scoring-bias.md) – zaujatost v úvěrech.
- [EA-9.6.10 AI Welfare Decision EA](@/kompendium/techniques/ea-9-6-10-AI-welfare-decision-EA.md) – zaujatost v dávkách.
- [EA-9.6.8 AI Legal Decision EA](@/kompendium/techniques/ea-9-6-8-AI-legal-decision-EA.md) – zaujatost v justici.

**Pojmy a teorie**

- [Epistemická nespravedlnost](@/glossary/epistemicka-injustice.md) – když postižený nemá pojmy ani hlas.
- [Moc a vědění](@/glossary/power-knowledge.md) – výpočet jako forma moci.

**Obrana a politika**

- [Regulační přístup k EA](@/kompendium/population-health/22-regulatory-approach-EA.md) – systémová odpověď.
- [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md) – organizační obrana.
