+++
title = "Laterální chunking"
description = "Přesun rozhovoru k jinému případu téže třídy, tedy k analogii, příkladu nebo srovnání: kdy osvětluje zkušenost a kdy rozpouští konkrétní odpovědnost ve falešné ekvivalenci."
weight = 4
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-jazykove-vzorce", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Laterální chunking", "Lateral chunking", "chunking do stran", "přesun k jinému případu téže třídy", "Jazykové vzorce", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-20.04"
catalog_slug = "lateralni-chunking"
catalog_family = "jazykove-vzorce"
catalog_family_code = "20"
catalog_family_title = "Jazykové vzorce"
catalog_family_en = "Language patterns"
catalog_part = "jazykove-vzorce"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Lateral chunking"
catalog_aliases = ["chunking do stran", "přesun k jinému případu téže třídy"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "hierarchie-idei"
catalog_narrower = []
catalog_depth = 2
catalog_ancestors = ["hierarchie-idei", "chunking"]
catalog_related = ["chunking", "som-analogie", "hierarchie-idei", "chunking-nahoru", "terapeuticka-metafora", "izomorfni-metafora"]
catalog_related_declared = ["som-analogie", "terapeuticka-metafora", "izomorfni-metafora", "chunking-nahoru"]
catalog_kompendium = ["kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md", "kompendium/techniques/ea-1-3-3-tematicka-diverze.md", "kompendium/techniques/ea-2-5-5-bothsidesizm-internalizace.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md", "kompendium/nlp-vzorce/jazykove-vzorce/izomorfni-metafora.md", "kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md", "kompendium/techniques/ea-1-3-3-tematicka-diverze.md", "kompendium/techniques/ea-2-5-5-bothsidesizm-internalizace.md"]
catalog_prev = "chunking-dolu"
catalog_next = "kategorie-satirove"
catalog_position = 4
catalog_family_size = 20
catalog_sources = ["bateson-1972", "dilts-1999", "gilovich-1991", "gordon-1978", "haley-1973", "herman-1992", "lakoff-johnson-1980", "oconnor-seymour-1990", "passmore-rowson-2019", "rosen-1982", "tosey-mathison-2009", "tversky-kahneman-1974", "witkowski-2010"]
catalog_sources_primary = ["dilts-1999", "gordon-1978", "oconnor-seymour-1990"]
catalog_sources_roots = ["bateson-1972", "haley-1973", "rosen-1982"]
catalog_sources_critical = ["gilovich-1991", "herman-1992", "lakoff-johnson-1980", "passmore-rowson-2019", "tosey-mathison-2009", "tversky-kahneman-1974", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/jazykove-vzorce.toml"
+++

# Laterální chunking

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-20.04` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Lateral chunking |
| **Jiné názvy** | chunking do stran, přesun k jinému případu téže třídy |
| **Obecnější heslo** | [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Laterálním chunkingem, také chunkingem do stran, se v neurolingvistickém programování rozumí přesun řeči od jednoho případu k jinému případu, který s ním sdílí nějakou společnou třídu. Rozhovor o škole přejde k rozhovoru o sportovním tréninku, protože obojí je „učení“; rozhovor o sporu ve firmě přejde k rodinné hádce, protože obojí je „konflikt“. V terminologii [hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) jde o pohyb o úroveň výš ke společné třídě a hned zase o úroveň níž k jinému členu této třídy (O'Connor a Seymour 1990). Výsledkem je analogie, přirovnání, příklad nebo metafora. NLP laterálnímu chunkingu přisuzuje schopnost otevírat nové pohledy, protože jiný případ ukáže stránku věci, která v původním případu nebyla vidět. Kompendium jej zařazuje proto, že tentýž pohyb je základem mnoha úhybných a relativizujících tahů: odpovědnost za konkrétní čin se rozpustí ve srovnání s jinými případy, které s ním sdílejí jen velmi obecnou vlastnost.

## Původ a souvislosti

Práce s analogií a metaforou má v NLP dva kořeny. Prvním je Milton Erickson, který podle svých žáků a vykladačů často místo přímé rady vyprávěl příběh o jiné situaci, v níž se klient mohl poznat (Rosen 1982; Haley 1973). Druhým je teorie komunikace Gregoryho Batesona, pro kterého byla metafora a vztah podobnosti mezi různými oblastmi základní formou myšlení i komunikace (Bateson 1972). V NLP rozpracoval práci s metaforou David Gordon, který popsal terapeutickou metaforu jako příběh, jehož postavy a vztahy strukturně odpovídají klientově situaci, i když se odehrává ve zcela jiném prostředí (Gordon 1978). Tento strukturní vztah NLP nazývá izomorfismem a kompendium se mu věnuje na stránce o [izomorfní metafoře](@/kompendium/nlp-vzorce/jazykove-vzorce/izomorfni-metafora.md). Dilts zařadil analogii mezi konverzační vzorce, kterými se přesvědčení přerámovává tím, že se postaví vedle jiného případu se stejnou strukturou (Dilts 1999).

Mimo NLP se metaforám věnuje kognitivní lingvistika. Lakoff a Johnson ukázali, že běžné pojmy jsou strukturovány metaforami, které určité stránky zkušenosti zvýrazňují a jiné skrývají; mluvit o sporu jako o válce vede k jinému chování než mluvit o něm jako o společném hledání (Lakoff a Johnson 1980). Tento poznatek je pro defenzivní čtení laterálního chunkingu klíčový: volba srovnávaného případu není neutrální.

## Struktura vzorce

Laterální chunking má tři strukturní prvky. Prvním je výchozí případ, o kterém se mluví. Druhým je společná třída, přes kterou se přechází; ta často zůstává nevyslovená. Třetím je cílový případ, ke kterému rozhovor dorazí. Účinek pohybu závisí na tom, jak vysoko leží společná třída. Je-li nízko, srovnávané případy jsou si blízké a srovnání nese skutečnou informaci: dvě operace téhož typu, dvě smlouvy s podobnými podmínkami. Je-li vysoko, případy spolu sdílejí jen velmi obecnou vlastnost a srovnání neříká skoro nic, i když může působit přesvědčivě.

Přesvědčivost analogie souvisí s tím, že lidé posuzují pravděpodobnost a příslušnost k třídě podle podobnosti. Tversky a Kahneman popsali heuristiku reprezentativnosti, při níž se úsudek opírá o to, jak moc se jedna věc podobá jiné, a přehlíží se přitom základní četnosti a jiné podstatné údaje (Tversky a Kahneman 1974). Gilovich ukázal, jak snadno lidé spatřují souvislosti a vzorce tam, kde jsou jen náhodné shody (Gilovich 1991). Analogie, která zvýrazní nápadnou podobnost a zamlčí podstatné rozdíly, tak využívá běžný a jinak užitečný způsob usuzování.

## Detekční znaky

Prvním znakem je náhlé srovnání, které místo odpovědi na otázku přinese jiný případ: „a co oni?“, „to přece dělá každý“, „vy byste se zachovali stejně“. Takový tah se v rétorice nazývá odkazem na pokrytectví druhého a kompendium jej sleduje u [falešné ekvivalence](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md). Druhým znakem je nevyslovená společná třída, která je tak široká, že by do ní šlo zařadit cokoli. Kdo srovnává zatajení finanční ztráty s tím, že člověk doma neřekne všechno, přechází přes třídu „něco neříci“, do které patří lež i diskrétnost. Třetím znakem je přesun k jinému tématu, které s původním sdílí jen slovo nebo náladu, což odpovídá [tematické diverzi](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md). Čtvrtým znakem je řetěz analogií, z nichž každá se trochu vzdálí, až se rozhovor ocitne v oblasti, kde mluvčí má převahu. Pátým znakem je metafora, která do situace vnáší hodnocení, aniž by ho vyslovila, například když se kritika označuje jako „útok“ nebo pochybnost jako „nemoc“. Takové metafory podle Lakoffa a Johnsona neusměrňují jen řeč, ale i jednání, protože kdo spor chápe jako válku, hledá vítěze, a ne řešení (Lakoff a Johnson 1980).

## Legitimní a manipulativní užití

Laterální chunking je přirozenou součástí výuky, tvořivého myšlení i terapie. Učitel, který vysvětluje elektrický proud na proudění vody, nabízí model, který žákovi pomůže, a zároveň ví, kde analogie přestává platit. V terapii může příběh o jiném člověku v podobné situaci pomoci klientovi pohlédnout na vlastní obtíž z odstupu; Gordon zdůrazňuje, že metafora má klientovi nabídnout nové možnosti, ne mu vnutit závěr (Gordon 1978). Při řešení problémů pomáhá přenesení řešení z jiné oblasti najít možnosti, které by v původní oblasti nikoho nenapadly. Legitimní analogie je otevřeně podaná jako přirovnání, nechává prostor pro otázku, v čem se případy liší, a nepoužívá se jako důkaz.

Manipulativní užití se pozná podle toho, že analogie nahrazuje argument nebo odpovědnost. Srovnání s jinými případy slouží k tomu, aby konkrétní čin přestal vypadat výjimečně, a tím i k vyvinění mluvčího. Srovnání může také sloužit k vnucení falešné vyváženosti, kdy se nesouměřitelné postoje líčí jako dvě stejně oprávněné strany sporu; kompendium tento dlouhodobý účinek popisuje jako [internalizaci falešné vyváženosti](@/kompendium/techniques/ea-2-5-5-bothsidesizm-internalizace.md). Metafora pak může do rozhovoru vnést hodnotící rámec, který se jako metafora nerozpozná, a tím se vyhne kritice (Lakoff a Johnson 1980).

## Stav důkazů

Výzkum metafory a analogického usuzování je rozsáhlý a dobře doložený, ale vznikl mimo NLP a týká se obecných kognitivních procesů (Lakoff a Johnson 1980; Tversky a Kahneman 1974). Pro tvrzení NLP, že laterální chunking je zvláštní dovednost s ověřitelnými účinky ve vyjednávání, prodeji nebo terapii, kontrolovaný výzkum chybí. Terapeutická metafora, která na laterálním pohybu stojí, je v NLP doložena především popisy případů a ukázkami z praxe, ne srovnávacími studiemi. Witkowski ve svém přehledu výzkumu NLP konstatuje, že kontrolované studie tvrzení oboru převážně nepodporují (Witkowski 2010), a Tosey a Mathison upozorňují, že NLP přebírá a přejmenovává myšlenky z jiných oborů, aniž by k nim přidalo vlastní empirické ověření (Tosey a Mathison 2009). Kritický přehled pro oblast koučinku dospěl k podobnému závěru (Passmore a Rowson 2019). Pro čtenáře plyne rozlišení: že analogie mohou silně působit, je známo; že by NLP mělo zvláštní metodu, jak s nimi pracovat účinněji než jiné tradice, doloženo není.

## Obrana a zotavení

Základní obranou proti manipulativní analogii je zviditelnit společnou třídu a zeptat se na rozdíly. V čem jsou srovnávané případy stejné? A v čem se liší rozsahem, úmyslem, odpovědností a důsledky? Pokud je společná vlastnost velmi obecná, srovnání nic nedokazuje a je legitimní ho odmítnout jako odpověď. Druhou obranou je vrátit rozhovor k výchozímu případu: i kdyby jiní jednali stejně, otázka zněla, co se stalo zde. Třetí obranou je číst metafory, které mluvčí používá, jako rámce, ne jako popisy. Kdo si všimne, že pochybnost se v rozhovoru opakovaně nazývá „nemocí“ nebo kritika „útokem“, může metaforu nahradit neutrálním popisem a posoudit, zda hodnocení, které nesla, odpovídá skutečnosti.

U lidí, kteří se dlouho pohybovali ve skupině nebo ve vztahu, kde se každá výtka relativizovala srovnáním s jinými, může být součástí zotavení znovunabytí schopnosti posuzovat jednotlivý čin sám o sobě. Pomáhá rozhovor s někým mimo vztah, kdo dokáže říct, že tento konkrétní čin je nepřijatelný bez ohledu na to, co dělají jiní. Herman zdůrazňuje, že pojmenování toho, co se stalo, a uznání jeho závažnosti druhými lidmi patří k základům obnovy po traumatu (Herman 1992).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Bateson, G. (1972). *Steps to an Ecology of Mind*. San Francisco: Chandler.
- Dilts, R. (1999). *Sleight of Mouth: The Magic of Conversational Belief Change*. Capitola: Meta Publications.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Gordon, D. (1978). *Therapeutic Metaphors: Helping Others through the Looking Glass*. Cupertino: Meta Publications.
- Haley, J. (1973). *Uncommon Therapy: The Psychiatric Techniques of Milton H. Erickson, M.D.* New York: W. W. Norton.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Lakoff, G., & Johnson, M. (1980). *Metaphors We Live By*. Chicago: University of Chicago Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Rosen, S. (Ed.) (1982). *My Voice Will Go with You: The Teaching Tales of Milton H. Erickson*. New York: W. W. Norton.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Chunking](@/kompendium/nlp-vzorce/zakladni-pojmy/chunking.md) – příbuzné heslo (Základní pojmy NLP, Chunking)
- [Analogie](@/kompendium/nlp-vzorce/sleight-of-mouth/som-analogie.md) – příbuzné heslo (Sleight of Mouth, Analogy)
- [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) – příbuzné heslo (Jazykové vzorce, Hierarchy of ideas)
- [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) – příbuzné heslo (Jazykové vzorce, Chunking up)
- [Terapeutická metafora](@/kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md) – příbuzné heslo (Jazykové vzorce, Therapeutic metaphor)
- [Izomorfní metafora](@/kompendium/nlp-vzorce/jazykove-vzorce/izomorfni-metafora.md) – příbuzné heslo (Jazykové vzorce, Isomorphic metaphor)

**V kompendiu**

- [EA-1.2.2 Falešná ekvivalence](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.3.3 Tematická diverze](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-2.5.5 Internalizace falešné vyváženosti (bothsidesism)](@/kompendium/techniques/ea-2-5-5-bothsidesizm-internalizace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Chunking dolů](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-dolu.md) – předchozí heslo rodiny
- [Komunikační kategorie Virginie Satirové](@/kompendium/nlp-vzorce/jazykove-vzorce/kategorie-satirove.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
