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

Claire Wardleová a Hossein Derakhshan (*Information Disorder*, Rada Evropy, 2017) rozlišují
**misinformaci** (nepravdivý obsah šířený bez úmyslu škodit), **dezinformaci** (nepravdivý
obsah šířený úmyslně) a **malinformaci** (pravdivý obsah použitý ke škodě); podrobněji viz
[Wardle: typologie dezinformací](@/kompendium/07-teoreticke-reflexe/wardle-disinformation-typology.md).
Světová zdravotnická organizace od roku 2020 používá pojem **infodemie** pro nadbytek
informací, včetně nepravdivých, během zdravotní krize, a rozvíjí „infodemický management“ jako
součást reakce na epidemie.

V jazyce kompendia jde o expozici celé populace technikám jako
[algoritmická amplifikace](@/kompendium/techniques/ea-9-3-1-algorithmic-amplification.md),
[koordinované neautentické chování](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md),
[kolaps kontextu](@/kompendium/techniques/ea-2-3-2-context-collapse.md) nebo
[firehose of falsehood](@/glossary/firehose-of-falsehood.md). Cílem nemusí být přesvědčit
o konkrétní lži; často jde o vyčerpání, nedůvěru ke všem zdrojům a rezignaci na poznání –
tedy o populační obdobu [epistemické anihilace](@/glossary/epistemicka-anihilace.md).

## Řetězec dopadu

| Článek | Otázka | Typické měření | Hlavní problém |
|---|---|---|---|
| Expozice | Kdo obsah viděl? | data platforem, panely s měřením prohlížení | přístup k datům, rozdíl mezi zobrazením a pozorností |
| Přijetí | Kdo mu uvěřil? | šetření, experimenty | expresivní odpovídání (lidé „hlásí tým“, ne přesvědčení) |
| Jednání | Kdo podle něj jednal? | zdravotní registry, volební a spotřební data | mnoho jiných příčin téhož jednání |
| Škoda | Co se stalo populaci? | nemocnost, násilí, ztráta důvěry | dlouhé zpoždění, difuzní a kumulativní účinky |

Každý přechod je pravděpodobnostní a podmíněný. Vysoká expozice s nízkým přijetím je běžná;
nízká expozice v malé, silně propojené skupině může vést k vážnému jednání.

## Co víme a s jakou jistotou

- **Šíření**: analýza Vosoughiho, Roye a Arala (*Science*, 2018) ukázala, že nepravdivé zprávy
  se na Twitteru šířily dál a rychleji než pravdivé, a hnací silou byli spíš lidé než boti.
- **Koncentrace expozice**: studie z období amerických voleb 2016 (např. Grinberg a kol.,
  *Science*, 2019) naznačily, že expozice zdrojům nepravdivých zpráv byla silně soustředěna
  u malé části uživatelů. Průměr za populaci proto skrývá ohniska.
- **Přetrvávající vliv**: oprava nepravdivé informace její vliv obvykle zcela neodstraní
  (Lewandowsky a kol., *Psychological Science in the Public Interest*, 2012).
- **Zdravotní chování**: historie ukazuje, že dlouhodobé kampaně pochybností měly reálné
  zdravotní důsledky – viz [tabákový průmysl](@/kompendium/historical-cases/25-tobacco-doubt.md)
  a [aféra vakcíny–autismus](@/kompendium/historical-cases/39-vaccine-autism.md). Velikost
  účinku jednotlivé kampaně je však obtížně oddělitelná od ostatních příčin.

## Rizikové a protektivní faktory

**Na úrovni jednotlivce:** nízká důvěra v instituce, zkušenost s jejich selháním, sociální
izolace, silná skupinová identita spojená s tématem, informační přetížení
([EA-1.1.2](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md)).

**Na úrovni prostředí:** [epistemické bubliny](@/glossary/epistemic-bubble.md), monokultura
zdrojů ([detekční signatura](@/kompendium/detection-signatures/17-network-source-monoculture.md)),
oslabená lokální žurnalistika, krize, v nichž je nejistota vysoká a oficiální informace
pomalé.

