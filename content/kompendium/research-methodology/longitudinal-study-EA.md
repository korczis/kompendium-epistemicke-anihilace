+++
title = "Longitudinální studie epistemické manipulace a zotavení"
description = "Opakované měření týchž lidí v čase: jak sledovat průběh epistemické manipulace a zotavení, zacházet s úbytkem účastníků a modelovat trajektorie."
weight = 11

[taxonomies]
tags = ["kompendium", "research-methodology", "quantitative"]
categories = ["academic", "methodology", "research"]

[extra]
related_terms = ["time-series-EA", "survey-design-EA", "causal-inference-EA", "vulnerable-population-research"]
parent = "kompendium-research-methodology"
toc = true
+++

[Epistemická anihilace](@/glossary/epistemicka-anihilace.md) je podle definice knihy proces:
kumulativní, graduální a v pozdních fázích samozesilující (viz
[2.1 Definice](@/kompendium/02-uvod/definice.md)). Jednorázové průřezové šetření z takového
procesu zachytí jen snímek. Kdo chce zjistit, jak se obtíže vyvíjejí, co předchází zlepšení
a co relapsu, potřebuje měřit tytéž lidi opakovaně. Tato stránka popisuje longitudinální
designy, jejich úskalí a etické nároky v této oblasti.

## Vymezení

Longitudinální studie sleduje tytéž jednotky (osoby, rodiny, skupiny) ve dvou a více časových
bodech. Rozlišuje se **panelová studie** (pevný vzorek měřený v pravidelných vlnách),
**kohortová studie** (skupina definovaná společnou událostí, např. odchodem ze skupiny ve
stejném období; viz [kohortové studie](@/kompendium/population-health/02-cohort-studies-EA.md))
a **intenzivní longitudinální design** s mnoha měřeními během krátké doby, kterému se věnuje
stránka [Časové řady](@/kompendium/research-methodology/time-series-EA.md).

## Kdy metodu použít

- Popis **trajektorie zotavení** po odchodu z kontrolujícího vztahu nebo
  [vysoce kontrolující skupiny](@/glossary/high-control-group.md): kdy se vrací důvěra ve
  vlastní paměť, kdy schopnost samostatně rozhodovat, co se mění pomalu.
- Hledání **prediktorů**: co v počátečním měření předpovídá horší nebo lepší průběh (sociální
  opora, délka expozice, dostupnost terapie).
- Odlišení **příčiny a důsledku**: zda nízká důvěra ve vlastní úsudek předchází vstupu do
  manipulativního vztahu, nebo je jeho výsledkem. Průřezová data to nerozliší.
- Hodnocení **dlouhodobého účinku** intervencí (psychoedukace, skupinová podpora), kde krátké
  sledování zachytí jen počáteční efekt.

## Postup

1. **Teorie změny.** Předem popsat, jaký průběh čekáme (lineární zlepšení, rychlý pokles a
   plató, výkyvy) a proč. Bez teorie nelze rozumně zvolit počet a rozestup vln.
2. **Volba časových bodů.** Rozestup musí odpovídat rychlosti změny. U zotavení po odchodu ze
   skupiny se nabízí hustší měření v prvních měsících a řidší později; u sledování dětí
   v rodinách s [rodičovským odcizováním](@/glossary/parental-alienation.md) se vlny vážou na
   vývojová období.
3. **Stabilní měření.** Tytéž nástroje ve všech vlnách, ověřená invariance měření v čase –
   jinak nelze odlišit skutečnou změnu od změny toho, jak lidé otázkám rozumějí.
4. **Plán udržení účastníků.** Kontaktní údaje včetně záložních, pravidelný kontakt mezi
   vlnami, přiměřená kompenzace, flexibilní forma sběru.
5. **Analýza.** Modely růstových křivek, víceúrovňové modely pro opakovaná měření, modely
   latentních tříd trajektorií; Singer a Willett (2003) jsou standardní učebnicí.
6. **Zacházení s chybějícími daty.** Předem stanovený postup (vícenásobná imputace, metody
   úplné informace) a citlivostní analýzy pro případ, že data nechybějí náhodně.

## Specifika výzkumu epistemické manipulace

