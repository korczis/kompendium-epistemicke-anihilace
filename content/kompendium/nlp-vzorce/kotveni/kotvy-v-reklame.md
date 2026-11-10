+++
title = "Kotvy v reklamě a značkách"
description = "Znělky, loga, barvy a tváře jako kotvy značky: co NLP popisuje jako kotvení v reklamě, co o asociativním vlivu říká výzkum a jak se mu bránit."
weight = 16
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-kotveni", "nlp-vzorec", "nlp-uziti-vliv"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Kotvy v reklamě a značkách", "Anchors in advertising", "asociace se značkou", "znělky a loga jako kotvy", "Kotvení", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-09.16"
nlp_slug = "kotvy-v-reklame"
nlp_family = "kotveni"
nlp_family_code = "09"
nlp_family_title = "Kotvení"
nlp_family_en = "Anchoring"
nlp_part = "kotveni.b"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Anchors in advertising"
nlp_aliases = ["asociace se značkou", "znělky a loga jako kotvy"]
nlp_use = "vliv"
nlp_use_cs = "převážně vlivové"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = "kotveni"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["kotveni"]
nlp_related = ["presupozice-v-reklame", "auditivni-kotvy", "vizualni-kotvy", "vzorec-godiva", "submodality-v-reklame", "metaprogramy-v-marketingu", "budouci-prehravani-v-prodeji", "nlp-v-reklame"]
nlp_related_declared = ["nlp-v-reklame", "presupozice-v-reklame", "submodality-v-reklame", "vizualni-kotvy", "auditivni-kotvy", "metaprogramy-v-marketingu"]
nlp_kompendium = ["kompendium/techniques/ea-9-5-3-emotional-meme-engineering.md", "kompendium/07-teoreticke-reflexe/digitalni-vek.md", "kompendium/techniques/ea-7-3-1-kahneman-system12.md"]
nlp_links_prose = ["kompendium/07-teoreticke-reflexe/digitalni-vek.md", "kompendium/07-teoreticke-reflexe/politicka-ea.md", "kompendium/nlp-vzorce/kotveni/kotveni.md", "kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md", "kompendium/nlp-vzorce/vliv-a-zneuziti/neuro-zargon.md", "kompendium/techniques/ea-9-5-3-emotional-meme-engineering.md"]
nlp_prev = "kotveni-ve-skupine"
nlp_next = "nechtene-kotvy"
nlp_position = 16
nlp_family_size = 19
nlp_sources = ["bandler-grinder-1979", "cialdini-2009", "kahneman-2011", "mcguire-1964", "oconnor-seymour-1990", "pavlov-1927", "petty-cacioppo-1986", "sharpley-1987", "witkowski-2010", "van-der-linden-2023"]
nlp_sources_primary = ["bandler-grinder-1979", "oconnor-seymour-1990"]
nlp_sources_roots = ["pavlov-1927"]
nlp_sources_critical = ["cialdini-2009", "kahneman-2011", "mcguire-1964", "petty-cacioppo-1986", "sharpley-1987", "witkowski-2010", "van-der-linden-2023"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/kotveni.b.toml"
+++

# Kotvy v reklamě a značkách

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-09.16` |
| **Rodina** | [Kotvení](@/kompendium/nlp-vzorce/kotveni/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Anchors in advertising |
| **Jiné názvy** | asociace se značkou, znělky a loga jako kotvy |
| **Obecnější vzorec** | [Kotvení](@/kompendium/nlp-vzorce/kotveni/kotveni.md) |
| **Užití** | převážně vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Kotvami v reklamě a ve značkách se v jazyce NLP označují podněty, které mají u spotřebitele
vybavit náladu, hodnotu nebo identitu spojenou se značkou: znělka, logo, barva, typ písma,
vůně prodejny, tvář známé osobnosti nebo opakovaná fráze. Podle NLP reklama opakovaně
spojuje tyto podněty s příjemnými stavy, například s pocitem přátelství, bezpečí, svobody nebo
prestiže, a později podnět sám, třeba na obalu v regálu, má stav vybavit a ovlivnit
rozhodnutí (O'Connor a Seymour 1990). Vzorec je aplikací obecného
[kotvení](@/kompendium/nlp-vzorce/kotveni/kotveni.md) na masovou komunikaci a souvisí
s dalšími hesly katalogu, která popisují NLP v reklamě, například s
[presupozicemi v reklamě](@/kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md).
Pro obranné čtení je podstatné, že jde o jev, který reklamní praxe a výzkum spotřebitelského
chování znají nezávisle na NLP. NLP mu dává vlastní pojmenování a zasazuje ho do teorie
kotev, ale samotný princip asociace značky s náladou nevymyslelo. Úkolem stránky je ukázat
jeho strukturu a hranici mezi informací a obcházením úvahy.

## Původ a souvislosti

Myšlenka, že lze spojit neutrální podnět s emoční reakcí opakovaným párováním, vychází z
výzkumu podmiňování (Pavlov 1927). Reklama s asociacemi tohoto druhu pracovala dávno předtím, než vzniklo NLP, a
psychologie učení i výzkum postojů ji v tom inspirovaly nezávisle na něm.
NLP přineslo jazyk, v němž se z reklamní asociace stává „kotva“, a představu, že stejný
mechanismus funguje u jednotlivce v terapii i u milionů diváků (Bandler a Grinder 1979).
Sociální psychologie nabízí pro tyto jevy vlastní a podrobněji ověřené rámce. Cialdini
popisuje, jak se lidé nechávají ovlivnit asociacemi: sympatie k osobě nebo k věci, která je
spojena s příjemnými zážitky, se přenáší na to, co nabízí, a inzerenti proto spojují výrobky
se známými osobnostmi, sportovními úspěchy nebo atraktivními obrazy (Cialdini 2009). Model
pravděpodobnosti propracování vysvětluje, že takové podněty působí hlavně periferní cestou,
tedy tehdy, když člověk nemá motivaci nebo kapacitu pečlivě zvažovat argumenty, a že postoje
vytvořené touto cestou bývají méně stabilní (Petty a Cacioppo 1986). Kahneman popisuje rychlé,
asociativní myšlení, které vytváří dojmy a preference bez úsilí a bez vědomí, odkud pocházejí
(Kahneman 2011). Reklamní kotvy jsou z tohoto pohledu cílené vstupy do asociativního systému.

## Struktura vzorce

Strukturálně má reklamní kotva dvě fáze, které se mohou časově rozcházet o měsíce nebo
roky. V první fázi se podnět spojený se značkou opakovaně vystavuje spolu s obrazy, hudbou
nebo příběhy, které vyvolávají žádoucí náladu. Spojení je nenápadné a zpravidla neobsahuje
žádnou informaci o výrobku samotném. Ve druhé fázi se podnět objeví v místě nebo okamžiku
rozhodnutí: na obalu, ve vůni prodejny, v hudbě v obchodě, v notifikaci telefonu. Podle
NLP má podnět přenést náladu na volbu. Struktura se často kombinuje s identitním sdělením:
značka se nespojuje jen s náladou, ale s obrazem toho, kým člověk je nebo chce být, a nákup
se tak stává vyjádřením příslušnosti. V digitálním prostředí se struktura dále zesiluje
personalizací, kdy se podněty přizpůsobují dosavadnímu chování uživatele, a opakováním napříč
platformami. Kompendium tyto mechanismy rozebírá v kapitole o
[digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md) a u techniky
[emotional meme engineering](@/kompendium/techniques/ea-9-5-3-emotional-meme-engineering.md).
Pro pozorovatele je klíčové, že reklamní kotva nepracuje s argumentem; pracuje s náladou,
která má rozhodnutí předejít nebo ho zabarvit (Petty a Cacioppo 1986).

## Detekční znaky

Reklamní kotvu lze rozpoznat podle několika znaků. Sdělení neobsahuje informaci o vlastnostech,
ceně nebo kvalitě výrobku, ale pracuje s obrazy, které s výrobkem věcně nesouvisejí: s
přátelstvím, letní pohodou, rodinným teplem, sportovním vítězstvím nebo svobodou. Stejný
zvukový nebo vizuální podnět se opakuje v reklamě i v místě prodeje, často se stejnou
melodií nebo barvou. Výrobek je spojován se známou tváří, jejíž popularita nemá s výrobkem
nic společného. Sdělení oslovuje identitu: „lidé jako vy“, „ti, kdo vědí“, „naše komunita“.
V prodejně se objevují smyslové podněty, které mají navodit náladu, například hudba, vůně
nebo osvětlení, a jejich spojení s konkrétní značkou je záměrné. Znakem na straně spotřebitele
je situace, kdy člověk po nákupu nedokáže říct, proč si vybral právě tento výrobek, a jeho
vysvětlení se omezují na pocit nebo na to, že výrobek „zná“. Kahneman popisuje, jak
opakované vystavení podnětu zvyšuje jeho známost a jak se pocit známosti snadno zaměňuje za
pocit důvěry nebo pravdivosti (Kahneman 2011).

## Legitimní a manipulativní užití

Ne každé spojení značky se symbolem je manipulativní. Logo, které umožňuje rychle rozpoznat
výrobce, nebo certifikační značka, která odkazuje na ověřitelná kritéria kvality, zkracují
cestu k informaci a jsou legitimní. Hodnota takového symbolu stojí na tom, co označuje, a lze
ji zkontrolovat. Reklama, která vedle nálady poskytuje i pravdivé informace o výrobku, ponechává
spotřebiteli možnost uvážit. Manipulativní užití nastává, když asociace nahrazuje informaci,
když se zaměřuje na zranitelné skupiny, například na děti nebo na lidi se závislostí, a když
se podnět záměrně umisťuje do okamžiku rozhodnutí tak, aby úvahu přerušil. Zvláště rizikové
je spojování výrobků, které poškozují zdraví, s obrazy svobody, sounáležitosti nebo úspěchu.
Hranice se dá vyjádřit otázkou: rozhodl bych se stejně, kdybych dostal jen věcné informace o
výrobku a ceně, bez hudby a obrazů? Pokud ne, je dobré vědět, co rozhodnutí skutečně řídilo.

Stejná struktura se neomezuje na zboží. Politické kampaně, ideologická hnutí i uzavřené
skupiny pracují se znělkami, barvami, symboly a hesly, které spojují s pocitem příslušnosti,
hrdosti nebo ohrožení, a pak je používají v okamžiku, kdy má člověk rozhodnout, komu dá hlas,
peníze nebo čas. Kompendium tyto přesahy rozebírá v kapitole o
[politické a ideologické manipulaci](@/kompendium/07-teoreticke-reflexe/politicka-ea.md).
Rozdíl mezi spotřební a politickou reklamou není ve struktuře, ale v sázkách: zatímco u
nápoje jde o drobnou ztrátu, u ideologického symbolu může asociace s hrdostí nebo strachem
ovlivnit postoj k celým skupinám lidí. Cialdini upozorňuje, že principy vlivu, které fungují
v obchodě, fungují stejně i v jiných oblastech života a že jejich rozpoznání je základem
obrany (Cialdini 2009).

## Stav důkazů

Specifická tvrzení NLP o reklamních kotvách nebyla předmětem samostatného výzkumu, který by
prokázal, že teorie kotev přidává k dosavadnímu poznání něco nového. Kritické přehledy NLP
obecně konstatují, že techniky oboru postrádají empirickou podporu a že jejich teoretický
rámec je formulován tak, že se obtížně testuje (Witkowski 2010; Sharpley 1987). Výzkum
přesvědčování a spotřebitelského chování naproti tomu dokládá, že asociace, sympatie, nálada
a známost ovlivňují postoje a volby, zvláště při nízké pozornosti, a že síla těchto vlivů
závisí na kontextu, na pozornosti a na motivaci člověka (Petty a Cacioppo 1986; Cialdini 2009). Rozumné je tedy
oddělit dvě tvrzení. Že reklama pracuje s asociacemi a že asociace mají na volbu vliv, je
dobře doloženo. Že tento vliv je kotvou ve smyslu NLP, kterou lze přesně řídit a která
spolehlivě spouští nákup, doloženo není. Prodejci kurzů „NLP v marketingu“ někdy první
tvrzení používají k podpoře druhého; tento posun je typickým příkladem
[neurožargonu](@/kompendium/nlp-vzorce/vliv-a-zneuziti/neuro-zargon.md).

## Obrana a zotavení

Obrana proti reklamním kotvám nespočívá v tom, že by se člověk vyhnul všem asociacím, což
není možné, ale v tom, že je rozpozná a oddělí od rozhodnutí. Pomáhá vědomě pojmenovat, s
čím je výrobek v reklamě spojen, a zeptat se, zda tato souvislost má s výrobkem něco
společného. U větších nákupů je užitečné porovnávat výrobky podle věcných kritérií, tedy
podle ceny, složení, parametrů a nezávislých hodnocení, a rozhodovat se mimo prodejnu, mimo
hudbu a mimo notifikace. Výzkum takzvané inokulace ukazuje, že předchozí seznámení s
technikami přesvědčování a s jejich slabinami zvyšuje odolnost vůči nim (McGuire 1964).
Novější práce tento přístup rozšiřují na dezinformace a manipulativní obsah a ukazují, že
krátké vysvětlení technik před vystavením může snížit jejich účinek (van der Linden 2023). Pro
rodiče a pedagogy je důležitá mediální výchova dětí, které asociativní reklamu rozpoznávají
hůře než dospělí. Pro lidi, jejichž spotřeba se stala problémem, například u kompulzivního
nakupování nebo u závislostí, je důležité vědět, že podněty spojené s předmětem závislosti
mohou vyvolávat silnou touhu; v takovém případě patří k obraně omezení vystavení podnětům a
odborná pomoc, ne pouhá vůle.

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1979). *Frogs into Princes: Neuro Linguistic Programming*. Moab: Real People Press.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Pavlov, I. P. (1927). *Conditioned Reflexes: An Investigation of the Physiological Activity of the Cerebral Cortex*. London: Oxford University Press.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.
- van der Linden, S. (2023). *Foolproof: Why Misinformation Infects Our Minds and How to Build Immunity*. London: 4th Estate.

## Související

**Rodina a hierarchie**

- [Kotvení](@/kompendium/nlp-vzorce/kotveni/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Kotvení](@/kompendium/nlp-vzorce/kotveni/kotveni.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Presupozice v reklamě](@/kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md) – příbuzný vzorec (Jazykové presupozice, Presuppositions in advertising)
- [Auditivní a tonální kotvy](@/kompendium/nlp-vzorce/kotveni/auditivni-kotvy.md) – příbuzný vzorec (Kotvení, Auditory and tonal anchors)
- [Vizuální kotvy](@/kompendium/nlp-vzorce/kotveni/vizualni-kotvy.md) – příbuzný vzorec (Kotvení, Visual anchors)
- [Vzorec Godiva](@/kompendium/nlp-vzorce/submodality/vzorec-godiva.md) – příbuzný vzorec (Submodality, Godiva chocolate pattern)
- [Submodality v reklamě a médiích](@/kompendium/nlp-vzorce/submodality/submodality-v-reklame.md) – příbuzný vzorec (Submodality, Submodalities in advertising and media)
- [Metaprogramy v marketingu](@/kompendium/nlp-vzorce/metaprogramy/metaprogramy-v-marketingu.md) – příbuzný vzorec (Metaprogramy, Meta-programs in marketing)
- [Budoucí přehrávání v prodeji](@/kompendium/nlp-vzorce/vliv-a-zneuziti/budouci-prehravani-v-prodeji.md) – příbuzný vzorec (Vliv a zneužití NLP, Future pacing in sales)
- [NLP v reklamě](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-reklame.md) – příbuzný vzorec (Vliv a zneužití NLP, NLP in advertising)

**V kompendiu**

- [EA-9.5.3 Emotional Meme Engineering](@/kompendium/techniques/ea-9-5-3-emotional-meme-engineering.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [7.7 EA v digitálním věku — algoritmy, AI, generativní modely, deepfakes](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-7.3.1 Kahneman: Systém 1 a 2](@/kompendium/techniques/ea-7-3-1-kahneman-system12.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Kotvení ve skupině](@/kompendium/nlp-vzorce/kotveni/kotveni-ve-skupine.md) – předchozí vzorec rodiny
- [Nechtěné kotvy a spouštěče](@/kompendium/nlp-vzorce/kotveni/nechtene-kotvy.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
