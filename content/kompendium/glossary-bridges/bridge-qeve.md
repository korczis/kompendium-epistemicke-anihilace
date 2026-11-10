+++
title = "Bridge: QEVE (kvantifikovaný epistemický ověřovací engine)"
description = "Most mezi heslem QEVE a knihou: formální důkaz, axiomy a test robustnosti v jednom ověření a otázka, kterou kniha přebírá – který doklad nese celý závěr a co zbude, když padne."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "qeve", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["qeve", "nabla-axioms", "trinity-gate", "toulmin-model", "modalni-logika", "white-team"]
glossary_target = "qeve"
toc = false
+++

# Bridge: QEVE (kvantifikovaný epistemický ověřovací engine)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[QEVE](@/glossary/qeve.md) (*Quantified Epistemic Verification Engine*) je rámec formálního ověřování
platformy, z níž Kompendium vzešlo. Spojuje tři metody do jednoho ověřovacího postupu: **dokazování
vět** v systému Lean 4 pro matematickou jistotu, **vynucení [axiomů NABLA](@/glossary/nabla-axioms.md)**
pro epistemickou přísnost a **simulace Monte Carlo** pro test pravděpodobnostní robustnosti. Výsledkem
je závěr s vyčíslenou důvěrou, nejistotou a stabilitou, který lze zpětně auditovat.

Každá ze tří metod má vlastní obor a tradici. Systém Lean popsali de Moura a spolupracovníci (2015) a
jeho čtvrtou verzi de Moura a Ullrich (2021) jako dokazovací nástroj, v němž počítač kontroluje každý
krok důkazu. Metodu Monte Carlo, tedy odhad vlastností systému opakovaným náhodným vzorkováním,
představili Metropolis a Ulam (1949). Testování citlivosti závěru na změny vstupů systematizovali
Saltelli a spolupracovníci (2008). Heslo patří do kontextu platformy; kniha ho zařazuje mezi mosty kvůli
otázce, kterou z něj přebírá pro posuzování lidských závěrů: **který důkaz nese celý závěr?**

## Ověřování očima knihy

Spojení tří metod vychází z poznání, že každá z nich ověřuje něco jiného a žádná nestačí sama. Formální
důkaz zaručuje, že závěr plyne z předpokladů – ale ne, že předpoklady jsou pravdivé. Axiomy NABLA
kontrolují, zda závěr respektuje pravidla dobrého poznávání – původ, nezávislost zdrojů, zachování
rozporu. Test robustnosti ukazuje, zda závěr přežije, když se vstupy mírně změní. Kniha tuto trojici
převádí do tří otázek, které lze položit každému tvrzení: Plyne závěr skutečně z uvedených důvodů?
Jsou důvody dobře doložené? A co se stane se závěrem, když jeden z důvodů padne?

Třetí otázka je pro knihu nejdůležitější. Toulmin (1958) v modelu argumentu rozlišil tvrzení, data,
oprávnění, podporu a výhrady; jeho rozbor ukazuje, že argument často stojí na jediném oprávnění, které
se nevyslovuje. Kniha tento model rozebírá v hesle [Toulminův model](@/glossary/toulmin-model.md). Závěr,
který se zhroutí po odebrání jediného dokladu, je **křehký**, i když působí přesvědčivě. Manipulace
s křehkými závěry pracuje záměrně: celý narativ postaví na jednom působivém „důkazu“ – dokumentu,
nahrávce, svědectví –, a pokud se ho podaří podvrhnout, padá s ním i obrana. Kniha tento vzorec popisuje
v technikách [EA-9.2.9 Padělání dokumentů pomocí AI](@/kompendium/techniques/ea-9-2-9-AI-document-forgery.md)
a [EA-9.2.7 Syntetické svědectví](@/kompendium/techniques/ea-9-2-7-synthetic-witness-testimony.md).

Výzkum v psychologii dospěl k téže otázce v jiné podobě. Simmons, Nelson a Simonsohn (2011) ukázali,
že drobná rozhodnutí při analýze dat mohou z náhodného šumu udělat „významný“ výsledek, a Steegen a
spolupracovníci (2016) navrhli „multiverzní analýzu“, která výsledek přepočítá pro všechny rozumné
varianty rozhodnutí. Robustní závěr přežije většinu variant; křehký závisí na jedné.

