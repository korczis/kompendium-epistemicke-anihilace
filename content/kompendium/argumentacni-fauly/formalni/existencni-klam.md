+++
title = "Existenční klam"
description = "Formální klam, který z obecných premis vyvozuje částečný závěr o existenci: kde se ve výroku skrytě předpokládá, že třída má členy, a jak to rozpoznat."
weight = 8
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-formalni", "fauly-formalni-klam", "fauly-uziti-chyba"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Existenční klam", "Existential fallacy", "klam existenčního předpokladu", "neoprávněný existenční import", "Formální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-01.08"
catalog_slug = "existencni-klam"
catalog_family = "formalni"
catalog_family_code = "01"
catalog_family_title = "Formální klamy"
catalog_family_en = "Formal fallacies"
catalog_part = "formalni.b"
catalog_type = "formal"
catalog_type_cs = "formální klam"
catalog_en = "Existential fallacy"
catalog_aliases = ["klam existenčního předpokladu", "neoprávněný existenční import"]
catalog_use = "chyba"
catalog_use_cs = "převážně chyba uvažování"
catalog_risk = "nizke"
catalog_risk_cs = "nízké"
catalog_broader = "formalni-klam"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["formalni-klam"]
catalog_related = ["nedovoleny-mensi-termin", "ctyri-terminy", "vylucujici-premisy", "zamena-kvantifikatoru", "existencni-presupozice"]
catalog_related_declared = ["vylucujici-premisy", "nedovoleny-mensi-termin", "ctyri-terminy", "existencni-presupozice", "zamena-kvantifikatoru"]
catalog_kompendium = ["kompendium/03-zakladni-kategorie/kapitola-1.md", "kompendium/forensic-legal/_index.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/03-zakladni-kategorie/kapitola-1.md", "kompendium/argumentacni-fauly/formalni/vylucujici-premisy.md", "kompendium/nlp-vzorce/presupozice/existencni-presupozice.md"]
catalog_prev = "ctyri-terminy"
catalog_next = "potvrzeni-disjunktu"
catalog_position = 8
catalog_family_size = 14
catalog_sources = ["copi-cohen-mcmahon-2014", "hamblin-1970", "kahneman-2011", "kunda-1990", "lifton-1961", "stanovich-west-2000", "whately-1826", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "hamblin-1970", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_roots = ["whately-1826"]
catalog_sources_critical = ["kahneman-2011", "kunda-1990", "lifton-1961", "stanovich-west-2000"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/formalni.b.toml"
+++

# Existenční klam

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-01.08` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) |
| **Druh** | formální klam |
| **Anglicky** | Existential fallacy |
| **Jiné názvy** | klam existenčního předpokladu, neoprávněný existenční import |
| **Obecnější heslo** | [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) |
| **Užití** | převážně chyba uvažování |
| **Riziko zneužití** | nízké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Existenční klam je chyba sylogistického usuzování, při níž se ze dvou obecných premis vyvozuje
částečný závěr, tedy závěr tvrdící, že „některé“ věci určitého druhu mají nějakou vlastnost.
Obecné výroky typu „každý, kdo…“ nebo „žádný, kdo…“ v moderním výkladu logiky netvrdí, že
třída, o které mluví, má vůbec nějaké členy. Částečný výrok to tvrdí vždy. Kdo tedy přechází
od dvou obecných vět k větě o „některých“, přidává do závěru tvrzení o existenci, které v
premisách nebylo. Učebnice logiky formulují tuto podmínku jako jedno z pravidel platného
kategorického sylogismu: ze dvou obecných premis nelze vyvodit částečný závěr, pokud se
předpoklad existence nedoplní jako samostatná premisa (Copi, Cohen a McMahon 2014). Klam je
formální v přesném smyslu: úsudek je neplatný bez ohledu na to, o čem mluví, a závěr může
být náhodou pravdivý, ačkoli z premis neplyne.

Pro čtenáře kompendia je existenční klam důležitý méně jako školní chyba a více jako
nenápadný přenos víry v existenci. Věta „každý, kdo zradil, ponese následky“ zní jako
pravidlo, ale v rozhovoru často funguje jako tvrzení, že zrádci jsou. Formální rozbor
ukazuje, že pravidlo o třídě a zjištění, že třída má členy, jsou dvě různé věci.

## Původ a souvislosti

Tradiční aristotelská logika pracovala s předpokladem, že termíny sylogismu označují
neprázdné třídy. Za tohoto předpokladu platí celý tradiční čtverec protikladů včetně
podřazení: z věty „všichni S jsou P“ plyne „někteří S jsou P“. Logika devatenáctého
století, spojovaná se jmény George Boole a John Venn, tento předpoklad opustila a obecné
výroky vyložila jako podmíněné: „pro cokoli platí, že je-li to S, je to P“. Takový výrok je
pravdivý i tehdy, když žádné S neexistuje. Učebnice logiky proto rozlišují tradiční a
booleovský výklad a upozorňují, že v booleovském výkladu z tradičního čtverce zbývají jen
vztahy kontradikce a že každý úsudek, který existenci tiše předpokládá, se dopouští právě
existenčního klamu (Copi, Cohen a McMahon 2014).

Richard Whately ve svých Základech logiky dělil klamy na logické, kde závěr z premis formálně
neplyne, a mimologické, kde potíž leží v obsahu nebo v jazyce (Whately 1826). Existenční klam
stojí na hranici obou skupin. Je to formální vada, ale prakticky se projevuje tím, že
mluvčí i posluchač mlčky doplní premisu o existenci, protože v běžné řeči se o prázdných
třídách obvykle nemluví. Hamblin ve své kritice takzvaného standardního výkladu klamů
ukázal, že tradiční seznamy jsou poskládány z položek různého původu a že běžná definice
klamu jako argumentu, který se zdá platný, ale platný není, na mnohé z nich sedí jen
obtížně (Hamblin 1970). U formálních klamů, jako je tento, je naopak definice přesná:
neplatnost lze ukázat protipříkladem.

## Struktura argumentu

Základní podoba vypadá takto. Premisa první: každý M je P. Premisa druhá: každý S je M.
Závěr: někteří S jsou P. První dvě věty jsou obecné a v booleovském výkladu nic netvrdí o
existenci S ani M. Závěr naproti tomu tvrdí, že aspoň jedno S existuje. Pokud je třída S
prázdná, jsou premisy pravdivé a závěr nepravdivý, což je přesně definice neplatnosti.
Obdobně se klam objevuje u záporných forem: z vět „žádný M není P“ a „každý S je M“ se
vyvozuje „někteří S nejsou P“. Platný závěr by byl obecný („žádný S není P“) a o existenci
by mlčel.

Druhou podobou je přímé podřazení bez sylogismu: z „každý uchazeč, který splní podmínky,
bude přijat“ se vyvozuje „někteří uchazeči budou přijati“. V praxi tu není chyba v řetězu
termínů, ale v tom, že pravidlo, které je nastaveno pro všechny případy, se čte jako
oznámení, že případy nastanou. Pragma-dialektická teorie by takový úsudek posuzovala podle
pravidla platnosti: argument předložený jako závazný musí být logicky platný, nebo musí být
zřejmé, kterou nevyslovenou premisu mluvčí předpokládá (van Eemeren a Grootendorst 1992).
U existenčního klamu je touto nevyslovenou premisou právě tvrzení „takové případy existují“.

Blízkou souvislost má klam s tím, co NLP katalogizuje jako
[existenční presupozici](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md):
jmenná fráze ve větě předpokládá, že označovaná věc existuje. Existenční klam je formální
obdobou téhož jevu na úrovni úsudku. Tam, kde presupozice vnáší existenci do jedné věty,
vnáší ji klam do závěru, který se opírá o věty, jež ji neobsahovaly.

## Detekční znaky

Prvním znakem je posun od obecného k částečnému bez nové informace. Mluvčí uvede pravidlo
nebo princip („každý, kdo…“, „nikdo, kdo…“) a bez dalšího zjištění přejde k tvrzení o
konkrétních nebo „některých“ lidech. Druhým znakem je prázdnota premis: na otázku, zda
nějaký takový případ skutečně existuje, mluvčí odpovídá opakováním pravidla, ne zjištěním.
Třetím znakem je funkce výroku v rozhovoru. Pravidlo o třídě se užívá jako obvinění nebo
jako hrozba, například „všichni, kdo o nás šíří lži, budou odhaleni“, a posluchač z něj
vyvodí, že lháři mezi námi jsou. V uzavřených skupinách se tak mohou vytvářet třídy
nepřátel, které nikdo nedoložil, ale o kterých se mluví, jako by byly plné. Tento posun
popisuje Lifton u systémů, které přizpůsobují jazyk tak, aby předem obsahoval hodnocení
světa a lidí v něm (Lifton 1961).

Ve vyšetřování a v odborném posudku se klam projevuje jemněji. Kritérium („každý případ s
těmito znaky je případem X“) se uvede v textu posudku a čtenář má dojem, že posudek tvrdí
výskyt X, ačkoli nic takového nezjistil. Kniha popisuje podobné posuny mezi kritériem a
zjištěním v kapitole o
[akademických technikách intelektuální manipulace](@/kompendium/03-zakladni-kategorie/kapitola-1.md).

## Odlišení od platné argumentace

Úsudek přestává být klamný, jakmile se existence doloží samostatnou premisou. „Každý, kdo
porušil směrnici, bude řešen; šetření zjistilo dva takové případy; nejméně dva lidé budou
řešeni“ je platný úsudek, protože třetí věta tvrdí existenci výslovně. Za platnou se
považuje i argumentace v kontextu, kde je neprázdnost třídy nesporná a obě strany ji sdílejí:
kdo mluví o „všech pacientech tohoto oddělení“, nemusí pokaždé dokládat, že oddělení má
pacienty. Teorie argumentace upozorňuje, že posouzení klamu závisí na tom, co je ve sporu
sdíleným východiskem a co je teprve předmětem obhajoby (van Eemeren a Grootendorst 2004).
Existenční klam tedy nastává tam, kde je otázka existence právě tím, o co se vede spor, a
mluvčí ji místo doložení přenese do závěru z pravidla.

Od příbuzné chyby, kterou katalog popisuje jako
[vylučující premisy](@/kompendium/argumentacni-fauly/formalni/vylucujici-premisy.md), se
existenční klam liší tím, že premisy mohou být kladné i záporné. Vada neleží v jejich
kvalitě, ale v kvantitě: ve skoku od obecného k částečnému.

## Stav poznání

Psychologie uvažování ukazuje, že lidé posuzují sylogismy výrazně podle toho, zda je závěr
věrohodný, a méně podle toho, zda z premis plyne. Kahneman tento jev vykládá jako působení
rychlého intuitivního systému, který přijme závěr, který „zní správně“, a pomalejší kontrola
se nezapojí (Kahneman 2011). Stanovich a West popsali, že úspěšnost v úlohách na logickou
platnost se mezi lidmi liší a souvisí s kognitivními schopnostmi i s dispozicí oddělit
úsudek od vlastního přesvědčení (Stanovich a West 2000). Pro existenční klam to znamená, že
je nejsnáze přehlédnut právě tam, kde posluchač už existenci třídy předem věří. Kdo je
přesvědčen, že mezi kolegy jsou zrádci, nevšimne si, že pravidlo o zrádcích jejich
existenci nedokládá. Výzkum motivovaného uvažování k tomu přidává, že lidé přísněji
prověřují argumenty pro nevítané závěry než pro vítané (Kunda 1990). Specifické empirické
studie zaměřené jen na existenční klam v přirozeném rozhovoru kniha nezná; uvedené závěry
se opírají o obecnější výzkum sylogistického usuzování.

## Obrana a odpověď

Nejúčinnější odpovědí je oddělit dvě otázky, které argument slučuje: jaké pravidlo platí a
zda existují případy, na které se uplatní. Pravidlo lze přijmout a zároveň požadovat doklad
o existenci případů. Tento postup odpovídá pravidlu důkazního břemene: kdo tvrdí, že nějací
lidé něco udělali, nese břemeno toto tvrzení doložit, a obecná věta o třídě ho nezbavuje
(van Eemeren a Grootendorst 1992). V písemném textu, například v posudku nebo v interní
zprávě, pomáhá rozlišit oddíl kritérií od oddílu zjištění a ověřit, zda každé částečné
tvrzení v závěru má oporu ve zjištění, ne jen v kritériu.

V osobních a skupinových vztazích, kde se pravidlo o neurčité třídě užívá k vytváření
podezření, je užitečné vrátit rozhovor ke konkrétním událostem: kdo, kdy, co přesně. Kdo
opakovaně slyší, že „ti, kdo pochybují, se prozradí“, může zaznamenávat, zda se někdy
objevil konkrétní doklad, nebo jen další formulace pravidla. Oddělení kritéria od zjištění
je zároveň ochranou vlastní mysli: kdo si zvykne ptát se „je o tom zjištění, nebo jen
pravidlo?“, ztrácí sklon tiše doplňovat premisu, kterou mu nikdo nedoložil (Kahneman 2011).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Hamblin, C. L. (1970). *Fallacies*. London: Methuen.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Kunda, Z. (1990). The case for motivated reasoning. *Psychological Bulletin*, 108(3), 480–498.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Stanovich, K. E., & West, R. F. (2000). Individual differences in reasoning: Implications for the rationality debate? *Behavioral and Brain Sciences*, 23(5), 645–665.
- Whately, R. (1826). *Elements of Logic*. London: J. Mawman.
- van Eemeren, F. H., & Grootendorst, R. (1992). *Argumentation, Communication, and Fallacies: A Pragma-Dialectical Perspective*. Hillsdale: Lawrence Erlbaum.
- van Eemeren, F. H., & Grootendorst, R. (2004). *A Systematic Theory of Argumentation: The Pragma-Dialectical Approach*. Cambridge: Cambridge University Press.

## Související

**Rodina a hierarchie**

- [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Nedovolený menší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-mensi-termin.md) – příbuzné heslo (Formální klamy, Illicit minor)
- [Čtyři termíny](@/kompendium/argumentacni-fauly/formalni/ctyri-terminy.md) – příbuzné heslo (Formální klamy, Four terms)
- [Vylučující premisy](@/kompendium/argumentacni-fauly/formalni/vylucujici-premisy.md) – příbuzné heslo (Formální klamy, Exclusive premises)
- [Záměna kvantifikátorů](@/kompendium/argumentacni-fauly/formalni/zamena-kvantifikatoru.md) – příbuzné heslo (Formální klamy, Quantifier shift)
- [Existenční presupozice](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md) – příbuzné heslo (NLP vzorce: Jazykové presupozice, Existential presupposition)

**V kompendiu**

- [3.1 Akademické techniky intelektuální manipulace](@/kompendium/03-zakladni-kategorie/kapitola-1.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Čtyři termíny](@/kompendium/argumentacni-fauly/formalni/ctyri-terminy.md) – předchozí heslo rodiny
- [Potvrzení disjunktu](@/kompendium/argumentacni-fauly/formalni/potvrzeni-disjunktu.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
