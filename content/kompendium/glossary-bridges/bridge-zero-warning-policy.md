+++
title = "Bridge: Zero warning policy (politika nulových varování)"
description = "Most mezi politikou nulových varování a knihou: proč každé varování v kódu brání sestavení a proč kniha u lidí nežádá nulovou toleranci, ale pozornost k varovným vzorcům."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "zero-warning-policy", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["zero-warning-policy", "clean-run", "qdp", "nm-nd", "bridge-clean-run", "bridge-violation-protocol"]
parent = "kompendium-glossary-bridges"
glossary_target = "zero-warning-policy"
toc = false
+++

# Bridge: Zero warning policy (politika nulových varování)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Politika nulových varování](@/glossary/zero-warning-policy.md) (*zero warning policy*) je na platformě
Prismatic, z níž kniha vzešla, základní pravidlo vynucování kvality: veškerý kód se musí přeložit se
zapnutým přepínačem, který z každého varování kompilátoru dělá chybu. Nepoužitá proměnná, volání
zastaralé funkce nebo nedosažitelný kód tak zastaví sestavení a zablokují testování, commit, sloučení
i nasazení. Heslo glosáře popisuje politiku jako nejnekompromisnější přístup k diagnostice kompilátoru:
většina projektů toleruje určitou míru varování a spoléhá na úsudek vývojářů, platforma ne. Na politiku
navazuje standard [Clean Run](@/glossary/clean-run.md) a měření dluhu v [QDP](@/glossary/qdp.md);
doktrinálně ji zastřešuje [NM/ND](@/glossary/nm-nd.md).

Heslo glosáře vymezuje vztah ke knize dvojím způsobem. Kniha z politiky přebírá obecný postřeh o
*hladině šumu*: kde se toleruje mnoho drobných varování, přestane být vidět to podstatné. Zároveň výslovně
uvádí, že u lidí kniha **nepožaduje „nulovou toleranci“, ale pozornost k vzorci**. Zatímco
[Bridge: Clean Run](@/kompendium/glossary-bridges/bridge-clean-run.md) se věnuje únavě z varování a
zahlcení pozornosti, tento most rozebírá právě tento rozdíl.

## Pojem v jeho vlastním oboru

Smysl politiky je v tom, že varování kompilátoru jsou levná včasná diagnóza. Opravit je v okamžiku vzniku
stojí minuty; nechat je hromadit znamená, že se mezi stovkami neškodných varování ztratí to jediné, které
ukazuje na skutečnou chybu. Hunt a Thomas (1999) to vyjádřili metaforou rozbitých oken: kód, v němž se
toleruje drobná nedbalost, svádí k další nedbalosti, protože nikdo nevidí důvod udržovat pořádek. Politika
nulových varování je technickým provedením této zásady – a funguje proto, že se týká *artefaktů*,
nikoli lidí.

Podstatné je i to, co politika zakazuje: potlačování varování anotacemi, které je skryjí, místo aby
odstranily jejich příčinu. Varování se nemá umlčet, ale vyřešit.

## Analogie, kterou kniha činí

Ve vztazích a organizacích mají varovné signály podobnou povahu: jednotlivě bývají drobné a snadno se
přehlédnou, ale jejich hromadění ukazuje vzorec. Kniha je popisuje v kapitole
[Rozpoznání varovných signálů](@/kompendium/prevention-resilience/12-warning-sign-recognition.md) a
v detekční signatuře [Akcelerace izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md),
kde každé jednotlivé omezení kontaktu má „dobré vysvětlení“, ale jejich součet vede k izolaci. Lidskou
obdobou potlačování varování je **bagatelizace**: „to nic nebylo“, „on to tak nemyslel“, „všichni
občas křičí“. Varovný signál se umlčí, místo aby se prozkoumal.

Proč tedy kniha u lidí nepřebírá nulovou toleranci? Zkušenost s ní v lidských institucích je
nepříznivá. Pracovní skupina Americké psychologické asociace (American Psychological Association Zero
Tolerance Task Force 2008) zhodnotila politiky nulové tolerance ve školách a dospěla k závěru, že
nezlepšují bezpečnost ani chování a nepřiměřeně postihují některé skupiny žáků. Harcourt (2001)
kriticky rozebral policejní strategie odvozené od teorie rozbitých oken a zpochybnil empirickou oporu
jejich účinnosti. U lidí tedy přísné postihování každého drobného prohřešku nevede k větší bezpečnosti;
vede k tomu, že se problémy skrývají.

Kniha proto přebírá z politiky jen první polovinu: **varování se nemá ignorovat ani umlčet**. Druhou
polovinu – automatické zastavení a trest – nahrazuje pozorností k vzorci, rozhovorem a odstupňovanou
reakcí, jak to popisuje [Bridge: Práh (threshold)](@/kompendium/glossary-bridges/bridge-threshold.md).

## Kde se pojem v knize vyskytuje

Platformní souvislosti vysvětluje kapitola [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md)
a stránka [Quality Monitor a sledování EA](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md).
Lidskou stranu – sledování drobných varování ve vztazích a v práci – rozvádějí kapitoly
[Monitorování vztahů](@/kompendium/prevention-resilience/15-relationship-monitoring.md),
[Vigilance zaměstnavatele](@/kompendium/prevention-resilience/16-employer-vigilance.md) a příručka
[Audit vztahů](@/kompendium/self-defense-guides/22-relationship-audit.md). Reakci na porušení pravidel,
která má u lidí jiná pravidla než u kódu, rozebírá [Bridge: Violation protocol](@/kompendium/glossary-bridges/bridge-violation-protocol.md).

