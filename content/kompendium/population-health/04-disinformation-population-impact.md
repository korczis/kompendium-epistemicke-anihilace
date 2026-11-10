+++
title = "Populační dopad dezinformací"
description = "Jak měřit dopad dezinformačních kampaní na populační kognici, důvěru a zdravotní chování – od expozice přes přesvědčení k jednání – a kde tato měření selhávají."
weight = 40

[taxonomies]
tags = ["kompendium", "population-health", "epidemiology"]
categories = ["academic", "public-health"]

[extra]
related_terms = ["02-cohort-studies-EA", "03-incidence-cult-exposure", "05-academic-EA-prevalence", "06-corporate-EA-prevalence"]
toc = true
+++

# Populační dopad dezinformací

> Dezinformace je epistemický útok vedený na populaci, ne na jednotlivce. Její dopad nelze
> číst z počtu zobrazení; je třeba sledovat řetězec expozice → přesvědčení → jednání → škoda
> a u každého článku přiznat, jak málo o něm víme.

## Vymezení

Claire Wardleová a Hossein Derakhshan (2017) ve zprávě pro Radu Evropy rozlišují
**misinformaci** (nepravdivý obsah šířený bez úmyslu škodit), **dezinformaci** (nepravdivý obsah
šířený úmyslně) a **malinformaci** (pravdivý obsah použitý ke škodě); podrobněji viz
[Wardle: typologie dezinformací](@/kompendium/07-teoreticke-reflexe/wardle-disinformation-typology.md).
Pro zdravotní krize zavedl souběžný pojem **infodemie** – nadbytek informací včetně nepravdivých –
Zarocostas (2020) a od něj se odvíjí „infodemický management“ jako součást reakce na epidemie.

V jazyce kompendia jde o expozici celé populace technikám, jako je
[algoritmická amplifikace](@/kompendium/techniques/ea-9-3-1-algorithmic-amplification.md),
[koordinované neautentické chování](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md),
[kolaps kontextu](@/kompendium/techniques/ea-2-3-2-context-collapse.md) nebo
[firehose of falsehood](@/glossary/firehose-of-falsehood.md), jejíž mechanismus popsali Paul
a Matthews (2016). Cílem nemusí být přesvědčit o konkrétní lži; často jde, jak upozorňují
Benkler, Faris a Roberts (2018), o vyčerpání, nedůvěru ke všem zdrojům a rezignaci na poznání –
tedy o populační obdobu [epistemické anihilace](@/glossary/epistemicka-anihilace.md).

## Řetězec dopadu

| Článek | Otázka | Typické měření | Hlavní problém |
|---|---|---|---|
| Expozice | Kdo obsah viděl? | data platforem, panely s měřením prohlížení | přístup k datům, rozdíl mezi zobrazením a pozorností |
| Přijetí | Kdo mu uvěřil? | šetření, experimenty | expresivní odpovídání (lidé „hlásí tým“, ne přesvědčení) |
| Jednání | Kdo podle něj jednal? | zdravotní registry, volební a spotřební data | mnoho jiných příčin téhož jednání |
| Škoda | Co se stalo populaci? | nemocnost, násilí, ztráta důvěry | dlouhé zpoždění, difuzní a kumulativní účinky |

Každý přechod v tomto řetězci je pravděpodobnostní a podmíněný, jak zdůrazňují Pennycook a Rand
(2021): vysoká expozice s nízkým přijetím je běžná, zatímco nízká expozice v malé, silně
propojené skupině může vést k vážnému jednání. Průměr za populaci proto o žádném z článků
nevypovídá sám o sobě.

## Co víme a s jakou jistotou

O **šíření** víme z analýzy Vosoughiho, Roye a Arala (*Science*, 2018), že se nepravdivé zprávy
na Twitteru šířily dál a rychleji než pravdivé a že hnací silou byli spíš lidé než boti.
O **koncentraci expozice** svědčí studie z období amerických voleb 2016 (Grinberg a kol.,
*Science*, 2019 a souběžně Guess, Nagler a Tucker, 2019), podle nichž byla expozice zdrojům
nepravdivých zpráv silně soustředěna u malé části uživatelů; průměr za populaci proto skrývá
ohniska. O **přetrvávajícím vlivu** informace víme od Lewandowského a kol. (2012), že oprava
nepravdivého tvrzení jeho účinek obvykle zcela neodstraní.

