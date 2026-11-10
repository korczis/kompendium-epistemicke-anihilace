+++
title = "Kotvení v NLP a efekt ukotvení"
description = "Dva různé jevy pod jedním slovem: kotvení stavů v NLP a efekt ukotvení číselného odhadu z výzkumu heuristik; proč je záměna zavádějící a jak ji rozpoznat."
weight = 19
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-kotveni", "nlp-pojem", "nlp-uziti-zadne"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Kotvení v NLP a efekt ukotvení", "NLP anchoring versus the anchoring heuristic", "heuristika ukotvení a přizpůsobení", "efekt kotvy", "Kotvení", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-09.19"
catalog_slug = "kotveni-versus-ukotveni-odhadu"
catalog_family = "kotveni"
catalog_family_code = "09"
catalog_family_title = "Kotvení"
catalog_family_en = "Anchoring"
catalog_part = "kotveni.b"
catalog_type = "concept"
catalog_type_cs = "pojem"
catalog_en = "NLP anchoring versus the anchoring heuristic"
catalog_aliases = ["heuristika ukotvení a přizpůsobení", "efekt kotvy"]
catalog_use = "zadne"
catalog_use_cs = "výkladový pojem"
catalog_risk = "nizke"
catalog_risk_cs = "nízké"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["kotva-pojem", "kontrastni-ramec", "kotveni", "nlp-v-prodeji", "neuro-zargon", "stav-dukazu-nlp", "jak-cist-tvrzeni-nlp"]
catalog_related_declared = ["kotveni", "kotva-pojem", "neuro-zargon", "jak-cist-tvrzeni-nlp", "stav-dukazu-nlp", "nlp-v-prodeji"]
catalog_kompendium = ["kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/techniques/ea-7-3-1-kahneman-system12.md", "kompendium/03-zakladni-kategorie/biasy/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/03-zakladni-kategorie/biasy/_index.md", "kompendium/nlp-vzorce/kotveni/kotveni.md", "kompendium/nlp-vzorce/kriticke-hodnoceni/jak-cist-tvrzeni-nlp.md", "kompendium/nlp-vzorce/vliv-a-zneuziti/neuro-zargon.md", "kompendium/techniques/ea-7-3-1-kahneman-system12.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md"]
catalog_prev = "kotveni-v-kontrolujicich-vztazich"
catalog_next = ""
catalog_position = 19
catalog_family_size = 19
catalog_sources = ["bandler-grinder-1979", "cialdini-2009", "druckman-swets-1988", "gilovich-1991", "kahneman-2011", "pavlov-1927", "roderique-davies-2009", "tversky-kahneman-1974", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1979"]
catalog_sources_roots = ["pavlov-1927"]
catalog_sources_critical = ["cialdini-2009", "druckman-swets-1988", "gilovich-1991", "kahneman-2011", "roderique-davies-2009", "tversky-kahneman-1974", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Proč na rozlišení záleží", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/kotveni.b.toml"
+++

# Kotvení v NLP a efekt ukotvení

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-09.19` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Kotvení](@/kompendium/nlp-vzorce/kotveni/_index.md) |
| **Druh** | pojem |
| **Anglicky** | NLP anchoring versus the anchoring heuristic |
| **Jiné názvy** | heuristika ukotvení a přizpůsobení, efekt kotvy |
| **Užití** | výkladový pojem |
| **Riziko zneužití** | nízké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Slovo „kotvení“ označuje v současné psychologické a populární literatuře dva odlišné jevy.
V neurolingvistickém programování je
[kotvení](@/kompendium/nlp-vzorce/kotveni/kotveni.md) spojování vnitřního stavu s podnětem,
například dotykem, gestem nebo slovem, tak, aby podnět později stav vybavil (Bandler a
Grinder 1979). Ve výzkumu úsudku a rozhodování označuje efekt ukotvení skutečnost, že
číselný odhad je ovlivněn hodnotou, kterou člověk zvažoval předtím, a to i tehdy, když je
tato hodnota zjevně náhodná nebo irelevantní (Tversky a Kahneman 1974). První jev patří do
oblasti podmiňování emočních stavů, druhý do oblasti kognitivních heuristik. Mají společnou
metaforu lodní kotvy, která něco drží na místě, ale liší se předmětem, mechanismem, metodou
zkoumání i stavem důkazů. Tato stránka je výkladovým pojmem katalogu. Jejím účelem je
pomoci čtenáři oba jevy rozlišit a rozpoznat situace, kdy se prestiž výzkumu heuristik
přenáší na techniky NLP, které ji nesdílejí.

## Původ a souvislosti

Kotvení v NLP navazuje na tradici podmiňování, kterou založil výzkum podmíněných reflexů
(Pavlov 1927). Bandler a Grinder ho v sedmdesátých letech představili jako praktickou
techniku pro terapii a komunikaci a tvrdili, že stavy lze spojit s podněty rychle a
spolehlivě (Bandler a Grinder 1979). Efekt ukotvení má jiný původ. Tversky a Kahneman ho
popsali v článku o úsudku za nejistoty jako jednu ze tří heuristik, vedle reprezentativnosti
a dostupnosti. Ukázali, že lidé, kteří nejprve viděli náhodně zvolené číslo, se při odhadu
neznámé veličiny od tohoto čísla odchylovali nedostatečně, a že výsledné odhady se proto
systematicky lišily podle výchozí hodnoty (Tversky a Kahneman 1974). Kahneman později shrnul
výzkum, podle něhož efekt ukotvení vzniká dvěma cestami: vědomým, ale nedostatečným
přizpůsobením od výchozí hodnoty a automatickou aktivací myšlenek, které jsou s výchozí
hodnotou slučitelné (Kahneman 2011). Kompendium se heuristikám věnuje u techniky
[Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) a
v přehledu [kognitivních biasů](@/kompendium/03-zakladni-kategorie/biasy/_index.md). Oba
pojmy vznikly přibližně ve stejném desetiletí, ale nezávisle na sobě a v odlišných
intelektuálních prostředích.

## Struktura vzorce

Strukturální rozdíl je možné shrnout ve čtyřech ohledech. Za prvé se liší předmět: NLP
kotví stavy, tedy emoce, nálady a tělesné prožitky, kdežto efekt ukotvení se týká úsudků,
zejména číselných odhadů, cen, pravděpodobností a hodnocení. Za druhé se liší mechanismus.
NLP předpokládá asociaci, která vzniká spojením podnětu se stavem a později se spouští
opakováním podnětu. Efekt ukotvení naproti tomu vzniká v okamžiku úsudku, kdy výchozí
hodnota slouží jako referenční bod a ovlivňuje, které informace si člověk vybaví (Kahneman
2011). Za třetí se liší časová struktura. Kotva v NLP má podle teorie fungovat dlouhodobě,
kdežto efekt ukotvení působí především v rámci jednoho rozhodnutí. Za čtvrté se liší způsob
zkoumání: efekt ukotvení byl zkoumán v kontrolovaných experimentech s náhodným přiřazením
podmínek, zatímco kotvení v NLP bylo popsáno převážně na základě výcvikových demonstrací
(Tversky a Kahneman 1974; Witkowski 2010). Přes tyto rozdíly se oba jevy mohou v praxi
potkat. Prodejce, který nejprve uvede vysokou cenu a pak nabídne „slevu“, využívá efekt
ukotvení, a pokud současně pracuje s náladou, gesty a tónem, může přidat i to, co by NLP
nazvalo kotvením stavu. Pro analýzu je užitečné obě vrstvy oddělit.

## Detekční znaky

Záměnu obou pojmů lze rozpoznat podle typických formulací. Kurz nebo kniha o NLP uvádí, že
kotvení je „vědecky prokázané“, a jako doklad zmiňuje Kahnemana, Tverského nebo Nobelovu
cenu za ekonomii, ale popisuje techniku dotykových nebo prostorových kotev. Text používá
příklady z výzkumu odhadů, například vliv první nabídky ve vyjednávání, a pak plynule
přechází k tvrzení, že lze stejně spolehlivě „ukotvit“ sebedůvěru nebo nákupní náladu.
Objevuje se odkaz na „neurovědu“ bez konkrétních studií, které by testovaly právě popisovanou
techniku. Tyto znaky odpovídají jevu, který katalog popisuje jako
[neurožargon](@/kompendium/nlp-vzorce/vliv-a-zneuziti/neuro-zargon.md): přejímání
terminologie a prestiže vědeckého oboru bez přejímání jeho metod. Roderique-Davies označil
tento rys NLP za kargokultovní psychologii, tedy napodobování vnějších forem vědy bez jejího
obsahu (Roderique-Davies 2009). Opačná záměna je méně častá, ale také se vyskytuje: efekt
ukotvení se popisuje jazykem NLP, jako by šlo o „kotvu“ nastavenou v mysli druhého, a tím se
zastírá, že jde o obecné zkreslení úsudku, kterému podléhá každý a proti kterému existují
jednoduché obranné postupy.

## Proč na rozlišení záleží

Rozlišení obou jevů není jen terminologickou jemností. Pro klinika znamená, že pacient,
který absolvoval kurz NLP a mluví o „kotvách“, může mít na mysli techniku, o níž se domnívá,
že je vědecky ověřená, protože slyšel o výzkumu heuristik. Pro vyšetřovatele a soudní znalce
znamená, že efekt ukotvení je skutečným rizikem v jejich vlastní práci, například když první
odhad škody, výše trestu nebo pravděpodobnosti viny ovlivní všechny následující úvahy, a že
tomuto riziku nelze čelit technikami NLP, ale postupy, které výzkum úsudku navrhuje. Pro
čtenáře reklamy a nabídek kurzů znamená, že odkaz na renomovaný výzkum je třeba vždy
přiřadit ke konkrétnímu tvrzení. Gilovich ukazuje, jak snadno lidé přijímají tvrzení, která
znějí věrohodně a odpovídají jejich očekávání, a jak málo ověřují, zda jsou podložena
důkazy o téže věci (Gilovich 1991).

## Legitimní a manipulativní užití

Oba pojmy mají legitimní užití, pokud se používají přesně. Znalost efektu ukotvení pomáhá
vyjednavačům, soudcům, lékařům i spotřebitelům uvědomit si, že první číslo na stole může
ovlivnit jejich úsudek, a připravit si vlastní odhad předem. Takové užití je obranné a
odpovídá tomu, jak o heuristikách mluví výzkum (Kahneman 2011). Pojem kotvy v NLP lze
legitimně používat jako popisný obraz asociativního učení, pokud se nezveličuje jeho
spolehlivost. Manipulativní užití se objevuje ve dvou podobách. První je rétorická: prestiž
výzkumu heuristik se přenáší na techniky NLP, aby se zvýšila důvěryhodnost kurzů, certifikací
a služeb. Druhá je praktická: efekt ukotvení se záměrně využívá v prodeji a vyjednávání,
například přemrštěnou výchozí cenou nebo vysokým „doporučeným“ požadavkem, a jazyk NLP
přitom slouží k tomu, aby technika vypadala jako odborná dovednost, a ne jako známé
zkreslení, kterého se lze vyvarovat. Cialdini popisuje příbuzný princip kontrastu, kdy
předchozí vysoká nabídka způsobí, že následná působí výhodněji (Cialdini 2009).

## Stav důkazů

Efekt ukotvení patří k nejlépe doloženým jevům výzkumu úsudku. Byl opakovaně prokázán v
laboratorních i terénních studiích a projevuje se i u odborníků, kteří s danou oblastí mají
zkušenosti (Tversky a Kahneman 1974; Kahneman 2011). Jeho síla se liší podle situace a
výzkum se dále zabývá tím, kdy je silnější a kdy slabší, ale jeho existence není vážně
zpochybňována. Kotvení v NLP takovou podporu nemá. Přehledy výzkumu NLP konstatují, že
většina empirických studií hlavní tvrzení oboru nepotvrzuje (Witkowski 2010), a komise
Národní rady pro výzkum USA nenašla pro účinnost NLP dostatečné důkazy (Druckman a Swets
1988). Asociativní učení jako takové je dobře doloženo (Pavlov 1927), ale tvrzení o rychlém
a spolehlivém kotvení komplexních stavů dotykem nebo gestem ověřeno nebylo. Rozdíl mezi
oběma pojmy je tedy i rozdílem ve stavu důkazů. Kdo cituje výzkum heuristik jako podporu
technik NLP, cituje důkazy o jiném jevu.

## Obrana a zotavení

Obrana proti záměně je jednoduchá a spočívá v přesné otázce: o jakém jevu je řeč a jaké
studie testovaly právě ten? Pokud někdo odkazuje na Kahnemana nebo Tverského, je legitimní
se zeptat, zda šlo o číselné odhady, nebo o emoční stavy, a zda existuje výzkum, který
testoval konkrétní nabízenou techniku. Katalog nabízí obecný návod ke čtení tvrzení NLP na
stránce [jak číst tvrzení NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/jak-cist-tvrzeni-nlp.md).
Obrana proti samotnému efektu ukotvení je dobře známá. Pomáhá připravit si vlastní odhad
dřív, než člověk uslyší cizí číslo, hledat nezávislé srovnávací údaje, záměrně zvažovat
důvody, proč by výchozí hodnota mohla být nepřiměřená, a odložit rozhodnutí, pokud byla
první nabídka zjevně extrémní. Kahneman doporučuje, aby se člověk v situaci, kdy čelí
přemrštěné výchozí hodnotě, vědomě zaměřil na argumenty proti ní a nenechal se jí vést
(Kahneman 2011). Kompendium souvislosti mezi rychlým, intuitivním myšlením a manipulací rozvádí
u techniky [Kahneman: Systém 1 a 2](@/kompendium/techniques/ea-7-3-1-kahneman-system12.md).
Pro odborníky a vzdělavatele plyne z této stránky požadavek terminologické péče: používat
slovo kotvení vždy s vyjasněním, o který jev jde, a nepřenášet důvěryhodnost jednoho na
druhý.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1979). *Frogs into Princes: Neuro Linguistic Programming*. Moab: Real People Press.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Pavlov, I. P. (1927). *Conditioned Reflexes: An Investigation of the Physiological Activity of the Cerebral Cortex*. London: Oxford University Press.
- Roderique-Davies, G. (2009). Neuro-linguistic programming: Cargo cult psychology? *Journal of Applied Research in Higher Education*, 1(2), 58–63.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Kotvení](@/kompendium/nlp-vzorce/kotveni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Kotva](@/kompendium/nlp-vzorce/zakladni-pojmy/kotva-pojem.md) – příbuzné heslo (Základní pojmy NLP, Anchor (concept))
- [Kontrastní rámec](@/kompendium/nlp-vzorce/reframing/kontrastni-ramec.md) – příbuzné heslo (Reframing a rámce, Contrast frame)
- [Kotvení](@/kompendium/nlp-vzorce/kotveni/kotveni.md) – příbuzné heslo (Kotvení, Anchoring)
- [NLP v prodeji](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-prodeji.md) – příbuzné heslo (Vliv a zneužití NLP, NLP in sales)
- [Neurožargon](@/kompendium/nlp-vzorce/vliv-a-zneuziti/neuro-zargon.md) – příbuzné heslo (Vliv a zneužití NLP, Neuro-jargon)
- [Stav důkazů o NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/stav-dukazu-nlp.md) – příbuzné heslo (Kritické hodnocení NLP, State of the evidence on NLP)
- [Jak číst tvrzení NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/jak-cist-tvrzeni-nlp.md) – příbuzné heslo (Kritické hodnocení NLP, How to read NLP claims)

**V kompendiu**

- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.1 Kahneman: Systém 1 a 2](@/kompendium/techniques/ea-7-3-1-kahneman-system12.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Kognitivní biasy](@/kompendium/03-zakladni-kategorie/biasy/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Kotvení v kontrolujících vztazích](@/kompendium/nlp-vzorce/kotveni/kotveni-v-kontrolujicich-vztazich.md) – předchozí heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
