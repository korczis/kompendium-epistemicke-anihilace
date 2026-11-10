+++
title = "Randomizované studie a jejich etické meze"
description = "Kdy je randomizovaná kontrolovaná studie v oblasti epistemické manipulace možná: testují se ochranné intervence, nikdy vystavení manipulaci."
weight = 12

[taxonomies]
tags = ["kompendium", "research-methodology", "quantitative"]
categories = ["academic", "methodology", "research"]

[extra]
related_terms = ["causal-inference-EA", "power-analysis-EA", "effect-size-EA", "IRB-protocol-design-EA", "debriefing-protocol-research"]
parent = "kompendium-research-methodology"
toc = true
+++

Randomizovaná kontrolovaná studie (*randomized controlled trial*, RCT) je nejsilnější nástroj
pro závěr, že zásah způsobil změnu. Ve výzkumu [epistemické anihilace](@/glossary/epistemicka-anihilace.md)
však platí jednoduchá hranice: **randomizovat lze ochranu, ne poškození.** Nikoho nelze
náhodně přidělit k tomu, aby byl vystaven [coercive control](@/glossary/coercive-control.md),
[gaslightingu](@/glossary/gaslighting.md) nebo izolaci. Tato stránka popisuje, co z logiky
RCT v oboru zbývá a jak ji použít poctivě.

## Vymezení

V RCT jsou účastníci náhodně rozděleni do skupin, které dostanou různé podmínky (zásah,
srovnávací podmínku), a výsledky se porovnají. Náhodné přidělení vyrovná skupiny v průměru
i v proměnných, které výzkumník nezná – proto je kauzální závěr silnější než u observačních
dat (viz [kauzální inference](@/kompendium/research-methodology/causal-inference-EA.md)).

## Kdy metodu použít

RCT je v oboru vhodná pro **zásahy, od nichž se očekává prospěch**:

- **Prebunking a „očkování“ proti manipulaci.** Inokulační teorie (McGuire 1961) předpovídá,
  že oslabená ukázka manipulativního argumentu spolu s vyvrácením zvyšuje odolnost. Tuto
  logiku testují randomizované studie vzdělávacích her a krátkých videí (např. Roozenbeek
  a van der Linden 2019).
- **Psychoedukace a programy odolnosti** ve školách nebo na pracovištích (viz
  [kurikulum kritického myšlení](@/kompendium/prevention-resilience/8-critical-thinking-curriculum.md)
  a [mediální gramotnost](@/kompendium/prevention-resilience/6-media-literacy-prevention.md)).
- **Terapeutické a podpůrné intervence** pro lidi po zkušenosti s manipulací, například
  srovnání skupinové podpory s individuální terapií.
- **Organizační opatření**, například zda změna [struktury jednání](@/kompendium/organizational-defense/22-meeting-structure.md)
  snižuje dominanci jednoho hlasu – pokud lze randomizovat celé týmy.

Experimenty s krátkým, mírným a vratným podnětem existují i v základním výzkumu (např.
paradigma dezinformačního efektu Loftusové a Palmera 1974 nebo studie efektu iluzorní pravdy,
Hasher a kol. 1977). I ty vyžadují etické posouzení a [debriefing](@/kompendium/research-methodology/debriefing-protocol-research.md);
nejsou modelem dlouhodobé manipulace a jejich výsledky nelze na EA přenášet bez výhrad.

## Postup

1. **Otázka a srovnávací podmínka.** Proti čemu se zásah srovnává: čekací listina, běžná
   péče, aktivní kontrola se stejnou mírou pozornosti, nebo rozkladová studie (*dismantling*)
   testující jednotlivé složky programu.
2. **Randomizace a utajení přidělení.** Přidělení generuje nezávislá osoba nebo systém a ten,
   kdo nabírá účastníky, je předem nezná.
3. **Zaslepení.** Účastníka většinou zaslepit nelze (ví, jestli chodí do skupiny), hodnotitele
   výsledků ano.
4. **Primární výsledek** stanovený předem, včetně času měření ([pre-registrace](@/kompendium/research-methodology/pre-registration-EA-research.md)).
5. **Velikost vzorku** z [analýzy síly testu](@/kompendium/research-methodology/power-analysis-EA.md);
   u skupinových zásahů s korekcí na shlukování.
