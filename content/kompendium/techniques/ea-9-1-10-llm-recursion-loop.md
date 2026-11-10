+++
title = "EA-9.1.10 LLM Recursion Loop"
description = "Vzorec, v němž se generovaný obsah vrací do dat, z nichž se učí další modely, a chyby se tak fixují jako fakta („model collapse“). Znaky, odlišení, obrana."
weight = 920

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-1", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-1-1-llm-hallucination-laundering", "ea-9-1-8-llm-confabulation-amplification", "ea-9-2-3-synthetic-text-narrative"]
parent = "kompendium-techniques"
ea_code = "EA-9.1.10"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.1 LLM-mediated EA"
section_icon = "🤖"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.1.10 LLM Recursion Loop

> *Subkategorie 🤖 **9.1 LLM-mediated EA** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.1.10`
**Název:** LLM Recursion Loop
**Subkategorie:** 9.1 LLM-mediated EA
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*LLM recursion loop* je uzavřená smyčka, v níž obsah vytvořený jazykovými modely končí na webu a v databázích, odkud se stává tréninkovým nebo vyhledávacím materiálem pro další modely. Chyby, halucinace a zkreslení se tak nevytrácejí, ale fixují; v odborné literatuře se pro degradaci modelů učených na vlastních výstupech používá výraz *model collapse*.

## 3. Mechanismus (strukturálně)

Na rozdíl od ostatních technik subkategorie nevyžaduje smyčka žádného aktéra s úmyslem: stačí, že generovaný obsah není označen a mísí se s lidským. Epistemicky jde o ztrátu vazby na svět – informace přestávají pocházet z pozorování a stávají se odvozeninou odvozenin. Vzniká prostředí, v němž je stále těžší najít primární pramen, a dominantní formulace vytlačují méně častou, ale přesnější. Úmyslné zneužití smyčky (zaplavení webu obsahem, aby ho modely převzaly) navazuje na [EA-9.1.1 Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md) a na hromadnou produkci textu v [EA-9.2.3](@/kompendium/techniques/ea-9-2-3-synthetic-text-narrative.md).

## 4. Detekční markery

- Ve vyhledávání převažují texty se shodnou strukturou a formulacemi bez autora a data.
- Tvrzení je „všude“, ale žádný výskyt nevede k primárnímu prameni.
- Odpovědi modelů opakují chybu, která vznikla v nedávných generovaných textech.
- Méně častá, ale doložená fakta z odpovědí mizí ve prospěch „průměrné“ verze.
- Tematické weby a encyklopedie bez redakce rychle rostou bez odpovídající lidské práce.

## 5. Odlišení

*Šíření dezinformace lidmi*: má autory a šiřitele; smyčka může běžet i bez nich. *Zastarání znalostí*: model nezná nové údaje; zde zná staré údaje, ale zkreslené. *[EA-9.1.8 Confabulation Amplification](@/kompendium/techniques/ea-9-1-8-llm-confabulation-amplification.md)*: krátkodobé sdílení shody; smyčka je dlouhodobý proces v datech.

## 6. Dopad a rámec

Jde o riziko pro společnou informační infrastrukturu: encyklopedie, vyhledávače, odborné databáze. Dopad je rozptýlený a pomalý, a proto snadno přehlédnutelný. Rámcem obrany je správa dat – označování generovaného obsahu, evidence původu, archivy lidských pramenů – a regulace platforem ([Regulace platforem](@/kompendium/population-health/25-platform-regulation-EA.md)).

## 7. Obrana a zotavení

*Jednotlivec*: dávat přednost zdrojům s autorem, datem a redakcí; u důležitých témat hledat primární pramen ([Kurátorství zdrojů](@/kompendium/self-defense-guides/31-source-curation.md)). *Knihovny, archivy, redakce*: uchovávat a zpřístupňovat lidské prameny s doloženým původem. *Vývojáři modelů*: evidovat původ trénovacích dat a odlišovat generovaný obsah. *Vzdělávání*: učit rozdíl mezi „často opakovaným“ a „doloženým“.

## 8. Příklad (anonymizovaný kompozit)

Lokální historický spolek hledá údaje o budově z 19. století. Vyhledávač nabízí desítky stránek s téměř shodným textem, který uvádí chybné datum stavby a smyšleného architekta. Žádná stránka neuvádí autora ani pramen; všechny vznikly v posledních měsících. Chatbot na dotaz odpovídá stejnými údaji. Teprve archiv obce a stavební dokumentace potvrdí skutečné datum. Spolek opravu zveřejní, ale vyhledávač dál řadí generované stránky výš.

## 9. Meze a otevřené otázky

Rozsah, v jakém generovaný obsah už dnes ovlivňuje trénovací data, není spolehlivě změřen, a odhady se liší. Otevřené zůstává, zda půjde o pozvolnou degradaci, nebo o problém, který zvládnou filtry a označování. Pro knihu je podstatné, že smyčka mění podmínky ověřování: primární pramen je stále cennější a stále hůř dohledatelný. Pro jednotlivce z toho plyne praktický závěr – uchovávat si vlastní ověřené zdroje a nespoléhat na to, že pravdivá verze bude vždy nejvýše ve vyhledávání.

## 10. Pohled zevnitř a práce s postiženým

Smyčka nemá jednu oběť; zasahuje každého, kdo hledá informace. Typickým prožitkem je únava a rezignace („nedá se nic zjistit“), která vede buď k nekritickému přijímání první odpovědi, nebo k paušálnímu cynismu. Pedagogové, knihovníci a novináři mohou této únavě čelit tím, že nabídnou dostupné ověřené zdroje a ukážou, že dohledání primárního pramene je možné a zvládnutelné. Pro odborné komunity z toho plyne úkol: udržovat veřejně přístupné, redigované přehledy, které budou sloužit jako pevný bod i ve světě zaplaveném generovaným textem.

## 11. Postup při ověřování „všudypřítomného“ tvrzení

1. **Najít nejstarší výskyt** tvrzení a zjistit, zda má autora a datum.
2. **Hledat primární pramen** – archiv, úřední záznam, recenzovanou publikaci, přímého svědka.
3. **Porovnat formulace** výskytů; shodné věty bez autora naznačují generovaný původ.
4. **Ověřit u odborné instituce** nebo knihovny, pokud jde o důležité téma.
5. **Zaznamenat výsledek** a sdílet ho s odkazem na pramen, aby se ověřená verze dala najít.

## 12. Prevence a odolnost

Prevence na úrovni jednotlivce stojí na udržování vlastní sbírky spolehlivých zdrojů a na zvyku dohledávat primární prameny u témat, na nichž záleží. Na úrovni společnosti jde o podporu institucí, které primární prameny uchovávají a zpřístupňují – archivů, knihoven, redakcí s ověřovacími standardy –, a o pravidla, která vyžadují evidenci původu trénovacích dat a označování generovaného obsahu.

## Odborný kontext

Degradaci modelů učených na výstupech jiných modelů popsali Shumailov et al. (2024): při opakovaném tréninku na generovaných datech se ze sdělení postupně vytrácejí méně časté jevy a rozdělení dat se zužuje k „průměru“, až model ztrácí schopnost reprezentovat původní rozmanitost. Autoři tento proces nazvali *model collapse* a zdůraznili hodnotu dat, o nichž je doloženo, že pocházejí od lidí. Kniha z této práce přebírá obecný závěr; skutečný rozsah jevu na otevřeném webu zatím spolehlivě změřen není.

Epistemicky jde o ztrátu vazby informace na pozorování. Floridi (2014) popisuje informační prostředí jako infosféru, v níž lidé stále více žijí a rozhodují; její kvalita je proto otázkou veřejného zájmu podobně jako kvalita životního prostředí. Smyčka generovaného obsahu je v tomto pohledu formou znečištění, které se neprojeví náhle, ale postupnou ztrátou rozmanitosti a přesnosti.

Výzkum šíření informací dodává, že opakování zvyšuje přesvědčivost tvrzení bez ohledu na jeho pravdivost (Fazio et al. 2015). Ve světě, kde se tytéž formulace množí bez lidské práce, se tak „často opakované“ snadno zamění za „doložené“. Obranou jsou instituce, které udržují primární prameny – archivy, knihovny, redakce –, a čtenáři, kteří je umějí najít.

## Souvislosti pro praxi

Pro knihovny, školy a redakce plyne ze smyčky konkrétní úkol: udržovat a zpřístupňovat pečlivě vybrané sbírky zdrojů s doloženým původem a učit, jak se k primárním pramenům dostat. Pro vývojáře a provozovatele modelů je to otázka evidence původu dat a odlišení lidského a generovaného obsahu. Pro jednotlivce je nejpraktičtější rada nespoléhat na pořadí ve vyhledávání a u témat, na nichž záleží, si zapamatovat několik spolehlivých zdrojů, ke kterým se lze vracet.

## Literatura

- Fazio, L. K., Brashier, N. M., Payne, B. K., & Marsh, E. J. (2015). Knowledge does not protect against illusory truth. *Journal of Experimental Psychology: General*.
- Floridi, L. (2014). *The Fourth Revolution: How the Infosphere is Reshaping Human Reality*. Oxford University Press.
- Shumailov, I., Shumaylov, Z., Zhao, Y., Papernot, N., Anderson, R., & Gal, Y. (2024). AI models collapse when trained on recursively generated data. *Nature*.

## Související

**Sourozenecké techniky**

- [EA-9.1.1 LLM Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md) – jednotlivá halucinace na cestě ke „faktu“.
- [EA-9.1.8 LLM Confabulation Amplification](@/kompendium/techniques/ea-9-1-8-llm-confabulation-amplification.md) – shoda modelů jako zdánlivý důkaz.
- [EA-9.2.3 Synthetic Text Narrative](@/kompendium/techniques/ea-9-2-3-synthetic-text-narrative.md) – hromadná produkce textu.

**Detekce**

- [Detekční signatura: Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) – jeden původ za mnoha kanály.
- [Detekční signatura: Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – odkazy vedoucí samy na sebe.

**Obrana a politika**

- [Sebe-obrana: Kurátorství zdrojů](@/kompendium/self-defense-guides/31-source-curation.md) – výběr zdrojů s doloženým původem.
- [Regulace platforem](@/kompendium/population-health/25-platform-regulation-EA.md) – systémová odpověď.

**Teorie**

- [Floridi: Čtvrtá revoluce a infosféra](@/kompendium/07-teoreticke-reflexe/floridi-fourth-revolution.md) – informační prostředí jako životní prostor.
