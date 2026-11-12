+++
title = "EA-2.4 Falešný konsensus"
weight = 100
description = "Vzorec, v němž se vytváří zdání široké shody („všichni přece vědí“), které nevzniklo kritickou argumentací. Znaky, odlišení od skutečného konsenzu, obrana."

[taxonomies]
tags = ["kompendium", "techniques", "ea-2-4", "konsenzus", "delegitimizace"]

[extra]
category = "kompendium-technique"
related_terms = ["ea-2-1-9-pseudo-konsenzus-vytvoreni", "ea-2-4-6-peer-review-capture", "ea-2-4-8-journal-capture", "ea-2-3-4-mob-coordination", "ea-1-2-2-falesna-ekvivalence", "ea-1-5-1-emocni-podbarveni"]
ea_code = "EA-2.4"
ea_category = "2. Scénáře delegitimizace"
ea_subcategory = "2.4 Institucionální zachycení"
parent_chapter = "/kompendium/03-zakladni-kategorie/kapitola-2/"
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
+++

# EA-2.4 Falešný konsensus

| Pole | Hodnota |
|------|---------|
| **EA kód** | `EA-2.4` (souhrnný vzorec subkategorie institucionálního zachycení) |
| **Kategorie** | 2. Scénáře [delegitimizace](@/glossary/delegitimizace.md) |
| **Subkategorie** | 2.4 Institucionální zachycení |
| **Riziková úroveň** | Vysoká; dopadá na celé obory a komunity |
| **Reverzibilita** | Nízká až střední; zdání shody se udržuje samo |
| **Rodičovská kapitola** | [3.2 Scénáře epistemické delegitimizace](@/kompendium/03-zakladni-kategorie/kapitola-2.md) |

## Definice

**Falešný konsensus** je vzorec, v němž se vytváří a udržuje **zdání široké shody** –
„všichni vědí“, „o tom už se nediskutuje“, „tak se to dělá“ – které nevzniklo tak, jak
skutečný konsenzus vzniká: nezávislým zkoumáním, kritickou argumentací a otevřenou
možností nesouhlasu. Zdání shody pak slouží jako argument samo o sobě a umlčuje ty, kdo
by o věci pochybovali.

Kód EA-2.4 tu označuje souhrnný vzorec subkategorie **institucionálního zachycení**.
Jednotlivé techniky subkategorie – ovládnutí rad, recenzního řízení, časopisů, konferencí
a kurikul ([EA-2.4.1](@/kompendium/techniques/ea-2-4-1-board-capture.md) a další) – jsou prostředky; falešný konsensus je jejich společný
výsledek: instituce, které mají shodu **zjišťovat**, ji začnou **vyrábět**.

Pojem je třeba odlišit od *false consensus effect* sociální psychologie (Ross, Greene
a House, 1977), který označuje sklon přeceňovat, kolik lidí sdílí náš názor. Ten je
spontánním zkreslením jednotlivce; v Kompendiu jde o zdání shody vytvářené zvenčí.

## Filozofické zázemí

Dvě teoretické reflexe Kompendia vzorec popisují ze dvou stran. [Wittgenstein](@/kompendium/07-teoreticke-reflexe/wittgenstein-jezykove-hry.md)
ukazuje, že falešný konsensus **importuje pravidla jedné jazykové hry do jiné**: slovo
„konsenzus“ má v akademické diskusi význam shody po kritické argumentaci, v politické
nebo skupinové hře znamená „většina mlčí“. [Heidegger](@/kompendium/07-teoreticke-reflexe/heidegger-byt-ve-svete.md)
popisuje anonymní *das Man* – „to se říká“, „tak se to dělá“ –, jehož autorita nemá
nositele, a proto se jí nedá oponovat.

## Mechanismus (strukturní popis)

1. **Kontrola uzlů.** Místa, kde se shoda zjišťuje a ohlašuje (komise, redakce, recenze,
   programové výbory, kurikula), obsadí jedna skupina; viz [ovládnutí recenzního řízení](@/kompendium/techniques/ea-2-4-6-peer-review-capture.md)
   a [ovládnutí časopisů](@/kompendium/techniques/ea-2-4-8-journal-capture.md).
