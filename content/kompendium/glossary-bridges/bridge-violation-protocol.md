+++
title = "Bridge: Violation protocol (protokol porušení)"
description = "Most mezi heslem protokolu porušení a knihou: odstupňovaná reakce na porušení standardů v softwaru a proč tresty a „restart od nuly“ mají v lidských skupinách opačný význam."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "violation-protocol", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["violation-protocol", "nm-nd", "zero-warning-policy", "bite-model", "bridge-nm-nd", "bridge-bite-model"]
glossary_target = "violation-protocol"
toc = false
+++

# Bridge: Violation protocol (protokol porušení)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Protokol porušení](@/glossary/violation-protocol.md) (*violation protocol*) je na platformě Prismatic,
z níž kniha vzešla, formální rámec eskalace a vynucení, který řídí reakce na porušení
[doktríny NM/ND](@/glossary/nm-nd.md). Definuje čtyři odstupňované úrovně, z nichž každá odpovídá
určité závažnosti porušení, předepsané reakci a autoritě, která porušení řeší. Heslo glosáře zdůrazňuje,
že protokol odmítá neformální řešení – komentáře v revizi kódu nebo opakovatelné selhání sestavení – a
chápe vynucení kvality jako deterministický a auditovatelný proces. Souvisí s [Zero Warning Policy](@/glossary/zero-warning-policy.md),
která porušení zachycuje.

Heslo glosáře přesně vymezuje vztah ke knize: protokol se týká **výhradně softwarových artefaktů**.
Kniha upozorňuje, že stupňované tresty, „restart od nuly“ a přezkum nejvyšší autoritou mají v lidských
skupinách opačný význam – jsou typickými prvky kontroly chování v prostředích s vysokou mírou kontroly.
U lidí kniha vychází z odpovědnosti s možností odvolání a z ochrany toho, kdo chybu přizná.

## Pojem v jeho vlastním oboru

V technických systémech je odstupňovaná a předvídatelná reakce na porušení výhodou: každý ví, co se stane,
reakce nezávisí na náladě posuzovatele a celý proces lze zpětně přezkoumat. Porušení standardu u kódu
nemá oběť ani pachatele v morálním smyslu; je to stav, který je třeba opravit. Proto může být protokol
přísný bez rizika, že někomu ublíží – „restart“ artefaktu znamená jen to, že se změna vrátí a provede
znovu.

Pozoruhodné je, že i softwarové inženýrství rozlišuje mezi přísností vůči artefaktům a vztahem k lidem.
Praxe provozu velkých služeb, jak ji popsali Beyer a kolegové (2016), spojuje nekompromisní automatické
kontroly s takzvanými *postmortem bez obviňování*: po incidentu se podrobně rozebere, co se stalo a proč,
ale cílem není najít viníka, nýbrž změnit systém tak, aby se chyba neopakovala. Autoři zdůrazňují, že
kultura obviňování vede k tomu, že lidé incidenty skrývají. Přísnost protokolu porušení se tedy i v jeho
vlastním oboru týká kódu a postupů, nikoli toho, jak se zachází s lidmi, kteří chybu udělali nebo ohlásili.

## Analogie, kterou kniha činí – a proč je výstražná

Bezpečnostní věda o lidských organizacích dospěla k opačnému závěru, než by naznačovala technická
přísnost. Reason (1997) ukázal, že většina závažných nehod nemá původ v jednotlivé lidské chybě, ale
v latentních podmínkách systému, a že organizace, která trestá jednotlivce, přichází o informace, jež
by jí umožnily podmínky změnit. Dekker (2007) na to navázal pojmem *spravedlivé kultury*: rozlišovat
mezi lidskou chybou, rizikovým jednáním a bezohledností, reagovat na ně odlišně a chránit toho, kdo
chybu ohlásí. Edmondsonová (1999) doložila, že týmy s vysokým psychologickým bezpečím chyby častěji
hlásí – a proto se z nich více učí.

