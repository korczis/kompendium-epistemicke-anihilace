---
schema: adr/v1
id: adr-0013
kind: adr
title: "Kniha nejmenuje léky ani lékové skupiny"
status: accepted
date: 2026-11-12
tags:
  - content
  - safety
  - clinical
provenance:
  origin: authored
---

# 13. Kniha nejmenuje léky ani lékové skupiny

## Context

Kniha už odstranila všechny dávky léků (brána `drug-dose`). Vlákno obsahu 2e změřilo, že na 45
stránkách technik zůstala jmenovaná léková skupina „atypická antipsychotika“, podaná jako
„předchozí farmakologická stabilizace“ před expozicí, a že některé stránky jmenují terapeutické
protokoly jako kroky (TF-CBT, DBT). Brána `drug-dose` je nevidí, protože neobsahují dávku.

## Decision

Otázka vlastníkovi (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-12), doslovně:

> „45 technique pages name a medication class ("atypická antipsychotika", given as prior
> pharmacological stabilisation before exposure), and some pages name therapy protocols as steps
> (TF-CBT, DBT). The book already removed all drug doses. Should the book name medication classes
> at all?“

Možnosti: „Never name medication (Recommended)“ – „Remove every drug class and medication
instruction; the book says medication belongs to the treating physician and names nothing. A check
refuses drug classes on any page.“; „Name only with a real source“; „Leave as is“. Odpověď
vlastníka doslovně: **„Never name medication (Recommended)“**.

Kniha tedy nejmenuje žádný lék ani lékovou skupinu a nedává žádný pokyn k medikaci. Kde se o ní
mluví, řekne, že medikace patří ošetřujícímu lékaři, a nic nejmenuje.

## Consequences

- Vlákno obsahu odstraní jmenované lékové skupiny a medikační pokyny ze 45 stránek spolu se
  sekcemi `Intervenční variace`.
- Vlákno bran přidá požadavek, který na každé stránce odmítne jmenovanou lékovou skupinu nebo
  lék (nikdy do baseline, strop podle změření, po řezu 0).
- Jmenované terapeutické protokoly a nástroje jako kroky techniky (TF-CBT, DBT, MoCA …) jsou
  samostatná otázka; toto rozhodnutí se jich netýká.

## Doplněk 1 (2026-11-12): stránka o akutní farmakoterapii

Vlákno obsahu změřilo: jmenovaná skupina „atypická antipsychotika“ stojí na 27 stránkách (všechny
ve vlně výčtu autorit, odstraní se tam), pokyn k farmakologické stabilizaci bez jmenované skupiny
na 28 (25 ve vlně, 3 mimo ni: `02-uvod/definice.md`, `quick-reference/qr-ea-5-2-30.md`,
`emergency-protocols/18-emergency-pharmacotherapy.md`). Poslední je stránka o 2355 slovech, jejímž
celým předmětem je akutní farmakoterapie; jmenuje skupiny léků obecně a mluví o dávkování.

Integrace nejdřív navrhla stránku jako samostatný protokol zrušit a její poctivý zbytek přesunout
do krizové stránky s přesměrováním. Vlákno obsahu se na to vlastníka zeptalo a **vlastník otázku
odmítl**; existence celé stránky je jiný akt než odstranění slova (vlastník to tak rozlišil už u
aiad-integration a u filozofie). Stránka proto **zůstává beze změny, dokud vlastník nerozhodne**.
Ostatní z ADR 0013 provádí vlna 1 vlákna obsahu: po ní na žádné jiné stránce se nejmenuje lék, léková skupina ani
pokyn k medikaci; „atypická antipsychotika“ i „farmakologická stabilizace“ vrací nula stránek
(vlákno obsahu, 52 stránek sjednocených na „předchozí psychiatrickou stabilizaci“).

## Doplněk 2 (2026-11-13): lék jako doložený předmět historického případu

Po sloučení dávky C měřila brána `drug-name` 31 stránek. Devět z nich jsou historické případy,
v nichž je lék doloženým předmětem události, nikoli radou k medikaci: případ `40-fda-opioid`
(Purdue Pharma a opioidová krize, 14 zmínek), sedm stránek, které na něj odkazují popiskem
„FDA a opioidy“, a Jonestown („nápoj s kyanidem a sedativy“). Integrace se zeptala vlastníka.

Otázka vlastníkovi (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-13), doslovně:

