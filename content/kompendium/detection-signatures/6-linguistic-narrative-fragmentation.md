+++
title = "Detekční signatura: Fragmentace narativu"
description = "Lingvistická signatura: pravdivá fakta podaná bez časových a příčinných spojů, aby si posluchač chybějící souvislosti doplnil sám – a mylně."
weight = 6

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "linguistic"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["4-linguistic-framing-shift", "5-linguistic-pronoun-inversion", "7-linguistic-scope-creep", "8-linguistic-semantic-erosion"]
toc = true
modality = "linguistic"
+++

## Definice signatury

Fragmentace narativu je rozbití časové nebo příčinné struktury vyprávění. Jednotlivé údaje mohou být pravdivé, ale chybí spoje mezi nimi – kdy se co stalo, co z čeho vyplynulo, co bylo dřív. Posluchač mezery přirozeně vyplní a jako manipulativní signatura se fragmentace projevuje tím, že je vyplňuje **směrem, který zdroj potřebuje**, aniž by zdroj cokoli nepravdivého řekl.

Signatura se vyskytuje ve dvou polohách, které je nutné přísně rozlišit: jako **vlastnost sdělení zdroje** (o té pojednává tato stránka) a jako **vlastnost výpovědi zasažené osoby**, kde je fragmentace často normálním důsledkem traumatu a nikoli známkou nepravdy (viz níže). Technicky odpovídá [EA-4.4.1 Narrative disassembly](@/kompendium/techniques/ea-4-4-1-narrative-disassembly.md); na úrovni AI systémů [EA-9.1.9 Multi-Turn Narrative Shift](@/kompendium/techniques/ea-9-1-9-multi-turn-narrative-shift.md).

## Co signatura indikuje

Fragmentace je forma **implikatury**: místo tvrzení „X způsobil Y“ zdroj řekne „Stalo se Y. X tam ten den byl.“ Kauzalitu doplní posluchač a odpovědnost za závěr nese on. Zdroj se pak může bránit tím, že nic takového neřekl. V mezilidském prostředí slouží fragmentace k podsouvání podezření, v médiích k vytváření dojmu souvislosti bez důkazu a ve vztahu ke zasažené osobě k narušení jejího vlastního příběhu: když jí někdo opakovaně předkládá střípky její minulosti v jiném pořadí, ztrácí jistotu, jak to vlastně bylo (srov. [narativní identita](@/glossary/narativni-identita.md)).

Pojem implikatury zavedl Grice (1975): v běžném rozhovoru předpokládáme, že mluvčí sděluje vše relevantní a v přiměřeném pořadí, a proto ze samotného sousedství dvou vět vyvozujeme souvislost. Fragmentace narativu tento předpoklad spolupráce využívá – souvislost, kterou by zdroj nemohl tvrdit, vznikne v hlavě posluchače. Labov a Waletzky (1967) ukázali, že úplné vyprávění má rozpoznatelnou strukturu (orientace, komplikace, hodnocení, rozuzlení); chybějící orientace nebo hodnocení je proto pozorovatelný znak, nikoli jen dojem. Wardle a Derakhshan (2017) v typologii informační poruchy popisují „falešný kontext“ – pravdivý obsah sdílený v souvislosti, která mu dává jiný význam – jako mediální protějšek téhož vzorce. Pro zasaženou osobu je nejcitlivější rovina narativní identity: Bruner (1990) a McAdams (1993) chápou životní příběh jako způsob, jímž člověk udržuje souvislost sebe sama v čase, a jeho rozbití zvnějšku proto zasahuje víc než jen paměť jednotlivých událostí.

## Pozorovatelné markery

### Lingvistické

| Znak sdělení | Jak se v přepisu projeví |
| --- | --- |
| Parataxe | věty stojí vedle sebe bez spojky tam, kde by časová nebo příčinná spojka byla nutná |
| Chronologie bez dat | „jednou“, „pak taky“, „mezitím“ namísto určení, co bylo dřív |
| Vynechaný klíčový kontext | chybí právě ta informace, která by implikovanou souvislost vyvrátila (srov. [EA-2.3.3 Quote Mining](@/kompendium/techniques/ea-2-3-3-quote-mining.md)) |
| Otázka místo tvrzení | „Není zvláštní, že…?“, „Proč asi…?“ – spojení je položeno jako dotaz |

