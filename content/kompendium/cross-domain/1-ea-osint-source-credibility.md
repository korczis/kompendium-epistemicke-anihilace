+++
title = "OSINT: důvěryhodnost zdrojů pod epistemickým tlakem"
description = "Jak hodnotit spolehlivost otevřených zdrojů, když prostředí obsahuje záměrnou manipulaci: oddělení zdroje a informace, laterální čtení, kruhové citace a kalibrace."
weight = 10

[taxonomies]
tags = ["kompendium", "cross-domain", "osint"]
categories = ["academic"]

[extra]
related_terms = ["8-ea-osint-cross-source-triangulation", "7-ea-osint-narrative-injection", "10-ea-dd-source-weighting", "15-ea-dd-evidence-quality-assessment"]
toc = true
+++

Zpravodajství z otevřených zdrojů ([OSINT](@/glossary/osint.md)) stojí na předpokladu, že
z veřejně dostupných informací lze sestavit spolehlivý obraz o osobě, firmě nebo události.
Tento předpoklad je stále křehčí: otevřené prostředí obsahuje vedle omylů a šumu také
záměrně vytvořený obsah, jehož účelem je ovlivnit, co si o věci myslí ten, kdo ji zkoumá.
Kniha popisuje [epistemickou anihilaci](@/glossary/epistemicka-anihilace.md) jako proces,
který u jednotlivce rozkládá schopnost hodnotit zdroje a revidovat přesvědčení. Na úrovni
analytika a organizace se stejný rozklad projevuje jako postupná ztráta schopnosti odlišit
spolehlivý zdroj od zdroje, který jen spolehlivě vypadá.

Tato stránka popisuje, jak hodnocení důvěryhodnosti zdrojů v OSINT a navazujících
disciplínách ([due diligence](@/glossary/due-diligence.md), bezpečnost, žurnalistika) obstojí v prostředí s manipulací.

## Doména a problém

Zpravodajská tradice odděluje dvě otázky: **jak spolehlivý je zdroj** a **jak věrohodná je
konkrétní informace**. Systém používaný v NATO a v mnoha zpravodajských službách (tzv.
Admiralty code) hodnotí zdroj písmeny A–F a informaci číslicemi 1–6; spolehlivý zdroj tak
může přinést nepotvrzenou informaci a neznámý zdroj informaci potvrzenou z jiných stran.
Heuer (1999) zdůraznil, že analytici mají sklon tyto dvě roviny slévat – informaci od zdroje,
kterému důvěřují, přijímají bez dalšího ověření, a naopak informaci, která zapadá do jejich
očekávání, přijímají i od zdroje slabého.

V otevřeném prostředí se problém zesiluje tím, že signály důvěryhodnosti jsou levné.
Profesionálně vypadající web, citace dalších webů, aktivní účty na sociálních sítích nebo
tisková zpráva distribuovaná agenturou nevyžadují velké náklady. Metzgerová a Flanaginová
(2013) ukázali, že lidé při hodnocení online informací spoléhají na heuristiky – vzhled,
shodu s ostatními, pověst značky –, které jsou užitečné v běžném prostředí, ale snadno
zneužitelné tam, kde je někdo cíleně napodobuje.

## Průnik s epistemickou anihilací

Kniha popisuje řadu technik, které míří přímo na hodnocení zdrojů. [Reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md)
spočívá v tom, že pochybná informace projde řetězcem stále důvěryhodněji působících
prostředníků, až se objeví v citovatelném zdroji. [Pseudo-konsenzus](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md)
vytváří dojem, že „všichni“ něco tvrdí. [Expertní disinflace](@/kompendium/techniques/ea-2-1-1-expertni-disinflation.md)
naopak snižuje váhu skutečně kompetentních zdrojů. Výsledkem není jedna chybná informace,
ale zkreslený systém vah, podle něhož analytik hodnotí všechno další.

Goldman (2001) formuloval problém laika, který má rozhodnout mezi dvěma experty, aniž by
sám rozuměl oboru: může se opírat o argumenty, o shodu dalších expertů, o hodnocení
nezávislých autorit, o zájmy a o dosavadní úspěšnost. Každé z těchto vodítek lze
manipulovat – shodu lze vyrobit, nezávislost předstírat, úspěšnost vybírat. Analytik OSINT
je v pozici Goldmanova laika častěji, než si přiznává, protože pracuje napříč obory.

