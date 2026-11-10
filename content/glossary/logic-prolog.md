+++
title = "Logické programování a Prolog"
weight = 100
description = "Logické programování a jazyk Prolog: odvozování z explicitních pravidel, předpoklad uzavřeného světa a negace jako neúspěch a jejich poučení pro obranu úsudku."

[taxonomies]
tags = ["glossary", "logika", "epistemologie", "kompendium"]

[extra]
category = "logika a jazyk"
related_terms = ["inference", "tautologie", "cirkularni-argumentace", "logicka-koherence", "modalni-logika", "toulmin-model"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
+++

## Vymezení

Logické programování je paradigma, v němž se program zapisuje jako soubor logických výroků,
tedy faktů a podmíněných pravidel, a výpočet probíhá jako hledání důkazu, že určitý dotaz z
těchto výroků vyplývá (Kowalski, 1974). Nejznámějším jazykem tohoto paradigmatu je Prolog
(z francouzského *programmation en logique*), který vznikl na počátku sedmdesátých let v
Marseille a který zůstává základním nástrojem výuky i výzkumu automatického odvozování
(Colmerauer a Roussel, 1993). Robert Kowalski shrnul myšlenku paradigmatu rovnicí, podle níž
se algoritmus skládá z logiky, která určuje, co se počítá, a z řízení, které určuje, jak se
to počítá (Kowalski, 1979).

V technické linii, z níž kompendium vzešlo, se označení objevuje pro vrstvu logického
odvozování nad znalostní bází; heslo však nepopisuje žádnou konkrétní implementaci a vykládá
pojem jako součást logiky a teorie automatického usuzování. Pro knihu je relevantní proto, že
logické programování činí strukturu úsudku viditelnou: každý závěr lze rozložit na fakta a
pravidla, z nichž byl odvozen, a tím ho podrobit kontrole (Sterling a Shapiro, 1986).

## Teoretický původ

Logické programování stojí na rezolučním principu Johna Alana Robinsona, který ukázal, že
dokazování v predikátové logice prvního řádu lze převést na jediné mechanické odvozovací
pravidlo vhodné pro počítač (Robinson, 1965). Kowalski pak ukázal, že omezená podoba
predikátové logiky, takzvané Hornovy klauzule, má procedurální výklad: pravidlo „A platí,
pokud platí B a C“ lze číst zároveň jako logické tvrzení i jako postup, jak A ověřit (Kowalski,
1974). Alain Colmerauer a Philippe Roussel na tomto základě vytvořili první implementaci
jazyka Prolog, původně pro zpracování přirozeného jazyka (Colmerauer a Roussel, 1993).

Teoretické základy sémantiky logických programů systematicky shrnul John Lloyd, který
popsal vztah mezi deklarativním významem programu, tedy tím, co z něho logicky plyne, a
procedurálním chováním interpretu (Lloyd, 1984). Tento rozdíl je důležitý: interpret nemusí
najít všechny logické důsledky a může v některých případech cyklit, takže to, co program
„ví“, není totéž, co z jeho výroků plyne.

## Mechanismus a pozorovatelné znaky

Dvě vlastnosti Prologu mají přímý epistemologický význam. První je
předpoklad uzavřeného světa, který Raymond Reiter formuloval pro databáze: co není v bázi
uvedeno ani z ní odvoditelné, se pokládá za nepravdivé (Reiter, 1978). Druhou je negace jako
neúspěch, kterou formálně popsal Keith Clark: dotaz „není pravda, že A“ uspěje, pokud se
nepodaří A dokázat (Clark, 1978). Obě vlastnosti jsou v uzavřených doménách, například v
rezervačním systému, rozumné, ale v otevřeném světě lidského poznání vedou k chybě, kdy se
nepřítomnost důkazu zaměňuje za důkaz nepřítomnosti.

Tato záměna má zřetelnou obdobu v manipulativní argumentaci. Výrok „nemůžeš dokázat, že se to
stalo, tedy se to nestalo“ je ve struktuře negací jako neúspěchem, uplatněnou na svět, v němž
důkazy chybějí právě proto, že je někdo zničil nebo nedovolil pořídit (Reiter, 1978).
Pozorovatel rozpozná tento vzorec podle toho, že se rozhodnutí o skutečnosti odvozuje od
obsahu záznamu, který ovládá jedna strana, a že se neúplnost záznamu nepřiznává.

Druhou poučnou vlastností je oddělení platnosti od pravdivosti. Logický program odvozuje
korektně, ale jeho závěry nejsou pravdivější než fakta a pravidla, z nichž vychází; z
nepravdivých premis lze bezchybně odvodit nepravdivé závěry (Lloyd, 1984). Stejně tak
uzavřené ideologie mohou být vnitřně důsledné, a přesto vycházet z premis, které nikdo
nesmí zpochybnit, jak rozvádí heslo [logická koherence](@/glossary/logicka-koherence.md)
(Kowalski, 1979).

## Odlišení od příbuzných jevů

Logické programování je třeba odlišit od obecné [inference](@/glossary/inference.md) v lidském
usuzování. Lidský úsudek pracuje s neurčitostí, s mírou důvěry a s implicitním kontextem,
kdežto logický program pracuje s explicitními a ostře platnými výroky (Kowalski, 1979). Od
statistických a pravděpodobnostních metod umělé inteligence se liší tím, že jeho závěry jsou
plně vysvětlitelné řetězcem pravidel, ale neumějí samy o sobě vážit nejisté důkazy.

Reiter navrhl logiku implicitních předpokladů, která umožňuje přijímat závěry, dokud nejsou
vyvráceny, a tím formálně zachycuje rozdíl mezi „víme, že ne“ a „nevíme, že ano“ (Reiter,
1980). Tento rozdíl je pro epistemickou obranu klíčový. Od [kruhové argumentace](@/glossary/cirkularni-argumentace.md)
se logické programování liší tím, že kruh v pravidlech se projeví jako nekonečné odvozování,
tedy jako zjevná chyba, a ne jako zdánlivý důkaz (Sterling a Shapiro, 1986).

## Klinický, právní a organizační rámec

V právním a vyšetřovacím kontextu je rozlišení předpokladu uzavřeného a otevřeného světa
užitečné při hodnocení argumentů postavených na absenci záznamu. Dokumentace, kterou ovládá
jedna strana, nemůže sloužit jako úplná báze faktů, a z nenalezení záznamu nelze bez dalšího
usuzovat na neexistenci události (Reiter, 1978). Strukturu argumentu lze přitom znázornit i
mimo formální logiku, například v [Toulminově modelu](@/glossary/toulmin-model.md), který
odděluje data, oprávnění a závěr (Toulmin, 1958).

V organizacích, které používají automatizované rozhodovací systémy, plyne z logického
programování požadavek vysvětlitelnosti: každý závěr by měl být vysledovatelný k faktům a
pravidlům, z nichž vzešel, a tato fakta i pravidla by měla být přístupná přezkumu. Tento
požadavek rozvádí kapitola o [vztahu k Decision Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md)
(Kowalski, 1979).

## Obrana a zotavení

Obranné poučení logického programování lze vyjádřit dvěma otázkami. Z jakých faktů a
pravidel tento závěr plyne, a kdo je do báze vložil? A je svět, o němž se mluví, uzavřený,
nebo v něm mohou existovat skutečnosti, které záznam neobsahuje (Reiter, 1978)? Tyto otázky
pomáhají člověku, kterému je předkládán zdánlivě nevyvratitelný řetězec úvah, rozlišit
korektnost odvození od pravdivosti jeho výchozích bodů.

Pro člověka, který dlouhodobě žil v prostředí s vnucenými premisami, je užitečné vědět, že
pocit „nemohu najít chybu v úvaze“ nemusí znamenat, že je úvaha pravdivá; chyba může ležet v
premisách, které nebylo dovoleno zkoumat (Lloyd, 1984). Rozvoj tohoto rozlišení podporuje
vzdělávací scénář [ověřování tvrzení](@/kompendium/educational-scenarios/5-claim-verification.md).

## Meze a otevřené otázky

Logické programování je silné v doménách s jasnými pravidly a slabé tam, kde je poznání
nejisté, kontextové a měnící se; pokusy rozšířit ho o pravděpodobnost a o nemonotónní
usuzování ukazují, jak obtížné je formálně zachytit běžný lidský úsudek (Reiter, 1980).
Analogie mezi předpokladem uzavřeného světa a manipulativní argumentací je v kompendiu
pomůckou k rozpoznání struktury, nikoli tvrzením o psychologii manipulace. Otevřenou otázkou
zůstává, jak propojit vysvětlitelnost logických systémů s pravděpodobnostními metodami tak,
aby výsledné závěry byly zároveň přezkoumatelné i citlivé na nejistotu (Kowalski, 1979).

## Literatura

- Clark, K. L. (1978). Negation as failure. In H. Gallaire & J. Minker (Eds.), *Logic and data
  bases*. Plenum Press.
- Colmerauer, A., & Roussel, P. (1993). The birth of Prolog. *ACM SIGPLAN Notices, 28*(3),
  37–52.
- Kowalski, R. (1974). Predicate logic as programming language. In *Information Processing 74:
  Proceedings of IFIP Congress 74*. North-Holland.
- Kowalski, R. (1979). Algorithm = logic + control. *Communications of the ACM, 22*(7),
  424–436.
- Lloyd, J. W. (1984). *Foundations of logic programming*. Springer.
- Reiter, R. (1978). On closed world data bases. In H. Gallaire & J. Minker (Eds.), *Logic and
  data bases*. Plenum Press.
- Reiter, R. (1980). A logic for default reasoning. *Artificial Intelligence, 13*(1–2), 81–132.
- Robinson, J. A. (1965). A machine-oriented logic based on the resolution principle. *Journal
  of the ACM, 12*(1), 23–41.
- Sterling, L., & Shapiro, E. (1986). *The art of Prolog: Advanced programming techniques*. MIT
  Press.
- Toulmin, S. E. (1958). *The uses of argument*. Cambridge University Press.

## Související

**Pojmy glosáře**

- [Inference](@/glossary/inference.md) – obecný pojem odvozování, jehož je logické
  programování formální podobou.
- [Logická koherence](@/glossary/logicka-koherence.md) – vnitřní bezespornost, která
  nezaručuje pravdivost premis.
- [Kruhová argumentace](@/glossary/cirkularni-argumentace.md) – vada, kterou formální systém
  zviditelní jako nekonečné odvozování.
- [Toulminův model](@/glossary/toulmin-model.md) – neformální znázornění struktury argumentu.
- [Modální logika](@/glossary/modalni-logika.md) – rozšíření logiky o možnost, nutnost a
  vědění.
- [Tautologie](@/glossary/tautologie.md) – výrok pravdivý v každé interpretaci, mezní případ
  logické platnosti.

**Kapitoly**

- [Vztah k Decision Engine](@/kompendium/02-uvod/vztah-k-decision-engine.md) – jak
  kniha chápe vysledovatelnost závěrů.
- [Výpočetní epistemologie](@/kompendium/07-teoreticke-reflexe/computational-epistemology.md) –
  teoretický rámec automatizovaného usuzování.

**Obrana a vzdělávání**

- [Ověřování tvrzení](@/kompendium/educational-scenarios/5-claim-verification.md) – rozlišení
  platnosti a pravdivosti v praxi.
- [Vážení důkazů](@/kompendium/educational-scenarios/7-evidence-weighting.md) – práce s
  nejistými a neúplnými záznamy.
