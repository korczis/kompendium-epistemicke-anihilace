+++
title = "Doktrína NM/ND"
weight = 3
description = "Doktrína NM/ND (No Mercy, No Doubts): dvě ramena, bod přechodu od zkoumání k jednání a meze rozhodné jistoty v práci s poznáním."

[taxonomies]
tags = ["glossary", "doktrína", "epistemologie", "teorie-rozhodování", "kvalita", "kompendium"]

[extra]
category = "doktrína platformy"
abbreviation = "NM/ND"
related_terms = ["violation-protocol", "clean-run", "regression-test", "aiad", "session-discipline", "nabla-infinity", "trinity-gate", "qdp", "zero-warning-policy", "no-mercy-no-doubts", "epistemicka-pokora", "falsifikace"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
+++

## Vymezení

Zkratka NM/ND označuje doktrínu „No Mercy, No Doubts“ („žádná milost, žádné pochyby“), kterou
autor kompendia formuloval jako řídicí zásadu vývoje Prismatic Platform, prostředí, z něhož
kniha vzešla. Doktrína se skládá ze dvou ramen: „No Mercy“ žádá nulovou toleranci k chybám,
které by se vracely, protože je někdo pokaždé omluví, a „No Doubts“ žádá důkladné zkoumání před
rozhodnutím a po něm jednání bez vnitřního váhání, pokud jsou data k dispozici. Její postavení
v platformě dokládá archiv knihy: dokumentace aplikace, z níž vzešla taxonomie kompendia,
ukládala, aby každé její použití odpovídalo etickému rámci a doktríně NO MERCY/NO DOUBTS
(Korčák, 2026a). Toto heslo je hlavním výkladem doktríny v knize: popisuje její stavbu, bod
přechodu od zkoumání k jednání a mechanismus vynucení. Myšlenkovým zdrojům hesla a jeho etické
stránce se věnuje sesterské heslo [No Mercy, No Doubts](@/glossary/no-mercy-no-doubts.md).

Kompendium doktrínu nepřebírá jako technický předpis pro software, ale čte ji jako doktrínu
epistemické integrity v práci s poznáním. Její jádro lze vyjádřit dvěma tezemi: tvrzení se
nesmí vydávat za hotové, dokud není doloženo, a jednou rozpoznaná chyba se nesmí znovu objevit
bez povšimnutí. Obě teze mají v epistemologii dlouhou předhistorii. William Clifford hájil
zásadu, že je nesprávné věřit čemukoli na základě nedostatečných důkazů (Clifford, 1877), a
Karl Popper ukázal, že poznání roste tím, že se chybné domněnky systematicky vyřazují, nikoli
tím, že se hromadí potvrzení (Popper, 1959). Pro knihu o rozpadu schopnosti poznávat je
doktrína důležitá i jako protiklad: tam, kde se heslo „žádné pochyby“ vztáhne na osoby a jejich
otázky místo na ověřená data, vzniká přesně ten vzorec, který kompendium popisuje jako
nadřazení doktríny nad osobu (Lifton, 1961).

## Pojmová historie

Doktrína vznikla v prostředí vývoje softwaru s pomocí umělé inteligence a byla svázána se
standardem [AIAD](@/glossary/aiad.md), který každému agentovi, příkazu a pracovnímu postupu
ukládal deklarovat podřízenost doktríně v povinném bloku vynucení. Autor její vznik zdůvodňuje
zkušeností, že systémy nereagují na dobré úmysly, ale jen na provedení, a že slib nápravy
„příště“ bývá jen opakováním minulosti; vyrovnání se s chybou proto nemá být odkládáno do
neurčité budoucnosti. Tato úvaha odpovídá metafoře technického dluhu, kterou Ward Cunningham
zavedl pro situaci, kdy se rychlé, ale nedokončené řešení musí později splácet s úroky
(Cunningham, 1992). Interní dokumenty platformy, v nichž byla doktrína zapsána, nejsou veřejně
přístupné; kniha proto její obsah popisuje vlastními slovy a odkazuje jen na to, co dochoval
její archiv.

Archiv knihy dokládá, že doktrína nebyla omezena na kód. Dokumentace aplikace platformy, z níž
se později extrahovala taxonomie kompendia
(`archive/prismatic-platform/apps/prismatic_annihilation/`), uváděla v oddílu o etickém rámci,
že aplikace slouží výhradně obranným účelům a že každé její použití musí odpovídat etickému
rámci a doktríně NO MERCY/NO DOUBTS (Korčák, 2026a); doktrína tak od počátku stála vedle
obranného rámce knihy jako norma pro zacházení s poznatky o manipulaci. Pozdější vývoj doplnil
doktrínu o samostatnou politiku vynucení se čtyřmi stupni porušení, kterou rozebírá heslo
[protokol porušení](@/glossary/violation-protocol.md), a o kontroly rámce [NABLA
Infinity](@/glossary/nabla-infinity.md), které upravují fázi zkoumání. Jednu z nich archiv
dochovává v podobě modulu, který třívrstvou kontrolu Trinity Gate, tedy strukturní konzistenci,
logickou konzistenci a formální nutnost, rozšiřuje o čtvrtou vrstvu detekce technik epistemické
anihilace (Korčák, 2026b).

## Struktura doktríny

První rameno, No Mercy, se týká dokončenosti díla. Žádá, aby nic nebylo odevzdáno jako hotové,
pokud obsahuje pahýl kódu, zástupnou implementaci nebo odložený úkol, aby každá oprava chyby
nesla [regresní test](@/glossary/regression-test.md), který by tutéž chybu příště zachytil, a
aby žádné tvrzení o výsledku nebylo vysloveno bez ověření. V softwarovém inženýrství odpovídá
tento požadavek praxi vývoje řízeného testy, v níž se nejprve formuluje kontrola selhání a
teprve poté řešení (Beck, 2002), a principu jidoka z výrobního systému Toyota, podle něhož se
vada zastavuje v místě vzniku, a ne až na konci linky (Ohno, 1988).

Druhé rameno, No Doubts, upravuje rozhodování. Doktrína formuluje protokol nejistoty: kdo si
není jistý, má se zastavit, zkoumat a ověřit, a teprve poté jednat s plným nasazením; jednat s
pochybností nebo odevzdávat s nejistotou doktrína považuje za porušení. Zdroji oprávněné
jistoty jsou testy, statická analýza, měření a dokumentace, tedy veřejně kontrolovatelné
doklady, nikoli autorita nebo pocit. Charles Sanders Peirce rozlišil metody ustalování
přesvědčení – houževnatost, autoritu, apriorní zalíbení a metodu vědeckou – a jen poslední
podle něj váže přesvědčení na skutečnost nezávislou na tom, kdo věří (Peirce, 1877). Rameno No
Doubts lze číst jako požadavek, aby se jistota ustalovala právě touto čtvrtou cestou.

Mezi oběma rameny stojí bod přechodu. Doktrína se nepopisuje jako další vrstva systému, ale
jako režim řízení: rámec NABLA mapuje nejistotu, drží souběžné hypotézy a snáší epistemické
nepohodlí, zatímco NM/ND určuje okamžik, kdy zkoumání končí a začíná provedení. Bez tohoto bodu
by zkoumání plodilo stále nové varianty a nic by neuzavřelo; bez zkoumání by naopak tvrdost
přešla v brutalitu. Pozdější doktrína epistemických axiomů přechod podmiňuje číselným prahem
důvěry, splněním axiomů a průchodem kontrolou [Trinity Gate](@/glossary/trinity-gate.md).
Archivovaný modul této kontroly ukazuje, jak je do ní zabudována asymetrie mezi potvrzením a
vyvrácením: průchod kontrolou míru důvěry nezvyšuje, kdežto každé zablokování ji snižuje
(Korčák, 2026b).

Z hlediska teorie rozhodování jde o pravidlo zastavení. Abraham Wald ukázal, že při
sekvenčním sběru dat lze předem stanovit hranice, při jejichž dosažení je racionální přestat
sbírat důkazy a rozhodnout (Wald, 1947). Herbert Simon doplnil, že skutečný rozhodovatel
nehledá optimum mezi všemi možnostmi, ale zastavuje se u první, která splní předem stanovenou
úroveň nároků (Simon, 1955). Číselný práh doktríny je takovou úrovní nároků; jeho hodnota je
konvencí platformy, ne odvozeným optimem, a kniha ji tak také uvádí.

Vynucení není ponecháno na dobré vůli. Kontroly před uložením změny, brány kvality v průběžné
integraci a povinný blok v každé specifikaci AIAD převádějí doktrínu v chování nástrojů, takže
porušení se nezjišťuje dodatečnou kontrolou, ale znemožňuje se v místě vzniku, obdobně jako
princip jidoka zastavuje linku u první vady (Ohno, 1988). Porušení se třídí podle [protokolu
porušení](@/glossary/violation-protocol.md) od upozornění přes blokaci a odmítnutí s novým
začátkem až po úplné přezkoumání, kdy byla obejita sama kontrola. Blok vynucení, jehož podobu
ilustruje ukázka níže, nenese žádnou logiku; je to deklarace, podle níž nástroje poznají, jaká
pravidla mají na součást uplatnit.

```yaml
enforcement:
  doctrine: "no-mercy-no-doubts"
  version: "2.0.0"
  compliance: mandatory
```

## Odlišení od příbuzných jevů

NM/ND je nutné odlišit od perfekcionismu. Doktrína sice používá slova jako „dokonalost“, ale
její operační požadavky se týkají dokončenosti a ověřitelnosti, nikoli bezchybnosti: dílo smí
být později vylepšeno, nesmí však být vydáváno za hotové, když hotové není.
[Perfekcionismus](@/glossary/perfekcionismus.md) v psychologickém smyslu je naproti tomu vztah
člověka k sobě samému, v němž se hodnota osoby měří neúprosnými standardy a sebekritikou
(Frost, Marten, Lahart a Rosenblate, 1990). Doktrína se v tomto bodě sama vymezuje zásadou, že
tvrdost patří chybám, a ne lidem.

Ještě důležitější je odlišení od ideologické jistoty. Rameno No Doubts nevylučuje
pochybnost o datech, ale vylučuje váhání poté, co data byla shromážděna a vyhodnocena; zůstává
tedy podřízeno ověřování a otevřené revizi, jakmile se objeví nový doklad (Popper, 1959).
Totalistická skupina pracuje opačně: pochybnost potlačuje dříve, než se ji podaří ověřit, a
odpovědnost za rozpor přenáší na pochybujícího (Lifton, 1961). Psychologie tuto potřebu
rychlého uzavření popisuje jako „uchopení a zamrznutí“, kdy člověk pod tlakem přijme první
přijatelný úsudek a dále ho chrání před novými informacemi (Kruglanski a Webster, 1996).
Rozdíl mezi doktrínou a jejím zneužitím tak leží v tom, zda bod uzavření stanoví důkazy, nebo
autorita; podrobněji ho rozebírá heslo [falsifikace](@/glossary/falsifikace.md).

## Organizační rámec a uplatnění v práci s poznáním

V organizaci znalostní práce lze doktrínu převést do tří pravidel, která kompendium uplatňuje i
samo na sebe. Žádná stránka knihy nesmí být pahýlem ani ohlášením budoucího obsahu, každé
tvrzení musí nést ověřitelný zdroj a nejistý údaj se raději vynechá, než aby byl vydáván za
jistý; jde o přímou analogii požadavků No Mercy na úplnost a No Doubts na doložení. Takové
nastavení odpovídá tomu, co Lorraine Code nazývá epistemickou odpovědností: povinnosti
poznávajícího ručit za to, jak k přesvědčení dospěl, a ne jen za jeho obsah (Code, 1987).

Pro tým je podstatné, že doktrína klade důraz na strukturu, nikoli na osobní hrdinství.
Kontroly v nástrojích chrání před tím, aby se standard rozmělnil pod časovým tlakem, což je
podle literatury o organizačních nehodách typická cesta, jíž se odchylka od pravidla postupně
stane normou (Vaughan, 1996). Zároveň však organizační výzkum ukazuje, že tvrdá pravidla
fungují jen v prostředí, v němž je bezpečné chybu přiznat; tam, kde ohlášení chyby vede k
trestu, se chyby skrývají (Edmondson, 1999). Doktrína proto v kompendiu platí pro výstupy a
tvrzení, nikoli pro hodnocení lidí, jak rozvádí oddíl
[organizační obrana](@/kompendium/organizational-defense/_index.md).

## Význam pro epistemickou obranu

Pro čtenáře, který se zabývá manipulací, nabízí NM/ND užitečný model zdravé jistoty. Daniel
Kahneman ukázal, že pocit jistoty vzniká z koherence příběhu, a ne z kvality důkazů, takže
subjektivní přesvědčení samo o sobě nic neříká o pravdivosti (Kahneman, 2011). Doktrína tento
poznatek obrací v pravidlo: jistota je oprávněná jen tehdy, když ji podepírá vnější doklad,
který může zkontrolovat i někdo jiný, a právě to odlišuje rozhodnost od sebejistoty, kterou
kniha popisuje jako varovný znak.

Druhým přínosem je důraz na paměť chyb. Požadavek, aby se chyba, která se jednou projevila,
už nikdy nepropustila, odpovídá klinické zkušenosti, že zotavení z manipulativního vztahu
vyžaduje pojmenovat vzorec, který působil, a ne jen jednotlivou epizodu (Herman, 1992).
Terapeut nebo vyšetřovatel může z doktríny převzít postoj, v němž se rozpoznaný mechanismus
zapisuje tak, aby příště zachytil i podobný případ, obdobně jako regresní test zachycuje
návrat stejné vady (Beck, 2002). Praktickou podobu rozpracovává oddíl
[obrana proti epistemické anihilaci](@/kompendium/06-obrana/_index.md).

## Meze a otevřené otázky

Hlavní mezí doktríny je, že práh jistoty je číslem jen zdánlivě přesným. Číselná míra důvěry je
konvence, jejíž výpočet závisí na modelu, a výzkum expertního úsudku ukazuje, že odhadované
pravděpodobnosti bývají špatně kalibrované, zvlášť u lidí s jednou velkou teorií (Tetlock,
2005). Kniha proto práh nepovažuje za objektivní míru pravdy, ale za procedurální závazek, že
se před rozhodnutím musí zkoumat a že rozhodnutí lze znovu otevřít.

Druhou otevřenou otázkou je přenos jazyka. Výrazy jako „žádná milost“ nebo „bez výjimek“
jsou v technickém kontextu metaforou pro neúprosnost kontrol, v lidském kontextu však mohou
fungovat jako načtený jazyk, který ukončuje diskusi dříve, než začne (Lifton, 1961). Irving
Janis ukázal, že skupiny s vysokou soudržností a silným vedením mají sklon potlačovat
nesouhlas a přeceňovat vlastní neomylnost (Janis, 1972). Doktrína, která má sloužit epistemické
integritě, si proto musí uchovat i protiváhu: legitimní místo pro pochybnost, která přichází
s novým dokladem, a vědomí, že také „dokončená“ teorie zůstává podle Lakatose jen dočasně
chráněným jádrem výzkumného programu (Lakatos, 1970).

## Literatura

- Beck, K. (2002). *Test-driven development: By example*. Addison-Wesley.
- Clifford, W. K. (1877). The ethics of belief. *Contemporary Review, 29*, 289–309.
- Code, L. (1987). *Epistemic responsibility*. University Press of New England.
- Cunningham, W. (1992). The WyCash portfolio management system. In *OOPSLA '92: Addendum to
  the proceedings on object-oriented programming systems, languages, and applications*. ACM.
- Edmondson, A. (1999). Psychological safety and learning behavior in work teams.
  *Administrative Science Quarterly, 44*(2), 350–383.
- Frost, R. O., Marten, P., Lahart, C., & Rosenblate, R. (1990). The dimensions of
  perfectionism. *Cognitive Therapy and Research, 14*(5), 449–468.
- Herman, J. L. (1992). *Trauma and recovery*. Basic Books.
- Janis, I. L. (1972). *Victims of groupthink*. Houghton Mifflin.
- Kahneman, D. (2011). *Thinking, fast and slow*. Farrar, Straus and Giroux.
- Korčák, T. (2026a). *CLAUDE.md – Prismatic Annihilation* (verze 1.0.0). Archiv kompendia,
  `archive/prismatic-platform/apps/prismatic_annihilation/CLAUDE.md` (dostupné v repozitáři
  knihy).
- Korčák, T. (2026b). *PrismaticAnnihilation.TrinityBridge* (modul). Archiv kompendia,
  `archive/prismatic-platform/apps/prismatic_annihilation/lib/prismatic_annihilation/trinity_bridge.ex`
  (dostupné v repozitáři knihy).
- Kruglanski, A. W., & Webster, D. M. (1996). Motivated closing of the mind: „Seizing“ and
  „freezing“. *Psychological Review, 103*(2), 263–283.
- Lakatos, I. (1970). Falsification and the methodology of scientific research programmes.
  In I. Lakatos & A. Musgrave (Eds.), *Criticism and the growth of knowledge*. Cambridge
  University Press.
- Lifton, R. J. (1961). *Thought reform and the psychology of totalism: A study of
  „brainwashing“ in China*. W. W. Norton.
- Ohno, T. (1988). *Toyota production system: Beyond large-scale production*. Productivity
  Press.
- Peirce, C. S. (1877). The fixation of belief. *Popular Science Monthly, 12*, 1–15.
- Popper, K. R. (1959). *The logic of scientific discovery*. Hutchinson. (Původně *Logik der
  Forschung*, 1934.)
- Simon, H. A. (1955). A behavioral model of rational choice. *Quarterly Journal of
  Economics, 69*(1), 99–118.
- Tetlock, P. E. (2005). *Expert political judgment: How good is it? How can we know?*
  Princeton University Press.
- Vaughan, D. (1996). *The Challenger launch decision: Risky technology, culture, and deviance
  at NASA*. University of Chicago Press.
- Wald, A. (1947). *Sequential analysis*. Wiley.

## Související

**Doktrína a její nástroje**

- [No Mercy, No Doubts](@/glossary/no-mercy-no-doubts.md) – myšlenkové zdroje hesla a jeho
  etická hranice.
- [Protokol porušení](@/glossary/violation-protocol.md) – stupně porušení doktríny a odpověď na
  ně.
- [QDP](@/glossary/qdp.md) – metrika, jíž platforma měřila dluh kvality.
- [AIAD](@/glossary/aiad.md) – standard, který doktrínu ukládá každé specifikaci agenta.

**Epistemický rámec**

- [NABLA Infinity](@/glossary/nabla-infinity.md) – fáze zkoumání, kterou doktrína uzavírá.
- [Trinity Gate](@/glossary/trinity-gate.md) – kontrola, jejímž průchodem je podmíněn přechod
  k jednání.
- [Falsifikace](@/glossary/falsifikace.md) – kritérium, které drží rozhodnou jistotu otevřenou
  revizi.
- [Epistemická pokora](@/glossary/epistemicka-pokora.md) – protiváha, bez níž rozhodnost
  přechází v sebejistotu.

**Kontext knihy**

- [Doktrinální rámec](@/kompendium/02-doktrinalni-ramec/_index.md) – dva významy doktríny
  v kompendiu.
- [Vztah k NABLA Infinity](@/kompendium/02-uvod/vztah-k-nabla.md) – jak kniha navazuje na
  epistemický rámec platformy.
- [Perfekcionismus](@/glossary/perfekcionismus.md) – klinický jev, od něhož je třeba doktrínu
  odlišit.
