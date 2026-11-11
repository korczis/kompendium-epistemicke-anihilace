+++
title = "Sladění hodnot"
description = "Vzorec NLP, v němž mluvčí zjišťuje hodnotová slova druhého a vrací mu je jako popis své nabídky: od poctivého přizpůsobení po připínání cizích hodnot k produktu."
weight = 12
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-raport-a-kalibrace", "nlp-vzorec", "nlp-uziti-vliv"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Sladění hodnot", "Value matching", "sladění kritérií", "zrcadlení hodnot", "Raport a kalibrace", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-18.12"
catalog_slug = "sladeni-hodnot"
catalog_family = "raport-a-kalibrace"
catalog_family_code = "18"
catalog_family_title = "Raport a kalibrace"
catalog_family_en = "Rapport and calibration"
catalog_part = "raport-a-kalibrace.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Value matching"
catalog_aliases = ["sladění kritérií", "zrcadlení hodnot"]
catalog_use = "vliv"
catalog_use_cs = "převážně vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "raport"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["raport"]
catalog_related = ["respekt-k-modelu-sveta", "som-hierarchie-kriterii", "uroven-presvedceni-a-hodnot", "kriteria", "hodnoty-pri-koupi", "raport-jako-nastroj-vlivu", "pseudoempatie", "slovni-baliky", "falesne-zrcadleni-v-podvodech"]
catalog_related_declared = ["kriteria", "som-hierarchie-kriterii", "hodnoty-pri-koupi", "slovni-baliky", "uroven-presvedceni-a-hodnot", "raport-jako-nastroj-vlivu"]
catalog_kompendium = ["kompendium/techniques/ea-5-3-11-axiologicka-inverze.md", "kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md", "kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md", "kompendium/nlp-vzorce/metaprogramy/kriteria.md", "kompendium/techniques/ea-5-3-11-axiologicka-inverze.md", "kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md"]
catalog_prev = "raport-se-skupinou"
catalog_next = "raport-jako-nastroj-vlivu"
catalog_position = 12
catalog_family_size = 16
catalog_sources = ["charvet-1997", "cialdini-2009", "dilts-1999", "hall-bodenhamer-1997", "lifton-1961", "miller-rollnick-2013", "petty-cacioppo-1986", "singer-lalich-1995", "tosey-mathison-2009", "witkowski-2010"]
catalog_sources_primary = ["charvet-1997", "dilts-1999", "hall-bodenhamer-1997"]
catalog_sources_roots = []
catalog_sources_critical = ["cialdini-2009", "lifton-1961", "miller-rollnick-2013", "petty-cacioppo-1986", "singer-lalich-1995", "tosey-mathison-2009", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/raport-a-kalibrace.b.toml"
+++

# Sladění hodnot

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-18.12` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Value matching |
| **Jiné názvy** | sladění kritérií, zrcadlení hodnot |
| **Obecnější heslo** | [Raport](@/kompendium/nlp-vzorce/zakladni-pojmy/raport.md) |
| **Užití** | převážně vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Sladění hodnot je v NLP vzorec, ve kterém mluvčí nejprve zjistí, co je pro druhého
důležité, jaká slova pro to používá a v jakém pořadí své hodnoty řadí, a potom popisuje
svůj návrh, nabídku nebo skupinu právě těmito slovy. Navazuje na práci s
[kritérii](@/kompendium/nlp-vzorce/metaprogramy/kriteria.md), tedy s hodnotovými výrazy,
podle kterých člověk posuzuje, zda je něco dobré, a na představu, že raport se nebuduje jen
tělem a hlasem, ale i shodou v tom, na čem záleží. Tréninková literatura o metaprogramech
doporučuje používat přesně ta hodnotová slova, která druhý sám vyslovil, protože právě
jeho vlastní výrazy u něj vyvolávají silnou odezvu (Charvet 1997). Pro kompendium je vzorec
důležitý proto, že hodnoty patří k nejosobnějším vrstvám identity. Kdo je dokáže zrcadlit,
získává pocit důvěry, který se snadno přenese na nabídku, aniž by bylo ověřeno, zda nabídka
těmto hodnotám skutečně odpovídá.

## Původ a souvislosti

Práce s hodnotami se v NLP vyvíjela ve dvou liniích. První je práce s přesvědčeními a
hierarchií kritérií v pozdějších textech Roberta Diltse, kde se hodnoty chápou jako
hierarchicky uspořádané standardy a kde změna jejich vzájemného pořadí mění i to, jak člověk
hodnotí určitou situaci (Dilts 1999). Druhou linií je profilování jazyka v
tradici metaprogramů. Charvet v profilu jazykových vzorců popsala, jak lze z odpovědí na
otázku, co je pro člověka v určité oblasti důležité, získat jeho kritéria a jak je použít v
prodeji, vedení a náboru (Charvet 1997). Hall a Bodenhamer pojali metaprogramy jako
filtry, které určují, čemu člověk věnuje pozornost (Hall a Bodenhamer 1997).
Mimo NLP stojí v pozadí poznatek sociální psychologie, že podobnost a sdílené postoje
zvyšují vzájemnou sympatii a ochotu vyhovět, což Cialdini zařadil pod princip sympatie
(Cialdini 2009). Studium kultů a myšlenkové reformy zase ukazuje, jak se jazyk ideálů,
svobody, lásky nebo pravdy přebírá a uzavírá do slovníku skupiny (Lifton 1961).

## Struktura vzorce

Strukturálně má vzorec tři fáze. V první fázi se hodnoty zjišťují: mluvčí klade otázky na to,
co je pro druhého v dané oblasti důležité, co by musel mít, aby byl spokojený, a co by ho
naopak odradilo. Pozornost se soustředí na přesná slova a na jejich pořadí. Ve druhé fázi
mluvčí tato slova vrací, často doslovně, a spojuje je s vlastním návrhem: nabídka „přináší
svobodu“, skupina „je rodina“, pracovní místo „dává bezpečí“ (Charvet 1997). Ve třetí fázi se shoda
hodnotových slov vykládá jako shoda věcná. Druhý slyší, že jeho nejdůležitější hodnoty jsou
naplněny, a protože slova jsou jeho vlastní, má sklon jim věřit.

Klíčovým mechanismem je záměna slova a obsahu. Hodnotová slova jsou abstraktní nominalizace,
které nesou silný citový náboj, ale málo konkrétního obsahu. Pod slovem „svoboda“ si každý
představí něco jiného, a právě proto je lze připnout téměř k čemukoli. Kompendium tuto
vlastnost jazyka sleduje u
[hodnotově nabitých slov](@/kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md). Lifton
popsal příbuzný jev jako „nabíjení jazyka“, ve kterém se složité myšlenky stlačují do
krátkých, citově nabitých výrazů, které ukončují přemýšlení (Lifton 1961). Sladění hodnot
pracuje opačným směrem, ale se stejným výsledkem: vlastní slova člověka se mu vracejí v
cizím kontextu a nesou s sebou důvěru, kterou si zasloužila jen jeho vlastní zkušenost.

## Detekční znaky

Sladění hodnot se pozná podle několika znaků. Rozhovor začíná nezvykle podrobným
dotazováním na to, co je pro člověka důležité, a to v situaci, kde by to nebylo nutné, například
v úvodu prodejního hovoru nebo při prvním setkání s náborářem. Mluvčí si slova pečlivě
zapamatuje a později je opakuje doslovně, někdy ve stejném pořadí, v jakém je druhý
vyslovil. Popis nabídky se pak skládá převážně z těchto slov, kdežto konkrétní údaje o
ceně, podmínkách, pravidlech nebo povinnostech chybějí nebo přicházejí až pozdě. Nápadná je
také rychlost shody: všechno, na čem druhému záleží, nabídka splňuje, a žádný kompromis se
nepřiznává. V uzavřených skupinách se objevuje ještě jeden znak: nováček slyší, že skupina
sdílí právě jeho ideály, a teprve postupně zjišťuje, že slova jako „svoboda“ nebo „pravda“
mají ve skupině jiný, úzce vymezený význam. Kompendium tento posun popisuje u
[axiologické inverze](@/kompendium/techniques/ea-5-3-11-axiologicka-inverze.md), kde se
hodnoty postupně obracejí proti tomu, co původně znamenaly. Singer a Lalich popsaly, jak
náboráři zjišťují zájmy a touhy nových lidí a představují skupinu jako odpověď právě na ně
(Singer a Lalich 1995).

## Legitimní a manipulativní užití

Legitimní sladění hodnot je základem dobrého poradenství. Kariérní poradkyně, která zjišťuje,
co je pro klienta při výběru práce rozhodující, a potom mu nabízí možnosti, které těmto
kritériím skutečně odpovídají, postupuje správně. Lékař, který se ptá, na čem pacientovi při
léčbě záleží, a podle toho vysvětluje možnosti, respektuje jeho autonomii. Motivační
rozhovory pracují s hodnotami klienta otevřeně: zkoumají rozpor mezi tím, na čem mu záleží,
a tím, co dělá, ale směr změny nechávají na něm (Miller a Rollnick 2013). Legitimní užití má
tři rysy: hodnoty se zjišťují proto, aby se nabídka přizpůsobila, ne proto, aby se
přebarvila; hodnotová slova se doplňují konkrétními a ověřitelnými údaji; a nabídka, která
hodnotám neodpovídá, se nevnucuje.

Manipulativní užití obrací vztah mezi hodnotami a nabídkou. Nabídka je pevná a hodnoty
druhého slouží jako nátěr, kterým se nabídka přebarví. Charvet sama nabízí práci s kritérii jako
nástroj ovlivňování v obchodu a řízení (Charvet 1997), a kompendium proto upozorňuje, že
táž dovednost, která pomáhá porozumět, umožňuje i přesně mířené přesvědčování, při němž
druhý nevidí, že jeho slova se mu vracejí jako cizí argument.

## Stav důkazů

Tvrzení, že doslovné vracení hodnotových slov má zvláštní přesvědčovací sílu, nebylo v NLP
kontrolovaně ověřeno. Literatura o metaprogramech a kritériích stojí převážně na zkušenosti
trenérů a na příkladech z praxe (Charvet 1997; Hall a Bodenhamer 1997). Kritické přehledy
výzkumu NLP upozorňují, že obor obecně netestuje svá tvrzení kontrolovanými studiemi a že
dostupné studie jeho klíčová tvrzení většinou nepodporují (Witkowski 2010; Tosey a Mathison
2009). Některé mechanismy, o které se vzorec opírá, jsou ovšem doloženy mimo NLP. Podobnost
a vnímaná shoda postojů zvyšují sympatii a ochotu vyhovět (Cialdini 2009). Sdělení, které
se dotýká osobně důležitých hodnot, zvyšuje motivaci ho zpracovat, ale periferní znaky,
mezi něž patří sympatie ke zdroji, působí silněji tam, kde člověk nemá dost informací nebo
času na posouzení obsahu (Petty a Cacioppo 1986). Z toho plyne opatrný závěr: sladění hodnot
pravděpodobně zvyšuje sympatii a pocit porozumění, ale představa, že jde o přesný nástroj,
kterým lze druhého spolehlivě přimět k souhlasu, nemá empirický základ.

## Obrana a zotavení

Obrana spočívá v návratu od slov k obsahu. Kdo slyší, že nabídka splňuje přesně to, na čem mu
záleží, může se ptát, co konkrétně to znamená: jak vypadá „svoboda“ v této smlouvě, kolik
času, peněz a závazků „rodina“ v této skupině vyžaduje a co se stane, když člověk bude chtít
odejít. Abstraktní hodnotové slovo, které nelze převést na konkrétní a ověřitelný popis, je
signálem k opatrnosti. Druhou obranou je všímat si ozvěny. Pokud mluvčí opakuje vlastní
formulace člověka nápadně doslovně, stojí za to se ptát, zda jde o porozumění, nebo o
zrcadlení. Třetí obranou je ověřit nabídku u někoho, komu na stejných hodnotách záleží, ale
kdo nemá na rozhodnutí zájem. U lidí, jejichž hodnoty byly dlouhodobě přebírány a
přetvářeny ve slovníku skupiny, se zotavení týká obnovy vlastního významu těchto slov.
Klinická práce s lidmi po odchodu z uzavřených skupin často zahrnuje opětovné vymezení pojmů,
jako je láska, věrnost nebo pravda, v jejich původním, nekontrolovaném smyslu, a návrat k
tomu, že hodnoty patří člověku a ne skupině, která je spravuje (Lifton 1961; Singer a Lalich
1995). Užitečný je i rámec, který kompendium nabízí u
[Liftonových kritérií myšlenkové reformy](@/kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md).

## Literatura

- Charvet, S. R. (1997). *Words That Change Minds: Mastering the Language of Influence* (2. vyd.). Dubuque: Kendall/Hunt.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Dilts, R. (1999). *Sleight of Mouth: The Magic of Conversational Belief Change*. Capitola: Meta Publications.
- Hall, L. M., & Bodenhamer, B. G. (1997). *Figuring Out People: Design Engineering with Meta-Programs*. Carmarthen: Crown House Publishing.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Singer, M. T., & Lalich, J. (1995). *Cults in Our Midst*. San Francisco: Jossey-Bass.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Raport](@/kompendium/nlp-vzorce/zakladni-pojmy/raport.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Respekt k modelu světa druhého](@/kompendium/nlp-vzorce/predpoklady/respekt-k-modelu-sveta.md) – příbuzné heslo (Předpoklady NLP, Respect for the other person's model of the world)
- [Hierarchie kritérií](@/kompendium/nlp-vzorce/sleight-of-mouth/som-hierarchie-kriterii.md) – příbuzné heslo (Sleight of Mouth, Hierarchy of criteria)
- [Úroveň přesvědčení a hodnot](@/kompendium/nlp-vzorce/urovne-a-pozice/uroven-presvedceni-a-hodnot.md) – příbuzné heslo (Logické úrovně a percepční pozice, Beliefs and values level)
- [Kritéria](@/kompendium/nlp-vzorce/metaprogramy/kriteria.md) – příbuzné heslo (Metaprogramy, Criteria)
- [Hodnoty při koupi](@/kompendium/nlp-vzorce/metaprogramy/hodnoty-pri-koupi.md) – příbuzné heslo (Metaprogramy, Value buying)
- [Raport jako nástroj vlivu](@/kompendium/nlp-vzorce/raport-a-kalibrace/raport-jako-nastroj-vlivu.md) – příbuzné heslo (Raport a kalibrace, Rapport as an influence tool)
- [Předstíraná empatie](@/kompendium/nlp-vzorce/raport-a-kalibrace/pseudoempatie.md) – příbuzné heslo (Raport a kalibrace, Simulated empathy)
- [Hodnotově nabitá slova](@/kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md) – příbuzné heslo (Jazykové vzorce, Loaded words)
- [Zrcadlení v podvodech](@/kompendium/nlp-vzorce/vliv-a-zneuziti/falesne-zrcadleni-v-podvodech.md) – příbuzné heslo (Vliv a zneužití NLP, Mirroring in scams)

**V kompendiu**

- [EA-5.3.11 Axiologická inverze](@/kompendium/techniques/ea-5-3-11-axiologicka-inverze.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-8.2.2 Liftonova kritéria myšlenkové reformy](@/kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.6.1 Vzorec guru a adept](@/kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Raport se skupinou](@/kompendium/nlp-vzorce/raport-a-kalibrace/raport-se-skupinou.md) – předchozí heslo rodiny
- [Raport jako nástroj vlivu](@/kompendium/nlp-vzorce/raport-a-kalibrace/raport-jako-nastroj-vlivu.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
