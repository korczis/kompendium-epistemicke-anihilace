+++
title = "Bridge: Trinity Gate (brána Trinity)"
description = "Most mezi heslem Trinity Gate a knihou: tři nezávislé kontroly před přijetím přesvědčení – kruhovost, platnost odvození, nutnost oproti možnosti – a kontrola samotné brány."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "trinity-gate", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["trinity-gate", "nabla-infinity", "qeve", "cirkularni-argumentace", "modalni-logika", "logicka-koherence"]
glossary_target = "trinity-gate"
toc = false
+++

# Bridge: Trinity Gate (brána Trinity)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Trinity Gate](@/glossary/trinity-gate.md) je ověřovací mechanismus platformy, z níž Kompendium vzešlo,
jímž musí projít každé přesvědčení, rozhodnutí a závěr, než je přijato. Skládá se ze tří nezávislých
bran – strukturní konzistence (kontrola grafu důvodů pomocí [teorie grafů](@/glossary/graph-theory.md)),
**logické konzistence** (vyhodnocení podle pravidel) a **formální nutnosti** ([modální logika](@/glossary/modalni-logika.md)
a důkazy v systému Lean 4) – a z metavrstvy, která ověřuje správnost brány samotné. Na platformě
tvoří přechod mezi zkoumáním podle rámce [NABLA Infinity](@/glossary/nabla-infinity.md) a jednáním.

Brána řeší základní problém uvažování s pomocí umělé inteligence: mezeru mezi tím, čím si je systém
„jistý“, a tím, co je skutečně podloženo. Statistická jistota sama nestačí – závěr může být
pravděpodobný, a přesto kruhový, rozporný nebo jen možný. Heslo patří do kontextu platformy; kniha
z něj přebírá **tři otázky**, které se hodí při posuzování lidských přesvědčení: Je řetězec důvodů
kruhový? Plyne závěr z premis, nebo je přesahuje? Je závěr nutný, nebo jen možný?

## Tři otázky očima knihy

**Kruhovost.** Strukturní brána hledá v grafu důvodů cykly – místa, kde tvrzení nakonec podpírá samo
sebe. Hamblin (1970) ve své klasické studii klamů rozebral „kladení otázky“ (*petitio principii*) jako
argument, který předpokládá to, co má dokázat. V manipulativních systémech přesvědčení bývá kruhovost
skrytá v dlouhém řetězci: učení je pravdivé, protože to říká vůdce; vůdce má pravdu, protože je
osvícený; je osvícený, protože to potvrzuje učení. Kniha tento vzorec popisuje v hesle
[kruhová argumentace](@/glossary/cirkularni-argumentace.md), v detekční signatuře
[Cirkulární definice](@/kompendium/detection-signatures/2-linguistic-circular-definitions.md) a v technice
[EA-5.4.18 Past kruhového ospravedlnění](@/kompendium/techniques/ea-5-4-18-circular-justification-trap.md).

**Platnost odvození.** Logická brána ověřuje, zda závěr skutečně plyne z premis. Častou chybou – a častým
nástrojem manipulace – je závěr, který premisy přesahuje: z toho, že někdo udělal chybu, se vyvodí, že
je nedůvěryhodný ve všem; z toho, že instituce jednou lhala, se vyvodí, že lže vždy. Walton (1995) v
pragmatické teorii klamů ukázal, že mnoho argumentačních vzorců není samo o sobě chybných a stává se
klamem až tehdy, když se použije mimo kontext, v němž by bylo oprávněné. Kniha k tomu nabízí
[Toulminův model](@/glossary/toulmin-model.md), který pomáhá najít nevyslovené oprávnění, na němž
přechod od premis k závěru stojí.

**Nutnost oproti možnosti.** Formální brána rozlišuje, zda je závěr nutný, nebo jen možný. Hughes a
Cresswell (1996) v úvodu do modální logiky ukazují, že mezi „je možné, že p“ a „p“ leží propast, kterou
běžný jazyk snadno přeskočí. Manipulace tento přeskok využívá: „nelze vyloučit, že…“ se v dalším kroku
mění v „je jasné, že…“. Kniha tento vzorec rozebírá v technice
[EA-5.1.11 Modální dezorientace](@/kompendium/techniques/ea-5-1-11-modalni-dezorientace.md). Nutnost
přitom není v lidském poznávání běžně dosažitelná; otázka slouží k tomu, aby bylo vidět, kdy se
z možnosti tiše stala jistota.