Pro jednotlivce, který je předmětem šetření, má chybné hodnocení zdrojů přímé důsledky.
Pokud se do profilu osoby dostane nepravdivá informace z „důvěryhodného“ zdroje, osoba čelí
tomu, co kniha popisuje jako [epistemickou injustici](@/glossary/epistemicka-injustice.md):
její vlastní svědectví o sobě má menší váhu než cizí záznam (Fricker 2007).

## Rozpoznávací znaky

Prvním znakem manipulovaného zdrojového prostředí je **neúměrná shoda**: mnoho zdrojů
opakuje stejné formulace, stejné detaily a stejné chyby. Skutečně nezávislé zdroje se
v detailech liší; shoda ve formulacích ukazuje na společný původ (viz
[cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md)).
Druhým znakem je **mladá a tenká historie zdroje** – web nebo účet, který vznikl krátce
před událostí, nemá archivní stopu a jeho autoři nejsou dohledatelní mimo něj. Třetím
znakem je **asymetrie mezi sebevědomím a doložením**: zdroj tvrdí s velkou jistotou věci,
k nimž neuvádí primární doklad (srov. [nepřiměřená sebejistota](@/kompendium/detection-signatures/9-behavioral-disproportionate-confidence.md)).

Čtvrtým znakem je **monokultura zdrojů** v samotné analýze: pokud celý profil stojí na
zdrojích z jedné sítě, jednoho jazyka nebo jednoho typu (např. jen média, bez úředních
záznamů), roste riziko, že analytik převzal jednu perspektivu jako realitu (viz
[monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md)).
Pátým znakem je **časová koordinace**: vlna publikací o subjektu v krátkém období, zvlášť
před důležitým rozhodnutím (transakcí, výběrovým řízením, soudním jednáním).

## Rámec: standardy a odpovědnost

Hodnocení zdrojů v OSINT nemá jednotný právní rámec, ale řídí se několika zavedenými
standardy. Vedle zpravodajského systému hodnocení zdrojů jde o metodiku laterálního čtení,
kterou Wineburg a McGrew (2019) popsali u profesionálních ověřovatelů faktů: místo
důkladného čtení samotného webu ověřovatel nejprve opustí stránku a zjistí, co o zdroji
říkají jiné, nezávislé zdroje. Při zpracování osobních údajů v rámci OSINT platí GDPR,
zejména zásada přesnosti (čl. 5 odst. 1 písm. d)), která ukládá přijmout opatření k opravě
nepřesných údajů – tedy i povinnost hodnotit spolehlivost zdroje, z něhož údaj pochází.

## Ochranná opatření

Základním opatřením je **oddělené hodnocení zdroje a informace** u každé položky profilu,
s výslovným záznamem, z čeho hodnocení vychází. Druhým je **sledování původu**: u každé
informace dohledat, odkud se poprvé objevila, a teprve původní zdroj hodnotit – druhotné
citace se nepočítají jako nezávislé potvrzení. Třetím je **laterální čtení** u každého
nového zdroje. Čtvrtým je **povinná protistrana**: u závažných závěrů aktivně hledat zdroje,
které by je vyvrátily, a zaznamenat výsledek hledání (srov. [prevence konfirmačního zkreslení](@/kompendium/cross-domain/16-ea-dd-confirmation-bias-prevention.md)).
Pátým je **karanténa nových zdrojů**: informace z dosud neznámého zdroje se do závěrů
nepromítá, dokud není ověřena jinou cestou.

Organizačně je užitečné, aby hodnocení zdrojů nebylo v rukou jediného analytika. Druhý
pohled – kolega, který profil čte bez znalosti hypotézy – pomáhá zachytit, kde se váhy
zdrojů posunuly nepozorovaně. Tyto postupy navazují na [triangulaci napříč zdroji](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md)
a na [vážení zdrojů v due diligence](@/kompendium/cross-domain/10-ea-dd-source-weighting.md).

## Lidský rozměr a zotavení

