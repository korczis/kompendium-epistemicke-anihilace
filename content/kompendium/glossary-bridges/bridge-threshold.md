+++
title = "Bridge: Práh (threshold)"
weight = 100
description = "Most mezi pojmem prahu a knihou: prahy pro detekci, eskalaci, oznámení a přerušení intervence, jejich nastavení a rizika falešně pozitivních i negativních závěrů."

[taxonomies]
tags = ["glossary-bridge", "kompendium", "cross-link", "diagnostika"]

[extra]
category = "kompendium-bridge"
related_terms = ["risk-score", "bridge-kontraindikace", "bridge-readiness", "decision-engine", "pattern-evidence", "bridge-risk-score"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
+++

# Bridge: Práh (threshold)

> **Most** spojuje pojem prahu s místy knihy, kde se z pozorování stává rozhodnutí: kdy považovat
> vzorec za manipulaci, kdy eskalovat k akutní péči, kdy oznámit, kdy intervenci přerušit. Přehled
> mostů je v rejstříku [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

**Práh** je hodnota nebo kombinace znaků, při jejímž dosažení se mění postup. V klinické praxi jde
například o hraniční skóre dotazníku, v právu o podmínky povinnosti oznámit, v detekci o počet a
sílu znaků, při nichž pozorovatel považuje vzorec za doložený. Pojem nemá vlastní heslo v glosáři;
nejblíže mu je [Risk Score](@/glossary/risk-score.md), k němuž se práh vztahuje jako rozhodovací
pravidlo.

Každý práh je **kompromisem mezi dvěma chybami**: příliš nízký vede k falešně pozitivním závěrům
(nálepkování, zbytečné zásahy, stigmatizace), příliš vysoký k falešně negativním (přehlédnutá
manipulace, pozdní pomoc). Volba prahu proto není jen technická, ale i etická otázka: kterou chybu
jsme v dané situaci ochotni riskovat víc?

## Původ a kontext pojmu

Formální rámec pro úvahu o prazích nabízí teorie detekce signálu. Green a Swets (1966) ukázali, že
každé rozhodnutí o přítomnosti signálu v šumu má dvě nezávislé složky: schopnost signál od šumu
rozlišit a ochotu prohlásit, že signál je přítomen. Posunutím prahu se nemění rozlišovací schopnost,
jen poměr mezi zachycenými případy a falešnými poplachy. Swets, Dawes a Monahan (2000) tento rámec
přenesli do diagnostiky, psychologie a soudního rozhodování a ukázali, že explicitní volba prahu
podle důsledků chyb zlepšuje rozhodování ve srovnání s intuicí. Youden (1950) navrhl jednoduchý
ukazatel, jímž lze najít práh s nejlepším součtem citlivosti a specificity, ale ten předpokládá, že
obě chyby jsou stejně závažné – což v praxi platí zřídka.

V klinickém rozhodování popsali Pauker a Kassirer (1980) *prahový přístup*: lékař má jednat tehdy,
když pravděpodobnost onemocnění překročí hodnotu, při níž očekávaný přínos léčby převýší její rizika.
Práh tedy neurčuje jen to, co víme, ale i to, co je v sázce. Pro knihu je to klíčový poznatek: tam,
kde je v sázce život, se práh pro jednání posouvá níž; tam, kde hrozí nálepka, se posouvá výš.

## Typy prahů v knize

Detekční práh určuje, kdy pozorovatel považuje vzorec za doložený; kniha ho rozvádí ve sbírce
[Detekční signatury EA technik](@/kompendium/detection-signatures/_index.md), kde je každá signatura
svazkem znaků, nikoli jediným spouštěčem. **Screeningový** práh vede k doporučení podrobnějšího
vyšetření; nástroje a jejich hraniční hodnoty popisuje [Diagnostické dotazníky a nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md)
a postup [EA-6.1.1 Strukturovaný screeningový rozhovor](@/kompendium/techniques/ea-6-1-1-screening-strukturalni-rozhovor.md).
**Eskalační** práh znamená přechod k akutní péči; ten určují [Akutní intervenční protokoly](@/kompendium/emergency-protocols/_index.md).
**Oznamovací** práh vymezuje povinnost nebo oprávnění informovat úřady; obecné zásady rozebírá
[Povinné hlášení](@/kompendium/forensic-legal/40-mandatory-reporting-state.md). **Ukončovací** práh
přerušuje cvičení nebo intervenci, jak popisuje [EA-4.1.7 Kritéria ukončení](@/kompendium/techniques/ea-4-1-7-termination-criteria.md).
A **důkazní** práh určuje váhu vzorce v řízení; viz [Pattern důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md).

Na prahy navazují dvě sesterská rozhodnutí: kdy začít ([Bridge: Readiness](@/kompendium/glossary-bridges/bridge-readiness.md))
a kdy nezačínat nebo přerušit ([Bridge: Kontraindikace](@/kompendium/glossary-bridges/bridge-kontraindikace.md)).

## Klinické a praktické implikace

### Vzorec, ne jednotlivost

Jednotlivý znak práh nepřekračuje. Rozhoduje kombinace znaků, jejich opakování v čase a vazba na
prostředí. Tato zásada odpovídá logice více nezávislých signálů, kterou kniha popisuje u
[Bridge: HAWKEYE](@/kompendium/glossary-bridges/bridge-hawkeye.md): náhodný šum se v různých kanálech
neopakuje, skutečný vzorec ano.

### Asymetrie podle závažnosti

U rizika pro život – sebevražedného jednání, násilí, ohrožení dítěte – se práh pro jednání posouvá
níž, protože cena přehlédnutí je nevratná. U označení vztahu nebo skupiny za „manipulativní“ se práh
posouvá výš, protože nálepka sama může škodit a obtížně se odvolává. Tato asymetrie odpovídá prahovému
přístupu Paukera a Kassirera (1980) a je třeba ji v dokumentaci výslovně uvést.

### Prahy nástrojů nejsou diagnózy

Hraniční skóre dotazníku vede k dalšímu vyšetření, ne k závěru. U vzácných jevů navíc i přesný nástroj
vede k mnoha falešně pozitivním výsledkům, protože lidé při úsudku soustavně podceňují základní četnost
jevu (Kahneman a Tversky 1973). Gigerenzer (2002) doporučuje převádět výsledky do přirozených četností
(„z tisíce lidí s tímto skóre…“), které chybu činí viditelnou.

### Dokumentace a revize

Každé rozhodnutí na prahu má mít zapsané zdůvodnění: proč byl práh považován za překročený nebo
nepřekročený a jaké znaky k tomu vedly. Prahy je třeba ověřovat na zkušenosti a upravovat; kritické
výhrady k riziku falešně pozitivních detekcí shromažďuje oddíl [Kritické perspektivy](@/kompendium/critical-perspectives/_index.md).

## Odlišení

Práh je třeba odlišit od **diagnózy** a od **důkazního standardu**. Diagnóza je odborný závěr o stavu
člověka, který se opírá o mnoho zdrojů a o klasifikační kritéria; práh je jen pravidlem, kdy udělat
další krok. Důkazní standard v řízení – míra přesvědčení, kterou soud nebo úřad vyžaduje pro určitý
závěr – je stanoven právem a liší se podle druhu řízení; klinický práh pro sledování nebo ochranu ho
nenahrazuje a nemá se s ním zaměňovat. Swets, Dawes a Monahan (2000) zdůrazňují, že tytéž údaje mohou
vést k různým rozhodnutím podle toho, k čemu rozhodnutí slouží, a že právě proto je třeba účel prahu
vždy uvést. Klinik, který překročí práh pro ochranné opatření, tím neříká, že se manipulace „prokázala“.

## Vztah k platformě

Na platformě Prismatic, z níž kniha vzešla, se prahy používají při převodu signálů na skóre rizika a
doporučení v rozhodovacím modulu; viz [Decision Engine](@/glossary/decision-engine.md) a
[Bridge: Risk score](@/kompendium/glossary-bridges/bridge-risk-score.md). V knize mají prahy stejnou
logiku, ale vždy podléhají klinickému nebo právnímu úsudku člověka.

## Časté omyly

Prvním omylem je přesvědčení, že pevný práh je objektivní. Každý práh v sobě nese hodnotové rozhodnutí
o tom, kterou chybu preferujeme, a toto rozhodnutí má být vysloveno. Druhým omylem je, že „pod prahem
není nic“: podprahové znaky jsou důvodem ke sledování, ne k nečinnosti. Třetím omylem je měnit práh
podle toho, jaký závěr si přejeme; práh se má stanovit předem a jeho změna zdůvodnit.

## Příklad (anonymizovaný kompozit)

Školní psycholožka pracuje s dotazníkem, jehož hraniční skóre má podle manuálu vést k podrobnějšímu
vyšetření. Žákyně skóre těsně nepřekročí, ale v rozhovoru zmíní, že ji starší kamarád „učí, komu nesmí
věřit“, a že přestala chodit na kroužek. Psycholožka výsledek dotazníku nepovažuje za konečný, protože
jednotlivé znaky v rozhovoru ukazují vzorec izolace, a protože u ohrožení dítěte je práh pro jednání
nižší. Domluví se s třídní učitelkou na sledování, pozve rodiče a do dokumentace zapíše, proč se od
skóre odchýlila.

## Meze a otevřené otázky

Pro většinu jevů, které kniha popisuje, neexistují validované prahy; kniha proto mluví spíše o
rozhodovacích pravidlech a o vzorcích znaků než o číselných hranicích. Otevřenou otázkou je, jak prahy
ověřovat bez rizika, že se samy stanou nástrojem nálepkování, a jak sladit prahy různých profesí –
klinika, sociálního pracovníka, policisty –, které se na stejný případ dívají z různých stran.

## Literatura

- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. Simon & Schuster.
- Green, D. M., & Swets, J. A. (1966). *Signal Detection Theory and Psychophysics*. Wiley.
- Kahneman, D., & Tversky, A. (1973). On the psychology of prediction. *Psychological Review*, 80(4), 237–251.
- Pauker, S. G., & Kassirer, J. P. (1980). The threshold approach to clinical decision making. *New England Journal of Medicine*, 302(20), 1109–1117.
- Swets, J. A., Dawes, R. M., & Monahan, J. (2000). Psychological science can improve diagnostic decisions. *Psychological Science in the Public Interest*, 1(1), 1–26.
- Youden, W. J. (1950). Index for rating diagnostic tests. *Cancer*, 3(1), 32–35.

## Související

**Sesterské mosty**

- [Bridge: Kontraindikace](@/kompendium/glossary-bridges/bridge-kontraindikace.md) – prahy pro nezahájení a přerušení.
- [Bridge: Readiness](@/kompendium/glossary-bridges/bridge-readiness.md) – prahy pro zahájení.
- [Bridge: Risk score](@/kompendium/glossary-bridges/bridge-risk-score.md) – skóre, k němuž se práh vztahuje.

**Diagnostika**

- [Diagnostické dotazníky a nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md) – hraniční skóre a rozhodovací pravidla.
- [6.1 Diagnostické indikátory](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md) – kombinace znaků.
- [EA-6.1.4 Observační hodnocení](@/kompendium/techniques/ea-6-1-4-observational-assessment.md) – sledování ukazatelů v čase.

**Rizika a právo**

- [Kritické perspektivy](@/kompendium/critical-perspectives/_index.md) – cena nízkého prahu.
- [Pattern důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md) – práh v řízení.
- [Akutní intervenční protokoly](@/kompendium/emergency-protocols/_index.md) – eskalační prahy.