6. **Monitorování bezpečnosti.** U studií s vyšším rizikem nezávislá rada pro monitorování dat
   a bezpečnosti a předem dané pravidlo zastavení.
7. **Analýza podle původního přidělení** (*intention-to-treat*) a doplňková analýza podle
   skutečné účasti.
8. **Reportování podle CONSORT** včetně vývojového diagramu účastníků a hlášení
   [velikosti účinku](@/kompendium/research-methodology/effect-size-EA.md).

## Specifika výzkumu epistemické manipulace

**Co je „škodlivý“ výsledek.** U programu odolnosti je třeba sledovat i nežádoucí účinky:
přehnanou podezíravost, plošnou nedůvěru ke všem zdrojům nebo cynismus. Program, který naučí
lidi nevěřit ničemu, není úspěch – nekritická nedůvěra je jen jiná podoba bezradnosti
(viz [epistemická pokora](@/glossary/epistemicka-pokora.md) jako protiváha).

**Ekvipoise.** Randomizace je etická jen tehdy, když skutečně nevíme, která podmínka je lepší.
U lidí v akutní krizi nelze nabídnout čekací listinu; viz [akutní stabilizační protokol](@/kompendium/recovery-protocols/acute-stabilization-protocol.md).

**Kontaminace.** Účastníci programu mluví s kontrolní skupinou, sdílejí materiály; ve školách
a firmách je proto často nutné randomizovat celé třídy nebo týmy.

**Výzkumná loajalita.** Autoři intervence bývají jejími přesvědčenými zastánci. Nezávislé
hodnocení výsledků a sdílení dat snižují riziko, že víra v program ovlivní závěry.

## Kritéria kvality

| Oblast | Co doložit |
|---|---|
| Randomizace | způsob generování, utajení přidělení |
| Zaslepení | kdo byl zaslepen a jak to bylo ověřeno |
| Srovnání | zdůvodnění kontrolní podmínky |
| Úbytek | počty v každém kroku podle CONSORT, důvody odchodu |
| Analýza | intention-to-treat, korekce na shlukování, předem dané výsledky |
| Bezpečnost | sledované nežádoucí účinky, pravidlo zastavení |

## Etika a ochrana účastníků

Žádný návrh nesmí obsahovat podmínku, v níž je účastník vystaven skutečné manipulaci,
klamání o vlastní paměti nebo sociálnímu vyloučení nad rámec krátkého, vratného a etickou
komisí schváleného podnětu. Prospěch zásahu se má po skončení studie nabídnout i kontrolní
skupině. Rozhodnutí patří etické komisi ([IRB protokol](@/kompendium/research-methodology/IRB-protocol-design-EA.md))
a řídí se [etickým kodexem výzkumníka](@/kompendium/08-prilohy/eticky-kodex.md).

## Časté chyby

- čekací listina u populace, která pomoc potřebuje hned;
- výsledek měřený jen bezprostředně po zásahu (krátkodobé zlepšení znalostí ≠ trvalá odolnost);
- měření „odolnosti“ testem, který je obsahově shodný s výukou;
- záměna statistické významnosti za praktický význam;
- vynechání nežádoucích účinků ze zprávy.

## Ilustrativní příklad

*Hypotetický návrh.* Několik středních škol se náhodně rozdělí: polovina tříd absolvuje
čtyřhodinový program o rozpoznávání manipulativních argumentačních vzorců (např.
[falešné dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md), [Gish gallop](@/glossary/gish-gallop.md)),
druhá polovina program o studijních dovednostech stejné délky. Výsledkem je schopnost
rozlišit manipulativní a nemanipulativní texty po týdnu a po šesti měsících; sekundárně se
sleduje, zda program nezvýšil plošnou nedůvěru k důvěryhodným zdrojům.

Na příkladu je vidět, co návrh dělá eticky přijatelným: žádný student není vystaven
skutečné manipulaci, ukázky argumentačních vzorců jsou krátké, oslabené a hned rozebrané,
kontrolní skupina dostane hodnotný program a po skončení studie i ten testovaný. Rodiče
a studenti dostanou srozumitelnou informaci, studenti mohou odmítnout účast na měření
a výsledky se hlásí za třídy, nikoli za jednotlivce. Pokud by měření po šesti měsících
ukázalo, že program zvýšil nedůvěru k důvěryhodným zdrojům, je to výsledek stejně důležitý
jako zlepšení v rozpoznávání – a musí se zveřejnit.

