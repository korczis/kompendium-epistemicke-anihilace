+++
title = "Bridge: Quality debt (dluh kvality)"
description = "Most mezi heslem dluhu kvality a knihou: metafora dluhu, který roste s odkládáním, a jeho obdoby u lidí a institucí – od odkládaných reforem po mlčení o problémech."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "quality-debt", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["quality-debt", "qdp", "clean-run", "zero-warning-policy", "bridge-qdp", "bridge-clean-run"]
glossary_target = "quality-debt"
toc = false
+++

# Bridge: Quality debt (dluh kvality)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Dluh kvality](@/glossary/quality-debt.md) (*quality debt*) je na platformě Prismatic, z níž kniha
vzešla, souhrnné označení všech odchylek od standardů kvality, které zůstaly v kódu neopravené:
chybějících typových specifikací, varování statické analýzy a kompilátoru, zakázaných vzorů a dalších.
Na rozdíl od volně chápaného „technického dluhu“ je dluh kvality na platformě přesně vymezen a měřen
v [bodech QDP](@/glossary/qdp.md). Heslo glosáře popisuje, jak platforma přešla od postupného snižování
dluhu k prevenci: změna, která dluh zvyšuje, se do kódu nedostane.

Tento most se nesoustředí na měření – tomu se věnuje [Bridge: QDP](@/kompendium/glossary-bridges/bridge-qdp.md) –,
ale na **metaforu dluhu**: nedostatek, který se neodstraní hned, se nehromadí lineárně, ale „úročí“,
protože každá další práce na něm staví. Kniha se s touto metaforou potkává dvakrát: u institucí,
které odkládají řešení problémů, a u vlastního obsahu, který má také svůj dluh.

## Pojem v jeho vlastním oboru

Metaforu zavedl Cunningham (1992): rychle napsaný kód je jako půjčka, která urychlí dodávku, ale
pokud se nesplatí přepracováním, splácí se úroky v podobě stále obtížnějších změn. Fowler (1999)
popsal refaktoring jako soustavné splácení tohoto dluhu malými kroky, které nemění chování programu,
ale zlepšují jeho strukturu. Kruchten, Nord a Ozkaya (2012) shrnuli, že technický dluh není jen
metafora, ale řiditelný jev: dá se identifikovat, měřit a vědomě řídit, a nebezpečný je především dluh
neviditelný. Lehman (1980) už dříve formuloval pozorování, že složitost vyvíjejícího se programu roste,
pokud se na jejím snižování soustavně nepracuje.

Podstatné je rozlišení mezi **vědomým** a **nevědomým** dluhem. Vědomý dluh je rozhodnutím, které někdo
přijal a eviduje; nevědomý dluh se hromadí, aniž by o něm kdokoli věděl. Platforma se podle hesla
glosáře snaží o to, aby žádný dluh nebyl nevědomý.

## Analogie, kterou kniha činí

V organizacích má dluh kvality obdobu v **odkládaných problémech**: v nevyřešených stížnostech,
v pravidlech, která se nedodržují, v konfliktech, o nichž se neví nebo nemluví. Morrisonová a
Millikenová (2000) popsaly *organizační mlčení* – stav, v němž zaměstnanci problémy nehlásí, protože
se obávají následků nebo nevěří, že by hlášení něco změnilo. Takové mlčení je nevědomým dluhem
instituce: problémy existují, ale nejsou nikde evidovány, a proto rostou. Vaughanová (1996) ukázala na
případu raketoplánu Challenger, jak se opakované drobné odchylky postupně normalizovaly, až přestaly být
vnímány jako problém – úroky dluhu se tehdy splácely katastrofou.

Kniha tento vzorec sleduje v prostředích, kde manipulace přetrvává právě proto, že instituce odkládá
její řešení: v akademickém prostředí ([Akademický dohled](@/kompendium/prevention-resilience/17-academic-supervision-prevention.md)),
v klinické praxi ([Klinická vigilance](@/kompendium/prevention-resilience/18-clinical-vigilance-prevention.md))
i v zaměstnání ([Vigilance zaměstnavatele](@/kompendium/prevention-resilience/16-employer-vigilance.md)).
Každé nevyřešené oznámení zvyšuje „dluh“: příští oznamovatel ví, že předchozí neuspěl, a mlčí.

## Kde se pojem v knize vyskytuje

Platformní souvislosti popisují stránky [Quality Monitor a sledování EA](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)
a [AutoHeal a oprava regresí](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md). Lidskou
a institucionální stranu rozvádějí oddíl [Organizační obrana](@/kompendium/organizational-defense/_index.md)
a kapitola [6.10 Kolektivní a institucionální intervence](@/kompendium/06-klinicke-aplikace/kolektivni-intervence.md).
Heslo glosáře připomíná i dluh samotné knihy: stránky bez diakritiky, bez odkazů nebo s nejistými zdroji
se evidují kontrolami informační architektury a odstraňují po vlnách, nikoli zamlčují.

## Od pojmu k praxi

### Rozpoznání

Institucionální dluh se pozná podle toho, že problémy jsou „všem známé“, ale nikde zapsané; že se na
otázku, proč se něco neřeší, odpovídá „tak to tu bylo vždycky“; a že lidé, kteří na problém upozorní,
jsou vnímáni jako potížisté. U jednotlivce se obdobný vzorec projevuje odkládáním rozhodnutí, která by
vyžadovala konfrontaci, a hromaděním drobných ústupků, z nichž každý je sám o sobě malý.

### Odlišení

