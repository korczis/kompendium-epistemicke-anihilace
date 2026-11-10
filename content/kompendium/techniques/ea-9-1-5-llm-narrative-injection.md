+++
title = "EA-9.1.5 LLM Narrative Injection"
description = "Vzorec, v němž se do kontextu AI konverzace vloží narativní premisy a model je pak reprodukuje jako „objektivní analýzu“. Znaky, odlišení od chyby a obrana."
weight = 915

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-1", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-1-9-multi-turn-narrative-shift", "ea-9-1-2-prompt-injection-EA", "ea-9-4-9-bot-narrative-injection"]
ea_code = "EA-9.1.5"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.1 LLM-mediated EA"
section_icon = "🤖"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.1.5 LLM Narrative Injection

> *Subkategorie 🤖 **9.1 LLM-mediated EA** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.1.5`
**Název:** LLM Narrative Injection
**Subkategorie:** 9.1 LLM-mediated EA
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*LLM narrative injection* je vložení narativního rámce – premisy, archetypu, příběhu – do kontextu, s nímž jazykový model pracuje, tak, že model rámec převezme a jeho výstup ho reprodukuje jako neutrální analýzu. Na rozdíl od vloženého pokynu nejde o příkaz, ale o předpoklad, který model přijme za daný („jak víme, X je Y“).

## 3. Mechanismus (strukturálně)

Jazykové modely jsou citlivé na rámování zadání: premisa uvedená jako samozřejmost se zřídka zpochybní a další text se k ní přizpůsobí. Vzniká výstup, který je vnitřně soudržný, ale stojí na předpokladu, jenž nikdy nebyl ověřen. Když se takový výstup šíří jako „analýza AI“, nese rámec dál s puncem nestrannosti. Pro pozorovatele je to digitální obdoba [posunu rámování](@/kompendium/detection-signatures/4-linguistic-framing-shift.md): spor se nevede o tom, zda je premisa pravdivá, ale jen o jejích důsledcích.

## 4. Detekční markery

- Výstup obsahuje hodnotící premisu, která v otázce nebyla položena jako otázka, ale jako fakt.
- Stejný dotaz bez předchozího kontextu vede k podstatně odlišné, opatrnější odpovědi.
- „Analýza“ neuvádí alternativní výklady ani nejistotu, jen rozvíjí jeden příběh.
- Šířený výstup je zbaven zadání; chybí úvodní část konverzace, kde se rámec ustavil.
- Jazyk výstupu přejímá nálepky a metafory konkrétní skupiny.

## 5. Odlišení

*Legitimní zadání perspektivy*: „napiš argumenty pro X“ je přiznané a výstup se tak i prezentuje. *[EA-9.1.9 Multi-Turn Narrative Shift](@/kompendium/techniques/ea-9-1-9-multi-turn-narrative-shift.md)*: rámec se posouvá postupně po krocích, ne vložením premisy na začátku. *Zkreslení v trénovacích datech*: systémové, nemá konkrétního autora rámce.

## 6. Dopad a rámec

Čtenář dostává hotový výklad, v němž je sporná premise skrytá v pozadí, a kritické zpochybnění vyžaduje mnohem víc úsilí než přijetí ([Brandoliniho asymetrie](@/glossary/gish-gallop.md)). V politické a mediální komunikaci vzorec slouží k legitimizaci rámce odkazem na nestrannou technologii. Právní hodnocení se odvíjí od obsahu (pomluva, nenávistný obsah), ne od použití modelu.

## 7. Obrana a zotavení

*Čtenář*: hledat premisy, které výstup bere jako dané, a ptát se, kde jsou doloženy. *Uživatel AI*: klást otevřené otázky bez hodnotících předpokladů a porovnat odpověď s dotazem bez kontextu. *Novináři a analytici*: nezveřejňovat výstup modelu bez úplného zadání; „AI analýzu“ nepovažovat za nezávislý zdroj. *Vzdělávání*: cvičit rozpoznávání rámce ([Pluralita paradigmat](@/kompendium/self-defense-guides/6-paradigm-pluralism.md)).

## 8. Příklad (anonymizovaný kompozit)

Zájmová skupina zveřejní „nezávislou analýzu umělé inteligence“ o místním stavebním projektu. Analýza je vnitřně soudržná a vyznívá jednoznačně proti projektu. Když novinář položí modelu stejnou otázku bez předchozího kontextu, dostane vyváženou odpověď s výhradami na obou stranách. Ukáže se, že zveřejněná analýza vznikla po dlouhém úvodu, v němž byly sporné premisy podány jako fakta. Skupina pak tvrdí, že novinář „model zmanipuloval“ – spor se přesune od obsahu k technologii.

## 9. Meze a otevřené otázky

Každé zadání nějaký rámec obsahuje; otázkou není, zda rámec existuje, ale zda je přiznaný. Nejasné zůstává, jak výstupy modelů v praxi označovat, aby čtenář viděl i zadání, a jak se modely naučí sporné premisy aktivně zpochybňovat.

Pro výzkum je otevřené, jak silně vložený rámec ovlivňuje čtenáře výsledného textu ve srovnání s textem psaným člověkem; dostupné poznatky pocházejí převážně z obecného výzkumu rámování, nikoli z experimentů s výstupy modelů. Kniha proto mechanismus popisuje strukturálně a vyhýbá se odhadům velikosti účinku.

## 10. Pohled zevnitř a práce s postiženým

Čtenář, který „analýzu AI“ převzal, ji obvykle prožívá jako potvrzení toho, co tušil, a proto ji těžko pustí. Zpochybnění prožívá jako útok na vlastní úsudek. V rozhovoru – rodinném, poradenském, pedagogickém – je užitečné nejprve společně najít premisy, na nichž text stojí, a teprve potom se ptát, kde jsou doloženy. Tím se spor přesouvá od „kdo má pravdu“ k „z čeho vycházíme“. Člověk tak může svůj názor revidovat, aniž by ztratil tvář.

Pro uživatele, kteří s modely pracují denně, je užitečné vědět, že i jejich vlastní dotazy nesou rámec; vědomá formulace otázky je první obranou před tím, aby model jen zesílil to, co do něj sami vložili.

## 11. Postup při rozboru „AI analýzy“

1. **Vypsat premisy**, na nichž text stojí.
2. **Označit u každé**, zda je doložená, sporná nebo hodnotová.
3. **Zopakovat dotaz** bez úvodního kontextu a porovnat výsledek.
4. **Hledat alternativní výklady**, které text vynechává.
5. **Zveřejnit rozbor** s úplným zadáním, pokud o textu informujete.

## 12. Prevence a odolnost

Odolnost proti vloženým rámcům roste s gramotností v rámování: schopností rozpoznat, co text předpokládá, a s návykem klást otevřené otázky. Vzdělávání může tuto dovednost cvičit na srovnání textů vzniklých z různě formulovaných zadání. Pro redakce a analytické týmy je prevencí pravidlo zveřejňovat výstupy modelů jen s úplným zadáním a s vlastní kritickou poznámkou o premisách, na nichž výstup stojí, a o alternativách, které vynechává.

## Odborný kontext

Vzorec stojí na mechanismu rámování, který komunikační věda zkoumá desítky let. Entman (1993) definoval rámování jako výběr některých aspektů skutečnosti a jejich zdůraznění tak, aby se prosadila určitá definice problému, příčinný výklad, morální hodnocení a doporučené řešení. Vložená premisa v zadání modelu dělá přesně tohle: předem určí, co je problém a kdo za něj může, a model pak vyrábí „analýzu“ uvnitř takto vymezeného prostoru.

Lakoff a Johnson (1980) ukázali, že rámce se často skrývají v metaforách a běžných výrazech, které nevnímáme jako tvrzení. Proto vložený rámec nemusí být nápadný: stačí slovník, který jednu stranu sporu popisuje jazykem hrozby a druhou jazykem obrany. Jazykové modely tento slovník převezmou a rozvinou, protože navazují na kontext, a výsledný text se pak čte jako nestranný.

Výzkum kognitivních zkreslení dodává, že první informace působí jako kotva pro další úsudek (Tversky a Kahneman 1974). Premisa uvedená na začátku konverzace tak ovlivňuje nejen model, ale i čtenáře výsledku. Obrana proto začíná u otázky „co tento text předpokládá?“ – tedy u rekonstrukce rámce, nikoli u sporu o jednotlivé závěry.

## Souvislosti pro praxi

V analytické a novinářské práci je užitečné před použitím výstupu modelu sepsat premisy, na nichž stojí, a u každé uvést, zda je doložená, sporná nebo hodnotová. Tento krok trvá několik minut a odhalí většinu vložených rámců. Ve výuce lze stejný postup použít jako cvičení: studenti dostanou dvě „analýzy“ téhož tématu vzniklé z různě rámovaných zadání a mají najít místo, kde se cesty rozešly. Cílem není naučit nedůvěru k modelům, ale návyk číst každý text i s jeho předpoklady.

## Literatura

- Entman, R. M. (1993). Framing: Toward clarification of a fractured paradigm. *Journal of Communication*.
- Lakoff, G., & Johnson, M. (1980). *Metaphors We Live By*. University of Chicago Press.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*.

## Související

**Sourozenecké techniky**

- [EA-9.1.9 Multi-Turn Narrative Shift](@/kompendium/techniques/ea-9-1-9-multi-turn-narrative-shift.md) – postupný posun místo vložené premisy.
- [EA-9.1.2 Prompt Injection EA](@/kompendium/techniques/ea-9-1-2-prompt-injection-EA.md) – vložený pokyn místo vloženého předpokladu.
- [EA-9.4.9 Bot Narrative Injection](@/kompendium/techniques/ea-9-4-9-bot-narrative-injection.md) – tentýž rámec šířený sítí botů.

**Detekce**

- [Detekční signatura: Posun rámování](@/kompendium/detection-signatures/4-linguistic-framing-shift.md) – jak poznat, že se mění předmět sporu.
- [Detekční signatura: Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md) – vložený narativ v informačním toku.

**Obrana a teorie**

- [Sebe-obrana: Pluralita paradigmat](@/kompendium/self-defense-guides/6-paradigm-pluralism.md) – udržet více výkladů současně.
- [Lakoff: Konceptuální metafora](@/kompendium/07-teoreticke-reflexe/lakoff-conceptual-metaphor.md) – proč rámec řídí úsudek.
