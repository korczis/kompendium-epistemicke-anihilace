+++
title = "Bridge: Bounded Context (ohraničený kontext)"
description = "Most mezi heslem ohraničeného kontextu a knihou: hranice významu v softwaru a jejich zrcadlo v manipulaci – nevyslovená změna kontextu, v němž se slovo vykládá."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "bounded-context", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["bounded-context", "3nl", "motte-and-bailey", "adapter-pattern", "bridge-motte-and-bailey", "bridge-3nl"]
glossary_target = "bounded-context"
toc = false
+++

# Bridge: Bounded Context (ohraničený kontext)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Bounded context](@/glossary/bounded-context.md) (ohraničený kontext) je strategický vzor
doménově řízeného návrhu softwaru. Vymezuje výslovnou hranici kolem modelu domény: uvnitř
ní má každý pojem jediný, přesný význam, napříč hranicemi může totéž slovo znamenat něco jiného.
Heslo glosáře uvádí příklad „zákazníka“, který má v marketingu demografii, v bezpečnosti
rizikový profil a v infrastruktuře kvóty, a popisuje, že na platformě Prismatic, z níž kniha
vzešla, tvoří ohraničený kontext každá aplikace. Komunikace mezi kontexty neprobíhá sdíleným
vnitřním modelem, ale výslovným rozhraním, které významy převádí.

Heslo zároveň upozorňuje, proč je pojem pro knihu poučný „z opačné strany“. Co je v softwaru
záměrnou a výslovnou volbou – týž výraz s jiným významem v jiném kontextu –, bývá v manipulaci
nástrojem: **nevyslovená změna kontextu**, v němž se slovo vykládá. Rozdíl není v tom, že slovo
mění význam, ale v tom, zda je hranice přiznaná a převod mezi významy viditelný.

## Pojem v jeho vlastním oboru

Pojem zavedl Evans (2003) jako odpověď na zkušenost, že jediný jednotný model velké organizace
se nevyhnutelně stane nekonzistentním kompromisem. Místo toho navrhl rozdělit systém na
kontexty, z nichž každý má vlastní *všudypřítomný jazyk* (*ubiquitous language*) sdílený vývojáři
a odborníky domény, a vztahy mezi kontexty zakreslit do *mapy kontextů*. Vernon (2013) tuto
praxi rozpracoval do podoby, v níž se hranice kontextu promítá do hranic týmů, kódu a datových
úložišť. Mezi kontexty se překládá přes zvláštní vrstvy, například přes *anti-korupční vrstvu*,
která brání tomu, aby cizí model pronikl do vlastního – podobně jako
[Adapter Pattern](@/glossary/adapter-pattern.md) převádí jedno rozhraní na jiné.

Podstatné je, že v dobře navrženém systému je každá hranice **pojmenovaná a dokumentovaná**.
Nikdo nepředpokládá, že „zákazník“ znamená všude totéž; právě proto, že se ví, kde se význam
mění, nevzniká zmatek.

## Analogie, kterou kniha činí

Filozofie jazyka zná tutéž věc v obecnější podobě: význam slova je dán jeho užitím v určité
„jazykové hře“ (Wittgenstein 1953). Lidé běžně přecházejí mezi kontexty – slovo „stres“
znamená něco jiného u lékaře a u inženýra statiky – a většinou to nevadí, protože kontext je
zřejmý. Manipulace pracuje s případy, kdy zřejmý není. Walton (1996) popsal celou rodinu
argumentačních chyb, které vznikají z dvojznačnosti, kdy se v průběhu argumentu nenápadně mění
význam klíčového výrazu. Shackel (2005) pojmenoval vzorec *[motte and bailey](@/glossary/motte-and-bailey.md)*: mluvčí tvrdí
odvážnou tezi v širokém významu, a když je napaden, ustoupí k banálnímu významu téhož slova,
aby se pak k odvážné tezi vrátil – viz [Bridge: Motte and Bailey](@/kompendium/glossary-bridges/bridge-motte-and-bailey.md).

V uzavřených skupinách má změna kontextu ještě jinou podobu. Lifton (1961) popsal „nabitý
jazyk“: běžná slova jako „svoboda“, „láska“ nebo „pravda“ dostávají uvnitř skupiny zvláštní
význam, který člověk přijme, aniž by si uvědomil, že hranici překročil. Uvnitř skupiny pak slova
znějí stejně jako venku, ale znamenají něco jiného – ohraničený kontext bez přiznané hranice.

## Kde se pojem v knize vyskytuje

Kniha tento vzorec rozebírá u několika technik.
[EA-4.3.3 Narušení sémantické stability](@/kompendium/techniques/ea-4-3-3-semantic-stability-disruption.md)
popisuje soustavné posouvání významu klíčových pojmů, [EA-1.1.3 Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md)
zavádění žargonu, jehož význam zná jen mluvčí, a [EA-4.3.2 Eroze kategoriálních hranic](@/kompendium/techniques/ea-4-3-2-categorical-boundary-erosion.md)
rozmazávání hranic mezi pojmy, které je třeba držet oddělené. Pozorovatelné projevy zachycují
detekční signatury [Sémantická eroze](@/kompendium/detection-signatures/8-linguistic-semantic-erosion.md),
[Posun rámování](@/kompendium/detection-signatures/4-linguistic-framing-shift.md) a
[Motte and Bailey](@/kompendium/detection-signatures/motte-bailey.md). Legitimní práci s hranicemi
významu mezi jazyky ukazuje kapitola [Česko-anglická terminologie](@/kompendium/international/31-cs-en-terminology/index.md).

## Od pojmu k praxi

### Rozpoznání