Je třeba odlišit dluh kvality od vědomého odložení, které je rozumné. Ne každý problém je nutné řešit
hned a priorizace je legitimní. Rozdíl je v evidenci: odložený problém, o němž se ví, kdo za něj odpovídá
a kdy se k němu vrátí, je řízeným dluhem; problém, který „zmizel“ z agendy, je dluhem nevědomým.
U jednotlivce je pak třeba odlišit odkládání od vyhýbání se jako příznaku traumatu; vyhýbání se
připomínkám traumatické zkušenosti patří k jádrovým příznakům posttraumatické stresové poruchy a
vyžaduje terapeutickou, nikoli „disciplinární“ odpověď.

### Obrana

Pro instituce je obranou udělat dluh viditelným: vést evidenci oznámení a jejich vyřízení, pravidelně
ji vyhodnocovat a chránit ty, kdo problémy hlásí. Kniha k tomu odkazuje na
[EA-4.2.5 Ochrana oznamovatelů](@/kompendium/techniques/ea-4-2-5-whistleblower-protection.md) a na
[Hlášení incidentů](@/kompendium/forensic-legal/39-incident-reporting.md). Obdobou prevence na platformě
je zásada, že nový problém se řeší hned, dokud je malý, a nepřidává se k hromadě starých.

### Zotavení a rámec pro profesionály

Lidé, kteří odcházejí z prostředí s velkým institucionálním dluhem, často nesou jeho část s sebou:
pocit, že problémy se neřeší, a nedůvěru k jakékoli instituci. Zotavení zahrnuje zkušenost, že oznámení
může vést k nápravě – proto je důležité, aby instituce, na které se obrátí poté, odpověděly rychle a
srozumitelně. Profesionál, který přijímá oznámení, by měl vědět, že jeho reakce buď dluh splácí, nebo
ho zvyšuje.

## Časté omyly

Prvním omylem je myslet si, že dluh lze odstranit jednorázovou kampaní a pak na něj zapomenout. Bez
prevence se znovu nahromadí; platforma proto podle hesla glosáře přešla od nápravy k prevenci. Druhým
omylem je zaměňovat nulový evidovaný dluh s nulovým skutečným dluhem; nevědomý dluh evidence nezachytí.
Třetím omylem je přenášet na lidi představu, že každý nedostatek je „dluh“, který je třeba okamžitě
splatit. Lidé potřebují čas a některé věci se zpracovávají postupně.

## Příklad (anonymizovaný kompozit)

Na fakultě se několik let šíří neoficiální informace, že jeden školitel ponižuje doktorandy. Žádná
stížnost není podána, protože první, kdo si stěžoval, přišel o grant. Nová proděkanka zavede anonymní
hodnocení školitelů a nezávislého ombudsmana. První rok přijde několik oznámení, která potvrdí
dlouhodobý vzorec. Fakulta vyřeší případ a zveřejní, jak postupovala. Následující rok přicházejí
oznámení o drobnějších problémech dřív, než se rozrostou – dluh se začal splácet.

## Meze a otevřené otázky

Metafora dluhu je užitečná, ale zjednodušující: lidské a institucionální problémy nemají přesnou „cenu“
a jejich „úroky“ nelze spočítat. Otevřenou otázkou je, jak instituce rozpoznají nevědomý dluh, o němž
z definice nevědí, a jak vytvářet prostředí, v němž je bezpečné ho pojmenovat. Pro samotnou knihu
zůstává otázkou, jak zajistit, aby splácení obsahového dluhu po vlnách nevedlo k povrchnímu doplňování
textu, které by vytvořilo dluh nový.

## Literatura

- Cunningham, W. (1992). The WyCash portfolio management system. In *OOPSLA '92 Addendum to the Proceedings* (experience report). ACM.
- Fowler, M. (1999). *Refactoring: Improving the Design of Existing Code*. Addison-Wesley.
- Kruchten, P., Nord, R. L., & Ozkaya, I. (2012). Technical debt: From metaphor to theory and practice. *IEEE Software*, 29(6), 18–21.
- Lehman, M. M. (1980). Programs, life cycles, and laws of software evolution. *Proceedings of the IEEE*, 68(9), 1060–1076.
- Morrison, E. W., & Milliken, F. J. (2000). Organizational silence: A barrier to change and development in a pluralistic world. *Academy of Management Review*, 25(4), 706–725.
- Vaughan, D. (1996). *The Challenger Launch Decision: Risky Technology, Culture, and Deviance at NASA*. University of Chicago Press.

## Související

**Glosář**

- [Quality Debt](@/glossary/quality-debt.md) – heslo, které tento most propojuje s knihou.
- [QDP](@/glossary/qdp.md) – metrika, jíž se dluh měří.
- [Zero Warning Policy](@/glossary/zero-warning-policy.md) – prevence nového dluhu.

**Kniha**

- [Organizační obrana](@/kompendium/organizational-defense/_index.md) – instituce a jejich odpovědnost.
- [EA-4.2.5 Ochrana oznamovatelů](@/kompendium/techniques/ea-4-2-5-whistleblower-protection.md) – jak dluh zviditelnit.
- [Akademický dohled](@/kompendium/prevention-resilience/17-academic-supervision-prevention.md) – prevence v akademickém prostředí.
- [6.10 Kolektivní a institucionální intervence](@/kompendium/06-klinicke-aplikace/kolektivni-intervence.md) – práce s institucí.

**Sesterské mosty**

- [Bridge: QDP](@/kompendium/glossary-bridges/bridge-qdp.md) – měření a jeho meze.
- [Bridge: Clean Run](@/kompendium/glossary-bridges/bridge-clean-run.md) – hladina šumu a normalizace odchylky.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Quality debt (dluh kvality)](@/glossary/quality-debt.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
