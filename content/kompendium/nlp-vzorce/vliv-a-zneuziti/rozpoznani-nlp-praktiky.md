+++
title = "Rozpoznání praktiky NLP v rozhovoru"
description = "Podle čeho lze v rozhovoru rozpoznat záměrné užití technik NLP, proč jednotlivý znak nestačí, jak se vyhnout falešným poplachům a co z rozpoznání plyne."
weight = 20
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-vliv-a-zneuziti", "nlp-vzorec", "nlp-uziti-zadne"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Rozpoznání praktiky NLP v rozhovoru", "Recognising NLP practice in conversation", "detekce NLP v komunikaci", "Vliv a zneužití NLP", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-21.20"
catalog_slug = "rozpoznani-nlp-praktiky"
catalog_family = "vliv-a-zneuziti"
catalog_family_code = "21"
catalog_family_title = "Vliv a zneužití NLP"
catalog_family_en = "Influence and misuse of NLP"
catalog_part = "vliv-a-zneuziti.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Recognising NLP practice in conversation"
catalog_aliases = ["detekce NLP v komunikaci"]
catalog_use = "zadne"
catalog_use_cs = "výkladový pojem"
catalog_risk = "nizke"
catalog_risk_cs = "nízké"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["ocni-pristupove-signaly", "vlozene-prikazy", "presupozice-milton", "zrcadleni", "konverzacni-hypnoza", "falesne-zrcadleni-v-podvodech", "obrana-proti-vlivovym-vzorcum", "jak-cist-tvrzeni-nlp"]
catalog_related_declared = ["obrana-proti-vlivovym-vzorcum", "zrcadleni", "vlozene-prikazy", "ocni-pristupove-signaly", "konverzacni-hypnoza", "presupozice-milton"]
catalog_kompendium = ["kompendium/detection-signatures/_index.md", "kompendium/techniques/ea-1-4-1-prosodicka-dominance.md", "kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md", "kompendium/nlp-vzorce/milton-model/milton-model.md", "kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md", "kompendium/nlp-vzorce/raport-a-kalibrace/zrcadleni.md", "kompendium/nlp-vzorce/vliv-a-zneuziti/obrana-proti-vlivovym-vzorcum.md", "kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md", "kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md"]
catalog_prev = "obrana-proti-vlivovym-vzorcum"
catalog_next = ""
catalog_position = 20
catalog_family_size = 20
catalog_sources = ["bandler-grinder-1975b", "chartrand-bargh-1999", "grice-1975", "kirsch-lynn-1995", "levinson-1983", "oconnor-seymour-1990", "petty-cacioppo-1986", "sharpley-1984", "sharpley-1987", "vrij-2008", "wiseman-2012", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975b", "oconnor-seymour-1990"]
catalog_sources_roots = ["grice-1975", "levinson-1983"]
catalog_sources_critical = ["chartrand-bargh-1999", "kirsch-lynn-1995", "petty-cacioppo-1986", "sharpley-1984", "sharpley-1987", "vrij-2008", "wiseman-2012", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Odlišení od příbuzných jevů", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/vliv-a-zneuziti.b.toml"
+++

# Rozpoznání praktiky NLP v rozhovoru

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-21.20` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Vliv a zneužití NLP](@/kompendium/nlp-vzorce/vliv-a-zneuziti/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Recognising NLP practice in conversation |
| **Jiné názvy** | detekce NLP v komunikaci |
| **Užití** | výkladový pojem |
| **Riziko zneužití** | nízké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Rozpoznáním praktiky NLP v rozhovoru kompendium označuje schopnost pozorovatele nebo
účastníka rozhovoru zaznamenat, že druhá strana pravděpodobně záměrně používá techniky
neurolingvistického programování, a posoudit, co z toho plyne. Heslo nevychází z
předpokladu, že techniky NLP mají zvláštní moc, kterou je nutné odhalit. Vychází z
toho, že jejich záměrné užití v situaci, kde druhá strana o něm neví, mění povahu
rozhovoru: z výměny informací se stává pokus o vliv, a ten má být pro ovlivňovaného
viditelný. Rozpoznání se proto netýká jednotlivého výroku, ale shluku znaků v
kontextu. Mnohé jevy, které NLP popisuje, jako je napodobování držení těla, shoda v
tempu řeči nebo vágní jazyk, se v běžné komunikaci objevují samy od sebe a bez úmyslu
(Chartrand a Bargh 1999). Smysl hesla je tedy dvojí: ukázat znaky, které při společném
výskytu svědčí o praktice, a zároveň chránit před falešnými poplachy, které by z
každého přátelského gesta dělaly podezření z manipulace.

## Původ a souvislosti

Zájem o rozpoznávání NLP vznikl spolu s jeho rozšířením do prodeje, vyjednávání a
koučinku, kde se jeho techniky začaly vyučovat jako nástroje vlivu. Úvodní učebnice
popisují mezi základními dovednostmi přizpůsobování a vedení, práci s předpoklady v
jazyce a sledování neverbálních reakcí druhého (O'Connor a Seymour 1990). Lingvistická
pragmatika přitom popsala mnohé z mechanismů, na kterých tyto techniky stojí, nezávisle
na NLP. Grice ukázal, že porozumění v rozhovoru stojí na předpokladu spolupráce a na
implikaturách, tedy na tom, co se sděluje, aniž by se to řeklo (Grice 1975). Levinson
popsal presupozice jako obsah, který výrok mlčky předpokládá a který posluchač obvykle
přijímá bez prověření (Levinson 1983). Kompendium rozpracovává tyto jevy v rodinách
[jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) a
[Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md). Pro rozpoznání je důležité, že techniky NLP nejsou zvláštním jazykem;
jsou to záměrně zesílené a nahromaděné podoby běžných jazykových a vztahových jevů.
Proto se rozpoznávají podle hustoty, kontextu a směru, nikoli podle jediného prvku.

## Struktura vzorce

Znaky praktiky NLP lze uspořádat do čtyř skupin. První skupinou jsou neverbální znaky:
nápadně přesné a trvalé napodobování držení těla, gest, dechu nebo tempa řeči, které
působí spíše jako kopírování než jako přirozené sladění, a které se po chvíli mění ve
vedení, tedy ve změnu, kterou má druhý následovat; podrobně je popisuje heslo
[zrcadlení](@/kompendium/nlp-vzorce/raport-a-kalibrace/zrcadleni.md). Druhou skupinou
jsou jazykové znaky: nahromadění vágních výroků o vnitřním stavu posluchače, otázky s
vloženými předpoklady, spojování popisu aktuálního prožitku s domnělým důsledkem a
nápadné intonační zdůrazňování jednotlivých slov uvnitř vět. Třetí skupinou jsou znaky
rámování: neustálé přeformulovávání toho, co druhý řekl, do výkladu, který vyhovuje
mluvčímu, a představy budoucnosti, ve které druhý už přijal nabídku. Čtvrtou skupinou
jsou znaky kontextu: tyto prvky se objevují v rozhovoru, který deklaruje jiný účel,
například informační schůzku, obchodní jednání nebo seznámení, a nikoli v situaci, kde
by k nim druhý dal souhlas, jako je terapie nebo relaxační cvičení (Bandler a Grinder
1975b). Rozpoznání vzniká až tehdy, když se znaky z více skupin vyskytují společně a
směřují k rozhodnutí, které má druhý učinit.

## Detekční znaky

Pro praktické rozpoznání jsou nejcennější znaky, které jsou na pozorovateli méně
závislé. Patří k nim nesoulad mezi obsahem a formou: o konkrétních podmínkách nabídky
se mluví málo, o pocitech posluchače mnoho. Dalším spolehlivým znakem je, že se
mluvčí vyhýbá přímým odpovědím a vrací rozhovor k prožitku nebo k představě. Třetím je
tempo: blízkost a souhlas se budují rychleji, než odpovídá délce známosti. Čtvrtým je
reakce na otázky: konkrétní otázka po podmínkách nebo po důkazech vyvolá místo odpovědi
nový rámec nebo zpochybnění tazatele. Méně spolehlivé jsou znaky, které vyžadují jemné
pozorování, například napodobování, protože se snadno zaměňují s přirozeným
chováním (Chartrand a Bargh 1999). Zvlášť je třeba varovat před znaky, které NLP samo
považuje za diagnostické. Tvrzení, že směr pohledu očí prozrazuje, zda člověk vzpomíná,
nebo si vymýšlí, se v experimentech nepotvrdilo (Wiseman a kol. 2012), a na rozpoznání
lži z chování obecně nelze spoléhat (Vrij 2008). Heslo
[oční přístupové signály](@/kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md)
tento rozdíl rozebírá podrobně. Rozpoznání má tedy stát na struktuře rozhovoru, ne na
„čtení“ druhého.

## Odlišení od příbuzných jevů

Nejdůležitějším odlišením je odlišení od běžné komunikace. Lidé, kteří si rozumějí, se
bezděčně napodobují, přebírají slova druhého a mluví v obrazech; to není praktika NLP,
ale normální sociální chování (Chartrand a Bargh 1999). Odlišit je třeba i
profesionální komunikační dovednosti: lékař, který mluví pomalu a jednoduše, nebo
vyjednavač, který shrnuje slova druhé strany, aby ověřil porozumění, nemusí používat
NLP, a i kdyby ho používal, nemusí jít o manipulaci. Dále je třeba odlišit praktiku NLP
od klinických jevů. Člověk, který mluví vágně a obrazně, může mít jiný komunikační styl,
neurovývojovou odlišnost nebo jazykovou bariéru, a připisovat mu manipulativní úmysl by
bylo chybou. Konečně je třeba odlišit podezření od jistoty. Rozpoznání praktiky NLP je
pravděpodobnostní úsudek, nikoli důkaz, a ve forenzních nebo pracovněprávních
souvislostech ho nelze vydávat za prokázaný fakt. Kompendium proto doporučuje mluvit o
pozorovaných znacích, ne o „odhaleném“ úmyslu, jak to odpovídá přístupu k
[diagnostickým indikátorům](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md).

## Legitimní a manipulativní užití

Samotné rozpoznání je legitimní a užitečné: umožňuje člověku vrátit rozhovor k
obsahu a rozhodnout se s vědomím, že je ovlivňován. Rozpoznávat lze i v situacích, kde
je užití technik oprávněné, například v terapii, kde klient dal souhlas, nebo ve
výcviku komunikace, kde jde o deklarovaný předmět. Manipulativní je užití technik
NLP, které rozpoznání znesnadňuje: techniky se používají v rozhovoru deklarovaném jako
jiný, jsou nahromaděny tak, aby oslabily rozvahu, a směřují k rozhodnutí, které by
druhý při plné informovanosti možná neučinil. Zneužít lze však i samotné rozpoznání.
Pokud se nálepka „používá na mě NLP“ stane univerzální odpovědí na nepříjemný
argument, slouží k odmítnutí obsahu bez jeho posouzení. Grice připomíná, že rozhovor
stojí na předpokladu spolupráce (Grice 1975); rozpoznání má sloužit k obnově
spolupráce, tedy k návratu k jasným a pravdivým informacím, nikoli k jejímu
ukončení podezřením.

## Stav důkazů

Výzkum, který by testoval, jak spolehlivě lidé rozpoznávají záměrné užití technik NLP,
neexistuje v rozsahu, který by umožňoval přesné závěry. Lze se však opřít o tři
skupiny poznatků. Za prvé, specifické techniky NLP nemají přesvědčivou výzkumnou
podporu a jejich účinek na druhého je pravděpodobně menší, než tvrdí výcviky (Sharpley
1987; Witkowski 2010). Za druhé, některé předpoklady NLP o neverbálních znacích, jako
jsou oční přístupové signály a preferované [reprezentační systémy](@/kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md), se v experimentech
nepotvrdily (Wiseman a kol. 2012; Sharpley 1984), a proto je nelze použít ani k
rozpoznávání. Za třetí, odpověď na sugesci závisí především na očekávání a ochotě
spolupracovat (Kirsch a Lynn 1995), z čehož lze usuzovat, že rozpoznání a vědomé
zaujetí odstupu samo o sobě účinek technik oslabuje. Z toho plyne střízlivé hodnocení:
rozpoznání praktiky NLP je užitečné hlavně tím, že vrací rozhovoru transparentnost, a ne
tím, že by odhalovalo mocný skrytý mechanismus.

## Obrana a zotavení

Když člověk v rozhovoru zaznamená shluk znaků, je nejúčinnější reakcí návrat k obsahu:
požádat o konkrétní informace, o písemnou podobu nabídky a o čas na rozmyšlenou. Tím se
oslabí to, na čem techniky stojí, tedy okamžik, prožitek a vágnost, a posílí motivaci i
možnost posoudit argumenty, které podle modelu pravděpodobnosti zpracování snižují vliv
povrchových vodítek (Petty a Cacioppo 1986). Užitečné je také pojmenovat, co se děje, pokud
je to bezpečné, například říci, že se rozhovor stáčí k pocitům a že je potřeba mluvit o
podmínkách. Konfrontace typu „vím, že na mě používáte NLP“ obvykle nepomůže, protože
přesouvá rozhovor k úmyslu, který nelze prokázat. Obecnější zásady ochrany rozhodování
shrnuje heslo [obrana proti vlivovým vzorcům](@/kompendium/nlp-vzorce/vliv-a-zneuziti/obrana-proti-vlivovym-vzorcum.md).
Pro odborníky, kteří posuzují případy, je důležité dokumentovat pozorované znaky a
kontext, nikoli vyvozovat úmysl, a mít na paměti, že poškozený často nedokáže
přesně popsat, co se v rozhovoru dělo, a cítí jen, že rozhodnutí „nebylo jeho“.
Takový pocit je třeba brát vážně a pomoci mu najít slova, aniž by se mu vnucoval
hotový výklad. Zotavení po zkušenosti s manipulativním rozhovorem obvykle nevyžaduje
terapii, ale návrat důvěry ve vlastní úsudek a praktické kroky, například odstoupení od
smlouvy, pokud je to možné.

## Literatura

- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Chartrand, T. L., & Bargh, J. A. (1999). The chameleon effect: The perception–behavior link and social interaction. *Journal of Personality and Social Psychology*, 76(6), 893–910.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Kirsch, I., & Lynn, S. J. (1995). The altered state of hypnosis: Changes in the theoretical landscape. *American Psychologist*, 50(10), 846–858.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Sharpley, C. F. (1984). Predicate matching in NLP: A review of research on the preferred representational system. *Journal of Counseling Psychology*, 31(2), 238–248.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Vrij, A. (2008). *Detecting Lies and Deceit: Pitfalls and Opportunities* (2. vyd.). Chichester: Wiley.
- Wiseman, R., Watt, C., ten Brinke, L., Porter, S., Couper, S.-L., & Rankin, C. (2012). The eyes don't have it: Lie detection and neuro-linguistic programming. *PLoS ONE*, 7(7), e40259.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Vliv a zneužití NLP](@/kompendium/nlp-vzorce/vliv-a-zneuziti/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Oční přístupové signály](@/kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md) – příbuzné heslo (Základní pojmy NLP, Eye accessing cues)
- [Vložené příkazy](@/kompendium/nlp-vzorce/milton-model/vlozene-prikazy.md) – příbuzné heslo (Milton-model, Embedded commands)
- [Presupozice v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/presupozice-milton.md) – příbuzné heslo (Milton-model, Presuppositions (Milton Model))
- [Zrcadlení](@/kompendium/nlp-vzorce/raport-a-kalibrace/zrcadleni.md) – příbuzné heslo (Raport a kalibrace, Mirroring)
- [Konverzační hypnóza](@/kompendium/nlp-vzorce/vliv-a-zneuziti/konverzacni-hypnoza.md) – příbuzné heslo (Vliv a zneužití NLP, Conversational (covert) hypnosis)
- [Zrcadlení v podvodech](@/kompendium/nlp-vzorce/vliv-a-zneuziti/falesne-zrcadleni-v-podvodech.md) – příbuzné heslo (Vliv a zneužití NLP, Mirroring in scams)
- [Obrana proti vlivovým vzorcům](@/kompendium/nlp-vzorce/vliv-a-zneuziti/obrana-proti-vlivovym-vzorcum.md) – příbuzné heslo (Vliv a zneužití NLP, Defence against influence patterns)
- [Jak číst tvrzení NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/jak-cist-tvrzeni-nlp.md) – příbuzné heslo (Kritické hodnocení NLP, How to read NLP claims)

**V kompendiu**

- [Detekční signatury EA technik](@/kompendium/detection-signatures/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.4.1 Prosodická dominance](@/kompendium/techniques/ea-1-4-1-prosodicka-dominance.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [6.1 Diagnostické indikátory a markery EA](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Obrana proti vlivovým vzorcům](@/kompendium/nlp-vzorce/vliv-a-zneuziti/obrana-proti-vlivovym-vzorcum.md) – předchozí heslo rodiny

<!-- kompendium:katalog-vazby:end -->
