+++
title = "Implikativní slovesa"
description = "Slovesa typu „podařilo se“, „zapomněl“ či „dovolil si“, která mlčky předpokládají pokus, povinnost nebo očekávání: jak nesou nevyslovená pravidla a jak je číst."
weight = 16
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Implikativní slovesa", "Implicative verbs", "implikativa", "slovesa pokusu a opomenutí", "Jazykové presupozice", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-06.16"
nlp_slug = "implikativni-slovesa"
nlp_family = "presupozice"
nlp_family_code = "06"
nlp_family_title = "Jazykové presupozice"
nlp_family_en = "Linguistic presuppositions"
nlp_part = "presupozice.b"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Implicative verbs"
nlp_aliases = ["implikativa", "slovesa pokusu a opomenutí"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = "jazykove-presupozice"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["jazykove-presupozice"]
nlp_related = ["modalni-operator-nutnosti", "slovesa-zmeny-casu", "faktivni-slovesa", "zkusit"]
nlp_related_declared = ["faktivni-slovesa", "slovesa-zmeny-casu", "modalni-operator-nutnosti", "zkusit"]
nlp_kompendium = ["kompendium/techniques/ea-8-2-5-stark-coercive-control.md", "kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/jazykove-vzorce/zkusit.md", "kompendium/nlp-vzorce/meta-model/modalni-operator-nutnosti.md", "kompendium/nlp-vzorce/presupozice/opakovaci-slova.md", "kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md", "kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md", "kompendium/techniques/ea-8-2-5-stark-coercive-control.md"]
nlp_prev = "faktivni-slovesa"
nlp_next = "rozstepene-vety"
nlp_position = 16
nlp_family_size = 19
nlp_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "druckman-swets-1988", "grice-1975", "herman-1992", "levinson-1983", "passmore-rowson-2019", "stark-2007", "witkowski-2010"]
nlp_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
nlp_sources_roots = ["grice-1975", "levinson-1983"]
nlp_sources_critical = ["druckman-swets-1988", "herman-1992", "passmore-rowson-2019", "stark-2007", "witkowski-2010"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/presupozice.b.toml"
+++

# Implikativní slovesa

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.16` |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Implicative verbs |
| **Jiné názvy** | implikativa, slovesa pokusu a opomenutí |
| **Obecnější vzorec** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Implikativní sloveso je sloveso, jehož užití předpokládá nějakou okolnost kolem děje, o
kterém se mluví: pokus, obtíž, povinnost, úmysl nebo očekávání. Kdo řekne „podařilo se mu
otevřít dveře“, sděluje, že dveře otevřel, a zároveň předpokládá, že se o to pokoušel a že
to nebylo samozřejmé. Kdo řekne „zapomněl zamknout“, sděluje, že nezamkl, a předpokládá, že
zamknout měl nebo chtěl. Předpoklad přetrvává i pod záporem: „nepodařilo se mu otevřít“
stále předpokládá pokus. Lingvistická pragmatika uvádí implikativní slovesa mezi spouštěči
presupozic a jako typické příklady jmenuje slovesa s významem „podařit se“, „zapomenout“,
„náhodou něco udělat“ nebo „vyhnout se“ (Levinson 1983). V češtině sem patří i „stihnout“,
„opomenout“, „obtěžovat se“, „odvážit se“, „dovolit si“ nebo „nenamáhat se“. Pro kompendium
jsou důležitá tím, že dokážou do věty vložit nevyslovené pravidlo, tedy předpoklad, co člověk
měl udělat, co se od něj čekalo nebo co mu nepříslušelo.

## Původ a souvislosti

Kategorii implikativních sloves vymezil na začátku sedmdesátých let lingvista Lauri Karttunen,
který si všiml, že některá slovesa nesou dvojí obsah: tvrzení o tom, zda se děj uskutečnil,
a předpoklad o okolnostech, které mu předcházely. Levinson tyto poznatky shrnuje v rámci
přehledu spouštěčů presupozic, kde zároveň ukazuje, že presupozice obecně jsou citlivé na
kontext a v některých souvislostech je lze zrušit (Levinson 1983). Teorie
konverzace vysvětluje, proč posluchač takový předpoklad obvykle přijme: pokud mluvčí volí
sloveso „zapomněl“ místo prostého „neudělal“, posluchač předpokládá, že volba má smysl, a
doplní si povinnost nebo úmysl, který by ji vysvětlil (Grice 1975).

Neurolingvistické programování převzalo z lingvistiky své doby přehled presupozičních
prostředí, mezi nimiž jsou slovesa, která předpokládají předchozí stav nebo očekávání
(Bandler a Grinder 1975). V literatuře a výcviku NLP se navíc rozšířila úvaha o slově
„zkusit“, podle níž výzva ke zkoušení mlčky předpokládá možnost neúspěchu; té se věnuje heslo
[Slovo „zkusit“](@/kompendium/nlp-vzorce/jazykove-vzorce/zkusit.md). Příbuzná jsou slovesa
popsaná v hesle [Slovesa změny času a stavu](@/kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md)
a modální výrazy, které pravidla vyslovují přímo, popsané v hesle
[Modální operátor nutnosti](@/kompendium/nlp-vzorce/meta-model/modalni-operator-nutnosti.md).

## Struktura vzorce

Výpověď s implikativním slovesem má popředí a pozadí. V popředí je tvrzení o tom, co se
stalo nebo nestalo, a to bývá pravdivé: člověk skutečně nezavolal, skutečně přišel pozdě,
skutečně něco udělal. V pozadí je předpoklad o normě, ke které se jednání vztahuje: měl
zavolat, měl přijít včas, nesměl to udělat bez svolení. Pokud adresát reaguje na popředí,
například vysvětlením, proč nezavolal, přijímá tím normu v pozadí. Implikativní sloveso tak
umožňuje zavést pravidlo, o kterém se nikdy nejednalo, a zároveň hodnotit jeho porušení.

Jednotlivá slovesa nesou různé druhy norem. „Zapomenout“ a „opomenout“ předpokládají
povinnost nebo úmysl. „Dovolit si“ a „odvážit se“ předpokládají hierarchii, v níž jednání
podléhá svolení. „Obtěžovat se“ a „namáhat se“ předpokládají, že jednání bylo očekávané a
zdráhavě nebo vůbec neprovedené. „Podařit se“ a „stihnout“ předpokládají obtíž, což může
být uznáním úsilí, ale také nevysloveným tvrzením, že úspěch byl nepravděpodobný.
Opakující se slova jako „zase“ nebo „jako obvykle“, popsaná v hesle
[Opakovací slova](@/kompendium/nlp-vzorce/presupozice/opakovaci-slova.md), pak normu
proměňují v ustálené pravidlo a jednotlivý případ v doklad charakteru.

Zvláštní postavení má výraz „náhodou“ a slovesa s podobným významem. Věta „náhodou jsem
viděl tvoje zprávy“ předpokládá, že mluvčí zprávy vidět nechtěl ani neplánoval, a tím
předem odmítá otázku, proč je četl. Ironické užití téhož výrazu působí opačně: „náhodou ses
zapomněla zmínit, že tam bude i on“ doslova popisuje nezáměrné opomenutí, ale v kontextu
naznačuje úmyslné zamlčení. Teorie konverzace takové místo vykládá jako zjevné porušení
požadavku pravdivosti, z něhož posluchač vyvozuje opak doslovného významu (Grice 1975).
Výčitka tak zazní, aniž by byla vyslovena, a mluvčí se může v případě námitky odvolat na
doslovné znění. Obecně platí, že kdykoli mluvčí volí příznakové sloveso místo neutrálního,
tedy „zapomněl“ místo „neudělal“ nebo „dovolil si“ místo „udělal“, nese volba sama
informaci, kterou posluchač doplní, a právě v tomto doplnění se skrývá norma, kterou nikdo
výslovně nestanovil.

## Detekční znaky

Prvním znakem je implikativní sloveso, jehož předpokládaná norma nebyla nikdy dohodnuta:
„zase jsi zapomněl napsat, kde jsi“ ve vztahu, v němž povinnost hlásit pohyb nikdy nebyla
předmětem jednání. Druhým znakem je sloveso hierarchie, „dovolil sis“, „troufla sis“, mezi
lidmi, kteří jsou si formálně rovni. Třetím znakem je „podařilo se“ nebo „stihl jsi“ ve
spojení s údivem, které předpokládá, že od adresáta se úspěch nečekal; opakovaně uplatňované
na tutéž osobu vytváří obraz nekompetence, který kompendium popisuje u
[zesilování syndromu podvodníka](@/kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md).
Čtvrtým znakem je hromadění takových sloves v hovoru o každodenních drobnostech, kdy každé
z nich předpokládá další pravidlo. Stark popsala v rámci koncepce donucující kontroly, že
kontrolující partner reguluje drobné úkony každodenního života a že síla kontroly spočívá v
nahromadění takových pravidel, ne v jediném incidentu (Stark 2007). Implikativní slovesa
jsou jedním z jazykových prostředků, jimiž se tato pravidla zavádějí bez výslovného příkazu.

## Legitimní a manipulativní užití

Implikativní slovesa jsou v běžné řeči nezbytná a většinou neškodná. „Podařilo se nám
opravit chybu včas“ předpokládá úsilí, které skutečně proběhlo; „zapomněl jsem ti poslat
podklady“ přiznává vlastní povinnost, kterou mluvčí uznává. V těchto případech norma v pozadí
je sdílená a mluvčí ji často vztahuje na sebe. V terapii může uznání obtíže („podařilo se
vám to i přes únavu“) posílit klientovo vnímání vlastního úsilí, pokud odpovídá tomu, co
klient sám prožil. Podle teorie konverzace je takové užití kooperativní, protože předpoklad
odpovídá společnému pozadí rozhovoru (Grice 1975).

Manipulativní užití vztahuje implikativní slovesa jednostranně na adresáta a do pozadí
ukládá normy, o kterých se nejednalo a se kterými by adresát nesouhlasil. Typickým
prostředím jsou kontrolující vztahy, v nichž se tímto způsobem rozšiřuje okruh povinností a
zákazů, a pracovní prostředí s nerovnou mocí, kde se „zapomněl jste“ používá i tam, kde
úkol nikdy zadán nebyl. Herman popisuje, že dlouhodobá kontrola postupně ovládá i drobnosti
každodenního života a narušuje u oběti vědomí vlastní autonomie (Herman 1992). Jazyk, který
normy pouze předpokládá, je pro takovou kontrolu výhodný, protože se proti němu obtížně
protestuje: nikdo nic nenařídil.

## Stav důkazů

Lingvistický popis implikativních sloves je zavedený a v podrobnostech, například v tom, jak
pevné jsou jednotlivé předpoklady a kdy je kontext ruší, stále diskutovaný (Levinson 1983).
Psychologický účinek implikativních sloves v přirozeném rozhovoru samostatně experimentálně
zkoumán příliš nebyl; jejich význam pro kontrolující vztahy vychází spíše z klinických a
sociologických popisů těchto vztahů než z laboratorních studií (Stark 2007). Tvrzení
NLP o účinku presupozic obecně se opírají o ukázky a rozbory přepisů, ne o kontrolovaný
výzkum (Bandler a Grinder 1975b). Hodnocení Národní rady
pro výzkum USA z konce osmdesátých let nenašlo pro tvrzení NLP o ovlivňování výkonu a
přesvědčování dostatečnou empirickou oporu (Druckman a Swets 1988) a pozdější přehledy
dospěly k podobnému závěru (Witkowski 2010; Passmore a Rowson 2019). Je proto namístě brát
implikativní slovesa jako dobře popsaný jazykový jev a nepřisuzovat jim změřenou sílu
účinku, kterou zatím nikdo nezměřil.

## Obrana a zotavení

Základní obranou je vyslovit normu v pozadí a zeptat se na její původ: „říkáš, že jsem
zapomněl; to předpokládá, že jsem měl povinnost ti psát. Kdy jsme se na tom dohodli?“
Tím se pravidlo přesouvá z pozadí do popředí, kde je lze přijmout, odmítnout nebo vyjednat.
Druhou obranou je oddělit fakt od normy a přiznat jen fakt: „nenapsal jsem“ je jiné
tvrzení než „zapomněl jsem napsat“. Třetí obranou je sledovat kumulaci a vést si přehled o
tom, kolik nevyslovených pravidel vztah obsahuje; rámec donucující kontroly zdůrazňuje, že
rozhodující je právě souhrn, ne jednotlivý výrok (Stark 2007). Při zotavení pomáhá vypsat
povinnosti a zákazy, které byly během vztahu předpokládány, a u každé si položit otázku, zda
s ní člověk někdy souhlasil. Takové vědomé znovuprojednání pravidel je součástí obnovy
autonomie, kterou klinická literatura řadí mezi hlavní úkoly zotavení po dlouhodobé kontrole
(Herman 1992). Kontext rámce donucující kontroly podrobněji popisuje stránka
[Starkův rámec coercive control](@/kompendium/techniques/ea-8-2-5-stark-coercive-control.md).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. New York: Oxford University Press.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Modální operátor nutnosti](@/kompendium/nlp-vzorce/meta-model/modalni-operator-nutnosti.md) – příbuzný vzorec (Meta-model, Modal operator of necessity)
- [Slovesa změny času a stavu](@/kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md) – příbuzný vzorec (Jazykové presupozice, Change-of-time verbs and adverbs)
- [Faktivní slovesa](@/kompendium/nlp-vzorce/presupozice/faktivni-slovesa.md) – příbuzný vzorec (Jazykové presupozice, Factive verbs)
- [Slovo „zkusit“](@/kompendium/nlp-vzorce/jazykove-vzorce/zkusit.md) – příbuzný vzorec (Jazykové vzorce, Try)

**V kompendiu**

- [EA-8.2.5 Starkův rámec coercive control](@/kompendium/techniques/ea-8-2-5-stark-coercive-control.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-2.5.2 Zesilování syndromu podvodníka](@/kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Faktivní slovesa](@/kompendium/nlp-vzorce/presupozice/faktivni-slovesa.md) – předchozí vzorec rodiny
- [Vytýkací konstrukce](@/kompendium/nlp-vzorce/presupozice/rozstepene-vety.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
