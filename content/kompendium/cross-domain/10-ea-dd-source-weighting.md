+++
title = "Due diligence: vážení zdrojů a pravděpodobnostní úsudek"
description = "Jak převést různě spolehlivé zdroje do jednoho úsudku: věrohodnost, nezávislost, aktualizace podle důkazů, slovní vyjádření pravděpodobnosti a obrana proti manipulaci vah."
weight = 100

[taxonomies]
tags = ["kompendium", "cross-domain", "due-diligence"]
categories = ["academic"]

[extra]
related_terms = ["1-ea-osint-source-credibility", "8-ea-osint-cross-source-triangulation", "11-ea-dd-decision-engine-calibration", "15-ea-dd-evidence-quality-assessment"]
toc = true
+++

Prověrka protistrany shromažďuje informace z mnoha zdrojů různé kvality: úřední rejstříky,
média, výpovědi bývalých partnerů, dokumenty od samotné protistrany, data z placených databází.
Úsudek, který z nich vznikne, je vždy vážením – některým zdrojům se věří víc, jiným méně.
Pokud jsou váhy nastaveny neuvědoměle, vzniká prostor pro zkreslení i pro manipulaci: kdo
zná váhy, ví, kterým kanálem poslat informaci, aby měla největší účinek. Tato stránka popisuje,
jak vážení zdrojů zprůhlednit a jak ho chránit.

## Doména a problém

Formálním rámcem pro aktualizaci přesvědčení podle nových informací je Bayesova věta:
výchozí pravděpodobnost hypotézy se mění podle toho, jak pravděpodobný je nový důkaz,
pokud hypotéza platí, ve srovnání s tím, jak pravděpodobný je, pokud neplatí. Prakticky to
znamená, že **síla důkazu** nezávisí na tom, jak dobře „sedí“ k hypotéze, ale na tom, jak
dobře odlišuje hypotézu od alternativ. Informace, která by se objevila i v případě, že
hypotéza neplatí, má malou váhu, i když je zdroj spolehlivý. Schum (1994) podrobně rozebral,
jak se v posuzování důkazů kombinuje věrohodnost zdroje se silou toho, co zdroj tvrdí.

Druhým problémem je **vyjadřování nejistoty**. Kent (1964) upozornil, že slova jako
„pravděpodobně“ nebo „možná“ znamenají pro různé čtenáře velmi různé pravděpodobnosti, a
navrhl spojit slovní vyjádření s číselnými rozpětími. Zpravodajské služby i některé regulace
dnes používají standardizované škály. V [due diligence](@/glossary/due-diligence.md) se nejistota často ztrácí: zpráva
uvádí „žádné negativní nálezy“, aniž by řekla, jak důkladně se hledalo.

Tetlock (2005) ve dvacetiletém sledování expertních předpovědí ukázal, že úspěšnost
předpovědí jednotlivých expertů často nebyla lepší než jednoduché statistické modely,
a že lépe si vedli ti, kdo kombinovali více perspektiv a ochotně revidovali odhady.
Pro vážení zdrojů z toho plyne, že ani hodnocení „expertního“ zdroje nemá být automaticky
vysoké – záleží na jeho doložené úspěšnosti v podobných otázkách.

## Průnik s epistemickou anihilací

Kniha popisuje řadu technik, které míří přímo na váhy zdrojů. [Expertní disinflace](@/kompendium/techniques/ea-2-1-1-expertni-disinflation.md)
snižuje váhu kompetentních hlasů, [credentialing attack](@/kompendium/techniques/ea-2-1-3-credentialing-attack.md)
zpochybňuje kvalifikaci, [reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md)
zvyšuje váhu nespolehlivých zdrojů jejich průchodem přes důvěryhodné prostředníky. Výsledkem
není jednorázová chyba, ale trvalá deformace systému vah, který analytik používá pro všechna
další rozhodnutí – obdoba toho, co kniha u jednotlivce popisuje jako [modifikaci evidenčních kritérií](@/kompendium/techniques/ea-4-3-5-evidential-criteria-modification.md).

V osobních vztazích se manipulace vah projevuje tím, že člověk přestává věřit vlastním
smyslům a spoléhá výhradně na výklad druhé osoby. V organizacích tím, že se ustálí jeden
„spolehlivý“ zdroj – konzultant, databáze, interní expert –, jehož výroky se nepřezkoumávají.
V obou případech se ztrácí oprava z nezávislého zdroje, kterou kniha popisuje jako [fúzi zpravodajství](@/glossary/intelligence-fusion.md).

## Rozpoznávací znaky

Problém s vážením zdrojů naznačuje, když **jeden zdroj rozhoduje** o závěru, aniž by to
bylo zdůvodněno; když jsou **váhy implicitní** a nikdo je nedokáže vysvětlit; když se **váha
zdroje mění podle toho, co tvrdí** (zdroj je spolehlivý, když potvrzuje, a nespolehlivý,
když vyvrací); když **dokumenty od protistrany** mají stejnou váhu jako nezávislé ověření;
a když **negativní výsledek hledání** („nic jsme nenašli“) není doplněn popisem, kde a jak
se hledalo. Posledním znakem je **nepřiměřená jistota** závěru vzhledem ke kvalitě zdrojů
(srov. [nepřiměřená sebejistota](@/kompendium/detection-signatures/9-behavioral-disproportionate-confidence.md)).

## Rámec: standardy a odpovědnost

