+++
title = "Vytýkací konstrukce"
description = "Vytýkací a rozštěpené konstrukce typu „byl to on, kdo…“ nebo „otázka není, zda, ale kdy“, které vyzdvihnou jeden člen a zbytek výpovědi předpokládají."
weight = 17
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Vytýkací konstrukce", "Cleft sentences", "rozštěpené věty", "vytýkání větného členu", "pseudorozštěpené věty", "Jazykové presupozice", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-06.17"
catalog_slug = "rozstepene-vety"
catalog_family = "presupozice"
catalog_family_code = "06"
catalog_family_title = "Jazykové presupozice"
catalog_family_en = "Linguistic presuppositions"
catalog_part = "presupozice.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Cleft sentences"
catalog_aliases = ["rozštěpené věty", "vytýkání větného členu", "pseudorozštěpené věty"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "jazykove-presupozice"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["jazykove-presupozice"]
catalog_related = ["analogove-znaceni", "existencni-presupozice", "kvalifikatory-jen-i", "otazky-s-presupozici", "vztazne-vety-presupozice"]
catalog_related_declared = ["existencni-presupozice", "kvalifikatory-jen-i", "vztazne-vety-presupozice", "otazky-s-presupozici", "analogove-znaceni"]
catalog_kompendium = ["kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md", "kompendium/techniques/ea-1-3-3-tematicka-diverze.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/milton-model/analogove-znaceni.md", "kompendium/nlp-vzorce/presupozice/kvalifikatory-jen-i.md", "kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md", "kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md", "kompendium/techniques/ea-1-3-3-tematicka-diverze.md"]
catalog_prev = "implikativni-slovesa"
catalog_next = "presupozice-v-reklame"
catalog_position = 17
catalog_family_size = 19
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "grice-1975", "heap-1988", "herman-1992", "kahneman-2011", "levinson-1983", "mcguire-1964", "petty-cacioppo-1986", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
catalog_sources_roots = ["grice-1975", "levinson-1983"]
catalog_sources_critical = ["heap-1988", "herman-1992", "kahneman-2011", "mcguire-1964", "petty-cacioppo-1986", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Varianty v psaném textu", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/presupozice.b.toml"
+++

# Vytýkací konstrukce

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.17` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Cleft sentences |
| **Jiné názvy** | rozštěpené věty, vytýkání větného členu, pseudorozštěpené věty |
| **Obecnější heslo** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Vytýkací konstrukce je stavba výpovědi, která jeden její člen vyzdvihne do popředí a
zbytek podá jako známé pozadí. V angličtině se jí říká rozštěpená věta: obsah jednoduché
věty se rozdělí do dvou částí, z nichž jedna nese důraz a druhá předpoklad. Česká výpověď
„byl to Petr, kdo rozbil okno“ tvrdí, že viník je Petr, a předpokládá, že okno někdo rozbil.
Pseudorozštěpená věta „to, co mě na tobě štve, je tvoje lhostejnost“ předpokládá, že na
adresátovi mluvčího něco štve, a vyzdvihuje, co to je. Lingvistická pragmatika uvádí oba
typy konstrukcí mezi spouštěči presupozic a přidává k nim i větný důraz, kdy se tentýž
předpoklad vytváří pouhým zdůrazněním slova (Levinson 1983). Pro kompendium je vytýkání
důležité proto, že rozhoduje o tom, o čem se v rozhovoru bude jednat: vyzdvižený člen se
stane předmětem sporu, kdežto pozadí, často mnohem závažnější, se přijme bez projednání.

## Původ a souvislosti

Rozštěpené a pseudorozštěpené věty byly v lingvistice šedesátých a sedmdesátých let
oblíbeným materiálem pro studium presupozic, protože u nich lze předpoklad snadno izolovat:
stačí větu zápornou nebo tázací porovnat s kladnou a předpoklad zůstane stejný (Levinson
1983). Čeština má k vytýkání bohatší prostředky než angličtina. Kromě konstrukcí „je to…,
kdo“ a „to, co…, je“ vyjadřuje vyzdvižení zejména slovosledem a intonací, tedy tím, co
pražská lingvistická škola popsala jako aktuální členění větné: nová informace, ohnisko
výpovědi, se v neutrálním slovosledu ocitá na konci věty, kdežto začátek nese to, co je
známé. Věta „okno rozbil Petr“ tak předpokládá rozbití okna stejně jako rozštěpená věta.
Podobně působí vytýkací částice „právě“, „teprve“, „až“ nebo „jen“, kterým se věnuje i
heslo [Částice „jen“, „i“, „dokonce“](@/kompendium/nlp-vzorce/presupozice/kvalifikatory-jen-i.md).

Neurolingvistické programování převzalo rozštěpené a pseudorozštěpené věty i větný důraz
do přehledu syntaktických prostředí presupozic (Bandler a Grinder 1975). V Milton-modelu se
s důrazem pracuje i odděleně, jako s takzvaným analogovým značením, kdy se vybraná slova
odliší tónem hlasu nebo pauzou; tomu se věnuje heslo
[Analogové značení](@/kompendium/nlp-vzorce/milton-model/analogove-znaceni.md) (Bandler a
Grinder 1975b).

## Struktura vzorce

Vytýkací konstrukce rozděluje výpověď na ohnisko a pozadí. Ohnisko odpovídá na nevyslovenou
otázku, pozadí tu otázku tvoří. Věta „byl to Petr, kdo rozbil okno“ odpovídá na otázku
„kdo rozbil okno?“, a tím předpokládá, že ji lze položit. Kdo se chce bránit, nabízí jiné
ohnisko („nebyl to Petr, byla to Jana“), a pozadí tím potvrzuje. Kdo chce zpochybnit
pozadí, musí opustit rámec otázky, kterou vytýkací konstrukce postavila, a to je v rozhovoru
stejně obtížné jako u [otázek s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md).

Zvlášť účinná je kontrastní podoba vytýkání: „otázka není, zda…, ale kdy…“, „nejde o to,
jestli…, jde o to, proč…“. Tato konstrukce výslovně odmítne jednu otázku a druhou postaví
na její místo. Odmítnutá otázka bývá ta, kterou by adresát potřeboval položit, například
zda se něco vůbec stalo; dosazená otázka už odpověď na odmítnutou předpokládá. Výpověď
„otázka není, jestli tě propustí, ale kdy“ předpokládá propuštění a zabývá se jen časem.
Kahneman popisuje jev zvaný iluze zaměření: cokoli, na co se člověk právě soustředí, mu
připadá důležitější, než ve skutečnosti je (Kahneman 2011). Vytýkací konstrukce určuje, na
co se soustředí, a tím i to, co zůstane mimo pozornost. Teorie konverzace k tomu dodává, že
posluchač předpokládá relevanci toho, co mluvčí vyzdvihl, a věnuje se tomu jako hlavnímu
tématu (Grice 1975).

## Varianty v psaném textu

V novinových titulcích a v tiskových zprávách se vytýkání často skrývá v ustálených
spojeních. Titulek „Za únikem dat stojí bývalý zaměstnanec“ má podobu odpovědi na otázku,
kdo za únikem stojí, a předpokládá, že únik nastal a že ho někdo způsobil úmyslně. Diskuse
čtenářů se pak vede o tom, zda jde o bývalého zaměstnance, nikoli o tom, zda únik proběhl a
zda šlo o čin jedince, a ne například o chybu systému. Podobně působí spojení „příčinou
krize je…“, které předpokládá jedinou příčinu, nebo „klíčem k úspěchu bylo…“, které
předpokládá, že úspěch nastal. Strukturálně jde o pseudorozštěpenou větu s ustáleným
pozadím, jejíž předpoklad prochází i do vět záporných a tázacích (Levinson 1983). Pro
čtenáře je užitečné přečíst titulek dvakrát: jednou jako odpověď a podruhé jako otázku,
kterou titulek mlčky položil, a zvážit, zda ta otázka byla vůbec oprávněná.

## Detekční znaky

Prvním znakem je vytýkací konstrukce, jejíž pozadí obsahuje sporný nebo nový obsah:
obvinění, předpoklad viny, údajnou událost. Druhým znakem je kontrastní vytýkání typu „nejde
o to, zda…, jde o to, kdo…“, které výslovně odsune stranou otázku po faktech a nahradí ji
otázkou po viníkovi, motivu nebo čase. Třetím znakem je přesun tématu, kdy vytýkání slouží k
tomu, aby se rozhovor přestal zabývat nepříjemnou skutečností, a soustředil se na něco
jiného, například na to, kdo informaci vynesl; tento mechanismus kompendium popisuje u
[tematické diverze](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md). Čtvrtým znakem je
důraz v mluvené řeči, který vytvoří kontrast s nevysloveným: věta „ty ses o to nestaral“
s důrazem na „ty“ předpokládá, že se o věc staral někdo jiný, a mluvčí si tak připíše
zásluhu, kterou výslovně netvrdil (Levinson 1983).
Pátým znakem je pseudorozštěpená věta, která hodnocení adresáta podává jako odpověď na otázku,
kterou nikdo nepoložil: „to, co ti chybí, je sebekritika“.

## Legitimní a manipulativní užití

Vytýkání je nezbytnou součástí jazyka, protože umožňuje opravit nedorozumění a zvýraznit
podstatné. Věta „byla to paní Dvořáková, kdo si chyby všiml“ ocení zásluhu, aniž by vnášela
cokoli sporného, protože to, že si chyby někdo všiml, je známé. Ve vědecké a odborné řeči
pomáhá kontrastní vytýkání vymezit otázku výzkumu („nezajímá nás, zda lék účinkuje, ale u
koho“), pokud předchozí otázka už byla zodpovězena a doložena. Podle teorie konverzace je
takové užití kooperativní, protože vyzdvižení odpovídá tomu, co je pro rozhovor relevantní
(Grice 1975).

Manipulativní užití staví do pozadí obsah, který by adresát odmítl, a vyzdvižením jiného
členu ho vyjme z diskuse. Typickými prostředími jsou porady a krizová komunikace, kde se
otázka po chybě nahradí otázkou po úniku informací, vyšetřování a výslech, kde „chceme
jen vědět, proč jste to udělal“ předpokládá, že to vyslýchaný udělal, a osobní konflikty,
kde pseudorozštěpené věty soustavně hodnotí charakter druhého. Ve veřejné debatě se
kontrastní vytýkání „otázka není, zda…, ale kdy…“ používá k vytvoření dojmu nevyhnutelnosti.
Souvislost s přeznačením výkladu události popisuje technika
[strategické reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md).
Psychologie přesvědčování upozorňuje, že zpracování sdělení závisí na tom, na co se
posluchač soustředí, a že méně pozorně zpracované prvky se hodnotí méně kriticky (Petty a
Cacioppo 1986).

## Stav důkazů

Lingvistický popis vytýkacích konstrukcí jako spouštěčů presupozic je dobře zavedený a
patří k standardnímu obsahu pragmatiky (Levinson 1983). Obecné psychologické mechanismy,
o které se manipulativní užití opírá, tedy řízení pozornosti a nižší kritičnost vůči
okrajově zpracovaným prvkům, jsou doloženy v jiných experimentálních uspořádáních (Petty a
Cacioppo 1986; Kahneman 2011). Samostatný experimentální výzkum účinku vytýkacích konstrukcí
v přesvědčování nebo ve výslechu však kompendium nemá k dispozici a nelze proto uvádět, jak
silný je jejich účinek. Tvrzení NLP o tom, že důraz a vytýkání spolehlivě řídí nevědomé
zpracování sdělení, se opírají o ukázky a rozbory přepisů (Bandler a Grinder 1975b). Kritické
hodnocení NLP z konce osmdesátých let i pozdější přehledy výzkumu konstatují, že pro
specifická tvrzení oboru chybějí empirické doklady (Heap 1988; Witkowski 2010). Rozumný závěr
je, že vytýkání je reálný a dobře popsaný jev, jehož manipulativní potenciál vyplývá z jeho
struktury, ale jehož sílu nikdo nezměřil.

## Obrana a zotavení

Základní obranou je vrátit na stůl otázku, kterou vytýkací konstrukce odsunula. Na „nejde
o to, jestli se peníze ztratily, jde o to, kdo to vynesl“ lze odpovědět, že první otázka
zodpovězena nebyla a že bez ní druhá nedává smysl. Druhou obranou je převést pozadí na
samostatné tvrzení a posoudit ho: „říkáte tedy, že informaci někdo z nás vynesl; z čeho to
víte?“ Třetí obranou je u pseudorozštěpených vět odmítnout otázku, na kterou věta odpovídá,
pokud ji nikdo nepoložil: hodnocení charakteru není odpovědí na nic, co se v rozhovoru
řešilo. Výzkum odolnosti vůči přesvědčování ukazuje, že znalost struktury vlivu předem
usnadňuje jeho rozpoznání (McGuire 1964). U lidí, kteří byli v kolektivu nebo ve vztahu
soustavně vystavováni přesunům tématu, pomáhá zpětně sepsat, které otázky se nikdy
nezodpověděly, protože byly vždy nahrazeny jinými, a vrátit se k nim. Taková rekonstrukce
obnovuje vlastní orientaci v tom, co se skutečně stalo, a je součástí obnovy důvěry ve
vlastní úsudek (Herman 1992).

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Analogové značení](@/kompendium/nlp-vzorce/milton-model/analogove-znaceni.md) – příbuzné heslo (Milton-model, Analogue marking)
- [Existenční presupozice](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md) – příbuzné heslo (Jazykové presupozice, Existential presupposition)
- [Částice „jen“, „i“, „dokonce“](@/kompendium/nlp-vzorce/presupozice/kvalifikatory-jen-i.md) – příbuzné heslo (Jazykové presupozice, Qualifiers only, even, too)
- [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) – příbuzné heslo (Jazykové presupozice, Loaded questions)
- [Vztažné věty jako presupozice](@/kompendium/nlp-vzorce/presupozice/vztazne-vety-presupozice.md) – příbuzné heslo (Jazykové presupozice, Relative clauses)

**V kompendiu**

- [EA-1.3.2 Strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.3.3 Tematická diverze](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Implikativní slovesa](@/kompendium/nlp-vzorce/presupozice/implikativni-slovesa.md) – předchozí heslo rodiny
- [Presupozice v reklamě](@/kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
