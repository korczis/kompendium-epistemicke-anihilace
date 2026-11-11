+++
title = "Kladný závěr ze záporné premisy"
description = "Formální klam sylogismu, který ze záporné premisy vyvozuje kladný závěr: proč záporné zjištění nic nepřisuzuje, kde se chyba skrývá v protokolech a jak ji poznat."
weight = 15
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-formalni", "fauly-formalni-klam", "fauly-uziti-chyba"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Kladný závěr ze záporné premisy", "Affirmative conclusion from a negative premise", "klam kladného závěru", "kladný závěr ze záporu", "Formální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-01.15"
catalog_slug = "kladny-zaver-ze-zaporne-premisy"
catalog_family = "formalni"
catalog_family_code = "01"
catalog_family_title = "Formální klamy"
catalog_family_en = "Formal fallacies"
catalog_part = "formalni.b"
catalog_type = "formal"
catalog_type_cs = "formální klam"
catalog_en = "Affirmative conclusion from a negative premise"
catalog_aliases = ["klam kladného závěru", "kladný závěr ze záporu"]
catalog_use = "chyba"
catalog_use_cs = "převážně chyba uvažování"
catalog_risk = "nizke"
catalog_risk_cs = "nízké"
catalog_broader = "formalni-klam"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["formalni-klam"]
catalog_related = ["nerozlozeny-stredni-termin", "nedovoleny-vetsi-termin", "existencni-klam", "vylucujici-premisy", "odvolani-na-nevedomost"]
catalog_related_declared = ["vylucujici-premisy", "existencni-klam", "nerozlozeny-stredni-termin", "nedovoleny-vetsi-termin", "odvolani-na-nevedomost"]
catalog_kompendium = ["kompendium/forensic-legal/_index.md", "kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md", "kompendium/03-zakladni-kategorie/kapitola-1.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/01-predmluva/jak-pouzivat.md", "kompendium/argumentacni-fauly/formalni/vylucujici-premisy.md", "kompendium/argumentacni-fauly/relevance/odvolani-na-nevedomost.md", "kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md", "kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md"]
catalog_prev = "klam-klamu"
catalog_next = ""
catalog_position = 15
catalog_family_size = 15
catalog_sources = ["copi-cohen-mcmahon-2014", "hamblin-1970", "johnson-blair-1977", "kahneman-2011", "mercier-sperber-2011", "stanovich-west-2000", "toulmin-1958", "whately-1826", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "hamblin-1970", "johnson-blair-1977", "toulmin-1958", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_roots = ["whately-1826"]
catalog_sources_critical = ["kahneman-2011", "mercier-sperber-2011", "stanovich-west-2000"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_review = "agent"
catalog_data = "data/fauly/formalni.b.toml"
+++

# Kladný závěr ze záporné premisy

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-01.15` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) |
| **Druh** | formální klam |
| **Anglicky** | Affirmative conclusion from a negative premise |
| **Jiné názvy** | klam kladného závěru, kladný závěr ze záporu |
| **Obecnější heslo** | [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) |
| **Užití** | převážně chyba uvažování |
| **Riziko zneužití** | nízké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Kladný závěr ze záporné premisy je vada kategorického sylogismu, v němž je aspoň jedna
premisa záporná, a závěr přesto něco kladně přisuzuje. Záporná premisa jen odděluje dvě
třídy: říká, že určité věci k jiné skupině nepatří. Kladný závěr naopak tvrdí, že jedna
třída je zcela nebo zčásti zahrnuta v druhé. Zahrnutí však může vzniknout jen ze dvou
zahrnutí, nikoli z oddělení, a proto učebnice logiky uvádějí mezi pravidly platného
sylogismu, že je-li jedna z premis záporná, musí být záporný i závěr; porušení tohoto
pravidla nazývají klamem kladného závěru ze záporné premisy (Copi, Cohen a McMahon 2014).

Klam je sesterským protějškem
[vylučujících premis](@/kompendium/argumentacni-fauly/formalni/vylucujici-premisy.md). Tam
se ze dvou záporných premis vyvozuje jakýkoli závěr, zde se z jedné záporné premisy vyvozuje
závěr nesprávného druhu. V obou případech chybí kladné spojení, které by krajní třídy
propojilo, a v obou případech závěr říká víc, než premisy unesou. Učebnice proto obě pravidla
uvádějí vedle sebe v kontrolním seznamu, podle něhož lze posoudit libovolný sylogismus
(Copi, Cohen a McMahon 2014).

## Původ a souvislosti

Pravidla kvality v sylogismu, tedy pravidla o kladných a záporných premisách, vycházejí z
Aristotelova rozboru platných modů v Prvních analytikách. Středověká logika je shrnula do
krátkých pouček a novověké učebnice z nich udělaly pomůcku, s níž se dá platnost posoudit
bez vypisování všech modů. Whately ve svých Základech logiky odlišil vady, při nichž závěr
neplyne z formy premis, od vad, jejichž potíž leží v obsahu, a kladný závěr ze záporné
premisy patří k prvnímu druhu (Whately 1826). Hamblin připomíná, že tradiční výklad klamů
často stavěl takové formální vady vedle neformálních, ačkoli jde o odlišné druhy chyb, a
že jejich společný seznam je spíš učebnicovou tradicí než teorií (Hamblin 1970).

Teorie argumentace dvacátého století upozornila, že formální platnost je jen jedním z
měřítek praktického argumentu. Toulmin ukázal, že skutečné argumenty se opírají o podklady
a oprávnění, jejichž váha závisí na oboru (Toulmin 1958). U tohoto klamu má jeho postřeh
konkrétní dopad: v protokolu, posudku nebo zprávě nezazní úhledný sylogismus, ale věta typu
„nebyla zjištěna žádná závada, výrobek je tedy v pořádku“, kde se záporné zjištění mění v
kladné osvědčení.

## Struktura argumentu

Nejjednodušší podoba klamu zní: žádný M není P; všichni S jsou M; tedy všichni S jsou P.
Protipříklad stejné stavby ukáže vadu bez sporu o obsah. Žádná ryba není savec; všichni
kapři jsou ryby; tedy všichni kapři jsou savci. Premisy jsou pravdivé a závěr nepravdivý, a
takové vyvrácení logickou analogií je běžnou učebnicovou metodou, jak prokázat neplatnost
úsudku bez ohledu na dosazené termíny (Copi, Cohen a McMahon 2014). Platný úsudek z týchž
premis by zněl „žádný S není P“: záporná premisa dovoluje jen záporný závěr.

V běžné řeči se záporná premisa skrývá do výsledku kontroly nebo vyšetření. „Žádný z
testovaných vzorků nebyl kontaminovaný; tento vzorek byl testován; tento vzorek je tedy
nezávadný.“ Mezi „nebyl kontaminovaný“ a „je nezávadný“ leží rozdíl, který kontrola
neověřila: vzorek mohl mít jinou vadu, kterou test nesledoval. [Pragma-dialektika](@/kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md)
by takový argument posuzovala podle pravidla platnosti a hledala by nevyslovenou premisu,
kterou by mluvčí musel přidat, aby úsudek platil (van Eemeren a Grootendorst 1992). Tady by
to byla premisa „co nemá tuto vadu, nemá žádnou“, a ta je zjevně nepravdivá. Klam tak
modeluje mezeru, kterou kniha popisuje jako
[logickou diskontinuitu](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md): krok,
který v izolaci působí správně, ale spojení s předchozím krokem chybí.

## Detekční znaky

Prvním znakem je změna polarity mezi premisami a závěrem: zjištění jsou záporná („nebylo
nalezeno“, „nepatří“, „nevykazuje“) a závěr kladný („je v pořádku“, „patří“, „splňuje“).
Druhým znakem je, že závěr používá jiný, širší pojem, než jaký premisa popírá. Z nepřítomnosti
jedné vady se stává přítomnost kvality, z nepříslušnosti k jedné skupině příslušnost k
opačné. Třetím znakem je, že kladný závěr nese rozhodnutí, například schválení, osvobození
nebo certifikát, a záporné zjištění se v něm ztratí. Odpovídá to požadavku teorie kritické
diskuse, aby se nevyslovené premisy rekonstruovaly dřív, než se argument přijme (van
Eemeren a Grootendorst 2004).

Klam se objevuje i v posuzování lidí. „Nikdo z našich zaměstnanců nemá záznam v rejstříku;
uchazeč je náš zaměstnanec; uchazeč je tedy bezúhonný.“ Bezúhonnost je víc než nepřítomnost
jednoho záznamu, a premisa o rejstříku ji proto nemůže doložit; podle pravidel sylogismu
plyne jen to, že uchazeč záznam nemá (Copi, Cohen a McMahon 2014). Příbuzná chyba, při níž
se z nedostatku zjištění vyvozuje kladný závěr o vině nebo nevině, je v katalogu popsána
jako [odvolání na nevědomost](@/kompendium/argumentacni-fauly/relevance/odvolani-na-nevedomost.md).

## Odlišení od platné argumentace

Platný sylogismus se zápornou premisou má vždy záporný závěr: „žádný z testovaných vzorků
nebyl kontaminovaný; tento vzorek byl testován; tento vzorek tedy nebyl kontaminovaný“. Je
to méně, než by si mluvčí často přál, ale přesně tolik, kolik premisy unesou, což odpovídá
pravidlu kvality sylogismu (Copi, Cohen a McMahon 2014). Kladný závěr je oprávněný teprve
tehdy, když se k záporným zjištěním přidá kladná premisa, například údaj o úplnosti
kontroly: „vzorek prošel všemi předepsanými zkouškami a ve všech vyhověl“.

Rozlišení je důležité, protože záporná zjištění bývají v praxi to nejspolehlivější, co
máme, a jejich poctivé užití není klamem. Neformální logika připomíná, že argument je třeba
posuzovat podle přijatelnosti, relevance a dostatečnosti premis, nikoli jen podle formy
(Johnson a Blair 1977). Kontrolor, který napíše „nebyla zjištěna závada v rozsahu provedených
zkoušek“, uvažuje správně; chyba vzniká až ve chvíli, kdy se z jeho věty stane „výrobek je
bez vad“.

## Stav poznání

Psychologie uvažování opakovaně ukazuje, že lidé posuzují sylogismy podle uvěřitelnosti
závěru, nikoli jen podle jejich formy, a že přijímají neplatné závěry, které znějí věrohodně.
Stanovich a West popsali, že schopnost oddělit logickou platnost od uvěřitelnosti závěru se
mezi lidmi liší a souvisí s myšlenkovými dispozicemi (Stanovich a West 2000). Kahneman tento
sklon připisuje rychlému intuitivnímu úsudku, který kontrolu platnosti přeskočí, je-li
závěr přijatelný (Kahneman 2011). U kladného závěru ze záporné premisy hraje roli i to, že
kladný závěr je obvykle žádoucí: osvědčení, schválení nebo uklidnění.

Mercier a Sperber přidávají, že lidé hodnotí argumenty lépe ve skupině než o samotě, protože
ostatní mají motiv hledat v cizích argumentech slabiny (Mercier a Sperber 2011). Přesné
míry výskytu tohoto klamu v protokolech, posudcích nebo rozhodnutích kniha neuvádí, protože
je nezná; doložit lze jen to, že formálně jde o jednoduchou vadu, kterou zachytí každá
kontrola podle pravidel sylogismu (Copi, Cohen a McMahon 2014).

## Obrana a odpověď

Odpovědí na klam je otázka po kladné premise: co přesně bylo ověřeno a co z toho plyne. Je-li
jediným podkladem záporné zjištění, závěr se dá poctivě přeformulovat do záporné podoby, a ta
obvykle ukáže, co zůstalo otevřené. V písemném posudku nebo rozhodnutí lze klam odhalit tak,
že se závěr přepíše do podoby sylogismu a u každé premisy se ověří, zda je kladná, nebo
záporná; je-li některá záporná a závěr kladný, úsudek je neplatný (Copi, Cohen a McMahon
2014). Ve sporu stačí uvést protipříklad stejné stavby s pravdivými premisami a nepravdivým
závěrem, což je nejprůkaznější cesta, jak ukázat formální vadu bez útoku na mluvčího.

U kontrol a posudků, na nichž závisí bezpečnost lidí, se doporučuje, aby závěr o nezávadnosti
posuzoval někdo, kdo k výsledku nemá vztah, protože cizí argumenty prověřujeme důkladněji než
vlastní (Mercier a Sperber 2011). Pro čtenáře zprávy, která z nepřítomnosti jedné vady
vyvozuje celkovou kvalitu, je užitečné vyhledat rozsah provedených zkoušek a závěr si pro sebe
přepsat tak, aby tvrdil jen to, co zkoušky skutečně ověřily, jak doporučuje i obranný rámec
knihy popsaný v [jak používat kompendium](@/kompendium/01-predmluva/jak-pouzivat.md).

## Literatura

- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Hamblin, C. L. (1970). *Fallacies*. London: Methuen.
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
- [Existenční klam](@/kompendium/argumentacni-fauly/formalni/existencni-klam.md) – příbuzné heslo (Formální klamy, Existential fallacy)
- [Vylučující premisy](@/kompendium/argumentacni-fauly/formalni/vylucujici-premisy.md) – příbuzné heslo (Formální klamy, Exclusive premises)
- [Odvolání na nevědomost](@/kompendium/argumentacni-fauly/relevance/odvolani-na-nevedomost.md) – příbuzné heslo (Klamy relevance, Appeal to ignorance)

**V kompendiu**

- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.1.5 Logická diskontinuita](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [3.1 Akademické techniky intelektuální manipulace](@/kompendium/03-zakladni-kategorie/kapitola-1.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Klam klamu](@/kompendium/argumentacni-fauly/formalni/klam-klamu.md) – předchozí heslo rodiny

<!-- kompendium:katalog-vazby:end -->
