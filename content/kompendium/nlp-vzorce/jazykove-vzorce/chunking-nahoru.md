+++
title = "Chunking nahoru"
description = "Přesun rozhovoru od konkrétního k obecným třídám, účelům a hodnotám: jak vytváří shodu, kde pomáhá hledat společný zájem a kde slouží k úniku od ověřitelných otázek."
weight = 2
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-jazykove-vzorce", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Chunking nahoru", "Chunking up", "zobecňování v rozhovoru", "přesun k obecnějšímu", "Jazykové vzorce", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-20.02"
catalog_slug = "chunking-nahoru"
catalog_family = "jazykove-vzorce"
catalog_family_code = "20"
catalog_family_title = "Jazykové vzorce"
catalog_family_en = "Language patterns"
catalog_part = "jazykove-vzorce"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Chunking up"
catalog_aliases = ["zobecňování v rozhovoru", "přesun k obecnějšímu"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "hierarchie-idei"
catalog_narrower = []
catalog_depth = 2
catalog_ancestors = ["hierarchie-idei", "chunking"]
catalog_related = ["chunking", "nominalizace", "milton-model", "umyslna-vagnost", "som-zobecneni", "obecne-a-specificke", "hierarchie-idei", "chunking-dolu", "lateralni-chunking", "slovni-baliky"]
catalog_related_declared = ["som-zobecneni", "umyslna-vagnost", "milton-model", "nominalizace", "slovni-baliky", "chunking-dolu"]
catalog_kompendium = ["kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/07-teoreticke-reflexe/politicka-ea.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/07-teoreticke-reflexe/politicka-ea.md", "kompendium/nlp-vzorce/jazykove-vzorce/chunking-dolu.md", "kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md", "kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md", "kompendium/nlp-vzorce/meta-model/nominalizace.md", "kompendium/nlp-vzorce/sleight-of-mouth/som-model-sveta.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md"]
catalog_prev = "hierarchie-idei"
catalog_next = "chunking-dolu"
catalog_position = 2
catalog_family_size = 20
catalog_sources = ["andreas-andreas-1994", "bandler-grinder-1975", "bandler-grinder-1975b", "bandler-grinder-1982", "dilts-1999", "heap-1988", "kahneman-2011", "korzybski-1933", "lifton-1961", "mcguire-1964", "miller-rollnick-2013", "oconnor-seymour-1990", "petty-cacioppo-1986", "witkowski-2010"]
catalog_sources_primary = ["andreas-andreas-1994", "bandler-grinder-1975", "bandler-grinder-1975b", "bandler-grinder-1982", "dilts-1999", "oconnor-seymour-1990"]
catalog_sources_roots = ["korzybski-1933"]
catalog_sources_critical = ["heap-1988", "kahneman-2011", "lifton-1961", "mcguire-1964", "miller-rollnick-2013", "petty-cacioppo-1986", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/jazykove-vzorce.toml"
+++

# Chunking nahoru

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-20.02` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Chunking up |
| **Jiné názvy** | zobecňování v rozhovoru, přesun k obecnějšímu |
| **Obecnější heslo** | [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Chunkingem nahoru se v neurolingvistickém programování označuje přesun řeči od konkrétního případu k obecnější úrovni: k třídě, do které případ patří, k účelu, kterému slouží, nebo k hodnotě, kterou má naplnit. Z „nového telefonu“ se stává „spojení s rodinou“, z „podpisu smlouvy“ „zajištění budoucnosti“, z „hádky o nádobí“ „otázka respektu“. Učebnicové podání NLP řadí tento pohyb vedle chunkingu dolů a do stran mezi základní způsoby pohybu po [hierarchii myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) a přisuzuje mu schopnost nacházet shodu tam, kde se lidé v detailech rozcházejí (O'Connor a Seymour 1990). Kompendium vzorec popisuje samostatně, protože právě pohyb nahoru je nejčastějším prostředkem, jak z rozhovoru zmizí ověřitelný obsah, aniž by si toho posluchač všiml. Obecný výrok se snadno přijímá, protože skoro nic nevylučuje, a kdo s ním souhlasí, může mít později potíž odmítnout to, co z něj druhá strana vyvodí.

## Původ a souvislosti

Pohyb k obecnějším úrovním popsal ve vztahu k jazyku už Korzybski, podle něhož každé pojmenování a každé zobecnění vzdaluje výrok od události a ztrácí její podrobnosti (Korzybski 1933). NLP si tento proces osvojilo dvojím způsobem. V meta-modelu je zobecňování jedním ze tří procesů, jimiž lidé ochuzují svůj [model světa](@/kompendium/nlp-vzorce/sleight-of-mouth/som-model-sveta.md), a cílem terapeuta je vést klienta zpět ke konkrétnímu (Bandler a Grinder 1975). V Milton-modelu je naopak obecnost a neurčitost žádoucí: hypnotický jazyk Miltona Ericksona podle Bandlera a Grindera pracuje s formulacemi tak obecnými, že si do nich posluchač doplní vlastní obsah a cítí se pochopen (Bandler a Grinder 1975b). Chunking nahoru se tak stal pojmenováním pro směr, kterým se ubírá Milton-model.

V pozdějších technikách NLP se tento pohyb používá k hledání „vyšších“ záměrů. Při přerámování se odděluje chování od záměru, který má naplnit, a hledají se jiné způsoby, jak záměru dosáhnout (Bandler a Grinder 1982). V Diltsově souboru konverzačních vzorců je zobecnění samostatným vzorcem, který přesouvá přesvědčení na širší úroveň a mění tím jeho význam (Dilts 1999). Technika takzvané základní transformace řetězí otázky po tom, čeho chce člověk dosáhnout tím, čeho chce dosáhnout, až k obecnému prožitku, který autorky označují jako jádrový stav (Andreas a Andreas 1994). Ve všech těchto podobách je pohyb nahoru zamýšlen jako cesta k motivaci a smyslu.

## Struktura vzorce

Chunking nahoru se v řeči ohlašuje třemi typy otázek a tvrzení. Otázka po účelu se ptá, k čemu věc slouží nebo co by člověku přinesla. Otázka po třídě se ptá, čeho je věc příkladem. Otázka po hodnotě se ptá, co je na věci důležité (O'Connor a Seymour 1990). Odpovědi stoupají k abstraktním podstatným jménům, jako jsou svoboda, bezpečí, úspěch, láska nebo respekt, která NLP označuje jako [nominalizace](@/kompendium/nlp-vzorce/meta-model/nominalizace.md): slovesné děje přeměněné v předměty, u nichž nelze určit, kdo co komu dělá (Bandler a Grinder 1975).

Účinek pohybu nahoru má tři složky. První je ztráta ověřitelnosti. Výrok „tahle investice je o svobodě“ nemá pravdivostní podmínky, podle kterých by se dal vyvrátit. Druhou složkou je zesílení souhlasu. Obecné hodnoty sdílí téměř každý, a kdo s nimi souhlasí, zažívá pocit shody s mluvčím. Třetí složkou je citové nabití. Čím výše se rozhovor dostane, tím více se dotýká identity a hodnot posluchače, a tím méně je ochoten pohyb zpochybnit, protože zpochybnění vypadá jako zpochybnění hodnoty samé. Model pravděpodobnosti zpracování přesvědčivého sdělení předpovídá, že sdělení zpracovávaná bez pečlivého zvažování argumentů působí spíše prostřednictvím okrajových vodítek, a obecné hodnotové výrazy jsou takovým vodítkem (Petty a Cacioppo 1986). Kahneman popisuje, jak rychlé a intuitivní myšlení vytváří soudržný příběh z toho, co má po ruce, a nepátrá po tom, co chybí (Kahneman 2011). Obecná formulace mu nabízí právě takový soudržný příběh bez rušivých detailů.

## Detekční znaky

Prvním znakem je odpověď o úroveň výše, než byla otázka. Na dotaz po ceně, termínu, odpovědnosti nebo důkazu přichází výrok o tom, o co „ve skutečnosti jde“. Druhým znakem je nahrazení konkrétních sloves abstraktními podstatnými jmény a hodnotovými slovy, která kompendium sleduje u [hodnotově nabitých slov](@/kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md). Třetím znakem je přerámování odmítnutí: kdo nesouhlasí s konkrétním krokem, je líčen jako ten, kdo odmítá hodnotu, například „nechcete přece, aby vaše rodina strádala“. Čtvrtým znakem je řetězení otázek po účelu, které posluchače vede k jeho nejcitlivějším hodnotám a pak se náhle vrací k jednomu konkrétnímu požadavku. Pátým znakem je ustálený slovník obecných hesel ve skupině, který Lifton popsal jako jazyk, jímž se ukončuje přemýšlení (Lifton 1961). Kompendium příbuzný mechanismus popisuje u [pasti epistemické vágnosti](@/kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md) a u [terminologické mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md). Užitečným pozorovatelským testem je otázka, zda by mluvčí mohl tutéž obecnou formulaci použít i k obhajobě opačného konkrétního kroku. Pokud ano, obecná formulace sama nic neobhajuje.

## Legitimní a manipulativní užití

Pohyb nahoru má v rozhovoru oprávněné místo. Mediátoři a vyjednavači běžně přecházejí od pozic stran k jejich zájmům, protože na úrovni zájmů je často prostor pro řešení, které na úrovni pozic chybí. V motivačních rozhovorech se pracuje s hodnotami klienta, aby si sám pojmenoval, proč je pro něj změna důležitá; autoři přístupu však zdůrazňují, že rozhodnutí zůstává na klientovi a že poradce nemá hodnoty klienta používat k prosazení vlastního cíle (Miller a Rollnick 2013). V terapii pomáhá rozlišení mezi chováním a záměrem, kterému chování slouží, najít přijatelnější cesty k témuž cíli (Bandler a Grinder 1982). Legitimní pohyb nahoru je ohlášený, vratný a po něm následuje otevřené zvažování konkrétních možností.

Manipulativní užití má opačné rysy. Pohyb je skrytý, slouží úniku od ověřitelné otázky nebo sbírání souhlasu, který se následně přenese na konkrétní požadavek, a návrat dolů vede jen k jedné možnosti, kterou zvolil mluvčí. Typický je v prodeji drahých kurzů a finančních produktů, v politické rétorice, která místo programů nabízí hodnoty, a v uzavřených skupinách, kde se každá konkrétní pochybnost převádí na otázku věrnosti ideálu (Lifton 1961). Kompendium se politickému rozměru věnuje v kapitole o [politické a ideologické epistemické anihilaci](@/kompendium/07-teoreticke-reflexe/politicka-ea.md).

## Stav důkazů

Že obecné a hodnotově nabité formulace snadno získávají souhlas a ztěžují kritické hodnocení, je v souladu s výzkumem přesvědčování i rozhodování (Petty a Cacioppo 1986; Kahneman 2011). Tento výzkum však vznikl nezávisle na NLP a nepotvrzuje specifická tvrzení oboru o „chunkingu“ jako o naučitelné dovednosti se zvláštním účinkem. Hypnotická účinnost neurčitých formulací, kterou NLP odvozuje z Ericksona, nebyla v kontrolovaných studiích NLP prokázána. Heap ve svém průběžném hodnocení oboru konstatoval, že jeho empiricky testovaná tvrzení se nepotvrdila a že obor stojí převážně na anekdotách z praxe (Heap 1988). Pozdější rozsáhlý přehled dospěl k závěru, že většina kontrolovaných studií NLP tvrzení oboru nepodporuje (Witkowski 2010). Pro chunking nahoru jako samostatný vzorec neexistuje žádná známá kontrolovaná studie. Rozumné je proto chápat jej jako výstižný popis obecně známého rétorického jevu, nikoli jako techniku s ověřenou silou.

## Obrana a zotavení

Nejúčinnější obranou je vrátit rozhovor na úroveň otázky. Kdo se ptal na částku, smí trvat na částce; kdo se ptal na důkaz, smí trvat na dokladu. Souhlas s hodnotou lze vyslovit a zároveň ho oddělit od konkrétního kroku: hodnotu sdílím, ale o prostředku ještě rozhodnu. Pomáhá také otázka, jaké jiné konkrétní kroky by téže hodnotě sloužily stejně dobře nebo lépe, protože obecná hodnota sama nikdy nevybírá mezi prostředky. Nominalizace lze vracet do podoby sloves (Bandler a Grinder 1975): kdo přesně co dělá, když se mluví o „svobodě“ nebo „respektu“? Taková zpětná konkretizace je obsahem stránky o [chunkingu dolů](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-dolu.md).

Výzkum očkování proti přesvědčování naznačuje, že kdo předem zná stavbu útoku a viděl jeho vyvrácení, odolává mu lépe (McGuire 1964). U lidí, kteří se ve skupině nebo ve vztahu dlouhodobě pohybovali v jazyce obecných hesel, bývá součástí zotavení znovuobjevení konkrétního slovníku. Pomáhá popisovat události slovesy a jmény osob, místy a časy, a tak znovu zpřístupnit to, co obecná hesla zakrývala. Teprve z konkrétních popisů je možné samostatně posoudit, zda hodnoty, ke kterým se člověk hlásil, s tím, co se dělo, vůbec souvisely.

## Literatura

- Andreas, C., & Andreas, T. (1994). *Core Transformation: Reaching the Wellspring Within*. Moab: Real People Press.
- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Bandler, R., & Grinder, J. (1982). *Reframing: Neuro-Linguistic Programming and the Transformation of Meaning*. Moab: Real People Press.
- Dilts, R. (1999). *Sleight of Mouth: The Magic of Conversational Belief Change*. Capitola: Meta Publications.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Korzybski, A. (1933). *Science and Sanity: An Introduction to Non-Aristotelian Systems and General Semantics*. Lancaster: International Non-Aristotelian Library.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Chunking](@/kompendium/nlp-vzorce/zakladni-pojmy/chunking.md) – příbuzné heslo (Základní pojmy NLP, Chunking)
- [Nominalizace](@/kompendium/nlp-vzorce/meta-model/nominalizace.md) – příbuzné heslo (Meta-model, Nominalisation)
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – příbuzné heslo (Milton-model, Milton Model)
- [Úmyslná vágnost](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md) – příbuzné heslo (Milton-model, Artful vagueness)
- [Zobecnění](@/kompendium/nlp-vzorce/sleight-of-mouth/som-zobecneni.md) – příbuzné heslo (Sleight of Mouth, Chunk up)
- [Obecné a specifické](@/kompendium/nlp-vzorce/metaprogramy/obecne-a-specificke.md) – příbuzné heslo (Metaprogramy, General and specific)
- [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) – příbuzné heslo (Jazykové vzorce, Hierarchy of ideas)
- [Chunking dolů](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-dolu.md) – příbuzné heslo (Jazykové vzorce, Chunking down)
- [Laterální chunking](@/kompendium/nlp-vzorce/jazykove-vzorce/lateralni-chunking.md) – příbuzné heslo (Jazykové vzorce, Lateral chunking)
- [Hodnotově nabitá slova](@/kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md) – příbuzné heslo (Jazykové vzorce, Loaded words)

**V kompendiu**

- [EA-5.4.24 Past epistemické vágnosti](@/kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.1.3 Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.8 Politická a ideologická EA — totalitní systémy, propaganda, populismus](@/kompendium/07-teoreticke-reflexe/politicka-ea.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) – předchozí heslo rodiny
- [Chunking dolů](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-dolu.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