### Behaviorální

Nejsilnějším behaviorálním markerem není nic, co by zdroj řekl, nýbrž to, co po něm zopakují posluchači: převyprávějí příběh s kauzálními spoji, které v původním sdělení nezněly, a zdroj je neopravuje. Na přímý dotaz, zda tvrdí, že X způsobil Y, odpoví, že nic takového neřekl a že jen uvádí fakta; tatáž sada fragmentů se přitom podle publika opakuje v jiném pořadí. Grice (1975) tento rozpor vysvětluje: posluchač pracuje s předpokladem, že mluvčí sděluje relevantní věci v přiměřeném pořadí, takže souvislost odvodí, i když vyslovena nebyla, a mluvčí se může od jeho závěru odstřihnout.

### Relační a institucionální

Ve skupině nebo v rodině o konkrétním člověku koluje soubor střípků, z nichž nikdo nesložil celý příběh, a přesto všichni „vědí, jaký je“; ve spisových materiálech má tentýž vzorec podobu izolovaných záznamů vytržených z časové osy a vůči zasažené osobě podobu vzpomínek vracených jí v přeskupeném pořadí. Wardle a Derakhshan (2017) popisují tuto podobu informační poruchy jako falešný kontext (*false context*) – pravdivý obsah zasazený do souvislosti, která mu dává jiný význam –, a právě proto se kolující fragmenty nedají vyvrátit opravou jediného údaje.

## Detekční kritéria

| Kritérium | Co se zjišťuje | Role v závěru |
| --- | --- | --- |
| Údaje bez vazby | sdělení obsahuje jednotlivě ověřitelné údaje bez explicitní časové nebo příčinné vazby | nutné |
| Dostupný vynechaný kontext | kontext, který by implikovanou souvislost oslabil, byl k dispozici, ale ve sdělení není | nutné |
| Odvozený závěr bez opravy | posluchači prokazatelně odvozují závěr, který zdroj nevyslovil, a zdroj jej neopravuje | nutné |
| Odmítnutí odpovědnosti | na přímou otázku po souvislosti zdroj odpovědnost za závěr odmítá | potvrzující |

Signatura je pozitivní při splnění všech tří nutných kritérií.

## Odlišení od benigních podob

**Běžné vyprávění** je neuspořádané: lidé vzpomínají asociativně, vracejí se, přeskakují a doplňují. To samo signaturou není. Rozdíl je v tom, že na dotaz souvislost doplní, nebo přiznají, že ji neznají; neudržují mezery tam, kde by doplnění vyvrátilo dojem, který vyprávění vyvolalo.

Legitimní je také **opatrnost** novináře nebo vyšetřovatele, který neví, zda souvislost existuje, a proto ji nevysloví. Profesní standard ale zároveň vyžaduje nevynechávat známý kontext a nenaznačovat souvislost, kterou nelze doložit; signatura začíná tam, kde se opatrnost spojí se selektivním vynecháním. Konečně **literární a umělecké postupy** pracují s fragmenty záměrně – od modernistického románu po film s rozbitou chronologií – a čtenář o tom ví; fragmentace je zde přiznanou formou, nikoli skrytým nástrojem.

## Klinická diferenciální diagnostika

Zde leží hlavní riziko omylu. **Fragmentovaná výpověď zasažené osoby není signaturou manipulace a není známkou lži.** Herman (1992) popsala, že traumatické vzpomínky postrádají slovní narativ a kontext a jsou uloženy jako živé smyslové obrazy a útržky. Van der Kolk a Fisler (1995) doložili fragmentární povahu traumatických vzpomínek u osob, které je teprve postupně skládaly do souvislého vyprávění, a Brewin, Dalgleish a Joseph (1996) to vysvětlili teorií dvojí reprezentace, podle níž se traumatický zážitek ukládá částečně v podobě, která není verbálně dostupná. Mezery, proměnlivé pořadí detailů a nejistota v chronologii jsou proto u traumatizované osoby očekávané.

