+++
title = "Analýza síly testu a velikost vzorku"
description = "Jak určit, kolik účastníků studie o epistemické manipulaci potřebuje: síla testu, nejmenší zajímavý účinek, shlukování, víceúrovňové designy a malé populace."
weight = 19

[taxonomies]
tags = ["kompendium", "research-methodology", "quantitative"]
categories = ["academic", "methodology", "research"]

[extra]
related_terms = ["effect-size-EA", "RCT-EA-considerations", "survey-design-EA", "pre-registration-EA-research"]
parent = "kompendium-research-methodology"
toc = true
+++

Studie s příliš malým vzorkem není jen „slabší“. Je neetická: zatěžuje účastníky – v tomto
oboru často lidi s bolestnou zkušeností – a přitom má malou šanci odpovědět na svou otázku.
Pokud přesto něco „najde“, je odhad účinku pravděpodobně nadsazený. Analýza síly testu
(*power analysis*) určuje velikost vzorku předem, aby výzkum
[epistemické anihilace](@/glossary/epistemicka-anihilace.md) ani neplýtval účastníky, ani je
nevystavoval zátěži zbytečně.

## Vymezení

**Síla testu** je pravděpodobnost, že studie odhalí účinek dané velikosti, pokud skutečně
existuje. Závisí na čtyřech veličinách, které jsou navzájem provázané: velikosti účinku,
hladině významnosti (α), velikosti vzorku a designu (počet skupin, opakovaná měření,
shlukování). Známe-li tři, dopočítáme čtvrtou. Klasickým východiskem je Cohen (1988);
běžně dostupným nástrojem program G*Power (Faul a kol. 2007), pro složité designy simulace.

Alternativou ke klasické síle testu je **plánování přesnosti**: velikost vzorku se volí tak,
aby interval spolehlivosti odhadu nebyl širší než předem stanovená mez. Tento přístup sedí
lépe ke studiím, které chtějí účinek *odhadnout*, ne jen „prokázat“.

## Kdy metodu použít

- Před každou konfirmační kvantitativní studií – jako součást [pre-registrace](@/kompendium/research-methodology/pre-registration-EA-research.md)
  a žádosti o [etické posouzení](@/kompendium/research-methodology/IRB-protocol-design-EA.md).
- Při posuzování, zda je studie vůbec proveditelná v dostupné populaci – u vzácných
  zkušeností může analýza ukázat, že je nutná spolupráce více pracovišť.
- Zpětně ne: „post hoc“ síla spočítaná z pozorovaného účinku nic nového neříká. Smysluplná
  je jen citlivostní analýza – jaký nejmenší účinek mohla studie s daným vzorkem odhalit.

## Postup

1. **Určení nejmenšího zajímavého účinku.** Ne „jaký účinek čekáme“, ale „jaký nejmenší účinek
   by měl praktický význam“. Opora: klinicky významná změna, náklady zásahu, předchozí
   studie (s vědomím, že publikované účinky bývají nadsazené – viz
   [velikost účinku](@/kompendium/research-methodology/effect-size-EA.md)).
2. **Volba α a cílové síly** (běžně 0,05 a 0,80 nebo 0,90) a jejich zdůvodnění.
3. **Zohlednění designu**: opakovaná měření (korelace mezi měřeními), shlukování (účastníci
   v týmech, třídách, skupinách – koeficient vnitrotřídní korelace a z něj inflace vzorku),
   více testovaných hypotéz.
4. **Odhad úbytku** a navýšení náboru.
5. **Simulace** u víceúrovňových a longitudinálních modelů, kde uzavřené vzorce neexistují.
6. **Dokumentace** všech vstupů tak, aby výpočet šel zopakovat.

## Specifika výzkumu epistemické manipulace

**Malé a obtížně dosažitelné populace.** Lidé po odchodu z konkrétních typů skupin, oběti
dlouhodobé [coercive control](@/glossary/coercive-control.md) nebo účastníci soudních sporů
o [nepřípustný vliv](@/glossary/undue-influence.md) jsou relativně malé a skryté populace.
Analýza síly může ukázat, že konfirmační studie na jednom pracovišti není možná. Poctivé
odpovědi pak jsou: konsorcium více pracovišť, změna otázky na takovou, kterou lze zodpovědět
(např. odhad s danou přesností místo testu hypotézy), nebo kvalitativní design, který
nepředstírá statistickou generalizaci.

**Neznámé účinky.** Konstrukty knihy jsou nové; předchozí studie s přímo srovnatelnými měřeními
často neexistují. Vhodné je vycházet z příbuzných oblastí (psychické týrání, trauma) a výpočet
provést pro rozumné rozpětí účinků.

**Shlukování ve skupinách.** Pokud se zkoumají členové několika skupin či organizací,
lidé ve stejné skupině si jsou podobní. Ignorování shlukování dává falešně úzké intervaly.
Efektivní velikost vzorku může být mnohem menší než počet respondentů.

**Etický rozměr velikosti vzorku.** Příliš velký vzorek je také problém, pokud účast nese
zátěž: zbytečně mnoho lidí odpovídá na bolestné otázky. Analýza síly je proto součástí
posouzení rizika a přínosu (viz [výzkum zranitelných populací](@/kompendium/research-methodology/vulnerable-population-research.md)).

**A co kvalitativní studie?** Logika síly testu se na rozhovory nepřenáší, otázka „kolik
je dost“ ale zůstává. Pojem teoretické saturace z [zakotvené teorie](@/kompendium/research-methodology/grounded-theory-EA.md)
bývá používán příliš volně („rozhovory jsme vedli do saturace“). Malterud, Siersma
a Guassora (2016) navrhli uvažovat o „informační síle“ vzorku: čím užší cíl studie, čím
specifičtější zkušenost účastníků, čím silnější teoretické ukotvení a čím kvalitnější
dialog, tím menší vzorek stačí. U výzkumu EA to znamená, že deset hloubkových rozhovorů
s lidmi s velmi specifickou zkušeností může nést víc informace než třicet povrchních – ale
jen tehdy, když to studie zdůvodní.

