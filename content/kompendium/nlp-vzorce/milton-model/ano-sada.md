+++
title = "Řada souhlasů"
description = "Řada snadných souhlasů jako příprava sporného požadavku: jak vzorec funguje, co o něm říká výzkum závazku a konzistence a jak přerušit jeho setrvačnost."
weight = 8
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-milton-model", "nlp-vzorec", "nlp-uziti-vliv"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Řada souhlasů", "Yes set", "ano-sada", "souhlasná řada", "Milton-model", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-04.08"
catalog_slug = "ano-sada"
catalog_family = "milton-model"
catalog_family_code = "04"
catalog_family_title = "Milton-model"
catalog_family_en = "Milton Model"
catalog_part = "milton-model"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Yes set"
catalog_aliases = ["ano-sada", "souhlasná řada"]
catalog_use = "vliv"
catalog_use_cs = "převážně vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "milton-model"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["milton-model"]
catalog_related = ["pripojene-otazky", "truismy", "univerzalni-kvantifikatory-milton", "pacing-aktualni-zkusenosti", "retezeni-sugesci", "slozena-sugesce", "retezeni-presvedceni", "rezim-presvedceni", "pacing-a-leading", "zpetne-shrnuti", "predpokladovy-zaver", "alternativni-zaver"]
catalog_related_declared = ["truismy", "pripojene-otazky", "pacing-a-leading", "retezeni-sugesci", "predpokladovy-zaver"]
catalog_kompendium = ["kompendium/techniques/ea-2-2-5-recommendation-coercion.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/03-zakladni-kategorie/biasy/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/03-zakladni-kategorie/biasy/_index.md", "kompendium/nlp-vzorce/milton-model/pripojene-otazky.md", "kompendium/nlp-vzorce/milton-model/truismy.md", "kompendium/techniques/ea-2-2-5-recommendation-coercion.md"]
catalog_prev = "truismy"
catalog_next = "citace"
catalog_position = 8
catalog_family_size = 30
catalog_sources = ["bandler-grinder-1975b", "cialdini-2009", "druckman-swets-1988", "erickson-rossi-1979", "erickson-rossi-rossi-1976", "freedman-fraser-1966", "grinder-bandler-1981", "hassan-1988", "mcguire-1964", "miller-rollnick-2013", "sharpley-1987", "singer-lalich-1995", "tversky-kahneman-1974", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975b", "grinder-bandler-1981"]
catalog_sources_roots = ["erickson-rossi-1979", "erickson-rossi-rossi-1976"]
catalog_sources_critical = ["cialdini-2009", "druckman-swets-1988", "freedman-fraser-1966", "hassan-1988", "mcguire-1964", "miller-rollnick-2013", "sharpley-1987", "singer-lalich-1995", "tversky-kahneman-1974", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/milton-model.toml"
+++

# Řada souhlasů

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-04.08` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Yes set |
| **Jiné názvy** | ano-sada, souhlasná řada |
| **Obecnější heslo** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) |
| **Užití** | převážně vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Řada souhlasů, v anglické literatuře „yes set“, je vzorec, ve kterém mluvčí posluchači
předloží několik výroků nebo otázek, na které posluchač nemůže odpovědět jinak než souhlasem,
a teprve potom přidá výrok nebo požadavek, o který mu jde. Předpokládá se, že série souhlasů
vytvoří setrvačnost, takže posluchač přijme i poslední, sporný prvek, aniž by ho zvážil s
toutéž pečlivostí, s jakou by ho zvažoval samostatně. Erickson popisoval souhlasnou řadu jako
způsob, jak u klienta vytvořit naladění na přijímání sugescí (Erickson, Rossi a Rossi 1976),
a NLP ji převzalo do Milton-modelu, kde ji skládá zejména z
[truismů](@/kompendium/nlp-vzorce/milton-model/truismy.md) a z
[připojených otázek](@/kompendium/nlp-vzorce/milton-model/pripojene-otazky.md) (Bandler a
Grinder 1975b). V prodejní literatuře a v kurzech vyjednávání patří řada souhlasů k
nejznámějším technikám. Pro kompendium je podstatné, že vzorec staví na dobře doložené
tendenci lidí jednat konzistentně, ale přeceňuje sílu, s jakou samotné odpovídání „ano“
mění rozhodnutí.

## Původ a souvislosti

Ericksonova tradice chápala souhlasnou řadu jako součást postupného budování vztahu a
naladění, ve kterém klient přestává klást odpor a začíná sledovat vlastní zkušenost. Taková
řada se v jeho práci skládala z výroků o tom, co klient právě prožíval, například že sedí,
slyší hlas terapeuta a dýchá, a přecházela k výrokům o tom, co by mohl prožívat (Erickson,
Rossi a Rossi 1976; Erickson a Rossi 1979). V NLP se tato posloupnost označuje jako pacing a
leading a řada souhlasů je její jazykovou podobou (Grinder a Bandler 1981). Myšlenka má
starší kořeny. Sokratovská metoda vede partnera přes řadu přitakání k závěru, který by
zpočátku odmítl, a rétorické příručky od antiky popisují, jak získat souhlas publika s
nespornými premisami, než řečník přejde k tezi. Sociální psychologie popsala příbuzný, ale
odlišný jev: technika „noha ve dveřích“ ukázala, že lidé, kteří vyhoví drobné žádosti,
ochotněji vyhoví i větší žádosti později (Freedman a Fraser 1966). Rozdíl je podstatný.
Technika nohy ve dveřích pracuje s vykonaným činem a se změnou sebeobrazu, řada souhlasů
s pouhým slovním přitakáním.

## Struktura vzorce

Struktura řady souhlasů má tři části. První tvoří výroky, které jsou pro posluchače
nesporné: popis situace, ve které se nachází, obecně pravdivé výroky nebo hodnoty, se
kterými souhlasí každý. Druhou tvoří přechod, ve kterém se výroky postupně posouvají od
nesporného ke spornějšímu, často tak, že poslední nesporný výrok už obsahuje část závěru.
Třetí tvoří cílový výrok nebo požadavek, který se gramaticky i rytmicky napojuje na
předchozí řadu, jako by z ní plynul. Typickým spojením je „a“, „takže“ nebo „a proto“,
přičemž logická souvislost mezi řadou a cílovým výrokem obvykle chybí. Z hodnoty, že
člověku záleží na bezpečí rodiny, neplyne, že má podepsat konkrétní smlouvu.

Psychologicky vzorec spoléhá na tři mechanismy. Prvním je potřeba konzistence: kdo opakovaně
souhlasil, cítí určitý tlak zůstat v souladu s předchozími odpověďmi a nesouhlas prožívá
jako zvrat (Cialdini 2009). Druhým je citlivost úsudku na výchozí bod. Výzkum heuristik ji
popsal jako ukotvení u číselných odhadů (Tversky a Kahneman 1974); řadu souhlasů lze chápat
jako jeho volnou obdobu, ve které se další výrok posuzuje z výchozího bodu předchozích
přitakání, zvlášť když posluchač nemá vlastní pevné stanovisko. Třetím je sociální náklad nesouhlasu. Kdo po řadě přitakání najednou řekne „ne“,
naruší rytmus rozhovoru a vztah, který se v něm vytvořil. Žádný z těchto mechanismů není
specifický pro NLP; řada souhlasů je spíše jejich soustavným a záměrným uspořádáním.

## Detekční znaky

Řadu souhlasů poznáme podle nápadného hromadění výroků, se kterými nelze nesouhlasit, v
úvodu rozhovoru nebo těsně před rozhodnutím. Mluvčí klade otázky, na které zná odpověď, a
čeká na přitakání, nebo opatřuje nesporná tvrzení dovětky. Druhým znakem je rytmus:
souhlasy přicházejí v rychlém sledu, takže posluchač odpovídá automaticky. Třetím znakem je
logická mezera mezi řadou a závěrem, který na ni navazuje. Čtvrtým znakem je obsah prvních
výroků: často se dotýkají hodnot, které posluchač nemůže popřít, aniž by vypadal jako špatný
rodič, partner nebo člen skupiny, například bezpečí, zdraví, lásky nebo odpovědnosti. Pátým
znakem je reakce na nesouhlas: mluvčí, který vzorec užívá záměrně, se po nesouhlasu vrací
k nesporným výrokům a buduje řadu znovu. Kompendium popisuje obdobnou dynamiku u
[nátlaku doporučením](@/kompendium/techniques/ea-2-2-5-recommendation-coercion.md), kde
souhlas s obecnou radou má zavazovat ke konkrétnímu kroku, a v přehledu
[kognitivních biasů](@/kompendium/03-zakladni-kategorie/biasy/_index.md), na kterých podobné
vzorce stojí. Pozorovatel může řadu rozložit tak, že si zapíše jednotlivé výroky a k cílovému
výroku připíše otázku, z kterého z nich plyne. Užitečné je také sledovat časování: řada
souhlasů se objevuje typicky těsně před podpisem, platbou nebo slibem a bývá spojena s
tlakem na okamžité rozhodnutí, který literatura o vlivu popisuje jako zdůrazňování
nedostatku a jedinečné příležitosti (Cialdini 2009).

## Legitimní a manipulativní užití

Shrnutí společného základu je v mnoha profesích legitimní a užitečné. Lékař, který s
pacientem nejprve shrne, co oba vědí o jeho obtížích a co si pacient přeje, a teprve pak
probírá možnosti léčby včetně možnosti nic nepodnikat, používá souhlasy k ověření porozumění,
ne k vynucení volby. Mediátor, který stranám sporu ukáže, v čem se shodují, otevírá prostor
pro jednání. Motivační rozhovor pracuje se shrnutími, která klientovi vracejí jeho vlastní
slova, a výslovně se vyhýbá tomu, aby z nich vyvozoval závěr za klienta (Miller a Rollnick
2013). Kritériem legitimity je, že souhlas s fakty nebo hodnotami nevede k předem danému
závěru a že posluchač může cílový výrok bez sociálních nákladů odmítnout.

Manipulativní užití naopak z řady souhlasů dělá past. Souhlas s hodnotami se přenáší na
souhlas s konkrétním produktem, závazkem nebo příslušností, a nesouhlas s posledním
prvkem se vykládá jako nekonzistence nebo zrada vlastních hodnot. V náboru do skupin se
souhlasné řady užívají k tomu, aby člověk postupně přitakal výkladu světa, který skupina
nabízí, a na konci přijal i závazky, které by na začátku odmítl. Singer a Lalich popisují,
že nábor do destruktivních skupin postupuje drobnými kroky, z nichž žádný se nezdá
rozhodující, a že právě tato postupnost ztěžuje rozpoznat, kam vede (Singer a Lalich 1995).

## Stav důkazů

Pro specifické tvrzení, že slovní řada souhlasů zvyšuje přijetí následné sugesce nebo
požadavku, je empirická základna slabá a NLP k ní nepřidalo kontrolované studie. Přehledy
výzkumu NLP konstatují obecný nedostatek dokladů pro jeho jazykové vzorce (Sharpley 1987;
Witkowski 2010), a zpráva Národní rady pro výzkum USA nenašla doklady pro tvrzení NLP o
vlivu (Druckman a Swets 1988). Dobře doložen je naopak příbuzný jev postupného závazku:
lidé, kteří vyhověli malé žádosti, vyhoví větší žádosti častěji než lidé, kteří první žádost
nedostali (Freedman a Fraser 1966). Literatura o vlivu tento jev vysvětluje potřebou
konzistence a změnou sebeobrazu (Cialdini 2009). Řada souhlasů s nimi sdílí logiku, ale ne
mechanismus: slovní přitakání nesporným výrokům je slabší závazek než vykonaný čin. Rozumný
závěr tedy zní, že řada souhlasů může vytvářet setrvačnost v rozhovoru a zvyšovat sociální
náklad nesouhlasu, ale nemá prokázanou sílu měnit rozhodnutí posluchače, který si
nesouladu mezi řadou a závěrem všimne.

## Obrana a zotavení

Nejúčinnější obranou je přerušit setrvačnost. Kdo si všimne, že odpovídá „ano“ na řadu
nesporných výroků, může zpomalit, cílový výrok oddělit a posoudit ho samostatně. Souhlas s
tím, že člověku záleží na bezpečí rodiny, nezavazuje k žádné smlouvě, a je legitimní to
nahlas říct. Druhou obranou je odložit rozhodnutí: setrvačnost souhlasů trvá jen po dobu
rozhovoru, a rozhodnutí udělané později, s písemnými podklady a po srovnání alternativ, jí
není vystaveno. Třetí obranou je znalost vzorce, protože pojmenovaná technika ztrácí část
účinku a posluchač ji pak rozpozná i v nových podobách (McGuire 1964). Ve vztazích nebo
skupinách, kde se nesouhlas s posledním prvkem řady soustavně vykládá jako zrada hodnot, je
třeba pojmenovat, že hodnota a konkrétní požadavek jsou dvě různé věci. Pro lidi, kteří
takovou dynamikou prošli, je součástí zotavení rozplétání závazků, které přijali v řadě
drobných přitakání, a uznání, že jejich souhlas byl vytvářen strukturou rozhovoru, ne jen
jejich vlastní slabostí (Hassan 1988).

## Literatura

- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Erickson, M. H., & Rossi, E. L. (1979). *Hypnotherapy: An Exploratory Casebook*. New York: Irvington.
- Erickson, M. H., Rossi, E. L., & Rossi, S. I. (1976). *Hypnotic Realities: The Induction of Clinical Hypnosis and Forms of Indirect Suggestion*. New York: Irvington.
- Freedman, J. L., & Fraser, S. C. (1966). Compliance without pressure: The foot-in-the-door technique. *Journal of Personality and Social Psychology*, 4(2), 195–202.
- Grinder, J., & Bandler, R. (1981). *Trance-formations: Neuro-Linguistic Programming and the Structure of Hypnosis*. Moab: Real People Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Singer, M. T., & Lalich, J. (1995). *Cults in Our Midst*. San Francisco: Jossey-Bass.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Připojené otázky](@/kompendium/nlp-vzorce/milton-model/pripojene-otazky.md) – příbuzné heslo (Milton-model, Tag questions)
- [Truismy](@/kompendium/nlp-vzorce/milton-model/truismy.md) – příbuzné heslo (Milton-model, Truisms)
- [Univerzální kvantifikátory v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/univerzalni-kvantifikatory-milton.md) – příbuzné heslo (Milton-model, Universal quantifiers (Milton Model))
- [Pacing aktuální zkušenosti](@/kompendium/nlp-vzorce/milton-model/pacing-aktualni-zkusenosti.md) – příbuzné heslo (Milton-model, Pacing current experience)
- [Řetězení sugescí](@/kompendium/nlp-vzorce/milton-model/retezeni-sugesci.md) – příbuzné heslo (Milton-model, Linking suggestions)
- [Složená sugesce](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/slozena-sugesce.md) – příbuzné heslo (Ericksonovská hypnóza, Compound suggestion)
- [Řetězení přesvědčení](@/kompendium/nlp-vzorce/presvedceni/retezeni-presvedceni.md) – příbuzné heslo (Přesvědčení, Belief chaining)
- [Režim přesvědčení](@/kompendium/nlp-vzorce/metaprogramy/rezim-presvedceni.md) – příbuzné heslo (Metaprogramy, Convincer mode)
- [Pacing a leading](@/kompendium/nlp-vzorce/raport-a-kalibrace/pacing-a-leading.md) – příbuzné heslo (Raport a kalibrace, Pacing and leading)
- [Zpětné shrnutí](@/kompendium/nlp-vzorce/raport-a-kalibrace/zpetne-shrnuti.md) – příbuzné heslo (Raport a kalibrace, Backtracking)
- [Předpokládané uzavření](@/kompendium/nlp-vzorce/vliv-a-zneuziti/predpokladovy-zaver.md) – příbuzné heslo (Vliv a zneužití NLP, Assumptive close)
- [Alternativní uzavření](@/kompendium/nlp-vzorce/vliv-a-zneuziti/alternativni-zaver.md) – příbuzné heslo (Vliv a zneužití NLP, Alternative close)

**V kompendiu**

- [EA-2.2.5 Nátlak doporučením](@/kompendium/techniques/ea-2-2-5-recommendation-coercion.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Kognitivní biasy](@/kompendium/03-zakladni-kategorie/biasy/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Truismy](@/kompendium/nlp-vzorce/milton-model/truismy.md) – předchozí heslo rodiny
- [Citace](@/kompendium/nlp-vzorce/milton-model/citace.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
