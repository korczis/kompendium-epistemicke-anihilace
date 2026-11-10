+++
title = "Presupozice v meta-modelu"
description = "Presupozice jako kategorie meta-modelu: co výrok mlčky předpokládá, jak se skrytý předpoklad pozná a proč je zvlášť rizikový v otázkách, výsleších a svědectví."
weight = 14
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-meta-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Presupozice v meta-modelu", "Presuppositions (Meta Model)", "předpoklady výroku", "skryté předpoklady", "Meta-model", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-03.14"
catalog_slug = "presupozice-v-meta-modelu"
catalog_family = "meta-model"
catalog_family_code = "03"
catalog_family_title = "Meta-model"
catalog_family_en = "Meta Model"
catalog_part = "meta-model.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Presuppositions (Meta Model)"
catalog_aliases = ["předpoklady výroku", "skryté předpoklady"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "meta-model"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["meta-model"]
catalog_related = ["nominalizace", "presupozice-milton", "jazykove-presupozice", "otazky-s-presupozici", "presupozice-ve-vyslechu"]
catalog_related_declared = ["jazykove-presupozice", "otazky-s-presupozici", "presupozice-milton", "presupozice-ve-vyslechu", "nominalizace"]
catalog_kompendium = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/techniques/ea-1-2-1-falesne-dilema.md", "kompendium/03-zakladni-kategorie/biasy/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/nlp-vzorce/meta-model/nominalizace.md", "kompendium/nlp-vzorce/milton-model/presupozice-milton.md", "kompendium/nlp-vzorce/presupozice/faktivni-slovesa.md", "kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md", "kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md", "kompendium/techniques/ea-1-2-1-falesne-dilema.md"]
catalog_prev = "komplexni-ekvivalence"
catalog_next = "hierarchie-otazek-meta-modelu"
catalog_position = 14
catalog_family_size = 17
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "beck-1976", "erickson-rossi-rossi-1976", "grice-1975", "herman-1992", "levinson-1983", "loftus-palmer-1974", "passmore-rowson-2019", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
catalog_sources_roots = ["erickson-rossi-rossi-1976", "grice-1975", "levinson-1983"]
catalog_sources_critical = ["beck-1976", "herman-1992", "loftus-palmer-1974", "passmore-rowson-2019", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/meta-model.b.toml"
+++

# Presupozice v meta-modelu

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-03.14` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Meta-model](@/kompendium/nlp-vzorce/meta-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Presuppositions (Meta Model) |
| **Jiné názvy** | předpoklady výroku, skryté předpoklady |
| **Obecnější heslo** | [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Presupozice je v lingvistice obsah, který věta nevyslovuje jako tvrzení, ale předpokládá
ho jako daný, aby vůbec dávala smysl. Věta „přestal jsi už kouřit?“ předpokládá, že
adresát kouřil; ať odpoví ano, nebo ne, předpoklad tím přijme. Meta-model zařadil
presupozice mezi kategorie, které ukazují na omezení modelu světa: v předpokladech, které
mluvčí bere za samozřejmé, se skrývají přesvědčení, o nichž nediskutuje ani sám se sebou
(Bandler a Grinder 1975). Tato stránka se věnuje presupozicím z hlediska meta-modelu, tedy
tomu, jak je rozpoznat v řeči člověka a jak se jejich zviditelnění používá v terapii i ve
vlivové praxi. Lingvistickým typům presupozic se podrobně věnuje rodina [jazykových
presupozic](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md). Pro kompendium je
kategorie zvlášť důležitá kvůli otázkám: otázka se skrytým předpokladem je jedním z
nejjednodušších a nejméně viditelných prostředků, jak do rozhovoru vložit tvrzení, které
nikdo nevyslovil a nikdo neprověřil.

## Původ a souvislosti

Pojem presupozice pochází z filozofie jazyka a z lingvistické pragmatiky, kde se zkoumá,
co věta předpokládá, které jazykové prostředky předpoklady spouštějí a jak se předpoklad
chová, když se věta zapírá nebo převádí na otázku. Levinson shrnul tuto tradici a popsal
typické spouštěče presupozic, například [faktivní slovesa](@/kompendium/nlp-vzorce/presupozice/faktivni-slovesa.md), [slovesa změny stavu](@/kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md), opakovací
výrazy, časové věty a určité popisy (Levinson 1983). Bandler a Grinder přenesli pojem do
terapeutického rámce. V meta-modelu sledovali, které předpoklady klient v řeči nese a jak
ho omezují, a v prvním svazku o hypnotických technikách Miltona Ericksona popsali opačné,
záměrné užití presupozic k tomu, aby posluchač přijal předpoklad, aniž by ho vědomě
posuzoval (Bandler a Grinder 1975; Bandler a Grinder 1975b). Erickson sám pracoval s
formulacemi, které nechávaly volbu jen v tom, jak nebo kdy se něco stane, nikoli zda se to
stane (Erickson, Rossi a Rossi 1976). Toto záměrné užití rozebírá stránka o [presupozicích
v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/presupozice-milton.md).

## Struktura vzorce

Výrok s presupozicí má dvě vrstvy: vyslovené tvrzení nebo otázku a předpoklad, na kterém
vyslovená vrstva stojí. Charakteristickou vlastností předpokladu je, že přežívá zápor a
převedení na otázku. Věta „nevím, proč mě pořád odmítáš“ i otázka „proč mě pořád
odmítáš?“ předpokládají, že odmítání probíhá a že je opakované (Levinson 1983). Proto se
předpoklad nedá odmítnout odpovědí na vyslovenou vrstvu; odmítnout ho lze jen tím, že se
nejdřív vysloví.

V meta-modelu se rozlišují presupozice, které člověk nese ve vlastní řeči a které ho
omezují, a presupozice, které mu do rozhovoru vkládá někdo jiný (Bandler a Grinder 1975).
První typ je předmětem terapeutické práce: věta „až zase selžu, budu se cítit hrozně“
předpokládá, že selhání přijde a že bude opakováním. Druhý typ je předmětem obranné
analýzy. Zvlášť rizikové jsou otázky, protože adresát má sklon odpovídat na to, na co se
otázka ptá, a předpoklad přitom přijímá. Otázka „jak rychle jelo auto, když do sebe
narazila?“ nese jiný předpoklad o síle nárazu než otázka se slovesem „rozbila se o sebe“;
Loftusová a Palmer ukázali, že taková změna slovesa ovlivňuje odhady rychlosti a že
otázka s dramatičtějším slovesem vede k častějším nepravdivým vzpomínkám na rozbité sklo
(Loftus a Palmer 1974). Presupozice otázky se tak může stát součástí vzpomínky. Častým
spojením je i [nominalizace](@/kompendium/nlp-vzorce/meta-model/nominalizace.md):
„tvoje neschopnost“ předpokládá existenci neschopnosti jako věci, o které se pak mluví.

## Detekční znaky

Spouštěči presupozic jsou v češtině zejména časové věty („než“, „až“, „když už“),
opakovací výrazy („zase“, „znovu“, „pořád“), slovesa změny stavu („přestat“, „začít“),
faktivní slovesa („uvědomit si“, „vědět“, „litovat“), pořadové výrazy („první věc, kterou
změníš“), srovnání („ještě horší“) a vztažné věty, které o někom něco mimochodem tvrdí
(„ten tvůj kamarád, co tě zneužívá“). Otázky s „proč“ předpokládají fakt, na jehož
důvod se ptají. Výběrové otázky („chceš to podepsat dnes, nebo zítra?“) předpokládají, že
k podpisu dojde. Tento poslední typ kompendium rozebírá u [falešného dilematu](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md).

V interakci je hlavním znakem hromadění předpokladů, které adresát nikdy výslovně
nepřijal, ale o které se rozhovor opírá. Typické je, že pokud adresát předpoklad
zpochybní, mluvčí reaguje, jako by šlo o odbočku od tématu nebo vytáčku. U člověka, kterému
jsou presupozice vkládány soustavně, se může objevit nejistota, odkud se některé jeho
představy o sobě vzaly, a pocit, že se o věcech „vždycky vědělo“, ačkoli je nikdo
nevyslovil.

Pro přesnou analýzu je užitečné odlišit presupozici od konverzační implikatury. Implikatura
je význam, který posluchač vyvozuje z toho, že mluvčí říká právě toto a právě takto,
například z toho, že na otázku po kvalitě práce odpoví jen pochvalou dochvilnosti (Grice
1975). Implikaturu lze na rozdíl od presupozice obvykle zrušit dodatkem bez rozporu („…a
jinak je jeho práce výborná“). Presupozice se zrušit nedá, aniž by věta ztratila smysl
(Levinson 1983). Pozorovatel, který tyto dvě vrstvy rozliší, snáze pozná, zda mluvčí něco
naznačuje a ponechává za to odpovědnost posluchači, nebo zda sporné tvrzení vkládá do
samotného základu věty.

## Legitimní a manipulativní užití

Legitimní užití stojí na zviditelnění. Terapeut, který v řeči klientky zachytí slovo
„zase“ a zeptá se, co ji vede k předpokladu opakování, předpoklad nevkládá, ale vrací ho
k posouzení. Takový postup je slučitelný s kognitivní terapií, která zkoumá implicitní
předpoklady automatických myšlenek (Beck 1976). Legitimní jsou i presupozice, které jsou
nutnou součástí běžné komunikace: každá věta něco předpokládá a bez sdíleného pozadí by
se rozhovor nemohl pohnout. Problémem není presupozice jako taková, ale presupozice, která
nese sporné tvrzení a je skryta před posouzením.

Manipulativní užití vkládá sporné tvrzení do předpokladu, aby se vyhnulo diskusi. V
obchodní komunikaci se presupozice používá k předpokládanému uzavření obchodu, v politické
řeči k podsunutí faktů, o nichž se nemá jednat, a v blízkých vztazích k vytváření
souvislého obrazu viny („až se zase začneš chovat jako tvoje matka“). Nejvyšší riziko
nesou presupozice v rozhovorech, jejichž výsledek má důsledky pro svědectví nebo právní
posouzení. Otázka, která předpokládá okolnost, o níž svědek nemluvil, může tuto okolnost do
jeho výpovědi vložit; proto forenzní standardy dávají přednost otevřeným otázkám bez
sugestivních předpokladů, jak popisuje stránka o [forenzním rozhovoru](@/kompendium/forensic-legal/1-forensic-interview-protocol.md).

## Stav důkazů

Lingvistická teorie presupozic je rozvinutá a dobře podložená, i když se vedou spory o
její přesné vymezení (Levinson 1983). Vliv formulace otázky na odpovědi a na pozdější
vzpomínky patří k nejlépe doloženým poznatkům psychologie svědectví (Loftus a Palmer
1974). Výzkum rámcování navíc ukázal, že logicky rovnocenné formulace vedou k odlišným
rozhodnutím (Tversky a Kahneman 1981). Tyto poznatky ukazují, že presupozice v jazyce
skutečně působí, a to i mimo vědomé posouzení. Neověřují však specifická tvrzení NLP, že
lze presupozicemi spolehlivě a cíleně měnit přesvědčení nebo chování posluchače, ani že
otázky meta-modelu mají vlastní terapeutický účinek. Kontrolovaných studií této kategorie
je v přehledech výzkumu NLP minimum a obor jako celek kritici hodnotí jako empiricky slabý
(Witkowski 2010; Passmore a Rowson 2019). Pro čtenáře plyne rozlišení: riziko presupozic
v otázkách je reálné a dobře doložené; tvrzení o jejich přesné ovladatelnosti nikoli.

## Obrana a zotavení

Základní obranou je předpoklad vyslovit dřív, než se odpoví na otázku. Na otázku „proč
jsi to zkazil?“ lze odpovědět, že nejdřív je třeba ujasnit, co se stalo a zda to vůbec
bylo zkažené. Na výběrovou otázku lze odpovědět, že existuje i třetí možnost, například
nepodepsat. Druhou obranou je zpomalení: presupozice působí nejsilněji v rychlém sledu
otázek, kdy adresát nemá čas posuzovat pozadí každé z nich. Třetí obranou je písemná
podoba: kdo si zapisuje, co bylo skutečně řečeno a dohodnuto, snáze odhalí předpoklady,
které se do rozhovoru vloudily bez souhlasu. Při výpovědi a podání vysvětlení má člověk
právo opravit předpoklad otázky a trvat na tom, aby oprava byla zaznamenána. Odborníci,
kteří vedou rozhovory se svědky nebo s klienty, chrání druhé tím, že formulují otázky
otevřeně a předpoklady, které nevyslovil sám dotazovaný, nevkládají (Loftus a Palmer
1974). U lidí, kterým byly dlouhodobě vkládány předpoklady o vlastní vině nebo
neschopnosti, se v klinické práci postupně oddělují vyslovené zkušenosti od převzatých
předpokladů a obnovuje se vědomí, které představy o sobě člověk sám ověřil a které jen
převzal (Herman 1992).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Erickson, M. H., Rossi, E. L., & Rossi, S. I. (1976). *Hypnotic Realities: The Induction of Clinical Hypnosis and Forms of Indirect Suggestion*. New York: Irvington.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Meta-model](@/kompendium/nlp-vzorce/meta-model/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Nominalizace](@/kompendium/nlp-vzorce/meta-model/nominalizace.md) – příbuzné heslo (Meta-model, Nominalisation)
- [Presupozice v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/presupozice-milton.md) – příbuzné heslo (Milton-model, Presuppositions (Milton Model))
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – příbuzné heslo (Jazykové presupozice, Linguistic presuppositions)
- [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) – příbuzné heslo (Jazykové presupozice, Loaded questions)
- [Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md) – příbuzné heslo (Jazykové presupozice, Presuppositions in questioning and testimony)

**V kompendiu**

- [Forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.2.1 Falešné dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Kognitivní biasy](@/kompendium/03-zakladni-kategorie/biasy/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Komplexní ekvivalence](@/kompendium/nlp-vzorce/meta-model/komplexni-ekvivalence.md) – předchozí heslo rodiny
- [Pořadí otázek meta-modelu](@/kompendium/nlp-vzorce/meta-model/hierarchie-otazek-meta-modelu.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
