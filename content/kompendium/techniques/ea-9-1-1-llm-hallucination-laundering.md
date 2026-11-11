+++
title = "EA-9.1.1 LLM Hallucination Laundering"
description = "Vzorec, v němž se smyšlené tvrzení jazykového modelu („halucinace“) šíří přes snímky obrazovky a citace, až působí jako doložený fakt. Znaky, odlišení, obrana."
weight = 911

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-1", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-1-8-llm-confabulation-amplification", "ea-9-1-10-llm-recursion-loop", "ea-9-1-6-llm-source-attribution-bypass"]
ea_code = "EA-9.1.1"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.1 LLM-mediated EA"
section_icon = "🤖"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.1.1 LLM Hallucination Laundering

> *Subkategorie 🤖 **9.1 LLM-mediated EA** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.1.1`
**Název:** LLM Hallucination Laundering
**Subkategorie:** 9.1 LLM-mediated EA
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High

## 2. Definice

*Hallucination laundering* („praní halucinací“) je vzorec, v němž tvrzení vygenerované velkým jazykovým modelem (LLM) bez opory ve zdrojích projde řetězem přenosů – snímek obrazovky, citace v článku, odkaz v diskusi, další dotaz na model – a na jeho konci vystupuje jako ověřený fakt. Klíčové je, že původ v halucinaci se při každém přenosu ztrácí a přibývá zdánlivé autority.

## 3. Mechanismus (strukturálně)

Vzorec spojuje dvě slabiny. První je vlastnost modelu: LLM generuje plynulý a sebejistý text i tam, kde nemá data, a vymyšlená jména, čísla nebo citace nevypadají jinak než pravdivé. Druhá je sociální: lidé přebírají výstup modelu jako „zjištění AI“ a přestávají se ptát po primárním zdroji. Jakmile tvrzení vyjde na veřejnosti, může se vrátit do korpusů, z nichž další modely čerpají (viz [EA-9.1.10 LLM Recursion Loop](@/kompendium/techniques/ea-9-1-10-llm-recursion-loop.md)), a z původní chyby se stane kruhově potvrzovaný „konsenzus“. Strukturálně jde o variantu [cirkulárního argumentu](@/glossary/cirkularni-argumentace.md), v níž je kruh skrytý za řetězem prostředníků.

## 4. Detekční markery

- Tvrzení se odvolává na „AI“, „ChatGPT říká“ nebo snímek konverzace, ne na primární pramen.
- Citace, DOI nebo URL neexistují, vedou jinam, nebo autor existuje, ale dílo s daným názvem ne.
- Řetězec odkazů se při zpětném dohledávání uzavírá do kruhu a končí opět u výstupu modelu.
- Podrobnosti jsou nečekaně konkrétní (přesná čísla, data, jména), ale v oboru o nich nikdo neví.
- Zpochybnění se odbývá poukazem na technologii („model to přece ví“), ne na důkaz.

## 5. Odlišení

*Poctivý omyl při použití AI*: uživatel chybu po upozornění uzná a opraví; u laundering vzorce se chyba dál šíří i po vyvrácení. *Klasická dezinformace*: lidský autor tvrzení vymyslí záměrně; zde vzniká bez autora a „autoritu“ mu propůjčuje technologie. *[EA-9.1.6 Source Attribution Bypass](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md)*: tam jde o vymyšlenou citaci k jinak existující tezi, zde o vymyšlenou tezi samotnou.

## 6. Dopad a rámec

U jednotlivce vzorec oslabuje [kalibraci důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md): když se ukáže, že „ověřený fakt“ byl výmysl, často nenásleduje opatrnost, ale paušální nedůvěra ke všem zdrojům. V odborném prostředí (posudky, výzkum, žurnalistika) vede k nepoužitelným podkladům a k reputační škodě. Právně se vzorec obvykle posuzuje až podle následku – jako šíření nepravdivého údaje, poškození pověsti nebo vadné odborné dílo; samotné použití modelu protiprávní není.

## 7. Obrana a zotavení

*Jednotlivec*: každé tvrzení z modelu považovat za hypotézu, dokud nenajde primární zdroj; ověřit existenci citace dřív než její obsah ([Verifikace tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md)). *Redakce, výzkum, soudní znalci*: zákaz citovat výstup modelu jako pramen, povinnost uvést, kde byl model použit, a evidence ověření každého údaje. *Platformy a provozovatelé modelů*: označování generovaného obsahu, viditelné upozornění na nejistotu a zpětná vazba na opakovaně šířené smyšlenky. *Po zjištění*: opravu publikovat tam, kde se tvrzení šířilo, a pojmenovat mechanismus, aby se z chyby nestala obecná nedůvěra.

## 8. Příklad (anonymizovaný kompozit)

V diskusní skupině rodičů se objeví snímek konverzace s chatbotem, podle něhož „studie univerzity z roku 2019“ prokázala škodlivost běžné látky v potravinách. Snímek převezme regionální web, článek pak cituje blog s odkazem na web a po několika týdnech odpovídá na dotaz jiný model s odkazem na blog. Dohledání ukáže, že studie s uvedeným názvem neexistuje a citovaný autor se tématem nikdy nezabýval. Oprava se ale dostane k malé části čtenářů; zbytek si pamatuje „prokázaný fakt“.

## 9. Meze a otevřené otázky

Ne každé chybné tvrzení s původem v AI je laundering: rozhodující je, zda se šíří dál i po vyvrácení a zda se jeho původ zakrývá. Otevřenou otázkou je, jak rychle se smyšlenky dostávají do trénovacích dat dalších modelů a jak účinné je označování generovaného obsahu – spolehlivá data o tom zatím chybějí.

## 10. Pohled zevnitř a práce s postiženým

Člověk, který smyšlený údaj převzal a šířil, se po odhalení často cítí zahanbeně a vysmátý. Typickou reakcí je obrana („všichni to psali“) nebo naopak přepad do nedůvěry ke všemu. Profesionál – učitel, terapeut, redaktor – pomůže nejvíc, když oddělí chybu od osoby, pojmenuje mechanismus a nabídne jednoduchý návyk ověřování místo poučování.

## Odborný kontext

Výzkum zpracování přirozeného jazyka označuje plynulý, ale věcně nepodložený výstup modelu jako halucinaci a rozlišuje halucinace, které odporují vstupu, od těch, které si vymýšlejí informace mimo něj (Ji et al. 2023). Pro tuto techniku je podstatná druhá skupina: model generuje jména, čísla a citace podle toho, jak „obvykle vypadají“, a forma tak přestává být vodítkem k pravdivosti. Bender et al. (2021) upozorňují, že jazykové modely reprodukují statistické vzorce textu bez vazby na význam a svět, a varují právě před tím, že lidé jejich výstupu přisuzují záměr a znalost, které model nemá.

Sociální část vzorce dobře popisuje výzkum šíření dezinformací. Vosoughi, Roy a Aral (2018) na rozsáhlém vzorku ukázali, že nepravdivé zprávy se na sociální síti šíří rychleji a dál než pravdivé, převážně díky lidem, nikoli botům; novost a emoční náboj sdělení hrají větší roli než jeho původ. Opakované setkání s tvrzením navíc zvyšuje jeho přesvědčivost i u lidí, kteří by správnou odpověď znali – tzv. efekt iluzorní pravdy (Fazio et al. 2015). Praní halucinace tedy nepotřebuje přesvědčit nikoho naráz; stačí, že se tvrzení opakuje v různých podobách.

Pro obranu z toho plyne, že vyvracet jednotlivé smyšlenky je méně účinné než budovat návyk ověřování u zdroje. Wineburg a McGrew (2019) ukázali na profesionálních ověřovatelích faktů, že ti nečtou podezřelý zdroj do hloubky, ale okamžitě opouštějí stránku a hledají, co o zdroji říkají jiní („laterální čtení“). Tento postup je přímo použitelný i na výstupy jazykových modelů.

## Souvislosti pro praxi

Pro redakce, výzkumné týmy a soudní znalce je užitečné rozlišovat dvě otázky, které se v praxi slévají: zda tvrzení pochází z výstupu modelu, a zda je pravdivé. První otázka se týká procesu a lze ji řešit pravidly (evidence použití nástrojů, zákaz citovat model jako pramen), druhá se týká obsahu a vyžaduje ověření u primárního zdroje. Kde se tyto otázky smíchají, vzniká buď nekritické přejímání („AI to našla“), nebo paušální odmítání všeho, s čím model pracoval – obojí je chybou.

## Literatura

- Bender, E. M., Gebru, T., McMillan-Major, A., & Shmitchell, S. (2021). On the dangers of stochastic parrots: Can language models be too big? *Proceedings of FAccT 2021*.
- Fazio, L. K., Brashier, N. M., Payne, B. K., & Marsh, E. J. (2015). Knowledge does not protect against illusory truth. *Journal of Experimental Psychology: General*.
- Ji, Z. et al. (2023). Survey of hallucination in natural language generation. *ACM Computing Surveys*.
- Vosoughi, S., Roy, D., & Aral, S. (2018). The spread of true and false news online. *Science*.
- Wineburg, S., & McGrew, S. (2019). Lateral reading and the nature of expertise. *Teachers College Record*.

## Související

**Sourozenecké techniky**

- [EA-9.1.8 LLM Confabulation Amplification](@/kompendium/techniques/ea-9-1-8-llm-confabulation-amplification.md) – shoda více modelů vydávaná za konsenzus.
- [EA-9.1.10 LLM Recursion Loop](@/kompendium/techniques/ea-9-1-10-llm-recursion-loop.md) – návrat halucinací do trénovacích dat.
- [EA-9.1.6 LLM Source Attribution Bypass](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md) – vymyšlené zdroje k tezi.

**Detekce**

- [Detekční signatura: Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – jak poznat kruh odkazů.
- [Detekční signatura: Reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md) – přenos autority přes prostředníky.

**Obrana**

- [Sebe-obrana: Detekce AI obsahu](@/kompendium/self-defense-guides/40-ai-content-detection.md) – praktické znaky generovaného textu.
- [Sebe-obrana: Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – ověření nezávislými prameny.

**Kontext**

- [EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md) – kapitola, do níž kategorie 9 patří.
