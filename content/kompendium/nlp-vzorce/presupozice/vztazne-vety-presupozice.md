+++
title = "Vztažné věty jako presupozice"
description = "Vztažná věta jako místo, kam lze uložit sporné tvrzení tak, aby prošlo jako známé pozadí: struktura, detekční znaky, legitimní užití a obrana."
weight = 13
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Vztažné věty jako presupozice", "Relative clauses", "presupozice vztažné věty", "vložené vedlejší tvrzení", "Jazykové presupozice", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-06.13"
nlp_slug = "vztazne-vety-presupozice"
nlp_family = "presupozice"
nlp_family_code = "06"
nlp_family_title = "Jazykové presupozice"
nlp_family_en = "Linguistic presuppositions"
nlp_part = "presupozice.b"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Relative clauses"
nlp_aliases = ["presupozice vztažné věty", "vložené vedlejší tvrzení"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = "jazykove-presupozice"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["jazykove-presupozice"]
nlp_related = ["nominalizace", "existencni-presupozice", "komentarova-adverbia", "rozstepene-vety", "slovni-baliky"]
nlp_related_declared = ["existencni-presupozice", "komentarova-adverbia", "nominalizace", "slovni-baliky"]
nlp_kompendium = ["kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md", "kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md"]
nlp_links_prose = ["kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md", "kompendium/nlp-vzorce/presupozice/existencni-presupozice.md", "kompendium/nlp-vzorce/presupozice/komentarova-adverbia.md", "kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md"]
nlp_prev = "otazky-s-presupozici"
nlp_next = "kontrafaktualni-podminky"
nlp_position = 13
nlp_family_size = 19
nlp_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "grice-1975", "heap-1988", "herman-1992", "levinson-1983", "lifton-1961", "mcguire-1964", "petty-cacioppo-1986", "tosey-mathison-2009", "witkowski-2010"]
nlp_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
nlp_sources_roots = ["grice-1975", "levinson-1983"]
nlp_sources_critical = ["heap-1988", "herman-1992", "lifton-1961", "mcguire-1964", "petty-cacioppo-1986", "tosey-mathison-2009", "witkowski-2010"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/presupozice.b.toml"
+++

# Vztažné věty jako presupozice

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.13` |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Relative clauses |
| **Jiné názvy** | presupozice vztažné věty, vložené vedlejší tvrzení |
| **Obecnější vzorec** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Vztažná věta je vedlejší věta, která blíže určuje podstatné jméno: „kolega, který vede
projekt“, „zpráva, kterou jsme dostali“. Kromě této určovací funkce nese i předpoklad. Kdo
řekne „ředitel, který loni zatajil ztrátu, dnes znovu kandiduje“, sděluje, že ředitel
kandiduje, a zároveň předpokládá, že loni zatajil ztrátu. Na hlavní sdělení může posluchač
odpovědět souhlasem nebo nesouhlasem, ale obsah vztažné věty se tímto sporem nezpochybní.
Lingvistická pragmatika uvádí vztažné věty mezi spouštěči presupozic; zvlášť výrazně se
předpoklad projevuje u vět, které podstatné jméno neomezují, ale jen o něm přidávají
informaci, takzvaných vět nerestriktivních (Levinson 1983). Pro kompendium je vztažná věta
důležitá tím, že je to jeden z nejméně nápadných způsobů, jak do výpovědi vložit hodnocení,
obvinění nebo údajný fakt, a vyhnout se tomu, aby o něm adresát začal mluvit.

## Původ a souvislosti

Rozlišení mezi vztažnými větami, které vymezují, o kom nebo o čem je řeč, a těmi, které jen
doplňují informaci, je v gramatice staré. Teorie presupozic ukázala, že oba druhy se v
rozhovoru chovají odlišně: omezující věta předpokládá existenci určité osoby nebo věci s
danou vlastností, kdežto doplňující věta předkládá svůj obsah jako samozřejmé pozadí
hlavního sdělení (Levinson 1983). V angličtině rozdíl značí interpunkce. Čeština odděluje
čárkou každou vztažnou větu, takže v psaném textu se rozdíl ztrácí a o významu rozhoduje
kontext; věta „úředníci, kteří berou úplatky, by měli odejít“ může mluvit o některých
úřednících, nebo mlčky o všech. Tato dvojznačnost dává mluvčímu prostor, aby v případě
námitky tvrdil, že myslel užší význam.

Neurolingvistické programování zařadilo vztažné věty do přehledu syntaktických prostředí
presupozic, který převzalo z lingvistiky své doby (Bandler a Grinder 1975). V Milton-modelu
pak slouží k tomu, aby sugesce zazněla jako vedlejší informace o něčem jiném, a nebyla tak
předmětem pozornosti (Bandler a Grinder 1975b). S tímto heslem úzce souvisejí
[existenční presupozice](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md),
kde předpoklad nese samotné určité pojmenování, a
[komentářová příslovce a přídavná jména](@/kompendium/nlp-vzorce/presupozice/komentarova-adverbia.md),
která hodnocení vkládají přímo do přívlastku.

## Struktura vzorce

Výpověď s presupozicí ve vztažné větě má hlavní sdělení a vložené vedlejší tvrzení. Hlavní
sdělení je obvykle neutrální nebo málo sporné, aby nevyvolalo odpor: někdo volal, něco se
koná, někdo přijde. Vedlejší tvrzení nese obsah, o který mluvčímu skutečně jde, například
hodnocení osoby, obvinění nebo údajnou shodu skupiny. Z hlediska teorie konverzace posluchač
předpokládá, že mluvčí mluví pravdivě a k věci, a obsah vedlejší věty přijímá jako informaci,
kterou mluvčí považuje za známou nebo nespornou; zpochybnit ji by znamenalo odbočit od tématu
rozhovoru (Grice 1975). Model pravděpodobnosti elaborace doplňuje, že pozornost a kapacita
posluchače se soustřeďují na to, co je předmětem sdělení, kdežto okrajové prvky se zpracují
méně kriticky (Petty a Cacioppo 1986). Vedlejší tvrzení tedy těží z toho, že není hlavním
tématem.

Funkci vztažné věty mohou plnit i jiné konstrukce: přívlastek „ten jeho věčně opožděný
kolega“, přístavek „Novák, známý lhář, prý tvrdí…“ nebo přechodníkové a příčestí vazby,
které jsou v současné češtině méně časté, ale v úředním a novinářském stylu se objevují. Ve
všech případech platí, že hodnocení je zabudováno do pojmenování, a ne vysloveno jako
tvrzení. Lifton popsal v prostředí totalitní indoktrinace jev, který nazval nabíjením jazyka:
ustálená pojmenování nesou hodnocení skupiny, takže každé jejich užití je potvrzuje, aniž by
se o nich jednalo (Lifton 1961). Vztažné věty a přívlastky jsou jedním z gramatických
nosičů takového nabíjení.

Pro pozorovatele je užitečný test, který pragmatika používá k rozlišení presupozice od
tvrzení: obsah vztažné věty přetrvává, i když se hlavní věta zneguje, převede na otázku nebo
na podmínku. „Ředitel, který loni zatajil ztrátu, nekandiduje“, „kandiduje ředitel, který
loni zatajil ztrátu?“ i „pokud ředitel, který loni zatajil ztrátu, kandiduje, …“ stále
předpokládají zatajení (Levinson 1983). Pokud obsah vedlejší věty projde všemi třemi
proměnami beze změny, jde o předpoklad, nikoli o součást sporu, a je třeba ho posoudit
samostatně.

## Detekční znaky

Prvním znakem je nepoměr mezi důležitostí hlavního sdělení a vedlejší věty: banální zpráva,
k níž je připojeno závažné hodnocení nebo obvinění. Druhým znakem je vedlejší věta, která
obsahuje časová a kvantifikující slova jako „odjakživa“, „vždycky“, „jako všichni vědí“;
ta zobecňují hodnocení a zároveň ho vydávají za sdílené. Třetím znakem je opakování téhož
vedlejšího tvrzení v různých hlavních větách, takže se hodnocení upevňuje, aniž by bylo
jednou výslovně řečeno a doloženo. Kompendium tento způsob vytváření domnělé shody popisuje
u techniky [vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md).
Čtvrtým znakem je reakce mluvčího na otázku po vedlejším obsahu: přesměrování k hlavnímu
sdělení („o tom teď nemluvíme“) nebo dodatečné zúžení významu („myslel jsem jen některé“),
které využívá dvojznačnosti popsané výše (Levinson 1983). U adresáta se dlouhodobé
vystavení takovým větám projevuje tím, že přebírá hodnocení, o nichž neví, kdy je přijal;
to je jev známý z [detekční signatury gaslightingu](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md).

## Legitimní a manipulativní užití

Legitimní užití vztažných vět je běžné a nezbytné. Slouží k identifikaci osoby nebo věci
(„paní, která vede účetnictví“), k připomenutí sdíleného kontextu a k úsporné stavbě textu.
Obsah vedlejší věty je v takových případech nesporný, oběma stranám známý a snadno
ověřitelný a vedlejší věta jen pomáhá posluchači pochopit, o čem je řeč, což odpovídá
konverzačnímu požadavku na přiměřenou míru informace (Grice 1975). V terapii se vztažné
věty používají k připomenutí zdrojů, které klient sám uvedl („ta odvaha, o které jste mluvil
minule“); předpoklad tam vychází z klientova vlastního sdělení.

Manipulativní užití vkládá do vedlejší věty obsah, který je sporný, nový a slouží mluvčímu.
V osobních vztazích jde nejčastěji o hodnocení blízkých osob adresáta, které postupně
narušuje jeho sociální oporu; v organizacích o obvinění kolegy, které se šíří, aniž by ho
kdo výslovně vznesl; ve veřejném prostoru o charakteristiky protivníků, které se opakují
jako přívlastky. Lifton upozorňuje, že prostředí, které takto ovládá jazyk, ovládá i hranice
toho, co lze myslet (Lifton 1961). Rozlišujícím kritériem je vždy otázka, zda by mluvčí byl
ochoten a schopen vedlejší obsah vyslovit jako samostatné tvrzení a doložit ho.

## Stav důkazů

Lingvistický popis vztažných vět jako spouštěčů presupozic je zavedený, i když v podrobnostech
sporný; literatura diskutuje, zda obsah nerestriktivních vět je presupozicí v užším smyslu,
nebo jiným druhem nevyslovovaného obsahu, a jak se chová v souvětích (Levinson 1983). Obecný
poznatek psychologie přesvědčování, že méně pozorně zpracovaný obsah se hodnotí méně
kriticky, je experimentálně dobře podložený (Petty a Cacioppo 1986). Tvrzení NLP, že
sugesce umístěná do vedlejší věty spolehlivě obchází vědomou kritiku, se však opírá o rozbor
příkladů, ne o kontrolované experimenty (Bandler a Grinder 1975b). Kritické hodnocení NLP z
konce osmdesátých let konstatovalo, že obor má k dispozici málo empirických dokladů pro svá
specifická tvrzení, a pozdější přehledy tento závěr potvrdily (Heap 1988; Witkowski 2010).
Tosey a Mathison upozorňují, že síla NLP spočívá spíše v popisu jazykových jevů než v
ověřených tvrzeních o jejich účinku (Tosey a Mathison 2009). Čtenář by tedy měl jazykový jev
brát vážně, ale nepřeceňovat sílu účinku, kterou mu připisují příručky vlivu.

## Obrana a zotavení

Základní obranou je rozdělit větu na dvě. Kdo si v duchu nebo nahlas převede vedlejší obsah
na samostatné tvrzení, například „tvrdíš tedy, že mě využívá“, získá větu, ke které lze říct
„ne“ nebo požádat o doklad. Druhou obranou je odpovědět odděleně: nejprve na hlavní sdělení,
pak výslovně na vedlejší tvrzení, a nedovolit, aby souhlas s jedním zazněl jako souhlas s
druhým. Třetí obranou je sledovat opakování: zapsat si, která hodnocení se v řeči druhé
strany vracejí jako přívlastky, a zeptat se, kdy byla doložena. Výzkum odolnosti vůči
přesvědčování ukazuje, že znalost struktury vlivu předem posiluje schopnost mu odolat
(McGuire 1964). Pro lidi, kteří byli dlouhodobě vystaveni nabitému jazyku v kontrolujícím
vztahu nebo ve skupině, je součástí zotavení návrat k vlastním pojmenováním: popsat lidi a
události vlastními slovy, bez přívlastků převzatých zvenčí. Klinická literatura o zotavení
po dlouhodobé kontrole zdůrazňuje obnovu autonomie a vztahů, které kontrola narušila (Herman
1992); návrat k vlastním pojmenováním je jednou z praktických podob této obnovy.

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Nominalizace](@/kompendium/nlp-vzorce/meta-model/nominalizace.md) – příbuzný vzorec (Meta-model, Nominalisation)
- [Existenční presupozice](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md) – příbuzný vzorec (Jazykové presupozice, Existential presupposition)
- [Komentářová příslovce a přídavná jména](@/kompendium/nlp-vzorce/presupozice/komentarova-adverbia.md) – příbuzný vzorec (Jazykové presupozice, Commentary adverbs and adjectives)
- [Vytýkací konstrukce](@/kompendium/nlp-vzorce/presupozice/rozstepene-vety.md) – příbuzný vzorec (Jazykové presupozice, Cleft sentences)
- [Hodnotově nabitá slova](@/kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md) – příbuzný vzorec (Jazykové vzorce, Loaded words)

**V kompendiu**

- [EA-2.1.9 Vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [Detekční signatura: Gaslighting vzorec](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) – předchozí vzorec rodiny
- [Kontrafaktuální podmínky](@/kompendium/nlp-vzorce/presupozice/kontrafaktualni-podminky.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
