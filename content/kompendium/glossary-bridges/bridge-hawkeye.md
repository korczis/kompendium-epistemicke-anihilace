+++
title = "Bridge: HAWKEYE"
description = "Most mezi heslem HAWKEYE a knihou: rozpoznávání podle více signálů s odstupňovanou reakcí a dvojí užití sledování, které může chránit i ovládat."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "hawkeye", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["hawkeye", "signal-plurality", "panopticism", "dual-use-poznani", "bridge-panopticism", "bridge-risk-score"]
glossary_target = "hawkeye"
toc = false
+++

# Bridge: HAWKEYE

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[HAWKEYE](@/glossary/hawkeye.md) je na platformě Prismatic, z níž kniha vzešla, systém zpravodajství
o návštěvnících webu (*visitor intelligence*). V reálném čase analyzuje chování návštěvníků, kombinuje
technické otisky, vzorce navigace, časování požadavků a známé ukazatele hrozeb a koreluje je
s kanály zpravodajství o hrozbách. Heslo glosáře zdůrazňuje, že smysluplný bezpečnostní poznatek
nevzniká z izolovaného údaje, ale ze **spojení více signálů**: jeden požadavek o záměru mnoho
neprozradí, korelace mnoha signálů vytvoří ucelený obraz. Na rozdíl od statických pravidel webového
firewallu pracuje HAWKEYE s adaptivními modely a s odstupňovanou reakcí.

Pro knihu je pojem příkladem dvou věcí, které heslo glosáře výslovně uvádí. Za prvé ukazuje princip,
který kniha uplatňuje i na lidskou detekci manipulace: **žádné zařazení podle jediného signálu**,
odstupňovaná reakce místo binárního verdiktu, průběžná kalibrace a záznam důvodů. Za druhé připomíná,
že nástroje sledování mají **dvojí použití**: stejná technika, která chrání web, může v jiných rukou
sloužit dohledu nad lidmi.

## Pojem v jeho vlastním oboru

Spojování více slabých signálů do jednoho posouzení je základem detekce v mnoha oborech. Teorie
detekce signálu ukazuje, že každé rozhodnutí o přítomnosti signálu v šumu je kompromisem mezi
zachycením skutečných případů a falešnými poplachy a že tento kompromis určuje zvolený práh (Green
a Swets 1966). Korelace nezávislých signálů zlepšuje rozlišení, protože náhodný šum se v různých
kanálech neopakuje, kdežto skutečný vzorec ano. Na platformě tento princip vyjadřuje pojem
[Signal Plurality](@/glossary/signal-plurality.md).

Behaviorální profilování návštěvníků je zároveň technikou, kterou studie dohledu popisují jako jádro
současné datové ekonomiky. Zuboffová (2019) analyzovala, jak se údaje o chování stávají surovinou
pro předpovídání a ovlivňování jednání; Lyon (2007) shrnul studium dohledu jako pole, které zkoumá,
jak sběr údajů o lidech mění vztahy moci. Technika je tatáž, liší se účel a kontrola.

## Analogie, kterou kniha činí

Kniha přebírá z HAWKEYE metodickou zásadu pro lidské posuzování. Žádný jednotlivý znak – ostrá věta,
žárlivá otázka, odmítnutí návštěvy – manipulaci nedokazuje. Teprve vzorec více znaků v čase, z více
zdrojů a ve shodném směru dává podklad k závěru. Proto kniha v kapitole
[6.1 Diagnostické indikátory](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md)
pracuje s kombinacemi znaků a ve sbírce [Detekční signatury EA technik](@/kompendium/detection-signatures/_index.md)
popisuje signatury jako svazky pozorování, nikoli jako jednotlivé spouštěče. Odstupňovaná reakce
odpovídá klinické praxi: od pozornosti přes podrobnější vyšetření až po akutní zásah, jak to rozvádí
[Bridge: Práh (threshold)](@/kompendium/glossary-bridges/bridge-threshold.md).

Druhá polovina analogie je varováním. Nástroje sledování jsou v manipulativních vztazích častým
prostředkem kontroly: lokalizace telefonu, čtení zpráv, sledovací aplikace. Výzkum zneužívání
technologií v partnerském násilí ukazuje, že pachatelé často využívají běžné nástroje a sdílené
účty, nikoli sofistikovaný software (Freed a kol. 2018; Woodlock 2017). Kniha tento vzorec řadí do
rámce [coercive control](@/kompendium/glossary-bridges/bridge-coercive-control.md) a připomíná
Foucaultovu (1975) analýzu, podle níž vědomí možného pozorování samo mění chování – viz
[Bridge: Panopticism](@/kompendium/glossary-bridges/bridge-panopticism.md).

## Kde se pojem v knize vyskytuje

Platformní souvislosti popisují stránky [HAWKEYE a zpravodajství o návštěvnících](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md)
a [Perimeter a útočná plocha](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md). Právní a
etické meze sběru údajů rozebírá [EA × Compliance: GDPR a ochrana osobního narativu](@/kompendium/cross-domain/27-ea-compliance-gdpr-narrative-protection.md).
Preventivní stránku digitálního bezpečí popisuje [Digitální hygiena](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md)
a forenzní práci s elektronickými stopami [Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md).

## Od pojmu k praxi

### Rozpoznání: zneužité sledování

Znakem toho, že sledování ve vztahu přestalo být péčí a stalo se kontrolou, je **asymetrie a
nedobrovolnost**: jedna strana ví, kde druhá je a s kým píše, ale opačně to neplatí; souhlas byl
vynucen nebo nebyl dán vůbec; a odmítnutí sledování se vykládá jako důkaz, že „máš co skrývat“.
Typické je také to, že kontrolující osoba ví věci, které jí zasažený neřekl. Kniha tyto znaky
spojuje s detekční signaturou [Asymetrické odhalování](@/kompendium/detection-signatures/15-behavioral-asymmetric-disclosure.md).

