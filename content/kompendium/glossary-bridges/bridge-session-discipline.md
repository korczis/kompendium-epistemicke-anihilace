+++
title = "Bridge: Session discipline (disciplína sezení)"
description = "Most mezi heslem disciplíny sezení a knihou: dohledatelnost a kontinuita práce v malých ověřených krocích a proč je záznam v čase obranou proti přepisování minulosti."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "session-discipline", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["session-discipline", "clean-run", "zero-warning-policy", "regression-test", "bridge-clean-run", "bridge-gaslighting"]
parent = "kompendium-glossary-bridges"
glossary_target = "session-discipline"
toc = false
+++

# Bridge: Session discipline (disciplína sezení)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Disciplína sezení](@/glossary/session-discipline.md) (*session discipline*) je na platformě Prismatic,
z níž kniha vzešla, protokol nejvyšší priority pro vývojová sezení, zejména sezení s asistencí umělé
inteligence. Předepisuje, aby každá pracovní položka měla založený úkol, aby se změny ukládaly průběžně
v malých atomických commitech, aby se každý commit hned odeslal na vzdálený repozitář, aby se před
commitem lokálně testovalo, aby se procházelo všemi kontrolními háčky bez jejich obcházení a aby se
uchovával kontext pro navazující sezení. Heslo glosáře zdůvodňuje protokol jednoduše: sezení jsou
pomíjivá, ale změny kódu trvalé; bez disciplíny se výborná práce může ztratit přerušeným spojením nebo
neodeslaným commitem.

Heslo glosáře výslovně uvádí, že pojem patří do kontextu platformy a **netýká se klinických sezení ani
terapie**. Kniha samotná vzniká podobným způsobem – v malých ověřených krocích s kontrolou sestavení.
Tento most popisuje dvě obecné zásady, které z disciplíny sezení plynou a mají v knize své místo:
**dohledatelnost** a **kontinuitu záznamu**.

## Pojem v jeho vlastním oboru

V softwarovém inženýrství patří práce v malých dávkách k nejlépe doloženým praxím. Humble a Farley (2010)
popsali průběžnou dodávku, v níž se každá malá změna okamžitě sestaví a otestuje, a výzkum vývojových
týmů ukázal, že malé dávky, časté integrace a automatické testy souvisejí s vyšší stabilitou i rychlostí
dodávky (Forsgren, Humble a Kim 2018). Disciplína sezení k tomu přidává požadavek, který je specifický
pro práci s jazykovými modely: sezení nemá paměť mezi spuštěními, a proto musí být kontext uložen mimo
ně – v úkolech, v historii commitů a v předávacích poznámkách.

Klíčovou vlastností takové historie je, že je **neměnná a časově uspořádaná**. Kdo chce zjistit, co se
stalo, nespoléhá na vzpomínku účastníků, ale na záznam, který vznikl v okamžiku změny.

## Analogie, kterou kniha činí

Lidská paměť takovou vlastnost nemá. Výzkum ukazuje, že vzpomínky se při vybavování přetvářejí a že
následné informace mohou původní vzpomínku změnit (Loftus 2005); Schacter (2001) shrnul běžné chyby
paměti – od zapomínání po sugestibilitu a zkreslení. To je normální vlastnost paměti, nikoli porucha.
Manipulace ji však může využít. [Gaslighting](@/kompendium/glossary-bridges/bridge-gaslighting.md)
stojí na tom, že druhý zpochybňuje vzpomínky zasaženého a nabízí vlastní verzi minulosti; kde neexistuje
záznam, proti tvrzení stojí jen tvrzení. Kniha tento vzorec popisuje i u technik
[EA-1.3.2 Strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md)
a [EA-4.4.4 Biografická rekontextualizace](@/kompendium/techniques/ea-4-4-4-biographical-recontextualization.md),
které zpětně mění význam událostí.

Lidskou obdobou časově uspořádané historie commitů je proto **záznam pořízený v čase**: deník, uložené
zprávy, poznámky po rozhovoru. Nejde o to, aby člověk dokumentoval celý život, ale aby v situacích, kde
je jeho vnímání soustavně zpochybňováno, měl oporu mimo vlastní paměť. Kniha tento postup rozvádí
v příručce [Paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md).

## Kde se pojem v knize vyskytuje

Profesionální obdobou disciplíny sezení je řádná dokumentace. Kniha ji rozebírá v kapitolách
[Klinická dokumentace EA](@/kompendium/forensic-legal/31-clinical-documentation-EA.md),
[Forenzní dokumentace](@/kompendium/forensic-legal/10-forensic-documentation.md),
[Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md) a
[Rekonstrukce časové osy](@/kompendium/forensic-legal/33-timeline-reconstruction.md). Ve výzkumu odpovídá
disciplíně sezení předregistrace a dohledatelnost postupu; viz [Pre-registrace EA výzkumu](@/kompendium/research-methodology/pre-registration-EA-research.md)
a [Datová bezpečnost EA výzkumu](@/kompendium/research-methodology/data-security-EA-research.md).

## Od pojmu k praxi

### Rozpoznání

Signálem, že v prostředí chybí dohledatelnost, je, že se o minulých událostech vede spor, který nelze
rozhodnout, protože nikdo nemá záznam – a že jedna strana spory soustavně vyhrává. Ve vztazích se to
projevuje větami jako „to jsem nikdy neřekl“ nebo „pamatuješ si to špatně“, které se opakují; v
organizacích tím, že se důležitá rozhodnutí přijímají ústně a později se jejich obsah liší podle toho,
kdo o nich mluví.

