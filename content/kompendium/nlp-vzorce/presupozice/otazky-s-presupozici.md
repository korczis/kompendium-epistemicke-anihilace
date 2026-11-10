+++
title = "Otázky s presupozicí"
description = "Otázka, jejíž každá přímá odpověď potvrzuje sporný předpoklad tazatele: jak ji rozpoznat, odlišit od běžné otázky a jak na ni odpovídat bez přijetí předpokladu."
weight = 12
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
parent = "kompendium-nlp-vzorce-presupozice"
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Otázky s presupozicí", "Loaded questions", "komplexní otázka", "otázka s vneseným předpokladem", "kapciózní otázka", "Jazykové presupozice", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-06.12"
nlp_slug = "otazky-s-presupozici"
nlp_family = "presupozice"
nlp_family_code = "06"
nlp_family_title = "Jazykové presupozice"
nlp_family_en = "Linguistic presuppositions"
nlp_part = "presupozice.b"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Loaded questions"
nlp_aliases = ["komplexní otázka", "otázka s vneseným předpokladem", "kapciózní otázka"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "vysoke"
nlp_risk_cs = "vysoké"
nlp_broader = "jazykove-presupozice"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["jazykove-presupozice"]
nlp_related = ["presupozice-v-meta-modelu", "meta-model-jako-vyslychaci-nastroj", "vlozene-otazky", "rozsahova-dvojznacnost", "iluze-volby", "presupozice-milton", "jazykove-presupozice", "existencni-presupozice", "presupozice-nebo", "slovesa-zmeny-casu", "rozstepene-vety", "presupozice-ve-vyslechu", "otazky-vysledku", "otazky-misto-tvrzeni", "predpokladovy-zaver"]
nlp_related_declared = ["presupozice-ve-vyslechu", "presupozice-nebo", "vlozene-otazky", "otazky-misto-tvrzeni", "meta-model-jako-vyslychaci-nastroj", "iluze-volby"]
nlp_kompendium = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/techniques/ea-1-2-1-falesne-dilema.md"]
nlp_links_prose = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/nlp-vzorce/jazykove-vzorce/otazky-misto-tvrzeni.md", "kompendium/nlp-vzorce/milton-model/milton-model.md", "kompendium/nlp-vzorce/milton-model/vlozene-otazky.md", "kompendium/nlp-vzorce/presupozice/presupozice-nebo.md", "kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md", "kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md", "kompendium/nlp-vzorce/vliv-a-zneuziti/alternativni-zaver.md", "kompendium/techniques/ea-1-2-1-falesne-dilema.md"]
nlp_prev = "srovnavaci-presupozice"
nlp_next = "vztazne-vety-presupozice"
nlp_position = 12
nlp_family_size = 19
nlp_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "grice-1975", "herman-1992", "kahneman-2011", "levinson-1983", "lilienfeld-2015", "loftus-palmer-1974", "mcguire-1964", "miller-rollnick-2013", "sharpley-1987", "witkowski-2010", "van-der-linden-2023"]
nlp_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
nlp_sources_roots = ["grice-1975", "levinson-1983"]
nlp_sources_critical = ["herman-1992", "kahneman-2011", "lilienfeld-2015", "loftus-palmer-1974", "mcguire-1964", "miller-rollnick-2013", "sharpley-1987", "witkowski-2010", "van-der-linden-2023"]
nlp_citations = 21
nlp_words = 1298
nlp_reading_minutes = 6
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/presupozice.b.toml"
+++

