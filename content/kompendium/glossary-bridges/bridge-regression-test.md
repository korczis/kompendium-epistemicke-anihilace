+++
title = "Bridge: Regression test (regresní test)"
description = "Most mezi heslem regresní test a knihou: hlídka proti návratu opravené vady, lidská obdoba v prevenci relapsu a v institucionální paměti a odlišení od psychologického pojmu regrese."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "regression-test", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["regression-test", "autoheal", "clean-run", "quality-debt", "epistemicka-regrese", "addiction-recovery"]
glossary_target = "regression-test"
toc = false
+++

# Bridge: Regression test (regresní test)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Regresní test](@/glossary/regression-test.md) (*regression test*) je v softwarovém inženýrství test
napsaný proto, aby ověřil, že dříve zjištěná a opravená chyba se v dalším vývoji nevrátí. Na rozdíl od
běžných testů, které ověřují zamýšlenou funkci, míří regresní testy na známé způsoby selhání: zachycují
přesné podmínky, které vadu vyvolaly, a ověřují, že systém s nimi nyní zachází správně. Myers (1979)
v klasické učebnici testování zdůraznil, že testování je hledání chyb, nikoli dokazování jejich
nepřítomnosti; regresní test je trvalým záznamem o tom, co už jednou selhalo. Feathers (2004) šel dál a
označil kód bez testů za „zděděný“ – takový, který nelze bezpečně měnit, protože nikdo neví, co změna
rozbije.

Na platformě, z níž Kompendium vzešlo, se regresní testy spojují s mechanismem samoopravy
[AutoHeal](@/glossary/autoheal.md) a s požadavkem „čistého běhu“ ([clean run](@/glossary/clean-run.md)).
Heslo patří do kontextu platformy. Kniha ho zařazuje mezi mosty kvůli myšlence, kterou přenáší na lidi
i instituce: **co se jednou pokazilo a bylo opraveno, potřebuje hlídku, aby se to nevrátilo**.

## Regresní test očima knihy

Kniha v regresním testu vidí strukturní obdobu **prevence relapsu**. Marlatt a Gordon (1985) popsali
prevenci relapsu u závislostí jako soustavné rozpoznávání vysoce rizikových situací, nácvik zvládání a
plán pro případ, že k uklouznutí dojde. Witkiewitz a Marlatt (2004) model přepracovali a zdůraznili, že
relaps není binární selhání, ale dynamický proces, v němž hrají roli spouštěče, sebedůvěra a reakce na
první uklouznutí. Regresní test i prevence relapsu stojí na stejném principu: nejprve přesně popsat
podmínky, za nichž k selhání došlo, a pak je opakovaně zkoušet.

U epistemické manipulace má relaps zvláštní podobu. Člověk, který rozpoznal manipulativní vztah nebo
skupinu a odešel, může být znovu zasažen – stejnou osobou, jinou skupinou se stejnou strukturou nebo
novým „učitelem“, který nabídne totéž v jiném jazyce. Kniha proto v zotavení zařazuje
[Subakutní detekční trénink](@/kompendium/recovery-protocols/subacute-detection-training.md): nácvik
rozpoznání vzorců, jimž byl člověk vystaven, aby je poznal i v nové podobě. Je to lidská obdoba sady
regresních testů – každý test odpovídá jednomu způsobu, jímž byl člověk dříve zasažen.

Třetí analogie se týká **institucionální paměti**. Organizace, která prošla incidentem – šikanou,
podvodem, manipulací vedením –, ho často po několika letech zopakuje, protože lidé, kteří si ho
pamatovali, odešli. Gawande (2009) ukázal na kontrolních seznamech v chirurgii a letectví, že zapsaný
seznam kritických kroků brání opakování známých chyb i u zkušených profesionálů. Kontrolní seznam
odvozený z minulého incidentu je institucionálním regresním testem. Kniha na to navazuje v kapitole
[Učení po incidentu](@/kompendium/organizational-defense/40-post-incident-learning.md).

## Kde se pojem v knize vyskytuje

Jak platforma odhaluje a opravuje regrese obrany proti technikám EA – včetně toho, jak se z opravy
stává trvalý test –, popisuje stránka [AutoHeal a EA](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md);
sledování ukazatelů v čase stránka [Quality Monitor a EA](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md).

Lidskou obdobu rozvádějí [Dlouhodobá prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md),
[Subakutní detekční trénink](@/kompendium/recovery-protocols/subacute-detection-training.md) a preventivní
kapitola [Prevence relapsu](@/kompendium/prevention-resilience/21-relapse-prevention-EA.md). Akutní stránku
– rozpoznání a zvládnutí relapsu, který už nastal – popisují krizové protokoly
[Rozpoznání relapsu](@/kompendium/emergency-protocols/33-relapse-recognition.md) a
[Relaps jako krize](@/kompendium/emergency-protocols/34-relapse-emergency.md). Program prevence relapsu
v institucionálním měřítku je předmětem techniky
[EA-3.3.6 Program prevence relapsu](@/kompendium/techniques/ea-3-3-6-relapse-prevention-program.md).

## Od pojmu k praxi

### Rozpoznání

V softwaru se chybějící regresní test pozná podle toho, že tatáž chyba se objevuje opakovaně a pokaždé
se „opravuje“ znovu. U člověka je obdobou vzorec, v němž se opakovaně dostává do podobných vztahů nebo
skupin, a pokaždé to vnímá jako novou, nesouvisející zkušenost. Kniha k rozpoznání nabízí otázky: Co
mají moje dřívější zkušenosti společného? Jaké okolnosti předcházely tomu, než jsem ztratil vlastní
úsudek? A poznal bych tytéž okolnosti, kdyby přišly v jiném jazyce?