### Odlišení

Neshody v tom, jak si lidé pamatují události, jsou běžné a samy o sobě nesvědčí o manipulaci. Rozdíl je
v tom, zda se neshody týkají různých míst a různými směry, nebo zda jsou systematické a vždy ve prospěch
jedné strany. Kniha také upozorňuje, že dokumentace se v kontrolujících vztazích může obrátit proti
zasaženému – pokud je objevena, může vést k eskalaci. Proto je třeba ji vést bezpečně.

### Obrana

Obranou je vést záznam v malých krocích a hned: stručně, s datem, bez interpretace a na místě, k němuž
nemá přístup druhá strana. To je přímá obdoba atomických commitů, které se okamžitě odesílají. Pro
forenzní účely je důležité, aby záznam vznikl v době události a aby se dalo doložit, že nebyl dodatečně
měněn; viz [Řetězec důkazů](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md).

### Rámec pro profesionály

Pro klinika má disciplína záznamu dva rozměry. Řádná dokumentace chrání klienta i terapeuta a je součástí
profesních hranic, které Gutheil a Gabbard (1993) popsali jako základ bezpečného klinického vztahu.
Psychoanalytická tradice zdůrazňuje, že stabilní rámec terapie – čas, místo, pravidla – je sám o sobě
nositelem bezpečí (Bleger 1967). Kniha tyto zásady nespojuje s disciplínou sezení platformy jako s
rovnocenným pojmem, ale ukazuje, že obě stojí na stejném principu: kontinuita a dohledatelnost chrání
před přepisováním toho, co se stalo.

## Časté omyly

Prvním omylem je chápat heslo jako popis terapie; heslo glosáře to výslovně vylučuje. Druhým omylem je
přenášet do lidských vztahů požadavek na úplný záznam všeho. Vztah, v němž si jedna strana dokumentuje
každé slovo druhé, je spíše znakem nedůvěry nebo kontroly; záznam má smysl tam, kde je vnímání soustavně
zpochybňováno. Třetím omylem je považovat záznam za důkaz pravdy; i záznam může být neúplný nebo
zkreslený, a proto je cenný hlavně tím, že vznikl v čase a nelze ho dodatečně upravit.

## Příklad (anonymizovaný kompozit)

Zaměstnanec si stěžuje, že mu vedoucí na poradách zadává úkoly, ale při hodnocení tvrdí, že mu je nikdy
nezadal. Poradkyně mu doporučí, aby po každé poradě poslal vedoucímu krátký e-mail se shrnutím zadání.
Vedoucí zprávy nejprve ignoruje, pak začne zadání v odpovědích měnit. Po třech měsících má zaměstnanec
časově uspořádaný záznam, který ukazuje vzorec. Při jednání s personálním oddělením už nejde o to, čí
paměť je lepší, ale o to, co obsahují dokumenty.

## Meze a otevřené otázky

Analogie mezi historií verzí v softwaru a lidským záznamem je omezená: lidský záznam je vždy výběrem a
interpretací, kdežto commit zachycuje změnu přesně. Otevřenou otázkou je, jak vést bezpečný záznam
v prostředí, kde druhá strana kontroluje zařízení zasaženého, a jak zabránit tomu, aby se z doporučení
„zapisovat si“ stala další zátěž pro člověka, který je už tak vyčerpaný.

## Literatura

- Bleger, J. (1967). Psycho-analysis of the psycho-analytic frame. *International Journal of Psycho-Analysis*, 48, 511–519.
- Forsgren, N., Humble, J., & Kim, G. (2018). *Accelerate: The Science of Lean Software and DevOps*. IT Revolution Press.
- Gutheil, T. G., & Gabbard, G. O. (1993). The concept of boundaries in clinical practice: Theoretical and risk-management dimensions. *American Journal of Psychiatry*, 150(2), 188–196.
- Humble, J., & Farley, D. (2010). *Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation*. Addison-Wesley.
- Loftus, E. F. (2005). Planting misinformation in the human mind: A 30-year investigation of the malleability of memory. *Learning & Memory*, 12(4), 361–366.
- Schacter, D. L. (2001). *The Seven Sins of Memory: How the Mind Forgets and Remembers*. Houghton Mifflin.

## Související

**Glosář**

- [Session discipline](@/glossary/session-discipline.md) – heslo, které tento most propojuje s knihou.
- [Clean Run](@/glossary/clean-run.md) – standard sestavení, který disciplína sezení chrání.
- [Regression Test](@/glossary/regression-test.md) – kontrola před každou změnou.

**Kniha**

- [Paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md) – záznam v čase jako obrana.
- [Klinická dokumentace EA](@/kompendium/forensic-legal/31-clinical-documentation-EA.md) – dohledatelnost v klinické praxi.
- [Rekonstrukce časové osy](@/kompendium/forensic-legal/33-timeline-reconstruction.md) – skládání vzorce z událostí.
- [EA-1.3.2 Strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md) – zpětné přepisování významu.

**Sesterské mosty**

- [Bridge: Gaslighting](@/kompendium/glossary-bridges/bridge-gaslighting.md) – zpochybňování paměti.
- [Bridge: Clean Run](@/kompendium/glossary-bridges/bridge-clean-run.md) – hladina šumu a viditelnost signálu.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Session discipline (disciplína sezení)](@/glossary/session-discipline.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
