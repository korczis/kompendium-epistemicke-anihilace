+++
title = "EA-9.1.8 LLM Confabulation Amplification"
description = "Vzorec, v němž se podobné konfabulace více jazykových modelů sdílejí jako „AI konsenzus“, ačkoli jde o tutéž chybu opakovanou bez nezávislého zdroje. Znaky a obrana."
weight = 918

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-1", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-1-1-llm-hallucination-laundering", "ea-9-1-3-jailbreak-cascade", "ea-9-1-10-llm-recursion-loop", "ea-1-2-2-falesna-ekvivalence"]
parent = "kompendium-techniques"
ea_code = "EA-9.1.8"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.1 LLM-mediated EA"
section_icon = "🤖"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.1.8 LLM Confabulation Amplification

> *Subkategorie 🤖 **9.1 LLM-mediated EA** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.1.8`
**Název:** LLM Confabulation Amplification
**Subkategorie:** 9.1 LLM-mediated EA
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*Confabulation amplification* je zesílení konfabulací jazykových modelů opakováním a sdílením: tentýž dotaz se položí více modelům nebo opakovaně jednomu, podobné smyšlené odpovědi se posbírají a prezentují jako „shoda nezávislých AI“. Nezávislost je přitom zdánlivá – modely sdílejí trénovací data, podobné architektury i stejné mezery ve znalostech.

## 3. Mechanismus (strukturálně)

Lidský úsudek zachází se shodou více zdrojů jako se silným důkazem, protože předpokládá jejich nezávislost. U modelů tento předpoklad neplatí: chyba, kterou vyvolá stejně formulovaná otázka, se v podobné podobě objeví u více systémů. Vzorec tedy využívá heuristiku „víc hlasů = vyšší pravděpodobnost“ tam, kde hlasy nejsou svědky, ale ozvěnou. Podobný princip popisuje [Detekční signatura: Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md): mnoho kanálů, jeden původ.

## 4. Detekční markery

- Argument se opírá o počet modelů, které „to potvrdily“, nikoli o zdroj tvrzení.
- Odpovědi modelů mají podobné formulace, stejnou strukturu a stejné neověřitelné detaily.
- Žádná z odpovědí neodkazuje na ověřitelný primární pramen.
- Neuvádí se, jak byly dotazy formulovány; obměna otázky vede k jiným odpovědím.
- Nejistota, kterou modely samy uvádějí, je při sdílení vypuštěna.

## 5. Odlišení

*Skutečný konsenzus*: shoda nezávislých zdrojů s vlastním přístupem k datům (měření, archivy, svědci). *[EA-9.1.3 Jailbreak Cascade](@/kompendium/techniques/ea-9-1-3-jailbreak-cascade.md)*: shoda vynucená obcházením pravidel; zde vzniká „spontánně“ z podobných mezer. *[EA-9.1.1 Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md)*: přenos jedné halucinace řetězem; zde souběh mnoha podobných.

## 6. Dopad a rámec

Vzorec posiluje falešnou jistotu u témat, kde je poctivá odpověď „nevíme“. Pro veřejnou debatu je nebezpečný tím, že „konsenzus AI“ se může stavět proti konsenzu odborníků a vytvářet dojem rovnocenného sporu ([falešná ekvivalence](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md)). Právní rámec je zde okrajový; jde především o otázku mediální a informační gramotnosti.

## 7. Obrana a zotavení

*Čtenář*: ptát se, zda zdroje mají nezávislý přístup k faktům; počet modelů nic nedokládá. *Uživatel AI*: obměňovat otázku, žádat zdroje a ověřit je; brát vážně, když model uvádí nejistotu. *Novináři a pedagogové*: vysvětlovat, proč shoda modelů není nezávislé svědectví ([Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)). *Odborná komunita*: veřejně uvádět, kde je odpověď skutečně nejistá, aby prázdné místo nezaplnila [konfabulace](@/glossary/konfabulace.md).

## 8. Příklad (anonymizovaný kompozit)

Influencer zveřejní video, v němž položí pěti různým chatbotům otázku na údajné vedlejší účinky doplňku stravy. Čtyři odpovědi zmiňují podobnou „studii“ a podobné procento. Video slaví úspěch s heslem „pět AI se shoduje“. Lékařka v komentáři upozorní, že studie neexistuje, a vysvětlí, že modely trénované na podobných datech chybují podobně. Její komentář má zlomek dosahu původního videa; část diváků ale začne otázku formulovat jinak a dostává rozdílné odpovědi.

## 9. Meze a otevřené otázky

Shoda modelů může být i správná – u dobře zdokumentovaných faktů je to běžné. Problém nastává tam, kde shoda nahrazuje zdroj. Zatím chybí srozumitelný způsob, jak veřejnosti ukázat míru nezávislosti modelů a míru jejich nejistoty v konkrétní odpovědi.

Pro výzkum je otevřené, jak publikum vnímá shodu modelů ve srovnání se shodou lidských expertů, a zda vysvětlení společného původu dat skutečně snižuje přesvědčivost „AI konsenzu“. Dostupné poznatky pocházejí převážně z obecného výzkumu sociálního důkazu a oprav dezinformací.

## 10. Pohled zevnitř a práce s postiženým

Člověk, který „konsenzu AI“ uvěřil, obvykle nejedná naivně: uplatňuje rozumnou heuristiku, že shoda více zdrojů je silnější než jeden zdroj. Vysvětlení by proto mělo heuristiku respektovat a doplnit ji o otázku nezávislosti – kdo z těch „hlasů“ měl vlastní přístup k faktům? Pro učitele a lékaře je užitečné mít připravený jednoduchý příklad, na němž lze shodu modelů a absenci zdroje ukázat během několika minut. Takové vysvětlení bývá přijato lépe než obecné varování před umělou inteligencí.

Pro novináře platí, že „shoda modelů“ není zpráva; zprávou může být jen to, co doloží nezávislé zdroje s vlastním přístupem k faktům, a to je třeba v textu jasně odlišit.

Pro odborníky je vhodné odpovídat věcně a s odkazem na zdroje, nikoli výsměchem.

## 11. Postup při posuzování „shody modelů“

1. **Zjistit formulaci dotazů**, které výstupy vyvolaly.
2. **Obměnit otázku** a sledovat, zda se odpovědi mění.
3. **Požádat o zdroje** a ověřit je.
4. **Hledat nezávislé lidské zdroje** s vlastním přístupem k faktům.
5. **Vysvětlit společný původ** modelů, pokud o shodě informujete.

## 12. Prevence a odolnost

Odolnost stojí na pochopení, proč shoda modelů není nezávislým svědectvím, a na návyku požadovat zdroj. Vzdělávání může vysvětlovat princip společného původu dat na jednoduchých příkladech. Odborná komunita může předcházet konfabulacím tím, že poctivě a srozumitelně komunikuje, kde je odpověď nejistá, a provozovatelé modelů tím, že nejistotu v odpovědích zviditelní místo toho, aby ji skrývali za plynulý text.

## Odborný kontext

Váha, kterou připisujeme shodě více zdrojů, má racionální jádro: nezávislá svědectví se potvrzují. Goldman (2001) však upozorňuje, že shoda má důkazní hodnotu jen tehdy, když zdroje skutečně nejsou na sobě závislé – když každý má vlastní přístup k faktům a nepřebírá názor jiného. Jazykové modely trénované na podobných datech tuto podmínku nesplňují; jejich shoda je bližší ozvěně jednoho korpusu než souhlasu nezávislých svědků.

Psychologie přidává, že lidé nezávislost zdrojů často neposuzují a reagují na počet hlasů. Efekt iluzorní pravdy ukazuje, že opakované vystavení tvrzení zvyšuje jeho přesvědčivost i u lidí, kteří mají správné znalosti (Fazio et al. 2015). Video či příspěvek, který ukazuje pět modelů s podobnou odpovědí, kombinuje oba mechanismy – zdánlivou nezávislost a opakování.

Z výzkumu oprav dezinformací vyplývá, že účinná oprava nevyvrací jen konkrétní údaj, ale nabízí alternativní vysvětlení, proč omyl vznikl (Lewandowsky et al. 2017). U „AI konsenzu“ je takovým vysvětlením právě společný původ modelů a jejich společné mezery ve znalostech; pochopení této struktury chrání lépe než varování před konkrétní smyšlenkou.

## Souvislosti pro praxi

Učitelé, lékaři a knihovníci se s „AI konsenzem“ setkávají v přímém rozhovoru a nemají čas na rozsáhlé vysvětlování. Osvědčuje se nabídnout jednoduchý test: položit modelu tutéž otázku jinými slovy, požádat o zdroj a zdroj otevřít. Většina konfabulací se při tomto postupu sama rozpadne a člověk dojde k závěru sám, což je účinnější než přesvědčování. Pro odborné společnosti je užitečné zveřejňovat srozumitelné přehledy témat, kde odpověď skutečně není známa, aby měli lidé k dispozici poctivé „nevíme“.

## Literatura

- Fazio, L. K., Brashier, N. M., Payne, B. K., & Marsh, E. J. (2015). Knowledge does not protect against illusory truth. *Journal of Experimental Psychology: General*.
- Goldman, A. I. (2001). Experts: Which ones should you trust? *Philosophy and Phenomenological Research*.
- Lewandowsky, S., Ecker, U. K. H., & Cook, J. (2017). Beyond misinformation: Understanding and coping with the „post-truth“ era. *Journal of Applied Research in Memory and Cognition*.

## Související

**Sourozenecké techniky**

- [EA-9.1.1 LLM Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md) – jedna halucinace přenesená řetězem.
- [EA-9.1.3 Jailbreak Cascade](@/kompendium/techniques/ea-9-1-3-jailbreak-cascade.md) – vynucená shoda modelů.
- [EA-9.1.10 LLM Recursion Loop](@/kompendium/techniques/ea-9-1-10-llm-recursion-loop.md) – konfabulace fixovaná v datech.

**Detekce**

- [Detekční signatura: Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) – mnoho kanálů, jeden původ.
- [Detekční signatura: Asymetrie amplifikace](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md) – zesílení bez odpovídající opory.

**Obrana a pojmy**

- [Sebe-obrana: Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – ověření nezávislosti.
- [EA-1.2.2 Falešná ekvivalence](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md) – „AI konsenzus“ proti odbornému konsenzu.
- [Pluralita signálů](@/glossary/signal-plurality.md) – proč je důležitá nezávislost zdrojů.
