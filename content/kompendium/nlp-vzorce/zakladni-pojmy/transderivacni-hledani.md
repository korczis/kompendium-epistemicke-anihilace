+++
title = "Transderivační hledání"
description = "Transderivační hledání: proces, jímž posluchač vágním slovům dodává význam z vlastní zkušenosti, a proč je to jádro mnoha forem skrytého vlivu."
weight = 41
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-zakladni-pojmy", "nlp-pojem", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Transderivační hledání", "Transderivational search", "TDS", "Základní pojmy NLP", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-02.41"
catalog_slug = "transderivacni-hledani"
catalog_family = "zakladni-pojmy"
catalog_family_code = "02"
catalog_family_title = "Základní pojmy NLP"
catalog_family_en = "Core NLP concepts"
catalog_part = "zakladni-pojmy.d"
catalog_type = "concept"
catalog_type_cs = "pojem"
catalog_en = "Transderivational search"
catalog_aliases = ["TDS"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["hluboka-a-povrchova-struktura", "trans-pojem", "umyslna-vagnost", "nominalizace-milton", "nespecifikovana-slovesa-milton", "indukce-pretizenim"]
catalog_related_declared = ["hluboka-a-povrchova-struktura", "trans-pojem", "umyslna-vagnost", "nominalizace-milton", "nespecifikovana-slovesa-milton"]
catalog_kompendium = ["kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/meta-model/nespecifikovane-sloveso.md", "kompendium/nlp-vzorce/milton-model/milton-model.md", "kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md", "kompendium/nlp-vzorce/zakladni-pojmy/hluboka-a-povrchova-struktura.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md"]
catalog_prev = "trans-pojem"
catalog_next = "pacing-a-leading-pojem"
catalog_position = 41
catalog_family_size = 42
catalog_sources = ["bandler-grinder-1975b", "dilts-delozier-2000", "gordon-1978", "grice-1975", "hassan-1988", "herman-1992", "langer-1978", "lifton-1961", "petty-cacioppo-1986", "roderique-davies-2009", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975b", "dilts-delozier-2000", "gordon-1978"]
catalog_sources_roots = ["grice-1975"]
catalog_sources_critical = ["hassan-1988", "herman-1992", "langer-1978", "lifton-1961", "petty-cacioppo-1986", "roderique-davies-2009", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Vztah k technikám kompendia", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/zakladni-pojmy.d.toml"
+++

# Transderivační hledání

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-02.41` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Základní pojmy NLP](@/kompendium/nlp-vzorce/zakladni-pojmy/_index.md) |
| **Druh** | pojem |
| **Anglicky** | Transderivational search |
| **Jiné názvy** | TDS |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Transderivační hledání je v neurolingvistickém programování název pro proces, jímž posluchač
při setkání s vágní, mnohoznačnou nebo neúplnou výpovědí prohledává vlastní zkušenosti, aby
jí dal smysl. Slovo „transderivační“ odkazuje na představu, že povrchová věta může být
odvozena z mnoha různých hlubokých struktur a že posluchač si mezi nimi vybírá podle toho, co
sám prožil (Dilts a DeLozier 2000). Když někdo řekne „víte, jaké to je, když se konečně
něco změní“, každý posluchač si pod tím představí jinou změnu, a to tu, která je pro něj
osobně nejvýznamnější. Pojem úzce souvisí s
[hlubokou a povrchovou strukturou](@/kompendium/nlp-vzorce/zakladni-pojmy/hluboka-a-povrchova-struktura.md)
a je teoretickým zdůvodněním vágního jazyka Milton-modelu. Pro kompendium je pojem klíčový,
protože popisuje mechanismus, jímž člověk přijme sdělení za vlastní, ačkoli jeho obsah do něj
dosadil sám. To, co posluchač „pochopil“, pak prožívá jako objev, nikoli jako cizí vliv.

## Původ a souvislosti

Pojem vznikl při pokusu zakladatelů NLP vysvětlit, proč působí hypnotický jazyk Miltona
Ericksona. Bandler a Grinder si všimli, že Erickson často mluvil záměrně neurčitě, používal
slova bez konkrétního obsahu a nechával na klientovi, aby si je naplnil. Tento jazyk popsali
jako soustavu vzorců, které jsou zrcadlovým obrazem meta-modelu: zatímco [meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) se ptá
po chybějících údajích, [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) je úmyslně vynechává (Bandler a Grinder 1975b).
Transderivační hledání je v tomto rámci vysvětlením, proč vágní sdělení nepůsobí prázdně: posluchač ho naplní vlastním významem.

Mechanismus má obdoby, které jsou ve vědě o komunikaci a v psychologii dobře známé. Grice
ukázal, že posluchač vychází z předpokladu, že mluvčí spolupracuje a mluví k věci, a pokud
výpověď sama nedává smysl, dovodí si nevyslovený význam, který by smysl dával (Grice 1975).
Výzkum přesvědčivosti ukazuje, že lidé neprověřují každé sdělení stejně pečlivě a u
méně důležitých věcí reagují spíše na formu než na obsah. Langer a spolupracovníci zjistili,
že žádost doplněná o zdánlivé zdůvodnění, které nic nesdělovalo, byla v situaci malého
významu vyhověna podobně často jako žádost se skutečným důvodem (Langer, Blank a Chanowitz
1978). Psychologie osobnosti zná také jev, kdy lidé přijímají obecné popisy charakteru za
přesné, protože si je vztáhnou na sebe. Všechny tyto poznatky ukazují, že doplňování významu
posluchačem je běžný a silný jev.

## Struktura vzorce

Strukturálně má transderivační hledání tři části. První je podnět s neúplným obsahem: slovo
nebo věta, která nemá jednoznačný referent, například nominalizace („pochopení“, „změna“,
„svoboda“), [nespecifikované sloveso](@/kompendium/nlp-vzorce/meta-model/nespecifikovane-sloveso.md) („něco se ve vás pohne“) nebo nespecifikovaný subjekt
(„někteří lidé zjistí…“). Druhou částí je hledání, kdy posluchač, obvykle bez vědomého úsilí,
vybírá ze své paměti zkušenost, která k podnětu pasuje. Třetí částí je přisouzení: obsah,
který posluchač dosadil, se spojí se zdrojem sdělení, takže posluchač má dojem, že mu mluvčí
řekl něco o něm samém (Bandler a Grinder 1975b). Formy vágního jazyka podrobně popisují
stránky o [úmyslné vágnosti](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md) a o
nominalizacích v Milton-modelu.

Podstatná je asymetrie, kterou tato struktura vytváří. Mluvčí neřekl nic, co by šlo vyvrátit,
protože neřekl nic konkrétního. Posluchač přitom prožívá sdělení jako osobně trefné, protože
obsah pochází z jeho vlastního života. Pokud se později ukáže, že sdělení nebylo pravdivé,
mluvčí může odpovědět, že nic takového netvrdil, a má pravdu. Vágní řeč tak přenáší
odpovědnost za obsah na posluchače, zatímco vliv zůstává mluvčímu. Tato asymetrie je důvodem,
proč je mechanismus tak účinný v náboru do skupin, v prodeji i v ezoterních výkladech.

## Detekční znaky

Manipulativní využití transderivačního hledání se pozná podle hustoty slov bez konkrétního
obsahu v situacích, kde by konkrétní obsah měl být. Varovné znaky jsou řeč plná abstraktních
pojmů o proměně, pochopení a potenciálu, které nejsou nikdy rozvedeny, výpovědi typu „víš,
jak to je, když…“, které předpokládají společnou zkušenost bez jejího popisu, a slibované
výsledky, které si každý představí jinak. Dalším znakem je silný pocit osobní trefnosti u
posluchače, který však nedokáže zopakovat, co konkrétně slyšel. Ve skupinách s vysokou
kontrolou se vágní pojmy často stávají součástí zvláštního slovníku, jehož význam se mění
podle potřeby, což kompendium popisuje u
[terminologické mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md).
Lifton upozorňuje, že takový slovník zužuje myšlení, protože složité zkušenosti shrnuje do
několika pojmů, které vykládá jen autorita (Lifton 1961). U zasaženého člověka se pak
objevuje dojem, že skupina mu „rozumí jako nikdo jiný“, ačkoli toto porozumění sestavil
převážně on sám.

## Legitimní a manipulativní užití

Doplňování významu posluchačem je přirozenou součástí umění, literatury a terapeutické
práce s metaforou. Báseň, která mluví o „cestě domů“, nechává čtenáře, aby si ji naplnil
vlastní zkušeností, a právě v tom je její síla. [Terapeutický příběh](@/kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md), který klientovi
nabídne obraz bez konkrétního výkladu, mu umožní najít v něm vlastní význam (Gordon 1978). V
těchto případech je otevřenost výslovná, posluchač ví, že význam doplňuje sám, a nikdo si jeho
obsah nepřivlastňuje. Manipulativní užití je skryté. Vágní řeč se používá proto, aby si
posluchač dosadil vlastní touhy nebo obavy, a dosazený obsah se pak připíše skupině, produktu
nebo vůdci jako něco, co jen oni mohou naplnit. Rozlišující otázky zní: je otevřenost sdělení
přiznaná, nebo se vydává za konkrétní slib, je obsah, který si posluchač dosadil, později
použit jako závazek a dokáže mluvčí na žádost říct, co konkrétně myslel.

## Vztah k technikám kompendia

Transderivační hledání vysvětluje, proč jsou techniky založené na vágnosti tak odolné vůči
kritice. Terminologická mystifikace obklopuje sdělení pojmy, které zní hluboce, ale nemají
pevný obsah, takže posluchač do nich vkládá vlastní očekávání a vykladač si může kdykoli
vybrat, který výklad platí. Past epistemické vágnosti, kterou kompendium popisuje mezi
technikami pracujícími s paradoxy, staví člověka do situace, kdy nemůže nesouhlasit, protože
neví, s čím přesně by nesouhlasil. Obě techniky využívají tutéž asymetrii: posluchač nese
odpovědnost za obsah, který si doplnil, a mluvčí za nic, co by šlo doložit. Petty a Cacioppo
ukazují, že když posluchač nemá motivaci nebo možnost sdělení pečlivě zpracovat, rozhodují o
jeho postoji spíše okrajové znaky, jako je autorita nebo sympatie zdroje, než obsah argumentů
(Petty a Cacioppo 1986). Vágní řeč podmínky pro takové zpracování vytváří sama, protože
obsah, který by šlo pečlivě posoudit, v ní chybí. Proto se proti ní nelze bránit
protiargumenty, ale jen požadavkem, aby obsah vůbec vznikl.

## Stav důkazů

Obecné jevy, na nichž pojem stojí, jsou dobře doložené. Pragmatika popisuje, jak posluchač
dovozuje nevyslovený význam (Grice 1975), a sociální psychologie ukazuje, že lidé za určitých
podmínek reagují na formu sdělení bez ověřování obsahu (Langer, Blank a Chanowitz 1978).
Specifické tvrzení NLP, že vágní jazyk spouští nevědomé prohledávání zkušeností, které lze
cíleně řídit a využít k navození transu nebo ke změně chování, však kontrolovaně ověřeno
nebylo. Witkowski konstatuje, že výzkumná základna NLP tvrzení oboru převážně nepodporuje
(Witkowski 2010). Roderique-Davies upozorňuje, že NLP přebírá vědecky znějící pojmy, aniž by
je podrobilo testování, a označuje ho za kargokultovní psychologii (Roderique-Davies 2009).
Samotný pojem „transderivační hledání“ je tak spíše pojmenováním známého jevu v terminologii
NLP než teorií s vlastní empirickou oporou.

## Obrana a zotavení

Nejúčinnější obranou je žádat konkrétní obsah. Otázky „co přesně tím myslíte?“, „na jakém
příkladu?“, „čím je to doloženo?“ přenášejí odpovědnost za obsah zpět na mluvčího. Pokud
mluvčí konkrétní obsah opakovaně nedodá a místo toho nabídne další abstraktní slova, je to
užitečná informace. Druhou obranou je všímat si vlastního podílu: když mám silný pocit, že
mi někdo „mluví z duše“, je rozumné se zeptat, co přesně řekl a co jsem si doplnil sám.
Třetí obranou je zapsat si sliby a tvrzení doslovně a vrátit se k nim s odstupem, protože
vágní řeč na papíře ztrácí velkou část své síly. Pro lidi, kteří odešli ze skupin s
rozvinutým vágním slovníkem, bývá součástí zotavení návrat k běžnému jazyku a rozlišení,
které zkušenosti byly jejich vlastní a které jim byly vyloženy skupinou (Hassan 1988).
Herman připomíná, že obnova po dlouhodobé kontrole zahrnuje i obnovu vlastního vyprávění o
tom, co se stalo, vlastními slovy (Herman 1992).

## Literatura

- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Dilts, R., & DeLozier, J. (2000). *Encyclopedia of Systemic Neuro-Linguistic Programming and NLP New Coding*. Scotts Valley: NLP University Press.
- Gordon, D. (1978). *Therapeutic Metaphors: Helping Others through the Looking Glass*. Cupertino: Meta Publications.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Langer, E. J., Blank, A., & Chanowitz, B. (1978). The mindlessness of ostensibly thoughtful action: The role of „placebic“ information in interpersonal interaction. *Journal of Personality and Social Psychology*, 36(6), 635–642.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Roderique-Davies, G. (2009). Neuro-linguistic programming: Cargo cult psychology? *Journal of Applied Research in Higher Education*, 1(2), 58–63.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Základní pojmy NLP](@/kompendium/nlp-vzorce/zakladni-pojmy/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Hluboká a povrchová struktura](@/kompendium/nlp-vzorce/zakladni-pojmy/hluboka-a-povrchova-struktura.md) – příbuzné heslo (Základní pojmy NLP, Deep and surface structure)
- [Trans](@/kompendium/nlp-vzorce/zakladni-pojmy/trans-pojem.md) – příbuzné heslo (Základní pojmy NLP, Trance (concept))
- [Úmyslná vágnost](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md) – příbuzné heslo (Milton-model, Artful vagueness)
- [Nominalizace v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/nominalizace-milton.md) – příbuzné heslo (Milton-model, Nominalisations (Milton Model))
- [Nespecifikovaná slovesa v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/nespecifikovana-slovesa-milton.md) – příbuzné heslo (Milton-model, Unspecified verbs (Milton Model))
- [Indukce přetížením](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/indukce-pretizenim.md) – příbuzné heslo (Ericksonovská hypnóza, Overload induction)

**V kompendiu**

- [EA-1.1.3 Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.4.24 Past epistemické vágnosti](@/kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Trans](@/kompendium/nlp-vzorce/zakladni-pojmy/trans-pojem.md) – předchozí heslo rodiny
- [Pacing a leading](@/kompendium/nlp-vzorce/zakladni-pojmy/pacing-a-leading-pojem.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