**Kontrola brány.** Metavrstva ověřuje, zda brána sama funguje správně. Je to technická odpověď na
starou otázku, kterou Juvenal ve *Satirách* formuloval slovy „kdo bude hlídat hlídače?“. Pro knihu
z ní plyne, že žádný ověřovací mechanismus – ani lidský, ani strojový – nemá být mimo kontrolu.

## Kde se pojem v knize vyskytuje

Jak brána na platformě propouští přesvědčení až po strukturní, logické a formální kontrole a které tři
otázky z ní kniha přebírá, popisuje stránka [Trinity Gate a EA](@/kompendium/aiad-integration/trinity-gate-ea-verification.md).
Technika, proti níž brána chrání nejpříměji, je
[EA-1.3.1 Imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md):
tvrzení postavené tak, aby ho nebylo možné vyvrátit, neprojde ani strukturní, ani formální kontrolou.
Souvisí s tím detekční signatura [Nefalsifikovatelná tvrzení](@/kompendium/detection-signatures/3-linguistic-unfalsifiable-claims.md).

Lidskou obdobu tří otázek rozvádějí návody [Falsifikační myšlení](@/kompendium/self-defense-guides/5-falsification-thinking.md)
a [Hodnocení důkazů](@/kompendium/self-defense-guides/2-evidence-evaluation.md) a vzdělávací scénář
[Řešení rozporů](@/kompendium/educational-scenarios/8-contradiction-resolution.md).

## Od pojmu k praxi

### Rozpoznání

Tři otázky lze položit každému přesvědčení, na němž záleží – vlastnímu i cizímu. Kruhovost se pozná
podle toho, že při sledování důvodů se člověk vrátí tam, odkud vyšel. Přesah premis se pozná podle
slov „tedy vždy“, „všichni“, „nikdy“ v závěru, který stojí na jednotlivém případu. Přeskok od možnosti
k jistotě se pozná podle toho, že tvrzení začalo jako otázka a skončilo jako fakt, aniž by mezitím
přibyl doklad.

### Obrana

Obranou je rozepsat řetězec důvodů tak, aby byl vidět – na papír, nahlas, před někým jiným. Reason
(2000) ukázal na „modelu švýcarského sýra“, že spolehlivost složitých systémů stojí na více nezávislých
vrstvách ochrany, z nichž každá má díry, ale díry se zřídka seřadí. Tři otázky fungují stejně: žádná
sama neodhalí všechny chyby, ale společně zachytí většinu. Pro instituce kniha doporučuje, aby důležitá
rozhodnutí obsahovala výslovné odůvodnění, které lze podrobit stejným otázkám.

### Náprava

U člověka, jehož přesvědčení stálo dlouho na kruhovém systému, je odhalení kruhovosti otřesem. Kniha
doporučuje nepracovat s ním konfrontačně – přímé předvedení kruhu může vyvolat obranu –, ale vést ho
k tomu, aby řetězec rozepsal sám a sám si všiml, kde se vrací. K tomu slouží protokoly
[Středně-dobý hermeneutický reset](@/kompendium/recovery-protocols/midterm-hermeneutic-reset.md) a
[Středně-dobá metakognitivní rehabilitace](@/kompendium/recovery-protocols/midterm-metacognitive-rehab.md).

### Rámec pro profesionály

Pro znalce a soudce mají tři otázky přímé použití při hodnocení posudků a výpovědí: Opírá se závěr
posudku o předpoklad, který sám dokazuje? Přesahuje závěr to, co data umožňují? A je formulován jako
jistota tam, kde jde jen o možnost? Pro kliniky slouží jako kontrola vlastních hypotéz o klientovi,
které mají sklon se potvrzovat samy sebou.