## Kde se pojem v knize vyskytuje

Jak QEVE na platformě spojuje formální dokazování, axiomy a testy robustnosti k ověření závěrů o
technikách EA, popisuje stránka [QEVE a EA](@/kompendium/aiad-integration/qeve-ea-quality-validation.md).
Stupňování kvality dokladů v prověrkách rozebírá kapitola
[Evidence Quality Tiering](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md).

Lidskou obdobu – hodnocení důkazů a jejich váhy – najde čtenář v návodu
[Hodnocení důkazů](@/kompendium/self-defense-guides/2-evidence-evaluation.md) a ve vzdělávacím scénáři
[Vážení důkazů](@/kompendium/educational-scenarios/7-evidence-weighting.md). Forenzní obdobou je skládání
mnoha nezávislých, jednotlivě slabých dokladů do vzorce, které popisuje kapitola
[Pattern důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md): závěr postavený na vzorci je robustnější
než závěr postavený na jediném silném dokladu.

## Od pojmu k praxi

### Rozpoznání

Kniha doporučuje u každého závěru, na němž záleží, provést „myšlenkový test robustnosti“: postupně
odebrat jednotlivé doklady a sledovat, zda závěr stále stojí. Varovným znakem je narativ, který stojí
na jednom dokladu, jenž nelze nezávisle ověřit, nebo narativ, jehož zastánci odmítají připustit, co by
ho vyvrátilo. Druhým varovným znakem je přesnost, která neodpovídá datům – závěr vyjádřený na desetinná
místa ze vstupů, které jsou jen odhadem.

### Obrana

Obranou je hledat pro každý důležitý závěr víc nezávislých opor, výslovně zapsat předpoklady a uvést,
co by závěr vyvrátilo. Formální metody, jako je dokazování v Lean, mají v lidském poznávání skromnější
obdobu: rozepsat argument do kroků a u každého se zeptat, zda plyne z předchozího. Pro instituce kniha
doporučuje, aby závěry zpráv uváděly, na kterých klíčových dokladech stojí a jak by se změnily, kdyby
některý z nich neplatil.

### Náprava

Když se ukáže, že klíčový doklad byl podvržený nebo mylný, je třeba přezkoumat všechny závěry, které na
něm stály, nejen ten, u něhož se omyl odhalil. Kniha k tomu odkazuje na kapitoly
[Řetěz důkazů](@/kompendium/forensic-legal/34-chain-evidence-narrative.md) a
[Chain of custody](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md), které popisují, jak sledovat,
kudy se doklad dostal a co z něj bylo vyvozeno. U člověka, jehož obraz světa stál na podvrženém
„důkazu“, je zjištění podvrhu otřesem, který vyžaduje oporu – viz
[Středně-dobý hermeneutický reset](@/kompendium/recovery-protocols/midterm-hermeneutic-reset.md).

### Rámec pro profesionály

Pro znalce a soudce má otázka robustnosti přímý význam: posudek, jehož závěr závisí na jediném
předpokladu, by měl tento předpoklad výslovně uvést a ukázat, jak by závěr vypadal bez něj. Pro
výzkumníky kniha doporučuje předregistraci analýz a zveřejnění alternativních výpočtů – viz
[Předregistrace v EA výzkumu](@/kompendium/research-methodology/pre-registration-EA-research.md).

## Odlišení od příbuzných pojmů

QEVE je třeba odlišit od brány [Trinity Gate](@/glossary/trinity-gate.md): brána rozhoduje, zda
přesvědčení smí být přijato, QEVE kvantifikuje, jak dobře je závěr podložen a jak je stabilní. Od
[White Teamu](@/glossary/white-team.md) se liší tím, že bílý tým dokládá vlastnosti systémů, QEVE
vlastnosti jednotlivých závěrů. Od statistického testu významnosti se liší tím, že neposuzuje jen
pravděpodobnost výsledku, ale i jeho závislost na volbách při analýze.

