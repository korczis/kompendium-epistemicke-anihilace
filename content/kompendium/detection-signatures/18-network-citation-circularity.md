+++
title = "Detekční signatura: Cirkularita citací"
description = "Síťová signatura: zdroje se navzájem citují tak, že tvrzení vypadá mnohonásobně doložené, ačkoli při sledování odkazů vede k jedinému nebo žádnému původnímu dokladu."
weight = 18

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["16-behavioral-emotional-modulation", "17-network-source-monoculture", "19-network-amplification-asymmetry", "2-linguistic-circular-definitions"]
toc = true
modality = "network"
+++

## Definice signatury

Cirkularita citací nastává, když tvrzení získává zdánlivou oporu tím, že se na něj odkazuje mnoho zdrojů, které však při sledování citací vedou jeden k druhému nebo k jedinému původnímu zdroji – a ten často sám žádný doklad neobsahuje. Množství odkazů vytváří dojem nezávislého potvrzení, které ve skutečnosti neexistuje.

Je to síťová obdoba lingvistické signatury [cirkulárních definic](@/kompendium/detection-signatures/2-linguistic-circular-definitions.md). V odborné literatuře se podobný jev popisuje jako „efekt Woozle“ (tvrzení, které se citováním stává „faktem“) a v internetové kultuře jako *citogenesis* – kdy nepodložené tvrzení z encyklopedie převezme médium a médium je pak citováno jako zdroj pro encyklopedii. V kontextu AI systémů jej zachycuje technika [EA-9.1.1 LLM Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md).

## Co signatura indikuje

Lidé i instituce posuzují spolehlivost tvrzení podle počtu a kvality zdrojů, které ho podporují. Tento postup předpokládá, že zdroje jsou **nezávislé**. Cirkularita tento předpoklad zneužívá nebo nevědomky porušuje: deset článků, které všechny vycházejí z téhož blogového příspěvku, nemají větší váhu než ten příspěvek sám. Přesto působí jako deset potvrzení.

Pro manipulaci je cirkularita způsob, jak „vyprat“ nepodložené tvrzení do zdánlivého konsenzu – souvisí s technikou [EA-2.1.9 Pseudo-konsenzus vytvoření](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md). Cirkularita však často vzniká i bez úmyslu, z pracovní rutiny, kdy se zdroje přebírají bez ověření.

Nejpřesněji tento jev empiricky zachytil Greenberg (2009), který zmapoval citační síť kolem jednoho biomedicínského tvrzení a ukázal, jak se z malého počtu primárních prací – některé z nich tvrzení vůbec nepodporovaly – stala citováním „nezpochybnitelná“ autorita. Popsal přitom konkrétní mechanismy: zesilování citováním přehledů místo primárních dat, ignorování protichůdných studií a postupný posun tvrzení z hypotézy na fakt. Epistemologicky jde o porušení podmínky, kterou Goldman (2001) formuloval pro hodnocení svědectví: počet souhlasných zdrojů zvyšuje oprávnění jen tehdy, když zdroje nejsou pouhými ozvěnami jednoho z nich. Psychologicky cirkularitu posiluje efekt iluzorní pravdy – Hasher, Goldstein a Toppino (1977) prokázali, že opakované vystavení tvrzení zvyšuje jeho hodnocenou pravdivost bez ohledu na obsah. Benkler, Faris a Roberts (2018) popsali v mediálním ekosystému „propagandistickou zpětnou smyčku“, v níž se média, politici a publikum vzájemně potvrzují a nezávislé ověření z okruhu vypadává.

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

**Přebírání ověřených zpráv** je běžnou a legitimní praxí: zpravodajská média přebírají zprávy agentur, a pokud otevřeně uvádějí původ a agentura má ověřený zdroj, nejde o signaturu. Čtenář tu ví, že deset článků představuje jednu zprávu, a může váhu potvrzení správně odhadnout.

Podobně **shrnutí literatury** v přehledových článcích citují primární studie, a cirkularita nastává teprve tehdy, když citují jen jiné přehledy a primární data se z řetězce vytratí. **Zavedená fakta** se citují bez odkazu, protože jsou obecně ověřená a ověřitelná; jejich opakování bez zdroje nezakládá cirkularitu, protože kdokoli je může dohledat. Konečně **vědecké školy** se přirozeně citují více navzájem, protože pracují na společných otázkách. Rozdíl je v tom, zda existují primární data, zda jsou přístupná a zda škola vstupuje do kritické výměny s jinými přístupy; Merton (1968) ukázal, že nerovnoměrné rozložení citací je normálním rysem vědy a samo o sobě o cirkularitě nevypovídá.