## Jak číst studii tohoto typu

Označení „randomizovaná studie“ propůjčuje výsledku autoritu, kterou ne každá RCT unese.
Čtenář z praxe by měl zkontrolovat zejména:

- **S čím se srovnávalo.** Program, který porazí čekací listinu, prokázal hlavně to, že je
  lepší než nic. Srovnání s aktivní kontrolou stejné délky je přísnější a v oboru vzácnější.
- **Co přesně se měřilo.** U programů proti manipulaci se často měří schopnost rozpoznat
  manipulativní text v testu, který je podobný výukovým materiálům. To je blízký přenos.
  Vzdálený přenos – chování v reálném vztahu, skupině nebo na sociální síti – se měří
  zřídka a obvykle vychází slaběji.
- **Jak dlouho účinek trval.** Odolnost získaná „očkováním“ může v čase slábnout; studie
  bez pozdějšího měření o trvání nic neříká.
- **Zda se sledovala nežádoucí rozlišovací chyba.** Program má zlepšit rozlišování
  manipulativních a nemanipulativních sdělení, ne jen zvýšit podezíravost ke všem.
  Dobrá studie hlásí obě složky zvlášť: zda účastníci lépe odhalí manipulaci a zda
  přitom neodmítají i důvěryhodná sdělení.
- **Kdo studii provedl.** Vývojáři programu hodnotící vlastní program dosahují v mnoha
  oborech vyšších účinků než nezávislé týmy.
- **Zda byl primární výsledek předem stanoven** a zda zpráva hlásí výsledek, který byl
  registrován, nikoli ten, který vyšel nejlépe.

Výsledek jedné RCT je dobrý důvod k dalšímu výzkumu, ne k plošnému zavedení programu.
Pro rozhodnutí o zavedení jsou vhodnější souhrny více studií (viz
[metaanalýza](@/kompendium/research-methodology/meta-analysis-EA.md)).

## Meze a otevřené otázky

RCT odpoví, zda zásah v průměru pomáhá, ale ne, proč a komu. Jádro fenoménu – dlouhodobou
manipulaci ve vztazích a skupinách – nelze experimentálně studovat vůbec; zde zůstává
[observační výzkum](@/kompendium/research-methodology/longitudinal-study-EA.md) a kvalitativní
práce. K tomu, jak riziko nadměrných zásahů hodnotit, viz
[iatrogenní účinky intervencí](@/kompendium/critical-perspectives/11-iatrogenic-overreach.md).

## Literatura

- McGuire, W. J. (1961). Resistance to persuasion conferred by active and passive prior refutation of the same and alternative counterarguments.
- Roozenbeek, J., van der Linden, S. (2019). Fake news game confers psychological resistance against online misinformation.
- Loftus, E. F., Palmer, J. C. (1974). Reconstruction of automobile destruction.
- Hasher, L., Goldstein, D., Toppino, T. (1977). Frequency and the conference of referential validity.
- Schulz, K. F., Altman, D. G., Moher, D. (2010). CONSORT 2010 Statement.

## Související

**Metody v této sekci**

- [Kauzální inference](@/kompendium/research-methodology/causal-inference-EA.md) – závěry tam, kde randomizovat nelze.
- [Velikost účinku](@/kompendium/research-methodology/effect-size-EA.md) – jak hlásit, co zásah změnil.
- [Debriefing](@/kompendium/research-methodology/debriefing-protocol-research.md) – po každém experimentálním podnětu.

**Etika**

- [IRB protokol](@/kompendium/research-methodology/IRB-protocol-design-EA.md) – posouzení rizika a přínosu.
- [Iatrogenní účinky intervencí](@/kompendium/critical-perspectives/11-iatrogenic-overreach.md) – když ochrana škodí.

**Prevence**

- [Kurikulum kritického myšlení](@/kompendium/prevention-resilience/8-critical-thinking-curriculum.md) – typický testovaný zásah.
- [Programy mediální gramotnosti](@/kompendium/population-health/15-media-literacy-program.md) – populační rovina.

**Pojmy**

- [Iatrogenní poškození](@/glossary/iatrogenic-harm.md) – škoda způsobená samotnou péčí či výzkumem.
