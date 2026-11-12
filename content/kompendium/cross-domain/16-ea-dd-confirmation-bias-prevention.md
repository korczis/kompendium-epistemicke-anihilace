+++
title = "Due diligence: prevence konfirmačního zkreslení"
description = "Analýza soupeřících hypotéz, red team, předběžná pitva, oddělení sběru a hodnocení a sekvenční odkrývání informací jako ochrana prověrky před vlastním očekáváním."
weight = 160

[taxonomies]
tags = ["kompendium", "cross-domain", "due-diligence"]
categories = ["academic"]

[extra]
related_terms = ["9-ea-dd-investigation-bias", "15-ea-dd-evidence-quality-assessment", "10-ea-dd-source-weighting", "23-ea-security-attribution-bias"]
toc = true
+++

[Konfirmační bias](@/glossary/konfirmacni-bias.md) – sklon hledat, vykládat a pamatovat
si informace tak, aby potvrzovaly to, co už si myslíme – je nejlépe doloženým a nejobtížněji
odstranitelným zkreslením lidského úsudku. Kniha ho popisuje jako jeden ze vstupních bodů
manipulace: kdo něco očekává, přijme snadno to, co očekávání potvrzuje. Tato stránka
navazuje na popis [kognitivních zkreslení vyšetřovatele](@/kompendium/cross-domain/9-ea-dd-investigation-bias.md)
a soustředí se na postupy, které zkreslení v prověrkách prokazatelně omezují – a na jejich meze.

## Doména a problém

Nickerson (1998) shrnul rozsáhlou literaturu o konfirmačním zkreslení a ukázal, že se
projevuje v mnoha podobách: v tom, jaké otázky si klademe, jaké informace vyhledáváme,
jak vykládáme nejednoznačné údaje a jak hodnotíme informace, které nám odporují. Lord,
Ross a Lepper (1979) v klasickém experimentu doložili, že lidé s opačnými názory, kteří
čtou stejné smíšené důkazy, vycházejí z četby ještě přesvědčenější o svém původním názoru –
každý hodnotí přísněji studie, které mu odporují.

Vědomí zkreslení nestačí k jeho odstranění. Pronin, Lin a Ross (2002) popsali **slepou
skvrnu zkreslení**: lidé snadno vidí zkreslení u druhých a podceňují je u sebe. Proto jsou
účinnější postupy, které zkreslení omezují strukturou práce, než výzvy k tomu, aby analytik
„byl objektivní“.

Heuer (1999) navrhl pro zpravodajskou analýzu **analýzu soupeřících hypotéz** (*analysis
of competing hypotheses*, ACH): analytik vypíše všechny rozumné hypotézy, ke každému důkazu
posoudí, zda je s kterou hypotézou slučitelný, a soustředí se na důkazy, které hypotézy
odlišují. Hypotéza, s níž je v rozporu nejméně důkazů, je nejpravděpodobnější – ne ta,
pro niž svědčí nejvíc důkazů, protože tytéž důkazy mohou svědčit i pro jiné hypotézy.

## Průnik s epistemickou anihilací

V knize je konfirmační zkreslení prostředkem, jímž manipulace drží člověka ve výkladu,
který mu někdo vnutil: každá nová zkušenost je vyložena tak, aby výklad potvrdila.
Kniha popisuje [rekurzivní spirálu pochybností](@/kompendium/techniques/ea-2-5-8-recursive-doubt-spiral.md)
a [strategickou reinterpretaci](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md)
jako techniky, které konfirmační zkreslení využívají. V [due diligence](@/glossary/due-diligence.md) je mechanismus stejný,
jen méně dramatický: první dojem nebo přání zadavatele se stane výkladovým klíčem pro vše
další. Protistrana nebo třetí strana, která očekávání zná, může prověrku řídit tím, že mu
dodá potvrzení.

Kritická perspektiva knihy upozorňuje, že stejné riziko se týká i samotného rámce
epistemické anihilace: kdo ho zná, může ho vidět všude ([Kruhové uvažování v EA detekci](@/kompendium/critical-perspectives/4-circular-reasoning-risk.md)).
Postupy popsané níže jsou proto užitečné i pro kliniky a vyšetřovatele, kteří s rámcem
knihy pracují.

## Rozpoznávací znaky

Na působení konfirmačního zkreslení v prověrce ukazuje, když **zpráva obsahuje jen jednu
hypotézu**; když **důkazy proti** nejsou uvedeny nebo jsou odbyty; když **nejednoznačné
údaje** jsou systematicky vykládány jedním směrem; když **hledání skončilo** po prvním
potvrzení; když **nesouhlas v týmu** nebyl zapsán; a když **závěr nevyžaduje žádnou
výhradu**. Na úrovni organizace je znakem, když prověrky téměř nikdy nevedou ke změně
rozhodnutí, které už bylo neformálně přijato.

## Rámec: standardy a odpovědnost

Standardy analytických postupů ve zpravodajství – například směrnice amerického
zpravodajského společenství o analytických standardech – požadují, aby analýzy uváděly
alternativní hypotézy a míru jistoty. Pro due diligence takové standardy závazné nejsou,
ale jejich převzetí je dokladem odborné péče. U rozhodnutí orgánů obchodních korporací
platí povinnost péče řádného hospodáře, k níž patří i rozhodování na informovaném základě.

## Ochranná opatření

