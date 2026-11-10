+++
title = "Vložené otázky"
description = "Otázka zabalená do oznamovací věty: jak Milton-model využívá nepřímé tázání, jak ho odlišit od zdvořilosti a jak neodpovídat na nevyslovené."
weight = 3
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-milton-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Vložené otázky", "Embedded questions", "nepřímé otázky", "Milton-model", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-04.03"
catalog_slug = "vlozene-otazky"
catalog_family = "milton-model"
catalog_family_code = "04"
catalog_family_title = "Milton-model"
catalog_family_en = "Milton Model"
catalog_part = "milton-model"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Embedded questions"
catalog_aliases = ["nepřímé otázky"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "milton-model"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["milton-model"]
catalog_related = ["vlozene-prikazy", "konverzacni-postulaty", "pripojene-otazky", "otazky-s-presupozici", "otazky-misto-tvrzeni"]
catalog_related_declared = ["vlozene-prikazy", "konverzacni-postulaty", "otazky-s-presupozici", "pripojene-otazky"]
catalog_kompendium = ["kompendium/techniques/ea-2-2-5-recommendation-coercion.md", "kompendium/detection-signatures/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/milton-model/konverzacni-postulaty.md", "kompendium/nlp-vzorce/milton-model/vlozene-prikazy.md", "kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md", "kompendium/nlp-vzorce/zakladni-pojmy/stav.md", "kompendium/techniques/ea-2-2-5-recommendation-coercion.md"]
catalog_prev = "vlozene-prikazy"
catalog_next = "analogove-znaceni"
catalog_position = 3
catalog_family_size = 30
catalog_sources = ["bandler-grinder-1975b", "grice-1975", "grinder-delozier-bandler-1977", "heap-1988", "herman-1992", "levinson-1983", "loftus-palmer-1974", "miller-rollnick-2013", "passmore-rowson-2019", "petty-cacioppo-1986", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975b", "grinder-delozier-bandler-1977"]
catalog_sources_roots = ["grice-1975", "levinson-1983"]
catalog_sources_critical = ["heap-1988", "herman-1992", "loftus-palmer-1974", "miller-rollnick-2013", "passmore-rowson-2019", "petty-cacioppo-1986", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/milton-model.toml"
+++

# Vložené otázky

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-04.03` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Embedded questions |
| **Jiné názvy** | nepřímé otázky |
| **Obecnější heslo** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Vložená otázka je v Milton-modelu otázka, která není položena jako otázka, ale je vnořena do
oznamovací věty, typicky po slovesech a obratech vyjadřujících zvědavost, nejistotu nebo
přání mluvčího. Formálně tedy mluvčí nic neptá, jen sděluje svůj [vnitřní stav](@/kompendium/nlp-vzorce/zakladni-pojmy/stav.md), a posluchač
není povinen odpovědět. Podle autorů NLP však posluchač na takovou větu obvykle reaguje,
jako by otázka zazněla, buď odpovědí nahlas, nebo alespoň vnitřním hledáním odpovědi
(Bandler a Grinder 1975b). Vzorec je gramatickým protějškem
[vložených příkazů](@/kompendium/nlp-vzorce/milton-model/vlozene-prikazy.md): stejně jako
skrytý pokyn obchází rozhodnutí, zda pokyn přijmout, obchází skrytá otázka rozhodnutí, zda na
ni vůbec odpovídat. Pro kompendium je podstatné, že vložená otázka často nese
presupozici, tedy předem přijatý předpoklad, a posluchač, který začne hledat odpověď, tento
předpoklad mlčky přijímá. Tím se blíží
[otázkám s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md).

## Původ a souvislosti

V češtině i v angličtině je nepřímá otázka běžnou gramatickou konstrukcí: závislá věta
uvozená tázacím slovem nebo spojkou „zda“, „jestli“. Bandler a Grinder si v rozboru
Ericksonova jazyka všimli, že Erickson těchto konstrukcí používal soustavně, aby klienta
vedl k vnitřnímu prozkoumávání, aniž by po něm žádal odpověď, a zařadili je do svého popisu
jazykových celků, které se skrývají uvnitř větších výpovědí (Bandler a Grinder 1975b; Grinder, DeLozier a Bandler 1977). Pragmatika popisuje obecnější
jev, který vzorec využívá: výpověď může mít jinou komunikační funkci, než jakou naznačuje její
gramatická podoba, a posluchač tuto funkci vyvozuje z kontextu a z předpokladu, že mluvčí
spolupracuje (Grice 1975; Levinson 1983). Konstatování o vlastní zvědavosti tak v běžné
komunikaci funguje jako zdvořilá otázka. NLP z této vlastnosti jazyka udělalo nástroj,
který má snížit odpor posluchače, protože otázka, která nebyla položena, se nedá odmítnout
jako dotěrná.

## Struktura vzorce

Struktura vložené otázky má dvě části. Hlavní věta vyjadřuje stav mluvčího: zvědavost,
přání vědět, nejistotu, údiv. Závislá věta nese vlastní tázací obsah. Z hlediska vlivu je
podstatné, co tato závislá věta předpokládá. Otázka po tom, kolik, kdy nebo jak, předpokládá,
že něco nastane, a otevírá jen otázku míry, času nebo způsobu. Posluchač, který začne
přemýšlet o odpovědi, se tak pohybuje uvnitř rámce, který zvolil mluvčí. Tento mechanismus
je shodný s presupozičními otázkami, jejichž vliv na odpovědi je dobře doložen ve výzkumu
svědecké výpovědi: formulace otázky mění nejen odpověď, ale i pozdější vzpomínku na
událost (Loftus a Palmer 1974).

Druhou strukturální vlastností je popiratelnost. Protože mluvčí formálně jen popsal svou
zvědavost, nemůže být obviněn z vtíravého vyptávání, a pokud posluchač neodpoví, rozhovor
plyne dál bez zjevného napětí. Třetí vlastností je spojení s dalšími vzorci. Vložená
otázka se často kombinuje s vloženým příkazem, kdy závislá věta obsahuje i výzvu, a s
[konverzačními postuláty](@/kompendium/nlp-vzorce/milton-model/konverzacni-postulaty.md), u nichž otázka po schopnosti funguje jako žádost (Bandler a Grinder 1975b). Výsledkem je řeč, ve které se požadavky a
otázky prolínají s konstatováními tak, že posluchač ztrácí přehled o tom, co bylo
skutečně řečeno a co si domyslel.

## Detekční znaky

Vloženou otázku poznáme podle hlavní věty vyjadřující vnitřní stav mluvčího, po které následuje tázací obsah (Bandler a Grinder 1975b), a to opakovaně v krátkém úseku rozhovoru. Varovným znakem je, když
tázací obsah předpokládá rozhodnutí, které posluchač ještě neučinil, tedy když se
mluvčí „zajímá“, jak velká bude investice, kdy se posluchač přidá nebo jak se bude cítit,
až to udělá. Dalším znakem je, že mluvčí po takové větě zmlkne a čeká, čímž z
konstatování dělá otázku, aniž by ji položil. V písemné komunikaci, například v
marketingových textech a e-mailech, se vložené otázky objevují jako řečnické obraty, které
mají čtenáře přimět, aby si odpověď představil. Pozorovatel může každou takovou větu
přepsat na přímou otázku a zjistit, co předpokládá; pokud přímá otázka zní dotěrně nebo
podsouvavě, bylo nepřímé formy užito k zastření.

Odlišení od zdvořilosti vyžaduje sledovat celý rozhovor, ne jednu větu. Nepřímou otázku
používá většina lidí denně, protože je šetrnější než přímé vyptávání a dává druhému
možnost mlčet. Podezření zakládá teprve souběh tří okolností: tázací obsah předpokládá
závazek nebo rozhodnutí, nepřímé otázky se kupí v krátkém úseku a mluvčí má na odpovědi
zřejmý zájem. Výzkum přesvědčování ukazuje, že lidé při nízké pozornosti nebo pod časovým
tlakem zpracovávají sdělení povrchně a reagují spíš na jeho formu a na autoritu mluvčího
než na jeho obsah (Petty a Cacioppo 1986). Právě v takových chvílích, například na konci
dlouhé prezentace nebo v telefonátu, který přišel nečekaně, je nepřímá otázka s
presupozicí nejúčinnější a zároveň nejhůře rozpoznatelná. Pozorovatel by si měl všímat
také toho, jak mluvčí naloží s odpovědí, která předpoklad odmítne: pokud ji přejde a
položí jinou nepřímou otázku se stejným předpokladem, je to silný znak záměrného užití.

## Legitimní a manipulativní užití

Nepřímá otázka je v běžné řeči především zdvořilostním prostředkem. Učitel, lékař nebo
kolega, který vyjádří zvědavost a nechá druhému prostor neodpovědět, chrání jeho autonomii
lépe než přímým vyptáváním. V terapii slouží otevřené a nenaléhavé otázky k tomu, aby klient
mohl prozkoumávat vlastní zkušenost svým tempem; motivační rozhovor klade důraz na otevřené
otázky, které nepředjímají odpověď (Miller a Rollnick 2013). Hranice vůči manipulaci
nespočívá v gramatické formě, ale v tom, co otázka předpokládá a komu slouží. Manipulativní
užití vkládá do závislé věty předpoklad rozhodnutí, závazku nebo stavu, který posluchač
nepřijal, a využívá toho, že posluchač při hledání odpovědi předpoklad nezpochybní. V
prodeji a náboru tak nepřímá otázka posouvá rozhovor od otázky „zda“ k otázce „kolik“ a
„kdy“, aniž by posluchač kdy výslovně souhlasil. Podobný posun sleduje kompendium u
[nátlaku doporučením](@/kompendium/techniques/ea-2-2-5-recommendation-coercion.md).

## Stav důkazů

Specifické tvrzení NLP, že vložené otázky vyvolávají nevědomé hledání odpovědi a obcházejí
kritické zpracování, nebylo v kontrolovaných studiích ověřeno; přehledy výzkumu NLP
nenacházejí podporu pro jeho jazykové mechanismy vlivu a upozorňují na nedostatek
kvalitních studií (Heap 1988; Witkowski 2010; Passmore a Rowson 2019). Doloženo je naopak
obecnější tvrzení, na které vzorec parazituje: formulace otázky ovlivňuje odpověď. Výzkum
svědecké paměti ukázal, že volba slov v otázce mění odhady i pozdější vzpomínky (Loftus a
Palmer 1974), a výzkum rozhodování ukázal, že způsob, jakým je volba orámována, mění
preference i při stejném obsahu (Tversky a Kahneman 1981). Tyto nálezy se netýkají
nepřímé otázky jako takové, ale presupozic a rámců, které nese. Proto je rozumné chápat
vloženou otázku jako zdvořilý obal, jehož riziko leží v obsahu, a ne jako zvláštní techniku
se samostatným účinkem.

## Obrana a zotavení

Základní obranou je neodpovídat na otázku, která nebyla položena, a místo toho odpovědět na
předpoklad, který nese. Pokud mluvčí vyjádří zvědavost, kolik je posluchač ochoten
investovat, je legitimní odpovědět, že o investici zatím neuvažuje. Druhou obranou je
převést nepřímou otázku na přímou a posoudit, zda by v přímé podobě byla přijatelná.
Třetí obranou je zpomalit: vzorec působí v plynulém rozhovoru, kde se konstatování a
otázky střídají rychleji, než je posluchač stačí rozlišit. Odstup, poznámky a rozhodování
mimo situaci rozhovoru jeho působení oslabují. V prostředí výslechu a vyšetřování, kde
mají předpoklady otázek vliv na výpověď, je ochranou trvat na otevřených otázkách a na
záznamu, aby bylo možné zpětně ověřit, co pochází od tazatele a co od vyslýchaného (Loftus
a Palmer 1974). Pro lidi, kteří byli tímto způsobem vedeni k závazkům, je při zotavení
užitečné rekonstruovat, které předpoklady převzali, aniž by o nich rozhodli, a obnovit
vědomí vlastní volby (Herman 1992). Takový člověk se často obviňuje, že „sám souhlasil“.
Pomáhá mu pochopit, že souhlas, který vznikl uvnitř cizího předpokladu a bez možnosti ho
odmítnout, není svobodným rozhodnutím v plném smyslu, a že rozpoznat strukturu, která ho k
němu vedla, je prvním krokem k tomu, aby se příště rozhodoval sám a s odstupem.

## Literatura

- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Grinder, J., DeLozier, J., & Bandler, R. (1977). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 2*. Cupertino: Meta Publications.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Vložené příkazy](@/kompendium/nlp-vzorce/milton-model/vlozene-prikazy.md) – příbuzné heslo (Milton-model, Embedded commands)
- [Konverzační postuláty](@/kompendium/nlp-vzorce/milton-model/konverzacni-postulaty.md) – příbuzné heslo (Milton-model, Conversational postulates)
- [Připojené otázky](@/kompendium/nlp-vzorce/milton-model/pripojene-otazky.md) – příbuzné heslo (Milton-model, Tag questions)
- [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) – příbuzné heslo (Jazykové presupozice, Loaded questions)
- [Otázky místo tvrzení](@/kompendium/nlp-vzorce/jazykove-vzorce/otazky-misto-tvrzeni.md) – příbuzné heslo (Jazykové vzorce, Questions instead of statements)

**V kompendiu**

- [EA-2.2.5 Nátlak doporučením](@/kompendium/techniques/ea-2-2-5-recommendation-coercion.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Detekční signatury EA technik](@/kompendium/detection-signatures/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Vložené příkazy](@/kompendium/nlp-vzorce/milton-model/vlozene-prikazy.md) – předchozí heslo rodiny
- [Analogové značení](@/kompendium/nlp-vzorce/milton-model/analogove-znaceni.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
