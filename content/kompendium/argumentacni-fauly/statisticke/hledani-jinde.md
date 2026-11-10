+++
title = "Klam hledání jinde"
description = "Klam, který hodnotí nápadný výsledek nalezený prohledáním mnoha možností, jako by byl jedinou testovanou hypotézou: shluky, výkyvy a mnohonásobná srovnání."
weight = 14
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Klam hledání jinde", "Look-elsewhere effect", "problém mnohonásobného srovnávání", "efekt hledání jinde", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.14"
catalog_slug = "hledani-jinde"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke.b"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Look-elsewhere effect"
catalog_aliases = ["problém mnohonásobného srovnávání", "efekt hledání jinde"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["vyber-tresnicek", "texasky-strelec", "zkresleny-vyber", "zakon-malych-cisel", "klam-zalobce", "jeden-studie"]
catalog_related_declared = ["texasky-strelec", "vyber-tresnicek", "zakon-malych-cisel", "jeden-studie", "zkresleny-vyber"]
catalog_kompendium = ["kompendium/03-zakladni-kategorie/biasy/_index.md", "kompendium/critical-perspectives/_index.md", "kompendium/02-uvod/metodologicke-poznamky.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/03-zakladni-kategorie/biasy/_index.md", "kompendium/argumentacni-fauly/kauzalni/texasky-strelec.md", "kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md", "kompendium/critical-perspectives/_index.md"]
catalog_prev = "mcnamaruv-klam"
catalog_next = "zavadejici-graf"
catalog_position = 14
catalog_family_size = 16
catalog_sources = ["gilovich-1991", "kahneman-2011", "nickerson-1998", "popper-1959", "tversky-kahneman-1971"]
catalog_sources_primary = []
catalog_sources_roots = ["popper-1959"]
catalog_sources_critical = ["gilovich-1991", "kahneman-2011", "nickerson-1998", "tversky-kahneman-1971"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Varianty", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.b.toml"
+++

# Klam hledání jinde

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.14` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Look-elsewhere effect |
| **Jiné názvy** | problém mnohonásobného srovnávání, efekt hledání jinde |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Klam hledání jinde je chybné hodnocení nápadného výsledku, který byl nalezen prohledáním mnoha
možností, jako by šlo o jedinou předem stanovenou hypotézu. Pokud se prohledá dost míst,
období, podskupin nebo proměnných, objeví se někde výkyv, který by při jediném testu působil
jako velmi nepravděpodobný. Náhoda totiž nemá jen jednu příležitost, ale tolik příležitostí,
kolik bylo možností prohledáno. Termín pochází z částicové fyziky, kde se při hledání signálu
v širokém rozsahu energií rozlišuje lokální významnost výkyvu na jednom místě od globální
významnosti, která zohledňuje, že se hledalo všude. Ve statistice se tentýž problém označuje
jako problém mnohonásobného srovnávání. Klam nespočívá v tom, že se data prohledávají, ale v
tom, že se výsledek prohledávání vydává za výsledek ověření. Psychologickým základem je sklon
vidět v náhodných datech pravidelnosti a přeceňovat, nakolik malé nebo vybrané soubory
vypovídají o skutečnosti (Gilovich 1991; Tversky a Kahneman 1971).

## Původ a souvislosti

Fyzikové pojmenovali problém v souvislosti s hledáním nových částic, kde se signál projevuje
jako přebytek událostí v určitém úzkém rozsahu měřené veličiny. Protože se neví předem, kde
přesně by se signál měl objevit, prohledává se celý rozsah, a pravděpodobnost, že se někde
vyskytne náhodný výkyv dané velikosti, je mnohem vyšší než pravděpodobnost výkyvu na jednom
určeném místě. Proto obor pracuje s velmi přísnou konvencí pro ohlášení objevu a při
zveřejnění výsledků uvádí, jak se významnost změní, když se zohlední celé prohledávané
území. Ve statistice a epidemiologii je tentýž problém znám pod jinými jmény: korekce na
mnohonásobná srovnání, kontrola podílu falešných objevů a v poslední době i diskuse o tzv.
zahradě rozvětvených cest, tedy o množství rozhodnutí při analýze, z nichž každé otevírá
další možnost najít něco nápadného. Kořeny jsou i ve filozofii vědy. Popper trval na tom, že
hodnota testu závisí na tom, zda teorie předem vylučuje určité výsledky, které by ji mohly
vyvrátit (Popper 1959). Výsledek nalezený až po prohledání dat takovou předchozí zápověď
nemá. Tversky a Kahneman ukázali, že i zkušení výzkumníci přeceňují, jak spolehlivě se
výsledek z malého vzorku zopakuje, což je spolu s mnohonásobným hledáním jedním ze zdrojů
nereprodukovatelných zjištění (Tversky a Kahneman 1971).

## Struktura argumentu

Argument má zpravidla tento tvar: v datech byl nalezen výsledek, jehož pravděpodobnost při
náhodě je velmi malá, a proto náhodou být nemůže. Nevyslovená a chybná premisa říká, že
výsledek byl jedinou zkoumanou možností. Ve skutečnosti mu předcházelo hledání, které mohlo
zahrnovat desítky obcí, stovky diagnóz, mnoho časových oken nebo různé způsoby rozdělení
vzorku. Pravděpodobnost uváděná v argumentu se týká jednoho místa, kdežto otázka, kterou by
měla zodpovědět, se týká celého prohledaného prostoru. Rozdíl mezi nimi může být velký.
Kahneman připomíná známý případ okresů s nejnižším a nejvyšším výskytem rakoviny ledvin:
oba extrémy se vyskytovaly v malých venkovských okresech, a nabízela se proto příčinná
vysvětlení obou, ačkoli šlo o důsledek toho, že malé soubory kolísají víc a mezi mnoha
okresy se extrémy objeví nutně (Kahneman 2011). Struktura je tedy příbuzná s klamem
[texaského střelce](@/kompendium/argumentacni-fauly/kauzalni/texasky-strelec.md), který
nakreslí terč až kolem zásahů, a se
[zákonem malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md),
podle něhož lidé očekávají od malých souborů víc pravidelnosti, než jim náhoda dovoluje.

## Varianty

Klam se vyskytuje v několika podobách, které se liší tím, co se prohledává. Prostorová podoba
se týká shluků: mezi mnoha obcemi, školami nebo pracovišti se najde místo s nápadným výskytem
nemoci či nehod, a toto místo se pak zkoumá, jako by bylo vybráno předem. Časová podoba se
týká oken: z dlouhé řady údajů se vybere období, ve kterém vývoj vychází nejnápadněji.
Analytická podoba se týká rozhodnutí při zpracování dat, jako je volba podskupin, vyřazení
odlehlých hodnot, přidání nebo odebrání kontrolních proměnných a volba výsledné míry, kdy
každé rozhodnutí samo vypadá rozumně, ale jejich součet dává mnoho příležitostí k nálezu.
Interpretační podoba se týká výkladu náhodných shod, například věšteb nebo předpovědí, které
se dodatečně přiřadí k události, jež se mezi mnoha možnými událostmi skutečně stala. Všechny
podoby spojuje tatáž chyba: počet příležitostí, které měla náhoda, zůstává v argumentu
neviditelný (Gilovich 1991).

## Detekční znaky

Prvním znakem je chybějící informace o tom, kolik možností se prohledávalo. Mluvčí ukazuje
jeden nápadný výsledek, ale nezmiňuje, z jak velkého souboru srovnání pochází. Druhým znakem
je hypotéza formulovaná až po pohledu do dat: místo shluku, doba výkyvu nebo podskupina, v
níž účinek vychází, se určí teprve tehdy, když je jasné, kde je výsledek nápadný. Třetím
znakem je příběh ušitý na míru nálezu, který vysvětluje právě tento výkyv, ale nepředpovídá
nic, co by bylo možné ověřit jinde. Čtvrtým znakem je selektivní zpráva o analýzách, kdy se
uvádí jen ta varianta zpracování, která vyšla, a ostatní se nezmíní. Nickerson popisuje
obecný sklon hledat a zaznamenávat to, co potvrzuje očekávání, a přehlížet to, co ho
nepodporuje, a tento sklon se při volném prohledávání dat uplatňuje obzvlášť silně (Nickerson
1998). Pátým znakem je, že výsledek se nepodaří zopakovat na nových datech, ale vysvětlí se to
změnou okolností, místo aby se připustila možnost, že původní nález byl výkyvem.

## Odlišení od platné argumentace

Prohledávání dat je legitimní a často nezbytnou částí poznání. Epidemiologický dozor, hledání
nových částic i průzkumová analýza dat žijí z toho, že někdo hledá nápadnosti. Platná
argumentace se od klamu liší tím, že výsledek hledání označí za podnět k ověření, a ne za
ověření samo. Uvádí, kolik možností se prohledávalo, a buď na jejich počet koriguje hodnocení
významnosti, nebo hypotézu, kterou hledání přineslo, testuje na nezávislých datech, která při
jejím vzniku nebyla k dispozici. Popperovské kritérium zde má praktickou podobu: hypotéza musí
před testem říci, co by ji vyvrátilo (Popper 1959). Předběžná registrace studií, při níž se
hypotézy a postup analýzy zveřejní dříve, než se data zpracují, je institucionální odpovědí
právě na tento problém. Platná je i opatrná formulace, která nápadný výsledek popíše jako
pozorování, jehož význam zatím nelze posoudit. Kdo napíše, že „v jedné z mnoha zkoumaných obcí
byl výskyt vyšší, než bychom čekali, a budeme to sledovat“, neuvažuje chybně, i když se na
výsledek dívá se zájmem.

## Stav poznání

Statistická podstata klamu je dobře známa a metody, jak s ním zacházet, patří ke standardní
výbavě oboru. Psychologický výzkum vysvětluje, proč je klam lákavý. Gilovich shrnuje doklady,
že lidé v náhodných posloupnostech a prostorových rozloženích vidí shluky a pravidelnosti,
které tam nejsou, a připomíná, že obyvatelé Londýna za války vnímali dopady německých střel jako
soustředěné do určitých čtvrtí, ačkoli rozbor neukázal od náhodného rozložení podstatnou
odchylku (Gilovich 1991). Tversky a Kahneman doložili, že i odborníci na metodologii očekávají
od malých vzorků víc stability, než jim náhoda dovoluje (Tversky a Kahneman 1971). Kahneman
dodává, že intuitivní myšlení pro každý nápadný výsledek okamžitě nabídne příčinné
vysvětlení a statistickou úvahu o mnoha příležitostech k výkyvu nezahrne (Kahneman 2011).
Diskuse o reprodukovatelnosti výsledků v psychologii, medicíně a dalších oborech v posledních
desetiletích ukázala, že nekorigované mnohonásobné hledání je jedním z hlavních důvodů, proč
se publikované nálezy nedaří zopakovat. Otevřenou otázkou zůstává, jak zohlednit hledání,
které není zachyceno v žádném protokolu, protože proběhlo neformálně v hlavě analytika.

## Obrana a odpověď

Základní obranou je zeptat se, kolik možností se prohledávalo a kdy byla hypotéza
formulována. Pokud mluvčí neví nebo neuvádí, z jak velkého prostoru výsledek pochází, nelze
uváděnou pravděpodobnost brát jako doklad, že nejde o náhodu. Druhou obranou je požadovat
ověření na nových, předem určených datech, protože jen tak se oddělí hledání od testu
(Popper 1959). Třetí obranou je zvažovat, jak často by se výkyv dané velikosti objevil někde v
prohledávaném prostoru, i kdyby žádná příčina nepůsobila; u velkých souborů obcí, nemocí nebo
období bývá odpověď překvapivě vysoká (Kahneman 2011). Čtvrtou obranou je obezřetnost vůči
vlastním nálezům: kdo sám prohledával data, měl by svůj nejnápadnější výsledek hodnotit
nejpřísněji, protože právě u něj je nejpravděpodobnější, že ho zvětšila náhoda (Nickerson
1998). Nic z toho neznamená, že obavy, které nápadný výsledek vyvolal, jsou neoprávněné. Znamená
to, že odpověď na ně má přinést ověření, a ne pouhé opakování původního čísla. Přehled
zkreslení, které tento klam živí, nabízí podsekce o
[kognitivních biasech](@/kompendium/03-zakladni-kategorie/biasy/_index.md), metodologické
souvislosti rozebírají
[kritické perspektivy](@/kompendium/critical-perspectives/_index.md) vlastního rámce knihy.

## Literatura

- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of General Psychology*, 2(2), 175–220.
- Popper, K. R. (1959). *The Logic of Scientific Discovery*. London: Hutchinson.
- Tversky, A., & Kahneman, D. (1971). Belief in the law of small numbers. *Psychological Bulletin*, 76(2), 105–110.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Výběr třešniček](@/kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md) – příbuzné heslo (Klamy předpokladu, Cherry picking)
- [Texaský střelec](@/kompendium/argumentacni-fauly/kauzalni/texasky-strelec.md) – příbuzné heslo (Kauzální klamy, Texas sharpshooter)
- [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Sampling bias)
- [Zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Law of small numbers)
- [Klam žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Prosecutor's fallacy)
- [Argument jedinou studií](@/kompendium/argumentacni-fauly/hodnoty-a-veda/jeden-studie.md) – příbuzné heslo (Klamy hodnot, přírody a vědy, Single-study fallacy)

**V kompendiu**

- [Kognitivní biasy](@/kompendium/03-zakladni-kategorie/biasy/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Kritické perspektivy – meze rámce epistemické anihilace](@/kompendium/critical-perspectives/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [2.4 Metodologické poznámky k taxonomii](@/kompendium/02-uvod/metodologicke-poznamky.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [McNamarův klam](@/kompendium/argumentacni-fauly/statisticke/mcnamaruv-klam.md) – předchozí heslo rodiny
- [Zavádějící graf](@/kompendium/argumentacni-fauly/statisticke/zavadejici-graf.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