2. **Opakování z mnoha úst.** Tatáž teze zazní z mnoha zdánlivě nezávislých zdrojů, které
   ve skutečnosti citují jeden druhého ([cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md),
   [asymetrie amplifikace](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md)).
3. **Umlčení nesouhlasu.** Nesouhlasící jsou označeni za okrajové, nekompetentní nebo
   nebezpečné; jejich hlas mizí z veřejného prostoru. Elisabeth Noelle-Neumannová (1974)
   popsala „spirálu mlčení“: kdo vnímá svůj názor jako menšinový, spíše mlčí, a tím
   zdání většiny posiluje.
4. **Mnohočetná nevědomost.** Mnozí soukromě pochybují, ale každý se domnívá, že
   pochybuje sám (*pluralistic ignorance*; srov. Prentice a Miller, 1993).
5. **Konformní tlak.** Pokusy Solomona Asche (1951, 1956) ukázaly, že část lidí se
   veřejně přizpůsobí jednomyslné většině i ve zjevně chybném úsudku.
6. **Shoda jako argument.** Nakonec se místo důvodů uvádí sama shoda: „to je konsenzus“.

Na sociálních sítích se týž vzorec vytváří technicky – koordinací účtů, botů
a placených hlasů ([koordinace botů](@/kompendium/detection-signatures/20-network-bot-coordination.md));
označuje se jako *astroturfing*.

## Fenomenologické znaky (pohled zevnitř)

| Znak | Jak ho člověk popisuje |
|---|---|
| Osamělost pochybnosti | „Jsem jediný, kdo to vidí jinak?“ |
| Strach z vyslovení | Nesouhlas říká jen v soukromí. |
| Pochybnost o vlastní kompetenci | „Když to tvrdí všichni, asi tomu nerozumím.“ |
| Úleva při setkání s pochybujícím | „Takže nejsem sám.“ |

## Detekční markery (pohled pozorovatele)

| Marker | Co může naznačovat |
|---|---|
| Shoda se uvádí místo důvodů | Shoda jako argument |
| Zdroje, které shodu dokládají, mají společný původ | Opakování z mnoha úst |
| Nesouhlasící jsou známi jménem, ale nikdy nejsou citováni věcně | Umlčení |
| Anonymní ankety ukazují jiný obraz než veřejná vyjádření | Mnohočetná nevědomost |
| Instituce, která shodu ohlašuje, je obsazena jednou skupinou | Kontrola uzlů |
| Náhlý souběh shodných vyjádření v krátkém čase | Koordinace; srov. [platformní koordinaci](@/kompendium/detection-signatures/21-network-platform-coordination.md) |

## Rizikové kontexty

Vědecké obory s malým počtem rozhodujících institucí, profesní komory a odborné
společnosti, firemní kultury s jedním výkladem strategie, politické strany a hnutí,
uzavřené komunity a sociální sítě, kde algoritmus zesiluje dominantní hlas.

## Odlišení

- **Skutečný vědecký konsenzus.** Vzniká z nezávislých linií důkazů, je doložitelný
  (přehledové studie, metaanalýzy), má otevřené kanály pro nesouhlas a mění se, když se
  změní důkazy. Zpochybňovat ho bez důvodů je [indukovaná pochybnost](@/kompendium/techniques/ea-1-3-4-indukovana-pochybnost.md),
  nikoli obrana proti falešnému konsenzu.
- **Sdílené normy.** Komunita smí mít společné hodnoty a postupy; vzorcem se stávají,
  když se vydávají za fakta a nesouhlas s nimi je trestán.
- **[EA-2.1.9 Vytvoření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md).**
  Cílená technika proti jednomu expertovi; EA-2.4 popisuje strukturní stav instituce.
- **[Falešná ekvivalence](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md).**
  Opačná chyba: menšinový názor se staví na roveň konsenzu.

## Klinický a právní rámec

Klinicky se vzorec ukazuje u lidí, kteří se cítí izolováni ve svém nesouhlasu – zvlášť
v profesi nebo komunitě, na níž závisí jejich obživa a identita. Je třeba rozlišit
skutečnou izolaci od paranoidního prožívání; pomáhá zjistit, zda existují další lidé se
stejnými pochybnostmi a jaká jsou dostupná fakta o institucích.

