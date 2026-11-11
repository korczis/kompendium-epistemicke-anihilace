+++
title = "Firehose of Falsehood (palba lží)"
weight = 60

description = "Model propagandy založený na velkém objemu, rychlosti, mnoha kanálech a lhostejnosti k pravdě i konzistenci; obrací kognitivní zátěž proti hledání pravdy."

[taxonomies]
tags = ["glossary", "security", "epistemic", "kompendium", "propaganda"]

[extra]
category = "security"
related_terms = ["info-ops", "epistemic-security", "deepfake", "gish-gallop", "epistemicka-anihilace", "deplatforming"]
author = "Tomáš Korcak (korczis)"
date_created = "2026-04-25"
date_modified = "2026-11-10"
keywords = ["firehose of falsehood", "RAND", "Russian propaganda", "disinformation", "Paul Matthews", "information warfare"]
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Firehose of Falsehood – glosář"
+++

## Definice

Firehose of Falsehood, česky *palba lží*, je model propagandy, který popsali Christopher Paul
a Miriam Matthewsová ve studii organizace RAND o ruských informačních operacích. Model
vymezuje čtyři rysy, jimiž se tato praxe odchyluje od klasické propagandistické doktríny:
velký objem šířený mnoha kanály, vysokou rychlost a nepřetržité opakování, lhostejnost
k objektivní skutečnosti a lhostejnost ke vnitřní konzistenci (Paul a Matthews, 2016).

Posledním rysem se model nejvíc liší od starších popisů propagandy. Týž zdroj může o téže
události předkládat navzájem protichůdná tvrzení, protože cílem není přesvědčit adresáta
o určité pozici, ale znemožnit, aby jakákoli pozice byla stabilní (Paul a Matthews, 2016).
Novinářský popis téhož prostředí tuto logiku zachycuje slovy, že nic není pravda a všechno je
možné (Pomerantsev, 2014).

Ústřední diagnostické tvrzení autorů zní, že klasická kontrapropaganda – důraz na
důvěryhodnost zdroje, faktickou přesnost a konzistentní sdělení – nedokáže s dynamikou palby
lží držet krok, protože obrana je nákladnější než útok (Paul a Matthews, 2016).

## Původ a kontext pojmu

Studie RAND vznikla po anexi Krymu a navázala na starší zprávu o ruských informačních
operacích, která popsala využívání domácích i zahraničních kanálů ke šíření neslučitelných
verzí (Pomerantsev a Weiss, 2014). Model se opírá i o starší tradici studia sovětských
[aktivních opatření](@/kompendium/historical-cases/21-soviet-active-measures.md), tedy
operací, které cílily na politickou soudržnost protivníka, ne na jeho přesvědčení o jediné
věci (Paul a Matthews, 2016).

Pojmově navazuje model na starší postřeh, že [propaganda](@/glossary/propaganda.md) totalitního typu nemíří na to, aby jí
lidé věřili, ale na to, aby přestali rozlišovat mezi pravdivým a nepravdivým vůbec (Arendt,
1951). Terminologické zařazení mezi příbuzné jevy – dezinformaci, misinformaci a malinformaci
– uvádí přehledová typologie Rady Evropy (Wardle a Derakhshan, 2017); knižní rozbor je
v kapitole [Wardle: typologie
dezinformací](@/kompendium/07-teoreticke-reflexe/wardle-disinformation-typology.md).

Model byl později pozorován i mimo původního aktéra: v domácí politice různých zemí, v
komerčních vlivových operacích a v koordinovaných kampaních obtěžování. Nejlépe se proto chápe
nikoli jako podpis konkrétního státu, ale jako možnost, kterou nabízí současná informační
infrastruktura každému dostatečně vybavenému aktérovi (Paul a Matthews, 2016). Doložený případ
rozebírá kapitola o [Internet Research
Agency](@/kompendium/historical-cases/22-russian-ira.md).

## Jak se projevuje

Na úrovni prostředí se po události objeví během krátké doby více protichůdných verzí, často ze
zdrojů, které spolu zjevně souvisejí, a verze se střídají, aniž by kterákoli byla odvolána
(Paul a Matthews, 2016). Rychlost šíření přitom nahrává nepravdivému obsahu: analýza šíření
zpráv na sociální síti zjistila, že nepravdivé zprávy se šíří dál, rychleji a k více lidem než
pravdivé (Vosoughi a kol., 2018).

Druhým znakem je koordinace, kterou lze pozorovat na síťové úrovni: [koordinované chování
botů](@/kompendium/detection-signatures/20-network-bot-coordination.md) a [asymetrie
zesílení](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md) jsou
signatury právě tohoto vzorce. Ověřování faktů sice přichází, ale zasáhne menší publikum
a naráží na pokračující vliv původního tvrzení i poté, co bylo vyvráceno (Lewandowsky a kol.,
2012).

