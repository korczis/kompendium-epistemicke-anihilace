+++
title = "Hráčský klam"
description = "Přesvědčení, že nezávislé náhodné události vyrovnávají předchozí sérii, takže dlouho chybějící výsledek je „na řadě“: struktura, znaky, odlišení a obrana."
weight = 3
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Hráčský klam", "Gambler's fallacy", "Monte Carlo klam", "klam zralosti šancí", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.03"
catalog_slug = "hracsky-klam"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Gambler's fallacy"
catalog_aliases = ["Monte Carlo klam", "klam zralosti šancí"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "zakon-malych-cisel"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["zakon-malych-cisel"]
catalog_related = ["texasky-strelec", "klam-regrese", "magicke-mysleni", "horka-ruka", "zakon-malych-cisel"]
catalog_related_declared = ["horka-ruka", "zakon-malych-cisel", "klam-regrese", "magicke-mysleni", "texasky-strelec"]
catalog_kompendium = ["kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/03-zakladni-kategorie/biasy/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/statisticke/horka-ruka.md", "kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md"]
catalog_prev = "klam-konjunkce"
catalog_next = "horka-ruka"
catalog_position = 3
catalog_family_size = 16
catalog_sources = ["damer-2009", "gilovich-1991", "kahneman-2011", "tversky-kahneman-1971", "tversky-kahneman-1974"]
catalog_sources_primary = ["damer-2009"]
catalog_sources_roots = []
catalog_sources_critical = ["gilovich-1991", "kahneman-2011", "tversky-kahneman-1971", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 3
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.toml"
+++

# Hráčský klam

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.03` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Gambler's fallacy |
| **Jiné názvy** | Monte Carlo klam, klam zralosti šancí |
| **Obecnější heslo** | [Zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md) |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Hráčský klam je chybný úsudek, podle něhož se u nezávislých náhodných událostí mění
pravděpodobnost dalšího výsledku podle toho, co padlo předtím. Po dlouhé řadě červených
čísel na ruletě se černá zdá být „na řadě“, po několika dcerách se syn zdá být „jistější“,
po sérii neúspěchů se úspěch zdá být „zasloužený“. Jádrem klamu je představa, že náhoda
sama sebe opravuje: že odchylka od očekávaného poměru musí být brzy vyvážena opačnou
odchylkou. Tversky a Kahneman shrnuli, že podle intuice lidí je náhoda samoopravným
procesem, kdežto ve skutečnosti se odchylky neopravují, jen se v delších řadách
rozřeďují (Tversky a Kahneman 1974).

Klam je převážně chybou uvažování, ale má i vlivovou podobu. Prodejci loterií, sázkové
kanceláře nebo podvodné investiční nabídky pracují s představou, že po sérii ztrát „musí
přijít výhra“, a udržují tak člověka ve hře déle, než by sám chtěl. V obou podobách jde o
tutéž strukturu, a proto ji lze rozpoznat stejnými otázkami.

## Původ a souvislosti

Název odkazuje k hazardním hrám, kde je klam nejnápadnější, ale jev je obecný. Tversky a
Kahneman ho zařadili mezi projevy heuristiky reprezentativnosti: lidé očekávají, že i krátká
část náhodné řady bude vypadat jako celý proces, tedy bude obsahovat zhruba stejný podíl
obou výsledků a nebude mít dlouhé série. Řada, která tomuto obrazu neodpovídá, se jim zdá
„nenáhodná“, a další výsledek proto očekávají ve směru, který obraz napraví (Tversky a
Kahneman 1974). Ve starší práci tentýž jev popsali jako důsledek obecnější víry, kterou
nazvali vírou v [zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md):
přesvědčení, že i malý vzorek musí věrně reprezentovat populaci, ze které pochází (Tversky a
Kahneman 1971).

Gilovich upozornil, že lidé mají zkreslenou představu o tom, jak náhoda vypadá. Očekávají
v náhodných řadách víc střídání a méně sérií, než jich náhodné řady skutečně mají, a
proto vidí vzorce tam, kde žádné nejsou (Gilovich 1991). Kahneman k tomu přidává
pozorování, že intuitivní myšlení hledá příčiny a pravidelnosti a že čistě náhodná
posloupnost je pro ně nesnadno přijatelná, protože nenabízí příběh (Kahneman 2011). Opačnou
podobou téhož nedorozumění je víra v [horkou ruku](@/kompendium/argumentacni-fauly/statisticke/horka-ruka.md),
podle níž série naopak pokračuje. Obě víry mají společný základ: nedůvěru k tomu, že
nezávislé události jsou opravdu nezávislé.

## Struktura argumentu

Argument se dá rozložit do tří kroků. První premisa konstatuje, že v posledních pokusech
nastával soustavně výsledek A. Druhá premisa, obvykle nevyslovená, tvrdí, že v delší řadě
se oba výsledky musí vyrovnat. Závěr tvrdí, že v příštím pokusu je pravděpodobnější výsledek
B. Vadná je druhá premisa, nebo přesněji její přenesení z dlouhé řady na jednotlivý pokus.
Zákon velkých čísel skutečně říká, že podíl výsledků se v dlouhé řadě blíží očekávané
hodnotě. Neříká však, že k tomu dochází kompenzací v nejbližších pokusech. K přiblížení
dochází proto, že každá konečná odchylka se v rostoucím počtu pokusů ztrácí, ne proto, že by
ji následující pokusy vyrovnávaly (Tversky a Kahneman 1974).

Rozhodující podmínkou je nezávislost. Klam vzniká jen u událostí, které na sobě opravdu
nezávisejí: férová mince, férová ruleta, losování s vracením. Kde události na sobě závisejí,
například při tahání karet bez vracení nebo u opotřebení stroje, minulost o budoucnosti
skutečně něco vypovídá a úvaha z ní je oprávněná. Strukturálně je proto klam spojen s
mlčky přijatým předpokladem o mechanismu: mluvčí jedná, jako by náhodný proces měl paměť a
cíl, ačkoli žádný mechanismus takové paměti neuvádí.

## Detekční znaky

Prvním znakem je jazyk zralosti: výsledek je „na řadě“, „už musí přijít“, „to by byla moc
velká náhoda“. Druhým znakem je odvolání na dlouhodobý poměr, které se uplatňuje na krátkou
řadu: „v průměru to přece vychází nastejno“. Třetím znakem je, že mluvčí neuvádí žádný
mechanismus, který by minulé výsledky spojoval s budoucím; pravděpodobnost se mění jen
proto, že série „trvá dlouho“. Čtvrtým znakem je stupňování sázky po ztrátách s
odůvodněním, že výhra je teď pravděpodobnější. Tato podoba je zvlášť nebezpečná u lidí,
kteří se ocitli v dluzích nebo v závislostním vztahu ke hře. Pátým znakem je opačné
uplatnění v rozhodování o lidech: hodnotitel, který právě schválil několik žádostí po
sobě, má sklon další zamítnout, jako by měl „vyrovnat poměr“, i když každá žádost má být
posouzena samostatně. Tento sklon odpovídá tomu, co výzkum popisuje jako očekávání, že i
krátký úsek řady má vypadat vyváženě (Tversky a Kahneman 1971).

V institucionálním prostředí se klam projevuje i tam, kde se neúspěšné kroky obhajují
tím, že „teď už to musí vyjít“, a kde se z řady nezdarů vyvozuje blížící se úspěch, místo
aby se přezkoumalo, zda je zvolený postup vůbec funkční.

## Odlišení od platné argumentace

Platná úvaha o tom, že minulé výsledky mění pravděpodobnost budoucích, se opírá o
mechanismus závislosti. Kdo ví, že v balíčku karet zbývá méně es, protože es už několik
padlo, usuzuje správně. Kdo ví, že stroj se po opakovaných poruchách opotřebovává, usuzuje
správně, když očekává další poruchu. Kdo z dlouhé řady jednoho výsledku vyvodí, že mince
nebo ruleta nejsou férové, také nemusí chybovat: u dost dlouhé série je rozumné zpochybnit
předpoklad nezávislosti a férovosti. Takový závěr ale míří opačným směrem než hráčský klam,
protože očekává, že série bude pokračovat, nikoli že se obrátí.

Rozumné je také očekávat, že podíl výsledků ve velmi dlouhé řadě se přiblíží teoretické
hodnotě. Klamem se tato úvaha stává teprve tehdy, když se z ní vyvozuje, že nejbližší
pokusy budou odchylku kompenzovat (Tversky a Kahneman 1974). Učebnice neformální logiky
proto zdůrazňují, že posouzení klamu vyžaduje nejprve otázku, zda jsou události skutečně
nezávislé (Damer 2009).

## Stav poznání

Hráčský klam patří k nejstarším popsaným chybám pravděpodobnostního úsudku a výzkum
heuristik ho vysvětlil jako důsledek očekávání, že krátké řady budou reprezentativní
(Tversky a Kahneman 1971; Tversky a Kahneman 1974). Studie vnímání náhodnosti ukázaly, že
lidé, kteří mají vytvořit náhodnou řadu, do ní vkládají víc střídání, než by obsahovala
skutečně náhodná řada, a že řady se skutečnými sériemi považují za méně náhodné (Gilovich
1991). Novější výzkum upozornil, že část intuice o střídání má racionální jádro: v krátkých
oknech konečných řad se některé vzorce skutečně vyskytují s jinou četností, než by naznačoval
jednoduchý výpočet, a lidé, kteří náhodu poznávají jen v takových oknech, si mohou
vytvořit zkreslený obraz. Tento poznatek klam nevyvrací, ale vysvětluje, proč je tak
odolný. Kahneman zdůrazňuje, že vědomí o klamu samo nestačí a že intuitivní dojem
„zralosti“ přetrvává i u lidí, kteří pravidlo znají (Kahneman 2011).

## Obrana a odpověď

Nejjednodušší odpovědí je otázka po mechanismu: co spojuje minulé výsledky s dalším? Pokud
mluvčí žádný mechanismus neuvádí a odvolává se jen na délku série, jde o hráčský klam.
Druhou odpovědí je rozlišit podíl a pořadí: zákon velkých čísel se týká podílu výsledků v
dlouhé řadě, ne pořadí nejbližších pokusů. Pomáhá připomínka, že odchylky se v delších
řadách rozřeďují, nikoli opravují (Tversky a Kahneman 1974). Třetí odpovědí je zastavit
eskalaci: pokud je klam spojen se zvyšováním sázky nebo s pokračováním neúspěšného
postupu, je užitečné rozhodovat o dalším kroku, jako by série neexistovala, tedy podle
očekávané hodnoty a podle toho, co si člověk může dovolit ztratit.

V klinickém a poradenském kontextu je klam důležitý u lidí s problémovým hraním, u nichž
přesvědčení o blížící se výhře udržuje hraní i přes rostoucí ztráty. Obrana tu nespočívá
jen ve vysvětlení pravděpodobnosti, ale i v rozpoznání, kdo z přesvědčení profituje:
prostředí sázek a her je často uspořádáno tak, aby zviditelňovalo „téměř výhry“ a série a
posilovalo dojem, že náhoda je předvídatelná. Gilovich doporučuje u každého dojmu
pravidelnosti klást si otázku, jak by vypadala řada, kdyby šlo o čistou náhodu, a zda by se
od pozorované řady lišila (Gilovich 1991). Tato otázka je stejně užitečná u rulety jako u
hodnocení výkonu, statistik nehodovosti nebo trhů.

## Literatura

- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Tversky, A., & Kahneman, D. (1971). Belief in the law of small numbers. *Psychological Bulletin*, 76(2), 105–110.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Texaský střelec](@/kompendium/argumentacni-fauly/kauzalni/texasky-strelec.md) – příbuzné heslo (Kauzální klamy, Texas sharpshooter)
- [Klam regrese](@/kompendium/argumentacni-fauly/kauzalni/klam-regrese.md) – příbuzné heslo (Kauzální klamy, Regression fallacy)
- [Magické myšlení](@/kompendium/argumentacni-fauly/kauzalni/magicke-mysleni.md) – příbuzné heslo (Kauzální klamy, Magical thinking)
- [Horká ruka](@/kompendium/argumentacni-fauly/statisticke/horka-ruka.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Hot-hand fallacy)
- [Zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Law of small numbers)

**V kompendiu**

- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Kognitivní biasy](@/kompendium/03-zakladni-kategorie/biasy/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Klam konjunkce](@/kompendium/argumentacni-fauly/statisticke/klam-konjunkce.md) – předchozí heslo rodiny
- [Horká ruka](@/kompendium/argumentacni-fauly/statisticke/horka-ruka.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