V manipulativních skupinách se odstupňované tresty stávají nástrojem kontroly chování. Lifton (1961)
popsal „kult zpovědi“, v němž veřejné přiznání selhání neslouží nápravě, ale podřízení. Model kontroly
chování, informací, myšlení a emocí, který kniha rozebírá v [Bridge: BITE model](@/kompendium/glossary-bridges/bridge-bite-model.md),
řadí mezi znaky kontroly chování systém odměn a trestů, který je pro člena nepředvídatelný a o němž
rozhoduje jen vedení. „Restart od nuly“ – ztráta postavení, vztahů nebo „pokroku“ po jediném prohřešku –
je u lidí zásahem do identity, ne opravou chyby. Braithwaite (1989) rozlišil *reintegrační* zahanbení,
které odsuzuje čin a vrací člověka do společenství, od *stigmatizujícího*, které odsuzuje člověka a
vylučuje ho; manipulativní prostředí používají druhé.

## Kde se pojem v knize vyskytuje

Platformní souvislosti vysvětluje kapitola [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md)
a sesterský [Bridge: Doktrína NM/ND](@/kompendium/glossary-bridges/bridge-nm-nd.md). Lidskou stranu –
zneužití trestů a disciplinárních řízení – rozebírají oddíl [Organizační obrana](@/kompendium/organizational-defense/_index.md),
kapitola [Pracovní prevence EA](@/kompendium/prevention-resilience/5-workplace-prevention-EA.md) a kazuistiky
[Medical residency](@/kompendium/case-studies/41-medical-residency.md) a
[BigLaw totalizace](@/kompendium/case-studies/40-law-firm-totalizace.md). Profesní odpovědnost v řízení
popisuje [Profesionální pochybení](@/kompendium/forensic-legal/19-professional-misconduct-EA.md).

## Od pojmu k praxi

### Rozpoznání

Varovným znakem v lidské skupině je disciplinární systém, v němž tresty rostou rychleji než závažnost
prohřešků, kritéria nejsou předem známa, rozhoduje jediná autorita bez možnosti odvolání a přiznání chyby
vede k horšímu zacházení než její zatajení. Dalším znakem je veřejnost trestu – ponížení před ostatními –
a to, že trest se týká osoby („jsi nespolehlivý“), ne činu („tento úkol nebyl splněn“).

### Odlišení

Odpovědnost a důsledky samy manipulací nejsou. Profesní komory, zaměstnavatelé i soudy musejí na
porušení pravidel reagovat a odstupňovaná reakce je spravedlivější než libovůle. Rozdíl je v procesních
zárukách: předem známá pravidla, přiměřenost, právo vyjádřit se, nezávislý přezkum a odvolání. Disciplinární
řízení s těmito zárukami je ochranou; bez nich se stává nástrojem moci.

### Obrana

Pro instituce je obranou navrhnout reakci na chyby podle zásad spravedlivé kultury: oddělit hlášení chyb
od trestů, chránit oznamovatele a zkoumat systémové příčiny dřív, než se hledá viník. Kniha k tomu
odkazuje na [EA-4.2.5 Ochrana oznamovatelů](@/kompendium/techniques/ea-4-2-5-whistleblower-protection.md)
a na [Hlášení incidentů](@/kompendium/forensic-legal/39-incident-reporting.md). Pro jednotlivce je
obranou znát svá práva v disciplinárním řízení a mít oporu mimo instituci.

### Zotavení a rámec pro profesionály

Lidé, kteří prošli prostředím s nepředvídatelnými a ponižujícími tresty, často reagují na drobné chyby
nepřiměřeným studem a strachem. Terapie pracuje s oddělením činu od osoby a s obnovou zkušenosti, že
chybu lze přiznat bez ztráty hodnoty; viz [Odolnost vůči studu](@/kompendium/self-defense-guides/18-shame-resilience.md)
a [Sebesoucit](@/kompendium/self-defense-guides/16-self-compassion.md).