Právně může být relevantní ochrana oznamovatelů ([mechanismus oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md)),
pravidla střetu zájmů v institucích a v krajních případech postupy proti koordinovaným
vlivovým operacím.

## Obrana a neutralizace

**Pro jednotlivce.** Ptát se, jak shoda vznikla, ne jen zda existuje: kdo ji zjistil,
jaké jsou nezávislé zdroje, kde se lze s nesouhlasem setkat. Hledat lidi, kteří sdílejí
pochybnost, a ověřit ji věcně. Diverzifikovat zdroje ([diverzifikace sítě](@/kompendium/self-defense-guides/25-network-diversification.md),
[triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)).

**Pro instituce.** Rotace rolí v komisích a redakcích, transparentní pravidla střetu
zájmů ([politika střetu zájmů](@/kompendium/organizational-defense/3-conflict-of-interest-policy.md)),
anonymní zpětná vazba ([anonymní zpětná vazba](@/kompendium/organizational-defense/14-anonymous-feedback.md)),
zveřejňování menšinových stanovisek a ochrana lidí, kteří je vyslovují.

## Zotavení

Kdo byl dlouho jediným nesouhlasícím hlasem, bývá vyčerpaný a nedůvěřuje vlastnímu
úsudku – nebo naopak nedůvěřuje jakékoli shodě. Cílem je obnovit **rozlišení**: některé
shody jsou skutečné a zaslouží důvěru, jiné jsou vyrobené. Pomáhá komunita lidí, kteří
uvažují nezávisle ([formace epistemické komunity](@/kompendium/techniques/ea-3-1-4-epistemic-community-formation.md)).

## Případy, které vzorec ukazují

[Lysenkismus](@/kompendium/historical-cases/31-lysenko.md) (ideologicky vynucená shoda
ve vědě), [Československá normalizace](@/kompendium/historical-cases/6-czechoslovak-normalizace.md)
(veřejná shoda při soukromém nesouhlasu), [Internet Research Agency](@/kompendium/historical-cases/22-russian-ira.md)
(technicky vyráběné zdání většiny) a kazuistika [kultu výzkumné disciplíny](@/kompendium/case-studies/67-research-discipline-cult.md).

## Literatura

- Asch, S. E. (1956). Studies of independence and conformity. *Psychological Monographs*.
- Noelle-Neumann, E. (1974). The spiral of silence: A theory of public opinion.
  *Journal of Communication*.
- Ross, L., Greene, D., & House, P. (1977). The „false consensus effect“. *Journal of
  Experimental Social Psychology*.
- Prentice, D. A., & Miller, D. T. (1993). Pluralistic ignorance and alcohol use on
  campus. *Journal of Personality and Social Psychology*.

## Související

**Techniky subkategorie 2.4**

- [EA-2.4.6 Ovládnutí recenzního řízení](@/kompendium/techniques/ea-2-4-6-peer-review-capture.md)
  – shoda vyrobená v hodnocení.
- [EA-2.4.8 Ovládnutí časopisu](@/kompendium/techniques/ea-2-4-8-journal-capture.md) –
  shoda vyrobená v publikaci.
- [EA-2.4.7 Ovládnutí konference](@/kompendium/techniques/ea-2-4-7-conference-capture.md)
  – kdo smí promluvit.

**Příbuzné techniky**

- [EA-2.1.9 Vytvoření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md)
  – shoda proti jednomu expertovi.
- [EA-1.5.1 Emoční podbarvení](@/kompendium/techniques/ea-1-5-1-emocni-podbarveni.md) –
  sdílená emoce místo sdíleného důvodu.

**Teorie**

- [Wittgenstein: Jazykové hry](@/kompendium/07-teoreticke-reflexe/wittgenstein-jezykove-hry.md)
  – import pravidel z jiné hry.
- [Heidegger: Být-ve-světě](@/kompendium/07-teoreticke-reflexe/heidegger-byt-ve-svete.md)
  – anonymní autorita *das Man*.

**Detekce a obrana**

- [Detekční signatura: Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md)
  – zdroje, které se navzájem potvrzují.
- [Diverzifikace sítě](@/kompendium/self-defense-guides/25-network-diversification.md) –
  slyšet i jiné hlasy.
