+++
title = "EA-9.2.3 Synthetic Text Narrative"
description = "Vzorec, v němž hromadně generované články, příspěvky a recenze vytvářejí dojem širokého a nezávislého mínění, ačkoli pocházejí z jednoho zdroje. Znaky a obrana."
weight = 923

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-2", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-2-6-AI-news-cascade", "ea-9-1-10-llm-recursion-loop", "ea-9-4-2-coordinated-inauthentic-behavior", "ea-9-4-6-mass-comment-coordination"]
ea_code = "EA-9.2.3"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.2 Generativní média"
section_icon = "🎬"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.2.3 Synthetic Text Narrative

> *Subkategorie 🎬 **9.2 Generativní média** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.2.3`
**Název:** Synthetic Text Narrative
**Subkategorie:** 9.2 Generativní média
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*Synthetic text narrative* je ekosystém textů – článků, příspěvků, komentářů, recenzí – vytvořených jazykovými modely ve velkém počtu a s drobnými obměnami, publikovaných pod různými jmény a na různých místech. Výsledkem je zdání, že určitý názor nebo hodnocení sdílí mnoho nezávislých lidí („všichni říkají X“), ačkoli za ním stojí jediný zdroj.

## 3. Mechanismus (strukturálně)

Vzorec cílí na sociální důkaz: lidé odhadují, co je pravdivé nebo běžné, podle toho, kolik různých hlasů vidí. Generování textu snížilo cenu jednoho „hlasu“ téměř na nulu, a tak lze vyrobit množství, které dříve vyžadovalo organizovanou skupinu lidí. Texty se navzájem nemusejí citovat; stačí, že pokrývají prostor vyhledávání a diskusí. Jde o textovou obdobu [koordinovaného neautentického chování](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md) a o palivo pro [EA-9.2.6 AI News Cascade](@/kompendium/techniques/ea-9-2-6-AI-news-cascade.md).

## 4. Detekční markery

- Mnoho textů se shodnou strukturou argumentu, podobnými frázemi a stejnými příklady, jen v jiném pořadí.
- Autoři bez historie, bez fotografie nebo s generickou identitou; účty založené v krátkém období.
- Recenze s obecnou chválou nebo kritikou bez konkrétní zkušenosti s produktem či službou.
- Nápadné načasování: vlna textů v krátkém okně kolem události.
- Při dotazu na podrobnosti autoři neodpovídají nebo odpovídají opět obecně.

## 5. Odlišení

*Skutečná vlna mínění*: různé formulace, osobní zkušenosti, nesouhlas uvnitř skupiny, autoři s historií. *Organizovaná kampaň lidí*: legitimní, pokud je přiznaná (petice, výzva); neautentická, pokud se skrývá. *Obsahové farmy*: generují text kvůli reklamním příjmům, ne kvůli názoru; účinky se ale mohou překrývat.

## 6. Dopad a rámec

Vzorec zkresluje vnímání veřejného mínění, poškozuje konkurenty falešnými recenzemi a zahlcuje prostor tak, že autentické hlasy zanikají ([firehose of falsehood](@/glossary/firehose-of-falsehood.md)). Právně se mohou uplatnit pravidla nekalé soutěže a ochrany spotřebitele (falešné recenze) a pravidla platforem o neautentickém chování. Pro výzkum veřejného mínění z online dat znamená vzorec zásadní zkreslení vzorku.

## 7. Obrana a zotavení

*Čtenář*: hodnotit kvalitu, ne množství; hledat konkrétní zkušenosti a autory s ověřitelnou historií. *Platformy a e-shopy*: ověřovat nákup u recenzí, sledovat shluky podobných textů a nových účtů. *Výzkumníci a novináři*: nepoužívat počet příspěvků jako měřítko mínění bez kontroly autenticity ([Detekce botů v OSINT](@/kompendium/cross-domain/6-ea-osint-bot-detection.md)). *Organizace*: sledovat náhlé vlny textů o sobě a reagovat věcně, ne protikampaní.

## 8. Příklad (anonymizovaný kompozit)

Malá kavárna dostane během týdne desítky jednohvězdičkových recenzí, které popisují „hrubou obsluhu a špinavé nádobí“ podobnými slovy. Účty jsou nové, bez dalších recenzí. Majitelka shluk nahlásí platformě s přehledem dat a formulací; část recenzí platforma odstraní. Místní zákazníci mezitím přidají vlastní hodnocení. Původ kampaně zůstane neznámý.

## 9. Meze a otevřené otázky

Rozpoznání generovaných textů podle stylu je nespolehlivé a jednotlivý text nelze s jistotou označit. Spolehlivější jsou síťové znaky – časování, účty, infrastruktura. Otevřenou otázkou je, jak měřit veřejné mínění online, když podíl generovaných textů není znám.

Kniha proto neuvádí odhady podílu generovaných textů v online diskusích; dostupná čísla se liší podle metody a platformy řádově.

Pro výzkum je otevřená i otázka, jak odlišit koordinovanou syntetickou vlnu od přirozené mobilizace skutečných lidí, kteří sdílejí šablonu výzvy.

## 10. Pohled zevnitř a práce s postiženým

Kdo se ocitne v cíli vlny negativních textů, zažívá pocit, že „všichni jsou proti mně“, a může začít pochybovat o vlastní práci nebo názoru. Pomáhá ukázat strukturu vlny – kolik účtů, odkud, jak podobných – a vrátit člověka k hodnocení od lidí, které zná. Pro čtenáře, který vlně uvěřil, je užitečné vysvětlit, že vnímání „většiny“ online lze levně vyrobit.

U drobných podnikatelů má vlna falešných recenzí i ekonomický dopad, který zvyšuje stres; pomáhá praktická podpora při komunikaci s platformou a s věrnými zákazníky.

## 11. Vztah k ostatním kategoriím EA

V kapitole 2 odpovídá vzorci [EA-2.1.9 Pseudo-konsenzus vytvoření](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md), kde se zdání shody vyrábí v odborném prostředí; generovaný text ho přenáší do veřejného prostoru. Zahlcení množstvím souvisí s [EA-1.1.2 Informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md): pravdivé hlasy nezmizí, ale ztratí se.

## 12. Postup při podezření na syntetickou vlnu textů

1. **Shromáždit vzorek** textů s daty, autory a místy zveřejnění.
2. **Porovnat strukturu** argumentů, frází a příkladů napříč texty.
3. **Prověřit účty** – datum založení, historii, propojení.
4. **Nahlásit vzorec** platformě nebo provozovateli recenzí jako celek, ne jednotlivě.
5. **Reagovat věcně** jedním kanálem; nevstupovat do protikampaně.

## 13. Prevence a odolnost

Odolnost čtenářů roste s pochopením, že množství hlasů online lze levně vyrobit, a s návykem hodnotit obsah podle doložitelné zkušenosti a identity autora, nikoli podle počtu podobných textů. Pro platformy je prevencí ověřování autenticity účtů a recenzí, pro výzkum metodická opatrnost při práci s daty ze sítí a pro instituce věcná a jednotná komunikace, která nevstupuje do soutěže v objemu.

## Odborný kontext

Sociální důkaz – úsudek podle toho, co si myslí a dělají druzí – je jedním z nejsilnějších mechanismů vlivu (Cialdini 2001). Hromadně generovaný text ho padělá levněji než kdykoli dříve. Goldman (2001) upozornil, že shoda mnoha hlasů má důkazní hodnotu jen tehdy, jsou-li hlasy na sobě nezávislé; syntetický ekosystém textů tuto podmínku zásadně porušuje, protože mnoho hlasů má jednoho autora.

Paul a Matthews (2016) popsali model propagandy založený na objemu, rychlosti a opakování, nikoli na konzistenci; generování textu tento model zlevňuje a zpřístupňuje i malým aktérům. Efekt iluzorní pravdy vysvětluje, proč opakované setkání s týmž tvrzením v různých formulacích zvyšuje jeho přesvědčivost (Fazio et al. 2015). Shumailov et al. (2024) navíc ukázali, že generovaný obsah, který se vrací do trénovacích dat, ochuzuje rozmanitost budoucích modelů – syntetický ekosystém tak poškozuje i nástroje, jimiž ho chceme odhalovat.

Pro detekci z toho plyne, že spolehlivější než posuzování jednotlivých textů jsou síťové znaky: časování, účty, infrastruktura a podobnost argumentační struktury napříč texty.

## Souvislosti pro praxi

Pro výzkumníky veřejného mínění a novináře, kteří pracují s daty ze sociálních sítí, je nezbytné před analýzou očistit vzorek o neautentické účty a uvádět, jak to udělali. Pro e-shopy a platformy s recenzemi je účinné vázat recenzi na ověřený nákup. Pro firmy a obce, které čelí vlně negativních textů, je užitečné reagovat věcně, jedním kanálem, a nevstupovat do protikampaně, která by vzorec jen zesílila.

## Literatura

- Cialdini, R. B. (2001). *Influence: Science and Practice* (4. vyd.). Allyn & Bacon.
- Fazio, L. K., Brashier, N. M., Payne, B. K., & Marsh, E. J. (2015). Knowledge does not protect against illusory truth. *Journal of Experimental Psychology: General*.
- Goldman, A. I. (2001). Experts: Which ones should you trust? *Philosophy and Phenomenological Research*.
- Paul, C., & Matthews, M. (2016). *The Russian „Firehose of Falsehood“ [Propaganda](@/glossary/propaganda.md) Model*. RAND Corporation.
- Shumailov, I. et al. (2024). AI models collapse when trained on recursively generated data. *Nature*.

## Související

**Sourozenecké techniky**

- [EA-9.2.6 AI News Cascade](@/kompendium/techniques/ea-9-2-6-AI-news-cascade.md) – generované „zpravodajství“, které se vzájemně cituje.
- [EA-9.1.10 LLM Recursion Loop](@/kompendium/techniques/ea-9-1-10-llm-recursion-loop.md) – návrat generovaného textu do dat modelů.
- [EA-9.4.2 Coordinated Inauthentic Behavior](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md) – obecný rámec neautentického chování.
- [EA-9.4.6 Mass Comment Coordination](@/kompendium/techniques/ea-9-4-6-mass-comment-coordination.md) – hromadné komentáře.

**Detekce**

- [Detekční signatura: Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) – mnoho hlasů, jeden původ.
- [Detekce botů v OSINT](@/kompendium/cross-domain/6-ea-osint-bot-detection.md) – síťové znaky neautenticity.

**Pojmy a obrana**

- [Firehose of falsehood](@/glossary/firehose-of-falsehood.md) – zahlcení množstvím.
- [Sebe-obrana: Kurátorství zdrojů](@/kompendium/self-defense-guides/31-source-curation.md) – výběr hlasů s doloženou identitou.