Fragmentované vyprávění se objevuje i u dalších stavů. **[Disociativní amnézie](@/glossary/dissociativni-amnezie.md)** se projevuje mezerami v autobiografické paměti (srov. [disociativní amnézie](@/glossary/dissociativni-amnezie.md)). **Akutní stresová reakce** bezprostředně po události narušuje uspořádání výpovědi přechodně. U **kognitivních poruch**, jako je delirium nebo demence, je narušena i paměť neutrálních událostí; u **formálních poruch myšlení** při psychóze je narušena souvislost řeči obecně. Výpověď mohla ovlivnit také **intoxikace** v době události.

Hodnotit fragmentaci výpovědi oběti jako nedůvěryhodnost je chyba s vážnými důsledky, zejména ve forenzním kontextu (viz [disclosure traumatu](@/kompendium/forensic-legal/6-trauma-disclosure.md) a [posuzování věrohodnosti](@/kompendium/forensic-legal/2-credibility-assessment.md)). Diferenciální posouzení přísluší kvalifikovanému klinikovi nebo znalci.

## Riziko falešné pozitivity

Nejzávažnější chybou je záměna fragmentace zdroje s fragmentací zasažené osoby. Signatura na této stránce popisuje sdělení, které vytváří dojem souvislosti cestou vynechání; fragmentovaná výpověď oběti je jiný jev s jinými příčinami a s opačným významem pro posouzení. Kdo tyto roviny smísí, obrátí detekci proti tomu, koho má chránit.

Druhým zdrojem omylu je, že neúplnost může být důsledkem nedostatku informací, ne strategie. Zdroj, který souvislost neuvádí, ji nemusí znát, a signaturu proto podporuje teprve doložitelné vynechání známého kontextu. Třetím zdrojem omylu je sám hodnotitel: i on doplňuje souvislosti podle Griceových (1975) konverzačních předpokladů a pak je snadno připíše zdroji. Pomáhá přesný přepis, v němž lze oddělit, co bylo řečeno, od toho, co si posluchač vyvodil.

## Validační test

**Rekonstrukce spojů.** Sdělení se rozloží na jednotlivé údaje a každý se umístí na časovou osu. Pak se zapíší kauzální spoje, které posluchači odvodili, a ověří se, zda je zdroj vyslovil. Mezera mezi vysloveným a odvozeným je měřítkem signatury. Doplňkově lze zdroji položit neutrální otázku: „Chcete tím říct, že X způsobil Y?“

U zasažené osoby se tento test **nepoužívá**; místo toho se pracuje s trauma-informovaným rozhovorem, který nečekává lineární příběh.

## Dokumentace v praxi

| Co se zaznamenává | Pravidlo zápisu |
| --- | --- |
| Sdělení zdroje | doslovný přepis včetně pořadí vět, nikoli shrnutí obsahu |
| Časová osa | u každého údaje se odlišuje „doloženo“ od „implikováno“ |
| Výpověď zasažené osoby | její slova bez dodatečného řazení a bez hodnocení „nesouvislá“; mezery se uvádějí jako mezery (viz [výpověď oběti](@/kompendium/forensic-legal/25-victim-statement.md) a [forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md)) |

## Doporučený postup

**Pro zasaženou osobu:** vlastní příběh si zapisovat po kouscích, bez nároku na úplnost, a datovat záznamy. Když jí někdo vrací vzpomínky „jinak“, zapsat si, kdo a kdy. Vlastní pořadí událostí není nutné hájit v rozhovoru se zdrojem; stačí ho mít uložené.

**Pro profesionála:** nechtít od zasažené osoby souvislé vyprávění dřív, než je stabilizovaná; postupně budovat časovou osu ([biografická rekonstrukce](@/kompendium/06-klinicke-aplikace/biographical-timeline-rekonstrukce.md), [narativní rekonstrukce](@/kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md)). U sdělení zdroje vracet do řeči explicitní souvislosti a ptát se po nich.

**Eskalace:** pokud se při práci s fragmenty objeví zaplavující vzpomínky, postupovat podle protokolu [kaskády flashbacků](@/kompendium/emergency-protocols/5-flashback-cascade-EA.md).

## Ilustrativní příklad