Složitější je to u **zdravotního chování**. Historie podle Oreskese a Conwaye (2010) ukazuje, že
dlouhodobé kampaně pochybností měly reálné zdravotní důsledky – viz
[tabákový průmysl](@/kompendium/historical-cases/25-tobacco-doubt.md) a
[aféra vakcíny–autismus](@/kompendium/historical-cases/39-vaccine-autism.md). Velikost účinku
jednotlivé kampaně je však obtížně oddělitelná od ostatních příčin, a jak varují Allcott
a Gentzkow (2017), přisuzovat konkrétní zdravotní či volební výsledek jediné kampani znamená
překračovat to, co data unesou. Spolehlivá populační čísla o velikosti dopadu proto nejsou
k dispozici a tato stránka je záměrně neuvádí.

## Rizikové a protektivní faktory

Na úrovni jednotlivce zvyšuje zranitelnost nízká důvěra v instituce, zkušenost s jejich
selháním, [sociální izolace](@/glossary/socialni-izolace.md) a silná skupinová identita spojená s tématem; Pennycook a Rand (2021)
k nim přidávají sklon neověřovat a přijímat obsah intuitivně, zesílený informačním přetížením
([EA-1.1.2](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md)). Na úrovni prostředí
působí rizikově [epistemické bubliny](@/glossary/epistemic-bubble.md), monokultura zdrojů
([detekční signatura](@/kompendium/detection-signatures/17-network-source-monoculture.md)),
oslabená lokální žurnalistika a krize, v nichž je nejistota vysoká a oficiální informace pomalé –
podmínky, které Benkler, Faris a Roberts (2018) označují za živnou půdu propagandy.

Protektivně naopak působí důvěryhodné místní zdroje (praktický lékař, učitel, obecní úřad),
[mediální gramotnost](@/kompendium/prevention-resilience/6-media-literacy-prevention.md), návyk
ověřovat napříč zdroji
([rutina cross-source](@/kompendium/self-defense-guides/36-cross-source-routine.md))
a transparentní komunikace institucí včetně přiznání nejistoty. Wardleová a Derakhshan (2017)
zdůrazňují, že právě odolné informační prostředí – nejen odolný jednotlivec – rozhoduje o dopadu.

## Metodologická úskalí

Prvním úskalím je **přístup k datům**: bez dat platforem se expozice odhaduje ze sebehodnocení,
které je podle Guesse, Naglera a Tuckera (2019) nespolehlivé. Nařízení EU o digitálních službách
(DSA) zavádí mechanismus přístupu prověřených výzkumníků k datům velmi velkých platforem; viz
[EU politika](@/kompendium/population-health/23-EU-policy-EA.md). Druhým je **kauzalita**: lidé si
vybírají obsah, který odpovídá jejich postojům, takže korelace mezi konzumací a přesvědčením je
z velké části selekce, na niž upozorňují Allcott a Gentzkow (2017); pomáhají přirozené experimenty
a [kauzální inference](@/kompendium/research-methodology/causal-inference-EA.md).

Třetím úskalím je **měření přesvědčení**: souhlas s tvrzením v dotazníku může podle Pennycooka
a Randa (2021) znamenat skutečné přesvědčení, vtip, provokaci i loajalitu ke skupině. Čtvrtým je
**politická citlivost** – kdo rozhoduje, co je dezinformace? Benkler, Faris a Roberts (2018)
ukazují, že bez transparentních kritérií se měření stává nástrojem sporu
([politická instrumentalizace](@/kompendium/critical-perspectives/6-political-instrumentalization.md)).

## Důsledky pro prevenci a zdravotní systém

Primární prevence stojí na tom, co Lewandowsky a kol. (2012) nazývají inokulací: na
[prebunkingu a mediální gramotnosti](@/kompendium/population-health/15-media-literacy-program.md)
a na vzdělávání ([školní kurikulum](@/kompendium/population-health/13-school-curriculum-EA.md)).
Sekundární prevence znamená monitoring nových narativů ve zdravotní komunikaci a rychlou,
srozumitelnou reakci důvěryhodných mluvčích, kterou Zarocostas (2020) klade do jádra
infodemického managementu. Strukturální opatření míří na infrastrukturu – požadavky na platformy
a transparentnost doporučovacích systémů
([regulace platforem](@/kompendium/population-health/25-platform-regulation-EA.md)) –, jak navrhují
Benkler, Faris a Roberts (2018). V klinické rovině se lékaři a psychologové setkávají s pacienty,
jejichž rozhodnutí o léčbě ovlivnila dezinformace; podle Lewandowského a kol. (2012) potřebují
komunikační postupy, které nezahanbují a nestaví pacienta do obrany.

## Modelová situace