## Dopad na jednotlivce a klinický rozměr

Jednotlivce cirkularita zasahuje dvojím způsobem. Jako **čtenáře** ho vede k přesvědčení, že tvrzení je dobře doložené, a k nedůvěře vůči tomu, kdo ho zpochybňuje. Lewandowsky et al. (2012) ukázali, že jednou přijatá dezinformace přetrvává v úsudku i po opravě, zvláště když ji podporuje dojem širokého souhlasu; cirkularita vytváří právě tento dojem.

Jako **cíl** může člověka zasáhnout, když o něm koluje nepodložené tvrzení, které se „potvrzuje“ citováním – pomluva nebo falešné obvinění. Člověk, o němž se takové tvrzení šíří, prožívá bezmoc, protože každé vyvrácení musí čelit „mnoha zdrojům“, a může se u něj rozvinout úzkost, nespavost nebo stažení z veřejného života.

Pokud osoba uvádí, že o ní kolují nepravdy citované z jednoho zdroje na druhý, je třeba ji brát vážně a ověřit to. Rozlišení od paranoidních obav spočívá v tom, že cirkularitu lze doložit konkrétními odkazy; paranoidní přesvědčení se obvykle opírá o nejasné náznaky a rozšiřuje se na další osoby a situace. Klinické posouzení náleží kvalifikovanému odborníkovi a nesmí předcházet ověření faktů.

## Riziko falešné pozitivity

Nedostupnost primárního zdroje může vypadat jako jeho neexistence. Placené databáze, uzavřené archivy, interní dokumenty nebo zdroje v jiném jazyce často obsahují doklad, k němuž se hodnotitel nedostane; závěr „primární zdroj neexistuje“ proto vyžaduje, aby bylo vyčerpáno rozumné hledání, a měl by být formulován jako „primární zdroj nebyl nalezen“.

Odborné obory s malým počtem specialistů se nutně citují navzájem, a hustá vzájemná citovanost je v nich znakem malé komunity, ne praní tvrzení. Konečně hodnotitel může cirkularitu vidět jen u tvrzení, která se mu nelíbí. Test je nutné aplikovat symetricky, včetně tvrzení, která hodnotitel sám považuje za samozřejmá; právě u nich je cirkularita nejméně nápadná.

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

Trasování citací je časově náročné a u masově šířených tvrzení prakticky nemožné bez automatizace. Nástroje citační analýzy existují ve vědecké bibliometrii, ale pro mediální a sociální prostředí jsou méně rozvinuté, a jejich výsledky je nutné ověřovat ručně.

Odkazy na smazané nebo změněné stránky ztěžují rekonstrukci, a archivní služby nezachycují vše. Nejednoznačná je také hranice mezi legitimním převzetím a „praním“ tvrzení; rozhoduje transparentnost původu a existence dokladu, nikoli počet mezikroků. Otevřenou otázkou zůstává, jak se cirkularita projeví u odpovědí jazykových modelů, které reprodukují tvrzení bez uvedení původu a mohou je vracet zpět do textů, z nichž se další modely učí (srov. [EA-9.1.1 LLM Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md)).

## Literatura

- Benkler, Y., Faris, R., & Roberts, H. (2018). *Network [Propaganda](@/glossary/propaganda.md): Manipulation, Disinformation, and Radicalization in American Politics*. Oxford University Press.
- Goldman, A. I. (2001). Experts: Which ones should you trust? *Philosophy and Phenomenological Research*, 63(1), 85–110.
- Greenberg, S. A. (2009). How citation distortions create unfounded authority: Analysis of a citation network. *BMJ*, 339, b2680.
- Hasher, L., Goldstein, D., & Toppino, T. (1977). Frequency and the conference of referential validity. *Journal of Verbal Learning and Verbal Behavior*, 16(1), 107–112.
- Lewandowsky, S., Ecker, U. K. H., Seifert, C. M., Schwarz, N., & Cook, J. (2012). Misinformation and its correction: Continued influence and successful debiasing. *Psychological Science in the Public Interest*, 13(3), 106–131.
- Merton, R. K. (1968). The Matthew effect in science. *Science*, 159(3810), 56–63.

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
