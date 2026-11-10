+++
title = "Faktivní slovesa"
description = "Slovesa a výrazy typu „litovat, že“, „vědět, že“ či „je smutné, že“, které obsah vedlejší věty předkládají jako hotový fakt: rozpoznání, užití a obrana."
weight = 15
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Faktivní slovesa", "Factive verbs", "faktivní predikáty", "emotivní faktiva", "Jazykové presupozice", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-06.15"
nlp_slug = "faktivni-slovesa"
nlp_family = "presupozice"
nlp_family_code = "06"
nlp_family_title = "Jazykové presupozice"
nlp_family_en = "Linguistic presuppositions"
nlp_part = "presupozice.b"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Factive verbs"
nlp_aliases = ["faktivní predikáty", "emotivní faktiva"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "vysoke"
nlp_risk_cs = "vysoké"
nlp_broader = "jazykove-presupozice"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["jazykove-presupozice"]
nlp_related = ["ztraceny-performativ", "cteni-myslenek", "jazykove-presupozice", "predikaty-uvedomeni", "komentarova-adverbia", "implikativni-slovesa"]
nlp_related_declared = ["predikaty-uvedomeni", "komentarova-adverbia", "implikativni-slovesa", "cteni-myslenek", "ztraceny-performativ"]
nlp_kompendium = ["kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md", "kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md"]
nlp_links_prose = ["kompendium/07-teoreticke-reflexe/kognitivni-vedy.md", "kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md", "kompendium/nlp-vzorce/meta-model/cteni-myslenek.md", "kompendium/nlp-vzorce/meta-model/ztraceny-performativ.md", "kompendium/nlp-vzorce/presupozice/predikaty-uvedomeni.md", "kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md"]
nlp_prev = "kontrafaktualni-podminky"
nlp_next = "implikativni-slovesa"
nlp_position = 15
nlp_family_size = 19
nlp_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "beck-1976", "grice-1975", "herman-1992", "kahneman-2011", "levinson-1983", "loftus-palmer-1974", "roderique-davies-2009", "witkowski-2010"]
nlp_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
nlp_sources_roots = ["grice-1975", "levinson-1983"]
nlp_sources_critical = ["beck-1976", "herman-1992", "kahneman-2011", "loftus-palmer-1974", "roderique-davies-2009", "witkowski-2010"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Varianty v referování o cizí řeči", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/presupozice.b.toml"
+++

# Faktivní slovesa

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.15` |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Factive verbs |
| **Jiné názvy** | faktivní predikáty, emotivní faktiva |
| **Obecnější vzorec** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Faktivní sloveso je sloveso nebo slovesný výraz, který předpokládá pravdivost své vedlejší
věty. Kdo řekne „lituje, že podepsal smlouvu“, sděluje něco o lítosti a zároveň předpokládá,
že smlouvu podepsal. Předpoklad přetrvává i pod záporem: „nelituje, že podepsal smlouvu“
stále předpokládá podpis. V tom se faktivní výrazy liší od nefaktivních, jako jsou „myslet
si, že“, „tvrdit, že“ nebo „věřit, že“, po kterých může vedlejší věta klidně být nepravdivá.
Lingvistická pragmatika řadí faktivní slovesa mezi nejznámější spouštěče presupozic a k jejich
skupině počítá i výrazy hodnotící, jako „je zvláštní, že“, „je smutné, že“ nebo „být rád, že“
(Levinson 1983). V češtině sem patří například „litovat“, „mrzet“, „vědět“, „uvědomit si“,
„zjistit“, „chápat, že“ a celá řada spojení s přídavným jménem. Pro kompendium jsou faktivní
výrazy důležité proto, že umožňují předložit sporné tvrzení jako výchozí bod, ke kterému se
vztahuje cit nebo poznání mluvčího, a debatu tak přesunout od toho, zda je tvrzení pravdivé,
k tomu, jak se k němu mluvčí cítí.

## Původ a souvislosti

Rozlišení faktivních a nefaktivních predikátů se do lingvistiky dostalo na přelomu
šedesátých a sedmdesátých let, zejména díky pracím Paula a Carol Kiparských, a stalo se
jedním z hlavních příkladů, na nichž se zkoumalo, jak se presupozice chovají ve složených
větách. Levinson ve svém přehledu popisuje, že faktivní výrazy tvoří různorodou skupinu:
některé, zvlášť ty, které vyjadřují poznání, mohou v určitých souvislostech předpoklad
ztratit, kdežto jiné, například výrazy lítosti, si ho drží pevněji (Levinson 1983). Teorie konverzace
k tomu dodává, že posluchač předpokládá kooperaci mluvčího, a proto obsah, který mluvčí
podává jako známý, přijímá, pokud nemá zjevný důvod pochybovat (Grice 1975).

Neurolingvistické programování převzalo faktivní slovesa a přídavná jména do přehledu
syntaktických prostředí presupozic (Bandler a Grinder 1975). V Milton-modelu je zvláštní
pozornost věnována podskupině sloves uvědomění, jako „všimnout si“ nebo „uvědomit si“, která
mají podle NLP posluchače vést k tomu, aby se soustředil na vnímání předpokládaného obsahu,
ne na jeho pravdivost (Bandler a Grinder 1975b). Té se věnuje samostatné heslo
[Predikáty uvědomění](@/kompendium/nlp-vzorce/presupozice/predikaty-uvedomeni.md); tato
stránka popisuje faktivní výrazy obecně a zvlášť výrazy citové a hodnotící.

## Struktura vzorce

Výpověď s faktivním výrazem má dvě patra. Horní patro vyjadřuje postoj mluvčího: lítost,
radost, údiv, poznání. Dolní patro, vedlejší věta, obsahuje tvrzení, ke kterému se postoj
vztahuje. Rozhovor se přirozeně vede o horním patře; posluchač může projevit soucit,
odmítnout lítost nebo se ohradit proti hodnocení, ale dolní patro tím nezpochybní. Pokud
dolní patro obsahuje hodnocení posluchače, například jeho přehnanou reakci, vinu nebo
nevědomost, přijímá ho posluchač právě tím, že reaguje na postoj mluvčího.

Zvláštní formou je falešná omluva: „mrzí mě, že ses cítila dotčená“. Výraz „mrzí mě“ dodává
větě podobu omluvy, ale faktivní vedlejší věta předpokládá jen to, že se adresátka cítila
dotčená, a odpovědnost za tento stav mlčky přesouvá na ni. Příbuzná jsou spojení „je smutné,
že nechápeš…“, kde hodnoticí výraz nemá zjevného autora a hodnocení se podává jako obecně
platné; tomuto jevu se v NLP říká [ztracený performativ](@/kompendium/nlp-vzorce/meta-model/ztraceny-performativ.md).
Výraz „vím, že…“ zase předkládá obsah jako poznání, ne jako domněnku, a pokud se týká
vnitřních stavů druhého, splývá se [čtením myšlenek](@/kompendium/nlp-vzorce/meta-model/cteni-myslenek.md).
Kahneman popisuje, že intuitivní myšlení vytváří souvislý obraz z informací, které má právě
k dispozici, a nevyhledává, co v nich chybí (Kahneman 2011); faktivní výraz nabízí hotový
fakt, k němuž chybějící důkaz posluchač sám nehledá.

## Varianty v referování o cizí řeči

Zvláštní pozornost si zaslouží slovesa, kterými se referuje o tom, co řekl někdo jiný.
Sloveso „uvedl, že“ je nefaktivní a obsah ponechává otevřený. Slovesa „přiznal, že“,
„odhalil, že“ nebo „připustil, že“ se chovají faktivně nebo téměř faktivně: předkládají
obsah jako pravdivý a navíc naznačují, že šlo o něco nepříjemného nebo skrývaného. Zpráva
„ministr přiznal, že o smlouvě věděl“ tedy říká víc než „ministr uvedl, že o smlouvě věděl“,
přestože citovaný výrok může být totožný. Opačným směrem působí slovesa „tvrdí, že“ nebo
„prý“, která obsah zpochybňují. Volba referujícího slovesa je proto místem, kde se do zprávy
o cizí výpovědi vkládá hodnocení, aniž by ho autor zprávy vyslovil (Levinson 1983). Kdo
čte zpravodajství nebo zápisy z jednání, může tento posun ověřit jednoduchým srovnáním s
původním zněním výpovědi, pokud je dostupné.

## Detekční znaky

Prvním znakem je faktivní výraz, jehož vedlejší věta obsahuje hodnocení adresáta nebo jeho
jednání: „je škoda, že ses zase neudržel“, „chápu, že je pro tebe těžké přiznat chybu“.
Druhým znakem je omluva, která se týká citu adresáta, ne jednání mluvčího. Třetím znakem je
„vím, že…“ ve vztahu k myšlenkám, úmyslům nebo vzpomínkám druhého, kde mluvčí žádné poznání
mít nemůže. Čtvrtým znakem je hodnoticí výraz bez autora („je zarážející, že…“), který
hodnocení vydává za obecnou pravdu. Pátým znakem je soustavné užívání faktivních výrazů k
tvrzením, která by jako samostatné věty vyvolala spor; posluchač pak reaguje na postoj, ne
na obsah (Levinson 1983). U člověka, na kterého jsou takové věty dlouhodobě uplatňovány, se
objevuje pocit, že je stále v defenzivě, aniž by ho kdo z něčeho výslovně obvinil, a zvyšuje
se nejistota ve vlastním hodnocení situace. Tyto znaky se překrývají s popisem v
[detekční signatuře gaslightingu](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md)
a s technikou [pěstování sebepochybnosti](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md).

## Legitimní a manipulativní užití

Faktivní výrazy jsou běžnou a potřebnou součástí jazyka. Lékař, který řekne „je mi líto, že
jste čekali tak dlouho“, předpokládá nesporný fakt a přebírá za něj odpovědnost. Kolega,
který řekne „vím, že porada byla přesunuta“, odkazuje na sdílenou informaci. V terapii mohou
faktivní výrazy uznat zkušenost klienta („je pochopitelné, že vás to zasáhlo“), pokud se
vztahují k tomu, co klient sám vyjádřil. Podle teorie konverzace je takové užití kooperativní:
předpoklad patří do sdíleného základu a šetří slova (Grice 1975).

Manipulativní užití staví do faktivní vedlejší věty obsah, který adresát nesdílí a který by
odmítl. Nejčastěji jde o přisouzení emoční reakce („mrzí mě, že jsi to tak přehnaně vzala“),
viny („je smutné, že ti nedošlo, co jsi způsobil“) nebo nevědomosti („chápu, že tomu
nerozumíš“). Manipulace spočívá v tom, že adresát, který se brání, se brání proti postoji
mluvčího, a fakt v pozadí tím potvrzuje. V kontrolujících vztazích se tyto věty často
kombinují s projevy zdánlivé péče, takže odmítnout je působí nevděčně. Rozlišujícím kritériem
je, zda by mluvčí byl ochoten obsah vedlejší věty vyslovit jako samostatné tvrzení a nést za
něj odpovědnost.

## Stav důkazů

Lingvistický popis faktivních výrazů je jednou z nejlépe prozkoumaných oblastí teorie
presupozic, včetně toho, že se jednotlivé výrazy liší pevností předpokladu (Levinson 1983).
Experimentálně je dobře doloženo, že jazyková forma otázek a výpovědí může ovlivnit úsudek
i vzpomínky posluchače (Loftus a Palmer 1974), i když tyto experimenty nezkoumaly faktivní
slovesa samostatně. Tvrzení NLP, podle nichž faktivní výrazy a predikáty uvědomění
spolehlivě vedou k přijetí sugesce, se opírají o ukázky a rozbory přepisů, ne o kontrolované
studie (Bandler a Grinder 1975b). Přehledy výzkumu NLP nenacházejí pro jeho testovatelná
tvrzení podporu (Witkowski 2010) a kritici upozorňují, že obor přebírá odbornou terminologii,
například z lingvistiky, aniž by přebíral i metody, kterými se tvrzení v daném oboru ověřují
(Roderique-Davies 2009). Jazykový jev je tedy dobře popsán; jeho přesná síla v přirozené
komunikaci je odhadem, ne změřeným údajem.

## Obrana a zotavení

Základní obranou je reagovat na dolní patro, ne na horní. Na „mrzí mě, že jsi to tak
přehnaně vzala“ je přiměřenou odpovědí odmítnutí předpokladu, například konstatování, že
reakce nebyla přehnaná, a návrat k tomu, co ji vyvolalo. Druhou obranou je rozlišovat
omluvu za vlastní jednání od vyjádření lítosti nad citem druhého a žádat první, pokud jde o
skutečnou křivdu. Třetí obranou je u výrazů „vím, že“ a „je zřejmé, že“ žádat zdroj
poznání: jak to mluvčí ví a z čeho je to zřejmé. Kognitivní terapie učí odlišovat fakta od
jejich interpretace a vnímat hodnocení jako hypotézu, kterou lze testovat (Beck 1976); totéž
rozlišení chrání před přijetím faktivně podaného hodnocení. Při zotavení z dlouhodobé
kontroly pomáhá zpětně vypsat, co bylo v takových větách předpokládáno, a ke každé položce
si odpovědět vlastními slovy, a to ideálně ve vztahu, kde je vlastní popis událostí
respektován (Herman 1992). Souvislost s tím, jak mysl zpracovává hotově podané informace,
rozvádí kapitola o [kognitivních vědách](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- Roderique-Davies, G. (2009). Neuro-linguistic programming: Cargo cult psychology? *Journal of Applied Research in Higher Education*, 1(2), 58–63.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Ztracený performativ](@/kompendium/nlp-vzorce/meta-model/ztraceny-performativ.md) – příbuzný vzorec (Meta-model, Lost performative)
- [Čtení myšlenek](@/kompendium/nlp-vzorce/meta-model/cteni-myslenek.md) – příbuzný vzorec (Meta-model, Mind reading)
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – příbuzný vzorec (Jazykové presupozice, Linguistic presuppositions)
- [Predikáty uvědomění](@/kompendium/nlp-vzorce/presupozice/predikaty-uvedomeni.md) – příbuzný vzorec (Jazykové presupozice, Awareness predicates)
- [Komentářová příslovce a přídavná jména](@/kompendium/nlp-vzorce/presupozice/komentarova-adverbia.md) – příbuzný vzorec (Jazykové presupozice, Commentary adverbs and adjectives)
- [Implikativní slovesa](@/kompendium/nlp-vzorce/presupozice/implikativni-slovesa.md) – příbuzný vzorec (Jazykové presupozice, Implicative verbs)

**V kompendiu**

- [Detekční signatura: Gaslighting vzorec](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-2.5.3 Pěstování sebepochybnosti](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Kontrafaktuální podmínky](@/kompendium/nlp-vzorce/presupozice/kontrafaktualni-podminky.md) – předchozí vzorec rodiny
- [Implikativní slovesa](@/kompendium/nlp-vzorce/presupozice/implikativni-slovesa.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
