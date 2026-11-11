+++
title = "Presupozice spojky „nebo“"
description = "Nabídka „A, nebo B“, v níž obě možnosti předpokládají totéž rozhodnutí: lingvistický základ, vztah k iluzi volby a dvojné vazbě, detekce a obrana."
weight = 5
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Presupozice spojky „nebo“", "Use of „or“", "presupozice disjunkce", "volba mezi dvěma variantami téhož", "Jazykové presupozice", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-06.05"
catalog_slug = "presupozice-nebo"
catalog_family = "presupozice"
catalog_family_code = "06"
catalog_family_title = "Jazykové presupozice"
catalog_family_en = "Linguistic presuppositions"
catalog_part = "presupozice"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Use of „or“"
catalog_aliases = ["presupozice disjunkce", "volba mezi dvěma variantami téhož"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "jazykove-presupozice"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["jazykove-presupozice"]
catalog_related = ["potvrzeni-disjunktu", "falesne-dilema", "iluze-volby", "terapeuticka-dvojna-vazba", "sugesce-pokryvajici-vsechny-moznosti", "otazky-s-presupozici", "alternativni-zaver"]
catalog_related_declared = ["iluze-volby", "terapeuticka-dvojna-vazba", "sugesce-pokryvajici-vsechny-moznosti", "otazky-s-presupozici"]
catalog_kompendium = ["kompendium/techniques/ea-1-2-1-falesne-dilema.md", "kompendium/techniques/ea-5-4-30-paradox-volby-totalni.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/ericksonovska-hypnoza/sugesce-pokryvajici-vsechny-moznosti.md", "kompendium/nlp-vzorce/ericksonovska-hypnoza/terapeuticka-dvojna-vazba.md", "kompendium/nlp-vzorce/milton-model/iluze-volby.md", "kompendium/techniques/ea-1-2-1-falesne-dilema.md", "kompendium/techniques/ea-5-4-30-paradox-volby-totalni.md"]
catalog_prev = "poradove-cislovky"
catalog_next = "predikaty-uvedomeni"
catalog_position = 5
catalog_family_size = 19
catalog_sources = ["bandler-grinder-1975b", "bateson-1956", "erickson-rossi-rossi-1976", "grice-1975", "heap-1988", "kahneman-2011", "levinson-1983", "mcguire-1964", "miller-rollnick-2013", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975b"]
catalog_sources_roots = ["bateson-1956", "erickson-rossi-rossi-1976", "grice-1975", "levinson-1983"]
catalog_sources_critical = ["heap-1988", "kahneman-2011", "mcguire-1964", "miller-rollnick-2013", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Varianty", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/presupozice.toml"
+++

# Presupozice spojky „nebo“

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.05` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Use of „or“ |
| **Jiné názvy** | presupozice disjunkce, volba mezi dvěma variantami téhož |
| **Obecnější heslo** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Presupozice spojky „nebo“ vzniká tehdy, když výpověď nabízí na výběr dvě či více možností,
které mají společný předpoklad, a ten se tím vyjímá z rozhodování. Otázka „Podepíšete to
dnes, nebo až v pondělí?“ nabízí volbu termínu, ale obě odpovědi předpokládají, že se
podepíše. Adresát, který si vybere, vybírá uvnitř předpokladu, a tím ho potvrzuje. Přehled
Milton-modelu uvádí užití „nebo“ jako samostatnou kategorii presupozic, kterou terapeut může
použít k tomu, aby klientovi nechal volbu ve vedlejší otázce a hlavní výsledek předpokládal
(Bandler a Grinder 1975b). Katalog vzorec odlišuje od příbuzné
[iluze volby](@/kompendium/nlp-vzorce/milton-model/iluze-volby.md), která popisuje celou
konstrukci nabídky; tato stránka se soustředí na samotný jazykový mechanismus, tedy na to,
jak disjunkce nese společný předpoklad svých členů.

## Původ a souvislosti

Logika chápe disjunkci jako výrok pravdivý, když platí aspoň jeden z jeho členů. Přirozený
jazyk s ní zachází bohatěji. Levinson popisuje, že výpověď „A, nebo B“ běžně implikuje, že
mluvčí neví, který člen platí, a že neplatí oba zároveň; tyto významy nejsou součástí logické
spojky, ale vznikají z konverzačních zásad (Levinson 1983). Grice vyložil podobné jevy
principem kooperace a maximou kvantity: posluchač předpokládá, že mluvčí řekl tolik, kolik
je pro účel rozhovoru třeba (Grice 1975). Pro pochopení vzorce z toho plyne důležitá
interpretace. Nabídne-li mluvčí dvě možnosti, posluchač podle stejné logiky předpokládá, že
jsou to relevantní možnosti, a třetí, nevyslovenou, nehledá.

Erickson pracoval s nabídkou alternativ, z nichž každá vedla žádoucím směrem, a označoval
takovou formu jako dvojnou vazbu v terapeutickém smyslu: klient má skutečnou volbu, ale
všechny nabízené možnosti jsou pro léčbu přijatelné (Erickson, Rossi a Rossi 1976). Pojem
dvojné vazby přitom pochází z jiného kontextu. Bateson a spolupracovníci jím popsali
patologickou komunikaci, ve které člověk dostává protichůdné požadavky na různých úrovních a
nemůže situaci opustit ani ji komentovat (Bateson a kol. 1956). Ericksonovská „vazba“ je tedy
mírnější a z hlediska záměru terapeutická, ale sdílí s batesonovskou strukturu: rámec volby
určuje někdo jiný než ten, kdo volí. Katalog ji podrobněji popisuje v hesle
[Terapeutická dvojná vazba](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/terapeuticka-dvojna-vazba.md).

## Struktura vzorce

Vzorec má tři vrstvy. Nejvyšší je společný předpoklad, o kterém se má ve skutečnosti
rozhodovat: zda podepsat, zda se omluvit, zda vstoupit, zda něco přiznat. Prostřední vrstvou
jsou nabízené možnosti, které se liší jen v podružném rozměru, například v čase, místě,
formě nebo osobě, která čin vykoná. Nejnižší vrstvou je otázka, která se soustředí na rozdíl
mezi možnostmi a tím odvádí pozornost od toho, co mají společné (Bandler a Grinder 1975b). Adresát, který přemýšlí,
zda je výhodnější pondělí, nebo úterý, přemýšlí o tom, co nabídka zvýrazňuje, a nevidí to, co
nabídka předpokládá.

Výzkum rámování rozhodnutí ukázal, že způsob, jakým jsou možnosti popsány, mění volbu, i když
se objektivní stránka nemění (Tversky a Kahneman 1981). Presupozice „nebo“ jde dál: neovlivňuje
jen to, kterou možnost člověk zvolí, ale i to, které možnosti vůbec vidí. Zvláštní podobou je
nabídka, v níž jedna z možností je zjevně horší, takže druhá působí jako ústupek. V
kontrolujících vztazích se tak volba mezi dvěma podobami podřízení může prožívat jako
svoboda. Kompendium popisuje obecnou logiku uměle zúžené volby u
[falešného dilematu](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md) a její krajní podobu u
[paradoxu totální volby](@/kompendium/techniques/ea-5-4-30-paradox-volby-totalni.md).

## Varianty

Podle rozměru, ve kterém se nabízené možnosti liší, lze rozlišit několik typických podob.
Časová disjunkce („teď, nebo po obědě“) je nejčastější a nejméně nápadná. Disjunkce způsobu
(„úmyslně, nebo z nedbalosti“, „písemně, nebo ústně“) předpokládá samotný čin a je
nebezpečná zejména v obviňujícím rozhovoru, protože obě odpovědi jsou přiznáním. Disjunkce
osoby („řekneš to ty, nebo já“) předpokládá, že se něco stane, a ponechává volbu jen
vykonavatele. Rozšířenou podobou je nabídka, která vyjmenuje všechny myslitelné reakce a
každou předem vyloží jako potvrzení téhož; katalog ji popisuje jako
[sugesci pokrývající všechny možnosti](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/sugesce-pokryvajici-vsechny-moznosti.md)
(Erickson, Rossi a Rossi 1976).
Opačným pólem je ultimátum „buď, anebo“, ve kterém obě možnosti představují ztrátu a
společným předpokladem je, že adresát nemá právo situaci odmítnout. Ve všech podobách
platí, že rámec nabídky určil mluvčí a adresát vybírá uvnitř něj.

## Detekční znaky

Prvním znakem je otázka typu „A, nebo B?“, položená dřív, než padlo rozhodnutí o tom, co
mají A a B společné. Kontrolní postup pozorovatele spočívá v tom, že si obě možnosti
přeformuluje a hledá jejich společný jmenovatel: pokud je tento jmenovatel sporný, výpověď
ho předpokládá. Druhým znakem je, že nabízené možnosti se liší jen v podružných rysech, nejčastěji
v čase („teď, nebo zítra“) nebo ve formě („písemně, nebo ústně“). Třetím znakem je reakce
mluvčího na odmítnutí obou možností: kdo nabízí skutečnou volbu, třetí možnost přijme; kdo
předpokladem nahrazoval souhlas, obvykle tlačí zpět k původním dvěma, označí odmítnutí za
nerozhodnost nebo za obstrukci, případně přidá další dvojici se stejným předpokladem.
Čtvrtým znakem je časový tlak, který nedovolí zastavit se a podívat se na celek; rámec
rozhodnutí se pak přijme proto, že na jeho prozkoumání nezbyl čas (Kahneman 2011). U člověka,
na kterého se vzorec uplatňuje opakovaně, se objevuje pocit, že si „vždycky sám vybral“, a
přesto skončil tam, kam nechtěl, což často vede k sebeobviňování místo rozpoznání struktury.

## Legitimní a manipulativní užití

Legitimní užití nabídky dvou možností je běžné tam, kde společný předpoklad je už dohodnutý
nebo je nesporný. Asistentka, která nabízí úterý nebo čtvrtek pro schůzku, na kterou už byl
souhlas, šetří čas. V péči o děti nebo o lidi se sníženou kapacitou rozhodovat se nabídka dvou
přijatelných možností doporučuje proto, že zachovává pocit kontroly v situaci, kde samotný
cíl, například čištění zubů, není předmětem vyjednávání. V terapii je etickým korektivem
skutečnost, že společný předpoklad je klientův vlastní cíl, a že klient může rámec odmítnout
(Erickson, Rossi a Rossi 1976). Motivační rozhovor k tomu připojuje zásadu, že respekt k
autonomii zahrnuje i výslovné přiznání práva se nerozhodnout (Miller a Rollnick 2013).

Manipulativní užití staví do společného předpokladu rozhodnutí, které adresát dosud neučinil
a které slouží mluvčímu. Typické je v prodeji, kde se otázka „zda koupit“ nahradí otázkou
„kterou variantu“, ve vyšetřovacích rozhovorech, kde se otázka „zda jste to udělal“ nahradí
otázkou „udělal jste to úmyslně, nebo omylem“, a v kontrolujících vztazích, kde se volí jen
způsob, jakým se druhý podřídí. Ve vyšetřování je takové užití zvlášť rizikové, protože alternativní
otázka předpokládá, že platí jedna z nabídnutých možností (Levinson 1983), a obě odpovědi
proto představují přiznání činu.

## Stav důkazů

Konverzační významy spojky „nebo“ jsou v pragmatice dobře popsané (Levinson 1983) a
skutečnost, že formulace volby ovlivňuje rozhodnutí, je doložena výzkumem rámování (Tversky a
Kahneman 1981). Specifická tvrzení NLP, že presupozice „nebo“ spolehlivě obchází vědomé
rozhodování nebo vede k přijetí sugesce v transu, se opírají o kazuistiky a rozbor
Ericksonových sezení, ne o kontrolované experimenty (Bandler a Grinder 1975b). Rané hodnocení
NLP konstatovalo, že empiricky prověřená tvrzení oboru podporu nezískala (Heap 1988), a
pozdější rozbor výzkumné literatury NLP došel k závěru, že většina kontrolovaných studií tvrzení
oboru nepotvrzuje (Witkowski 2010). Tato stránka proto popisuje vzorec jako rozpoznatelnou
strukturu rozhovoru, jejíž účinek je pravděpodobný, ale nebyl samostatně změřen.

## Obrana a zotavení

Základní obranou je vyslovit to, co mají obě možnosti společné, a postavit to jako
samostatnou otázku: „Obě varianty předpokládají, že podepíšu; o tom jsem se ještě
nerozhodl.“ Druhou obranou je připomenout třetí možnost, kterou nabídka vynechala, ať je to
odklad, odmítnutí, nebo úplně jiné řešení. Třetí obranou je zpomalit; nabídka dvou možností
působí nejsilněji pod tlakem okamžitého výběru, a prosba o čas na rozmyšlenou je proto
legitimní odpovědí. Předchozí seznámení s typickými podobami vzorce zvyšuje pravděpodobnost,
že ho člověk v reálné situaci pozná, podobně jako očkování proti přesvědčování zvyšuje
odolnost vůči pozdějším argumentům (McGuire 1964). Pro zotavení po dlouhodobém působení
pomáhá přehodnotit vlastní „volby“ z minulosti: zjistit, které z nich byly volbami uvnitř
cizího předpokladu, a odlišit odpovědnost za výběr mezi nabízenými možnostmi od odpovědnosti
za rámec, který určil někdo jiný.

## Literatura

- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Bateson, G., Jackson, D. D., Haley, J., & Weakland, J. (1956). Toward a theory of schizophrenia. *Behavioral Science*, 1(4), 251–264.
- Erickson, M. H., Rossi, E. L., & Rossi, S. I. (1976). *Hypnotic Realities: The Induction of Clinical Hypnosis and Forms of Indirect Suggestion*. New York: Irvington.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Potvrzení disjunktu](@/kompendium/argumentacni-fauly/formalni/potvrzeni-disjunktu.md) – příbuzné heslo (Argumentační fauly: Formální klamy, Affirming a disjunct)
- [Falešné dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md) – příbuzné heslo (Argumentační fauly: Klamy předpokladu, False dilemma)
- [Iluze volby](@/kompendium/nlp-vzorce/milton-model/iluze-volby.md) – příbuzné heslo (Milton-model, Illusion of choice)
- [Terapeutická dvojná vazba](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/terapeuticka-dvojna-vazba.md) – příbuzné heslo (Ericksonovská hypnóza, Therapeutic double bind)
- [Sugesce pokrývající všechny možnosti](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/sugesce-pokryvajici-vsechny-moznosti.md) – příbuzné heslo (Ericksonovská hypnóza, Suggestion covering all possibilities)
- [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) – příbuzné heslo (Jazykové presupozice, Loaded questions)
- [Alternativní uzavření](@/kompendium/nlp-vzorce/vliv-a-zneuziti/alternativni-zaver.md) – příbuzné heslo (Vliv a zneužití NLP, Alternative close)

**V kompendiu**

- [EA-1.2.1 Falešné dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.4.30 Paradox totální volby](@/kompendium/techniques/ea-5-4-30-paradox-volby-totalni.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Pořadové číslovky](@/kompendium/nlp-vzorce/presupozice/poradove-cislovky.md) – předchozí heslo rodiny
- [Predikáty uvědomění](@/kompendium/nlp-vzorce/presupozice/predikaty-uvedomeni.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