## Kritéria kvality

| Oblast | Co doložit |
|---|---|
| Účinek | nejmenší zajímavý účinek a jeho zdůvodnění |
| Parametry | α, cílová síla, jednostranný / oboustranný test |
| Design | korelace opakovaných měření, koeficient shlukování, počet testů |
| Úbytek | předpokládaný úbytek a navýšení |
| Nástroj | software, verze, případně simulační kód |
| Citlivost | jaký účinek lze s dosaženým vzorkem odhalit |

## Etika a ochrana účastníků

Etické komise oprávněně odmítají studie, které by vzhledem k velikosti vzorku nemohly
odpovědět na svou otázku. Pokud je studie z povahy věci malá (pilot, studie proveditelnosti),
musí to otevřeně deklarovat a nesmí se pak prezentovat jako důkaz účinnosti. Pilotní studie
slouží k ověření postupů – náboru, srozumitelnosti, bezpečnosti –, ne k odhadu účinku, z něhož
by se počítal vzorek hlavní studie.

## Časté chyby

- velikost vzorku „podle zvyklostí oboru“ bez výpočtu;
- výpočet pro velký účinek převzatý z jedné malé pilotní studie;
- ignorování shlukování v organizacích a skupinách;
- výpočet pro jednoduchý test, zatímco hlavní analýza je složitý model;
- „post hoc síla“ jako obhajoba nevýznamného výsledku.

## Ilustrativní příklad

*Hypotetický výpočet.* Tým plánuje srovnat dva podpůrné programy pro lidi po odchodu
z kontrolujícího vztahu. Za nejmenší zajímavý rozdíl považuje rozdíl, který odpovídá zhruba
polovině změny, jakou lidé popisují jako „znatelně lepší“. Ze standardizovaného vyjádření
tohoto rozdílu vychází pro sílu 0,80 přibližně šedesát až sedmdesát lidí na skupinu; po
započítání očekávaného úbytku přes sto lidí na skupinu. Jedno pracoviště by takový počet
nabíralo roky. Tým proto buď vytvoří konsorcium tří poraden, nebo přeformuluje studii jako
studii proveditelnosti s jasně deklarovanými mezemi.

## Jak číst studii tohoto typu

Většina čtenářů neuvidí analýzu síly v plném znění, ale z publikované studie se dá poznat,
zda byla promyšlená:

- **Je ve zprávě uveden výpočet velikosti vzorku** včetně předpokládaného účinku? Pokud ne,
  je výsledek – zvlášť „pozitivní“ – třeba číst s větší opatrností.
- **Odpovídá předpokládaný účinek realitě oboru?** Výpočet pro velký účinek dává malý vzorek
  a je častým znakem optimistického plánování.
- **Dosáhla studie plánovaného vzorku?** Předčasně ukončený nábor mění význam výsledků
  a zpráva by ho měla vysvětlit.
- **Jak autoři vykládají nevýznamný výsledek?** Nevýznamný výsledek v malé studii neznamená,
  že účinek neexistuje; znamená, že studie ho nedokázala určit. Interval spolehlivosti ukáže,
  které účinky zůstávají ve hře.

Pro praxi plyne jednoduché pravidlo: několik malých studií se stejným směrem výsledků je
cennější podklad než jedna malá studie s dramatickým výsledkem.

## Meze a otevřené otázky

Analýza síly stojí na předpokladech, které jsou u nových konstruktů nejisté. Otevřenou otázkou
oboru je, jak budovat sítě pracovišť a sdílené protokoly, které umožní dostatečně velké studie
v malých populacích – podobně jako se to stalo v jiných oblastech po [replikační krizi](@/glossary/replication-crisis.md).
K financování takové spolupráce viz [financování výzkumu EA](@/kompendium/population-health/29-research-funding-EA.md).

## Literatura

- Cohen, J. (1988). *Statistical Power Analysis for the Behavioral Sciences* (2. vyd.).
- Faul, F., Erdfelder, E., Lang, A.-G., Buchner, A. (2007). G*Power 3: A flexible statistical power analysis program.
- Button, K. S. a kol. (2013). Power failure: why small sample size undermines the reliability of neuroscience.
- Lakens, D. (2022). Sample size justification.
- Malterud, K., Siersma, V. D., Guassora, A. D. (2016). Sample size in qualitative interview studies: Guided by information power.

## Související

**Metody v této sekci**

- [Velikost účinku](@/kompendium/research-methodology/effect-size-EA.md) – vstup každého výpočtu.
- [Randomizované studie](@/kompendium/research-methodology/RCT-EA-considerations.md) – typický design s výpočtem vzorku.
- [Pre-registrace](@/kompendium/research-methodology/pre-registration-EA-research.md) – kde se výpočet zveřejňuje předem.
- [Dotazníkový výzkum](@/kompendium/research-methodology/survey-design-EA.md) – velikost vzorku u šetření.

**Etika**

- [IRB protokol](@/kompendium/research-methodology/IRB-protocol-design-EA.md) – posouzení proveditelnosti a zátěže.
- [Výzkum zranitelných populací](@/kompendium/research-methodology/vulnerable-population-research.md) – zátěž účastníků jako etická veličina.

**Populace a financování**

- [Financování výzkumu EA](@/kompendium/population-health/29-research-funding-EA.md) – podmínky pro velké studie.

**Pojmy**

- [Replikační krize](@/glossary/replication-crisis.md) – důsledky studií s nízkou silou.
