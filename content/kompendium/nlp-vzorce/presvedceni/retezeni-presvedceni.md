+++
title = "Řetězení přesvědčení"
description = "Vzorec postupného přechodu od jednoho přesvědčení k jinému přes řadu menších mezistupňů: jeho struktura, příbuznost s technikou nohy ve dveřích a obrana."
weight = 9
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presvedceni", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
parent = "kompendium-nlp-vzorce-presvedceni"
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Řetězení přesvědčení", "Belief chaining", "řetěz přesvědčení", "belief chaining", "Přesvědčení", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-16.09"
nlp_slug = "retezeni-presvedceni"
nlp_family = "presvedceni"
nlp_family_code = "16"
nlp_family_title = "Přesvědčení"
nlp_family_en = "Belief patterns"
nlp_part = "presvedceni.b"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Belief chaining"
nlp_aliases = ["řetěz přesvědčení", "belief chaining"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = ""
nlp_narrower = []
nlp_depth = 0
nlp_ancestors = []
nlp_related = ["ano-sada", "retezeni-sugesci", "som-hierarchie-kriterii", "retezeni-kotev", "cyklus-zmeny-presvedceni"]
nlp_related_declared = ["retezeni-kotev", "som-hierarchie-kriterii", "retezeni-sugesci", "cyklus-zmeny-presvedceni", "ano-sada"]
nlp_kompendium = ["kompendium/techniques/ea-8-2-3-singer-six-conditions.md", "kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md", "kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/kotveni/retezeni-kotev.md", "kompendium/nlp-vzorce/kriticke-hodnoceni/stav-dukazu-nlp.md", "kompendium/nlp-vzorce/sleight-of-mouth/sleight-of-mouth.md", "kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md", "kompendium/techniques/ea-8-2-3-singer-six-conditions.md"]
nlp_prev = "beznadej-bezmoc-nehodnost"
nlp_next = "kartezske-otazky"
nlp_position = 9
nlp_family_size = 14
nlp_sources = ["cialdini-2009", "dilts-1990", "dilts-1999", "dilts-delozier-2000", "dilts-1980", "festinger-1957", "freedman-fraser-1966", "lifton-1961", "mcguire-1964", "miller-rollnick-2013", "passmore-rowson-2019", "singer-lalich-1995", "tversky-kahneman-1981", "witkowski-2010"]
nlp_sources_primary = ["dilts-1990", "dilts-1999", "dilts-delozier-2000", "dilts-1980"]
nlp_sources_roots = []
nlp_sources_critical = ["cialdini-2009", "festinger-1957", "freedman-fraser-1966", "lifton-1961", "mcguire-1964", "miller-rollnick-2013", "passmore-rowson-2019", "singer-lalich-1995", "tversky-kahneman-1981", "witkowski-2010"]
nlp_citations = 22
nlp_words = 1230
nlp_reading_minutes = 6
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/presvedceni.b.toml"
+++

# Řetězení přesvědčení

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-16.09` |
| **Rodina** | [Přesvědčení](@/kompendium/nlp-vzorce/presvedceni/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Belief chaining |
| **Jiné názvy** | řetěz přesvědčení, belief chaining |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Řetězení přesvědčení je vzorec, v němž se přechod od výchozího přesvědčení k přesvědčení
cílovému nerozhoduje jedním skokem, ale vede přes řadu mezilehlých přesvědčení. Každý článek
řetězu se od předchozího liší jen málo, a proto se jeví jako přijatelný, i když by vzdálenost
mezi začátkem a koncem byla při přímé konfrontaci příliš velká. V systemickém NLP se řetězení
uvádí jako jedna z cest, jak překonat odpor vůči změně přesvědčení, které je pro člověka
příliš vzdálené od toho, čemu věří nyní (Dilts a DeLozier 2000). Vzorec je strukturálně
příbuzný [řetězení kotev](@/kompendium/nlp-vzorce/kotveni/retezeni-kotev.md), kde se mezi
dva vzdálené stavy vkládají stavy přechodové, a práci s hierarchií kritérií v Sleight of
Mouth. Pro kompendium je podstatný proto, že stejná struktura postupných malých kroků tvoří
jádro řady dobře popsaných vlivových postupů od prodejních technik až po získávání členů do
uzavřených skupin. Rozpoznat ho znamená vidět řetěz jako celek, a ne jen jeho jednotlivé
články.

## Původ a souvislosti

Myšlenka řetězení prochází NLP od jeho počátků. V raných textech se objevuje v podobě
pojetí strategií, tedy představy, že chování lze rozložit na posloupnost dílčích
kroků, z nichž každý spouští další (Dilts a kol. 1980). Robert Dilts tento princip přenesl na
přesvědčení v době, kdy se jeho pozornost přesunula od strategií k systémům přesvědčení a k
logickým úrovním (Dilts 1990). V knize o [Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/sleight-of-mouth.md) rozvedl, jak se kritéria a hodnoty
uspořádávají do hierarchií, v nichž lze vyšší kritérium použít k překonání nižšího, a jak
přesvědčení zapadají do sítě příčin, důsledků a významů (Dilts 1999). Řetězení přesvědčení
spojuje obě linie: mezistupně se vybírají tak, aby každý byl ospravedlněn hodnotou, kterou
člověk už přijímá.

Sociální psychologie popsala příbuzný mechanismus nezávisle na NLP a s pevnějším
empirickým základem. Klasický experiment s technikou nohy ve dveřích ukázal, že lidé, kteří
vyhověli malé prosbě, častěji vyhoví i následné prosbě větší (Freedman a Fraser 1966).
Teorie kognitivní disonance vysvětluje, proč malé kroky váží: kdo jednou jednal určitým
způsobem, má sklon upravit své postoje tak, aby s jednáním ladily (Festinger 1957). Cialdini
tuto oblast shrnul jako princip závazku a konzistence a upozornil na jeho využívání v
prodeji (Cialdini 2009). Singerová a Lalichová pak popsaly, jak uzavřené skupiny vedou
nové členy k radikální změně přesvědčení po malých, jednotlivě nenápadných krocích (Singer a
Lalich 1995).

## Struktura vzorce

Řetěz má tři části. Výchozím bodem je současné přesvědčení člověka, například že určitý
cíl je pro něj nedosažitelný. Cílovým bodem je přesvědčení, k němuž má změna vést. Mezi nimi
leží mezistupně, které se volí podle dvou kritérií: každý má být blízko předchozímu a
každý má být spojen s hodnotou, kterou člověk sdílí. Pohyb po řetězu tak nevypadá jako
změna názoru, ale jako důsledné domýšlení toho, čemu člověk věří odjakživa. V terapeutické
podobě, jak ji popisuje systemické NLP, se mezistupně hledají společně s klientem a často se
spojují s místy v prostoru nebo se stavy, které klient sám vybavuje (Dilts a DeLozier 2000).

Ve vlivové podobě se řetěz obvykle skládá z jazykových spojení. Mluvčí začne obecnou
hodnotou, s níž nelze nesouhlasit, a pak klade další články ve formě „a kdo chce X, ten
také Y“. Každý článek obsahuje skrytou komplexní ekvivalenci nebo vztah příčiny a následku,
které by samostatně neobstály. Rychlost řetězu brání jejich prověření. Konečný článek je
konkrétní závazek: podpis, platba, odchod z dosavadních vztahů. Lifton u myšlenkové reformy
popsal, jak se doktrína postupně staví nad osobní zkušenost a jak se každé ustoupení stává
východiskem pro další (Lifton 1961). Strukturálně jde o tentýž řetěz, jen rozprostřený do
týdnů a měsíců.

Od poctivé argumentace se řetěz liší tím, že jeho články nejsou nutné, ale jen přijatelné.
Platný argument vede k závěru, který plyne z premis, a kdo premisy přijme, musí přijmout i
závěr. Řetěz přesvědčení naproti tomu spojuje články, z nichž každý připouští mnoho jiných
pokračování, a mluvčí z nich mlčky vybírá jediné. Pozorovatel proto nemusí hledat logickou
chybu v jednotlivém kroku; stačí si všimnout, že v každém bodě existovaly jiné, stejně
rozumné cesty, které mluvčí nezmínil. Tversky a Kahneman ukázali, že způsob, jakým je volba
předložena, mění rozhodnutí i tehdy, když se věcný obsah nemění, a výběr pokračování v řetězu
je právě takovým rámcováním (Tversky a Kahneman 1981).

## Detekční znaky

Řetězení se pozná podle několika znaků. Rozhovor začíná u velmi obecné hodnoty, jako je
rodina, zdraví, svoboda nebo osobní růst, a mluvčí si na ní vyžádá výslovný souhlas. Další
výroky jsou spojeny slovy „a proto“, „takže“, „kdo chce, ten“, ačkoli mezi nimi není nutná
souvislost. Každý krok je malý, ale směr je stálý a vede k cíli, který mluvčí znal od
začátku. Při pokusu zastavit se u jednoho článku mluvčí odkazuje na souhlas s předchozím
(„vždyť jsi sám říkal“), čímž využívá potřebu konzistence (Cialdini 2009). V uzavřených
skupinách je typické, že člověk zpětně nedokáže říct, kdy se rozhodl, protože žádný
jednotlivý krok nevypadal jako rozhodnutí (Singer a Lalich 1995). Varovným znakem je i
nepoměr: obecná hodnota na začátku je sdílená a neškodná, závazek na konci je konkrétní a
pro člověka nákladný. Kompendium tento průběh rozebírá u [šesti podmínek myšlenkové reformy](@/kompendium/techniques/ea-8-2-3-singer-six-conditions.md)
a u [Liftonových kritérií](@/kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md).

## Legitimní a manipulativní užití

Legitimní užití se od manipulativního liší tím, kdo řetěz staví a kdo určuje jeho konec.
V poradenství a terapii může mít smysl, aby člověk, který chce změnit ochromující
přesvědčení, nemusel skočit rovnou na jeho opak a mohl hledat menší, pro něj uvěřitelné
mezistupně. Motivační rozhovor pracuje s příbuznou citlivostí k tempu: změna, kterou klient
vyslovuje sám a vlastními slovy, je stabilnější než změna, k níž je tlačen (Miller a Rollnick
2013). Podmínkou je, že cíl si zvolil klient, mezistupně navrhuje nebo schvaluje on a každý
z nich může odmítnout. Manipulativní užití obrací všechny tři podmínky. Cíl řetězu určil
mluvčí, mezistupně předkládá on a odmítnutí kteréhokoli z nich se vykládá jako
nekonzistence nebo zrada vlastní hodnoty. Řetěz tak využívá dobře doložený sklon k
souladu mezi jednáním a postojem, aniž by člověk věděl, že se po řetězu pohybuje (Festinger
1957; Freedman a Fraser 1966).

## Stav důkazů

Pro řetězení přesvědčení jako techniku NLP neexistují kontrolované studie, které by
doložily jeho účinnost v terapii nebo koučinku. Obecné přehledy výzkumu NLP konstatují, že
empirická podpora oboru je slabá a že jeho techniky byly testovány zřídka a většinou
nepřesvědčivě (Witkowski 2010). Kritický přehled pro oblast koučinku dospěl k závěru, že
kvalitních studií je málo a že tvrzení praktiků převyšují doklady (Passmore a Rowson 2019).
Paradoxně má lepší empirickou oporu vlivová podoba vzorce: výzkum postupných závazků a
kognitivní disonance ukazuje, že malé kroky skutečně zvyšují ochotu k větším (Freedman a
Fraser 1966; Festinger 1957). Z toho neplyne, že terapeutické řetězení přesvědčení funguje
tak, jak NLP tvrdí, ale plyne z toho, že struktura řetězu je pro obranu relevantní bez
ohledu na [stav důkazů o NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/stav-dukazu-nlp.md) samotném.

## Obrana a zotavení

Hlavní obranou je rozpojit řetěz. Souhlas s obecnou hodnotou neznamená souhlas s žádným
konkrétním důsledkem, a je legitimní to říct nahlas: „Na rodině mi záleží, a právě proto o
této smlouvě rozhodnu až po poradě s ní.“ Druhou obranou je posuzovat každý článek
samostatně a ptát se, zda by obstál, kdyby byl předložen jako první. Třetí obranou je čas:
řetěz potřebuje tempo, a odložení rozhodnutí ho obvykle přeruší. McGuire ukázal, že odolnost
vůči přesvědčování posiluje předchozí seznámení s argumenty a jejich vyvrácením, a znalost
struktury řetězu tak funguje jako druh očkování (McGuire 1964). Po odchodu z prostředí, kde
byl člověk po řetězu veden dlouhodobě, pomáhá zpětná rekonstrukce jednotlivých kroků:
ukazuje, že k žádné „velké chybě“ nedošlo naráz, a tím snižuje stud, který odchod často
provází. Singerová a Lalichová upozorňují, že bývalí členové skupin se často obviňují z
naivity, a že pochopení postupného mechanismu je důležitou součástí zotavení (Singer a
Lalich 1995).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Dilts, R. (1990). *Changing Belief Systems with NLP*. Cupertino: Meta Publications.
- Dilts, R. (1999). *Sleight of Mouth: The Magic of Conversational Belief Change*. Capitola: Meta Publications.
- Dilts, R., & DeLozier, J. (2000). *Encyclopedia of Systemic Neuro-Linguistic Programming and NLP New Coding*. Scotts Valley: NLP University Press.
- Dilts, R., Grinder, J., Bandler, R., & DeLozier, J. (1980). *Neuro-Linguistic Programming: Volume I. The Study of the Structure of Subjective Experience*. Cupertino: Meta Publications.
- Festinger, L. (1957). *A Theory of Cognitive Dissonance*. Stanford: Stanford University Press.
- Freedman, J. L., & Fraser, S. C. (1966). Compliance without pressure: The foot-in-the-door technique. *Journal of Personality and Social Psychology*, 4(2), 195–202.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Singer, M. T., & Lalich, J. (1995). *Cults in Our Midst*. San Francisco: Jossey-Bass.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Přesvědčení](@/kompendium/nlp-vzorce/presvedceni/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců

**Příbuzné vzorce**

- [Řada souhlasů](@/kompendium/nlp-vzorce/milton-model/ano-sada.md) – příbuzný vzorec (Milton-model, Yes set)
- [Řetězení sugescí](@/kompendium/nlp-vzorce/milton-model/retezeni-sugesci.md) – příbuzný vzorec (Milton-model, Linking suggestions)
- [Hierarchie kritérií](@/kompendium/nlp-vzorce/sleight-of-mouth/som-hierarchie-kriterii.md) – příbuzný vzorec (Sleight of Mouth, Hierarchy of criteria)
- [Řetězení kotev](@/kompendium/nlp-vzorce/kotveni/retezeni-kotev.md) – příbuzný vzorec (Kotvení, Chaining anchors)
- [Cyklus změny přesvědčení](@/kompendium/nlp-vzorce/presvedceni/cyklus-zmeny-presvedceni.md) – příbuzný vzorec (Přesvědčení, Belief change cycle)

**V kompendiu**

- [EA-8.2.3 Šest podmínek myšlenkové reformy (Singerová)](@/kompendium/techniques/ea-8-2-3-singer-six-conditions.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-8.2.2 Liftonova kritéria myšlenkové reformy](@/kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-1.6.1 Vzorec guru a adept](@/kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Beznaděj, bezmoc a pocit bezcennosti](@/kompendium/nlp-vzorce/presvedceni/beznadej-bezmoc-nehodnost.md) – předchozí vzorec rodiny
- [Kartézské otázky](@/kompendium/nlp-vzorce/presvedceni/kartezske-otazky.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
