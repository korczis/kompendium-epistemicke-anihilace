+++
title = "Nominalizace v Milton-modelu"
description = "Abstraktní podstatná jména bez účastníků v sugestivní řeči: proč si je každý posluchač naplní sám a jak se z nich stává uzavřený slovník skupiny."
weight = 22
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-milton-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Nominalizace v Milton-modelu", "Nominalisations (Milton Model)", "zpodstatnělé procesy v sugesci", "Milton-model", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-04.22"
catalog_slug = "nominalizace-milton"
catalog_family = "milton-model"
catalog_family_code = "04"
catalog_family_title = "Milton-model"
catalog_family_en = "Milton Model"
catalog_part = "milton-model.c"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Nominalisations (Milton Model)"
catalog_aliases = ["zpodstatnělé procesy v sugesci"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "milton-model"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["milton-model"]
catalog_related = ["reifikace", "transderivacni-hledani", "nominalizace", "umyslna-vagnost", "nespecifikovana-slovesa-milton", "srovnavaci-delece-milton", "nlp-v-politicke-reci"]
catalog_related_declared = ["nominalizace", "umyslna-vagnost", "nespecifikovana-slovesa-milton", "transderivacni-hledani"]
catalog_kompendium = ["kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/detection-signatures/1-linguistic-jargon-density.md", "kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/detection-signatures/1-linguistic-jargon-density.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md", "kompendium/nlp-vzorce/zakladni-pojmy/transderivacni-hledani.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md"]
catalog_prev = "modalni-operatory-milton"
catalog_next = "nespecifikovana-slovesa-milton"
catalog_position = 22
catalog_family_size = 30
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "chomsky-1965", "hassan-1988", "heap-1988", "herman-1992", "lakoff-johnson-1980", "lifton-1961", "petty-cacioppo-1986", "tosey-mathison-2009", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
catalog_sources_roots = ["chomsky-1965"]
catalog_sources_critical = ["hassan-1988", "heap-1988", "herman-1992", "lakoff-johnson-1980", "lifton-1961", "petty-cacioppo-1986", "tosey-mathison-2009", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/milton-model.c.toml"
+++

# Nominalizace v Milton-modelu

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-04.22` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Nominalisations (Milton Model) |
| **Jiné názvy** | zpodstatnělé procesy v sugesci |
| **Obecnější heslo** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Nominalizace je jazykový tvar, v němž se děj vyjádří podstatným jménem. Místo toho, aby
někdo něco chápal, mění, důvěřuje nebo roste, mluví se o pochopení, změně, důvěře a růstu.
Spolu se slovesem mizí účastníci děje, jeho předmět, čas i způsob. V meta-modelu je
nominalizace stopa, podle níž terapeut pozná, že klient zkameněl proces do podoby věci, a
otázkami ji vrací zpět do pohybu (Bandler a Grinder 1975). Milton-model s nominalizacemi
zachází obráceně: používá je záměrně, protože abstraktní slovo bez účastníků si každý
posluchač naplní vlastním obsahem. Mluvčí tak může mluvit ke stovce lidí a každý z nich má
dojem, že slyší právě o své zkušenosti. Pro kompendium je vzorec důležitý ze dvou důvodů.
Nominalizace vytvářejí sdělení, které nelze ověřit, protože neříká nic určitého, a v
uzavřených skupinách se z nich skládá slovník, jehož význam určuje ten, kdo má moc.

## Původ a souvislosti

Pojem pochází z transformační gramatiky, která rozlišovala hloubkovou strukturu věty od její
povrchové podoby a popisovala, jak se jedna mění v druhou (Chomsky 1965). Bandler a Grinder
z ní převzali představu, že povrchová věta je ochuzeným odrazem úplnější reprezentace, a
nominalizaci zařadili mezi hlavní kategorie meta-modelu (Bandler a Grinder 1975). V rozboru
Ericksonových hypnotických přepisů pak ukázali, že Erickson užíval nominalizace hojně a že
právě jejich neurčitost dovolovala pacientovi, aby si do sugesce dosadil vlastní obsah
(Bandler a Grinder 1975b). Na tuto linii navazuje pojem
[úmyslné vágnosti](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md), do níž
nominalizace v Milton-modelu patří. Mimo NLP popsala kognitivní lingvistika obecnější jev:
lidé běžně chápou děje, činnosti a emoce jako entity a látky, s nimiž lze zacházet, které lze
mít, ztratit nebo měřit, a tyto ontologické metafory strukturují uvažování, aniž by si jich
mluvčí byl vědom (Lakoff a Johnson 1980). V literatuře o reformě myšlení se objevuje
příbuzný mechanismus pod jménem „naložený jazyk“: složité lidské problémy se stlačují do
krátkých abstraktních formulí, které ukončují přemýšlení dřív, než začne (Lifton 1961).

## Struktura vzorce

Nominalizace v sugestivní řeči má tři vlastnosti, které společně vytvářejí její účinek.
První je vypuštění účastníků: není řečeno, kdo co chápe nebo mění, takže se posluchač do
role subjektu dosadí sám. Druhá je zmrazení procesu do stavu. Děj, který by měl začátek,
průběh a konec, se mění ve věc, kterou člověk má nebo nemá, a tedy i ve věc, kterou mu někdo může dát, slíbit nebo upřít (Bandler a Grinder 1975; Lakoff a Johnson 1980). Třetí je hodnotový náboj. Kladné nominalizace jako
svoboda, růst, probuzení nebo celistvost slibují stav, k němuž má posluchač dospět. Záporné
nominalizace jako rezistence, ego, strach nebo závislost označují to, co mu v cestě stojí.
Když se posluchačova pochybnost pojmenuje jako „rezistence“, přestává být úsudkem, který
je třeba vyslechnout, a stává se překážkou, kterou je třeba překonat.

Posluchač, který slyší neurčité slovo, hledá jeho smysl ve vlastní zkušenosti. NLP tento
proces nazývá [transderivačním hledáním](@/kompendium/nlp-vzorce/zakladni-pojmy/transderivacni-hledani.md)
a připisuje mu sugestivní účinek: obsah, který si člověk vytvořil sám, mu připadá vlastní a
pravdivý (Bandler a Grinder 1975b). V uzavřeném prostředí se k tomu přidává sociální rovina.
Nominalizace se stávají slovníkem skupiny, jejich výklad drží vedení a ten se může dodatečně
měnit. Člen pak zjišťuje, že „pochopil“ špatně, a nemá žádný pevný bod, podle něhož by
mohl správnost výkladu posoudit. Kompendium tento mechanismus popisuje u
[terminologické mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md).

## Detekční znaky

Prvním znakem je vysoká hustota abstraktních podstatných jmen, k nimž chybí účastníci,
předmět a časové určení, zejména ve chvílích, kdy jde o rozhodnutí posluchače. Druhým znakem
je odpověď na otázku po konkrétním obsahu, která přinese další nominalizaci místo popisu dějů:
na otázku, co přesně se změní, přijde odpověď o „hlubší transformaci“. Třetím znakem je
posun významu: termín znamená v jedné situaci něco jiného než v druhé, a vždy to, co se právě
hodí mluvčímu. Čtvrtým znakem je přeznačování posluchačovy zkušenosti slovníkem mluvčího.
Únava, smutek nebo nesouhlas dostávají jména, která je proměňují ve vlastnosti, za něž člověk
odpovídá. Kompendium uvádí příbuzné ukazatele u detekční signatury
[hustoty žargonu](@/kompendium/detection-signatures/1-linguistic-jargon-density.md). U
člověka, který byl takovému jazyku dlouho vystaven, se objevuje potíž popsat vlastní zážitky
jinak než slovníkem skupiny a pocit, že bez něj nemá slova pro to, co prožívá (Hassan 1988).
Lifton tento stav spojoval s tím, že naložený jazyk zužuje nejen řeč, ale i rozsah toho, o čem
je člověk vůbec schopen přemýšlet (Lifton 1961).

## Legitimní a manipulativní užití

Abstraktní podstatná jména jsou běžnou a nezbytnou součástí řeči a jejich výskyt sám o sobě
nic nedokazuje. V terapii mohou otevřené formulace legitimně sloužit tomu, aby klient
v metafoře nebo při relaxaci našel vlastní obsah a nemusel přijímat cizí. [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md)
s nominalizacemi pracuje opačně a v terapeutickém rámci užitečně: když klient mluví
o „svém vztahu“ jako o hotové věci, převedení zpět na děj mu ukáže, že jde o něco, co dva
lidé dělají a mohou dělat jinak (Bandler a Grinder 1975). Rozdíl mezi legitimním a
manipulativním užitím neleží ve slovech, ale v tom, komu patří obsah. Legitimní je takové
užití, kde obsah zůstává posluchači a kde se k němu mluvčí na požádání vrátí a pojmenuje ho.
Manipulativní je užití, kde neurčitost slouží k tomu, aby posluchač přijal závazek, jehož
obsah určí někdo jiný později, nebo aby se jeho úsudek označil za překážku. Výzkum
přesvědčování ukazuje, že když posluchač nemá schopnost nebo motivaci obsah sdělení
důkladně zpracovat, rozhodují o jeho postoji spíše vnější vodítka, jako je autorita nebo
atmosféra, než argumenty (Petty a Cacioppo 1986). Nominalizace, které nic určitého neříkají,
vytvářejí právě takovou situaci.

## Stav důkazů

Tvrzení, že nominalizace v sugestivní řeči vyvolávají zvláštní, hypnoticky podmíněný účinek,
spočívá na rozboru přepisů a na zkušenosti praktiků, nikoli na kontrolovaných experimentech
(Bandler a Grinder 1975b). Rané hodnocení NLP konstatovalo, že jeho klíčová tvrzení nebyla
empiricky podpořena (Heap 1988), a pozdější průchod výzkumnou databází tento závěr potvrdil
(Witkowski 2010). Kritické zhodnocení oboru upozorňuje na slabou výzkumnou základnu a
doporučuje rozlišovat mezi praktickou užitečností jednotlivých postupů a jejich teoretickým
zdůvodněním (Tosey a Mathison 2009). Dobře doložené jsou naopak obecnější jevy, o které se
popis vzorce opírá: role ontologických metafor v běžném myšlení (Lakoff a Johnson 1980) a
role vnějších vodítek při zpracování sdělení s nízkým informačním obsahem (Petty a Cacioppo
1986). Pro čtenáře z toho plyne, že účinek nominalizací lze vysvětlit běžnými mechanismy
porozumění a přesvědčování a že pro předpoklad zvláštního „nevědomého“ zpracování doklady
chybějí.

## Obrana a zotavení

Nejúčinnější obranou je převádět nominalizace zpět na děje. U každého abstraktního slova,
které má vést k rozhodnutí, je legitimní se zeptat, kdo má co dělat, s čím nebo s kým, od
kdy a podle čeho se pozná, že se to děje nebo neděje. Pokud odpověď nepřijde nebo přijde
v podobě další abstrakce, je to informace sama o sobě: závazek nemá obsah, který by šlo
posoudit. Druhou obranou je držet si vlastní slovník pro vlastní zkušenost. Kdo popisuje,
co cítí a dělá, svými slovy, neztrácí kontakt s tím, co prožívá, když mu okolí nabízí
hotová jména. Třetí obranou je všímat si, kdy se vlastní pochybnost přejmenovává na
vlastnost, kterou je třeba překonat. Při zotavení z prostředí s naloženým jazykem se pracuje
s postupným znovuobjevením běžného významu slov a s rozlišením mezi pojmy, které člověk
přijal od skupiny, a slovy, jimiž popisuje vlastní život (Hassan 1988). Bezpečný vztah, ve
kterém má člověk právo pojmenovat své zážitky po svém, je pro tuto obnovu podmínkou
(Herman 1992).

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Chomsky, N. (1965). *Aspects of the Theory of Syntax*. Cambridge, MA: MIT Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Lakoff, G., & Johnson, M. (1980). *Metaphors We Live By*. Chicago: University of Chicago Press.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Reifikace](@/kompendium/argumentacni-fauly/jazykove-klamy/reifikace.md) – příbuzné heslo (Argumentační fauly: Klamy jazyka a dvojznačnosti, Reification)
- [Transderivační hledání](@/kompendium/nlp-vzorce/zakladni-pojmy/transderivacni-hledani.md) – příbuzné heslo (Základní pojmy NLP, Transderivational search)
- [Nominalizace](@/kompendium/nlp-vzorce/meta-model/nominalizace.md) – příbuzné heslo (Meta-model, Nominalisation)
- [Úmyslná vágnost](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md) – příbuzné heslo (Milton-model, Artful vagueness)
- [Nespecifikovaná slovesa v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/nespecifikovana-slovesa-milton.md) – příbuzné heslo (Milton-model, Unspecified verbs (Milton Model))
- [Srovnávací vypuštění v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/srovnavaci-delece-milton.md) – příbuzné heslo (Milton-model, Comparative deletion (Milton Model))
- [NLP v politické řeči](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-politicke-reci.md) – příbuzné heslo (Vliv a zneužití NLP, NLP in political speech)

**V kompendiu**

- [EA-1.1.3 Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Detekční signatura: Hustota žargonu](@/kompendium/detection-signatures/1-linguistic-jargon-density.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.6.1 Vzorec guru a adept](@/kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Modální operátory v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/modalni-operatory-milton.md) – předchozí heslo rodiny
- [Nespecifikovaná slovesa v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/nespecifikovana-slovesa-milton.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