Právní předpisy obvykle nestanoví, jak vážit zdroje, ale stanoví povinnost postupovat
s odbornou péčí a doložit, na čem rozhodnutí stojí. U povinných osob podle zákona č. 253/2008 Sb.
se hodnocení rizika klienta opírá o dokumentované zdroje a jeho přiměřenost posuzuje
dozorový orgán. Pro zpravodajské a analytické prostředí jsou vodítkem standardy hodnocení
zdrojů (A–F/1–6) a standardizované slovní vyjádření pravděpodobnosti (Kent 1964).

## Ochranná opatření

Prvním opatřením je **explicitní matice zdrojů**: u každého klíčového zdroje uvést jeho typ,
nezávislost na protistraně, doloženou spolehlivost a co přesně tvrdí. Druhým je **diagnostická
otázka** u každého důkazu: objevil by se i v případě, že hypotéza neplatí? Třetím je
**standardizovaná škála nejistoty** v závěrech, se slovy svázanými s rozpětími. Čtvrtým je
**popis negativního hledání** – kde, jak a s jakými omezeními. Pátým je **pravidelná kalibrace**:
zpětné srovnání odhadů s tím, jak věci dopadly (viz [kalibrace rozhodovacího systému](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md)).
Šestým je **ochrana vah před manipulací**: změna váhy zdroje se zdůvodňuje a zapisuje,
nikoli upravuje podle aktuálního tvrzení.

## Lidský rozměr a zotavení

Pro osoby, o nichž prověrka rozhoduje, je důležité, aby jejich vlastní vyjádření mělo
v úsudku místo a aby nebylo automaticky podhodnoceno jen proto, že pochází od nich. Fricker
(2007) tento jev popisuje jako svědeckou křivdu: mluvčímu je přisuzována nižší důvěryhodnost
z důvodů, které nesouvisejí s obsahem. Na straně analytika je zdravé vážení zdrojů ochranou
proti vyhoření i cynismu – kdo ví, proč čemu věří, nepotřebuje ani všemu věřit, ani vše
odmítat. Kniha tuto dovednost popisuje jako [kalibraci důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md).

## Přesah do dalších oborů

Vážení zdrojů je jádrem medicíny založené na důkazech, kde hierarchie důkazů a hodnocení
jistoty (např. přístup GRADE) určují, jakou váhu má studie v doporučení. V soudnictví jde
o volné hodnocení důkazů, kdy soud váží výpovědi, listiny a posudky. Ve vzdělávání o to,
jak učit žáky, že ne všechny zdroje mají stejnou váhu, ale že váhu je třeba zdůvodnit.
V terapii lidí po manipulaci jde o obnovu schopnosti dát váhu vlastnímu vnímání vedle
názorů druhých (viz [Subakutní rekonstrukce důvěry](@/kompendium/recovery-protocols/subacute-trust-rebuilding.md)).
Ve všech oborech platí Schumův (1994) postřeh, že síla důkazu se skládá z věrohodnosti
zdroje a z toho, nakolik tvrzení odlišuje mezi hypotézami.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Prověrka kandidáta do představenstva obsahuje negativní
referenci od bývalého kolegy a tři pozitivní reference, které dodal sám kandidát. Původní
zpráva je hodnotí stejně a závěr zní „smíšené reference“. Při revizi analytik zvažuje
nezávislost: pozitivní reference vybral kandidát, negativní pochází od osoby, která s ním
byla v obchodním sporu. Ani jedna skupina není nezávislá. Analytik proto osloví dva bývalé
kolegy, které kandidát neuvedl a kteří nebyli ve sporu. Jejich výpovědi jsou věcné a
spíše pozitivní. Závěr zní: „Bez podstatných negativních zjištění; jedna negativní reference
pochází ze sporu a nebyla nezávisle potvrzena.“

Zpráva přitom negativní referenci nevyřazuje: uvádí její obsah, okolnosti vzniku a to,
že ji nezávislé zdroje nepotvrdily. Kdyby se později objevily další nezávislé informace
stejného směru, váha původní reference se zvýší – a tento postup je ve zprávě popsán
předem, aby nebylo možné váhy upravovat podle toho, jaký závěr je zrovna žádoucí.

Kandidát dostane možnost se k negativní referenci vyjádřit; jeho vysvětlení je ve zprávě
uvedeno vedle ní, nikoli místo ní.

## Meze a otevřené otázky

Explicitní vážení zdrojů je náročné a v praxi často nahrazováno intuicí. Otevřenou otázkou
je, jak vést analytiky k tomu, aby váhy zdůvodňovali bez toho, aby z nich vznikla pseudopřesná
čísla, která jen zakrývají subjektivní úsudek.

## Literatura

- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing.*
- Kent, S. (1964). Words of estimative probability.
- Schum, D. A. (1994). *The Evidential Foundations of Probabilistic Reasoning.*
- Tetlock, P. E. (2005). *Expert Political Judgment: How Good Is It? How Can We Know?*

## Související

**Mezioborové mosty**

- [Důvěryhodnost zdrojů](@/kompendium/cross-domain/1-ea-osint-source-credibility.md) – hodnocení jednotlivých zdrojů.
- [Triangulace napříč zdroji](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) – nezávislost.
- [Kalibrace rozhodovacího systému](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md) – zpětná kontrola odhadů.
- [Hodnocení kvality důkazů](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md) – síla doložení.

**Techniky**

- [EA-2.1.1 Expertní disinflace](@/kompendium/techniques/ea-2-1-1-expertni-disinflation.md) – snižování váhy expertů.

**Sebeobrana a pojmy**

- [Kalibrace důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md) – osobní dovednost.