> „ADR 0013 ("Never name medication") is being applied to the last 31 pages that name a drug
> class. 9 of them are historical-case pages where a drug is the documented subject of the event:
> the case "FDA, Purdue Pharma a opioidová krize" (40-fda-opioid, 14 mentions), 7 pages linking
> to it with the label "FDA a opioidy", and Jonestown's "nápoj s kyanidem a sedativy". Should those
> historical cases keep naming the drug?“

Možnosti: „Keep in history (Recommended)“ – „A drug named as the documented subject of a
historical or regulatory case (the opioid crisis, Jonestown) stays; it is history, not medication
advice. The gate exempts content/kompendium/historical-cases/ and links to those pages; every other
page still names nothing.“; „Remove everywhere“ – „Apply ADR 0013 literally: rewrite 40-fda-opioid
and the 8 others without naming any drug (e.g. "případ Purdue Pharma a epidemie závislosti na lécích
proti bolesti"). No exemption in the gate.“ Odpověď vlastníka doslovně: **„Keep in history
(Recommended)“**.

Důsledky:

- Brána `drug-name` vynechá stránky pod `content/kompendium/historical-cases/` a popisek odkazu na
  ně; lék jmenovaný mimo takový odkaz na téže stránce odmítne dál (případ 32 to dokládá).
- „Endogenní opioidy“ jsou chemie těla, ne medikace; brána je nepočítá. Přídavné jméno
  „antidepresivní hodnota“ aktivity na `recovery-protocols/lifeworld.md` přepsáno obecně.
- Zbylo 14 stránek: `18-emergency-pharmacotherapy` (drží vlastník, doplněk 1), čtyři citované
  stránky rozpoznání akutního stavu a devět stránek, kde skupina stojí v diferenciální diagnostice
  nebo v popisu škody. Tu hranici řeší doplněk 3.

## Doplněk 3 (2026-11-14): skupina jmenovaná k rozpoznání, ne k nabídce

Otázka vlastníkovi (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-14), doslovně:

> „13 pages still name a drug class but don't offer medication: 4 cited emergency pages use the
> class so a reader can recognise a crisis and call 155 (36-medication-emergency: lithium
> intoxication, Baird-Gunning 2017; 26-substance-EA: sedative withdrawal, naloxone, WHO 2014;
> 35-treatment-noncompliance: dangers of abrupt stopping, Davies & Read 2019; 6-panic-attack-EA:
> NICE 2011 advising AGAINST benzodiazepines), and 9 pages list a class among medical causes to
> rule out first or in a harm description ("nadužívání alkoholu a stimulancií"). Does ADR 0013
> cover these?“

Možnosti: „Keep recognition (Recommended)“ – „A class named so a reader can recognise an
emergency, a cause to rule out or a harm stays, when the sentence recognises rather than offers.
The gate exempts these 13 by a named list in ADR 0013; offering, planning or requiring medication
stays refused everywhere.“; „Remove these too“ – „Rewrite all 13 generically (e.g. "intoxikace
předepsaným lékem", "náhlé vysazení léků"), dropping class names even where a cited source is
about that class. drug-name then reaches 0 apart from page 18.“; „Emergency only“ – „Keep the 4
cited emergency pages; rewrite the 9 differential/harm pages generically.“ Odpověď vlastníka
doslovně: **„Keep recognition (Recommended)“**.

Důsledky:

- Pojmenovaný seznam je `data/drug-recognition.toml`: každá stránka s druhem (`emergency`,
  `differential`, `harm`) a důvodem. Brána `drug-name` stránku ze seznamu propustí, dokud lék
  jmenuje; jakmile nejmenuje žádný, je záznam zastaralý a brána ho odmítne. Záznam bez důvodu
  nebo s neexistující stránkou je chyba. Případ 32 to dokládá.
- Seznam má 12 stránek, ne 13: `02-uvod/definice.md` rozlišovala psychotickou dezintegraci
  „responzivitou na antipsychotika“, tedy znakem, který čtenář použije jen tak, že lék podá. To
  je nabídka, ne rozpoznání; věta je přepsána („rozlišení patří psychiatrickému vyšetření“).
- Strop `drug-name` je 1: zbývá jen `18-emergency-pharmacotherapy`, kterou drží vlastník.
- Nabízet, plánovat nebo vyžadovat medikaci zůstává odmítnuto na každé stránce.
