+++
title = "QDP (body dluhu kvality)"
weight = 11
description = "QDP (Quality Debt Points): metrika dluhu kvality s váhami závažnosti, její původ v metafoře technického dluhu a meze měření podle Goodharta a Campbella."

[taxonomies]
tags = ["glossary", "kvalita", "metriky", "technický-dluh", "měření", "kompendium"]

[extra]
category = "doktrína platformy"
acronym = "QDP"
related_terms = ["quality-debt", "clean-run", "zero-warning-policy", "regression-test", "autoheal", "autoevolve", "nm-nd", "no-mercy-no-doubts", "violation-protocol"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
+++

## Vymezení

QDP (Quality Debt Points, „body dluhu kvality“) je metrika, kterou Prismatic Platform, vývojové
prostředí, z něhož kompendium vzešlo, vyjadřovala nahromaděný dluh kvality kódu jedním číslem.
Každé zjištěné porušení pravidel kvality, například chybějící typová specifikace veřejné
funkce, varování překladače nebo neošetřený přístup k datům, se započítává určitým počtem bodů
podle své váhy a součet tvoří celkový dluh; metrika tak dává číselnou podobu metafoře
technického dluhu (Cunningham, 1992). Toto heslo se zabývá metrikou jako nástrojem měření: jak
je sestavena, co z ní lze vyčíst a kde jsou její meze. Pojmu dluhu kvality samotnému a jeho
vztahu k technickému dluhu se věnuje heslo [Quality Debt](@/glossary/quality-debt.md).

Kompendium metriku uvádí proto, že ilustruje obecnou epistemickou otázku: co se stane s
poznáním, když se kvalita převede na číslo. Číslo umožňuje srovnání a kontrolu, ale zároveň
vytváří dojem objektivity, který může zastřít, co číslo neměří. Theodore Porter ukázal, že
kvantifikace získává autoritu právě tam, kde chybí důvěra v osobní úsudek, a že tato autorita
není totéž co přesnost (Porter, 1995). Proto heslo vedle popisu metriky věnuje stejnou péči
jejím mezím.

## Teoretický původ

Metrika vychází z metafory technického dluhu, kterou Ward Cunningham zavedl, aby vysvětlil,
že rychle dodaný, ale nedokončený kód je půjčkou: přináší okamžitý zisk, ale každá další práce
na něm platí úroky, dokud se dluh nesplatí přepracováním (Cunningham, 1992). Kruchten, Nord a
Ozkaya později upozornili, že metafora je užitečná pro komunikaci, ale nesnadno se převádí na
přesnou míru, protože dluh zahrnuje i rozhodnutí o architektuře, která žádný nástroj
nezachytí (Kruchten, Nord a Ozkaya, 2012). QDP se omezuje na tu část dluhu, kterou lze zjistit
automaticky, a je tedy užší než pojem, z něhož vychází.

Druhým zdrojem je tradice statické analýzy a „pachů kódu“, tedy povrchových znaků, které
naznačují hlubší problém v návrhu. Martin Fowler a Kent Beck popsali tyto znaky jako podnět k
refaktorování, nikoli jako jednoznačné vady (Fowler, 1999). Platforma je převzala, rozdělila do
druhů porušení a přiřadila jim váhy, čímž z kvalitativního úsudku vytvořila sčítatelnou
veličinu. V doktríně [NM/ND](@/glossary/nm-nd.md) pak metrika sloužila jako kvantitativní
podoba požadavku nulové tolerance: každý nenulový stav byl porušením, které se mělo odstranit
bez odkladu.

## Stavba metriky

Výchozí rámec metriky definoval celkový dluh jako součet počtů porušení vynásobených jejich
vahami. Váhy byly přiřazeny jednotlivým druhům porušení podle závažnosti: vyšší váhu nesl
například neošetřený přístup k datům, blokující čekání v kódu, varování překladače nebo
poznámka k dopracování bez odkazu na úkol, nižší značka provizorního řešení, použití
zastaralého rozhraní, poznámka s odkazem na úkol či drobná stylová nekonzistence. Pozdější
platformní verze tohoto hesla popisovala jinou, podrobnější škálu i rozdělení do domén kvality.
Kniha se drží výchozího rámce, ale konkrétní hodnoty vah neuvádí, protože dokumenty platformy,
v nichž byly stanoveny, nejsou veřejně přístupné. Samotný princip váženého součtu předpokládá,
že váhy různých druhů porušení lze sčítat, což je otázka, k níž se vrací oddíl o mezích metriky
(Stevens, 1946).

Rámec spojil metriku s pravidlem adaptivního splácení. Podle celkové výše dluhu se určila fáze
a s ní kvóta, kterou musí každé pracovní sezení odstranit: čím vyšší dluh, tím vyšší kvóta, a
pod nejnižší hranicí nastupovalo odstranění všeho zbývajícího. Postup sezení měl pevné kroky:
inventura porušení, výpočet dluhu, určení kvóty, výběr cílů s přednostním zaměřením na porušení
s vyšší vahou, oprava s kontrolou překladu po každé změně a záznam výsledku. Stejná pravidla
převzal úvodní dokument standardu [AIAD](@/glossary/aiad.md) jako povinnost každého agenta.
Požadavek ověřit stav po každé jednotlivé opravě odpovídá zásadě refaktorování, podle níž se
kód mění po malých krocích a po každém z nich se znovu spustí testy (Fowler, 1999).

Interní dokumentace platformy uváděla i souhrnná čísla o odstraněném dluhu; kniha je nepřebírá,
protože různé dokumenty uváděly různé souhrny a nezávisle je ověřit nelze. Poučnější než tato
čísla je zkušenost, kterou platforma popsala při postupném odstraňování vad: část porušení,
která přetrvávala i po opravách, se ukázala jako zdánlivá, způsobená zastaralými mezivýsledky
překladu, a po úplném vyčištění sestavovacího prostředí zmizela. Měřicí přístroj tedy chvíli
měřil sám sebe, a ne kód. Teorie měření tento jev popisuje jako ohrožení validity, kdy skóre
zachycuje rozptyl, který s měřeným konstruktem nesouvisí (Messick, 1989).

## Odlišení od příbuzných jevů

QDP je třeba odlišit od obecných měr kvality v nástrojích statické analýzy. Ty většinou třídí
nálezy podle závažnosti a umožňují nastavit prahy, ale ponechávají na týmu, zda nález zablokuje
změnu; QDP byla v platformě spojena s povinnou kvótou splácení a s doktrínou, podle níž se dluh
nemá odkládat. Rozdíl tedy neleží v počítání, ale v tom, jakou institucionální váhu číslo
dostane. Fowler připomíná, že pach kódu je pozvánkou k úvaze, a ne rozsudkem (Fowler, 1999);
metrika, která každý nález trestá stejně neúprosně, tuto úvahu přeskakuje.

Odlišit je třeba i užití metafory dluhu v lidských vztazích. V manipulativním vztahu se dluh
vytváří uměle a připisuje se oběti, aby se cítila zavázána; kompendium tento vzorec popisuje
jako [pěstování emočního dluhu](@/kompendium/techniques/ea-2-2-7-emotional-debt-cultivation.md)
(Cialdini, 1984). Dluh kvality je naproti tomu vlastností díla, ne osoby, a jeho splacení nikoho
nezavazuje vůči někomu jinému. Záměna obou rovin, kdy by se dluh kódu stal měřítkem hodnoty
člověka, který ho napsal, by metriku proměnila v nástroj tlaku.

## Organizační rámec a význam pro práci s poznáním

Pro organizaci je hlavním rizikem každé metriky Goodhartův zákon. Charles Goodhart
pozoroval, že statistická pravidelnost, na kterou se začne působit za účelem řízení, ztrácí
vypovídací hodnotu (Goodhart, 1975), a Donald Campbell formuloval obecnější tezi, že čím více se
kvantitativní ukazatel používá k rozhodování, tím více podléhá tlakům, které ho zkreslují a
narušují proces, jejž měl sledovat (Campbell, 1979). Marilyn Strathernová shrnula oba postřehy
větou, že když se míra stane cílem, přestává být dobrou mírou (Strathern, 1997). Nulový stav
QDP je proto spolehlivý jen tehdy, když se zároveň sleduje, zda se porušení neodstraňují
způsobem, který číslo vylepší a kód nezlepší.

Michael Power popsal „společnost auditu“, v níž se kontrola postupně mění v rituál ověřování,
který ověřuje především sám sebe (Power, 1997). V práci s poznáním z toho plyne poučení, které
kniha uplatňuje i na sebe: kontrola, zda stránka splňuje formální požadavky, například zda
každý odstavec nese citaci, nezaručuje, že citace říká to, co se jí připisuje. Formální míra
musí být doplněna věcným přezkumem, jak vyžaduje pravidlo ověřitelných zdrojů a jak rozvádí
oddíl [sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md)
(Power, 1997).

Myšlenku metriky lze přesto přenést do vyšetřovací a analytické práce v podobě, která její
slabiny nesdílí. Analytik může vést soupis nedoložených tvrzení, otevřených rozporů a
nevyřízených otázek a sledovat, zda se s postupem práce zmenšuje, aniž by jednotlivým položkám
přiřazoval číselné váhy. Richards Heuer doporučoval analytikům zpravodajských služeb výslovně
zapisovat alternativní hypotézy a doklady, které s nimi nesouhlasí, protože bez takového
záznamu mysl nepohodlné doklady snadno přehlédne (Heuer, 1999). Takový soupis plní stejnou
funkci jako dluh kvality, totiž zviditelňuje, co ještě není hotové, ale ponechává posouzení
závažnosti na věcném úsudku, jak rozvádí oddíl
[prevence konfirmačního zkreslení](@/kompendium/cross-domain/16-ea-dd-confirmation-bias-prevention.md)
(Heuer, 1999).

## Meze a otevřené otázky

Metodologickou mezí QDP je, že sčítá váhy, které vyjadřují spíše pořadí závažnosti než její
velikost. Stanley Stevens ukázal, že pořadová škála dovoluje říct, co je závažnější, ale ne
o kolik, a že aritmetické operace s ní mají omezený smysl (Stevens, 1946). Tvrzení, že dvě
poznámky s odkazem na úkol váží stejně jako jeden neošetřený přístup k datům, je proto
konvencí, ne zjištěním. Jako nástroj sledování trendu v jednom projektu je taková konvence
užitečná; jako srovnání mezi projekty nebo týmy by byla zavádějící (Muller, 2018).

Otevřenou otázkou zůstává vztah mezi tím, co metrika zachytí, a tím, na čem skutečně záleží.
Nulový dluh v automaticky zjistitelných kategoriích neříká nic o tom, zda software řeší správný
problém nebo zda je jeho architektura udržitelná (Kruchten, Nord a Ozkaya, 2012). Údaje o
odstraněném dluhu navíc existovaly jen v interní dokumentaci platformy, která není veřejně
přístupná, a kniha je proto neuvádí; nulový stav metriky lze v tomto světle chápat jen jako
sebepopis platformy, nikoli jako doložený výsledek.

## Literatura

- Campbell, D. T. (1979). Assessing the impact of planned social change. *Evaluation and
  Program Planning, 2*(1), 67–90.
- Cialdini, R. B. (1984). *Influence: The psychology of persuasion*. William Morrow.
- Cunningham, W. (1992). The WyCash portfolio management system. In *OOPSLA '92: Addendum to
  the proceedings on object-oriented programming systems, languages, and applications*. ACM.
- Fowler, M. (1999). *Refactoring: Improving the design of existing code*. Addison-Wesley.
- Goodhart, C. A. E. (1975). Problems of monetary management: The U.K. experience. In
  *Papers in monetary economics* (Vol. 1). Reserve Bank of Australia.
- Heuer, R. J. (1999). *Psychology of intelligence analysis*. Center for the Study of
  Intelligence, Central Intelligence Agency.
- Kruchten, P., Nord, R. L., & Ozkaya, I. (2012). Technical debt: From metaphor to theory and
  practice. *IEEE Software, 29*(6), 18–21.
- Messick, S. (1989). Validity. In R. L. Linn (Ed.), *Educational measurement* (3rd ed.).
  American Council on Education; Macmillan.
- Muller, J. Z. (2018). *The tyranny of metrics*. Princeton University Press.
- Porter, T. M. (1995). *Trust in numbers: The pursuit of objectivity in science and public
  life*. Princeton University Press.
- Power, M. (1997). *The audit society: Rituals of verification*. Oxford University Press.
- Stevens, S. S. (1946). On the theory of scales of measurement. *Science, 103*(2684),
  677–680.
- Strathern, M. (1997). „Improving ratings“: Audit in the British university system.
  *European Review, 5*(3), 305–321.

## Související

**Kvalita a doktrína**

- [Quality Debt](@/glossary/quality-debt.md) – pojem dluhu kvality, který metrika měří.
- [Doktrína NM/ND](@/glossary/nm-nd.md) – doktrína, jejíž nulovou toleranci metrika vyjadřovala.
- [Protokol porušení](@/glossary/violation-protocol.md) – jak se zjištěné porušení třídí a řeší.
- [Clean Run](@/glossary/clean-run.md) – stav sestavení bez varování, jedna z domén metriky.
- [Regression Test](@/glossary/regression-test.md) – test, jehož chybění se započítává jako dluh.

**Kontext knihy**

- [Bridge: quality-debt](@/kompendium/glossary-bridges/bridge-quality-debt.md) – propojení
  pojmu dluhu s kapitolami knihy.
- [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md)
  – věcný přezkum, který formální míra nenahradí.
- [Epistemická kalibrace](@/kompendium/detection-signatures/epistemicka-kalibrace.md) – vztah
  mezi číslem a skutečnou spolehlivostí úsudku.
- [Pěstování emočního dluhu](@/kompendium/techniques/ea-2-2-7-emotional-debt-cultivation.md) –
  manipulativní užití metafory dluhu, od něhož je třeba metriku odlišit.