Signálem nevyslovené změny kontextu je, že **spor se nedaří uzavřít, protože se neustále mění,
o čem je**. Mluvčí v jedné větě používá slovo v přísném odborném významu a v další v hovorovém;
když se na to upozorní, tvrdí, že „to přece myslel celou dobu“. Ve skupinách se vzorec pozná
podle toho, že nováček rozumí slovům, ale nerozumí tomu, proč na ně ostatní reagují tak silně,
a podle toho, že bývalí členové po odchodu popisují, jak museli slova „učit se znovu“.

### Odlišení

Odborný žargon sám není manipulací; je to legitimní ohraničený kontext, který zkracuje
komunikaci mezi odborníky. Manipulací se stává tehdy, když se hranice zamlčuje, když se význam
mění podle toho, co se mluvčímu hodí, a když je nesouhlas s užitím slova vykládán jako
neznalost nebo nepřátelství. Rozlišovacím znakem je ochota definovat: kdo pracuje s poctivým
kontextem, význam vysvětlí; kdo kontext zneužívá, definici odmítne nebo ji mění.

### Obrana

Nejúčinnější obranou je udělat z nevyslovené hranice vyslovenou – tedy to, co dělá dobrý
návrh softwaru. V rozhovoru to znamená požádat o definici klíčového slova a vrátit se k ní,
když se význam posune: „Před chvílí jste tím myslel X, teď to zní jako Y; o které z toho
mluvíme?“ V psaném textu pomáhá zapsat si definice na začátku. Příručky
[Verifikace tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) a
[Asertivní komunikace](@/kompendium/self-defense-guides/24-communication-assertiveness.md) k tomu
nabízejí obecné postupy.

### Zotavení a rámec pro profesionály

Lidé, kteří odešli ze skupin s nabitým jazykem, potřebují často doslova „přeložit“ svůj slovník
zpět. Terapeut může společně s klientem vést seznam slov, která ve skupině měla zvláštní význam,
a hledat pro ně neutrální ekvivalenty; tím se hranice mezi kontexty stane viditelnou a klient
získá zpět kontrolu nad vlastním jazykem. Navazující práci popisuje
[Středně-dobý hermeneutický reset](@/kompendium/recovery-protocols/midterm-hermeneutic-reset.md).

## Časté omyly

Omylem je myslet si, že řešením je jediný „správný“ význam každého slova. Evans (2003) ukázal
opak: pokus o jednotný model selhává a zdravý systém potřebuje více kontextů. Cílem není
zakázat mnohoznačnost, ale přiznat ji. Druhým omylem je považovat každou změnu významu za úmysl;
lidé často přecházejí mezi kontexty bezděčně. Úmysl se pozná až z opakovaného vzorce a z toho,
komu změna pokaždé prospívá.

## Příklad (anonymizovaný kompozit)

Ve firemním sporu o přesčasy vedení tvrdí, že „flexibilita“ je hodnotou firmy. Na poradách
slovo znamená možnost zaměstnanců volit si pracovní dobu; v hodnocení výkonu ale znamená
ochotu být kdykoli k dispozici. Zástupkyně zaměstnanců připraví krátký dokument, kde obě
užití staví vedle sebe, a navrhne, aby firma pojmy oddělila. Spor se tím posune od obecné
debaty o hodnotách ke konkrétní dohodě o pravidlech, které lze ověřit.

## Meze a otevřené otázky

Analogie mezi softwarovými kontexty a lidskou řečí je neúplná: lidské významy jsou proměnlivé,
mají emocionální zabarvení a hranice mezi nimi nejsou nikdy tak ostré jako hranice modulů.
Otevřenou otázkou je, jak v rozhovoru rozlišit přirozený posun významu od záměrné strategie
bez toho, aby se z každé nepřesnosti stalo obvinění, a jak pracovat s pojmy, jejichž
význam se ve veřejném prostoru mění legitimně, například ve vědě nebo v právu.

## Literatura

- Evans, E. (2003). *Domain-Driven Design: Tackling Complexity in the Heart of Software*. Addison-Wesley.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism*. W. W. Norton.
- Shackel, N. (2005). The vacuity of postmodernist methodology. *Metaphilosophy*, 36(3), 295–320.
- Vernon, V. (2013). *Implementing Domain-Driven Design*. Addison-Wesley.
- Walton, D. (1996). *Fallacies Arising from Ambiguity*. Kluwer Academic.
- Wittgenstein, L. (1953). *Philosophische Untersuchungen / Philosophical Investigations*. Blackwell.

## Související

**Glosář**

- [Bounded Context](@/glossary/bounded-context.md) – heslo, které tento most propojuje s knihou.
- [Adapter Pattern](@/glossary/adapter-pattern.md) – převod mezi rozhraními kontextů.
- [3NL](@/glossary/3nl.md) – vrstvená architektura, do níž kontexty zapadají.

**Kniha**

- [EA-4.3.3 Narušení sémantické stability](@/kompendium/techniques/ea-4-3-3-semantic-stability-disruption.md) – posouvání významu pojmů.
- [EA-1.1.3 Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) – žargon jako nástroj.
- [Detekční signatura: Sémantická eroze](@/kompendium/detection-signatures/8-linguistic-semantic-erosion.md) – pozorovatelný projev.
- [Středně-dobý hermeneutický reset](@/kompendium/recovery-protocols/midterm-hermeneutic-reset.md) – návrat k vlastnímu jazyku.

**Sesterské mosty**

- [Bridge: Motte and Bailey](@/kompendium/glossary-bridges/bridge-motte-and-bailey.md) – ústup mezi dvěma významy.
- [Bridge: 3NL](@/kompendium/glossary-bridges/bridge-3nl.md) – úrovně, na nichž se spor vede.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bounded Context (ohraničený kontext)](@/glossary/bounded-context.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