## Odlišení od příbuzných pojmů

Trinity Gate je třeba odlišit od rámce [QEVE](@/glossary/qeve.md), který kvantifikuje, jak dobře je
závěr podložen a jak je stabilní; brána rozhoduje o přijetí, QEVE o síle. Od rámce
[NABLA Infinity](@/glossary/nabla-infinity.md) se liší tím, že NABLA stanoví pravidla poznávání, brána
kontroluje jejich výsledek. Od [logické koherence](@/glossary/logicka-koherence.md) se liší tím, že
koherence je jen jednou ze tří kontrol; koherentní systém může být kruhový i nenutný.

## Časté omyly

Prvním omylem je přesvědčení, že průchod branou dokazuje pravdivost; brána ověřuje stavbu úvahy, ne
pravdivost premis. Druhým omylem je požadovat nutnost u lidských rozhodnutí; většina z nich se musí
spokojit s dobře podloženou možností. Třetím omylem je chápat jazyk „bez výjimek“ jako ideál pro lidi;
kniha přebírá otázky, ne absolutní pravidla.

## Příklad (anonymizovaný kompozit)

Rodiče dospívajícího syna jsou přesvědčeni, že ho škola „poštvala“ proti nim. Rodinná terapeutka je
požádá, aby důvody svého přesvědčení napsali. Ukáže se, že hlavním důvodem je synova změna chování,
a důkazem, že za změnou stojí škola, je to, že se změnil od nástupu do nové třídy. Druhým důvodem je, že
učitelka je „známá tím, že manipuluje“ – což rodiče vědí z toho, že syn se změnil. Rodiče si kruh všimnou
sami. Terapie se pak může věnovat tomu, co se v rodině skutečně děje.

## Meze a otevřené otázky

Přenos formálních kontrol na lidské poznávání je analogie. Otevřená zůstává otázka, jak tři otázky
učit tak, aby se nestaly nástrojem pro vyvracení čehokoli nepohodlného – každý argument lze obvinit
z přesahu premis. Druhou otázkou je, jak kontrolovat kontrolní mechanismus, když ho navrhli titíž lidé,
jejichž úvahy má ověřovat.

## Literatura

- Hamblin, C. L. (1970). *Fallacies*. Methuen.
- Hughes, G. E., & Cresswell, M. J. (1996). *A New Introduction to Modal Logic*. Routledge.
- Reason, J. (2000). Human error: Models and management. *BMJ*, 320(7237), 768–770.
- Walton, D. N. (1995). *A Pragmatic Theory of Fallacy*. University of Alabama Press.

## Související

**Glosář**

- [Trinity Gate](@/glossary/trinity-gate.md) – technické heslo, které most propojuje.
- [Kruhová argumentace](@/glossary/cirkularni-argumentace.md) – první otázka brány.
- [Modální logika](@/glossary/modalni-logika.md) – rozlišení nutnosti a možnosti.
- [Toulminův model](@/glossary/toulmin-model.md) – nevyslovené oprávnění v argumentu.

**Kniha**

- [Trinity Gate a EA](@/kompendium/aiad-integration/trinity-gate-ea-verification.md) – tři otázky v praxi platformy.
- [EA-1.3.1 Imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) – tvrzení, které nelze vyvrátit.
- [EA-5.1.11 Modální dezorientace](@/kompendium/techniques/ea-5-1-11-modalni-dezorientace.md) – přeskok od možnosti k jistotě.
- [Cirkulární definice](@/kompendium/detection-signatures/2-linguistic-circular-definitions.md) – jazyková stopa kruhovosti.

**Sesterské mosty**

- [Bridge: QEVE](@/kompendium/glossary-bridges/bridge-qeve.md) – síla a stabilita závěru.
- [Bridge: NABLA Infinity](@/kompendium/glossary-bridges/bridge-nabla-infinity.md) – pravidla poznávání.
- [Bridge: Epistemic Pipeline](@/kompendium/glossary-bridges/bridge-epistemic-pipeline.md) – proces, který brána uzavírá.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Trinity Gate (brána Trinity)](@/glossary/trinity-gate.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
