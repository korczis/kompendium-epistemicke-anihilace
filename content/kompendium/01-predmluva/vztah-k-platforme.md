+++
title = "1.6 Odkud kniha pochází"
aliases = ["/kompendium/aiad-integration/", "/kompendium/aiad-integration/archer-supreme-ea-orchestration/", "/kompendium/aiad-integration/autoevolve-ea-pattern-evolution/", "/kompendium/aiad-integration/autoheal-ea-regression-repair/", "/kompendium/aiad-integration/black-team-ea-modeling/", "/kompendium/aiad-integration/blue-team-ea-defense/", "/kompendium/aiad-integration/compliance-ea-regulatory-screening/", "/kompendium/aiad-integration/czech-ares-ea-screening/", "/kompendium/aiad-integration/dd-engine-ea-source-weighting/", "/kompendium/aiad-integration/decision-engine-ea-calibration/", "/kompendium/aiad-integration/epistemic-pipeline-ea-detection/", "/kompendium/aiad-integration/gray-team-ea-edge-cases/", "/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence/", "/kompendium/aiad-integration/nabla-infinity-ea-pipeline/", "/kompendium/aiad-integration/operational-execution-ea-deployment/", "/kompendium/aiad-integration/osint-ea-source-validation/", "/kompendium/aiad-integration/perimeter-ea-attack-surface/", "/kompendium/aiad-integration/purple-team-ea-synthesis/", "/kompendium/aiad-integration/qeve-ea-quality-validation/", "/kompendium/aiad-integration/quality-monitor-ea-tracking/", "/kompendium/aiad-integration/red-team-ea-detection/", "/kompendium/aiad-integration/strategic-command-ea-coordination/", "/kompendium/aiad-integration/supreme-commander-ea-strategy/", "/kompendium/aiad-integration/tactical-execution-ea-operations/", "/kompendium/aiad-integration/trinity-gate-ea-verification/", "/kompendium/aiad-integration/white-team-ea-verification/", "/kompendium/section-bridges/bridge-platform-decision-engine-to-kompendium/", "/kompendium/section-bridges/bridge-platform-nabla-to-kompendium/"]
description = "Kniha vznikla uvnitř softwarového projektu. Co z toho plyne pro její slovník, pro její návyky a pro to, čemu v ní čtenář nemá věřit bez dalšího důkazu."
weight = 6
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "predmluva", "puvod", "metodologie", "omezeni"]
categories = ["academic"]

[extra]
related_terms = ["pro-koho-je-urceno", "ucel-kompendia", "jak-pouzivat"]
section_icon = "🔗"
toc = true
+++

# 1.6 Odkud kniha pochází

Kompendium nevzniklo v akademickém ústavu ani na klinice. Vzniklo ve vývojovém kontextu, z něhož
kniha vzešla — uvnitř softwarového projektu, jehož předmětem bylo rozhodování pod nejistotou a
práce s nespolehlivými zdroji. Tato kapitola neříká, co ten projekt byl ani jak fungoval; to do
knihy o epistemické a kognitivní anihilaci nepatří a bylo z ní odstraněno. Říká jen to, co z onoho
původu plyne pro text, který čtenář drží, protože původ textu je součást jeho epistemického
profilu: kdo něco napsal a za jakým účelem, patří k důkazní hodnotě toho, co napsal.

## Co původ s knihou udělal

První a nejviditelnější stopa je slovník. Řada hesel glosáře nese jména, která do psychologie
ani filozofie nepatří, protože vznikla při popisu softwarových a bezpečnostních praktik:
[OSINT](@/glossary/osint.md), [fúze zpravodajství](@/glossary/intelligence-fusion.md),
[rizikové skóre](@/glossary/risk-score.md), [sjednocování entit](@/glossary/entity-resolution.md),
[rámec souladu](@/glossary/compliance-framework.md). Tyto pojmy v knize zůstávají, protože samy
o sobě obecné jsou a text je používá. Hesla, která existovala jen jako pojmy onoho projektu,
v knize nezůstala — jejich adresy vedou na nejbližší obecné heslo nebo do glosáře.

