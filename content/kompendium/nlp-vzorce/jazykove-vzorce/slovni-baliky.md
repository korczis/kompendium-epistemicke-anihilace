+++
title = "Hodnotově nabitá slova"
description = "Slova, která spolu s pojmenováním dodávají hotové hodnocení: od rámování a skupinového žargonu po myšlenková klišé, jež ukončují úvahu. Mechanismus, znaky, důkazy, obrana."
weight = 19
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-jazykove-vzorce", "nlp-vzorec", "nlp-uziti-vliv"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Hodnotově nabitá slova", "Loaded words", "nabitý jazyk", "hodnotově zatížené výrazy", "Jazykové vzorce", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-20.19"
catalog_slug = "slovni-baliky"
catalog_family = "jazykove-vzorce"
catalog_family_code = "20"
catalog_family_title = "Jazykové vzorce"
catalog_family_en = "Language patterns"
catalog_part = "jazykove-vzorce.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Loaded words"
catalog_aliases = ["nabitý jazyk", "hodnotově zatížené výrazy"]
catalog_use = "vliv"
catalog_use_cs = "převážně vlivové"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["predikaty", "nominalizace", "umyslna-vagnost", "komentarova-adverbia", "vztazne-vety-presupozice", "presupozice-v-reklame", "som-redefinice", "auditivni-kotvy", "kriteria", "sladeni-hodnot", "chunking-nahoru", "protoze", "nlp-v-sektach", "nlp-v-politicke-reci"]
catalog_related_declared = ["nominalizace", "komentarova-adverbia", "presupozice-v-reklame", "nlp-v-politicke-reci", "nlp-v-sektach", "protoze"]
catalog_kompendium = ["kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md", "kompendium/07-teoreticke-reflexe/politicka-ea.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/techniques/ea-4-3-3-semantic-stability-disruption.md"]
catalog_canonical = ""
catalog_links_prose = ["glossary/propaganda.md", "kompendium/07-teoreticke-reflexe/politicka-ea.md", "kompendium/argumentacni-fauly/jazykove-klamy/nabity-jazyk.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/meta-model/nominalizace.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md"]
catalog_prev = "otazky-misto-tvrzeni"
catalog_next = "casove-presuny-v-jazyce"
catalog_position = 19
catalog_family_size = 20
catalog_sources = ["bandler-grinder-1975", "charvet-1997", "hassan-1988", "kahneman-2011", "lakoff-johnson-1980", "lifton-1961", "loftus-palmer-1974", "petty-cacioppo-1986", "rogers-1951", "singer-lalich-1995", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "charvet-1997"]
catalog_sources_roots = []
catalog_sources_critical = ["hassan-1988", "kahneman-2011", "lakoff-johnson-1980", "lifton-1961", "loftus-palmer-1974", "petty-cacioppo-1986", "rogers-1951", "singer-lalich-1995", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/jazykove-vzorce.b.toml"
+++

# Hodnotově nabitá slova

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-20.19` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Loaded words |
| **Jiné názvy** | nabitý jazyk, hodnotově zatížené výrazy |
| **Užití** | převážně vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Hodnotově nabitá slova (anglicky loaded words, v NLP a v příručkách vlivu též „slovní balíky“)
jsou výrazy, které vedle toho, co označují, nesou i hotové hodnocení. Výrazy „režim“ a
„vláda“, „reforma“ a „škrty“, „zásah“ a „útok“ mohou mířit na tutéž skutečnost, ale každý z
nich posluchači předem napovídá, jak ji má posoudit. Hodnocení přitom není vysloveno jako
tvrzení, o kterém by se dalo diskutovat; je zabaleno do pojmenování a posluchač ho přijímá
spolu s tím, jak se o věci mluví. NLP se k těmto slovům dostává z několika stran: přes
nominalizace, které z děje dělají abstraktní věc, přes takzvaná slova kritérií, tedy výrazy,
jimiž člověk vyjadřuje své hodnoty (Charvet 1997), a přes doporučení populárních vlivových
příruček používat slova, která mají v posluchači vyvolat žádoucí reakci. Kompendium vzorec řadí k vysoce
rizikovým, protože [nabitý jazyk](@/kompendium/argumentacni-fauly/jazykove-klamy/nabity-jazyk.md) je jedním z hlavních nástrojů, jimiž uzavřené skupiny,
[propaganda](@/glossary/propaganda.md) i kontrolující vztahy přetvářejí myšlení: kdo převezme slova, převezme i
hodnocení, a s ním hranice toho, co lze myslet (Lifton 1961).

## Původ a souvislosti

Nejvlivnější popis nabitého jazyka pochází od Roberta J. Liftona, který ve studii o
myšlenkové reformě v Číně označil „zatížení jazyka“ za jedno z kritérií totalitního
prostředí. Popsal, jak se složité lidské problémy stlačují do krátkých, rozhodně znějících
formulí, které Lifton nazval myšlenkovými klišé ukončujícími úvahu, a jak tento slovník
postupně zužuje to, co člověk dokáže vyjádřit (Lifton 1961). Kompendium tato kritéria rozebírá
u [Liftonových kritérií myšlenkové reformy](@/kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md).
Na Liftona navázala literatura o manipulativních skupinách, která popisuje, jak skupinový
žargon odděluje členy od okolí a jak se jím pochybnosti předem označují za chybu (Hassan
1988; Singer a Lalich 1995). Experimentální psychologie doplnila obraz z jiné strany. Tversky
a Kahneman ukázali, že stejná volba popsaná jako záchrana životů nebo jako jejich ztráta vede
k odlišným rozhodnutím, přestože jsou možnosti věcně shodné (Tversky a Kahneman 1981).
Loftusová a Palmer doložili, že intenzita slovesa v otázce na dopravní nehodu ovlivnila
odhad rychlosti i pozdější vzpomínku (Loftus a Palmer 1974). Kognitivní lingvistika pak
ukázala, že volba pojmů a metafor strukturuje to, jak o věci uvažujeme (Lakoff a Johnson
1980). V NLP se myšlenka objevuje hlavně v praktické podobě. [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) rozebírá
[nominalizace](@/kompendium/nlp-vzorce/meta-model/nominalizace.md), za nimiž se skrývá
nevyjasněný děj (Bandler a Grinder 1975), a literatura o metaprogramech doporučuje používat
v přesvědčovací řeči slova, kterými posluchač sám vyjadřuje své hodnoty (Charvet 1997).

## Struktura vzorce

Nabité slovo má dvě vrstvy: označení a hodnotící přídavek. Označení odkazuje na skutečnost,
hodnotící přídavek k ní připojuje postoj. Vzorec pracuje s tím, že druhou vrstvu posluchač
nezpracovává jako samostatné tvrzení. Strukturálně lze rozlišit čtyři podoby. První je
rámování dvojicí slov, kdy pro tutéž věc existuje kladný a záporný výraz a mluvčí volí ten,
který odpovídá jeho cíli; eufemismus věc změkčuje, dysfemismus ji zostřuje. Druhou podobou je
skupinový slovník, v němž se běžná slova nahrazují výrazy s vnitřním významem, například
„probuzený“, „nízká vibrace“ nebo „staré já“; tyto výrazy předem určují, kdo má pravdu.
Třetí podobou je myšlenkové klišé, krátká formule, která ukončuje rozhovor: „to je jen tvoje
ego“, „věř procesu“, „to je negativita“ (Lifton 1961). Čtvrtou podobou je přivlastnění
hodnotových slov posluchače: mluvčí zjistí, které výrazy jsou pro druhého důležité, například
„svoboda“, „bezpečí“ nebo „rodina“, a spojí je se svou nabídkou, takže nabídka zní jako
vyjádření posluchačových vlastních hodnot (Charvet 1997).

Mechanismus vysvětluje kombinace afektu a rámování. Slovo s výrazným citovým nábojem vyvolá
okamžitou hodnotící reakci, která předchází úvaze a usměrňuje ji. Kahneman popisuje, jak
rychlé, intuitivní myšlení přenáší citový dojem na úsudek o vlastnostech věci, aniž by si
toho člověk všiml (Kahneman 2011). Rámování pak určuje, s čím se věc srovnává: „ztráta“ se
srovnává s výchozím stavem jinak než „úspora“ (Tversky a Kahneman 1981). Ve skupinovém
slovníku se k tomu přidává sociální rozměr: kdo používá slova skupiny, patří k ní, a kdo je
odmítá, se vyděluje.

## Detekční znaky

Prvním detekčním znakem je existence neutrální alternativy, kterou mluvčí nepoužil. Pozorovatel
se může ptát, jak by tutéž věc popsal někdo, kdo k ní nemá vztah, a zda se zvolené slovo od
neutrálního popisu odchyluje. Druhým znakem je asymetrie pojmenování: vlastní strana „hájí“,
druhá „útočí“; vlastní lidé jsou „zásadoví“, cizí „zatvrzelí“. Třetím znakem je slovo, které
ukončuje rozhovor místo toho, aby ho posunulo: když na věcnou námitku přijde odpověď
nálepkou, jako „to je jen strach“ nebo „to je propaganda“, a nic dalšího, jde o myšlenkové
klišé. Čtvrtým znakem je skupinový žargon, který si nováček musí osvojit a jehož neznalost je
vykládána jako nezralost; kompendium podobné zatemňování smyslu popisuje u
[terminologické mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md).
Pátým znakem je náhlé užívání posluchačových vlastních hodnotových slov v ústech prodejce,
náboráře nebo politika, a to ve spojení s nabídkou, která s těmito hodnotami věcně nesouvisí.
U člověka, který je nabitému jazyku vystaven dlouhodobě, se objevuje zúžení slovníku: o
vlastních pochybnostech mluví slovy skupiny, a tím je sám odsuzuje, a obtížně hledá výrazy,
jimiž by mohl popsat zkušenost jinak (Singer a Lalich 1995).

## Legitimní a manipulativní užití

Žádný jazyk není zcela neutrální a hodnotící slova patří k běžné komunikaci. Legitimní je jejich
užití tam, kde je hodnocení otevřené, zdůvodněné a kde mluvčí připouští jiný popis. Lékař,
který mluví o „závažném“ nálezu, hodnotí, ale svůj soud opírá o údaje, které může pacientovi
ukázat. Novinářka, která vědomě volí co nejneutrálnější výraz, protože událost nemá doloženou,
pracuje s nabitými slovy obranně. V terapii je legitimní používat klientova vlastní slova, aby
se cítil pochopen, a to v souladu s tradicí reflektivního naslouchání (Rogers 1951). Rozdíl
proti manipulativnímu užití je v tom, komu slova slouží: v terapii vracejí klientovi jeho
vlastní význam, v manipulaci slouží zájmu mluvčího. Manipulativní užití nastává, když
nabité slovo nahrazuje argument, když se jím předem rozhoduje o sporné věci nebo když
skupinový slovník slouží k oddělení členů od okolí a k umlčení pochybností. Kompendium
rozebírá politickou podobu tohoto jevu v kapitole o
[politické a ideologické epistemické anihilaci](@/kompendium/07-teoreticke-reflexe/politicka-ea.md).

## Stav důkazů

Obecný účinek formulace na úsudek patří k dobře doloženým zjištěním. Efekt rámování byl
popsán v klasických experimentech a opakovaně potvrzen v dalších studiích (Tversky a Kahneman
1981). Vliv volby slova na odhad i na pozdější vzpomínku doložili Loftusová a Palmer (Loftus a
Palmer 1974). Liftonův popis zatížení jazyka je kvalitativní a vychází z rozhovorů s lidmi,
kteří prošli myšlenkovou reformou; jeho síla je v podrobnosti a v tom, že ho literatura o
manipulativních skupinách opakovaně uplatnila na další prostředí, nikoli v experimentálním
ověření (Lifton 1961). Velikost účinků nabitého jazyka se v různých situacích liší a závisí na
tom, jak silné předchozí postoje posluchač má a jak pozorně sdělení zpracovává (Petty a
Cacioppo 1986). Specifická tvrzení vlivové literatury a NLP o „slovech moci“, která mají
spolehlivě vyvolat určitou reakci, empirickou oporu nemají; přehledy výzkumu NLP konstatují,
že jazyková tvrzení oboru nebyla kontrolovaně testována (Witkowski 2010).

## Obrana a zotavení

Základní obranou je překlad. Posluchač může nabité slovo nahradit neutrálním popisem toho, co
se stalo nebo co se navrhuje, a teprve pak věc posoudit: „škrty“ nebo „reforma“ se mění v
„snížení výdajů o určitou částku na určitou oblast“. Druhou obranou je symetrie: použít pro
obě strany sporu stejná slova a sledovat, zda se tím změní dojem. Třetí obranou proti
myšlenkovému klišé je zeptat se, co přesně znamená: „Co konkrétně myslíš tím, že je to moje
ego?“ Klišé, které musí být vysvětleno, ztrácí svou ukončující sílu. Čtvrtou obranou je všímat
si, když mluvčí přebírá naše vlastní hodnotová slova, a ptát se, jak přesně nabídka danou
hodnotu naplňuje. Při zotavení z prostředí s vlastním slovníkem je jazyk jednou z hlavních
oblastí práce. Lidé po odchodu z uzavřených skupin popisují, že dlouho myslí ve slovech
skupiny a že jejich vlastní pochybnosti se jim vybavují v podobě, v jaké je skupina
odsuzovala (Hassan 1988). Pomáhá vědomě znovu pojmenovávat zkušenosti běžnými slovy, číst
texty mimo skupinový slovník a mluvit s lidmi, kteří slova skupiny neznají. Odborníci,
kteří s takovými klienty pracují, by měli skupinový žargon neopakovat a pomáhat klientovi
najít jeho vlastní výrazy.

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Charvet, S. R. (1997). *Words That Change Minds: Mastering the Language of Influence* (2. vyd.). Dubuque: Kendall/Hunt.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Lakoff, G., & Johnson, M. (1980). *Metaphors We Live By*. Chicago: University of Chicago Press.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Rogers, C. R. (1951). *Client-Centered Therapy*. Boston: Houghton Mifflin.
- Singer, M. T., & Lalich, J. (1995). *Cults in Our Midst*. San Francisco: Jossey-Bass.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Predikáty](@/kompendium/nlp-vzorce/zakladni-pojmy/predikaty.md) – příbuzné heslo (Základní pojmy NLP, Predicates)
- [Nominalizace](@/kompendium/nlp-vzorce/meta-model/nominalizace.md) – příbuzné heslo (Meta-model, Nominalisation)
- [Úmyslná vágnost](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md) – příbuzné heslo (Milton-model, Artful vagueness)
- [Komentářová příslovce a přídavná jména](@/kompendium/nlp-vzorce/presupozice/komentarova-adverbia.md) – příbuzné heslo (Jazykové presupozice, Commentary adverbs and adjectives)
- [Vztažné věty jako presupozice](@/kompendium/nlp-vzorce/presupozice/vztazne-vety-presupozice.md) – příbuzné heslo (Jazykové presupozice, Relative clauses)
- [Presupozice v reklamě](@/kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md) – příbuzné heslo (Jazykové presupozice, Presuppositions in advertising)
- [Redefinice](@/kompendium/nlp-vzorce/sleight-of-mouth/som-redefinice.md) – příbuzné heslo (Sleight of Mouth, Redefine)
- [Auditivní a tonální kotvy](@/kompendium/nlp-vzorce/kotveni/auditivni-kotvy.md) – příbuzné heslo (Kotvení, Auditory and tonal anchors)
- [Kritéria](@/kompendium/nlp-vzorce/metaprogramy/kriteria.md) – příbuzné heslo (Metaprogramy, Criteria)
- [Sladění hodnot](@/kompendium/nlp-vzorce/raport-a-kalibrace/sladeni-hodnot.md) – příbuzné heslo (Raport a kalibrace, Value matching)
- [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) – příbuzné heslo (Jazykové vzorce, Chunking up)
- [Slovo „protože“](@/kompendium/nlp-vzorce/jazykove-vzorce/protoze.md) – příbuzné heslo (Jazykové vzorce, Because)
- [NLP v sektách a kultovních skupinách](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-sektach.md) – příbuzné heslo (Vliv a zneužití NLP, NLP in cults)
- [NLP v politické řeči](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-politicke-reci.md) – příbuzné heslo (Vliv a zneužití NLP, NLP in political speech)

**V kompendiu**

- [EA-8.2.2 Liftonova kritéria myšlenkové reformy](@/kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.8 Politická a ideologická EA — totalitní systémy, propaganda, populismus](@/kompendium/07-teoreticke-reflexe/politicka-ea.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.1.3 Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-4.3.3 Semantic stability disruption](@/kompendium/techniques/ea-4-3-3-semantic-stability-disruption.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Otázky místo tvrzení](@/kompendium/nlp-vzorce/jazykove-vzorce/otazky-misto-tvrzeni.md) – předchozí heslo rodiny
- [Časové posuny v jazyce](@/kompendium/nlp-vzorce/jazykove-vzorce/casove-presuny-v-jazyce.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
