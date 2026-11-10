+++
title = "Detekční signatura: Cirkularita citací"
description = "Síťová signatura: zdroje se navzájem citují tak, že tvrzení vypadá mnohonásobně doložené, ačkoli při sledování odkazů vede k jedinému nebo žádnému původnímu dokladu."
weight = 18

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["16-behavioral-emotional-modulation", "17-network-source-monoculture", "19-network-amplification-asymmetry", "2-linguistic-circular-definitions"]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Cirkularita citací nastává, když tvrzení získává zdánlivou oporu tím, že se na něj odkazuje mnoho zdrojů, které však při sledování citací vedou jeden k druhému nebo k jedinému původnímu zdroji – a ten často sám žádný doklad neobsahuje. Množství odkazů vytváří dojem nezávislého potvrzení, které ve skutečnosti neexistuje.

Je to síťová obdoba lingvistické signatury [cirkulárních definic](@/kompendium/detection-signatures/2-linguistic-circular-definitions.md). V odborné literatuře se podobný jev popisuje jako „efekt Woozle“ (tvrzení, které se citováním stává „faktem“) a v internetové kultuře jako *citogenesis* – kdy nepodložené tvrzení z encyklopedie převezme médium a médium je pak citováno jako zdroj pro encyklopedii. V kontextu AI systémů jej zachycuje technika [EA-9.1.1 LLM Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md).

## Co signatura indikuje

Lidé i instituce posuzují spolehlivost tvrzení podle počtu a kvality zdrojů, které ho podporují. Tento postup předpokládá, že zdroje jsou **nezávislé**. Cirkularita tento předpoklad zneužívá nebo nevědomky porušuje: deset článků, které všechny vycházejí z téhož blogového příspěvku, nemají větší váhu než ten příspěvek sám. Přesto působí jako deset potvrzení.

Pro manipulaci je cirkularita způsob, jak „vyprat“ nepodložené tvrzení do zdánlivého konsenzu – souvisí s technikou [EA-2.1.9 Pseudo-konsenzus vytvoření](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md). Cirkularita však často vzniká i bez úmyslu, z pracovní rutiny, kdy se zdroje přebírají bez ověření.

## Pozorovatelné markery

### Obsahové a lingvistické

- Stejné číslo, citát nebo formulace se objevuje v mnoha zdrojích bez uvedení původu nebo s odkazem „podle zpráv“.
- Původní zdroj je vágní („studie ukázala“, „odborníci tvrdí“) a nelze ho dohledat.
- V pozdějších zdrojích tvrzení „ztrácí“ původní výhrady a zpřesňuje se.

### Síťové a časové

- Graf citací tvoří smyčku nebo hvězdu s jedním středem, z něhož nevede žádný odkaz k primárnímu dokladu.
- Zdroje, které tvrzení přebírají, vznikají v krátkém čase po sobě.
- Primární zdroj je časově mladší, než by odpovídalo tvrzení o jeho „dlouhodobém“ doložení.

### Aktérské a institucionální

- Zdroje sdílejí autory, vydavatele nebo financování (srov. [monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md)).
- Instituce ve svých dokumentech citují vzájemně svá stanoviska bez odkazu na data.
- V akademickém prostředí skupina autorů tvoří citační kartel, v němž se tvrzení navzájem potvrzují.

## Detekční kritéria

1. Tvrzení je podporováno více zdroji.
2. Při sledování citací ke zdroji primárního dokladu se všechny cesty sbíhají k jednomu bodu, tvoří smyčku, nebo končí bez dokladu.
3. Zdroje nepřiznávají, že přebírají tvrzení od sebe, a prezentují se jako nezávislá potvrzení.

Pozitivní při splnění všech tří bodů. Míra závažnosti roste, pokud je tvrzení použito k rozhodnutí o lidech (hodnocení, vyloučení, obvinění).

## Odlišení od benigních podob

- **Přebírání ověřených zpráv**: zpravodajská média přebírají zprávy agentur; pokud otevřeně uvádějí původ a agentura má ověřený zdroj, nejde o signaturu.
- **Shrnutí literatury**: přehledové články citují primární studie; cirkularita nastává, až když citují jen jiné přehledy.
- **Zavedená fakta**: některá fakta se citují bez odkazu, protože jsou obecně ověřená a ověřitelná.
- **Vědecké školy** se přirozeně citují více navzájem; rozdíl je v tom, zda existují primární data a zda jsou přístupná.

## Dopad na jednotlivce a klinický rozměr