Druhá stopa je **návyk psát o poznání jako o procesu, který lze ověřovat průběžně.** Odtud
pochází důraz, který kniha klade na nezávislost zdrojů, na uchování rozporu místo jeho rychlého
vyřešení a na rozlišení mezi tvrzením a jeho oporou. Tyto zásady kniha zastává a dokládá u
příslušných hesel; že k nim autor přišel při stavbě softwaru, není argument pro ani proti nim.

Třetí stopa je **nedůvěra k taxonomii, která se nerevidovala.** Klasické diagnostické manuály se
mění v dlouhých cyklech: mezi čtvrtým a pátým vydáním diagnostického manuálu uplynulo devatenáct
let (American Psychiatric Association, 1994; American Psychiatric Association, 2013). Kniha z toho
nevyvozuje, že je lepší; vyvozuje, že její vlastní kategorie jsou revidovatelné a že má smysl
psát je tak, aby se revidovat daly. Jak se s nimi pracuje, popisuje kapitola
[Jak kompendium používat](@/kompendium/01-predmluva/jak-pouzivat.md).

## Co z původu neplyne, i když to dřívější verze této kapitoly tvrdila

Starší podoba této kapitoly tvrdila, že taxonomie knihy je „živá“: že je permanentně testována
proti reálným datům, že generuje verifikovatelné predikce, že odchylky se evidují automaticky a
že revize probíhají v týdenních až měsíčních cyklech. **Žádné z těchto tvrzení kniha nedokládá a
nedrží je.** Byla to popis zamýšlené vlastnosti nástroje, ne vlastnost textu, a s odstraněním
popisu toho nástroje zmizela i jeho opora. Kniha je referenční text. Nic v ní není průběžně
validováno proti datům pacientů ani klientů, a kdyby bylo, čtenář by o tom musel dostat doklad,
ne ujištění.

Stejně tak z původu neplyne, že by kategorie knihy byly empiricky potvrzené. Jejich status popisuje
heslo [taxonomie EA](@/glossary/taxonomie-ea.md): jsou to popisné rodiny, nikoli diagnostické
jednotky, nejsou škálou závažnosti ani frekvence a netvrdí o nikom úmysl. Původ ve technickém
projektu tomu nepřidává váhu žádnou.

## Čemu v knize nemá čtenář věřit bez dalšího důkazu

Z původu plyne několik konkrétních rizik, a je poctivější je pojmenovat než je zamlčet
(*interpretace knihy*).

**Čísla, která vypadala jako měření.** Vývojové prostředí produkuje metriky, a dřívější verze
textu nesly údaje — prahy, skóre, podíly —, které žádný zdroj neměl. Postupné revize je
odstraňovaly; kde takový údaj v textu ještě je a není u něj zdroj, je to chyba, nikoli výsledek.
Souvisí s tím [replikační krize](@/glossary/replication-crisis.md): kniha z ní bere především
pravidlo, že nereprodukovaný údaj není fakt.

**Technický slovník tam, kde má být klinický.** Kde text mluví o člověku jazykem vhodným pro
systém, čte se to jako větší jistota, než jaká existuje. Taková místa kniha opravuje, ne
obhajuje.

**Dvojí užití.** Kniha popisuje rozpoznatelnou strukturu útoků na poznání a popisuje ji proto, aby
je čtenář poznal. Totéž porozumění je použitelné i opačně, což je problém, který kniha nemá
vyřešený a pojmenovává ho v hesle [dual-use poznání](@/glossary/dual-use-poznani.md). Z původu
v projektu, který rozhodoval o lidech a organizacích, je toto riziko bližší, ne vzdálenější.

## Proč kapitola zůstává

Odstranit ji by bylo snazší. Zůstává proto, že kniha jinde trvá na tom, že epistemický profil
tvrzení zahrnuje jeho zdroj, a bylo by nekonzistentní uplatňovat to na cizí tvrzení a na vlastní
ne. Čtenář má právo vědět, že text, který ho učí nedůvěřovat jedinému zdroji, vznikl v jediném
kontextu, a že ten kontext zanechal v textu stopy, které autor nemusí vidět celé.