*Anonymizovaný kompozit.* V internetové skupině rodičů se objeví příspěvek: „Ve školce se minulý týden jedno dítě zranilo. Nový asistent tam je od září. Ředitelka nic nevysvětlila.“ Žádná věta není nepravdivá, ale během dne komentáře mluví o „asistentovi, který zranil dítě“. Pisatel na dotaz odpovídá, že „jen sdílí fakta“. Ředitelka zveřejní časovou osu: dítě se zranilo na hřišti při hře, asistent byl ten den na školení. Školní metodička pak na skupině vysvětlí rodičům, jak vznikl dojem souvislosti, a doporučí ověřovat sdělení podle [verifikace tvrzení](@/kompendium/educational-scenarios/5-claim-verification.md).

## Limity a otevřené otázky

Rozlišení strategické a nevinné neúplnosti vyžaduje znalost kontextu, kterou hodnotitel nemusí mít. Signatura proto pracuje s pravděpodobností a s opakováním vzorce, nikoli s jistotou o úmyslu jednotlivého sdělení.

V digitálním prostředí navíc vzniká fragmentace i bez autora: algoritmy doporučování, zkracování a sdílení vytrhávají obsah z kontextu, takže stejný účinek jako záměrné vynechání může mít technická architektura platformy (Wardle & Derakhshan, 2017). Na úrovni sítě je pak nutné pracovat s příbuznými signaturami, například s [vkládáním narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md).

Konečně je třeba opakovaně připomínat, a to i odborníkům, že stupeň fragmentace výpovědi oběti neříká nic o její pravdivosti. Otevřenou otázkou zůstává, jak tuto znalost účinně přenést do praxe vyšetřování, kde se souvislost a konzistence výpovědi stále často považují za hlavní znak věrohodnosti.

## Literatura

- Brewin, C. R., Dalgleish, T., & Joseph, S. (1996). A dual representation theory of posttraumatic stress disorder. *Psychological Review*, 103(4), 670–686.
- Bruner, J. (1990). *Acts of Meaning*. Harvard University Press.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (s. 41–58). Academic Press.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Labov, W., & Waletzky, J. (1967). Narrative analysis: Oral versions of personal experience. In J. Helm (Ed.), *Essays on the Verbal and Visual Arts* (s. 12–44). University of Washington Press.
- McAdams, D. P. (1993). *The Stories We Live By: Personal Myths and the Making of the Self*. William Morrow.
- van der Kolk, B. A., & Fisler, R. (1995). Dissociation and the fragmentary nature of traumatic memories: Overview and exploratory study. *Journal of Traumatic Stress*, 8(4), 505–525.
- Wardle, C., & Derakhshan, H. (2017). *Information Disorder: Toward an Interdisciplinary Framework for Research and Policy Making*. Council of Europe.

## Související

**Sourozenecké signatury**

- [Posun rámce](@/kompendium/detection-signatures/4-linguistic-framing-shift.md) – do rozbitého příběhu se snadno vloží nový rámec.
- [Časová dezorientace](@/kompendium/detection-signatures/29-phenomenological-temporal-disorientation.md) – fenomenologický důsledek rozbité chronologie.
- [Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md) – fragmenty šířené v síťovém měřítku.

**Techniky a pojmy**

- [EA-4.4.1 Narrative disassembly](@/kompendium/techniques/ea-4-4-1-narrative-disassembly.md) – technika rozkladu příběhu.
- [EA-5.3.8 Mnemonická rekonfigurace](@/kompendium/techniques/ea-5-3-8-mnemonicka-rekonfigurace.md) – přeskupování vzpomínek zasažené osoby.
- [Narrative Trauma](@/glossary/narrative-trauma.md) – trauma jako narušení příběhu.

**Klinika, právo a obnova**

- [Disclosure traumatu](@/kompendium/forensic-legal/6-trauma-disclosure.md) – proč fragmentovaná výpověď neznamená nevěrohodnost.
- [Narativní analýza](@/kompendium/research-methodology/narrative-analysis-EA.md) – metodika rozboru vyprávění.
- [Subakutní narativní externalizace](@/kompendium/recovery-protocols/subacute-narrative-externalization.md) – obnova vlastního příběhu.

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
