+++
title = "Nedovolený větší termín"
description = "Sylogismus, jehož závěr mluví o celé třídě většího termínu, ačkoli premisa o ní mluví jen zčásti: typické záporné závěry o lidech mimo skupinu, znaky a obrana."
weight = 5
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-formalni", "fauly-formalni-klam", "fauly-uziti-chyba"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Nedovolený větší termín", "Illicit major", "nedovolené rozšíření většího termínu", "nedovolená distribuce většího termínu", "Formální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-01.05"
catalog_slug = "nedovoleny-vetsi-termin"
catalog_family = "formalni"
catalog_family_code = "01"
catalog_family_title = "Formální klamy"
catalog_family_en = "Formal fallacies"
catalog_part = "formalni"
catalog_type = "formal"
catalog_type_cs = "formální klam"
catalog_en = "Illicit major"
catalog_aliases = ["nedovolené rozšíření většího termínu", "nedovolená distribuce většího termínu"]
catalog_use = "chyba"
catalog_use_cs = "převážně chyba uvažování"
catalog_risk = "nizke"
catalog_risk_cs = "nízké"
catalog_broader = "formalni-klam"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["formalni-klam"]
catalog_related = ["popreni-predchudce", "nerozlozeny-stredni-termin", "nedovoleny-mensi-termin", "vylucujici-premisy"]
catalog_related_declared = ["nedovoleny-mensi-termin", "nerozlozeny-stredni-termin", "popreni-predchudce", "vylucujici-premisy"]
catalog_kompendium = ["kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/07-teoreticke-reflexe/kognitivni-vedy.md", "kompendium/argumentacni-fauly/formalni/popreni-predchudce.md", "kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md", "kompendium/argumentacni-fauly/teorie-argumentace/pravidlo-platnosti.md", "kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md"]
catalog_prev = "nerozlozeny-stredni-termin"
catalog_next = "nedovoleny-mensi-termin"
catalog_position = 5
catalog_family_size = 14
catalog_sources = ["copi-cohen-mcmahon-2014", "damer-2009", "govier-2010", "grice-1975", "johnson-blair-1977", "kahneman-2011", "mercier-sperber-2011", "stanovich-west-2000", "toulmin-1958", "walton-2008", "whately-1826", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "damer-2009", "govier-2010", "johnson-blair-1977", "toulmin-1958", "walton-2008", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_roots = ["grice-1975", "whately-1826"]
catalog_sources_critical = ["kahneman-2011", "mercier-sperber-2011", "stanovich-west-2000"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 3
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/formalni.toml"
+++

# Nedovolený větší termín

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-01.05` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) |
| **Druh** | formální klam |
| **Anglicky** | Illicit major |
| **Jiné názvy** | nedovolené rozšíření většího termínu, nedovolená distribuce většího termínu |
| **Obecnější heslo** | [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) |
| **Užití** | převážně chyba uvažování |
| **Riziko zneužití** | nízké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Nedovolený větší termín je formální klam kategorického sylogismu, v němž je větší termín v
závěru rozložen, tedy vztažen na všechny prvky své třídy, ačkoli ve větší premise rozložen
není. Větší termín je přísudkem závěru a vyskytuje se ve větší premise. Klasické pravidlo
sylogismu požaduje, aby žádný termín nebyl v závěru rozložen, pokud nebyl rozložen už v
premise; jinak závěr tvrdí o celé třídě víc, než o ní premisy řekly (Copi, Cohen a McMahon
2014). Nejčastěji klam vzniká u záporných závěrů, protože zápor rozkládá přísudek: věta
„žádný S není P“ mluví o všech P a vylučuje je ze třídy S. Typická podoba zní: všechna M jsou
P, žádné S není M, tedy žádné S není P. První premisa však o třídě P říká jen to, že
obsahuje všechna M, nikoli že obsahuje jen je. Do třídy P mohou patřit i prvky, které M
nejsou, a mezi nimi i S. V běžné řeči se klam projevuje jako úsudek o lidech mimo skupinu:
z pravidla, které popisuje členy skupiny, se vyvodí, že ostatní danou vlastnost nemají.

## Původ a souvislosti

Pravidlo o rozložení krajních termínů patří k jádru tradiční sylogistiky a jeho porušení
učebnice od středověku rozlišovaly podle toho, zda se týká většího, nebo menšího termínu.
Novověká učebnicová logika obě chyby řadila mezi klamy formy, které lze poznat bez znalosti
obsahu (Whately 1826). Dnešní učebnice je uvádějí ve výkladu pravidel sylogismu spolu s
nerozloženým středním termínem a s klamem čtyř termínů (Copi, Cohen a McMahon 2014). Z
hlediska výrokové logiky je nedovolený větší termín v nejčastější podobě kategorickou obdobou
[popření předchůdce](@/kompendium/argumentacni-fauly/formalni/popreni-predchudce.md): výrok
„všechna M jsou P“ odpovídá podmínce „je-li něco M, je to P“, a z toho, že něco M není, nelze
vyvodit, že to není P. Neformální logika připomíná, že čisté sylogismy se v každodenní
argumentaci objevují zřídka a že argumenty je třeba nejdřív rekonstruovat, než se dá posoudit
jejich forma (Johnson a Blair 1977). Právě rekonstrukce však ukazuje, jak často se za
rozumně znějícím záporným závěrem skrývá tato chyba. V Toulminových pojmech stojí takový úsudek
na záruce, kterou mluvčí nevyslovil a kterou nepodložil (Toulmin 1958).

## Struktura argumentu

Úsudek má pravidlo o skupině, vyloučení jednotlivce nebo jiné skupiny z ní a záporný závěr o
vlastnosti. Pravidlo zní například tak, že všichni zaměstnanci s přístupem k citlivým datům
podepsali mlčenlivost. Druhá premisa konstatuje, že určití lidé přístup nemají. Závěr tvrdí,
že mlčenlivost nepodepsal nikdo z nich. Vada je v tom, že pravidlo vypovídá o lidech s
přístupem, ale o lidech bez přístupu mlčí. Mlčenlivost mohli podepsat i oni, třeba proto, že
ji podepisuje každý nový zaměstnanec, nebo proto, že přístup dříve měli. Klam se objevuje
také v podobě „někteří S nejsou P“, protože i částečně záporný výrok rozkládá svůj přísudek.
Formální jádro je stejné: závěr vylučuje prvky z třídy, o jejíž hranicích premisa nic neříká.
[Pragma-dialektika](@/kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md) takový úsudek posuzuje jako porušení pravidla platnosti; zároveň vyžaduje,
aby posuzovatel zkusil najít nevyslovenou premisu, která by úsudek napravila, a zeptal se, zda
by ji mluvčí mohl hájit (van Eemeren a Grootendorst 1992). Zde by šlo o premisu, že mlčenlivost
podepisují jen lidé s přístupem; ta je věcným tvrzením, které lze v evidenci ověřit.

## Detekční znaky

Prvním znakem je záporný závěr s univerzálním dosahem: „nikdo z nich“, „žádný“, „nikdy“.
Druhým znakem je, že pravidlo, z něhož se usuzuje, popisuje povinnosti nebo vlastnosti
určité skupiny, a závěr se týká lidí mimo ni. Třetím znakem je slovo „všichni“ v premise, které
posluchač mimoděk čte jako „jen“. Tato záměna je v běžné řeči častá, protože rozhovor nese i
to, co mluvčí nevyslovil; Grice ukázal, že posluchači z vět vyvozují víc, než věty logicky
tvrdí, a že takové vyvozování je v rozhovoru zpravidla rozumné (Grice 1975). V institucionálním
prostředí se klam projevuje u výkladu pravidel: pravidlo ukládá povinnost určité skupině, a
z toho se usoudí, že ostatní tutéž povinnost nebo totéž oprávnění nemají. Damer řadí takové
úsudky k vadám struktury, které posluchač přehlédne proto, že závěr zní věcně a střízlivě
(Damer 2009).

## Odlišení od platné argumentace

Platný úsudek se stejným obsahem vzniká, když je větší termín rozložen už v premise. Pokud
pravidlo zní, že každý, kdo podepsal mlčenlivost, má přístup do archivu, a žádný externista
přístup nemá, pak platně plyne, že žádný externista mlčenlivost nepodepsal. Premisa tu mluví o
všech signatářích, a závěr je proto smí vyloučit. Platný je úsudek i tehdy, když premisa
obsahuje slovo „jen“: věta „jen lidé s přístupem podepsali mlčenlivost“ znamená, že každý
signatář má přístup, a s ní úsudek drží. Rozdíl mezi „všichni M jsou P“ a „jen M jsou P“ je
proto rozhodující a v rozhovoru se vyplatí ho výslovně ověřit. Princip shovívavého výkladu
vede k tomu, aby posuzovatel nejdřív zjistil, zda mluvčí mínil silnější tvrzení (Govier
2010). Pokud ano, úsudek je platný a sporná je jen jeho premisa; pokud ne, jde o klam. Mimo
deduktivní rámec může jít i o rozumný pravděpodobnostní odhad, pokud je známo, že vlastnost
P se mimo skupinu M vyskytuje vzácně. Takový odhad je však třeba podat jako odhad a opřít o
údaje o lidech mimo skupinu (Walton 2008).

## Stav poznání

Psychologie usuzování ukazuje, že sylogismy se zápornými premisami a závěry patří k
nejobtížnějším a že lidé při jejich hodnocení spoléhají spíš na celkový dojem z věty než na
rozložení termínů. Opakovaně se doložil také sklon obracet obecné kladné výroky, tedy číst
„všechna M jsou P“ jako „všechna P jsou M“; právě tento posun dělá z nedovoleného většího
termínu úsudek, který působí platně. Stanovich a West ukázali, že úspěšnost v takových
úlohách se mezi lidmi liší a souvisí s kognitivními schopnostmi i s ochotou odložit intuitivní
odpověď a úlohu prověřit (Stanovich a West 2000). Kahneman k tomu dodává obecnější rámec:
intuitivní zpracování vytváří souvislý příběh z toho, co je po ruce, a kontrolující myšlení
ho bez zvláštního podnětu nezpochybní (Kahneman 2011). Mercier a Sperber nabízejí výklad,
proč jsou takové chyby v izolovaném myšlení časté a v diskusi méně: usuzování podle nich
slouží hlavně k hodnocení cizích argumentů, a lidé proto chyby snáz najdou v úsudku druhého
než ve vlastním (Mercier a Sperber 2011). Kapitola o
[kognitivních vědách](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) tyto poznatky
zasazuje do širšího výkladu dvou systémů zpracování.

## Obrana a odpověď

Nejpřímější odpovědí je otázka po lidech mimo skupinu: víme o nich něco, nebo pravidlo mluví
jen o členech skupiny? Pokud mluvčí odpoví, že o ostatních nic neví, závěr padá a je třeba
ho nahradit přímým zjištěním. Pokud tvrdí, že vlastnost mají jen členové skupiny, dostává se
spor k věcnému tvrzení, které lze ověřit. Druhou odpovědí je protipříklad stejné formy:
všichni lékaři mají vysokoškolské vzdělání, zdravotní sestry nejsou lékaři, tedy žádná sestra
nemá vysokoškolské vzdělání. Absurdita závěru ukazuje vadu formy bez sporu o původní téma.
Třetí odpovědí je převést sylogismus do obrazu: třída lidí s vlastností P je větší kruh,
skupina M kruh uvnitř něj, a jednotlivec mimo M může stále ležet uvnitř P. Takové znázornění
Vennovými diagramy je standardní učebnicovou metodou ověření sylogismu (Copi, Cohen a McMahon
2014). V institucionálním prostředí, například při auditu nebo při posuzování nároků, je
spolehlivější obranou ověřit stav přímo v evidenci než usuzovat z pravidel o jiné skupině.
Technika [logické diskontinuity](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md)
ukazuje, proč se taková kontrola vyplatí právě u dlouhých řetězců úvah, kde jeden neplatný krok
mezi platnými snadno zapadne. Pragma-dialektické [pravidlo platnosti](@/kompendium/argumentacni-fauly/teorie-argumentace/pravidlo-platnosti.md) dává obraně obecnou
oporu: kdo předkládá závěr jako závazný, musí ho opřít o platný úsudek (van Eemeren a
Grootendorst 2004).

## Literatura

- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Govier, T. (2010). *A Practical Study of Argument* (7. vyd.). Belmont: Wadsworth.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Johnson, R. H., & Blair, J. A. (1977). *Logical Self-Defense*. Toronto: McGraw-Hill Ryerson.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Mercier, H., & Sperber, D. (2011). Why do humans reason? Arguments for an argumentative theory. *Behavioral and Brain Sciences*, 34(2), 57–74.
- Stanovich, K. E., & West, R. F. (2000). Individual differences in reasoning: Implications for the rationality debate? *Behavioral and Brain Sciences*, 23(5), 645–665.
- Toulmin, S. E. (1958). *The Uses of Argument*. Cambridge: Cambridge University Press.
- Walton, D. N. (2008). *Informal Logic: A Pragmatic Approach* (2. vyd.). Cambridge: Cambridge University Press.
- Whately, R. (1826). *Elements of Logic*. London: J. Mawman.
- van Eemeren, F. H., & Grootendorst, R. (1992). *Argumentation, Communication, and Fallacies: A Pragma-Dialectical Perspective*. Hillsdale: Lawrence Erlbaum.
- van Eemeren, F. H., & Grootendorst, R. (2004). *A Systematic Theory of Argumentation: The Pragma-Dialectical Approach*. Cambridge: Cambridge University Press.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Popření předchůdce](@/kompendium/argumentacni-fauly/formalni/popreni-predchudce.md) – příbuzné heslo (Formální klamy, Denying the antecedent)
- [Nerozložený střední termín](@/kompendium/argumentacni-fauly/formalni/nerozlozeny-stredni-termin.md) – příbuzné heslo (Formální klamy, Undistributed middle)
- [Nedovolený menší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-mensi-termin.md) – příbuzné heslo (Formální klamy, Illicit minor)
- [Vylučující premisy](@/kompendium/argumentacni-fauly/formalni/vylucujici-premisy.md) – příbuzné heslo (Formální klamy, Exclusive premises)

**V kompendiu**

- [EA-5.1.5 Logická diskontinuita](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Nerozložený střední termín](@/kompendium/argumentacni-fauly/formalni/nerozlozeny-stredni-termin.md) – předchozí heslo rodiny
- [Nedovolený menší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-mensi-termin.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