Jméno onoho projektu v knize není, a to je záměr, ne opomenutí: pro čtenáře je bez užitku a
odkazoval by na neveřejný systém. Co má význam, je ta vlastnost, kterou pojmenovává tato kapitola
— že kniha má původ, a tedy i jeho zkreslení.

## Proč je původ textu součástí jeho důkazní hodnoty

Posuzovat tvrzení bez ohledu na to, odkud přišlo, zní jako ctnost, ale v praxi to nejde. Čtenář
nemá přístup k datům, z nichž text vznikl; má přístup k textu a k tomu, co o sobě text prozradí.
Proto je původ součástí toho, co lze o tvrzení zjistit: ne jako argument proti němu, ale jako
informace o tom, jaké chyby jsou v něm pravděpodobné. Kniha tuto zásadu uplatňuje na materiál,
který popisuje — u hesla [testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md)
i tam, kde váží spolehlivost zdrojů —, a bylo by nekonzistentní vyjmout z ní sebe samu
(*interpretace knihy*).

Z původu v technickém projektu plynou tři pravděpodobné chyby, a každá je v knize dohledatelná.
První je **přesnost tam, kde není**: software vyžaduje jednoznačné hodnoty, a text psaný v takovém
prostředí má tendenci uvádět čísla i tam, kde zdroj neexistuje. Druhá je **mechanistický výklad
člověka**: popis, který se hodí pro systém, přenesený na osobu, tvrdí o ní víc, než kolik je
doloženo. Třetí je **přeceňování architektury**: sklon věřit, že dobře rozvržená kategorizace je
tím i empiricky platná. Žádná z nich není hypotetická; všechny tři se v dřívějších verzích textu
vyskytovaly a byly opravovány.

## Čím kniha není a co z toho plyne pro revizi

Kuhn (1962) popsal, že vědecké rámce se nemění hromaděním dílčích poznatků, ale přestavbou toho,
co se vůbec počítá za otázku a za doklad. Z toho kniha nevyvozuje, že její kategorie jsou
předběžné jen formálně: vyvozuje, že revidovatelnost musí být zapsaná ve způsobu, jakým jsou
kategorie napsané — každá rodina pojmenovaná tak, aby šlo říct, co by ji vyvrátilo, a každé heslo
oddělující doloženou část od vlastní interpretace. Kde to text nedělá, je to vada, ne styl.

Klasické diagnostické manuály revidují v dlouhých cyklech: mezi čtvrtým a pátým vydáním
diagnostického manuálu (American Psychiatric Association, 1994; American Psychiatric
Association, 2013) uplynulo devatenáct let, a to
při podstatně větším aparátu, než má tato kniha. Kompendium z toho nevyvozuje svou převahu —
dlouhý cyklus manuálu je důsledkem nároků na konsenzus, které kniha nemá. Vyvozuje jen, že text
bez institucionální kontroly potřebuje vlastní zábrany, a popisuje je v kapitole
[Jak kompendium používat](@/kompendium/01-predmluva/jak-pouzivat.md) a v hesle
[epistemická bezpečnost](@/glossary/epistemic-security.md).

## Literatura

- American Psychiatric Association (1994). *Diagnostic and Statistical Manual of Mental
  Disorders* (4. vyd.). Washington, DC: APA.
- American Psychiatric Association (2013). *Diagnostic and Statistical Manual of Mental
  Disorders* (5. vyd.). Arlington, VA: APA.
- Kuhn, T. S. (1962). *The Structure of Scientific Revolutions*. Chicago: University of Chicago
  Press.

## Související

**Rámec knihy**

- [Pro koho je kompendium určeno](@/kompendium/01-predmluva/pro-koho-je-urceno.md)
- [Účel kompendia](@/kompendium/01-predmluva/ucel-kompendia.md)
- [Jak kompendium používat](@/kompendium/01-predmluva/jak-pouzivat.md)

**Status kategorií**

- [Taxonomie EA](@/glossary/taxonomie-ea.md)
- [Replikační krize](@/glossary/replication-crisis.md)
- [Falsifikace](@/glossary/falsifikace.md)

**Etika a rizika**

- [Dual-use poznání](@/glossary/dual-use-poznani.md)
- [Epistemická bezpečnost](@/glossary/epistemic-security.md)
- [Testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md)