**Protektivní:** důvěryhodné místní zdroje (praktický lékař, učitel, obecní úřad),
[mediální gramotnost](@/kompendium/prevention-resilience/6-media-literacy-prevention.md),
návyk ověřovat napříč zdroji
([rutina cross-source](@/kompendium/self-defense-guides/36-cross-source-routine.md)),
transparentní komunikace institucí včetně přiznání nejistoty.

## Metodologická úskalí

- **Přístup k datům.** Bez dat platforem se expozice odhaduje ze sebehodnocení, které je
  nespolehlivé. Nařízení EU o digitálních službách (DSA) zavádí mechanismus přístupu
  prověřených výzkumníků k datům velmi velkých platforem; viz
  [EU politika](@/kompendium/population-health/23-EU-policy-EA.md).
- **Kauzalita.** Lidé si vybírají obsah, který odpovídá jejich postojům. Korelace mezi
  konzumací a přesvědčením je z velké části selekce. Pomáhají přirozené experimenty
  a [kauzální inference](@/kompendium/research-methodology/causal-inference-EA.md).
- **Měření přesvědčení.** Souhlas s tvrzením v dotazníku může znamenat skutečné přesvědčení,
  vtip, provokaci i loajalitu.
- **Politická citlivost.** Kdo rozhoduje, co je dezinformace? Bez transparentních kritérií
  se měření stává nástrojem sporu
  ([politická instrumentalizace](@/kompendium/critical-perspectives/6-political-instrumentalization.md)).

## Důsledky pro prevenci a zdravotní systém

- **Primární prevence**: [prebunking a inokulace](@/kompendium/population-health/15-media-literacy-program.md),
  vzdělávání ([školní kurikulum](@/kompendium/population-health/13-school-curriculum-EA.md)).
- **Sekundární prevence**: monitoring nových narativů ve zdravotní komunikaci a rychlá,
  srozumitelná reakce důvěryhodných mluvčích.
- **Strukturální opatření**: požadavky na platformy, transparentnost doporučovacích systémů
  ([regulace platforem](@/kompendium/population-health/25-platform-regulation-EA.md)).
- **Klinická rovina**: lékaři a psychologové se setkávají s pacienty, jejichž rozhodnutí
  o léčbě ovlivnila dezinformace; potřebují komunikační postupy, které nezahanbují a nestaví
  pacienta do obrany.

## Modelová situace

Během sezónní epidemie zaznamená krajská hygienická stanice nárůst odmítání očkování
v několika obcích. Analýza ukáže, že místní diskusní skupina sdílí sérii videí s vytrženými
výroky lékařů. Úřad nereaguje plošnou kampaní, která by narativ zesílila v celém kraji;
spolupracuje s místními praktickými lékaři, kteří s pacienty mluví osobně, zveřejní
srozumitelné odpovědi na konkrétní obavy a sleduje, zda se odmítání v obcích mění.

## Kontrolní otázky pro praxi

- Na kterém článku řetězce (expozice, přijetí, jednání, škoda) je tvrzení o dopadu založeno?
- Je expozice rovnoměrná, nebo soustředěná v malých skupinách?
- Odlišuje měření skutečné přesvědčení od expresivního odpovídání?
- Jsou kritéria „dezinformace“ transparentní a použitelná na všechny strany sporu?
- Nezesílí reakce instituce narativ víc než narativ sám?

## Limitace a otevřené otázky

- Kumulativní účinek dlouhodobé expozice – eroze důvěry „ve všechno“ – je nejvážnější
  a nejhůře měřitelný.
- Generativní AI mění cenu tvorby obsahu
  ([syntetický text](@/kompendium/techniques/ea-9-2-3-synthetic-text-narrative.md),
  [deepfake](@/glossary/deepfake.md)); dosavadní data o šíření nemusí platit.
- Přehánění dopadu dezinformací je samo rizikem: podkopává důvěru v informační prostředí
  obecně a může sloužit jako záminka k omezení svobody projevu.

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
