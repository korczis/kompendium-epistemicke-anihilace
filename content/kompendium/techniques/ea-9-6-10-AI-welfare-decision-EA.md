+++
title = "EA-9.6.10 AI Welfare Decision EA"
description = "Vzorec automatizace v sociálních dávkách – odhalování podvodů, hodnocení nároku –, kde chybné označení spustí zastavení podpory a člověk se měsíce brání proti systému."
weight = 970

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-6", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-6-1-algorithmic-decision-bias", "ea-9-6-2-AI-judgment-laundering", "ea-9-6-5-AI-credit-scoring-bias", "ea-9-6-9-AI-immigration-decision"]
ea_code = "EA-9.6.10"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.6 Algoritmická governance"
section_icon = "⚖️"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.6.10 AI Welfare Decision EA

> *Subkategorie ⚖️ **9.6 Algoritmická governance** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.6.10`
**Název:** AI Welfare Decision EA
**Subkategorie:** 9.6 Algoritmická governance
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*AI welfare decision EA* označuje automatizované systémy v sociálním zabezpečení – odhalování podvodů, hodnocení nároku, výpočet přeplatků –, jejichž chybné výsledky mají pro příjemce dávek vážné následky. Označení „podezřelý“ může spustit zastavení dávek nebo vymáhání dluhu; lidský přezkum přichází až po odvolání, často za měsíce. Zátěž dokazování se přesouvá na lidi s nejmenšími prostředky.

## 3. Mechanismus (strukturálně)

Sociální systémy jsou pod tlakem šetřit a odhalovat zneužití; automatizace slibuje obojí. Systém však pracuje s neúplnými a proměnlivými daty o lidech v nestabilních situacích (nepravidelné příjmy, změny bydliště, složité rodiny), a nepravidelnost čte jako podezření. Doložené případy ukazují rozsah možné škody: australský program automatického vymáhání přeplatků Robodebt, jehož metodu průměrování příjmů vyšetřovala královská komise (zpráva 2023), a nizozemská aféra s přídavky na péči o děti (toeslagenaffaire), kvůli níž v lednu 2021 podala demisi vláda. Epistemickým jádrem je obrácení důkazního břemene: systém „ví“, člověk musí dokázat opak.

## 4. Detekční markery

- Hromadná zastavení dávek nebo výzvy k vrácení přeplatků bez individuálního posouzení.
- Zdůvodnění typu „nesrovnalost v údajích“ bez konkrétního vysvětlení.
- Postižení jsou nadměrně lidé s nepravidelnými příjmy, migranti, samoživitelé.
- Odvolání trvá měsíce, během nichž příjemce nemá prostředky.
- Instituce brání systém navzdory rostoucímu počtu úspěšných odvolání.

## 5. Odlišení

*Oprávněná kontrola*: individuální, s možností vysvětlení před zásahem. *Administrativní chyba*: jednotlivá, rychle opravitelná. *[EA-9.6.5 AI Credit Scoring Bias](@/kompendium/techniques/ea-9-6-5-AI-credit-scoring-bias.md)*: soukromé úvěry; zde veřejná podpora, na níž závisí základní existence.

## 6. Dopad a rámec

Chybná automatizace v dávkách může vést k chudobě, ztrátě bydlení, zadlužení, zhoršení zdraví a v nejtěžších případech k tragédiím. Rámcem je správní právo (odůvodnění rozhodnutí, právo být slyšen), GDPR (automatizované rozhodování) a akt o umělé inteligenci, který řadí systémy pro posuzování nároku na veřejné dávky a služby mezi vysoce rizikové.

## 7. Obrana a zotavení

*Příjemce dávek*: okamžitě podat odvolání a požádat o odklad; vyhledat bezplatnou poradnu; uchovávat všechny doklady. *Sociální pracovníci a poradny*: pomáhat s odvoláním, dokumentovat vzorce, předávat je ombudsmanovi. *Úřady*: před zásahem vždy umožnit vysvětlení; nezastavovat dávky jen na základě skóre. *Novináři a výzkumníci*: sledovat výsledky systémů a jejich dopady.

## 8. Příklad (anonymizovaný kompozit)

Samoživitelka s nepravidelnými příjmy z brigád dostane oznámení o zastavení příspěvku na bydlení kvůli „nesrovnalostem v příjmech“. Odvolání trvá tři měsíce; mezitím se zadluží u nebankovní společnosti. Sociální pracovnice jí pomůže doložit příjmy a odhalí, že systém porovnával měsíční příjmy s ročním průměrem. Příspěvek je obnoven; poradna předá desítky podobných případů ombudsmanovi.

## 9. Meze a otevřené otázky

Kontrola zneužívání dávek je legitimní; problémem je způsob a nastavení. Otevřenou otázkou je, jak vyvážit efektivitu kontroly s právem na důstojné zacházení a jak zajistit, aby úspora na kontrole nebyla vykoupena škodou na nejzranitelnějších.

## 10. Pohled zevnitř a práce s postiženým

Příjemce dávek označený za „podvodníka“ prožívá stud, strach a bezmoc; často se stydí o tom mluvit. Dlouhodobý stres může vést k úzkosti a depresi. Pomáhá věcné vysvětlení, že jde o chybu systému, praktická pomoc s odvoláním a ochrana před dalšími škodami (dluhy, ztráta bydlení).

## 11. Vztah k ostatním kategoriím EA

Vzorec je nejzřetelnějším případem [EA-9.6.1](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md) v sociální oblasti a navazuje na [EA-9.6.2](@/kompendium/techniques/ea-9-6-2-AI-judgment-laundering.md) – politické rozhodnutí šetřit se skrývá za „technickou“ kontrolou. Teoretický rámec dodává [Nussbaumová: Capabilities approach](@/kompendium/07-teoreticke-reflexe/nussbaum-capabilities.md).

## 12. Otázky pro rozhovor a šetření

- Jaké oznámení jste dostali a s jakým zdůvodněním?
- Měli jste možnost vysvětlit situaci před zastavením dávky?
- Jak dlouho trvá odvolání a z čeho mezitím žijete?
- Znáte další lidi se stejnou zkušeností?
- Jaké doklady o příjmech a situaci máte?

## 13. Postup pro profesionály

1. **Sociální pracovník:** okamžitě pomoci s odvoláním a odkladem; zajistit krizovou pomoc.
2. **Právník poradny:** posoudit zákonnost postupu a právo být slyšen.
3. **Ombudsman nebo dohledový orgán:** shromažďovat podněty a posoudit systém.
4. **Úřad:** zavést pravidlo lidského posouzení před zásahem a rychlý přezkum.
5. **Terapeut:** podpořit klienta ve zvládání stresu a studu.

## 14. Prevence a odolnost

Prevence stojí na pravidle, že žádná dávka se nezastaví bez individuálního posouzení a možnosti vysvětlení, na testování systémů před nasazením, na transparentnosti a na dostupnosti bezplatného poradenství. Veřejné instituce by měly brát vážně rostoucí počet úspěšných odvolání jako varovný signál.

## 15. Typický průběh

Systém se zavede s cílem odhalit zneužití a ušetřit. Hromadná oznámení přijdou tisícům lidí. Většina nemá prostředky se bránit a část zaplatí „dluhy“, které nedluží. Poradny a novináři zaznamenávají vzorec; instituce systém brání. Teprve soudní rozhodnutí, zpráva ombudsmana nebo vyšetřovací komise vedou k zastavení a k – často pomalému a neúplnému – odškodnění.

## 16. Dokumentace a důkazy

Postižení by měli uchovávat všechna oznámení, výpisy příjmů, doklady o situaci a záznamy komunikace s úřadem. Pro systémové doložení je klíčové shromáždění podobných případů a statistiky úspěšnosti odvolání.

## Odborný kontext

Eubanks (2018) na třech amerických případech – automatizovaném posuzování nároku na dávky, koordinovaném systému pro bezdomovce a prediktivním modelu ohrožení dětí – ukázala, že digitální nástroje v sociálním systému často nevznikají jako neutrální technologie, ale jako pokračování dlouhé historie kontroly chudých, a nazvala je „digitálním chudobincem“. Její analýza vysvětluje, proč se chyby těchto systémů hromadí u lidí, kteří jsou nejvíc sledováni a mají nejmenší prostor se bránit.

Australský program Robodebt a nizozemská aféra s přídavky na péči o děti jsou evropsky a globálně nejznámějšími doklady toho, jaký rozsah může škoda mít, když automatizované označení vede k zásahu bez individuálního posouzení; v obou případech následovala oficiální vyšetřování a politické důsledky. Kniha je uvádí jako doložené události, bez dalších podrobností, které by nemohla ověřit. Teoretický rámec dodává Nussbaumová (2011): sociální podpora není laskavost, ale podmínka, aby člověk mohl uplatňovat základní lidské schopnosti; automatizace, která ji odebírá na základě podezření, zasahuje do samotné možnosti důstojného života.

## Souvislosti pro praxi

Sociální pracovníci a poradny jsou často prvním místem, kde se systémová chyba projeví, protože k nim přicházejí lidé s nesrozumitelnými oznámeními. Vyplácí se proto vést jednoduchou evidenci podobných případů – datum, typ oznámení, zdůvodnění, výsledek odvolání – a pravidelně ji předávat ombudsmanovi nebo vedení úřadu. Takto sebraná data mají větší váhu než jednotlivé stížnosti a umožňují doložit vzorec dřív, než se z něj stane aféra. Pro úřady je užitečné sledovat podíl úspěšných odvolání jako ukazatel kvality systému, nikoli jako administrativní zátěž.

## Literatura

- Eubanks, V. (2018). *Automating Inequality: How High-Tech Tools Profile, Police, and Punish the Poor*. St. Martin's Press.
- Nussbaum, M. C. (2011). *Creating Capabilities: The Human Development Approach*. Harvard University Press.
- O'Neil, C. (2016). *Weapons of Math Destruction*. Crown.

## Související

**Sourozenecké techniky**

- [EA-9.6.1 Algorithmic Decision Bias](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md) – obecný vzorec.
- [EA-9.6.2 AI Judgment Laundering](@/kompendium/techniques/ea-9-6-2-AI-judgment-laundering.md) – politické rozhodnutí skryté za systémem.
- [EA-9.6.5 AI Credit Scoring Bias](@/kompendium/techniques/ea-9-6-5-AI-credit-scoring-bias.md) – soukromá obdoba.
- [EA-9.6.9 AI Immigration Decision](@/kompendium/techniques/ea-9-6-9-AI-immigration-decision.md) – zranitelní žadatelé.

**Teorie a politika**

- [Nussbaumová: Capabilities approach](@/kompendium/07-teoreticke-reflexe/nussbaum-capabilities.md) – co lidé potřebují k důstojnému životu.
- [Rámec veřejné politiky EA](@/kompendium/population-health/21-EA-public-policy-framework.md) – systémová odpověď.

**Obrana a pojmy**

- [Sebe-obrana: Mobilizace podpory](@/kompendium/self-defense-guides/30-support-mobilization.md) – hledání pomoci.
- [Epistemická nespravedlnost](@/glossary/epistemicka-injustice.md) – obrácené důkazní břemeno.