## Od pojmu k praxi

### Rozpoznání

Signálem, že se varování v prostředí normalizují, je, že se o nich nemluví, ale „všichni o nich vědí“;
že se vysvětlují jednotlivě, nikdy jako celek; a že ten, kdo na ně upozorní, je vnímán jako přecitlivělý.
U jednotlivce je takovým signálem vnitřní dialog, který každou nepříjemnou zkušenost hned omlouvá, a pocit,
že „kdybych to řekl nahlas, znělo by to přehnaně“.

### Odlišení

Pozornost k varovným signálům není podezíravostí. Každý vztah má třenice a každá organizace chyby;
jednotlivý signál o manipulaci nevypovídá. Rozdíl je v tom, zda se signály opakují, zda jdou jedním směrem
a zda je možné o nich mluvit. Stejně tak je třeba odlišit pozornost k vzorci od hypervigilance po traumatu,
kdy člověk vidí ohrožení všude; tu kniha řadí do klinického posouzení, nikoli do sebeobrany.

### Obrana

Obranou je dělat s varováními to, co politika dělá s diagnostikou kompilátoru, ale bez automatického
trestu: zaznamenat je hned, neumlčovat je vysvětlením a po čase se podívat, zda netvoří vzorec. Příručka
[Rozpoznávání spouštěčů](@/kompendium/self-defense-guides/12-trigger-recognition.md) pomáhá oddělit
skutečné varování od reakce na staré zranění. V organizacích odpovídá politice mechanismus, v němž má každé
hlášení odpověď a nikdo není za hlášení postihován.

### Zotavení a rámec pro profesionály

Lidé po dlouhodobé manipulaci mívají „vypnutá varování“: naučili se, že jejich znepokojení je přehnané.
Zotavení zahrnuje obnovu důvěry ve vlastní signály, ale bez přechodu do opačného extrému. Terapeut
pomáhá klientovi rozlišovat mezi varováním, které si zaslouží pozornost, a reakcí, která patří minulosti.

## Časté omyly

Prvním omylem je přenášet do lidských vztahů pravidlo „jedno varování a konec“. U lidí vede nulová
tolerance spíše ke skrývání než k nápravě. Druhým omylem je opačný extrém – tolerovat vše, protože
„nikdo není dokonalý“; tak se varování normalizují. Třetím omylem je myslet si, že politika nulových
varování zaručuje bezchybný kód; zachycuje jen to, co kompilátor umí rozpoznat.

## Příklad (anonymizovaný kompozit)

Mladá žena si v prvním roce vztahu všimne, že partner kontroluje její telefon, komentuje její přátele a
občas zvýší hlas. Každou situaci si vysvětlí jednotlivě. Na radu kamarádky si začne drobné události
zapisovat, bez hodnocení. Po třech měsících vidí v záznamu vzorec, který v jednotlivých případech
nevnímala. Nerozejde se okamžitě, ale vyhledá poradnu, kde si situaci promyslí a naplánuje další kroky.
Rozhodující nebyla „nulová tolerance“, ale to, že přestala varování umlčovat.

## Meze a otevřené otázky

Analogie mezi diagnostikou kompilátoru a lidskými varovnými signály je omezená: kompilátor pracuje
s jasnými pravidly, lidské signály jsou nejednoznačné a závisejí na kontextu. Otevřenou otázkou je, jak
naučit lidi brát varování vážně bez toho, aby se z prevence stala podezíravost, a jak navrhnout
instituce, které na drobné signály reagují včas, ale přiměřeně.

## Literatura

- American Psychological Association Zero Tolerance Task Force (2008). Are zero tolerance policies effective in the schools? An evidentiary review and recommendations. *American Psychologist*, 63(9), 852–862.
- Harcourt, B. E. (2001). *Illusion of Order: The False Promise of Broken Windows Policing*. Harvard University Press.
- Hunt, A., & Thomas, D. (1999). *The Pragmatic Programmer: From Journeyman to Master*. Addison-Wesley.

## Související

**Glosář**

- [Zero Warning Policy](@/glossary/zero-warning-policy.md) – heslo, které tento most propojuje s knihou.
- [Clean Run](@/glossary/clean-run.md) – standard sestavení bez šumu.
- [QDP](@/glossary/qdp.md) – měření nahromaděných porušení.

**Kniha**

- [Rozpoznání varovných signálů](@/kompendium/prevention-resilience/12-warning-sign-recognition.md) – varování ve vztazích.
- [Detekční signatura: Akcelerace izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md) – součet drobných omezení.
- [Audit vztahů](@/kompendium/self-defense-guides/22-relationship-audit.md) – záznam a vyhodnocení vzorce.
- [Monitorování vztahů](@/kompendium/prevention-resilience/15-relationship-monitoring.md) – prevence.

**Sesterské mosty**

- [Bridge: Clean Run](@/kompendium/glossary-bridges/bridge-clean-run.md) – únava z varování.
- [Bridge: Violation protocol](@/kompendium/glossary-bridges/bridge-violation-protocol.md) – reakce na porušení.
- [Bridge: Práh (threshold)](@/kompendium/glossary-bridges/bridge-threshold.md) – odstupňovaná reakce.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Zero warning policy (politika nulových varování)](@/glossary/zero-warning-policy.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
