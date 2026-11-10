+++
title = "Detekční signatura: Fragmentace narativu"
description = "Lingvistická signatura: pravdivá fakta podaná bez časových a příčinných spojů, aby si posluchač chybějící souvislosti doplnil sám – a mylně."
weight = 6

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "linguistic"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["4-linguistic-framing-shift", "5-linguistic-pronoun-inversion", "7-linguistic-scope-creep", "8-linguistic-semantic-erosion"]
parent = "kompendium-detection-signatures"
toc = true
modality = "linguistic"
+++

## Definice signatury

Fragmentace narativu je rozbití časové nebo příčinné struktury vyprávění. Jednotlivé údaje mohou být pravdivé, ale chybí spoje mezi nimi – kdy se co stalo, co z čeho vyplynulo, co bylo dřív. Posluchač mezery přirozeně vyplní a jako manipulativní signatura se fragmentace projevuje tím, že je vyplňuje **směrem, který zdroj potřebuje**, aniž by zdroj cokoli nepravdivého řekl.

Signatura se vyskytuje ve dvou polohách, které je nutné přísně rozlišit: jako **vlastnost sdělení zdroje** (o té pojednává tato stránka) a jako **vlastnost výpovědi zasažené osoby**, kde je fragmentace často normálním důsledkem traumatu a nikoli známkou nepravdy (viz níže). Technicky odpovídá [EA-4.4.1 Narrative disassembly](@/kompendium/techniques/ea-4-4-1-narrative-disassembly.md); na úrovni AI systémů [EA-9.1.9 Multi-Turn Narrative Shift](@/kompendium/techniques/ea-9-1-9-multi-turn-narrative-shift.md).

## Co signatura indikuje

Fragmentace je forma **implikatury**: místo tvrzení „X způsobil Y“ zdroj řekne „Stalo se Y. X tam ten den byl.“ Kauzalitu doplní posluchač a odpovědnost za závěr nese on. Zdroj se pak může bránit tím, že nic takového neřekl. V mezilidském prostředí slouží fragmentace k podsouvání podezření, v médiích k vytváření dojmu souvislosti bez důkazu a ve vztahu ke zasažené osobě k narušení jejího vlastního příběhu: když jí někdo opakovaně předkládá střípky její minulosti v jiném pořadí, ztrácí jistotu, jak to vlastně bylo (srov. [narativní identita](@/glossary/narativni-identita.md)).

## Pozorovatelné markery

### Lingvistické

- Parataxe: věty stojí vedle sebe bez spojek tam, kde by příčinná nebo časová spojka byla nutná.
- Chronologie bez dat a bez pořadí („jednou“, „pak taky“, „mezitím“).
- Vynechání klíčového kontextu, který by souvislost vyvrátil (srov. [EA-2.3.3 Quote Mining](@/kompendium/techniques/ea-2-3-3-quote-mining.md)).
- Otázky, které implikují spojení („Není zvláštní, že…?“, „Proč asi…?“).

### Behaviorální

- Na otázku „tvrdíš, že X způsobil Y?“ zdroj odpoví „to jsem neřekl, jen říkám fakta“.
- Fragmenty jsou opakovány v různém pořadí podle publika.
- Posluchači převyprávějí příběh s kauzálními spoji, které zdroj nevyslovil – to je nejsilnější behaviorální marker.

### Relační a institucionální

- V rodině nebo skupině koluje o konkrétním člověku soubor střípků, z nichž nikdo nesložil celý příběh, ale všichni „vědí, jaký je“.
- Ve spisových materiálech se objevují izolované záznamy vytržené z časové osy.
- Zasažené osobě jsou její vlastní vzpomínky vraceny v přeskupené podobě („pamatuješ, jak jsi tehdy…“).

## Detekční kritéria

1. Sdělení obsahuje jednotlivě ověřitelné údaje bez explicitní časové nebo příčinné vazby.
2. Kontext, který by implikovanou souvislost oslabil, je dostupný, ale zdrojem vynechán.
3. Posluchači prokazatelně odvozují závěr, který zdroj nevyslovil, a zdroj ho neopravuje.
4. Zdroj na přímou otázku po souvislosti odpovědnost za závěr odmítá.

Pozitivní při splnění bodů 1–3; bod 4 signaturu potvrzuje.

## Odlišení od benigních podob

- **Běžné vyprávění** je neuspořádané; lidé vzpomínají asociativně a vracejí se. Rozdíl je v tom, že na dotaz souvislost doplní nebo přiznají, že ji neznají.
- **Opatrnost**: novinář nebo vyšetřovatel, který neví, zda souvislost existuje, ji legitimně nevysloví – ale zároveň nevynechává známý kontext a nenaznačuje.
- **Literární a umělecké postupy** pracují s fragmenty záměrně a čtenář o tom ví.