Prvním opatřením je **ACH** pro klíčové otázky prověrky: tabulka hypotéz a důkazů, zaměření
na důkazy, které hypotézy odlišují, a výslovná úvaha, jaký důkaz by vedl k opuštění
preferované hypotézy. Druhým je **[red team](@/glossary/red-team.md)** – osoba nebo skupina, která má za úkol
formulovat nejsilnější případ proti závěru (viz [Red Team](@/glossary/red-team.md)).
Třetím je **předběžná pitva** (Klein 2007):
tým si představí, že rozhodnutí dopadlo špatně, a hledá nejpravděpodobnější příčiny.
Čtvrtým je **oddělení sběru a hodnocení** a **sekvenční odkrývání informací** – hodnotitel
dostává informace postupně, aby kontext neovlivnil hodnocení dřívějších důkazů (Dror
a kol. 2015). Pátým je **zápis výchozí hypotézy** a její srovnání se závěrem.

Šestým, organizačním opatřením je **kultura, která oceňuje změnu názoru**. Tetlock
a Gardner (2015) ukázali, že nejlepší prognostici průběžně a v malých krocích revidují
své odhady. Organizace, v níž je změna názoru vnímána jako slabost, bude mít prověrky,
které potvrzují.

## Lidský rozměr a zotavení

Konfirmační zkreslení není morální selhání, ale vlastnost lidské mysli. Analytici, kteří
se dozvědí, že jejich závěr byl zkreslený, prožívají stud; je užitečné rámovat chybu jako
selhání procesu, který měl zkreslení zachytit. Pro lidi po zkušenosti s manipulací je
pochopení konfirmačního zkreslení součástí zotavení: pomáhá jim vidět, jak byli drženi
ve výkladu, a postupně se z něj vymanit (viz [Revize přesvědčení](@/kompendium/self-defense-guides/7-belief-revision.md)
a [Falsifikační myšlení](@/kompendium/self-defense-guides/5-falsification-thinking.md)).

## Přesah do dalších oborů

Postupy proti konfirmačnímu zkreslení se rozvíjejí v mnoha oborech. Ve forenzních vědách
se prosazuje sekvenční odkrývání kontextu (Dror a kol. 2015); v medicíně diagnostické
časové limity a „diagnostická pauza“, při níž se lékař ptá, co jiného by to mohlo být;
ve vědě pre-registrace hypotéz (viz [pre-registrace](@/kompendium/research-methodology/pre-registration-EA-research.md));
v soudnictví procesní záruky jako presumpce neviny a právo na obhajobu, které mají
zajistit, že se vyslechne i druhá strana. Ve všech případech je princip stejný: struktura
práce musí vytvořit prostor pro hypotézu, kterou by nikdo spontánně nehledal.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Prověrka obchodního partnera vychází z podezření
zadavatele, že partner obchází sankce. Tým sestaví ACH se čtyřmi hypotézami: obcházení
sankcí, legitimní obchod s nesankcionovanými subjekty v rizikové zemi, chyba v datech,
a zprostředkování pro třetí stranu bez vědomí partnera. Většina dostupných důkazů – platby
do rizikové země, změny dodavatelů – je slučitelná se všemi čtyřmi. Odlišující důkaz
přinese až rozbor koncových odběratelů, který ukáže legitimní obchod s nesankcionovaným
subjektem a jeden sporný případ. Zpráva doporučí ukončit spolupráci v jedné komoditě
a pokračovat ve zbytku, s výslovným uvedením, že původní podezření se v plném rozsahu
nepotvrdilo.

Zadavatel je zprávou zpočátku zklamán – očekával jasné potvrzení podezření. V navazující
diskusi ale ocení, že rozhodnutí o ukončení celé spolupráce by stálo na důkazech, které
by se v případném sporu ukázaly jako slučitelné s nevinným výkladem.

## Meze a otevřené otázky

Postupy jako ACH a red team stojí čas a peníze a mohou se stát formalitou, pokud je
vykonávají lidé, kteří závěr už přijali. Otevřenou otázkou je, jak zajistit, aby red team
měl skutečnou nezávislost a aby jeho námitky měly vliv na rozhodnutí.

## Literatura

- Dror, I. E. a kol. (2015). Letter to the editor – Context management toolbox: A linear sequential unmasking (LSU) approach for minimizing cognitive bias in forensic decision making.
- Heuer, R. J. (1999). *Psychology of Intelligence Analysis.*
- Klein, G. (2007). Performing a project premortem.
- Lord, C. G., Ross, L., Lepper, M. R. (1979). Biased assimilation and attitude polarization.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises.
- Pronin, E., Lin, D. Y., Ross, L. (2002). The bias blind spot: Perceptions of bias in self versus others.
- Tetlock, P. E., Gardner, D. (2015). *Superforecasting.*

## Související

**Mezioborové mosty**

- [Kognitivní zkreslení vyšetřovatele](@/kompendium/cross-domain/9-ea-dd-investigation-bias.md) – zdroje zkreslení.
- [Hodnocení kvality důkazů](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md) – co důkaz dokládá.
- [Zkreslení při atribuci](@/kompendium/cross-domain/23-ea-security-attribution-bias.md) – stejný problém v bezpečnosti.

**Kritika a sebeobrana**

- [Kruhové uvažování v EA detekci](@/kompendium/critical-perspectives/4-circular-reasoning-risk.md) – riziko pro rámec knihy.
- [Revize přesvědčení](@/kompendium/self-defense-guides/7-belief-revision.md) – osobní praxe.

**Techniky a pojmy**

- [EA-2.5.8 Recursive Doubt Spiral](@/kompendium/techniques/ea-2-5-8-recursive-doubt-spiral.md) – zkreslení jako nástroj manipulace.
- [Konfirmační bias](@/glossary/konfirmacni-bias.md) – heslo glosáře.
- [Red Team](@/glossary/red-team.md) – institucionalizovaný oponent.