Jednotlivce cirkularita zasahuje dvojím způsobem. Jako **čtenáře** ho vede k přesvědčení, že tvrzení je dobře doložené, a k nedůvěře vůči tomu, kdo ho zpochybňuje. Jako **cíl** ho může zasáhnout, když o něm koluje nepodložené tvrzení, které se „potvrzuje“ citováním (pomluva, falešná obvinění). Člověk, o němž se takové tvrzení šíří, prožívá bezmoc: každé vyvrácení musí čelit „mnoha zdrojům“.

Pokud osoba uvádí, že o ní kolují nepravdy citované z jednoho zdroje na druhý, je třeba ji brát vážně a ověřit to. Rozlišení od paranoidních obav spočívá v tom, že cirkularitu lze doložit konkrétními odkazy; paranoidní přesvědčení se obvykle opírá o nejasné náznaky a rozšiřuje se na další osoby a situace.

## Riziko falešné pozitivity

- Nedostupnost primárního zdroje (placené databáze, uzavřené archivy) může vypadat jako jeho neexistence.
- Odborné obory s malým počtem specialistů se nutně citují navzájem.
- Hodnotitel může cirkularitu vidět jen u tvrzení, která se mu nelíbí; test je nutné aplikovat symetricky.

## Validační test

**Trasování k primárnímu dokladu.** Pro sporné tvrzení se postupně sleduje každý odkaz až k místu, kde se tvrzení poprvé objevilo, a zapisuje se: kdo, kdy, s jakým dokladem. Výsledkem je strom citací. Pokud strom končí v jediném bodě bez dokladu nebo tvoří smyčku, je signatura potvrzena. Pro trasování v digitálním prostředí lze využít archivní služby a časová razítka. Metodicky viz [EA × OSINT: Source Credibility](@/kompendium/cross-domain/1-ea-osint-source-credibility.md).

## Dokumentace v praxi

Uchovat kopie všech zdrojů ve stromu citací s datem a URL, pokud možno archivovanou verzi. Zapsat, kde byl primární doklad hledán a s jakým výsledkem. U forenzního použití dodržet [chain of custody](@/glossary/chain-of-custody.md) a zásady [elektronických důkazů](@/kompendium/forensic-legal/35-electronic-evidence-EA.md).

## Doporučený postup

**Pro zasaženou osobu (čtenáře):** u důležitých tvrzení se ptát „odkud to původně je?“ a nepočítat zdroje, ale nezávislé doklady. Viz [ověřování tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md).

**Pro osobu, o níž se tvrzení šíří:** dokumentovat výskyty, dohledat první zdroj a požádat o opravu u zdrojů, které jsou ochotny ji provést; u pomluvy zvážit právní kroky (viz [pomluva v EA kontextu](@/kompendium/forensic-legal/14-defamation-EA.md)). Pečovat o duševní zdraví – boj s cirkulující pomluvou bývá vyčerpávající.

**Pro profesionála a organizaci:** u rozhodnutí opřených o externí informace vyžadovat dohledání primárního zdroje; v redakcích a výzkumu zavést pravidlo „dva nezávislé doklady“.

## Ilustrativní příklad

*Anonymizovaný kompozit.* V oborové diskusi koluje tvrzení, že určitá terapeutická metoda má „prokázanou účinnost u většiny pacientů“. Tvrzení cituje několik webů, dvě knihy a přednáška. Doktorandka při psaní přehledu sleduje odkazy: weby citují knihy, knihy citují jedna druhou a přednášku, přednáška odkazuje na nepublikovaný „interní průzkum“ autora metody. Primární data neexistují. Doktorandka v přehledu tvrzení uvede jako nedoložené a popíše strom citací.

## Limity a otevřené otázky

- Trasování je časově náročné a u masově šířených tvrzení prakticky nemožné bez automatizace.
- Odkazy na smazané nebo změněné stránky ztěžují rekonstrukci.
- Nejednoznačná je hranice mezi legitimním převzetím a „praním“ tvrzení; rozhoduje transparentnost a existence dokladu.

## Související

**Sourozenecké signatury**

- [Cirkulární definice](@/kompendium/detection-signatures/2-linguistic-circular-definitions.md) – stejná struktura na úrovni pojmů.
- [Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) – prostředí, v němž cirkularita není vidět.
- [Praní reputace](@/kompendium/detection-signatures/23-network-reputation-laundering.md) – cirkularita použitá k budování nebo ničení pověsti.

**Techniky a pojmy**

- [EA-2.1.9 Pseudo-konsenzus vytvoření](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – výroba zdánlivé shody.
- [EA-9.1.1 LLM Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md) – cirkularita s účastí AI.
- [Replication Crisis](@/glossary/replication-crisis.md) – širší problém ověřitelnosti ve vědě.

**Obrana a metodika**

- [Sebe-obrana: Ověřování tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) – praktický postup.
- [Analýza dokumentů](@/kompendium/research-methodology/document-analysis-EA.md) – metodika práce s prameny.

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