## Časté omyly

Prvním omylem je přenášet do lidských organizací technický protokol jako vzor „spravedlnosti“; to, co
je u kódu předvídatelností, je u lidí často bezohledností vůči kontextu. Druhým omylem je opačný extrém –
odmítnout jakékoli důsledky; spravedlivá kultura neznamená beztrestnost, ale přiměřenost a rozlišování.
Třetím omylem je myslet si, že tvrdé tresty zvyšují bezpečnost; výzkum ukazuje, že vedou k zatajování
chyb.

## Příklad (anonymizovaný kompozit)

V nemocnici se po chybě v podání léku zavede pravidlo, že každá chyba se trestá snížením odměn. Počet
hlášených chyb klesne na nulu, ale počet zjištěných pochybení při kontrolách vzroste. Nová hlavní sestra
pravidlo změní: hlášení chyby je chráněno, každé hlášení se rozebere bez hledání viníka a tresty se
vyhrazují pro vědomé porušení postupů. Během roku se počet hlášení zvýší a závažných událostí ubude,
protože se odhalí a opraví systémové příčiny, například zaměnitelné balení léků.

## Meze a otevřené otázky

Hranice mezi lidskou chybou, rizikovým jednáním a bezohledností není vždy zřejmá a o tom, kdo ji určuje,
se v organizacích vedou spory. Otevřenou otázkou je, jak sladit potřebu odpovědnosti vůči obětem chyb
s potřebou bezpečného hlášení, a jak zabránit tomu, aby se z disciplinárních řízení staly nástroje
odvety proti nepohodlným. Kniha tuto otázku neuzavírá, ale trvá na procesních zárukách jako na minimu.

## Literatura

- Beyer, B., Jones, C., Petoff, J., & Murphy, N. R. (Eds.). (2016). *Site Reliability Engineering: How Google Runs Production Systems*. O'Reilly Media.
- Braithwaite, J. (1989). *Crime, Shame and Reintegration*. Cambridge University Press.
- Dekker, S. (2007). *Just Culture: Balancing Safety and Accountability*. Ashgate.
- Edmondson, A. (1999). Psychological safety and learning behavior in work teams. *Administrative Science Quarterly*, 44(2), 350–383.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism*. W. W. Norton.
- Reason, J. (1997). *Managing the Risks of Organizational Accidents*. Ashgate.

## Související

**Glosář**

- [Violation Protocol](@/glossary/violation-protocol.md) – heslo, které tento most propojuje s knihou.
- [Doktrína NM/ND](@/glossary/nm-nd.md) – doktrína, jejíž porušení protokol řeší.
- [Zero Warning Policy](@/glossary/zero-warning-policy.md) – zachycení porušení.

**Kniha**

- [Organizační obrana](@/kompendium/organizational-defense/_index.md) – instituce a jejich reakce na chyby.
- [EA-4.2.5 Ochrana oznamovatelů](@/kompendium/techniques/ea-4-2-5-whistleblower-protection.md) – ochrana toho, kdo chybu ohlásí.
- [Medical residency](@/kompendium/case-studies/41-medical-residency.md) – disciplinární tlak ve vzdělávání.
- [Odolnost vůči studu](@/kompendium/self-defense-guides/18-shame-resilience.md) – zotavení po ponižujících trestech.

**Sesterské mosty**

- [Bridge: Doktrína NM/ND](@/kompendium/glossary-bridges/bridge-nm-nd.md) – technická disciplína a její meze u lidí.
- [Bridge: BITE model](@/kompendium/glossary-bridges/bridge-bite-model.md) – kontrola chování v lidských skupinách.
- [Bridge: Zero warning policy](@/kompendium/glossary-bridges/bridge-zero-warning-policy.md) – hladina šumu v pravidlech.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Violation protocol (protokol porušení)](@/glossary/violation-protocol.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