## Klinická diferenciální diagnostika

Zde leží hlavní riziko omylu. **Fragmentovaná výpověď zasažené osoby není signaturou manipulace a není známkou lži.** Traumatické vzpomínky bývají uloženy jako smyslové útržky s narušenou chronologií, s mezerami a s proměnlivým pořadím detailů; popsala to řada autorů od Herman (1992) po literaturu o traumatické paměti. Další stavy s fragmentovaným vyprávěním:

- **disociativní amnézie** s mezerami v autobiografické paměti (srov. [disociativní amnézie](@/glossary/dissociativni-amnezie.md));
- **akutní stresová reakce** bezprostředně po události;
- **kognitivní poruchy** (delirium, demence), kde je narušena i paměť neutrálních událostí;
- **formální poruchy myšlení** u psychóz;
- **intoxikace** v době události.

Hodnotit fragmentaci výpovědi oběti jako nedůvěryhodnost je chyba s vážnými důsledky, zejména ve forenzním kontextu (viz [disclosure traumatu](@/kompendium/forensic-legal/6-trauma-disclosure.md) a [posuzování věrohodnosti](@/kompendium/forensic-legal/2-credibility-assessment.md)).

## Riziko falešné pozitivity

- Záměna fragmentace zdroje s fragmentací zasažené osoby – nejzávažnější chyba.
- Neúplnost může být důsledkem nedostatku informací, ne strategie.
- Hodnotitel sám doplňuje souvislosti a pak je připisuje zdroji; pomáhá přesný přepis.

## Validační test

**Rekonstrukce spojů.** Sdělení se rozloží na jednotlivé údaje a každý se umístí na časovou osu. Pak se zapíší kauzální spoje, které posluchači odvodili, a ověří se, zda je zdroj vyslovil. Mezera mezi vysloveným a odvozeným je měřítkem signatury. Doplňkově lze zdroji položit neutrální otázku: „Chcete tím říct, že X způsobil Y?“

U zasažené osoby se tento test **nepoužívá**; místo toho se pracuje s trauma-informovaným rozhovorem, který nečekává lineární příběh.

## Dokumentace v praxi

- Doslovný přepis sdělení zdroje včetně pořadí vět.
- Časová osa s rozlišením „doloženo“ / „implikováno“.
- U výpovědi zasažené osoby zapisovat její slova bez dodatečného řazení a bez hodnocení „nesouvislá“; případné mezery uvést jako mezery (viz [výpověď oběti](@/kompendium/forensic-legal/25-victim-statement.md) a [forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md)).

## Doporučený postup

**Pro zasaženou osobu:** vlastní příběh si zapisovat po kouscích, bez nároku na úplnost, a datovat záznamy. Když jí někdo vrací vzpomínky „jinak“, zapsat si, kdo a kdy. Vlastní pořadí událostí není nutné hájit v rozhovoru se zdrojem; stačí ho mít uložené.

**Pro profesionála:** nechtít od zasažené osoby souvislé vyprávění dřív, než je stabilizovaná; postupně budovat časovou osu ([biografická rekonstrukce](@/kompendium/06-klinicke-aplikace/biographical-timeline-rekonstrukce.md), [narativní rekonstrukce](@/kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md)). U sdělení zdroje vracet do řeči explicitní souvislosti a ptát se po nich.

**Eskalace:** pokud se při práci s fragmenty objeví zaplavující vzpomínky, postupovat podle protokolu [kaskády flashbacků](@/kompendium/emergency-protocols/5-flashback-cascade-EA.md).

## Ilustrativní příklad

*Anonymizovaný kompozit.* V internetové skupině rodičů se objeví příspěvek: „Ve školce se minulý týden jedno dítě zranilo. Nový asistent tam je od září. Ředitelka nic nevysvětlila.“ Žádná věta není nepravdivá, ale během dne komentáře mluví o „asistentovi, který zranil dítě“. Pisatel na dotaz odpovídá, že „jen sdílí fakta“. Ředitelka zveřejní časovou osu: dítě se zranilo na hřišti při hře, asistent byl ten den na školení. Školní metodička pak na skupině vysvětlí rodičům, jak vznikl dojem souvislosti, a doporučí ověřovat sdělení podle [verifikace tvrzení](@/kompendium/educational-scenarios/5-claim-verification.md).

## Limity a otevřené otázky

- Rozlišení strategické a nevinné neúplnosti vyžaduje znalost kontextu, kterou hodnotitel nemusí mít.
- V digitálním prostředí vzniká fragmentace i bez autora – algoritmy a sdílení vytrhávají obsah z kontextu.
- Stupeň fragmentace výpovědi oběti neříká nic o její pravdivosti; tento závěr je nutné opakovaně připomínat i odborníkům.

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

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