**Úbytek není náhodný.** Ze studie vypadávají jiní lidé než ti, kteří zůstávají. Někdo odejde,
protože se mu daří dobře a nechce se k tématu vracet; jiný, protože se vrátil do skupiny nebo
vztahu a druhá strana účast zakázala; další, protože se jeho stav zhoršil. Každá z těchto cest
zkresluje výsledky jinak. Proto je nutné při každém odchodu, pokud to účastník dovolí, zjistit
alespoň stručný důvod a v analýze testovat, zda se odcházející liší ve vstupních hodnotách.

**Opakované dotazování jako zásah.** Měření samo může člověka měnit – pravidelné otázky na
důvěru ve vlastní vnímání mohou podpořit sebereflexi (což je žádoucí), ale také udržovat
pozornost u bolestného tématu. Vhodné je zařadit kontrolní skupinu s méně častým měřením nebo
alespoň sledovat, zda se odpovědi mění s počtem vyplnění.

**Změna výkladového rámce.** Lidé během zotavení často přehodnocují minulost: co dřív
považovali za péči, později nazývají kontrolou (k tomu viz [narativní identita](@/glossary/narativni-identita.md)).
Retrospektivní otázky kladené v různých vlnách proto mohou dávat různé odpovědi o tytéž
události. To není chyba měření, ale samostatný výzkumný nález, který je třeba oddělit od
otázek na současný stav.

**Návrat do rizikového prostředí.** Longitudinální studie musí počítat s tím, že část
účastníků se vrátí. Studie nesmí vytvářet tlak „zůstaň venku, jinak tě vyřadíme“ a zároveň
musí mít postup pro situaci, kdy výzkumník zjistí vážné ohrožení (viz
[povinné hlášení](@/kompendium/forensic-legal/40-mandatory-reporting-state.md)).

## Kritéria kvality

| Oblast | Co doložit |
|---|---|
| Teorie změny | předem popsaný očekávaný průběh a zdůvodnění rozestupu vln |
| Invariance | test invariance měření mezi vlnami |
| Udržení | míra účasti v každé vlně, důvody odchodu, srovnání odcházejících a zůstávajících |
| Chybějící data | předem stanovený postup a citlivostní analýzy |
| Modelování | volba modelu odpovídá struktuře dat, ověřené předpoklady |
| Reportování | vývojový diagram účastníků přes vlny (podle STROBE pro observační studie) |

## Etika a ochrana účastníků

Dlouhé sledování znamená dlouhé uchovávání citlivých a identifikovatelných údajů – kontakty
musí být odděleny od výzkumných dat a přístup k nim omezen (viz
[datová bezpečnost](@/kompendium/research-methodology/data-security-EA-research.md)).
Souhlas se obnovuje: účastník má v každé vlně slyšet, že může skončit, a mít možnost
rozhodnout, zda se jeho dosavadní data smějí dál používat
([informovaný souhlas](@/kompendium/research-methodology/informed-consent-EA-research.md)).
Pravidelný kontakt s výzkumníkem může vytvořit vztah, který účastník vnímá jako terapeutický;
je třeba jasně říkat, co studie nabízí a co ne, a mít kam člověka odkázat.

## Časté chyby

- dvě vlny prezentované jako „trajektorie“ – ze dvou bodů nelze odlišit lineární a nelineární změnu;
- analýza jen těch, kdo absolvovali všechny vlny, bez zdůvodnění;
- změna dotazníku mezi vlnami „protože nová verze je lepší“;
- interpretace souvislosti v čase jako příčiny bez kontroly zavádějících proměnných
  (viz [kauzální inference](@/kompendium/research-methodology/causal-inference-EA.md));
- zamlčení, kolik účastníků se vrátilo do rizikového prostředí.

## Ilustrativní příklad

*Hypotetický návrh.* Studie sleduje dospělé, kteří v posledních šesti měsících opustili
skupinu s vysokou mírou kontroly informací. Vstupní měření zahrnuje symptomy traumatu,
sociální oporu a krátké škály důvěry ve vlastní paměť a úsudek; následují vlny po třech,
šesti, dvanácti a čtyřiadvaceti měsících. Analýza latentních trajektorií může ukázat například
skupinu s rychlým zlepšením a skupinu s přetrvávajícími obtížemi; tým pak zkoumá, čím se
skupiny lišily na začátku. Výsledky se hlásí i pro účastníky, kteří se vrátili, ale odděleně
a bez hodnocení.