# Otázky s presupozicí

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.12` |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Loaded questions |
| **Jiné názvy** | komplexní otázka, otázka s vneseným předpokladem, kapciózní otázka |
| **Obecnější vzorec** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Otázka s presupozicí je otázka, která do své podoby vkládá sporné tvrzení, takže každá
přímá odpověď je zároveň jeho potvrzením. Kdo se ptá „kolikrát jste letos řídil opilý?“,
nežádá informaci o tom, zda se něco stalo, ale jen o tom, jak často. Odpověď číslem, i nulou
vyslovenou bez námitky, přijímá rámec otázky. Pragmatika popisuje obecné pravidlo, podle
něhož otázka s tázacím slovem předpokládá pravdivost výroku, který vznikne nahrazením
tázacího slova neurčitým výrazem: „kdo to vzal?“ předpokládá, že to někdo vzal (Levinson
1983). Otázka „ano, nebo ne“ předpokládá jen to, že jedna z odpovědí platí, a je proto
mnohem méně zatížená; otázka se dvěma nabídnutými alternativami předpokládá, že platí právě
jedna z nich, čímž se blíží [presupozici spojky „nebo“](@/kompendium/nlp-vzorce/presupozice/presupozice-nebo.md).
Logika a rétorika znají tento jev od antiky jako klam mnoha otázek nebo komplexní otázku;
český právní jazyk pro její úmyslné užití používá označení kapciózní otázka.

## Původ a souvislosti

Úvaha o otázkách, které spojují dvě otázky do jedné, se objevuje už v Aristotelově rozboru
sofistických vyvracení a středověká logika ji vedla pod jménem klamu mnoha otázek. Moderní
lingvistika jev zařadila do teorie presupozic a ukázala, že jde o pravidelnou vlastnost
tázacích konstrukcí, ne o zvláštní rétorický trik: předpoklad otázky se chová stejně jako
předpoklad oznamovací věty a přetrvává, i když se otázka zneguje (Levinson 1983). Teorie
konverzace doplnila, proč je pro tázaného obtížné takovou otázku odmítnout. Rozhovor je
kooperativní činnost a otázka vytváří očekávání odpovědi, která je relevantní a obsahuje
právě tolik informace, kolik je třeba; odpověď, která místo toho zpochybní samotnou otázku,
působí jako porušení této kooperace a vyžaduje vysvětlení (Grice 1975).

Neurolingvistické programování převzalo otázky do svého seznamu syntaktických prostředí
presupozic spolu s otázkami zápornými a řečnickými (Bandler a Grinder 1975). [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) je
pak používá v obráceném smyslu: otázka, jejíž předpoklad obsahuje žádoucí změnu, například
dotaz na to, co klient zaznamená jako první, až se změna dostaví, má podle NLP změnu
předložit jako samozřejmou a obrátit pozornost jen k jejím podrobnostem (Bandler a Grinder
1975b). Příbuzné jevy popisují hesla [Vložené otázky](@/kompendium/nlp-vzorce/milton-model/vlozene-otazky.md)
a [Otázky místo tvrzení](@/kompendium/nlp-vzorce/jazykove-vzorce/otazky-misto-tvrzeni.md).

## Struktura vzorce

Otázka s presupozicí má otevřenou a uzavřenou část. Otevřená část je mezera, kterou má
tázaný vyplnit, například čas, důvod, počet nebo způsob. Uzavřená část je vše ostatní a
tvoří předpoklad. Tázaný, který se soustředí na vyplnění mezery, uzavřenou část akceptuje,
protože na ni otázka nežádá reakci. Aby ji odmítl, musí udělat krok, kterému se v
pragmatice říká odmítnutí předpokladu: místo odpovědi na otázku pojmenovat, co otázka
předpokládá, a říct, že to neplatí. Tento krok je kognitivně náročnější, sociálně
nákladnější a v rychlém sledu otázek snadno nezazní.

Psychologie úsudku k tomu přidává mechanismus, který popisuje Kahneman: rychlé, intuitivní
myšlení staví souvislý příběh z toho, co má právě k dispozici, a nevěnuje pozornost tomu,
co v podaných informacích chybí (Kahneman 2011). Otázka vymezuje, co je „k dispozici“, a tím
i prostor možných odpovědí. Experimenty s formulací otázek ukázaly, že nejde jen o okamžitou
odpověď. Když se účastníci po zhlédnutí filmu s dopravní nehodou ptali na rychlost aut
slovesem, které nehodu líčilo jako prudký střet, odhadovali vyšší rychlost a po týdnu
častěji uváděli, že viděli rozbité sklo, které ve filmu nebylo (Loftus a Palmer 1974).
Předpoklad otázky se tedy může stát součástí vzpomínky dotazovaného.

Zvlášť silné zatížení vzniká, když se otázka spojí s jiným spouštěčem. Otázka „už jste
přestal…?“ kombinuje tázací formu se slovesem změny stavu, takže odpověď „ano“ i „ne“
potvrzuje, že dotyčný dříve dělal to, na co se otázka ptá; tomuto spojení se věnuje heslo
[Slovesa změny času a stavu](@/kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md).
Podobně působí otázka s částicí „zase“ nebo „ještě“, která předpokládá opakování. V obou
případech platí, že čím víc spouštěčů jediná otázka obsahuje, tím víc předpokladů by tázaný
musel samostatně odmítnout, a tím menší je pravděpodobnost, že to v živém rozhovoru udělá
(Levinson 1983).

## Detekční znaky

Prvním znakem je otázka s tázacím slovem „proč“, „kdy“, „jak dlouho“ nebo „kolikrát“, jejíž
nevyplněná část obsahuje sporný děj nebo vlastnost, o kterém se dosud nemluvilo. Druhým
znakem je, že všechny přirozené odpovědi vedou ke stejnému závěru; pokud si pozorovatel
zkusí představit tři různé odpovědi a všechny potvrzují totéž, předpoklad nese otázka.
Třetím znakem jsou záporné otázky typu „nebyl jste tam náhodou vy?“, které kromě předpokladu
nesou i očekávanou odpověď, a řečnické otázky, na které se odpověď nečeká vůbec (Bandler a
Grinder 1975). Čtvrtým znakem je rytmus: řada rychlých otázek, z nichž každá staví na
předpokladu předchozí, takže odmítnutí první otázky už nepřichází v úvahu. Pátým znakem je
reakce na odmítnutí předpokladu. Tazatel v dobré víře předpoklad ochotně vysloví a doloží;
tazatel, který předpokladem nahrazoval důkaz, označí odmítnutí za vyhýbání se odpovědi.
Právě v tom se projevuje sociální tlak, o kterém mluví teorie konverzace (Grice 1975).

## Legitimní a manipulativní užití

Ne každá otázka s předpokladem je problematická. Většina běžných otázek něco předpokládá a
v rozhovoru by nebylo možné neustále dokládat sdílená východiska; otázka „kdy vám vyhovuje
dohodnutý termín?“ je kooperativní, protože předpoklad je známý a ověřitelný (Grice 1975).
V terapii a poradenství se otázky, které předpokládají možnost změny, používají k tomu, aby
klient mohl mluvit o svém cíli jako o něčem dosažitelném. Etická hranice leží tam, kde
předpoklad vychází z cíle, který klient sám formuloval, a kde klient může otázku bez
následků odmítnout. Motivační rozhovory zdůrazňují otevřené otázky a respekt k autonomii
klienta, což je opačný princip než vnášení předpokladu zvenčí (Miller a Rollnick 2013).

Manipulativní užití se pozná podle obsahu a podle uspořádání moci. Předpoklad je sporný,
týká se viny, motivu nebo slabosti tázaného a slouží zájmu tazatele. Objevuje se v
přesvědčovacích rozhovorech, v nichž otázka „kterou variantu si vezmete?“ předpokládá, že
koupě je už rozhodnutá (viz [Alternativní uzavření](@/kompendium/nlp-vzorce/vliv-a-zneuziti/alternativni-zaver.md)),
v mediálních a politických debatách, kde jediná otázka může publiku předat obvinění, které by
jako tvrzení vyžadovalo doklad, a v kontrolujících vztazích, kde výslech „proč jsi zase…“
vytváří obraz opakovaného selhání. Nejzávažnější je užití ve vyšetřování a v soudní síni,
kde předpoklad otázky může vstoupit do výpovědi; proto standardy
[forenzního rozhovoru](@/kompendium/forensic-legal/1-forensic-interview-protocol.md)
dávají přednost otevřeným výzvám bez vneseného obsahu. Tomuto kontextu se věnuje heslo
[Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md).
Strukturálně blízký je i [falešné dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md),
kde otázka nabízí dvě možnosti a mlčky vylučuje všechny ostatní.

## Stav důkazů

Lingvistický popis otázek jako spouštěčů presupozic je dobře zavedený a nesporný (Levinson
1983). Empiricky je doloženo, že formulace otázky ovlivňuje odpověď i pozdější vzpomínku;
experiment s nehodou se stal jedním z nejcitovanějších dokladů toho, že jazyk otázky se může
promítnout do paměti (Loftus a Palmer 1974). Tento výzkum ovšem netestoval tvrzení NLP, ale
obecný psychologický mechanismus. Specifická tvrzení NLP, podle nichž otázky s předpokladem
v terapeutickém nebo hypnotickém kontextu spolehlivě vyvolávají změnu nebo obcházejí kritické
posouzení, se opírají o rozbor ukázek, ne o kontrolované srovnání (Bandler a Grinder 1975b).
Přehledy výzkumu NLP nenacházejí pro testovatelná tvrzení oboru podporu a upozorňují na
nízkou kvalitu dostupných studií (Sharpley 1987; Witkowski 2010). Přehledová literatura o
pseudovědeckých postupech v klinické psychologii zároveň varuje před sugestivním dotazováním
v terapii, zejména tam, kde se pracuje s pamětí (Lilienfeld, Lynn a Lohr 2015). Závěr je tedy
dvojí: mechanismus je reálný a dobře doložený, ale NLP mu nepřidává ověřené poznání.

## Obrana a zotavení

Nejúčinnější obranou je neodpovídat na mezeru, ale na předpoklad. Formulace typu „vaše
otázka předpokládá, že…, a to neplatí“ vrací předpoklad do vrstvy, o které se jedná. Druhou
obranou je požádat o rozložení otázky na části: nejprve zda se věc stala, teprve potom kdy,
proč a kolikrát. Třetí obranou je zpomalit, zvlášť v rychlém sledu otázek; prosba o čas, o
písemnou formu nebo o přítomnost třetí osoby dává prostor předpoklady rozpoznat. Výzkum
očkování proti přesvědčování a jeho novější podoba v podobě předběžného vysvětlení
manipulativních technik ukazují, že kdo zná strukturu vlivu předem, rozpozná ji rychleji
a podlehne jí méně (McGuire 1964; van der Linden 2023). U lidí, kteří byli dlouhodobě
vystaveni otázkám s předpokladem viny nebo selhání, je součástí zotavení zpětné rozložení:
vypsat, co otázky předpokládaly, a posoudit každý předpoklad zvlášť. To pomáhá oddělit
skutečné události od obrazu, který vytvořila forma otázek, a obnovit důvěru ve vlastní
popis toho, co se stalo (Herman 1992).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Lilienfeld, S. O., Lynn, S. J., & Lohr, J. M. (Eds.) (2015). *Science and Pseudoscience in Clinical Psychology* (2. vyd.). New York: Guilford Press.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.
- van der Linden, S. (2023). *Foolproof: Why Misinformation Infects Our Minds and How to Build Immunity*. London: 4th Estate.

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Presupozice v meta-modelu](@/kompendium/nlp-vzorce/meta-model/presupozice-v-meta-modelu.md) – příbuzný vzorec (Meta-model, Presuppositions (Meta Model))
- [Meta-model jako výslechový nástroj](@/kompendium/nlp-vzorce/meta-model/meta-model-jako-vyslychaci-nastroj.md) – příbuzný vzorec (Meta-model, Meta Model as an interrogation tool)
- [Vložené otázky](@/kompendium/nlp-vzorce/milton-model/vlozene-otazky.md) – příbuzný vzorec (Milton-model, Embedded questions)
- [Rozsahová dvojznačnost](@/kompendium/nlp-vzorce/milton-model/rozsahova-dvojznacnost.md) – příbuzný vzorec (Milton-model, Scope ambiguity)
- [Iluze volby](@/kompendium/nlp-vzorce/milton-model/iluze-volby.md) – příbuzný vzorec (Milton-model, Illusion of choice)
- [Presupozice v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/presupozice-milton.md) – příbuzný vzorec (Milton-model, Presuppositions (Milton Model))
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – příbuzný vzorec (Jazykové presupozice, Linguistic presuppositions)
- [Existenční presupozice](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md) – příbuzný vzorec (Jazykové presupozice, Existential presupposition)
- [Presupozice spojky „nebo“](@/kompendium/nlp-vzorce/presupozice/presupozice-nebo.md) – příbuzný vzorec (Jazykové presupozice, Use of „or“)
- [Slovesa změny času a stavu](@/kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md) – příbuzný vzorec (Jazykové presupozice, Change-of-time verbs and adverbs)
- [Vytýkací konstrukce](@/kompendium/nlp-vzorce/presupozice/rozstepene-vety.md) – příbuzný vzorec (Jazykové presupozice, Cleft sentences)
- [Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md) – příbuzný vzorec (Jazykové presupozice, Presuppositions in questioning and testimony)
- [Otázky výsledku](@/kompendium/nlp-vzorce/cile-a-vysledky/otazky-vysledku.md) – příbuzný vzorec (Cíle a výsledky, Outcome questions)
- [Otázky místo tvrzení](@/kompendium/nlp-vzorce/jazykove-vzorce/otazky-misto-tvrzeni.md) – příbuzný vzorec (Jazykové vzorce, Questions instead of statements)
- [Předpokládané uzavření](@/kompendium/nlp-vzorce/vliv-a-zneuziti/predpokladovy-zaver.md) – příbuzný vzorec (Vliv a zneužití NLP, Assumptive close)

**V kompendiu**

- [Forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-1.2.1 Falešné dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Srovnávací presupozice](@/kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md) – předchozí vzorec rodiny
- [Vztažné věty jako presupozice](@/kompendium/nlp-vzorce/presupozice/vztazne-vety-presupozice.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
