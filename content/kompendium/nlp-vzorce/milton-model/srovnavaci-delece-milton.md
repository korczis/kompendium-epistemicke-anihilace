+++
title = "Srovnávací vypuštění v Milton-modelu"
description = "Srovnání bez měřítka v sugestivní řeči: jak „hlouběji“, „víc“ a „lépe“ bez udání čeho a než co nutí posluchače dosadit vlastní srovnání a jak tím řídí jeho hodnocení."
weight = 29
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-milton-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Srovnávací vypuštění v Milton-modelu", "Comparative deletion (Milton Model)", "neúplné srovnání v sugesci", "Milton-model", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-04.29"
catalog_slug = "srovnavaci-delece-milton"
catalog_family = "milton-model"
catalog_family_code = "04"
catalog_family_title = "Milton-model"
catalog_family_en = "Milton Model"
catalog_part = "milton-model.c"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Comparative deletion (Milton Model)"
catalog_aliases = ["neúplné srovnání v sugesci"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "milton-model"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["milton-model"]
catalog_related = ["srovnavaci-delece", "umyslna-vagnost", "nominalizace-milton", "srovnavaci-presupozice"]
catalog_related_declared = ["srovnavaci-delece", "srovnavaci-presupozice", "umyslna-vagnost", "nominalizace-milton"]
catalog_kompendium = ["kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md", "kompendium/techniques/ea-1-1-1-selektivni-expozice.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md", "kompendium/techniques/ea-1-1-1-selektivni-expozice.md", "kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md"]
catalog_prev = "retezeni-sugesci"
catalog_next = "presupozice-milton"
catalog_position = 29
catalog_family_size = 30
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "beck-1976", "cialdini-2009", "gilovich-1991", "heap-1988", "herman-1992", "mcguire-1964", "tversky-kahneman-1974", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
catalog_sources_roots = []
catalog_sources_critical = ["beck-1976", "cialdini-2009", "gilovich-1991", "heap-1988", "herman-1992", "mcguire-1964", "tversky-kahneman-1974", "tversky-kahneman-1981", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/milton-model.c.toml"
+++

# Srovnávací vypuštění v Milton-modelu

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-04.29` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Comparative deletion (Milton Model) |
| **Jiné názvy** | neúplné srovnání v sugesci |
| **Obecnější heslo** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Srovnávací vypuštění je jazykový tvar, ve kterém zazní srovnání, ale chybí to, s čím se
srovnává, nebo měřítko, podle kterého se srovnává. Věta mluví o tom, že něco je lepší, hlubší,
snazší nebo že by člověk měl chtít víc, a neříká, než co, v čem a podle koho. V meta-modelu je
srovnávací vypuštění stopa, kterou terapeut zpochybní otázkou „ve srovnání s čím“, protože
nevyslovené měřítko často drží klienta v pocitu nedostatečnosti (Bandler a Grinder 1975).
Milton-model užívá tento tvar záměrně ve dvou směrech. V sugestivní řeči slibuje pohyb: stav
posluchače se má prohlubovat nebo zlepšovat, a protože chybí výchozí bod, každý stav lze
vyložit jako posun správným směrem (Bandler a Grinder 1975b). Ve vlivové řeči hodnotí:
posluchač je „pozadu“, „spokojuje se s méně“, „mohl by víc“, a sám si dosadí srovnání, které
je pro něj nejbolestnější. Pro kompendium je vzorec důležitý, protože srovnání bez měřítka
nelze vyvrátit a přitom silně působí na sebehodnocení.

## Původ a souvislosti

Bandler a Grinder popsali srovnávací vypuštění jako jednu z forem vypouštění v meta-modelu:
povrchová věta obsahuje srovnávací tvar, ale hloubková reprezentace, ze které vychází, by
obsahovala i druhý člen srovnání (Bandler a Grinder 1975). V rozboru Ericksonova jazyka pak
ukázali, že neúplná srovnání patří k prostředkům, kterými sugestivní řeč nechává posluchače,
aby si obsah doplnil sám (Bandler a Grinder 1975b). Psychologie úsudku popsala jev, který
vysvětluje, proč na doplnění tolik záleží. Lidé hodnotí veličiny vzhledem k nějakému
výchozímu bodu, a výchozí bod, který se nabídne jako první nebo je nejnápadnější, ovlivňuje
odhad, i když s věcí nesouvisí (Tversky a Kahneman 1974). Hodnocení zisků a ztrát se navíc
odvíjí od referenčního bodu, a změna referenčního bodu mění, co člověk vnímá jako úspěch nebo
neúspěch (Tversky a Kahneman 1981). Výzkum sociálního vlivu k tomu přidává princip kontrastu:
tatáž věc působí jinak podle toho, co člověk viděl těsně před ní (Cialdini 2009). Srovnávací
vypuštění tedy využívá skutečný rys lidského hodnocení: kdo neřekne, s čím srovnává, nechává
referenční bod na posluchači, a kdo ho zároveň naznačí, posluchače k němu vede.

## Struktura vzorce

Vzorec má čtyři prvky. Prvním je srovnávací nebo stupňovací tvar: víc, méně, lépe, hlouběji,
snáz, nejvíc. Druhým je chybějící druhý člen srovnání: není řečeno, než co nebo než kdo.
Třetím je chybějící kritérium: není řečeno, v čem se srovnává. Čtvrtým je naznačený směr, který srovnání dává pohyb nahoru nebo dolů (Bandler a Grinder 1975). Posluchač vypuštěné prvky doplní z toho, co je
v jeho mysli nejdostupnější: z vlastní minulosti, z ideálu, který o sobě má, nebo z obrazu
druhých lidí, který mu předložilo okolí.

Ve vlivovém užití lze rozlišit dvě podoby. Slibující podoba nabízí vzestup: posluchač může mít
víc, cítit se lépe, žít hlouběji. Protože chybí výchozí bod, slib nelze nikdy porovnat
s výsledkem, a posluchač proto nemůže zjistit, zda byl splněn. Znehodnocující podoba nabízí
sestup: posluchač je pozadu, zvládá méně, spokojuje se s málem. Protože chybí srovnávaná osoba
i měřítko, posluchač si dosadí tu nejúspěšnější osobu, kterou zná, nebo ideál, kterého nikdo
nedosáhne. Obě podoby se často střídají a vytvářejí dynamiku, v níž je posluchač stále
nedostatečný a stále na cestě k lepšímu, o kterém rozhoduje mluvčí. Zda člověk výsledek prožívá jako zisk, nebo ztrátu, závisí na referenčním bodu, a ten lze formulací posunout (Tversky a Kahneman 1981).

Proč posluchač dosazuje právě bolestné srovnání, vysvětluje princip kontrastu. Tatáž
vlastnost nebo výkon působí slabší, když je člověk posuzuje bezprostředně po vzoru, který je
výrazně lepší, a mluvčí, který takový vzor předtím ukázal nebo jen připomněl, určuje kontrast,
aniž by ho vyslovil (Cialdini 2009). Neúplné srovnání tak spolupracuje s tím, co posluchač
v rozhovoru právě slyšel nebo viděl: příběhy úspěšných členů skupiny, ukázky pokročilých
účastníků nebo obraz ideálního partnera dodávají chybějící druhý člen srovnání, i když ho
věta sama neobsahuje. Pozorovatel by proto měl sledovat nejen jednotlivý výrok, ale i to, jaké
srovnávací body mu v rozhovoru předcházely. Příbuznou formu, kdy
srovnání předpokládá něco, co se nevyslovuje, popisuje stránka o
[srovnávacích presupozicích](@/kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md).

## Detekční znaky

Prvním znakem jsou srovnávací tvary bez druhého členu a bez kritéria, zejména tam, kde se týkají
posluchačovy osoby, jeho výkonu nebo jeho rozhodnutí. Druhým znakem je, že mluvčí na otázku
„než kdo“ nebo „v čem“ nedokáže odpovědět, nebo odpoví dalším neúplným srovnáním. Třetím znakem
je posouvání měřítka: když posluchač dosáhne toho, co se zdálo být měřítkem, objeví se nové,
vždy o kus dál. Čtvrtým znakem je rozdíl mezi slibujícím a znehodnocujícím srovnáním podle
toho, zda posluchač vyhovuje mluvčímu: kdo vyhovuje, „roste“, kdo nevyhovuje, „zaostává“.
U člověka, kterému je vzorec dlouhodobě adresován, se objevuje trvalá nespokojenost se sebou,
pocit, že nikdy nestačí, a sklon srovnávat se s druhými podle měřítek, která si sám nezvolil.
Kompendium tyto důsledky popisuje u
[zesilování syndromu podvodníka](@/kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md)
a u [selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md), kde se
posluchači předkládají jen takové srovnávací body, které podporují žádoucí hodnocení.
Kognitivní terapie popisuje příbuzné vzorce zkresleného hodnocení sebe sama, kdy člověk
zveličuje vlastní nedostatky a zlehčuje vlastní úspěchy (Beck 1976).

## Legitimní a manipulativní užití

Srovnání jsou nezbytnou součástí odborné komunikace a jsou legitimní, když jsou úplná. Lékař,
který řekne, že nový lék méně zatěžuje ledviny než ten, který pacient užívá, uvádí oba členy
srovnání i kritérium a pacient se může doptat na podklady. V terapii může mít neúplné srovnání
legitimní funkci tam, kde měřítko určuje klient: když se klient sám hodnotí vůči svému
dřívějšímu stavu a terapeut jen sleduje směr, který klient pojmenoval, neúplnost věty nikoho
nevede k cizímu měřítku. V sugestivní řeči klinické hypnózy, na kterou pacient přistoupil,
slouží neúplné srovnání k tomu, aby pacient nemusel dosáhnout určitého stavu a jakýkoli posun
mohl vnímat jako úspěch (Bandler a Grinder 1975b).

Manipulativní užití se rozpoznává podle toho, kdo určuje měřítko a k čemu srovnání slouží.
Rozhodující otázky jsou tři. Je druhý člen srovnání a kritérium posluchači k dispozici, nebo
je musí hádat? Slouží srovnání k informaci, nebo k vyvolání pocitu nedostatečnosti či
nenaplněné touhy? A má mluvčí zájem na tom, aby se posluchač cítil pozadu, protože mu pak může nabídnout cestu vpřed? První otázka odpovídá otázce meta-modelu „ve srovnání s čím?“, kterou se vypuštěný člen srovnání vrací do řeči (Bandler a Grinder 1975).

## Stav důkazů

Tvrzení, že srovnávací vypuštění v Milton-modelu má zvláštní hypnotický účinek, nebylo
kontrolovanými studiemi ověřeno; literatura NLP ho dokládá ukázkami (Bandler a Grinder 1975b).
Přehledy výzkumu NLP konstatují, že jeho klíčová tvrzení empirickou oporu nemají (Heap 1988;
Witkowski 2010). Mechanismy, o které se popis vzorce opírá, jsou však doloženy nezávisle na
NLP. Vliv výchozího bodu na úsudek patří k nejlépe replikovaným jevům psychologie úsudku
(Tversky a Kahneman 1974) a vliv referenčního bodu na hodnocení zisku a ztráty je základem
teorie rozhodování za rizika (Tversky a Kahneman 1981). Výzkum běžných omylů úsudku navíc
ukazuje, že lidé snadno přehlížejí chybějící srovnávací údaje a usuzují z neúplných dat, jako
by byla úplná (Gilovich 1991). Pro čtenáře z toho plyne, že neúplné srovnání je účinným
prostředkem vlivu, jehož působení lze vysvětlit běžnými mechanismy hodnocení, a že pro výklad
NLP o zvláštním „nevědomém“ zpracování doklady chybějí.

## Obrana a zotavení

Základní obranou je doplnit srovnání. U každého „víc“, „lépe“ nebo „pozadu“ je legitimní se
zeptat, než co nebo než kdo, v čem a podle jakého měřítka. Pokud odpověď nepřijde, srovnání
nemá informační hodnotu a je možné ho tak posuzovat. Druhou obranou je zvolit si měřítko sám.
Kdo se hodnotí vůči vlastním cílům a vlastnímu dřívějšímu stavu, je méně zranitelný vůči
srovnáním, která mu předkládá okolí. Třetí obranou je všímat si, kdy se měřítko posouvá, a
pojmenovat to: dosažení jednoho cíle, po kterém se okamžitě objeví další, je znakem vzorce, ne
osobního selhání. Výzkum odolnosti vůči přesvědčování ukazuje, že předchozí seznámení
s mechanismem vlivu zvyšuje schopnost mu odolat (McGuire 1964). Při zotavení z prostředí, kde
byl člověk dlouhodobě hodnocen srovnáními bez měřítka, se pracuje s obnovou vlastních kritérií
hodnoty a s rozlišením mezi tím, co člověk chce, a tím, co mu bylo předloženo jako to, co by
chtít měl (Herman 1992).

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Srovnávací vypuštění](@/kompendium/nlp-vzorce/meta-model/srovnavaci-delece.md) – příbuzné heslo (Meta-model, Comparative deletion)
- [Úmyslná vágnost](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md) – příbuzné heslo (Milton-model, Artful vagueness)
- [Nominalizace v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/nominalizace-milton.md) – příbuzné heslo (Milton-model, Nominalisations (Milton Model))
- [Srovnávací presupozice](@/kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md) – příbuzné heslo (Jazykové presupozice, Comparatives as presuppositions)

**V kompendiu**

- [EA-2.5.2 Zesilování syndromu podvodníka](@/kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.1.1 Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Řetězení sugescí](@/kompendium/nlp-vzorce/milton-model/retezeni-sugesci.md) – předchozí heslo rodiny
- [Presupozice v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/presupozice-milton.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