## Jak číst studii tohoto typu

Longitudinální studie mají v oboru zvláštní autoritu, protože „sledovaly lidi léta“. Délka
sledování ale sama o sobě kvalitu nezaručuje. Při čtení se vyplatí ověřit:

- **Kolik lidí zůstalo v poslední vlně a kdo to byl.** Pokud z původního vzorku zbyla
  menšina, závěr platí pro tuto menšinu. Dobrá zpráva srovnává vstupní charakteristiky
  těch, kdo zůstali, a těch, kdo odešli.
- **Zda se měřilo stejně.** Změna nástroje, způsobu sběru (osobně → online) nebo tazatele
  mezi vlnami může vytvořit zdánlivý trend.
- **Co bylo výchozím bodem.** „Zotavení po odchodu“ znamená něco jiného, když první měření
  proběhlo týden po odchodu, a když proběhlo po dvou letech. Lidé, kteří se do studie
  přihlásí později, jsou už zčásti vybraní tím, že období po odchodu přečkali.
- **Zda se pracuje s průměrem, nebo s trajektoriemi.** Průměrná křivka může skrývat dvě
  skupiny s opačným průběhem; naopak modely latentních tříd mají sklon „najít“ skupiny
  i tam, kde jde o plynulé rozložení. Počet tříd má být zdůvodněn, ne jen vybrán podle
  nejlepšího indexu shody.
- **Jak autoři mluví o příčinách.** Souvislost mezi vstupním stavem a pozdějším průběhem
  je predikce, ne důkaz, že vstupní stav průběh způsobil.

Pro praxi je nejcennější, když studie popisuje i rozptyl – kolik lidí se zlepšilo,
kolik zůstalo beze změny a kolik se zhoršilo. Klient v terapii se může poznat v kterékoli
z těchto skupin a průměr mu o jeho vlastní cestě řekne málo.

## Meze a otevřené otázky

Longitudinální studie je drahá a pomalá a její vzorek se v čase zužuje. Ani dlouhé sledování
nezaručí kauzální výklad. Otevřené zůstává, jak měřit „zotavení“ u fenoménu, kde část
symptomů (např. zvýšená ostražitost k autoritám) může být zároveň adaptivní ochranou. Tuto
otázku rozvádí stránka [Dlouhodobý posttraumatický růst](@/kompendium/recovery-protocols/longterm-post-traumatic-growth.md).

## Literatura

- Singer, J. D., Willett, J. B. (2003). *Applied Longitudinal Data Analysis: Modeling Change and Event Occurrence.*
- von Elm, E. a kol. (2007). The Strengthening the Reporting of Observational Studies in Epidemiology (STROBE) statement.
- Little, R. J. A., Rubin, D. B. *Statistical Analysis with Missing Data* (více vydání).

## Související

**Metody v této sekci**

- [Časové řady](@/kompendium/research-methodology/time-series-EA.md) – intenzivní měření během dní a týdnů.
- [Kauzální inference](@/kompendium/research-methodology/causal-inference-EA.md) – co z dat v čase lze a nelze vyvodit.
- [Dotazníkový výzkum](@/kompendium/research-methodology/survey-design-EA.md) – nástroje pro jednotlivé vlny.

**Etika**

- [Výzkum zranitelných populací](@/kompendium/research-methodology/vulnerable-population-research.md) – ochrana při dlouhém kontaktu.

**Zotavení a populace**

- [Kohortové studie](@/kompendium/population-health/02-cohort-studies-EA.md) – populační pohled na sledování v čase.
- [Dlouhodobá prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md) – co sledovat po stabilizaci.
- [Případ: zotavení po dvanácti letech](@/kompendium/case-studies/06-cult-recovery-12-let.md) – dlouhý průběh na kazuistice.

**Pojmy**

- [Narativní identita](@/glossary/narativni-identita.md) – proč se výpovědi o minulosti v čase mění.
