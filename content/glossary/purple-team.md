+++
title = "Purple Team (fialový tým)"
weight = 21
description = "Spolupráce útočného a obranného bezpečnostního týmu nad společným katalogem chování protivníka, a proč se uzavření zjištění nesmí stát cílem měření."

[taxonomies]
tags = ["glossary", "security"]

[extra]
category = "security"
related_terms = ["red-team", "blue-team"]
complexity = "advanced"
domain = "security-operations"
layer = "synthesis"
paradigm = "adversarial-defensive-synthesis"
quality_impact = "high"
safety_level = "safety-critical"
documentation_required = true
see_also = ["red-team", "blue-team"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-14"
keywords = ["Purple", "Team", "Red-Blue", "glossary", "security", "Purple Team", "Red Team", "Blue Team"]
image = "/images/sections/glossary.png"
image_alt = "Purple Team (fialový tým) – glosář"
+++

## Definice

**Purple team** (fialový tým) označuje v kybernetické bezpečnosti spolupráci útočného týmu (*red team*),
který simuluje chování protivníka, s obranným týmem (*blue team*), který útoky detekuje a odráží. Název
vznikl smíšením obou barev: místo aby útočná strana po cvičení předala zprávu a obranná ji později četla,
pracují obě strany společně, takže každý simulovaný útok se okamžitě porovnává s tím, zda ho obrana
zachytila. Strom a kolegové (2018) popisují emulaci protivníka a hodnocení mezer v obraně jako dvě
navazující užití téhož katalogu chování útočníků, a purple teaming je praxe, která je spojuje.

Pro Kompendium je podstatná myšlenka, kterou purple teaming zdůrazňuje: problém smí „uzavřít“ jen ten,
kdo ověřil skutečnou nápravu, nikoli ten, komu uzavření přináší úlevu. Strathern (1997) ukázala, jak
snadno se místo nápravy začne měřit a vykazovat její pouhé formální splnění, a *Interpretace knihy*: v
oblasti epistemické anihilace to platí pro intervence i pro hodnocení zotavení.

## Původ a kontext pojmu

Purple teaming vychází z omezení tradičních cvičení, v nichž útočný a obranný tým pracovaly odděleně.
Útočníci napsali zprávu, obránci ji četli, a převod od „útok uspěl“ k „obrana se zlepšila“ často ztratil
podstatné podrobnosti. Strom a kolegové (2018) z tohoto důvodu navrhli společný slovník taktik a technik,
v němž lze útočné zjištění i obranné opatření zapsat týmž identifikátorem, a tím propojit obě strany
cvičení.

Analogii nabízí bezpečnost letectví, kde se uzavírání bezpečnostních zjištění řídí systémy řízení
bezpečnosti. Mezinárodní organizace pro civilní letectví (ICAO, 2018) v nich požaduje, aby zjištění bylo
uzavřeno teprve tehdy, když bylo nápravné opatření zavedeno a ověřeno jeho účinek, nikoli když uplynul
termín nebo když se o zjištění přestalo mluvit.

## Jak se projevuje

V praxi má purple teaming podobu společného cvičení, v němž útočný tým provede jednu techniku za druhou a
obranný tým u každé z nich ověří, zda ji zachytil, a pokud ne, proč. Výsledek se nezapisuje jako jedna
souhrnná zpráva, ale jako soupis technik, u nichž je uvedeno, zda byly detekovány; Strom a kolegové (2018)
právě takové hodnocení mezer v obraně popisují jako jedno z hlavních užití katalogu ATT&CK.

Druhým projevem je, že se zjištění neuzavírá okamžikem, kdy byla navržena oprava, ale okamžikem, kdy
opakovaná zkouška ukázala, že oprava funguje. Tento požadavek odpovídá zásadě, kterou ICAO (2018) uplatňuje
v systémech řízení bezpečnosti: nápravné opatření se považuje za účinné teprve po ověření.

## Mapování na katalog chování protivníka

Současná praxe purple teamingu se opírá o veřejné katalogy chování protivníka, především o rámec
MITRE ATT&CK (Strom a kol. 2018). Ten popisuje taktiky a techniky pozorované u skutečných
útočníků a dává útočné i obranné straně společný slovník: útočné zjištění lze zapsat jako
identifikátor techniky a obranné opatření jako tvrzení, že právě tuto techniku organizace
detekuje. Teprve tím se smyčka Red–Blue uzavírá nad něčím ověřitelným — nad soupisem tvrzení
o detekci, která lze jedno po druhém zkoušet. Detekční pravidlo se v tomto pojetí chápe jako
hypotéza: má-li smysl, musí být možné popsat pozorování, které by je vyvrátilo.

Mapování na katalog však vede k vlastní epistemické chybě, na niž upozorňují sami autoři rámce:
ATT&CK zachycuje chování, které už někdo zaznamenal. Pokrytí katalogu je proto pokrytím známého,
nikoli pokrytím prostoru hrozeb, a vysoké „pokrytí ATT&CK“ není mírou bezpečnosti (Strom a kol. 2018).
Jakmile se takto spočítaným pokrytím začne vykazovat obranná vyspělost, platí pro ně táž výhrada jako
pro míru uzavření zjištění v následujícím oddílu.

## Když se míra stane cílem

Purple teaming bývá spojován s nedůvěrou k metrikám uzavírání. Strathern (1997) formulovala zobecnění
pozorování, které původně popsal Goodhart (1975) u měnových ukazatelů: když se míra stane cílem, přestane
být dobrou mírou. Campbell (1979) totéž popsal pro sociální ukazatele, jejichž užití při rozhodování vede k
tomu, že se je lidé naučí ovlivňovat, a ukazatele tím ztrácejí vypovídací hodnotu.

V bezpečnostním provozu se tento vzorec projevuje tak, že organizace, která měří míru uzavřených zjištění,
začne optimalizovat uzavírání, nikoli bezpečnost: zjištění se uzavírají kvůli splnění ukazatele, jejich
závažnost se snižuje, aby nezdržela nasazení, a částečné opravy se přijímají jako úplné. Muller (2018)
popisuje tento jev obecněji jako fixaci na metriky, při níž se úsilí přesouvá od věci samé k jejímu
vykazování. *Interpretace knihy*: stejný vzorec zná Kompendium z institucí, které „uzavírají“ stížnosti
obětí kvůli statistikám nebo pověsti; obranou je i tam oddělit toho, kdo uzavírá, od toho, komu uzavření
prospívá (viz [Riziko obětování oběti](@/kompendium/critical-perspectives/13-victim-blaming-risk.md)).

## Význam pro Kompendium

V Kompendiu se purple teaming objevuje jako legitimní protějšek útoku. Stránka o [kaskádě
jailbreaků](@/kompendium/techniques/ea-9-1-3-jailbreak-cascade.md) ho uvádí jako legitimní rámec testování
odolnosti jazykových modelů: Ganguli a kolegové (2022) popisují, jak se modely záměrně zkoušejí útočnými
dotazy, aby se jejich slabiny našly a opravily dřív, než je využije někdo jiný. *Interpretace knihy*:
rozdíl mezi takovým testováním a útokem netkví v technice, ale v souhlasu, vymezeném rozsahu a v tom, že
výsledek slouží obraně.

Druhé užití je metodické. Kniha přejímá z purple teamingu zásadu, že závěr o nápravě má vydat ten, kdo ji
ověřil, a nikoli ten, komu uzavření prospívá, a uplatňuje ji na hodnocení intervencí i zotavení.
*Interpretace knihy*: tato zásada stojí na tomtéž pozorování jako Strathernové (1997) kritika auditu, totiž
že vykazovaný ukazatel se snadno odtrhne od toho, co měl měřit.

## Odlišení

| Odlišit od | Rozdíl |
| --- | --- |
| [Red team](@/glossary/red-team.md) | útočná strana, která simuluje protivníka; purple teaming ji spojuje s obranou |
| [Blue team](@/glossary/blue-team.md) | obranná strana, která útoky detekuje a odráží; purple teaming ji ověřuje proti simulovaným útokům |
| Penetrační test | jednorázová zkouška zranitelnosti s výslednou zprávou; purple teaming je průběžné společné ověřování |

## Co uzavřená smyčka nedokazuje

Úspěšná detekce v testu nedokazuje, že by detekce zafungovala v provozu: test běží ve známém
čase, ze známého místa a často v prostředí, z něhož je část provozního šumu odstraněna.
Nedokazuje ani, že by se skutečný protivník touto cestou vydal — volba cesty závisí na jeho
záměru a možnostech, o nichž simulace nevypovídá. A konečně uzavřené zjištění nedokazuje, že
riziko zmizelo; dokazuje nejvýš, že jeden ověřitelný projev rizika byl odstraněn.
*Interpretace knihy*: právě tato tři rozlišení jsou důvod, proč kniha analogii purple teamingu
užívá jen k rozpoznávání vzorců a nikdy jako důkaz o záměru druhého člověka — ověřená detekce
vzorce říká, co se stalo, ne proč.

## Literatura

- Campbell, D. T. (1979). *Assessing the impact of planned social change*. Evaluation and Program Planning, 2(1).
- Ganguli, D., a kol. (2022). *Red teaming language models to reduce harms: Methods, scaling behaviors, and lessons learned*. arXiv:2209.07858.
- Goodhart, C. A. E. (1975). *Problems of monetary management: The U.K. experience*. Papers in Monetary Economics, Vol. 1. Sydney: Reserve Bank of Australia.
- International Civil Aviation Organization. (2018). *Safety Management Manual* (Doc 9859, 4th ed.). Montréal: ICAO.
- Muller, J. Z. (2018). *The Tyranny of Metrics*. Princeton University Press.
- Strathern, M. (1997). „Improving ratings“: audit in the British University system. *European Review*.
- Strom, B. E., a kol. (2018). *MITRE ATT&CK: Design and Philosophy*. MITRE.

## Související

- [Red Team](@/glossary/red-team.md) – útočná simulace, jejíž zjištění Purple syntetizuje.
- [Blue Team](@/glossary/blue-team.md) – obranný tým dodávající data o obranném postavení.
- [Riziko obětování oběti](@/kompendium/critical-perspectives/13-victim-blaming-risk.md) –
  institucionální „uzavírání“ stížností kvůli statistikám.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: purple-team](@/kompendium/glossary-bridges/bridge-purple-team.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
