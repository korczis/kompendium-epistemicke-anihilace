+++
title = "Vylučující premisy"
description = "Formální klam sylogismu se dvěma zápornými premisami: proč ze dvou vyloučení nic neplyne, jak se chyba skrývá v alibi a v řetězech výluk a jak na ni odpovědět."
weight = 10
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-formalni", "fauly-formalni-klam", "fauly-uziti-chyba"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Vylučující premisy", "Exclusive premises", "dvě záporné premisy", "klam záporných premis", "Formální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-01.10"
catalog_slug = "vylucujici-premisy"
catalog_family = "formalni"
catalog_family_code = "01"
catalog_family_title = "Formální klamy"
catalog_family_en = "Formal fallacies"
catalog_part = "formalni.b"
catalog_type = "formal"
catalog_type_cs = "formální klam"
catalog_en = "Exclusive premises"
catalog_aliases = ["dvě záporné premisy", "klam záporných premis"]
catalog_use = "chyba"
catalog_use_cs = "převážně chyba uvažování"
catalog_risk = "nizke"
catalog_risk_cs = "nízké"
catalog_broader = "formalni-klam"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["formalni-klam"]
catalog_related = ["nerozlozeny-stredni-termin", "nedovoleny-vetsi-termin", "ctyri-terminy", "existencni-klam", "odvolani-na-nevedomost"]
catalog_related_declared = ["nerozlozeny-stredni-termin", "nedovoleny-vetsi-termin", "existencni-klam", "ctyri-terminy", "odvolani-na-nevedomost"]
catalog_kompendium = ["kompendium/forensic-legal/_index.md", "kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md", "kompendium/03-zakladni-kategorie/kapitola-1.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/relevance/odvolani-na-nevedomost.md", "kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md", "kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md"]
catalog_prev = "potvrzeni-disjunktu"
catalog_next = "zamena-kvantifikatoru"
catalog_position = 10
catalog_family_size = 14
catalog_sources = ["copi-cohen-mcmahon-2014", "johnson-blair-1977", "kahneman-2011", "mercier-sperber-2011", "stanovich-west-2000", "toulmin-1958", "whately-1826", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "johnson-blair-1977", "toulmin-1958", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_roots = ["whately-1826"]
catalog_sources_critical = ["kahneman-2011", "mercier-sperber-2011", "stanovich-west-2000"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/formalni.b.toml"
+++

# Vylučující premisy

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-01.10` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) |
| **Druh** | formální klam |
| **Anglicky** | Exclusive premises |
| **Jiné názvy** | dvě záporné premisy, klam záporných premis |
| **Obecnější heslo** | [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) |
| **Užití** | převážně chyba uvažování |
| **Riziko zneužití** | nízké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Klam vylučujících premis je vada kategorického sylogismu, v němž jsou obě premisy záporné a
přesto se z nich vyvozuje závěr. Záporná premisa tvrdí, že určitá třída je zcela nebo
zčásti oddělena od jiné: „žádný A není B“, „někteří A nejsou B“. Sylogismus potřebuje
střední termín, který obě krajní třídy spojí. Pokud obě premisy jen oddělují, střední termín
nic nespojuje: víme, že A stojí mimo B a že C stojí mimo B, ale o vztahu mezi A a C se
nedozvídáme nic. Učebnice logiky proto uvádějí mezi pravidly platného sylogismu, že ze dvou
záporných premis nelze vyvodit žádný závěr, a porušení tohoto pravidla označují právě jako
klam vylučujících premis (Copi, Cohen a McMahon 2014). S ním souvisí sesterské pravidlo:
je-li jedna z premis záporná, musí být záporný i závěr.

Formálně jde o jeden z nejprůhlednějších klamů. Prakticky se však objevuje v podobě, která
na sylogismus nevypadá: jako řetěz vyloučení, kde každé vyloučení samo o sobě platí, a
dohromady se z nich skládá závěr, který z nich neplyne.

## Původ a souvislosti

Pravidla kategorického sylogismu pocházejí z Aristotelových Prvních analytik, kde se
ukazuje, které kombinace kladných a záporných, obecných a částečných premis dávají platný
závěr. Středověká a novověká logika z toho vytvořila stručná pravidla, která se učila
nazpaměť, a moderní učebnice je přebírají jako kontrolní seznam pro posouzení libovolného
sylogismu: čtyři termíny, nerozložený střední termín, nedovolený větší a menší termín,
vylučující premisy, kladný závěr ze záporné premisy a existenční klam (Copi, Cohen a
McMahon 2014). Whately v devatenáctém století zařadil podobné vady mezi logické klamy, tedy
ty, u nichž závěr neplyne z formy premis, na rozdíl od klamů, jejichž potíž leží v obsahu
(Whately 1826).

Teorie argumentace dvacátého století upozornila, že formální pravidla sama nestačí k
posouzení skutečných sporů. Toulmin ukázal, že praktický argument se opírá o oprávnění a
podklady, jejichž síla závisí na oboru, a že formální platnost je jen jedním z měřítek
(Toulmin 1958). U vylučujících premis to má praktický význam: v soudní síni nebo v
lékařské poradě nezazní dvě úhledné záporné věty, ale dvě zjištění „tady nebyl“ a „tohle to
nebylo“, a závěr z nich se vyvodí v rámci vyprávění, které chybějící spojení doplní.

## Struktura argumentu

Úplná podoba klamu zní: žádný M není P; žádný S není M; tedy žádný S není P. Protipříklad
stejné stavby je snadný. Žádná kočka není pes; žádný jezevčík není kočka; tedy žádný
jezevčík není pes. Obě premisy jsou pravdivé, závěr nepravdivý, a úsudek je proto neplatný,
ať už se dosadí jakékoli termíny. Stejně neplatné jsou kombinace s částečnou zápornou premisou („někteří M
nejsou P; žádný S není M“), protože žádná z nich nepřisuzuje střední termín žádné z
krajních tříd.

V běžné řeči se struktura skrývá do vyloučení míst, skupin nebo vlastností. „Obžalovaný
nebyl v kanceláři. Pachatel v kanceláři nebyl. Obžalovaný tedy není pachatel.“ Obě věty
říkají jen, kde někdo nebyl, a místo „kancelář“ tu slouží jako střední termín, který nic
nespojuje. Kdyby se místo toho uvedlo, kde pachatel byl, a že obžalovaný tam nebyl, vznikl
by platný úsudek. Rozdíl je nenápadný a právě proto je důležitý. [Pragma-dialektika](@/kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md) by takový
argument posuzovala podle pravidla platnosti a hledala by nevyslovenou premisu, kterou by
mluvčí musel přidat, aby úsudek platil (van Eemeren a Grootendorst 1992). Tady by to byla
premisa typu „kdo nebyl v kanceláři, nebyl ani na místě činu“, a ta je zjevně nepravdivá.

Klam se podobá vadě, kterou kniha popisuje jako
[logickou diskontinuitu](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md): každý
krok řetězu působí v izolaci správně, ale spojení mezi kroky chybí. Vylučující premisy jsou
nejjednodušším formálním modelem takové mezery.

## Detekční znaky

Prvním znakem je, že všechna zjištění, o která se závěr opírá, jsou záporná: kde kdo nebyl,
co něco není, ke které skupině kdo nepatří. Druhým znakem je chybějící kladná charakteristika
cílové třídy. Mluvčí neříká, kde pachatel byl, co látka je nebo kam člověk patří, jen kam
nepatří. Třetím znakem je, že závěr je silnější, než jaký by unesla jedna samotná premisa,
a posluchač ho přijímá, protože obě premisy jsou nesporné. Při čtení posudku nebo
rozhodnutí je proto užitečné u každého závěru dohledat, která kladná premisa ho nese.
Odpovídá to požadavku teorie kritické diskuse, aby se nevyslovené premisy argumentu
rekonstruovaly dřív, než se argument přijme nebo odmítne (van Eemeren a Grootendorst 2004).

Klam se objevuje i v posuzování příslušnosti ke skupině. „Nikdo z našeho týmu nepracuje pro
konkurenci; nikdo, kdo pracuje pro konkurenci, neměl přístup k dokumentu; nikdo z týmu tedy
k dokumentu přístup neměl.“ Oba výroky mohou být pravdivé a závěr přesto nepravdivý. Ve
vyšetřování to vede k předčasnému vyloučení skupiny osob, která měla být prověřena. Na
opačné straně je podobná chyba, kdy z nedostatku zjištění vyplývá závěr o nevině nebo vině;
tu katalog popisuje jako
[odvolání na nevědomost](@/kompendium/argumentacni-fauly/relevance/odvolani-na-nevedomost.md).

## Odlišení od platné argumentace

Platný sylogismus se zápornou premisou má vždy jednu premisu kladnou: „pachatel byl ve
skladu; obžalovaný ve skladu nebyl; obžalovaný tedy pachatelem není“. Kladná premisa
přisuzuje střední termín jedné krajní třídě a záporná ho druhé upírá, takže mezi nimi
vznikne oddělení. Platné jsou také úsudky, kde se dvě záporná zjištění doplní třetím,
kladným, například údajem o úplnosti výčtu: „pachatel mohl být jen v kanceláři nebo ve
skladu; v kanceláři nebyl; tedy byl ve skladu“. Z takového doplnění pak plyne i závěr o
obžalovaném, pokud je doloženo, kde byl on.

Rozlišení je důležité, protože záporná zjištění jsou v praxi často nejspolehlivější, co
máme. Neformální logika připomíná, že argument je třeba posuzovat podle přijatelnosti,
relevance a dostatečnosti premis (Johnson a Blair 1977). Dvě spolehlivá vyloučení mohou být
přijatelná a relevantní, a přesto nedostatečná, protože jim chybí spojující kladný údaj.

## Stav poznání

Psychologie uvažování studovala záporné premisy v sylogistických úlohách opakovaně a
obecně se uvádí, že sylogismy se zápornými premisami jsou pro lidi obtížnější a že lidé
často přijímají závěry, které jsou věrohodné, i když z premis neplynou. Kahneman tento
sklon připisuje rychlému intuitivnímu úsudku, který kontrolu platnosti přeskočí, je-li
závěr uvěřitelný (Kahneman 2011). Stanovich a West ukázali, že schopnost oddělit logickou
platnost od uvěřitelnosti závěru se mezi lidmi liší a souvisí s myšlenkovými dispozicemi
(Stanovich a West 2000). Mercier a Sperber přidávají, že lidé hodnotí argumenty lépe ve
skupinové diskusi než o samotě, protože ostatní mají motiv hledat v cizích argumentech
slabiny (Mercier a Sperber 2011). Pro klam vylučujících premis z toho plyne praktický
závěr: snadno uniká jednotlivci, který chce slyšet určitý výsledek, a snáze ho zachytí
oponent nebo nezávislý recenzent. Přesné míry výskytu tohoto klamu v reálných rozhodnutích
kniha neuvádí, protože je nezná.

## Obrana a odpověď

Odpovědí na klam je otázka po kladné premise: kde pachatel byl, čím látka je, kam osoba
patří. Pokud ji nikdo nedokáže uvést, závěr zůstává otevřený a dvě vyloučení ho nerozhodují.
V písemném posudku nebo v rozhodnutí lze klam odhalit tak, že se závěr přepíše do podoby
sylogismu a u každého termínu se ověří, která premisa ho kladně přisuzuje; pokud žádná,
úsudek je neplatný (Copi, Cohen a McMahon 2014). Ve sporu stačí klidně ukázat
protipříklad stejné stavby s pravdivými premisami a nepravdivým závěrem; protipříklad je
nejprůkaznější cestou, jak ukázat formální vadu, aniž by se útočilo na mluvčího.

Při vyšetřování a v odborném hodnocení se doporučuje, aby závěry o vyloučení osoby nebo
příčiny posuzoval někdo, kdo k výsledku nemá vztah. Tento postup odpovídá zjištění, že
cizí argumenty prověřujeme důkladněji než vlastní (Mercier a Sperber 2011). Pro jednotlivce,
kterému se v rozhovoru nabízí řada vyloučení jako „důkaz“, je užitečné přeformulovat je pro
sebe do kladné podoby a zeptat se, co z nich skutečně víme.

## Literatura

- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Johnson, R. H., & Blair, J. A. (1977). *Logical Self-Defense*. Toronto: McGraw-Hill Ryerson.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Mercier, H., & Sperber, D. (2011). Why do humans reason? Arguments for an argumentative theory. *Behavioral and Brain Sciences*, 34(2), 57–74.
- Stanovich, K. E., & West, R. F. (2000). Individual differences in reasoning: Implications for the rationality debate? *Behavioral and Brain Sciences*, 23(5), 645–665.
- Toulmin, S. E. (1958). *The Uses of Argument*. Cambridge: Cambridge University Press.
- Whately, R. (1826). *Elements of Logic*. London: J. Mawman.
- van Eemeren, F. H., & Grootendorst, R. (1992). *Argumentation, Communication, and Fallacies: A Pragma-Dialectical Perspective*. Hillsdale: Lawrence Erlbaum.
- van Eemeren, F. H., & Grootendorst, R. (2004). *A Systematic Theory of Argumentation: The Pragma-Dialectical Approach*. Cambridge: Cambridge University Press.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Nerozložený střední termín](@/kompendium/argumentacni-fauly/formalni/nerozlozeny-stredni-termin.md) – příbuzné heslo (Formální klamy, Undistributed middle)
- [Nedovolený větší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-vetsi-termin.md) – příbuzné heslo (Formální klamy, Illicit major)
- [Čtyři termíny](@/kompendium/argumentacni-fauly/formalni/ctyri-terminy.md) – příbuzné heslo (Formální klamy, Four terms)
- [Existenční klam](@/kompendium/argumentacni-fauly/formalni/existencni-klam.md) – příbuzné heslo (Formální klamy, Existential fallacy)
- [Odvolání na nevědomost](@/kompendium/argumentacni-fauly/relevance/odvolani-na-nevedomost.md) – příbuzné heslo (Klamy relevance, Appeal to ignorance)

**V kompendiu**

- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.1.5 Logická diskontinuita](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [3.1 Akademické techniky intelektuální manipulace](@/kompendium/03-zakladni-kategorie/kapitola-1.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Potvrzení disjunktu](@/kompendium/argumentacni-fauly/formalni/potvrzeni-disjunktu.md) – předchozí heslo rodiny
- [Záměna kvantifikátorů](@/kompendium/argumentacni-fauly/formalni/zamena-kvantifikatoru.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