Na úrovni jednotlivce se objevuje únava, otupělost a pocit, že nic nelze zjistit, a nakonec
věta „všechno je stejně propaganda“ jako konečný závěr (Pomerantsev, 2014). Vyústěním bývá
buď úplný ústup od zpráv, nebo uzavření se do jediného „důvěryhodného“ kanálu, tedy do
prostředí, které už vlastní protihlasy neobsahuje ([epistemic
bubble](@/glossary/epistemic-bubble.md)).

## Mechanismus

Model využívá doložená kognitivní zkreslení. Opakované tvrzení získává na věrohodnosti bez
ohledu na svou pravdivost, což je efekt iluzorní pravdy popsaný už v 70. letech (Hasher a kol.,
1977), a platí i u lidí, kteří správnou odpověď znají (Fazio a kol., 2015). Objem obsahu navíc
vytváří dojem důležitosti a rozšířenosti, protože lidé usuzují na četnost podle snadnosti
vybavení (Tversky a Kahneman, 1973).

Druhou složkou je asymetrická cena opravy. Vyvrácení vyžaduje víc úsilí než tvrzení a i po
vyvrácení původní informace nadále ovlivňuje usuzování, takže obrana po jednotlivých
tvrzeních je strukturálně prohraná (Lewandowsky a kol., 2012). Pravda zůstává dostupná, ale
cena jejího nalezení převýší ochotu ji platit (Paul a Matthews, 2016).

Kniha proto palbu lží popisuje jako kombinaci epistemické falzifikace s kolektivním
kognitivním přetížením, v blízkosti techniky [informačního
přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md); zařazení je vlastní
soustavou knihy (*interpretace knihy*) a vychází z metodických zásad v [metodologických
poznámkách](@/kompendium/02-uvod/metodologicke-poznamky.md). Doloženou částí je, že zahlcení
objemem vede k závěru o nemožnosti poznání, který je přesně tím, o co propaganda tohoto typu
usiluje (Arendt, 1951).

## Odlišení

Od klasické propagandy se palba lží liší cílem a režimem konzistence: klasická propaganda
usiluje o přesvědčení o určité pozici a na vnitřní soudržnost dbá, protože jinak by přesvědčit
nemohla (Paul a Matthews, 2016). Od [Gish Gallopu](@/glossary/gish-gallop.md) se liší
měřítkem: tam jde o rétorický vzorec v jedné debatě, zde o režim celého informačního
prostředí, ačkoli oba využívají asymetrickou cenu opravy (Lewandowsky a kol., 2012).

Od běžné informační záplavy se liší koordinací a lhostejností k pravdě; samotné množství zpráv
v digitálním prostředí není útokem a rozlišení vyžaduje typologii, která odděluje záměr od
pouhé nepřesnosti (Wardle a Derakhshan, 2017). Od [hyperreality](@/glossary/hyperreality.md)
se liší povahou: Baudrillardův pojem popisuje kulturní stav, v němž se ztrácí rozdíl mezi
znakem a skutečností, palba lží je cílená strategie, která takový stav využívá (Baudrillard,
1981).

## Význam pro Kompendium

Pro knihu je palba lží mostem mezi individuální a společenskou rovinou: popisuje, jak se na
úrovni populace vytváří stav, který u jednotlivce odpovídá [epistemické
alienaci](@/glossary/epistemicka-alienace.md), tedy ztrátě přesvědčení, že poznání je vůbec
možné (*interpretace knihy*). Doložená opora tohoto výkladu je v tom, že právě tento závěr
propaganda tohoto typu sleduje (Arendt, 1951). Dopady na populaci shrnuje kapitola o [dopadu
dezinformací na populaci](@/kompendium/population-health/04-disinformation-population-impact.md).

Z modelu plyne i pravidlo pro vážení dokladů: váhu má nezávislost zdrojů, ne jejich počet,
protože velké množství tvrzení z jedné koordinované sítě je jediným zdrojem (Paul a Matthews,
2016). Širší rámec dávají [info-ops](@/glossary/info-ops.md) a [epistemic
security](@/glossary/epistemic-security.md).

## Obrana a zotavení

Pro jednotlivce platí, že pravdivost nelze posuzovat podle četnosti, protože opakování
věrohodnost zvyšuje i u tvrzení, o nichž člověk ví, že jsou nepravdivá (Fazio a kol., 2015).
Prakticky pomáhá ptát se po nezávislosti zdrojů ([triangulace
zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)) a odložit hodnocení
u čerstvých událostí ([vyhodnocení s časovým
odstupem](@/kompendium/self-defense-guides/37-time-locked-evaluation.md)), protože nepravdivé
verze se v prvních hodinách šíří rychleji než jejich opravy (Vosoughi a kol., 2018).

