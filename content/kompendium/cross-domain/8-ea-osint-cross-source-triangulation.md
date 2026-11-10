+++
title = "OSINT: triangulace napříč zdroji"
description = "Kdy jsou tři zdroje skutečně tři: nezávislost potvrzení, kruhové hlášení, jediný zdroj za mnoha ozvěnami a triangulace typů dat místo počítání článků."
weight = 80

[taxonomies]
tags = ["kompendium", "cross-domain", "osint"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["1-ea-osint-source-credibility", "7-ea-osint-narrative-injection", "10-ea-dd-source-weighting", "15-ea-dd-evidence-quality-assessment"]
toc = true
+++

Pravidlo „ověř ze tří zdrojů“ patří k základním zásadám žurnalistiky, zpravodajské analýzy
i [due diligence](@/glossary/due-diligence.md). Jeho síla stojí na jediném předpokladu: že zdroje jsou na sobě nezávislé.
Pokud tři články opakují tutéž tiskovou zprávu, nejde o tři potvrzení, ale o jedno
potvrzení třikrát. V prostředí, kde lze levně vytvářet ozvěny, se triangulace bez kontroly
nezávislosti stává rituálem, který vytváří falešnou jistotu – přesně ten stav, který kniha
popisuje jako zdánlivé poznání bez skutečné opory.

## Doména a problém

Pojem triangulace převzaly sociální vědy z navigace a zeměměřictví. Denzin (1970) rozlišil
čtyři typy: triangulaci **dat** (různé zdroje), **výzkumníků** (různí pozorovatelé),
**teorií** (různé výklady) a **metod** (různé postupy). Tato typologie je pro OSINT užitečnější
než prosté počítání zdrojů: tři novinové články jsou triangulací v nejslabším smyslu,
zatímco shoda novinového článku, úředního rejstříku a výpovědi očitého svědka je triangulací
napříč typy dat s odlišnými chybami.

Zpravodajská analýza zná opačné selhání pod názvem **kruhové hlášení** (*circular reporting*):
informace z jednoho zdroje se dostane k analytikovi několika cestami a vypadá jako nezávisle
potvrzená. Nejznámějším doloženým příkladem je zdroj s krycím jménem „Curveball“, jehož
tvrzení o iráckých mobilních laboratořích pro biologické zbraně hrála významnou roli
v hodnoceních před válkou v Iráku v roce 2003; vyšetřovací komise později konstatovala,
že šlo o jediný nespolehlivý zdroj, jehož informace byly přebírány bez dostatečného ověření
(Commission on the Intelligence Capabilities of the United States Regarding Weapons of
Mass Destruction 2005).

## Průnik s epistemickou anihilací

Kniha popisuje [pseudo-konsenzus](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md)
a [falešný konsensus](@/kompendium/techniques/ea-2-4-falesny-konsensus.md) jako vytvoření
dojmu shody, který neodpovídá skutečnosti. Na úrovni jednotlivce tento dojem oslabuje
vlastní úsudek („všichni to říkají, asi se mýlím“); na úrovni analytika vytváří falešné
potvrzení. Oba mechanismy využívají toho, že lidé používají počet hlasů jako zkratku za
pravděpodobnost pravdy.

Druhým průnikem je [epistemická monokultura](@/glossary/epistemicka-monokultura.md):
pokud všechny zdroje pocházejí z jednoho ekosystému – jednoho jazyka, jedné politické
orientace, jedné sítě médií –, sdílejí i jeho slepá místa. [Signal plurality](@/glossary/signal-plurality.md),
tedy různorodost signálů s odlišnými zdroji chyb, je proti tomu hlavní ochranou.

Třetím průnikem je psychologie potvrzení. Lidé vnímají opakovanou informaci jako
pravdivější – tento efekt iluzorní pravdy popsali Hasher, Goldstein a Toppino (1977)
a pozdější výzkum ukázal, že působí i u lidí, kteří správnou odpověď znají. Ozvěny
jednoho zdroje tedy nejen formálně vypadají jako nezávislá potvrzení, ale i psychologicky
zvyšují důvěru analytika v tvrzení. Pravidlo tří zdrojů, které má chránit před omylem,
může bez kontroly nezávislosti omyl posilovat. Kniha tento mechanismus u jednotlivců
popisuje v souvislosti s [informačním přetížením](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md)
a opakovanou expozicí stejným tvrzením.

## Rozpoznávací znaky

Na to, že triangulace je zdánlivá, ukazuje **textová shoda** mezi zdroji (stejné formulace,
citace, chyby), **společný první výskyt** (všechny zdroje odkazují ke stejnému primárnímu
dokumentu nebo osobě), **časová posloupnost** typická pro přebírání (jeden zdroj, pak během
hodin další), **stejný typ dat** (jen média, jen sociální sítě) a **chybějící vlastní
doložení** u druhotných zdrojů. Kniha tyto znaky shrnuje v signaturách [cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md)
a [monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md).

## Rámec: standardy a odpovědnost

Pro triangulaci neexistuje právní norma, ale existují profesní standardy. Zpravodajská
praxe hodnotí věrohodnost informace podle toho, zda je **potvrzena jinými nezávislými zdroji**
(nejvyšší stupeň věrohodnosti v systému A–F/1–6). Heuer (1999) varoval, že analytici mají
sklon považovat konzistentní informace z více zdrojů za silnější, než jsou, pokud nevědí,
zda zdroje nesdílejí společný původ. Novinářské standardy ověřování, jak je shrnuje například
příručka *Verification Handbook* (Silverman 2014), zdůrazňují návrat k primárnímu zdroji
a ověření jeho původu.

## Ochranná opatření

Základní praxí je **mapa původu**: u každého tvrzení zaznamenat, z jakého primárního zdroje
pochází, a teprve primární zdroje počítat. Druhou praxí je **triangulace typů**: k mediálním
zdrojům hledat úřední záznamy, dokumenty, technická data nebo přímé svědectví. Třetí praxí
je **aktivní hledání neshody**: zdroje, které tvrzení zpochybňují, mají v analýze stejné
místo jako ty, které ho potvrzují. Čtvrtou praxí je **triangulace výzkumníků**: druhý
analytik, který ověřuje klíčová tvrzení nezávisle. Pátou je **záznam stupně potvrzení**
u každého tvrzení v podkladu (např. „jeden primární zdroj, tři ozvěny“). Navazující postupy
popisuje [vážení zdrojů](@/kompendium/cross-domain/10-ea-dd-source-weighting.md) a pro
jednotlivce [rutina cross-source](@/kompendium/self-defense-guides/36-cross-source-routine.md).

## Lidský rozměr a zotavení

Pro osoby, o nichž se šíří informace z jediného zdroje přes mnoho ozvěn, je zkušenost
zvlášť zraňující: protože „všude se píše totéž“, okolí považuje věc za prokázanou. Pomáhá
jim, když někdo – novinář, právník, analytik – ukáže původ tvrzení a jeho jediný zdroj.
V osobní rovině kniha doporučuje [triangulaci zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)
i pro lidi, kteří se zotavují z manipulace: vracet se k vlastním primárním záznamům
a k nezávislým svědkům místo opakovaných výkladů jedné osoby.

## Přesah do dalších oborů

Kruhové potvrzení se objevuje i mimo OSINT. Ve vědě má podobu citačních řetězců, v nichž
se tvrzení opakuje s odkazem na články, které ho samy jen převzaly, až se původní slabý
doklad ztratí. V medicíně podobu anamnézy, v níž se jednou zapsaná informace přebírá
do dalších zpráv jako ověřená. V soudnictví podobu svědků, kteří si vzájemně předávali
verzi události, takže jejich shoda nevypovídá o tom, co viděli (viz
[třetiosobní potvrzení](@/kompendium/forensic-legal/37-third-party-corroboration.md)).
Ve skupinách s vysokou kontrolou podobu „svědectví“ členů, která se navzájem potvrzují,
protože vycházejí ze stejného výkladu vedení. Denzinova (1970) typologie triangulace je
v každém z těchto oborů použitelná stejně: hodnota potvrzení roste s odlišností zdrojů chyb.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Podklad pro rozhodnutí o spolupráci s nadací uvádí, že
její ředitel „podle tří zdrojů“ zneužil dary. Analytik při revizi zjistí, že všechny tři
články odkazují na jediný příspěvek bývalého zaměstnance na sociální síti, který byl později
smazán. Úřední záznamy (výroční zprávy, auditní zprávy ve Sbírce listin) žádné nesrovnalosti
neukazují. Podklad je přepracován: tvrzení je označeno jako „jeden nepotvrzený primární zdroj
se třemi ozvěnami“ a doporučeno je vyžádat si od nadace vysvětlení a auditní dokumentaci.

Při rozhovoru s nadací se ukáže, že bývalý zaměstnanec odešel po pracovním sporu a jeho
stížnost na hospodaření byla prošetřena nezávislým auditorem bez nálezu. To neznamená, že
jeho obavy byly nutně neopodstatněné – ale znamená to, že podklad nemůže tvrdit víc než
„jedna osoba vznesla obvinění, které nezávislé přezkoumání nepotvrdilo“. Rozhodnutí
o spolupráci tak stojí na tom, co je doloženo, a nikoli na tom, kolikrát bylo totéž
zopakováno. Zároveň zůstává otevřena cesta, aby nadace zlepšila transparentnost svého
hospodaření, pokud by se objevily nové a nezávislé informace.

## Meze a otevřené otázky

Ani skutečně nezávislé zdroje nezaručují pravdu – mohou se mýlit stejným směrem ze stejného
důvodu. Otevřenou otázkou je, jak hodnotit nezávislost v prostředí, kde mnoho obsahu vzniká
s pomocí stejných jazykových modelů a stejných agregátorů dat, takže „různé“ zdroje mohou
mít skrytě společný původ.

## Literatura

- Commission on the Intelligence Capabilities of the United States Regarding Weapons of Mass Destruction (2005). *Report to the President of the United States.*
- Denzin, N. K. (1970). *The Research Act: A Theoretical Introduction to Sociological Methods.*
- Hasher, L., Goldstein, D., Toppino, T. (1977). Frequency and the conference of referential validity.
- Heuer, R. J. (1999). *Psychology of Intelligence Analysis.*
- Silverman, C. (ed.) (2014). *Verification Handbook.*

## Související

**Mezioborové mosty**

- [Důvěryhodnost zdrojů](@/kompendium/cross-domain/1-ea-osint-source-credibility.md) – hodnocení jednotlivých zdrojů.
- [Vážení zdrojů v due diligence](@/kompendium/cross-domain/10-ea-dd-source-weighting.md) – převod do rozhodnutí.
- [Hodnocení kvality důkazů](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md) – síla doložení.
- [Injekce narativu](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md) – zdroj ozvěn.

**Signatury a sebeobrana**

- [Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – zdánlivá nezávislost.
- [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – osobní praxe.

**Pojmy**

- [Signal plurality](@/glossary/signal-plurality.md) – různorodost signálů.
- [Epistemická monokultura](@/glossary/epistemicka-monokultura.md) – společná slepá místa.