### Odlišení

Ne každé sdílení polohy je kontrolou. Rodiče malých dětí, partneři, kteří se na sdílení dohodli
oboustranně, nebo lidé se zdravotním rizikem mohou mít dobré důvody. Rozhodující je dobrovolnost,
symetrie, možnost sdílení kdykoli ukončit a to, zda se informace používá k ochraně, nebo k omezování.
U posuzování manipulace pak platí metodický princip HAWKEYE: jednotlivý znak není důkazem, vzorec ano.

### Obrana

Obrana proti zneužitému sledování začíná bezpečností zařízení a účtů – změnou hesel, kontrolou
sdílení polohy a přístupů –, ale kniha upozorňuje, že náhlé odstřižení kontrolující osoby může
zvýšit riziko; u nebezpečných vztahů proto patří technické kroky do bezpečnostního plánu
sestaveného s odborníky. Obecné postupy nabízí [Digitální hygiena](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md).
Pro instituce plyne z HAWKEYE zásada minimalizace dat a účelového omezení: sbírat jen to, co je
k ochraně nezbytné, a vědět, kdo k údajům má přístup.

### Rámec pro profesionály

Pro vyšetřovatele a znalce znamená princip více signálů povinnost opírat závěr o soubor nezávislých
pozorování a výslovně uvádět, na čem stojí. Kniha k tomu odkazuje na [Pattern důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md)
a na [Potvrzení třetí osobou](@/kompendium/forensic-legal/37-third-party-corroboration.md). Kliniky
vede k tomu, aby se nespokojili s jedním výrazným znakem a aby si u každého závěru zaznamenali
důvody, které ho podporují i zpochybňují.

## Časté omyly

Prvním omylem je myslet si, že více údajů znamená vždy lepší poznání. Bez kalibrace a bez znalosti
základní četnosti jevu vede korelace mnoha signálů k přesvědčivým, ale chybným profilům. Druhým
omylem je přenášet logiku sledování návštěvníků na lidi kolem sebe; co je u webu legitimní obranou,
je u partnera nebo zaměstnance zásahem do soukromí. Třetím omylem je považovat zasaženého za
„paranoidního“, když popisuje, že je sledován: zneužití technologií je doložený a běžný jev a jeho
popis zaslouží věcné ověření.

## Příklad (anonymizovaný kompozit)

Žena popisuje poradkyni, že partner vždy ví, kde byla, a cituje věty z jejích rozhovorů s kamarádkou.
Poradkyně její obavy nebagatelizuje, ale ani hned neuzavírá. Společně projdou, které účty jsou sdílené
a jaká zařízení partner nastavoval. Ukáže se, že telefon má aktivní sdílení polohy a že partner zná
heslo k jejímu cloudovému účtu. Poradkyně s ní sestaví bezpečnostní plán, v němž se technické kroky
provedou až ve chvíli, kdy bude mít zajištěnou podporu. Případ ilustruje princip více signálů i
dvojí užití běžných nástrojů.

## Meze a otevřené otázky

Analogie mezi technickou detekcí a lidským posuzováním má meze: lidské chování je kontextové a jeho
„signály“ nejsou nezávislé tak jako technické údaje. Otevřenou otázkou je, jak chránit lidi před
zneužitým sledováním, aniž by se ochrana sama stala novým dohledem, a jak v době všudypřítomných
dat vymezit, co je ještě péče a co už kontrola.

## Literatura

- Foucault, M. (1975). *Surveiller et punir: Naissance de la prison*. Gallimard.
- Freed, D., Palmer, J., Minchala, D., Levy, K., Ristenpart, T., & Dell, N. (2018). „A stalker's paradise“: How intimate partner abusers exploit technology. In *Proceedings of the 2018 CHI Conference on Human Factors in Computing Systems*. ACM.
- Green, D. M., & Swets, J. A. (1966). *Signal Detection Theory and Psychophysics*. Wiley.
- Lyon, D. (2007). *Surveillance Studies: An Overview*. Polity.
- Woodlock, D. (2017). The abuse of technology in domestic violence and stalking. *Violence Against Women*, 23(5), 584–602.
- Zuboff, S. (2019). *The Age of Surveillance Capitalism*. PublicAffairs.

## Související

**Glosář**

- [HAWKEYE](@/glossary/hawkeye.md) – heslo, které tento most propojuje s knihou.
- [Signal Plurality](@/glossary/signal-plurality.md) – princip více nezávislých signálů.

**Kniha**

- [HAWKEYE a zpravodajství o návštěvnících](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md) – použití v kontextu EA.
- [EA × Compliance: GDPR](@/kompendium/cross-domain/27-ea-compliance-gdpr-narrative-protection.md) – meze sběru údajů.
- [Detekční signatury EA technik](@/kompendium/detection-signatures/_index.md) – signatury jako svazky pozorování.
- [Digitální hygiena](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md) – ochrana zařízení a účtů.

**Sesterské mosty**

- [Bridge: Panopticism](@/kompendium/glossary-bridges/bridge-panopticism.md) – moc pozorování.
- [Bridge: Práh (threshold)](@/kompendium/glossary-bridges/bridge-threshold.md) – odstupňovaná reakce.
- [Bridge: Dual-use poznání](@/kompendium/glossary-bridges/bridge-dual-use-poznani.md) – dvojí užití nástrojů.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [HAWKEYE](@/glossary/hawkeye.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