Během sezónní epidemie zaznamená krajská hygienická stanice nárůst odmítání očkování v několika
obcích. Analýza ukáže, že místní diskusní skupina sdílí sérii videí s vytrženými výroky lékařů.
Úřad nereaguje plošnou kampaní, která by narativ zesílila v celém kraji – riziko zesílení přes
opravu dokládají Lewandowsky a kol. (2012) –, ale spolupracuje s místními praktickými lékaři,
kteří s pacienty mluví osobně, zveřejní srozumitelné odpovědi na konkrétní obavy a sleduje, zda
se odmítání v obcích mění.

## Kontrolní otázky pro praxi

V duchu řetězce, jejž rozpracovali Wardleová a Derakhshan (2017), se u každého tvrzení o dopadu
dezinformace ptáme: Na kterém článku (expozice, přijetí, jednání, škoda) je tvrzení založeno? Je
expozice rovnoměrná, nebo soustředěná v malých skupinách? Odlišuje měření skutečné přesvědčení od
expresivního odpovídání? Jsou kritéria „dezinformace“ transparentní a použitelná na všechny
strany sporu? A nezesílí reakce instituce narativ víc než narativ sám?

## Limitace a otevřené otázky

Nejvážnější a zároveň nejhůře měřitelný je kumulativní účinek dlouhodobé expozice – eroze důvěry
„ve všechno“ –, který Benkler, Faris a Roberts (2018) popisují jako cíl mnoha kampaní. Generativní
AI navíc mění cenu tvorby obsahu ([syntetický text](@/kompendium/techniques/ea-9-2-3-synthetic-text-narrative.md),
[deepfake](@/glossary/deepfake.md)), takže dosavadní data o šíření (Vosoughi, Roy a Aral 2018)
nemusí dál platit. Pennycook a Rand (2021) zároveň varují, že i přehánění dopadu dezinformací je
riziko: podkopává důvěru v informační prostředí obecně a může sloužit jako záminka k omezení
svobody projevu.

## Literatura

- Allcott, H.; Gentzkow, M. „Social Media and Fake News in the 2016 Election.“ *Journal of Economic Perspectives*, 2017.
- Benkler, Y.; Faris, R.; Roberts, H. *Network Propaganda.* Oxford University Press, 2018.
- Grinberg, N. a kol. „Fake News on Twitter During the 2016 U.S. Presidential Election.“ *Science*, 2019.
- Guess, A.; Nagler, J.; Tucker, J. „Less Than You Think: Prevalence and Predictors of Fake News Dissemination on Facebook.“ *Science Advances*, 2019.
- Lewandowsky, S. a kol. „Misinformation and Its Correction.“ *Psychological Science in the Public Interest*, 2012.
- Oreskes, N.; Conway, E. M. *Merchants of Doubt.* Bloomsbury Press, 2010.
- Paul, C.; Matthews, M. *The Russian „Firehose of Falsehood“ Propaganda Model.* RAND Corporation, 2016.
- Pennycook, G.; Rand, D. G. „The Psychology of Fake News.“ *Trends in Cognitive Sciences*, 2021.
- Vosoughi, S.; Roy, D.; Aral, S. „The Spread of True and False News Online.“ *Science*, 2018.
- Wardle, C.; Derakhshan, H. *Information Disorder: Toward an Interdisciplinary Framework.* Council of Europe, 2017.
- Zarocostas, J. „How to Fight an Infodemic.“ *The Lancet*, 2020.

## Související

**Sesterské stránky**

- [Prevalence online radikalizace](@/kompendium/population-health/08-online-radicalization-prevalence.md) – kdy dezinformace vede k násilí.
- [Programy mediální gramotnosti](@/kompendium/population-health/15-media-literacy-program.md) – co lze dělat na straně publika.
- [Regulace platforem](@/kompendium/population-health/25-platform-regulation-EA.md) – co lze dělat na straně infrastruktury.

**Techniky a detekce**

- [Engagement optimization](@/kompendium/techniques/ea-9-3-2-engagement-optimization-EA.md) – proč feedy odměňují pobuřující obsah.
- [Bot coordination](@/kompendium/detection-signatures/20-network-bot-coordination.md) – rozpoznání koordinovaných kampaní.

**Teorie a historie**

- [Herman & Chomsky: propagandistický model](@/kompendium/07-teoreticke-reflexe/herman-chomsky-propaganda-model.md) – strukturální pohled na média.
- [Internet Research Agency](@/kompendium/historical-cases/22-russian-ira.md) – doložený případ státní kampaně.

**Obrana**

- [Informační dieta](@/kompendium/self-defense-guides/33-information-diet.md) – individuální ochrana.
- [Kvalita veřejného diskurzu](@/kompendium/prevention-resilience/10-public-discourse-quality.md) – společenská rovina.
