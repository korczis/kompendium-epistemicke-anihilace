+++
title = "Hierarchie myšlenek"
description = "Model NLP, který řadí pojmy od konkrétních případů k obecným třídám a účelům: jak pomáhá orientaci v řeči a jak se zneužívá k nepozorovaným skokům mezi úrovněmi."
weight = 1
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-jazykove-vzorce", "nlp-pojem", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Hierarchie myšlenek", "Hierarchy of ideas", "hierarchie idejí", "žebříček abstrakce", "Jazykové vzorce", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-20.01"
nlp_slug = "hierarchie-idei"
nlp_family = "jazykove-vzorce"
nlp_family_code = "20"
nlp_family_title = "Jazykové vzorce"
nlp_family_en = "Language patterns"
nlp_part = "jazykove-vzorce"
nlp_type = "concept"
nlp_type_cs = "pojem"
nlp_en = "Hierarchy of ideas"
nlp_aliases = ["hierarchie idejí", "žebříček abstrakce"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = "chunking"
nlp_narrower = ["chunking-nahoru", "chunking-dolu", "lateralni-chunking"]
nlp_depth = 1
nlp_ancestors = ["chunking"]
nlp_related = ["logicke-urovne-pojem", "chunking", "meta-model", "som-zobecneni", "obecne-a-specificke", "chunking-nahoru", "chunking-dolu", "lateralni-chunking"]
nlp_related_declared = ["chunking-nahoru", "chunking-dolu", "lateralni-chunking", "obecne-a-specificke", "logicke-urovne-pojem", "meta-model"]
nlp_kompendium = ["kompendium/techniques/ea-5-1-6-kategoricka-transgrese.md", "kompendium/techniques/ea-5-4-2-russell-typ-violace.md", "kompendium/02-uvod/filosoficky-ramec.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md", "kompendium/nlp-vzorce/jazykove-vzorce/zatim.md", "kompendium/nlp-vzorce/metaprogramy/obecne-a-specificke.md", "kompendium/nlp-vzorce/milton-model/milton-model.md", "kompendium/nlp-vzorce/zakladni-pojmy/chunking.md", "kompendium/techniques/ea-5-1-6-kategoricka-transgrese.md", "kompendium/techniques/ea-5-4-2-russell-typ-violace.md"]
nlp_prev = ""
nlp_next = "chunking-nahoru"
nlp_position = 1
nlp_family_size = 20
nlp_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "bateson-1972", "beck-1976", "dilts-1999", "korzybski-1933", "lifton-1961", "mcguire-1964", "miller-1956", "miller-galanter-pribram-1960", "oconnor-seymour-1990", "passmore-rowson-2019", "tosey-mathison-2009", "tversky-kahneman-1981", "watzlawick-1974", "witkowski-2010", "van-der-linden-2023"]
nlp_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b", "dilts-1999", "oconnor-seymour-1990"]
nlp_sources_roots = ["bateson-1972", "korzybski-1933", "miller-1956", "miller-galanter-pribram-1960", "watzlawick-1974"]
nlp_sources_critical = ["beck-1976", "lifton-1961", "mcguire-1964", "passmore-rowson-2019", "tosey-mathison-2009", "tversky-kahneman-1981", "witkowski-2010", "van-der-linden-2023"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/jazykove-vzorce.toml"
+++

# Hierarchie myšlenek

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-20.01` |
| **Rodina** | [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) |
| **Druh** | pojem |
| **Anglicky** | Hierarchy of ideas |
| **Jiné názvy** | hierarchie idejí, žebříček abstrakce |
| **Obecnější vzorec** | [Chunking](@/kompendium/nlp-vzorce/zakladni-pojmy/chunking.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Hierarchií myšlenek, v tréninkové literatuře také hierarchií idejí, se v neurolingvistickém programování rozumí představa, že každý pojem, o kterém se mluví, leží někde na žebříčku obecnosti. Nad ním jsou širší třídy, do kterých patří, a účely, kterým slouží; pod ním jsou jeho konkrétní případy, části a podrobnosti; vedle něj jsou jiné případy téže třídy. „Auto“ je případem „dopravního prostředku“, sloužícího „pohybu“ a nakonec třeba „svobodě“, a zároveň třídou, pod kterou spadá „moje staré modré kombi“. Pohyb po žebříčku NLP označuje jako [chunking](@/kompendium/nlp-vzorce/zakladni-pojmy/chunking.md): nahoru, dolů a do stran (O'Connor a Seymour 1990). Hierarchie myšlenek je tedy mapa, na které se tyto pohyby odehrávají, a ne technika sama o sobě. Kompendium ji zařazuje proto, že kdo vidí, na které úrovni se rozhovor právě drží a kdy a jak se přesunul, rozpozná velkou část jazykového vlivu, aniž by potřeboval znát jednotlivé vzorce. Pozorovatel se nemusí ptát, jakou techniku mluvčí použil; stačí, když se ptá, odkud kam se výrok posunul a zda ten posun unese logika.

## Původ a souvislosti

Myšlenka úrovní abstrakce je starší než NLP. Alfred Korzybski v obecné sémantice popsal, jak člověk od události přes vjem a pojmenování dospívá k stále obecnějším výrokům, a varoval, že zaměňování úrovní abstrakce je zdrojem chyb v usuzování (Korzybski 1933). Gregory Bateson převzal z logiky Russellovu teorii typů a ukázal, že třída není totéž co její člen a že komunikace selhává, když se tyto úrovně pletou; na tom stavěl i svou teorii úrovní učení (Bateson 1972). Watzlawick a spolupracovníci téhož rozlišení použili k vysvětlení, proč některé pokusy o řešení problém jen udržují: změna uvnitř třídy nechává třídu nedotčenou, kdežto změna na úrovni třídy mění pravidla (Watzlawick, Weakland a Fisch 1974). Z kognitivní psychologie si NLP vypůjčilo slovo „chunk“ z Millerovy práce o seskupování informací do celků (Miller 1956) a představu hierarchicky uspořádaných plánů, v nichž vyšší cíle řídí nižší kroky (Miller, Galanter a Pribram 1960).

V samotném NLP se dva zakládající jazykové modely dají číst jako dva směry pohybu po této hierarchii. Meta-model klade otázky po konkrétnosti a vede řeč dolů k údajům, které se ve výpovědi ztratily (Bandler a Grinder 1975). [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) naopak pracuje s obecnými a neurčitými formulacemi, do nichž si posluchač doplní vlastní obsah (Bandler a Grinder 1975b). Robert Dilts později zahrnul pohyb nahoru, dolů a do stran mezi konverzační vzorce, kterými se mění rámec přesvědčení (Dilts 1999). Výraz „hierarchie myšlenek“ jako samostatný model se rozšířil hlavně v pozdějších seminářích a příručkách; jednotlivé školy jej kreslí různě a nemají shodnou definici.

## Struktura vzorce

Pro analýzu je nejdůležitější, že žebříček obecnosti není jeden. V řeči se pod společným obrazem „nahoru a dolů“ mísí nejméně tři různé vztahy. Prvním je vztah třídy a členu: jablko je ovoce. Druhým je vztah celku a části: kolo je součástí auta. Třetím je vztah účelu a prostředku: auto slouží k cestování. Každý z nich má jinou logiku. Co platí o třídě, platí o každém členu jen tehdy, jde-li o vlastnost, kterou třída skutečně vymezuje. Co platí o celku, nemusí platit o částech. A z účelu prostředek neplyne vůbec: k cestování slouží i vlak, kolo nebo chůze. Tréninkové podání NLP tyto vztahy obvykle neodlišuje a mluví prostě o „větších“ a „menších“ celcích.

Druhou strukturní vlastností je asymetrie směrů. Od konkrétního případu vede nahoru v každém vztahu jen málo cest, ale od obecné hodnoty vede dolů cest mnoho. Kdo přejde od hodnoty k jednomu konkrétnímu kroku, provedl volbu, i když ji nemusí přiznat. Třetí vlastností je výměna přesnosti za shodu. Na vyšších úrovních se lidé shodnou snáz, protože obecné výroky skoro nic nevylučují; na nižších úrovních jsou výroky ověřitelné, ale také sporné. Čtvrtou vlastností je, že tentýž pojem leží v několika hierarchiích najednou: pes je savec, domácí zvíře, majetek i člen rodiny. Volba hierarchie je volbou rámce a Tversky a Kahneman ukázali, že už samotný způsob popisu téže volby mění rozhodnutí lidí (Tversky a Kahneman 1981). Pozorovatel se proto ptá nejen na úroveň, ale i na to, v jaké hierarchii se úroveň měří.

## Detekční znaky

Hierarchie myšlenek se v rozhovoru zneužívá hlavně tak, že se přesun mezi úrovněmi provede, aniž by se pojmenoval. Prvním znakem je skok od hodnoty k jedinému prostředku, který se podá jako její nutný důsledek, viz stránku o [chunkingu nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md). Druhým znakem je odpověď na jiné úrovni, než na které byla položena otázka: na dotaz po faktu přijde hodnota, na dotaz po smyslu záplava detailů. Třetím znakem je záměna vztahů, kdy se z vlastnosti celku vyvozuje vlastnost části nebo z vlastnosti jednoho člena vlastnost celé třídy. Kompendium podobné přestupky mezi úrovněmi popisuje jako [kategorickou transgresi](@/kompendium/techniques/ea-5-1-6-kategoricka-transgrese.md) a v logické podobě jako [porušení typové hierarchie](@/kompendium/techniques/ea-5-4-2-russell-typ-violace.md). Čtvrtým znakem je přeskok od jednoho chování k celé osobě: „udělal jsi chybu“ se mění v „jsi neschopný“. Beck popsal přehnané zobecňování jako jednu z typických chyb usuzování u depresivních lidí (Beck 1976); když je však zobecnění vnucováno zvenčí, jde o vliv, ne o kognitivní omyl samotného člověka. Pátým znakem je hromadění abstraktních podstatných jmen, která nelze vztáhnout k žádné pozorovatelné události.

## Legitimní a manipulativní užití

Legitimní užití hierarchie myšlenek je běžné v učení, plánování i vyjednávání. Učitel, který obecný zákon předvede na příkladech a z příkladů nechá žáky zákon odvodit, se po žebříčku pohybuje oběma směry a otevřeně. Mediátor odlišuje pozice stran od jejich zájmů a hledá řešení, které by zájmům vyhovělo lépe než původní pozice. V psychoterapii pomáhá konkretizace nahradit obecné „všechno je špatně“ přesnějším popisem, se kterým se dá pracovat (Beck 1976). Ve všech těchto případech je pohyb ohlášený, vratný a druhá strana do něj může vstoupit.

Manipulativní užití se pozná podle toho, že přesun je jednosměrný a skrytý a že z něj těží mluvčí. Souhlas získaný na úrovni hodnoty se přenese na prostředek, otázky po konkrétnosti se odbývají ideály, nebo se naopak podstatná otázka utopí v podrobnostech. V uzavřených skupinách se takový jazyk ustaluje: Lifton popsal, jak se složité lidské problémy stlačují do několika obecných hesel, která ukončí přemýšlení dřív, než začne (Lifton 1961). Hierarchie myšlenek tu nefunguje jako mapa pro orientaci, ale jako dráha, po které je posluchač veden.

## Stav důkazů

Rozlišování úrovní abstrakce má solidní filozofické a logické zázemí (Korzybski 1933; Bateson 1972) a kognitivní psychologie o kategorizaci a seskupování informací vypracovala rozsáhlý výzkum, který však vznikl mimo NLP a nepotvrzuje jeho specifická tvrzení. Samotná „hierarchie myšlenek“ je didaktické schéma, nikoli teorie s ověřitelnými předpověďmi. Neexistuje kontrolovaný výzkum, který by ukázal, že lidé vyškolení v tomto modelu vyjednávají, léčí nebo přesvědčují úspěšněji. Přehled výzkumu NLP shrnuje, že většina testovaných tvrzení oboru empirickou oporu nemá (Witkowski 2010), a kritický přehled pro oblast koučinku konstatuje, že kvalitních studií je málo (Passmore a Rowson 2019). Tosey a Mathison upozorňují, že NLP často přebírá pojmy z jiných oborů, například z Batesona, a při tom posouvá jejich původní obsah (Tosey a Mathison 2009). Pro čtenáře z toho plyne střízlivý závěr: schéma je užitečné k popisu toho, co se v řeči děje, ale jeho užitečnost neplyne z výzkumu NLP, nýbrž z obecné logiky a teorie komunikace, ze které vychází.

## Obrana a zotavení

Obrana stojí na tom, že si posluchač pohyb po žebříčku zviditelní. Pomáhá pojmenovat úroveň, na které je shoda: „souhlasím, že bezpečí je důležité“, a hned dodat, s čím souhlas zatím není: „s tímto konkrétním opatřením [ještě ne](@/kompendium/nlp-vzorce/jazykove-vzorce/zatim.md)“. Pomáhá také zeptat se, jaký vztah mluvčí právě použil. Je navržený krok jedním z mnoha prostředků k cíli, částí většího celku, nebo případem obecného pravidla? A co dalšího by k témuž cíli vedlo? Výzkum odolnosti vůči přesvědčování ukazuje, že předchozí setkání s oslabenou podobou útočného argumentu spolu s jeho vyvrácením zvyšuje schopnost odolat silnější verzi (McGuire 1964), a novější práce o takzvaném předběžném očkování proti dezinformacím dospívají k podobnému závěru u rozpoznávání manipulativních technik (van der Linden 2023). Kdo zná obecný tvar skoku mezi úrovněmi, pozná ho i v podobě, se kterou se dosud nesetkal.

U lidí, kteří byli dlouho vystaveni prostředí s obecnými hesly a vynucenými zobecněními, je součástí zotavení návrat ke konkrétnímu a ověřitelnému jazyku. Klinici popisují, že pomáhá přepisovat obecné soudy o sobě, převzaté od druhých, do konkrétních popisů událostí, které lze posoudit samostatně (Beck 1976). Takový přepis neslouží k tomu, aby člověk převzal novou „správnou“ hierarchii, ale k tomu, aby znovu sám rozhodoval, na jaké úrovni a v jakém rámci o své zkušenosti mluví. Příbuzné rozlišení obecného a konkrétního v metaprogramech popisuje stránka [Obecné a specifické](@/kompendium/nlp-vzorce/metaprogramy/obecne-a-specificke.md).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Bateson, G. (1972). *Steps to an Ecology of Mind*. San Francisco: Chandler.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Dilts, R. (1999). *Sleight of Mouth: The Magic of Conversational Belief Change*. Capitola: Meta Publications.
- Korzybski, A. (1933). *Science and Sanity: An Introduction to Non-Aristotelian Systems and General Semantics*. Lancaster: International Non-Aristotelian Library.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Miller, G. A. (1956). The magical number seven, plus or minus two: Some limits on our capacity for processing information. *Psychological Review*, 63(2), 81–97.
- Miller, G. A., Galanter, E., & Pribram, K. H. (1960). *Plans and the Structure of Behavior*. New York: Holt, Rinehart and Winston.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.
- Watzlawick, P., Weakland, J. H., & Fisch, R. (1974). *Change: Principles of Problem Formation and Problem Resolution*. New York: W. W. Norton.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.
- van der Linden, S. (2023). *Foolproof: Why Misinformation Infects Our Minds and How to Build Immunity*. London: 4th Estate.

## Související

**Rodina a hierarchie**

- [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Chunking](@/kompendium/nlp-vzorce/zakladni-pojmy/chunking.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem
- [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) – zvláštní případ tohoto vzorce
- [Chunking dolů](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-dolu.md) – zvláštní případ tohoto vzorce
- [Laterální chunking](@/kompendium/nlp-vzorce/jazykove-vzorce/lateralni-chunking.md) – zvláštní případ tohoto vzorce

**Příbuzné vzorce**

- [Logické úrovně](@/kompendium/nlp-vzorce/zakladni-pojmy/logicke-urovne-pojem.md) – příbuzný vzorec (Základní pojmy NLP, Logical levels (concept))
- [Chunking](@/kompendium/nlp-vzorce/zakladni-pojmy/chunking.md) – příbuzný vzorec (Základní pojmy NLP, Chunking)
- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – příbuzný vzorec (Meta-model, Meta Model)
- [Zobecnění](@/kompendium/nlp-vzorce/sleight-of-mouth/som-zobecneni.md) – příbuzný vzorec (Sleight of Mouth, Chunk up)
- [Obecné a specifické](@/kompendium/nlp-vzorce/metaprogramy/obecne-a-specificke.md) – příbuzný vzorec (Metaprogramy, General and specific)
- [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) – příbuzný vzorec (Jazykové vzorce, Chunking up)
- [Chunking dolů](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-dolu.md) – příbuzný vzorec (Jazykové vzorce, Chunking down)
- [Laterální chunking](@/kompendium/nlp-vzorce/jazykove-vzorce/lateralni-chunking.md) – příbuzný vzorec (Jazykové vzorce, Lateral chunking)

**V kompendiu**

- [EA-5.1.6 Kategorická transgrese](@/kompendium/techniques/ea-5-1-6-kategoricka-transgrese.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-5.4.2 Russellova violace typové hierarchie](@/kompendium/techniques/ea-5-4-2-russell-typ-violace.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [2.5 Filosofický rámec: epistemologie, fenomenologie, hermeneutika](@/kompendium/02-uvod/filosoficky-ramec.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