Druhou obranou je omezení příjmu zpráv na vymezená okna ([informační
dieta](@/kompendium/self-defense-guides/33-information-diet.md)) a vědomé odmítnutí závěru, že
nic nelze vědět; právě tento závěr je výsledkem, o který útok usiluje (Arendt, 1951).

Pro instituce a média je účinnější předcházet než vyvracet. Experimentální výzkum ukazuje, že
seznámení s vzorci manipulace předem zvyšuje odolnost vůči pozdějším konkrétním tvrzením
(Roozenbeek a van der Linden, 2019), zatímco oprava po zveřejnění naráží na pokračující vliv
původní informace (Lewandowsky a kol., 2012). Navazují kapitoly [obrana proti
dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md) a [mediální
gramotnost](@/kompendium/prevention-resilience/6-media-literacy-prevention.md);
[deplatforming](@/glossary/deplatforming.md) je jen dílčí a spornou odpovědí.

## Meze pojmu a kritika

Model je popisný a vznikl z analýzy jednoho aktéra v jednom období; neříká, jak účinná palba
lží ve skutečnosti je, a sami autoři ho předkládají jako výklad s možnostmi protiopatření, ne
jako měřený efekt (Paul a Matthews, 2016). Výzkum účinků dezinformací přitom ukazuje, že
dosah bývá soustředěn do malé části publika, takže silné tvrzení o zhroucení celé veřejné
debaty není doložené (Vosoughi a kol., 2018).

Druhou mezí je riziko, že se pojem použije jako nálepka na každou nepříjemnou informační
záplavu, a tím ztratí rozlišovací schopnost; typologie dezinformace existuje právě proto, aby
se záměr odlišil od omylu (Wardle a Derakhshan, 2017). Riziko nadužití rámce rozebírá kapitola
[Přesah rámce](@/kompendium/critical-perspectives/3-framework-overreach.md).

## Literatura

- Arendt, H. (1951). *The Origins of Totalitarianism*. Harcourt, Brace and Company.
- Baudrillard, J. (1981). *Simulacres et simulation*. Galilée.
- Fazio, L. K., Brashier, N. M., Payne, B. K., & Marsh, E. J. (2015). *Knowledge does not protect against illusory truth*. Journal of Experimental Psychology: General.
- Hasher, L., Goldstein, D., & Toppino, T. (1977). *Frequency and the conference of referential validity*. Journal of Verbal Learning and Verbal Behavior.
- Lewandowsky, S., Ecker, U. K. H., Seifert, C. M., Schwarz, N., & Cook, J. (2012). *Misinformation and its correction: Continued influence and successful debiasing*. Psychological Science in the Public Interest.
- Paul, C., & Matthews, M. (2016). *The Russian „Firehose of Falsehood“ Propaganda Model: Why It Might Work and Options to Counter It*. RAND Corporation.
- Pomerantsev, P. (2014). *Nothing Is True and Everything Is Possible*. PublicAffairs.
- Pomerantsev, P., & Weiss, M. (2014). *The Menace of Unreality: How the Kremlin Weaponizes Information, Culture and Money*. Institute of Modern Russia.
- Roozenbeek, J., & van der Linden, S. (2019). *Fake news game confers psychological resistance against online misinformation*. Palgrave Communications.
- Tversky, A., & Kahneman, D. (1973). *Availability: A heuristic for judging frequency and probability*. Cognitive Psychology.
- Vosoughi, S., Roy, D., & Aral, S. (2018). *The spread of true and false news online*. Science.
- Wardle, C., & Derakhshan, H. (2017). *Information Disorder: Toward an Interdisciplinary Framework for Research and Policy Making*. Council of Europe.

## Související

**Pojmy**

- [Info-ops](@/glossary/info-ops.md) – širší kategorie informačních operací.
- [Gish Gallop](@/glossary/gish-gallop.md) – příbuzný vzorec v měřítku jedné debaty.
- [Epistemic security](@/glossary/epistemic-security.md) – rámec na úrovni oboru.
- [Epistemic bubble](@/glossary/epistemic-bubble.md) – prostředí, do něhož zahlcení vyhání.
- [Deepfake](@/glossary/deepfake.md) – sousední plocha hrozby.
- [Hyperrealita](@/glossary/hyperreality.md) – kulturní stav, k odlišení.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – ústřední pojem Kompendia.

**Kniha**

- [Sovětská aktivní opatření](@/kompendium/historical-cases/21-soviet-active-measures.md) – historický předchůdce.
- [Internet Research Agency](@/kompendium/historical-cases/22-russian-ira.md) – doložený případ.
- [Obrana proti dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md) – architektonická obrana.
- [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – svépomocná obrana.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: firehose-of-falsehood](@/kompendium/glossary-bridges/bridge-firehose-of-falsehood.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