### Obrana

Obranou je převést každou zkušenost v konkrétní „test“: popsat, jak manipulace začala, co ji umožnilo a
jaké první znaky člověk přehlédl. Takový popis lze opakovaně používat jako kontrolní seznam při
navazování nových vztahů a vstupu do nových skupin. Pro instituce kniha doporučuje, aby každé vyšetření
incidentu končilo konkrétním opatřením, které se pravidelně ověřuje, a ne jen zprávou, která se založí.

### Náprava

Když k relapsu dojde, platí zásada, kterou Witkiewitz a Marlatt (2004) zdůraznili: reakce na
uklouznutí je důležitější než uklouznutí samo. Člověk, který návrat prožívá jako důkaz vlastního
selhání, má sklon pokračovat; člověk, který ho prožívá jako informaci, se z něj může poučit. V softwaru
je obdobou to, že objevená regrese se nestává ostudou, ale novým testem. Kniha k tomu odkazuje na návod
[Sebesoucit](@/kompendium/self-defense-guides/16-self-compassion.md).

### Rámec pro profesionály

Pro kliniky z analogie plyne praktický nástroj: na konci léčebné fáze sepsat s klientem jeho osobní
„sadu testů“ – situace, slova a vzorce, které pro něj byly spouštěčem –, a pravidelně se k ní vracet
při následných kontrolách. Kniha k tomu odkazuje na techniku
[EA-4.2.8 Dlouhodobé sledování](@/kompendium/techniques/ea-4-2-8-long-term-followup.md).

## Odlišení od příbuzných pojmů

Regresní test je třeba odlišit od psychologického pojmu **regrese**. V psychoanalytické tradici označuje
regrese obranný návrat k vývojově dřívějším způsobům prožívání a jednání; s regresním testem ho
spojuje jen slovo. Kniha rovněž odlišuje [epistemickou regresi](@/glossary/epistemicka-regrese.md) –
návrat k méně rozvinutým způsobům poznávání pod vlivem manipulace. Regresní test se netýká vývojové
úrovně, ale návratu konkrétní, dříve opravené vady. Od mechanismu [AutoHeal](@/glossary/autoheal.md) se
liší tím, že test vadu odhaluje, samooprava ji opravuje.

## Časté omyly

Prvním omylem je přesvědčení, že opravená vada se nevrátí; změny jinde v systému ji mohou znovu
vyvolat. Druhým omylem je domněnka, že relaps znamená, že předchozí zotavení bylo „falešné“. Třetím
omylem je mít testů tolik, že je nikdo nespouští; kniha i platforma dávají přednost menší sadě, která
se skutečně používá.

## Příklad (anonymizovaný kompozit)

Žena, která před lety odešla z kontrolujícího vztahu, si v terapii sepsala, jak vztah začínal:
zahrnování pozorností, rychlé sblížení, postupné omezování kontaktů s přáteli „protože ti nepřejí“.
Po třech letech se seznámí s mužem, který se chová velmi pozorně a po měsíci navrhne, aby spolu
bydleli. Vzpomene si na svůj seznam, všimne si, že ji odrazuje od víkendu s kamarádkami, a zpomalí.
Nejde o podezíravost vůči každé pozornosti, ale o test, který si napsala sama.

## Meze a otevřené otázky

Analogie mezi softwarovým testem a lidskou prevencí relapsu je heuristická. Lidské zkušenosti se
neopakují v přesně stejné podobě a „test“ napsaný podle minulosti může přehlédnout novou formu. Otevřená
zůstává otázka, jak udržet osobní a institucionální paměť živou, aniž by se změnila v trvalou ostražitost,
která sama zatěžuje.

## Literatura

- Beck, K. (2003). *Test-Driven Development: By Example*. Addison-Wesley.
- Feathers, M. C. (2004). *Working Effectively with Legacy Code*. Prentice Hall.
- Gawande, A. (2009). *The Checklist Manifesto: How to Get Things Right*. Metropolitan Books.
- Marlatt, G. A., & Gordon, J. R. (Eds.) (1985). *Relapse Prevention: Maintenance Strategies in the Treatment of Addictive Behaviors*. Guilford Press.
- Myers, G. J. (1979). *The Art of Software Testing*. Wiley.
- Witkiewitz, K., & Marlatt, G. A. (2004). Relapse prevention for alcohol and drug problems: That was Zen, this is Tao. *American Psychologist*, 59(4), 224–235.

## Související

**Glosář**

- [Regression test](@/glossary/regression-test.md) – technické heslo, které most propojuje.
- [AutoHeal](@/glossary/autoheal.md) – samooprava, k níž test patří.
- [Epistemická regrese](@/glossary/epistemicka-regrese.md) – pojem, který je třeba odlišit.
- [Addiction recovery](@/glossary/addiction-recovery.md) – princip platformy budovaný podle vzoru prevence relapsu.

**Kniha**

- [Dlouhodobá prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md) – lidská obdoba regresního testu.
- [Subakutní detekční trénink](@/kompendium/recovery-protocols/subacute-detection-training.md) – nácvik rozpoznání vzorců.
- [Učení po incidentu](@/kompendium/organizational-defense/40-post-incident-learning.md) – institucionální paměť.
- [AutoHeal a EA](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) – regrese obrany na platformě.

**Sesterské mosty**

- [Bridge: AutoHeal](@/kompendium/glossary-bridges/bridge-autoheal.md) – oprava vady.
- [Bridge: Clean run](@/kompendium/glossary-bridges/bridge-clean-run.md) – běh bez chyb jako cíl.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Regression test (regresní test)](@/glossary/regression-test.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
