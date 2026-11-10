+++
title = "Pořadové číslovky"
description = "Slova první, druhý, další nebo poslední předpokládají celou řadu kroků či změn; jak se tak z jediného souhlasu dělá začátek cesty a jak řadu rozpoznat."
weight = 4
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Pořadové číslovky", "Ordinal numerals", "presupozice řady", "první, další, poslední", "Jazykové presupozice", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-06.04"
catalog_slug = "poradove-cislovky"
catalog_family = "presupozice"
catalog_family_code = "06"
catalog_family_title = "Jazykové presupozice"
catalog_family_en = "Linguistic presuppositions"
catalog_part = "presupozice"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Ordinal numerals"
catalog_aliases = ["presupozice řady", "první, další, poslední"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "jazykove-presupozice"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["jazykove-presupozice"]
catalog_related = ["iluze-volby", "retezeni-sugesci", "opakovaci-slova", "budouci-prehravani-v-prodeji"]
catalog_related_declared = ["opakovaci-slova", "iluze-volby", "retezeni-sugesci", "budouci-prehravani-v-prodeji"]
catalog_kompendium = ["kompendium/techniques/ea-1-2-1-falesne-dilema.md", "kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/presupozice/opakovaci-slova.md", "kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md", "kompendium/nlp-vzorce/presupozice/presupozice-nebo.md", "kompendium/techniques/ea-1-2-1-falesne-dilema.md", "kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md"]
catalog_prev = "presupozice-casovych-vet"
catalog_next = "presupozice-nebo"
catalog_position = 4
catalog_family_size = 19
catalog_sources = ["bandler-grinder-1975b", "cialdini-2009", "druckman-swets-1988", "freedman-fraser-1966", "grice-1975", "hassan-1988", "levinson-1983", "miller-rollnick-2013", "passmore-rowson-2019", "sharpley-1987", "singer-lalich-1995", "stark-2007"]
catalog_sources_primary = ["bandler-grinder-1975b"]
catalog_sources_roots = ["grice-1975", "levinson-1983"]
catalog_sources_critical = ["cialdini-2009", "druckman-swets-1988", "freedman-fraser-1966", "hassan-1988", "miller-rollnick-2013", "passmore-rowson-2019", "sharpley-1987", "singer-lalich-1995", "stark-2007"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Varianty", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/presupozice.toml"
+++

# Pořadové číslovky

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.04` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Ordinal numerals |
| **Jiné názvy** | presupozice řady, první, další, poslední |
| **Obecnější heslo** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Presupozice pořadových číslovek je předpoklad, že existuje řada, do které označená věc
patří. Kdo se ptá „Co bude první věc, kterou změníš?“, předpokládá, že změn bude více, a
ponechává adresátovi jen volbu jejich pořadí. Stejně působí slova „další“, „jiný“, „ještě
jeden“, „poslední“ i příslovce „nejdřív“ a „potom“. V přehledech Milton-modelu jsou pořadové
číslovky uvedeny jako samostatná kategorie presupozic, kterou lze užít k tomu, aby se
pozornost klienta soustředila na pořadí a ne na otázku, zda k věci vůbec dojde (Bandler a
Grinder 1975b). Lingvisticky jde o zvláštní případ určitého odkazu: výraz „první věc“
odkazuje na prvek uspořádané množiny, a tím předpokládá existenci celé množiny, podobně jako
každé určité pojmenování předpokládá existenci své věci (Levinson 1983). Pro kompendium je
vzorec důležitý tím, že z jediného rozhodnutí dokáže v jazyce udělat první krok cesty,
jejíž další úseky se už neprojednávají.

## Původ a souvislosti

Pořadové číslovky se do seznamů presupozic NLP dostaly z rozborů Ericksonova jazyka, v nichž
se změna často popisovala jako proces o více fázích, z nichž klient prožívá „první“ (Bandler
a Grinder 1975b). Lingvistika k nim přistupuje obecněji. Levinson popisuje určité deskripce a
iterativní výrazy jako spouštěče, které předpokládají existenci, respektive dřívější výskyt
(Levinson 1983). Pořadová číslovka v sobě spojuje oba rysy: předpokládá existenci řady a u
slov jako „další“ či „druhý“ i to, že jeden prvek už proběhl. Z hlediska konverzační logiky
navíc platí, že mluvčí, který mluví o „první“ věci, by porušil očekávanou míru informativnosti,
kdyby žádná druhá neexistovala; posluchač proto podle principu kooperace doplní, že řada je
reálná (Grice 1975).

Psychologie sociálního vlivu popsala jev, který se s tímto jazykem přirozeně pojí, i když
nejde o jazykový výzkum. Lidé, kteří vyhověli malé první prosbě, byli v experimentech
ochotnější vyhovět i pozdější prosbě větší (Freedman a Fraser 1966). Cialdini vykládá tento
jev tlakem na konzistenci s dříve přijatým závazkem a s obrazem sebe sama, který člověk prvním
krokem vytvořil (Cialdini 2009). Jazyk pořadí tento mechanismus nevytváří, ale připravuje mu
půdu: popisuje rozhodnutí od počátku jako součást řady.

## Struktura vzorce

Vzorec má tři složky. První je řada, která se nevysloví jako tvrzení: kurzů, úrovní, kroků,
změn, ústupků nebo plateb. Druhá je prvek, na který se upře pozornost, typicky první nebo
nejbližší další, a otázka, která se k němu váže. Třetí je přesun rozhodování z úrovně celku
na úroveň pořadí. Adresát, který odpoví „nejdřív bych asi změnil jídelníček“, vybral prvek
řady, a tím mlčky přijal, že řada existuje a že do ní vstupuje. V obchodních a náborových
rozhovorech se struktura často kombinuje s
[časovou větou](@/kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md) („až
začneš“) a s nabídkou mezi dvěma variantami téhož, kterou katalog popisuje jako
[presupozici spojky „nebo“](@/kompendium/nlp-vzorce/presupozice/presupozice-nebo.md).
Výsledkem je výpověď, ve které se o vstupu do řady vůbec nehovoří, přestože právě o něm se
rozhoduje.

Zvláštní variantou je slovo „poslední“. Výpověď „to je poslední věc, o kterou tě žádám“
předpokládá řadu předchozích proseb, které byly splněny, a zároveň slibuje její konec. U
opakovaných „posledních“ žádostí v kontrolujícím vztahu se řada ve skutečnosti neuzavírá, jen
se každý její prvek předkládá jako závěrečný, a tím se snižuje práh pro jeho splnění. Takový
průběh popisuje literatura o kontrolujících vztazích jako postupné rozšiřování nároků, které
oběť vnímá vždy jen po jednotlivých krocích (Stark 2007).

## Varianty

Vzorec má několik podob, které se v praxi střídají. Nejběžnější je číslovka vztažená ke
krokům změny nebo k produktům („první modul“, „druhý stupeň“). Další podobou je slovo
„další“, které předpokládá nejen řadu, ale i to, že jeden prvek už proběhl; tím se vzorec
překrývá s [opakovacími slovy](@/kompendium/nlp-vzorce/presupozice/opakovaci-slova.md).
Třetí podobou jsou příslovce pořadí v požadavcích, například „nejdřív se omluv, potom si
promluvíme“, kde se rozhovor podmíní splněním prvního kroku a druhý krok se předpokládá jako
odměna. Čtvrtou podobou je odpočítávání konce řady: „zbývají poslední dvě místa“, „je to
poslední šance“. Zde se pořadový jazyk spojuje s principem vzácnosti, podle něhož lidé
přikládají větší hodnotu tomu, co se zdá být omezené nebo mizející (Cialdini 2009). Ve všech
podobách řada sama zůstává nevyslovená a pozornost se upírá na jediný její prvek.

## Detekční znaky

Prvním znakem je pořadová číslovka nebo slovo „další“ vztažené k věcem, o kterých se dosud
nemluvilo: „první úroveň“, „další modul“, „druhá fáze tvé proměny“. Kontrolní otázka zní, zda
by mluvčí dokázal řadu vyjmenovat a zda by s ní adresát souhlasil, kdyby ji slyšel celou.
Druhým znakem je otázka na pořadí, kterou adresát dostane dřív, než se rozhodl o celku.
Třetím znakem je, že celková cena, délka nebo náročnost řady zůstává v rozhovoru nevyslovená,
kdežto první krok se popisuje podrobně a jako snadný. Čtvrtým znakem je opakované „poslední“,
které se neplní. V uzavřených skupinách se řada stupňů nebo úrovní objevuje jako trvalý rys a
každý stupeň předpokládá stupeň následující; Hassan i Singer s Lalichovou popisují, jak se
závazek člena prohlubuje po malých krocích, z nichž žádný sám o sobě nevypadá jako zásadní
rozhodnutí (Hassan 1988; Singer a Lalich 1995). Kompendium tento postup sleduje i u
[vzorce guru a adept](@/kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md), kde postup
žáka k dalším stupňům zasvěcení slouží jako stále se posouvající cíl.

## Legitimní a manipulativní užití

Legitimní užití se opírá o řadu, která skutečně existuje a je předem známá. Vyučující, který
ohlásí druhou ze tří přednášek, nebo lékař, který vysvětlí, že léčba má tři fáze a první
začíná zítra, používá pořadí k orientaci. V terapii se pořadí užívá i k plánování: terapeut a
klient se dohodnou, čím začnou, a klient ví, že plán lze kdykoli změnit. Rozdíl proti
manipulativnímu užití je v tom, že řada je vyslovená, že adresát o ní rozhodl a že může
kdykoli vystoupit bez ztráty tváře. Motivační rozhovor tento rozdíl zdůrazňuje tím, že
plánování změny ponechává v rukou klienta a nevynechává jeho souhlas s cílem (Miller a
Rollnick 2013).

Manipulativní užití vyvolává řadu, kterou adresát nezná, a nabízí mu volbu jejího pořadí
místo volby, zda do ní vstoupit. Je typické pro prodej vícestupňových kurzů a předplatných,
pro nábor do skupin s hierarchií úrovní a pro kontrolující vztahy, ve kterých se nároky
předkládají jednotlivě. Strukturu nabídky, ve které je volba omezena na prvky předem dané
množiny, popisuje kompendium obecně u [falešného dilematu](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md).

## Stav důkazů

Jazyková stránka vzorce je nesporná: pořadové výrazy předpokládají existenci řady a
posluchači je běžně akomodují (Levinson 1983). Doložený je i obecný jev postupného závazku, i
když experimenty, které ho popsaly, nezkoumaly jazyk pořadí, ale skutečné po sobě jdoucí
prosby (Freedman a Fraser 1966). Tvrzení NLP, že pořadové číslovky jako takové spolehlivě
vedou klienta k přijetí sugesce, nebylo předmětem kontrolovaných studií; opírá se o rozbor
Ericksonových sezení (Bandler a Grinder 1975b). Hodnocení amerických národních akademií z
konce osmdesátých let nenašlo pro tvrzení NLP o ovlivňování lidí dostatečnou empirickou
oporu (Druckman a Swets 1988) a pozdější přehledy dospěly k podobnému závěru (Sharpley 1987;
Passmore a Rowson 2019). Pro tuto stránku z toho plyne, že pořadový jazyk je třeba sledovat
jako signál struktury rozhovoru, nikoli jako techniku s prokázaným samostatným účinkem.

## Obrana a zotavení

Základní obranou je zeptat se na celou řadu dřív, než se odpoví na otázku po jejím prvním
prvku: kolik kroků, kolik úrovní, jaká celková cena, jaký celkový čas. Kdo řadu uvidí celou,
rozhoduje o celku, ne o pořadí. Druhou obranou je oddělit rozhodnutí: nejprve zda, potom co
nejdřív, a nepřipustit, aby otázka na pořadí předběhla otázku souhlasu. Třetí obranou je
vědomě zacházet s prvním krokem. Protože první souhlas vytváří tlak na konzistenci, je
rozumné předem si určit, za jakých podmínek člověk z řady vystoupí, a rozhodnutí o dalším
kroku brát jako nové rozhodnutí, ne jako pokračování starého (Cialdini 2009). Při zotavení z
prostředí, ve kterém se závazek prohluboval po stupních, pomáhá zpětně sepsat jednotlivé
kroky a u každého si položit otázku, zda by s ním člověk souhlasil, kdyby ho znal od začátku.
Takové zmapování obvykle ukáže, že žádný jednotlivý krok nevypadal jako zásadní, ale celek
by přijat nebyl, což zmenšuje sebeobviňování a pomáhá porozumět tomu, jak závazek vznikl
(Singer a Lalich 1995).

## Literatura

- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Freedman, J. L., & Fraser, S. C. (1966). Compliance without pressure: The foot-in-the-door technique. *Journal of Personality and Social Psychology*, 4(2), 195–202.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Singer, M. T., & Lalich, J. (1995). *Cults in Our Midst*. San Francisco: Jossey-Bass.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. New York: Oxford University Press.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Iluze volby](@/kompendium/nlp-vzorce/milton-model/iluze-volby.md) – příbuzné heslo (Milton-model, Illusion of choice)
- [Řetězení sugescí](@/kompendium/nlp-vzorce/milton-model/retezeni-sugesci.md) – příbuzné heslo (Milton-model, Linking suggestions)
- [Opakovací slova](@/kompendium/nlp-vzorce/presupozice/opakovaci-slova.md) – příbuzné heslo (Jazykové presupozice, Repetitive cue words)
- [Budoucí přehrávání v prodeji](@/kompendium/nlp-vzorce/vliv-a-zneuziti/budouci-prehravani-v-prodeji.md) – příbuzné heslo (Vliv a zneužití NLP, Future pacing in sales)

**V kompendiu**

- [EA-1.2.1 Falešné dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.6.1 Vzorec guru a adept](@/kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Presupozice časových vět](@/kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md) – předchozí heslo rodiny
- [Presupozice spojky „nebo“](@/kompendium/nlp-vzorce/presupozice/presupozice-nebo.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
