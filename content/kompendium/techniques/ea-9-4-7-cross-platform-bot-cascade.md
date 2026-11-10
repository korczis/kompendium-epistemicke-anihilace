+++
title = "EA-9.4.7 Cross-Platform Bot Cascade"
description = "Vzorec, v němž síť botů přenáší tentýž obsah s drobnými úpravami z platformy na platformu, takže se zdá nezávisle potvrzený v různých prostředích. Znaky a obrana."
weight = 947

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-4", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-4-1-bot-amplification-coordinated", "ea-9-4-8-real-time-bot-response", "ea-9-3-7-platform-coordinated-attack", "ea-9-2-6-AI-news-cascade"]
parent = "kompendium-techniques"
ea_code = "EA-9.4.7"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.4 Bot networks"
section_icon = "🕸️"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.4.7 Cross-Platform Bot Cascade

> *Subkategorie 🕸️ **9.4 Bot networks** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.4.7`
**Název:** Cross-Platform Bot Cascade
**Subkategorie:** 9.4 Bot networks
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*Cross-platform bot cascade* je řetězové šíření obsahu sítí automatizovaných účtů napříč platformami: obsah se objeví na jedné síti, boti ho přenesou do diskusních vláken jiné, vloží do skupin třetí a převedou do formátu krátkého videa na čtvrté. Každý přenos obsah mírně upraví, aby odpovídal prostředí, a výsledkem je dojem, že téma „žije“ všude nezávisle.

## 3. Mechanismus (strukturálně)

Uživatelé pohybující se na více platformách vnímají výskyt tématu v různých prostředích jako potvrzení jeho významu a pravdivosti. Platformy přitom vidí jen vlastní výsek a nemají přehled o koordinaci jinde, takže každá posuzuje „svou“ část jako běžný obsah. Kaskáda tak využívá mezery mezi platformami. Na rozdíl od [EA-9.3.7](@/kompendium/techniques/ea-9-3-7-platform-coordinated-attack.md), kde se obsah objeví všude najednou, kaskáda postupuje v krocích a každý krok se opírá o předchozí („už se o tom mluví na…“).

## 4. Detekční markery

- Tentýž obrázek, citát nebo video se postupně objevuje na platformách s odkazem na „předchozí“ výskyt.
- Účty, které obsah přenášejí, jsou nové a aktivní na více platformách se stejnými jmény nebo portréty.
- Úpravy jsou formální (formát, délka), ne obsahové; chybí vlastní komentář.
- Časová posloupnost výskytů je pravidelná a rychlá.
- Na každé platformě obsah začíná šířit malý okruh účtů, teprve pak se přidávají skuteční uživatelé.

## 5. Odlišení

*Přirozené přelévání obsahu*: lidé sdílejí, co viděli jinde, ale s vlastními komentáři a v nepravidelném čase. *[EA-9.3.7 Platform Coordinated Attack](@/kompendium/techniques/ea-9-3-7-platform-coordinated-attack.md)*: synchronní výskyt; kaskáda je postupná. *Oficiální komunikace na více kanálech*: transparentní původce na všech platformách.

## 6. Dopad a rámec

Kaskáda umožňuje obejít moderaci jedné platformy (obsah odstraněný na jedné přežívá jinde) a vytváří dojem širokého zájmu. Rámcem obrany je spolupráce platforem, výzkumníků a novinářů a regulace velkých platforem; v bezpečnostním kontextu sdílení poznatků o hrozbách.

Pro organizace, o nichž kaskáda šíří nepravdivé informace, je klíčové reagovat na všech platformách, kde se obsah objevil, a odkazovat na jeden ověřený zdroj. Pro média je důležité sledovat cestu obsahu, ne jen jeho poslední výskyt, a uvádět ji v článku, aby čtenáři viděli, že „všudypřítomné“ tvrzení má jediný původ.

## 7. Obrana a zotavení

*Uživatel*: výskyt na více platformách není nezávislé potvrzení; dohledat první zdroj. *Novináři a analytici*: mapovat cestu obsahu napříč platformami ([Triangulace napříč zdroji v OSINT](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md)). *Platformy*: sdílet poznatky o kaskádách při ochraně soukromí. *Organizace*: sledovat zmínky o sobě napříč platformami a reagovat na zdroj, ne na každou kopii.

## 8. Příklad (anonymizovaný kompozit)

Zmanipulovaný graf o kriminalitě se objeví na mikroblogu, o den později v diskusním vláknu s odkazem „už to sdílejí všichni“, poté ve skupinách sociální sítě a nakonec jako krátké video s komentářem syntetického hlasu. Statistický úřad graf vyvrátí na svém webu, ale vyvrácení se šíří jen na jedné platformě. Výzkumná skupina zmapuje cestu grafu a ukáže, že všechny první výskyty pocházejí z účtů téže sítě.

## 9. Meze a otevřené otázky

Sledování obsahu napříč platformami je technicky a právně náročné a výzkumníci mají k datům omezený přístup. Otevřenou otázkou je, jak umožnit takový výzkum a zároveň chránit soukromí uživatelů.

Kniha neuvádí čísla o četnosti kaskád napříč platformami; dostupné jsou hlavně analýzy jednotlivých případů.

Otevřené zůstává i to, jak koordinovat reakci platforem bez vytvoření centralizovaného systému, který by sám mohl být zneužit k umlčování; kniha tuto otázku spojuje s rizikem popsaným v [EA-9.6.4](@/kompendium/techniques/ea-9-6-4-AI-deplatforming-cascade.md).

## 10. Pohled zevnitř a práce s postiženým

Uživatel, který obsah potkal na několika místech, si je jistý, že „to přece není výmysl“. Vysvětlení má největší šanci, když společně dohledáme první výskyt. Pro cíl kaskády je náročné, že vyvrácení na jedné platformě nestačí; pomáhá mít jeden ověřený kanál, na který lze odkazovat.

Pro organizaci, kterou kaskáda poškodila, je zátěží i to, že oprava musí probíhat všude současně; pomáhá koordinace komunikace a jasný jeden zdroj pravdy. Pro jednotlivce, kteří obsah v dobré víře sdíleli, je užitečné vědět, jak kaskáda funguje, aby se příště mohli zeptat po původním zdroji.

Další otázkou je, jak dlouho mají platformy uchovávat data potřebná k zpětnému zmapování kaskády.

Kniha tuto otázku nechává otevřenou.

## 11. Vztah k ostatním kategoriím EA

Kaskáda je technickou podobou cirkulárního ověřování, které popisuje [Detekční signatura: Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md), a nosičem [EA-9.2.6 AI News Cascade](@/kompendium/techniques/ea-9-2-6-AI-news-cascade.md).

## 12. Postup při mapování kaskády

1. **Najít první výskyt** obsahu a zaznamenat čas.
2. **Sledovat přechody** mezi platformami s odkazy a časy.
3. **Prověřit účty**, které obsah přenášejí – jména, portréty, stáří.
4. **Porovnat úpravy** obsahu mezi platformami.
5. **Zveřejnit mapu cesty** a upozornit platformy.

## 13. Prevence a odolnost

Prevence stojí na publiku, které výskyt na více platformách nepovažuje za nezávislé potvrzení, na spolupráci platforem při sdílení poznatků a na organizacích, které reagují na zdroj, ne na každou kopii.

Pro veřejnost je užitečný zvyk dohledat původní zdroj, kdykoli se tvrzení objevuje na mnoha místech současně a nikde neuvádí, odkud pochází.

## 14. Otázky pro rozhovor a šetření

- Kde jste obsah viděli poprvé a kde potom?
- Odkazují výskyty na sebe navzájem?
- Přenášejí obsah tytéž účty na různých platformách?
- Přidávají šiřitelé vlastní komentář, nebo jen přenášejí?
- Kde lze najít původní zdroj?

## Odborný kontext

Výzkum informačních operací ukazuje, že obsah se šíří přes ekosystémy platforem a médií, v nichž se jednotlivé kanály navzájem posilují (Benkler, Faris a Roberts 2018). Starbird, Arif a Wilson (2019) popsali, že strategické operace využívají přechody mezi platformami a že každá platforma vidí jen svou část, což ztěžuje odhalení. Ferrara et al. (2016) upozornili, že boti mohou napodobovat lidské chování na více platformách současně.

Goldman (2001) vysvětlil, proč výskyt v různých prostředích působí přesvědčivě: zdá se, že jde o nezávislé zdroje. Kaskáda tuto heuristiku zneužívá stejně jako cirkulární citace. Wardle a Derakhshan (2017) proto doporučují sledovat cestu sdělení, nejen jeho obsah – u kaskád je cesta nejsilnějším důkazem koordinace.

## Souvislosti pro praxi

Pro výzkumníky je klíčový přístup k datům více platforem a spolupráce s novináři, kteří mohou cestu obsahu zdokumentovat. Pro instituce, jejichž data byla zkreslena (statistické úřady, nemocnice), je užitečné mít vlastní kanály na více platformách, aby se oprava šířila stejnými cestami jako kaskáda.

## Literatura

- Benkler, Y., Faris, R., & Roberts, H. (2018). *Network [Propaganda](@/glossary/propaganda.md)*. Oxford University Press.
- Ferrara, E., Varol, O., Davis, C., Menczer, F., & Flammini, A. (2016). The rise of social bots. *Communications of the ACM*.
- Goldman, A. I. (2001). Experts: Which ones should you trust? *Philosophy and Phenomenological Research*.
- Starbird, K., Arif, A., & Wilson, T. (2019). Disinformation as collaborative work. *Proceedings of the ACM on Human-Computer Interaction (CSCW)*.

## Související

**Sourozenecké techniky**

- [EA-9.4.1 Bot Amplification Coordinated](@/kompendium/techniques/ea-9-4-1-bot-amplification-coordinated.md) – zesílení na jedné platformě.
- [EA-9.4.8 Real-Time Bot Response](@/kompendium/techniques/ea-9-4-8-real-time-bot-response.md) – rychlá reakce botů na událost.
- [EA-9.3.7 Platform Coordinated Attack](@/kompendium/techniques/ea-9-3-7-platform-coordinated-attack.md) – synchronní varianta.
- [EA-9.2.6 AI News Cascade](@/kompendium/techniques/ea-9-2-6-AI-news-cascade.md) – generované zpravodajství.

**Detekce a metody**

- [Detekční signatura: Platformní koordinace](@/kompendium/detection-signatures/21-network-platform-coordination.md) – stopy koordinace.
- [Triangulace napříč zdroji v OSINT](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) – mapování cesty obsahu.

**Obrana**

- [Sebe-obrana: Rutina cross-source](@/kompendium/self-defense-guides/36-cross-source-routine.md) – nezávislost zdrojů.
