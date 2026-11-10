+++
title = "Anonymní autorita"
description = "Klam „vědci prokázali“ a „odborníci tvrdí“: autorita bez jména a bez dohledatelného zdroje, kterou nelze prověřit. Struktura, znaky, odlišení a obrana."
weight = 8
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-relevance", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Anonymní autorita", "Appeal to anonymous authority", "„odborníci tvrdí“", "„studie ukazují“", "nejmenovaný zdroj", "Klamy relevance", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-02.08"
catalog_slug = "anonymni-autorita"
catalog_family = "relevance"
catalog_family_code = "02"
catalog_family_title = "Klamy relevance"
catalog_family_en = "Fallacies of relevance"
catalog_part = "relevance"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Appeal to anonymous authority"
catalog_aliases = ["„odborníci tvrdí“", "„studie ukazují“", "nejmenovaný zdroj"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "odvolani-na-autoritu"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["odvolani-na-autoritu"]
catalog_related = ["odvolani-na-autoritu", "ad-populum", "vyhybava-slova", "argument-opakovanim", "vedecky-zargon", "neuro-zargon"]
catalog_related_declared = ["odvolani-na-autoritu", "vyhybava-slova", "ad-populum", "argument-opakovanim", "neuro-zargon"]
catalog_kompendium = ["kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md", "kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md", "kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/dialekticke-taktiky/argument-opakovanim.md", "kompendium/argumentacni-fauly/jazykove-klamy/vyhybava-slova.md", "kompendium/argumentacni-fauly/predpoklady-argumentu/dokaz-tvrzenim.md", "kompendium/argumentacni-fauly/relevance/odvolani-na-autoritu.md", "kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-schemata.md", "kompendium/nlp-vzorce/urovne-a-pozice/uroven-prostredi.md", "kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md", "kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md"]
catalog_prev = "odvolani-na-autoritu"
catalog_next = "ad-populum"
catalog_position = 8
catalog_family_size = 28
catalog_sources = ["copi-cohen-mcmahon-2014", "damer-2009", "gilovich-1991", "govier-2010", "hasher-1977", "huff-1954", "langer-1978", "petty-cacioppo-1986", "walton-2008", "walton-reed-macagno-2008", "van-der-linden-2023"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "damer-2009", "govier-2010", "walton-2008", "walton-reed-macagno-2008"]
catalog_sources_roots = []
catalog_sources_critical = ["gilovich-1991", "hasher-1977", "huff-1954", "langer-1978", "petty-cacioppo-1986", "van-der-linden-2023"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Varianty", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/relevance.toml"
+++

# Anonymní autorita

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-02.08` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Klamy relevance](@/kompendium/argumentacni-fauly/relevance/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Appeal to anonymous authority |
| **Jiné názvy** | „odborníci tvrdí“, „studie ukazují“, nejmenovaný zdroj |
| **Obecnější heslo** | [Odvolání na nepatřičnou autoritu](@/kompendium/argumentacni-fauly/relevance/odvolani-na-autoritu.md) |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Anonymní autorita je podoba
[odvolání na nepatřičnou autoritu](@/kompendium/argumentacni-fauly/relevance/odvolani-na-autoritu.md),
při které se tvrzení opírá o autoritu, jež není jmenována ani jinak určena, takže ji nelze
dohledat a prověřit. Typické formulace zní „vědci prokázali“, „studie ukazují“, „lékaři
doporučují“, „odborníci se shodují“ nebo „podle dobře informovaných zdrojů“. Klam nespočívá v
tom, že se mluvčí na autoritu odvolává, ale v tom, že posluchači odpírá možnost zjistit, kdo
přesně co tvrdil, na jakých datech a s jakou mírou jistoty. Teorie argumentace popisuje
argument odborností jako schéma, jehož síla závisí na odpovědích na [kritické otázky](@/kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-schemata.md) o
odbornosti, oboru, spolehlivosti a podkladech zdroje (Walton, Reed a Macagno 2008). U
anonymní autority nelze na žádnou z těchto otázek odpovědět, a argument proto nemá víc váhy
než [holé tvrzení](@/kompendium/argumentacni-fauly/predpoklady-argumentu/dokaz-tvrzenim.md) mluvčího. Anonymní autorita zároveň působí silněji než holé tvrzení, protože
k němu přidává zdání odborné opory.

## Původ a souvislosti

Tah je starší než jeho pojmenování a souvisí s jazykovými prostředky, které katalog
popisuje jako [vyhýbavá slova](@/kompendium/argumentacni-fauly/jazykove-klamy/vyhybava-slova.md):
neurčitými podměty, trpným rodem a výrazy typu „říká se“ nebo „je známo“, které umožňují
něco tvrdit, aniž by za tvrzení někdo ručil. Tradiční učebnice klamů se mu věnovaly jen
okrajově, protože ho chápaly jako zvláštní případ odvolání na autoritu (Copi, Cohen a
McMahon 2014). S rozvojem masové reklamy a později internetu však anonymní autorita získala
samostatný význam. Reklama na doplňky stravy, kosmetiku nebo léčebné pomůcky se běžně
opírá o nejmenované studie a o „lékaře“, kteří nejsou jmenováni, a sdílený obsah na
sociálních sítích šíří tvrzení přisuzovaná „vědcům“, jejichž jména ani práce nelze najít.

Huff ve své populární knize o statistice doporučoval položit si u každého čísla otázku, kdo
to říká a jak to ví, a upozorňoval, že za působivým číslem se může skrývat zkreslený vzorek
nebo zájem toho, kdo ho zveřejnil (Huff 1954). Teorie argumentace dodává, že
legitimní spoléhání na odborníky vyžaduje, aby zdroj byl určitelný, protože jen tak lze
posoudit jeho odbornost a spolehlivost (Walton 2008). V kompendiu se anonymní autorita
objevuje u [vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md),
kde se zdání shody odborníků vytváří bez skutečného odborného posouzení, a u technik, kdy
generovaný text přisuzuje tvrzení neexistujícím nebo neurčeným zdrojům.

## Struktura argumentu

Rozložený argument má tuto podobu. Nějací odborníci, studie nebo zdroje tvrdí T. Odborníci,
studie a zdroje jsou obvykle spolehliví. Proto je T pravdivé. Druhá premisa je obecně
přijatelná, ale první je neověřitelná, a závěr proto stojí jen na slovu toho, kdo argument
předkládá. Mluvčí tak přenáší na sebe důvěru, kterou posluchač chová k vědě, medicíně nebo
novinářství obecně, aniž by ukázal, že konkrétní tvrzení z těchto zdrojů skutečně pochází.
Damer mezi podmínky legitimního odvolání na autoritu řadí, aby šlo o skutečného odborníka v
oboru, do něhož otázka patří, a u anonymní autority nelze posoudit ani tuto základní podmínku
(Damer 2009).

Častá je i zesilující podoba, kdy se anonymní autorita spojí s tvrzením o shodě: „odborníci
se shodují“. Tím se k neověřitelnému zdroji přidá ještě neověřitelný počet a vzniká obraz
jednotného odborného názoru, který nemusí existovat. Opačnou podobou je anonymní kritika:
„mnozí odborníci pochybují“ se používá k vytvoření zdání sporu tam, kde obor žádný spor
nevede. V obou podobách zůstává struktura stejná: tvrzení o autoritě je samo neověřené a
nese celou váhu argumentu.

## Varianty

Reklamní varianta spojuje neurčenou autoritu s výrobkem: „doporučováno odborníky“,
„klinicky testováno“, „vyvinuto ve spolupráci s lékaři“. Posluchač se nedozví, kdo testoval,
s jakým výsledkem a kdo zaplatil. Zpravodajská varianta se opírá o „zdroje blízké“ nějaké
instituci, aniž by čtenář věděl, zda redakce zdroj ověřila a zda je jich víc. Institucionální
varianta mluví jménem neurčeného celku: „vedení si přeje“, „komise usoudila“, „bylo
rozhodnuto“, takže nelze zjistit, kdo za rozhodnutím stojí a koho se ptát. Digitální
varianta vzniká tam, kde generovaný text nebo automaticky sdílený obsah uvádí „výzkumy“ bez
odkazu, případně s odkazem, který neexistuje. Všechny varianty mají společné to, že
odpovědnost za tvrzení se rozplývá: nikdo konkrétní ho nevyslovil, a nikoho proto nelze
požádat o doklad ani volat k odpovědnosti za chybu. V uzavřených skupinách může mít tato
neurčitost i mocenskou funkci, protože rozhodnutí bez autora nelze napadnout.

## Detekční znaky

Prvním znakem je chybějící jméno, instituce, název práce nebo místo publikace. Tvrzení
odkazuje na skupinu, ne na konkrétní zdroj. Druhým znakem je přesnost čísla, která
neodpovídá neurčitosti zdroje: „zlepšuje paměť o polovinu“, aniž by bylo řečeno, v jaké
studii, na kolika lidech a ve srovnání s čím. Třetím znakem je trpný rod a neosobní
konstrukce, které zakrývají, kdo co zjistil: „bylo prokázáno“, „je známo“, „ukazuje se“.
Čtvrtým znakem je spojení s tajemstvím nebo potlačováním: „jen se o tom nemluví“, „oficiální
místa to tají“, což má vysvětlit, proč zdroj nelze najít. Pátým znakem je opakování. Tvrzení
se šíří z jednoho textu do druhého, každý odkazuje na „studie“, ale žádný na konkrétní
práci. Opakování přitom zvyšuje vnímanou pravdivost tvrzení, i když k němu nepřibyl žádný
nový důkaz (Hasher, Goldstein a Toppino 1977). Katalog tento mechanismus popisuje jako
[argument opakováním](@/kompendium/argumentacni-fauly/dialekticke-taktiky/argument-opakovanim.md).

## Odlišení od platné argumentace

Anonymita zdroje není vždy klamem. Novinářská praxe připouští anonymní zdroje, pokud redakce
zná jejich totožnost, ověřila jejich přístup k informacím, pokud možno má potvrzení z více
nezávislých zdrojů a otevřeně čtenáři sděluje, že zdroj je anonymní a proč. Čtenář pak ví,
jakou váhu tvrzení má, a za ověření ručí redakce, která může být za chybu volána k
odpovědnosti. Podobně je legitimní shrnout odborný konsenzus obecně, například „podle
převažujícího názoru epidemiologů“, pokud je shrnutí na požádání doložitelné odkazem na
přehledovou studii nebo stanovisko odborné společnosti (Govier 2010).

Rozhodující je tedy dohledatelnost a otevřenost. Pokud lze zdroj na požádání určit, nebo pokud
je anonymita přiznána a zdůvodněna a nejistota je vyznačena, nejde o klam. Pokud anonymita
slouží k tomu, aby tvrzení nemohlo být ověřeno, a je doprovázena sebejistým tónem a přesnými
čísly, jde o klam bez ohledu na to, zda je tvrzení náhodou pravdivé.

## Stav poznání

Výzkum zpracování informací z druhé ruky ukazuje, že sdělení se při předávání zjednodušují,
ztrácejí výhrady a zesilují se, takže to, co původně byla opatrná hypotéza jedné studie, se
po několika předáních mění v „prokázaný fakt“ (Gilovich 1991). Anonymní autorita tento
proces maskuje, protože ze sdělení mizí právě ten článek, podle něhož by se dalo zkreslení
odhalit. Výzkum bezmyšlenkovitého jednání ukázal, že lidé často reagují na pouhou formu
zdůvodnění, i když zdůvodnění neobsahuje žádnou informaci (Langer, Blank a Chanowitz 1978).
Obraty jako „vědci prokázali“ mají formu zdůvodnění, ale obsah mu chybí. Model
pravděpodobnosti zpracování dodává, že vodítka o zdroji, k nimž patří i obecný odkaz na
vědu, mají největší vliv tam, kde posluchač sdělení podrobně nezkoumá (Petty a Cacioppo
1986). Van der Linden mezi typické techniky dezinformací řadí vydávání se za odborníky a
odborné instituce a popisuje, že znalost této techniky snižuje náchylnost k ní (van der
Linden 2023). Přímé studie zaměřené právě na anonymní autoritu jsou méně časté než studie o
autoritě obecně.

## Obrana a odpověď

Základní obranou je otázka po zdroji: kdo přesně, [kde a kdy](@/kompendium/nlp-vzorce/urovne-a-pozice/uroven-prostredi.md) to zjistil, na kolika lidech a ve
srovnání s čím. Otázka není útokem, ale běžnou součástí posuzování tvrzení, a ten, kdo
tvrzení předkládá, by na ni měl umět odpovědět. Pokud odpověď nepřijde, zůstává tvrzení
neověřené bez ohledu na to, jak sebejistě zaznělo. Huff shrnul obranu do jednoduchých otázek:
kdo to říká, jak to ví a co ve sdělení chybí (Huff 1954). U textů generovaných jazykovými
modely je obrana zvlášť důležitá, protože takové texty mohou přisuzovat tvrzení
neexistujícím studiím nebo skutečným autorům, kteří je nikdy nevyslovili, jak kompendium
popisuje u [obcházení přisouzení zdroje](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md).
Pro redakce, vědecké instituce a zdravotnické organizace je ochranou důsledné uvádění zdrojů
a oprava, když se ukáže, že zdroj neexistuje. Pro čtenáře platí, že obecný odkaz na vědu
je důvodem dohledat konkrétní práci, ne důvodem tvrzení přijmout (Walton 2008).

## Literatura

- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Govier, T. (2010). *A Practical Study of Argument* (7. vyd.). Belmont: Wadsworth.
- Hasher, L., Goldstein, D., & Toppino, T. (1977). Frequency and the conference of referential validity. *Journal of Verbal Learning and Verbal Behavior*, 16(1), 107–112.
- Huff, D. (1954). *How to Lie with Statistics*. New York: W. W. Norton.
- Langer, E. J., Blank, A., & Chanowitz, B. (1978). The mindlessness of ostensibly thoughtful action: The role of „placebic“ information in interpersonal interaction. *Journal of Personality and Social Psychology*, 36(6), 635–642.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Walton, D. N. (2008). *Informal Logic: A Pragmatic Approach* (2. vyd.). Cambridge: Cambridge University Press.
- Walton, D., Reed, C., & Macagno, F. (2008). *Argumentation Schemes*. Cambridge: Cambridge University Press.
- van der Linden, S. (2023). *Foolproof: Why Misinformation Infects Our Minds and How to Build Immunity*. London: 4th Estate.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Klamy relevance](@/kompendium/argumentacni-fauly/relevance/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Odvolání na nepatřičnou autoritu](@/kompendium/argumentacni-fauly/relevance/odvolani-na-autoritu.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Odvolání na nepatřičnou autoritu](@/kompendium/argumentacni-fauly/relevance/odvolani-na-autoritu.md) – příbuzné heslo (Klamy relevance, Appeal to authority)
- [Odvolání na většinu](@/kompendium/argumentacni-fauly/relevance/ad-populum.md) – příbuzné heslo (Klamy relevance, Appeal to popularity)
- [Vyhýbavá slova](@/kompendium/argumentacni-fauly/jazykove-klamy/vyhybava-slova.md) – příbuzné heslo (Klamy jazyka a dvojznačnosti, Weasel words)
- [Argument opakováním](@/kompendium/argumentacni-fauly/dialekticke-taktiky/argument-opakovanim.md) – příbuzné heslo (Rétorické a dialogické taktiky, Argument from repetition)
- [Vědecký žargon jako argument](@/kompendium/argumentacni-fauly/hodnoty-a-veda/vedecky-zargon.md) – příbuzné heslo (Klamy hodnot, přírody a vědy, Scientism by jargon)
- [Neurožargon](@/kompendium/nlp-vzorce/vliv-a-zneuziti/neuro-zargon.md) – příbuzné heslo (NLP vzorce: Vliv a zneužití NLP, Neuro-jargon)

**V kompendiu**

- [EA-2.1.9 Vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-9.1.6 LLM Source Attribution Bypass](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-9.1.1 LLM Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Odvolání na nepatřičnou autoritu](@/kompendium/argumentacni-fauly/relevance/odvolani-na-autoritu.md) – předchozí heslo rodiny
- [Odvolání na většinu](@/kompendium/argumentacni-fauly/relevance/ad-populum.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