Analytici, kteří pracují dlouhodobě v prostředí s manipulací, popisují dvě opačné deformace:
postupnou ztrátu citlivosti (vše je „normální šum“) a plošnou podezíravost (nevěřím ničemu).
Obě jsou formou toho, co kniha nazývá [epistemickou regresí](@/glossary/epistemicka-regrese.md),
a obě vedou k horším rozhodnutím. Ochranou je kalibrace – pravidelné srovnání vlastních
odhadů s tím, jak věci dopadly – a supervize. Pro osoby, které byly poškozeny chybným
profilem, je klíčová možnost se o záznamu dozvědět a opravit ho.

## Přesah do dalších oborů

Problém hodnocení zdrojů pod tlakem manipulace není vlastní jen OSINT. V medicíně se
projevuje jako otázka, kterým studiím a kterým doporučením věřit, když část literatury
financují zainteresované strany; v soudnictví jako hodnocení svědků a znaleckých posudků,
z nichž některé si strany „objednaly“; ve školství jako výuka toho, jak žák rozpozná
spolehlivý zdroj na internetu. Wineburg a McGrew (2019) ukázali, že studenti i vysokoškolsky
vzdělaní dospělí hodnotí weby převážně podle vzhledu a vlastního obsahu, zatímco
profesionální ověřovatelé faktů je hodnotí podle toho, co o nich říkají jiné zdroje.
Tato dovednost je přenositelná a lze ji učit – kniha ji rozvádí ve
[vzdělávacím scénáři evaluace zdrojů](@/kompendium/educational-scenarios/4-source-evaluation.md).
Společným jmenovatelem je, že důvěryhodnost se nemá odvozovat od toho, jak zdroj sám
o sobě mluví.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Analytik připravuje podklad o firmě, která se uchází
o veřejnou zakázku. Vyhledávání vrátí patnáct článků, které firmu spojují s podvodem. Při
sledování původu zjistí, že dvanáct z nich přebírá text jednoho blogu, který vznikl tři
týdny před vyhlášením zakázky a jehož autor není dohledatelný. Tři zbývající články jsou
z regionálních médií a odkazují na soudní spor, který skutečně proběhl, ale skončil
smírem. Analytik zapíše informaci „podvod“ jako nepotvrzenou z jednoho neznámého zdroje,
spor jako potvrzený se zmínkou o výsledku a upozorní zadavatele, že kolem firmy probíhá
koordinovaná publikační vlna, jejíž původce není znám.

## Meze a otevřené otázky

Hodnocení zdrojů nikdy neodstraní nejistotu; jen ji zviditelní. Otevřenou otázkou je, jak
hodnotit zdroje v prostředí generativních modelů, kde lze levně vytvořit nejen texty,
ale i celé sítě zdánlivě nezávislých webů a profilů, a jak zabránit tomu, aby automatizované
hodnocení důvěryhodnosti samo nevytvářelo nové monokultury.

## Literatura

- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing.*
- Goldman, A. I. (2001). Experts: Which ones should you trust?
- Heuer, R. J. (1999). *Psychology of Intelligence Analysis.*
- Metzger, M. J., Flanagin, A. J. (2013). Credibility and trust of information in online environments: The use of cognitive heuristics.
- Wineburg, S., McGrew, S. (2019). Lateral reading and the nature of expertise.

## Související

**Mezioborové mosty**

- [Triangulace napříč zdroji](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) – nezávislost potvrzení.
- [Vážení zdrojů v due diligence](@/kompendium/cross-domain/10-ea-dd-source-weighting.md) – převod hodnocení do rozhodnutí.
- [Injekce narativu](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md) – jak se do zdrojů dostává cílený obsah.

**Detekční signatury a techniky**

- [Reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md) – praní pověsti zdroje.
- [Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – zdánlivě nezávislé zdroje.
- [EA-2.1.9 Pseudo-konsenzus](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – vyrobená shoda.

**Sebeobrana a pojmy**

- [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – osobní praxe.
- [OSINT](@/glossary/osint.md) – heslo glosáře.
- [Epistemická injustice](@/glossary/epistemicka-injustice.md) – škoda chybného profilu.
