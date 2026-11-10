+++
title = "Komentářová příslovce a přídavná jména"
description = "Příslovce jako naštěstí, samozřejmě nebo bohužel a hodnoticí přívlastky předpokládají obsah věty a přidávají k němu hodnocení, o kterém se nejedná; detekce a obrana."
weight = 7
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Komentářová příslovce a přídavná jména", "Commentary adverbs and adjectives", "hodnoticí příslovce", "naštěstí, samozřejmě, bohužel", "Jazykové presupozice", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-06.07"
catalog_slug = "komentarova-adverbia"
catalog_family = "presupozice"
catalog_family_code = "06"
catalog_family_title = "Jazykové presupozice"
catalog_family_en = "Linguistic presuppositions"
catalog_part = "presupozice"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Commentary adverbs and adjectives"
catalog_aliases = ["hodnoticí příslovce", "naštěstí, samozřejmě, bohužel"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "jazykove-presupozice"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["jazykove-presupozice"]
catalog_related = ["ztraceny-performativ", "komplexni-ekvivalence", "truismy", "ztraceny-performativ-milton", "kvalifikatory-jen-i", "vztazne-vety-presupozice", "faktivni-slovesa", "slovni-baliky"]
catalog_related_declared = ["ztraceny-performativ", "ztraceny-performativ-milton", "truismy", "komplexni-ekvivalence"]
catalog_kompendium = ["kompendium/techniques/ea-1-4-2-latentni-emocionalni-modulace.md", "kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/meta-model/komplexni-ekvivalence.md", "kompendium/nlp-vzorce/meta-model/ztraceny-performativ.md", "kompendium/nlp-vzorce/milton-model/truismy.md", "kompendium/nlp-vzorce/presupozice/existencni-presupozice.md", "kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md", "kompendium/techniques/ea-1-4-2-latentni-emocionalni-modulace.md"]
catalog_prev = "predikaty-uvedomeni"
catalog_next = "slovesa-zmeny-casu"
catalog_position = 7
catalog_family_size = 19
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "beck-1976", "grice-1975", "levinson-1983", "roderique-davies-2009", "tversky-kahneman-1981", "watzlawick-1967", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
catalog_sources_roots = ["grice-1975", "levinson-1983", "watzlawick-1967"]
catalog_sources_critical = ["beck-1976", "roderique-davies-2009", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Varianty", "Odlišení od příbuzných jevů", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/presupozice.toml"
+++

# Komentářová příslovce a přídavná jména

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.07` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Commentary adverbs and adjectives |
| **Jiné názvy** | hodnoticí příslovce, naštěstí, samozřejmě, bohužel |
| **Obecnější heslo** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Komentářová příslovce a přídavná jména jsou slova, kterými mluvčí k výpovědi připojuje
vlastní postoj: „naštěstí“, „bohužel“, „samozřejmě“, „pochopitelně“, „zjevně“, „nepochybně“,
„přirozeně“, „bezpochyby“, nebo hodnoticí přívlastek typu „tvoje zbytečná scéna“. Výpověď
„Naštěstí jsi to nakonec přiznal“ předpokládá, že adresát něco přiznal, a zároveň nese
hodnocení, že je to příznivé. Ani předpoklad, ani hodnocení nejsou předmětem tvrzení; tvrdí se
jen to, že k přiznání došlo nakonec. Přehled Milton-modelu uvádí komentářová příslovce a
přídavná jména jako kategorii presupozic, kterou lze obsah věty předložit jako samozřejmý a
komentovat jen jeho okolnosti (Bandler a Grinder 1975b). Pro kompendium je vzorec důležitý
tím, že spojuje dvě nevyslovené vrstvy: pravdivost obsahu a jeho hodnocení. Adresát, který
chce odmítnout hodnocení, obvykle mimoděk přijme obsah, a naopak.

## Původ a souvislosti

Filozofie jazyka rozlišuje mezi tím, co výpověď tvrdí, a tím, co sděluje jinak. Grice zavedl
vedle konverzačních implikatur také implikatury konvenční, tedy významy, které se k výrazu
vážou samotným jeho slovem, ale nepatří k tomu, co bylo ve vlastním smyslu řečeno; jeho
příkladem bylo slovo „tedy“, které sděluje, že jedno plyne z druhého, aniž by to mluvčí
tvrdil (Grice 1975). Levinson rozvádí tento pojem a ukazuje, že takové významy nejsou
součástí pravdivostních podmínek věty a nedají se běžným způsobem popřít (Levinson 1983).
Komentářová příslovce lze vyložit podobně: „bohužel“ sděluje postoj mluvčího, ale věta s ním
je pravdivá, nebo nepravdivá stejně jako věta bez něj. Hodnocení tak vstupuje do rozhovoru,
aniž by se o něm dalo jednat jako o tvrzení.

Bandler a Grinder si v meta-modelu všímali výroků, ve kterých zaznívá hodnocení bez toho, kdo
hodnotí, a nazvali je [ztraceným performativem](@/kompendium/nlp-vzorce/meta-model/ztraceny-performativ.md)
(Bandler a Grinder 1975). Komentářové příslovce je často právě takovým hodnocením: „samozřejmě“
neříká, pro koho je věc samozřejmá, a „naštěstí“ neříká, komu je to ku prospěchu. Teorie
komunikace k tomu připojuje rozlišení obsahové a vztahové roviny sdělení: každé sdělení
vypovídá nejen o věci, ale i o vztahu mezi mluvčími (Watzlawick, Beavin a Jackson 1967).
Komentářové příslovce je typickým nositelem vztahové roviny, protože určuje, kdo v rozhovoru
hodnotí a kdo je hodnocen.

## Struktura vzorce

Vzorec má tři složky. První je obsah věty, který se předpokládá a nezpochybňuje. Druhá je
komentář, který obsah hodnotí z pozice mluvčího, ale bez výslovného „já si myslím“. Třetí je
vlastní tvrzení věty, často podružné, ke kterému se pozornost adresáta upírá. U příslovcí
samozřejmosti („samozřejmě“, „zjevně“, „pochopitelně“) přistupuje ještě čtvrtý prvek:
předpoklad, že obsah je obecně známý, takže kdo ho zpochybní, staví se mimo okruh rozumných
lidí. V tom se vzorec blíží [truismům](@/kompendium/nlp-vzorce/milton-model/truismy.md), tedy
výrokům, se kterými nelze rozumně nesouhlasit, jen s tím rozdílem, že komentářové příslovce
dokáže samozřejmost připojit i ke spornému obsahu.

Na úrovni zpracování lze účinek vyložit výzkumem rámování: tentýž výsledek popsaný jako zisk,
nebo jako ztráta vede lidi k odlišným rozhodnutím (Tversky a Kahneman 1981). Příslovce
„naštěstí“ a „bohužel“ jsou nejkratšími prostředky takového rámování. Neposouvají fakta, ale
určují, jak se k nim má posluchač emočně vztáhnout. Kompendium popisuje skryté řízení
emočního vyznění výpovědí u [latentní emocionální modulace](@/kompendium/techniques/ea-1-4-2-latentni-emocionalni-modulace.md);
komentářová příslovce jsou jedním z jejích jazykových prostředků.

## Varianty

Lze rozlišit tři skupiny. Příslovce hodnocení („naštěstí“, „bohužel“, „bohudík“, „zaplaťpánbůh“)
určují emoční znaménko události. Příslovce samozřejmosti a jistoty („samozřejmě“, „zjevně“,
„nepochybně“, „jak každý ví“) předkládají obsah jako nesporný a nesouhlas jako výstřednost.
Hodnoticí přívlastky („tvoje zbytečná hysterie“, „ta nešťastná chyba“, „tvoje pochopitelná
nejistota“) vkládají hodnocení přímo do pojmenování a spojují se tak s
[existenční presupozicí](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md).
Zvláštním případem je „pochopitelně“ nebo „samozřejmě chápu“ vztažené k emocím adresáta:
mluvčí tím projevuje porozumění, ale zároveň určuje, co adresát cítí a že je to přechodná
reakce, kterou lze shovívavě přejít.

## Odlišení od příbuzných jevů

Komentářová příslovce je třeba odlišit od několika podobných prostředků. Zmírňující výrazy
jako „možná“, „snad“ nebo „zdá se mi“ hodnocení nepředpokládají, ale naopak oslabují a dávají
posluchači prostor nesouhlasit; jsou to v jistém smyslu opačné nástroje. Ironie užívá
hodnoticích slov s obráceným významem a posluchač ji zpravidla rozpozná jako hru, ne jako
předpoklad. Otevřeně vyslovený názor („myslím si, že to byla chyba“) hodnocení nese, ale nese
ho jako tvrzení s uvedeným hodnotitelem, ke kterému se lze vyjádřit. Od
[komplexní ekvivalence](@/kompendium/nlp-vzorce/meta-model/komplexni-ekvivalence.md), která
výslovně spojuje chování s významem („když mlčíš, znamená to, že…“), se komentářové příslovce
liší tím, že význam nevysloví, jen ho připojí. Pro detekci je proto rozhodující, zda
hodnocení stojí v pozici tvrzení, nebo v pozici předpokladu.

## Detekční znaky

Prvním znakem je příslovce samozřejmosti připojené k tvrzení, které samozřejmé není.
Kontrolní postup spočívá v tom, že pozorovatel příslovce převede na samostatnou větu s
uvedeným hodnotitelem: „samozřejmě jsi to pokazil“ se změní na „já tvrdím, že jsi to pokazil,
a považuji to za samozřejmé“. Pokud tato podoba vyžaduje zdůvodnění, které výpověď neobsahuje,
komentář zakrýval tvrzení. Druhým znakem je hodnoticí přívlastek u pojmenování adresátova
chování nebo pocitů. Třetím znakem je, že hodnocení se v rozhovorech opakuje, ale nikdy není
vysloveno jako názor, se kterým by šlo nesouhlasit. U adresáta se při dlouhodobém působení
objevuje sklon přebírat hodnocení do vlastního popisu událostí; vlastní zkušenost pak popisuje
slovy mluvčího. Takový posun souvisí s tím, co kompendium popisuje jako
[strategickou reinterpretaci](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md):
událost zůstává stejná, mění se její výklad (Watzlawick, Beavin a Jackson 1967).

## Legitimní a manipulativní užití

Legitimní užití je všudypřítomné. Lidé běžně vyjadřují postoj k tomu, co sdělují, a
příslovce jako „bohužel“ jsou zdvořilou cestou, jak ohlásit nepříjemnou zprávu. Podle
principu kooperace posluchač takový komentář chápe jako postoj mluvčího, ne jako tvrzení o
světě (Grice 1975). V terapii může komentář vyjadřovat podporu nebo uznání, například
„pochopitelně je to pro vás těžké“, pokud tím terapeut potvrzuje zkušenost, kterou klient
sám vyslovil. Hranicí je, zda komentář zkušenost klienta zrcadlí, nebo ji teprve definuje.

Manipulativní užití staví do komentáře hodnocení, které by jako tvrzení neobstálo, a činí z
něj rámec, ve kterém se o věci mluví. Je typické v konfliktech, ve kterých jedna strana
hodnotí druhou („samozřejmě zase přeháníš“), v institucích, které komentují kritiku („tato
bohužel nepodložená stížnost“), a v rétorice, která vydává sporná tvrzení za obecně známá
(„jak samozřejmě všichni víme“). Jeho společným rysem je, že hodnotitel zůstává skrytý a
hodnocení nelze odmítnout, aniž by se rozhovor stočil ke slovům místo k věci.

## Stav důkazů

Rozlišení mezi tím, co výpověď tvrdí, a tím, co sděluje jinými cestami, je v pragmatice
pevně ukotvené (Grice 1975; Levinson 1983). Obecný účinek rámování na rozhodování je doložen
experimentálně (Tversky a Kahneman 1981). Tvrzení NLP, že komentářová příslovce v hypnotickém
jazyce spolehlivě vedou k přijetí obsahu, však nebyla ověřena kontrolovanými studiemi; opírají
se o rozbory přepisů Ericksonových sezení (Bandler a Grinder 1975b). Kritické přehledy
konstatují, že NLP přejímá terminologii a příklady z vědeckých oborů, aniž by sama přinášela
empirické ověření svých tvrzení (Roderique-Davies 2009; Witkowski 2010). Pro tuto stránku z
toho plyne, že popis mechanismu je pevný, ale tvrzení o jeho samostatné síle je třeba brát
jako hypotézu.

## Obrana a zotavení

Základní obranou je vrátit hodnotitele do věty: „Pro koho je to samozřejmé?“ nebo „Kdo říká,
že je to naštěstí?“ Taková otázka nepopírá obsah, jen ho mění z předpokladu na názor, ke
kterému se lze vyjádřit. Druhou obranou je oddělit obsah od hodnocení a vyjádřit se k obojímu
zvlášť: nejprve zda se něco stalo, potom jak to hodnotit. Třetí obranou je metakomunikace,
tedy komentář ke způsobu, jakým se mluví, například upozornění, že hodnocení v rozhovoru
zaznívá jen z jedné strany; teorie komunikace popisuje schopnost mluvit o komunikaci samé
jako podmínku řešení vztahových konfliktů (Watzlawick, Beavin a Jackson 1967). Při zotavení po
dlouhodobém působení pomáhá všímat si, která hodnoticí slova člověk převzal do vlastního
popisu, a zkoušet tytéž události popsat neutrálně. Kognitivní terapie k tomu vede systematicky,
když klient odděluje událost od jejího hodnocení a hodnocení zkouší jako hypotézu (Beck 1976).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Roderique-Davies, G. (2009). Neuro-linguistic programming: Cargo cult psychology? *Journal of Applied Research in Higher Education*, 1(2), 58–63.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.
- Watzlawick, P., Beavin, J. H., & Jackson, D. D. (1967). *Pragmatics of Human Communication*. New York: W. W. Norton.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Ztracený performativ](@/kompendium/nlp-vzorce/meta-model/ztraceny-performativ.md) – příbuzné heslo (Meta-model, Lost performative)
- [Komplexní ekvivalence](@/kompendium/nlp-vzorce/meta-model/komplexni-ekvivalence.md) – příbuzné heslo (Meta-model, Complex equivalence)
- [Truismy](@/kompendium/nlp-vzorce/milton-model/truismy.md) – příbuzné heslo (Milton-model, Truisms)
- [Ztracený performativ v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/ztraceny-performativ-milton.md) – příbuzné heslo (Milton-model, Lost performative (Milton Model))
- [Částice „jen“, „i“, „dokonce“](@/kompendium/nlp-vzorce/presupozice/kvalifikatory-jen-i.md) – příbuzné heslo (Jazykové presupozice, Qualifiers only, even, too)
- [Vztažné věty jako presupozice](@/kompendium/nlp-vzorce/presupozice/vztazne-vety-presupozice.md) – příbuzné heslo (Jazykové presupozice, Relative clauses)
- [Faktivní slovesa](@/kompendium/nlp-vzorce/presupozice/faktivni-slovesa.md) – příbuzné heslo (Jazykové presupozice, Factive verbs)
- [Hodnotově nabitá slova](@/kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md) – příbuzné heslo (Jazykové vzorce, Loaded words)

**V kompendiu**

- [EA-1.4.2 Latentní emocionální modulace](@/kompendium/techniques/ea-1-4-2-latentni-emocionalni-modulace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.3.2 Strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Predikáty uvědomění](@/kompendium/nlp-vzorce/presupozice/predikaty-uvedomeni.md) – předchozí heslo rodiny
- [Slovesa změny času a stavu](@/kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
