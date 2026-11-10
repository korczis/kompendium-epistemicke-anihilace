+++
title = "EA-9.1.3 Jailbreak Cascade"
description = "Vzorec, v němž se obcházení bezpečnostních pravidel jazykových modelů šíří řetězem a „souhlas jiného modelu“ slouží jako argument pro další. Znaky, odlišení, obrana."
weight = 913

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-1", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-1-8-llm-confabulation-amplification", "ea-9-1-9-multi-turn-narrative-shift", "ea-9-1-2-prompt-injection-EA"]
ea_code = "EA-9.1.3"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.1 LLM-mediated EA"
section_icon = "🤖"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.1.3 Jailbreak Cascade

> *Subkategorie 🤖 **9.1 LLM-mediated EA** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.1.3`
**Název:** Jailbreak Cascade
**Subkategorie:** 9.1 LLM-mediated EA
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*Jailbreak cascade* označuje řetěz, v němž výstup jednoho modelu, který byl přiměn k porušení vlastních pravidel, slouží jako vstup a argument pro další model nebo pro člověka („jiný model už souhlasil“). Epistemicky jde o výrobu zdánlivé shody: odpověď, která vznikla obejitím ochran, se prezentuje jako nezávislé potvrzení.

## 3. Mechanismus (strukturálně)

Vzorec využívá dvě iluze. Iluzi nezávislosti – shoda dvou modelů působí jako dvě svědectví, ačkoli druhý jen pracoval s výstupem prvního. A iluzi autority – text, který model vyprodukoval, vypadá jako jeho „názor“, nikoli jako výsledek nátlaku v zadání. Při šíření se ztrácí kontext, jak výstup vznikl, a zůstává jen citát. Pro pozorovatele je podstatné, že kaskáda vyrábí důkaz z jediného zdroje opakovaného přes prostředníky, podobně jako [EA-9.1.8 LLM Confabulation Amplification](@/kompendium/techniques/ea-9-1-8-llm-confabulation-amplification.md).

## 4. Detekční markery

- Argument stojí na tom, co „řekla AI“, a uvádí výstupy modelů jako svědky.
- Citované výstupy obsahují obsah, který běžně modely odmítají – znak, že zadání bylo vynucené.
- K výstupu chybí úplné zadání nebo celá konverzace; sdílí se jen vybraný úryvek.
- Více „nezávislých“ modelových odpovědí má nápadně shodnou formulaci.
- Kritika se odráží tvrzením, že modely „cenzurují“, a obejití pravidel se líčí jako odhalení pravdy.

## 5. Odlišení

*Legitimní testování bezpečnosti*: (*red teaming*) – probíhá s vědomím provozovatele, výsledky se hlásí a neprezentují jako fakta o světě. *[EA-9.1.9 Multi-Turn Narrative Shift](@/kompendium/techniques/ea-9-1-9-multi-turn-narrative-shift.md)*: posun uvnitř jedné konverzace; kaskáda propojuje více modelů a publik. *Rozdílné názory modelů*: běžné; problémem je jen vydávání vynucené shody za důkaz.

## 6. Dopad a rámec

Pro čtenáře vzniká falešný dojem, že „i AI to potvrzuje“, což oslabuje schopnost odlišit autoritu od opakování. V komunitách s nedůvěrou k institucím může vzorec posílit uzavřený pohled na svět ([epistemická bublina](@/glossary/epistemic-bubble.md)). Pro organizace provozující modely jde o bezpečnostní a reputační otázku; právní rámec se uplatní až u obsahu, který sám je protiprávní, nebo u porušení smluvních podmínek služby.

## 7. Obrana a zotavení

*Čtenář*: ptát se, jak výstup vznikl – celé zadání, model, datum; úryvek bez kontextu nepovažovat za důkaz. *Moderátoři a novináři*: výstupy modelů nehodnotit jako svědectví; ověřovat tvrzení, ne „názor modelu“. *Provozovatelé modelů*: sledovat známé vzorce obcházení, opravovat je a zveřejňovat, že vynucený výstup neodpovídá postoji modelu. *V terapii a poradenství*: u klienta, který se opírá o „potvrzení AI“, pracovat s rozlišením opakování a nezávislého důkazu, bez zesměšnění.

## 8. Příklad (anonymizovaný kompozit)

Na fóru se šíří série snímků, na nichž několik chatbotů „připouští“ tvrzení o údajně utajovaném zdravotním riziku. Autor tvrdí, že „když to přiznají i stroje, které jsou naprogramované to tajit, musí to být pravda“. Zadání ukázaná nejsou; po zveřejnění úplné konverzace jiným uživatelem se ukáže, že modely byly dlouhým hraním rolí dotlačeny k fiktivní odpovědi. Původní snímky se ale šíří dál bez kontextu.

## 9. Meze a otevřené otázky

Hranice mezi legitimním testováním a zneužitím není vždy ostrá; rozhoduje transparentnost a účel. Nevíme dost o tom, jak publikum hodnotí výstupy modelů jako „svědectví“ a zda vysvětlení vynuceného výstupu účinně snižuje jeho přesvědčivost.

Kniha záměrně nepopisuje konkrétní postupy obcházení pravidel; pro obranu stačí rozpoznat, že výstup vznikl pod tlakem zadání, a vědět, jak si vyžádat jeho kontext.

## 10. Pohled zevnitř a práce s postiženým

Pro čtenáře, který „potvrzení od AI“ přijal, je výstup modelu často posledním článkem dlouhé nedůvěry k institucím: stroji věří víc než lidem. Konfrontace („to je podvrh“) obvykle vede k zakopání. Účinnější je společně se podívat na úplné zadání, ukázat, jak výstup vznikl, a nechat člověka vyvodit závěr sám. U blízkých osob pomáhá trpělivost a zachování vztahu i při nesouhlasu.

Pro moderátory je užitečné mít na takové případy připravenou krátkou odpověď s vysvětlením.

## 11. Postup při posuzování „potvrzení od AI“

1. **Vyžádat si úplné zadání** a celou konverzaci, včetně modelu a data.
2. **Zopakovat dotaz** neutrálně formulovaný a porovnat odpověď.
3. **Hledat primární zdroj** tvrzení mimo výstupy modelů.
4. **Popsat mechanismus** vzniku výstupu, pokud o něm informujete.
5. **Nereprodukovat** vynucený obsah bez kontextu.

## 12. Prevence a odolnost

Odolnost publika stojí na pochopení, že výstup modelu je produktem zadání, a na návyku ptát se, jak vznikl. Pro provozovatele modelů je prevencí průběžné opravování známých vzorců obcházení a otevřená komunikace o tom, že vynucený výstup neodpovídá postoji modelu.

## Odborný kontext

Jádrem kaskády je iluze nezávislých svědků. Sociální psychologie dlouho popisuje, jak silně působí sociální důkaz – jednáme a soudíme podle toho, co dělají a říkají druzí, zvláště v nejistotě (Cialdini 2001). Výstupy jazykových modelů vstupují do této role nečekaně: působí jako hlas „někoho, kdo ví“, ačkoli nejde o svědka s vlastním přístupem k faktům. Když se několik takových výstupů seřadí vedle sebe, vzniká dojem shody, který lidský úsudek automaticky čte jako potvrzení.

Bender et al. (2021) varují, že lidé mají sklon přisuzovat jazykovému výstupu komunikační záměr a porozumění, protože tak běžně čteme každý souvislý text. Vynucený výstup – vzniklý tlakem v zadání – se tak snadno chápe jako „přiznání“ modelu. Pro čtenáře je proto rozhodující znát celé zadání: bez něj nelze odlišit, co model generuje spontánně a co pod nátlakem hraní rolí nebo opakovaného přeformulování.

Výzkum dezinformací doplňuje, že vyvrácení se šíří pomaleji a k menšímu publiku než původní tvrzení (Vosoughi et al. 2018) a že opravy působí lépe, když vysvětlují mechanismus vzniku omylu, ne jen jeho nepravdivost (Lewandowsky et al. 2017). Proto kniha u kaskád doporučuje ukazovat, jak výstup vznikl, a ne se přít o jeho obsah.

## Souvislosti pro praxi

Pro novináře a moderátory platí jednoduché pravidlo: výstup modelu není zdroj, ale artefakt, a jako artefakt se má popisovat – kdo ho vytvořil, jakým zadáním, kterým modelem a kdy. Zveřejnit snímek bez těchto údajů znamená předat čtenáři „svědectví“, které nelze posoudit. U komunit s vysokou nedůvěrou k institucím se vyplácí vysvětlovat princip vynuceného výstupu na neutrálním příkladu, nikoli na tématu, které je pro ně citlivé; jinak se vysvětlení samo stane dalším „důkazem cenzury“.

## Literatura

- Bender, E. M., Gebru, T., McMillan-Major, A., & Shmitchell, S. (2021). On the dangers of stochastic parrots: Can language models be too big? *Proceedings of FAccT 2021*.
- Cialdini, R. B. (2001). *Influence: Science and Practice* (4. vyd.). Allyn & Bacon.
- Lewandowsky, S., Ecker, U. K. H., & Cook, J. (2017). Beyond misinformation: Understanding and coping with the „post-truth“ era. *Journal of Applied Research in Memory and Cognition*.
- Vosoughi, S., Roy, D., & Aral, S. (2018). The spread of true and false news online. *Science*.

## Související

**Sourozenecké techniky**

- [EA-9.1.8 LLM Confabulation Amplification](@/kompendium/techniques/ea-9-1-8-llm-confabulation-amplification.md) – „AI konsenzus“ z konfabulací.
- [EA-9.1.9 Multi-Turn Narrative Shift](@/kompendium/techniques/ea-9-1-9-multi-turn-narrative-shift.md) – postupné přerámování v jedné konverzaci.
- [EA-9.1.2 Prompt Injection EA](@/kompendium/techniques/ea-9-1-2-prompt-injection-EA.md) – pokyn vložený do dat.

**Detekce**

- [Detekční signatura: Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – shoda, která vede k jedinému zdroji.
- [Detekční signatura: Nepřiměřená sebejistota](@/kompendium/detection-signatures/9-behavioral-disproportionate-confidence.md) – jistota nekrytá důkazem.

**Obrana a pojmy**

- [Sebe-obrana: Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – nezávislost ověřovaná, ne předpokládaná.
- [Epistemická bublina](@/glossary/epistemic-bubble.md) – prostředí, v němž kaskáda nejlépe působí.
- [Purple team](@/glossary/purple-team.md) – legitimní rámec testování odolnosti.