## Časté omyly

Prvním omylem je přesvědčení, že formální důkaz dokazuje pravdu; dokazuje jen platnost odvození
z předpokladů. Druhým omylem je domněnka, že číslo vyjadřující důvěru je objektivní vlastností závěru;
je výsledkem modelu, který mohl být nastaven jinak. Třetím omylem je opačná krajnost – odmítnout každý
závěr, který není formálně dokázán; většina lidských rozhodnutí se musí spokojit s robustními,
nikoli dokázanými závěry.

## Příklad (anonymizovaný kompozit)

Vedení firmy dostane interní zprávu, podle níž finanční ředitel tajně spolupracuje s konkurencí.
Zpráva působí přesvědčivě, ale členka dozorčí rady ji projde po krocích a zjistí, že všechny části
odkazují k jednomu e-mailu, jehož původ nikdo neověřil. Bez něj zůstávají jen nejednoznačné okolnosti.
Rada nechá e-mail forenzně prověřit; ukáže se, že byl upraven. Rozhodnutí o odvolání ředitele, které už
bylo připraveno, se nekoná.

## Meze a otevřené otázky

Přenos formálních metod na lidské poznávání je analogie a kniha netvrdí, že lidské závěry lze formálně
dokazovat. Otevřená zůstává otázka, jak sdělit výsledek testu robustnosti lidem, kteří očekávají
jednoznačnou odpověď, a jak zabránit tomu, aby se vyčíslená důvěra stala novou autoritou, kterou nikdo
nezpochybňuje.

## Literatura

- de Moura, L., Kong, S., Avigad, J., van Doorn, F., & von Raumer, J. (2015). The Lean theorem prover (system description). In *Automated Deduction – CADE-25*. Springer.
- de Moura, L., & Ullrich, S. (2021). The Lean 4 theorem prover and programming language. In *Automated Deduction – CADE 28*. Springer.
- Metropolis, N., & Ulam, S. (1949). The Monte Carlo method. *Journal of the American Statistical Association*, 44(247), 335–341.
- Saltelli, A., Ratto, M., Andres, T., Campolongo, F., Cariboni, J., Gatelli, D., Saisana, M., & Tarantola, S. (2008). *Global Sensitivity Analysis: The Primer*. Wiley.
- Simmons, J. P., Nelson, L. D., & Simonsohn, U. (2011). False-positive psychology. *Psychological Science*, 22(11), 1359–1366.
- Steegen, S., Tuerlinckx, F., Gelman, A., & Vanpaemel, W. (2016). Increasing transparency through a multiverse analysis. *Perspectives on Psychological Science*, 11(5), 702–712.
- Toulmin, S. (1958). *The Uses of Argument*. Cambridge University Press.

## Související

**Glosář**

- [QEVE](@/glossary/qeve.md) – technické heslo, které most propojuje.
- [Axiomy NABLA](@/glossary/nabla-axioms.md) – epistemická pravidla, jejichž soulad se ověřuje.
- [Toulminův model](@/glossary/toulmin-model.md) – stavba argumentu a jeho skryté oprávnění.
- [Trinity Gate](@/glossary/trinity-gate.md) – brána před přijetím přesvědčení.

**Kniha**

- [QEVE a EA](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) – ověřování závěrů na platformě.
- [Evidence Quality Tiering](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md) – stupně kvality dokladů.
- [Pattern důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md) – robustnost vzorce.
- [EA-9.2.9 Padělání dokumentů pomocí AI](@/kompendium/techniques/ea-9-2-9-AI-document-forgery.md) – křehký závěr jako cíl.

**Sesterské mosty**

- [Bridge: Trinity Gate](@/kompendium/glossary-bridges/bridge-trinity-gate.md) – brána ověření.
- [Bridge: NABLA Infinity](@/kompendium/glossary-bridges/bridge-nabla-infinity.md) – axiomy.
- [Bridge: White Team](@/kompendium/glossary-bridges/bridge-white-team.md) – konstruktivní ověřování.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [QEVE (kvantifikovaný epistemický ověřovací engine)](@/glossary/qeve.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
