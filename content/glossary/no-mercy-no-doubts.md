+++
title = "No Mercy, No Doubts (bez slitování, bez pochybností)"
weight = 3
description = "Univerzální doktrína Prismatic Platform: nulová tolerance k nedokončené práci spojená s úplným šetřením před rozhodným jednáním."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "quality", "evidence"]

[extra]
category = "doctrine"
abbreviation = "NM/ND"
date_created = "2026-02-13"
last_updated = "2026-02-13"
author = "Tomáš Korcak (korczis)"
reading_time = "8 min"
word_count = 2200
difficulty = "intermediate"
related_terms = ["no-mercy", "no-doubts", "nm-nd", "violation-protocol", "clean-run", "regression-test", "aiad", "archer-supreme", "confidence-threshold", "pre-commit-hooks", "session-discipline", "nabla-infinity", "trinity-gate", "quality-gates", "qdp", "zero-warning-policy"]
date_modified = "2026-11-10"
keywords = ["Mercy", "Doubts", "Prismatic", "Platform", "glossary", "doctrine", "Prismatic Platform", "Every"]
quality_score = 90
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "No Mercy, No Doubts (bez slitování, bez pochybností) – glosář"
+++

## Definice

*No Mercy, No Doubts* (NM/ND, „bez slitování, bez pochybností“) je univerzální doktrína, která
řídí každou operaci v Prismatic Platform. Skládá se ze dvou doplňujících se ramen vynucení:
**NO MERCY** předepisuje nulovou toleranci k nedokončeným implementacím, netestovanému kódu,
porušením kvality a odkládaným opravám; **NO DOUBTS** vyžaduje úplné šetření a porozumění
opřené o důkazy před jednáním a po rozhodnutí rozhodnou a oddanou exekuci. Doktrína je
zařazena na úroveň 3 a platí bez výjimky pro veškerý kód, všechny agenty, všechny pipeline
a všechna sezení. Obchvat neexistuje. Neexistuje „opravíme později“, „zatím to stačí“
ani jednání bez ověřené důvěry. Organizační stránku (fáze, matice požadavků, bloky vynucení)
shrnuje souběžné heslo [Doktrína NM/ND](@/glossary/nm-nd.md).

Doktrína není soubor doporučení ani aspirační zásady. Je to rámec vynucení s automatizovanými
nástroji – pre-commit hooky, branami kvality, CI pipeline a kontrolami souladu agentů –,
který nevyhovující práci nepustí do kódové základny. Dokumentace platformy jí přímo připisuje
trvalý soulad ve 22 pilířích doktríny napříč 13 oblastmi kvality (údaje v době zápisu).

Pro Kompendium patří heslo do kontextu platformy, z níž kniha vzešla; kniha z doktríny
přebírá požadavek ověřených výstupů (žádný nefunkční odkaz, žádný vymyšlený zdroj), nikoli
její rétoriku vůči lidem.

## Historický kontext a motivace

Doktrína NM/ND vzešla z prostého pozorování: dluh kvality roste rychleji než finanční dluh
a odložené opravy jsou o řád dražší než okamžité. Rané iterace Prismatic Platform
připouštěly značky „TODO“, zástupné implementace a odložené pokrytí testy – postupy běžné
ve většině softwarových projektů. Výsledek byl předvídatelný: nahromaděný technický dluh,
který na údržbě spotřeboval víc inženýrského času, než původní implementace ušetřily
rychlostí.

Doktrína byla formalizována jako odpověď na tento vzorec. Místo řízení [dluhu
kvality](@/glossary/quality-debt.md) periodickými úklidovými sprinty přijala platforma
politiku nulové tolerance. Každá implementace je úplná, nebo se nesloučí. Každá oprava chyby
obsahuje [regresní test](@/glossary/regression-test.md), nebo je odmítnuta. Každá kompilace
vyprodukuje nula varování, nebo je commit zablokován. Tento přístup úplně odstraňuje
kategorii „známých problémů“ – je-li problém známý, opraví se okamžitě.

Složka NO DOUBTS byla přidána, aby zabránila opačnému selhání: předčasnému jednání na
základě neúplného porozumění. Nulovou toleranci k nedokončené práci je třeba spojit
s důkladným šetřením, jinak vývojáři dokonale implementují špatné řešení. NO DOUBTS zajišťuje,
že fáze zkoumání je důkladná, opřená o důkazy a podmíněná dosažením důvěry dřív, než začne
fáze vynucení.

## Filosofická východiska

Doktrína NM/ND čerpá z několika intelektuálních tradic, ale nečiní si nárok na filosofickou
novost. Její hodnota je v důsledném uplatnění, ne v původní teorii.

Ze **stoické filosofie** přebírá zásadu, že výtečnost není čin, ale návyk. Marcus Aurelius
v *Hovorech k sobě* píše: „Nepromarni už žádný čas dohady o tom, jaký má být dobrý člověk.
Buď jím.“ Doktrína to převádí do inženýrských pojmů: nemarnit čas debatami o tom, jaký má
být dobrý kód – vynutit ho automaticky. Pre-commit hook nediskutuje; blokuje.

Z **štíhlé výroby** (*lean manufacturing*) přebírá pojem *jidoka* (autonomace) – zásadu, že
vady kvality se mají odhalit a zastavit v místě vzniku, ne dál v řetězci. V produkčním
systému Toyoty může kterýkoli pracovník zastavit montážní linku, když zjistí vadu.
V Prismatic Platform může kterákoli [brána
kvality](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/)
zastavit commit, když zjistí porušení. Cena zastavení je vždy nižší než cena šíření vady.

Z **vojenské doktríny** přebírá zásadu „záměru velitele“ (*commander's intent*) – jasného
vyjádření žádoucího konečného stavu, které umožňuje samostatnou exekuci. Konečný stav
doktríny je výslovný: kvalita vynucená doktrínou, nula varování, nula dluhu, nula známých
problémů. Každý agent i každý vývojář tento záměr chápe a může k němu samostatně směřovat.

## Dvě ramena doktríny

### NO MERCY – vynucení

[NO MERCY](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-mercy/) řídí
dodávání veškerého kódu a artefaktů v platformě. Jeho požadavky jsou absolutní:

- **Nulová tolerance**: žádné nedokončené implementace, žádné stuby, žádné mocky jako trvalé
  součásti, žádný zástupný kód, žádné značky TODO ani poznámky FIXME. Co je napsané, je
  hotové.
- **100% pokrytí testy**: veškerý kód musí mít úplné testy – jednotkové, integrační
  a tam, kde to dává smysl, testy založené na vlastnostech. Pokrytí se měří a vynucuje,
  neodhaduje.
- **Připraveno do produkce od vzniku**: každý řádek kódu má produkční kvalitu od chvíle, kdy
  je napsán. Rozlišení „vývojové“ a „produkční“ kvality neexistuje.
- **Okamžitá náprava**: problémy objevené při vývoji, přezkumu nebo za běhu se musí opravit
  okamžitě. Neexistuje backlog známých vad.
- **Povinné regresní testy**: každá oprava chyby musí obsahovat regresní testy, které by
  původní chybu zachytily. Požadavek vynucují pre-commit hooky a nemá obchvat.
- **Čistý běh** ([Clean Run](@/glossary/clean-run.md)): každá kompilace musí vyprodukovat nula
  varování (vynuceno přes `--warnings-as-errors`), všechny brány kvality musí projít a všechny
  nástroje statické analýzy (Credo, Dialyzer) musí hlásit čistý stav.

Vynucení není doporučující. Pre-commit hooky blokují commity, které porušují kterékoli
pravidlo NO MERCY. CI pipeline odmítají pull requesty, které neprojdou branami kvality.
Platforma nerozlišuje „kritická“ a „drobná“ porušení – všechna porušení blokují.

### NO DOUBTS – epistemická přísnost

[NO DOUBTS](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-doubts/) řídí
rozhodovací proces, který jednání předchází. Jeho požadavky doplňují NO MERCY tím, že
zajišťují vyřešení správného problému dřív, než se požaduje úplnost řešení:

- **Úplné šetření**: před každou změnou musí vývojář nebo agent plně pochopit problém, jeho
  kořenovou příčinu, rozsah a důsledky. Povrchní analýza nestačí.
- **Jednání opřené o důkazy**: každé rozhodnutí musí být podloženo testy, benchmarky,
  profilováním nebo formálním ověřením. Tvrzení bez důkazů se berou jako neověřené
  hypotézy, ne jako fakta.
- **Podmínění důvěrou**: přechod od zkoumání k exekuci nastává teprve tehdy, když důvěra
  dosáhne prahu 0,95 a [Trinity Gate](@/glossary/trinity-gate.md) projde všemi třemi
  ověřovacími vrstvami (strukturní konzistence, logická konzistence a formální nutnost).
- **Žádná neověřená tvrzení**: všechny výstupy se před dodáním ověří. Tvrzení o zlepšení
  výkonu musí obsahovat benchmarky. Tvrzení o opravě chyby musí obsahovat regresní testy.
  Tvrzení o bezpečnosti musí obsahovat ověření.
- **Rozhodný závazek**: jakmile je šetření dokončeno a důvěra stanovena, exekuce probíhá
  s plným nasazením a bez dodatečného zpochybňování. Váhání po dosažení prahu důvěry je samo
  porušením.

Souhra obou ramen brání oběma selháním: NO MERCY brání neúplné dodávce a NO DOUBTS brání
tomu, aby se úplně dodalo něco špatného.

## Napojení na NABLA Infinity

Doktrína NM/ND působí ve spojení s epistemickým rámcem [NABLA
Infinity](@/glossary/nabla-infinity.md). NABLA řídí fázi zkoumání a tvorby hypotéz, NM/ND fázi
exekuce a dodání. Přechod mezi nimi je formalizován:

```
EXPLORATION (NABLA: maps uncertainty, preserves contradictions, forms hypotheses)
        |
    confidence >= 0.95 AND trinity_gate.passed AND axioms_compliant
        |
EXECUTION (NM/ND: decisive action, complete delivery, zero tolerance)
```

Ve fázi NABLA je [zachování
rozporu](https://prismatic-reality-com.github.io/prismatic-promo/glossary/contradiction-preservation/)
povinné – protichůdné důkazy se udržují a předčasně neřeší. Paralelně se zkoumá více
hypotéz. Nejistota se mapuje výslovně a neskrývá se za falešnou jistotou. Tuto fázi řídí
sedm [axiomů NABLA](@/glossary/nabla-axioms.md) ([pluralita signálů](@/glossary/signal-plurality.md), zachování rozporu,
informativní absence, časový rozpad, platnost neznáma, nezávislost zdrojů, [povinná
provenience](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/)).

Přechod k exekuci NM/ND nastává teprve tehdy, když důvěra překročí práh 0,95 a Trinity Gate
potvrdí závěr třemi nezávislými ověřovacími metodami. Jakmile k přechodu dojde, platí pravidla
NM/ND v plném rozsahu: implementace musí být úplná, otestovaná, zdokumentovaná a připravená
do produkce.

Dvoufázový přístup brání běžnému antivzorci vývoje, kdy vývojáři kmitají mezi šetřením
a implementací bez jasných hranic. V Prismatic Platform je hranice výslovná, měřitelná
a vynucená.

## Protokol porušení

Porušení doktríny NM/ND se třídí do čtyř úrovní závažnosti se stupňujícími se důsledky
(podrobně [Violation Protocol](@/glossary/violation-protocol.md)):

| Úroveň | Popis | Spouštěč | Důsledek |
|-------|-------------|---------|-------------|
| **L1** | drobná odchylka | porušení stylu, chybějící komentář | varování, nutná okamžitá oprava |
| **L2** | porušení kvality | chybějící test, varování při kompilaci | commit zablokován, před novým pokusem povinná oprava |
| **L3** | neúplná dodávka | stub, zástupný kód | commit odmítnut, implementace znovu od začátku |
| **L4** | kompromitováno pochybností | jednání bez důkazů, neověřené tvrzení | commit odmítnut, zahájen Supreme Review |

Protokol porušení se vynucuje automaticky pre-commit hooky, branami CI pipeline a kontrolami
souladu agentů. Porušení L1 a L2 může vyřešit sám vývojář. Porušení L3 vyžaduje novou
implementaci. Porušení L4 spouští eskalaci k přezkumu na úrovni Supreme, protože ukazuje na
zásadní selhání procesu, ne na mezeru v implementaci.

Z protokolu porušení nejsou výjimky. Obrat „jen tentokrát“ v rámci NM/ND neexistuje. Nouzové
hotfixy, časově kritické záplaty i funkce hnané termínem dostávají totéž vynucení.
Zdůvodnění je prosté: v nouzi záleží na disciplíně kvality nejvíc, protože uspěchané opravy
pod tlakem jsou hlavním zdrojem kaskádových selhání.

## Vynucení u agentů

Každý agent ekosystému Prismatic Platform (v době zápisu přes 530 agentů) nese ve své
specifikaci [AIAD](@/glossary/aiad.md) povinný blok vynucení NM/ND:

```yaml
enforcement:
  doctrine: "no-mercy-no-doubts"
  version: "2.0.0"
  compliance: mandatory
```

Blok není nepovinná metadata – je to povinné pole ověřované při registraci agenta. Definice
agenta bez bloku vynucení neprojde validací AIAD a nebude zapsána do [registru
agentů](@/glossary/agent-registry.md).

Blok vynucení má dva účely. Zaprvé prohlašuje, že agent pracuje pod řízením NM/ND, takže
očekávání souladu jsou zřejmá každému, kdo specifikaci čte. Zadruhé umožňuje automatickou
kontrolu souladu: platforma může projít všechny definice agentů a ověřit, že každého řídí
aktuální verze doktríny.

Agenti všech úrovní (L1 až L5, viz [Agent Tier](@/glossary/agent-tier.md)) nesou stejný blok
vynucení. Doktrína platí jednotně bez ohledu na úroveň oprávnění agenta. Agent [Archer
Supreme](@/glossary/archer-supreme.md) úrovně L5 i taktický specialista L1 podléhají stejným
požadavkům na kvalitu.

## Automatizovaná infrastruktura vynucení

Vynucení NM/ND zajišťuje několik automatizovaných systémů, které působí v různých fázích
životního cyklu vývoje:

**Pre-commit hooky**: skript `.githooks/pre-commit` spouští kontroly kvality před vytvořením
každého commitu. Ověřuje nulová varování, spouští dotčené testy, hledá zakázané vzory (TODO,
FIXME, zástupné implementace) a ověřuje, že opravy chyb doprovázejí regresní testy. Commity,
které neprojdou kteroukoli kontrolou, se zablokují.

**Brány CI pipeline**: pipeline GitLab CI vynucují NM/ND na úrovni merge requestů. Pipeline
spouští celou sadu testů, statickou analýzu Credo, typovou kontrolu Dialyzer a ověření
pokrytí. Merge requesty, které neprojdou kteroukoli branou, nelze sloučit.

**Úloha bran kvality**: úloha `mix quality.gates` spouští jedním příkazem všechny kontroly
NM/ND za sebou. Používá se lokálně při vývoji i v CI pipeline pro automatické vynucení.

**Protokol Session Discipline**: každé vývojové sezení musí zakládat issue v GitLabu pro
sledování, commitovat často (bez dávkování), pushovat všechny commity na vzdálený repozitář,
před commitem lokálně ověřit změny a projít všemi hooky bez přepínačů obchvatu. Přepínač
`--no-verify` je absolutně zakázán (viz [Session Discipline](@/glossary/session-discipline.md)).

**Quality Floor Guardian**: autonomní monitorovací systém, který sleduje metriky kvality ve
všech 13 oblastech. Klesne-li kvalita pod práh vynucený doktrínou, strážce spustí procesy
samoopravy ([AutoHeal](@/glossary/autoheal.md)) a eskaluje na příslušnou úroveň.

## Implementace v Elixiru

Infrastruktura vynucení doktríny NM/ND je sama implementována jako aplikace
[OTP](https://prismatic-reality-com.github.io/prismatic-promo/glossary/otp/) v platformě:

```elixir
defmodule PrismaticSafety.DoctrineEnforcer do
  @moduledoc """
  Runtime enforcement of the NO MERCY, NO DOUBTS doctrine.
  Validates agent outputs, pipeline results, and system state
  against doctrine requirements.
  """

  use GenServer

  @type enforcement_result :: :compliant | {:violation, violation_level(), String.t()}
  @type violation_level :: :l1 | :l2 | :l3 | :l4

  @spec check_compliance(map()) :: enforcement_result()
  def check_compliance(artifact) do
    checks = [
      &check_completeness/1,
      &check_test_coverage/1,
      &check_forbidden_patterns/1,
      &check_warning_free/1,
      &check_provenance/1
    ]

    Enum.reduce_while(checks, :compliant, fn check, _acc ->
      case check.(artifact) do
        :pass -> {:cont, :compliant}
        {:fail, level, reason} -> {:halt, {:violation, level, reason}}
      end
    end)
  end

  @spec enforce!(map()) :: :ok | no_return()
  def enforce!(artifact) do
    case check_compliance(artifact) do
      :compliant -> :ok
      {:violation, level, reason} ->
        :telemetry.execute(
          [:prismatic, :doctrine, :violation],
          %{level: level},
          %{reason: reason, artifact: artifact.id}
        )
        raise PrismaticSafety.DoctrineViolation,
          level: level,
          reason: reason,
          artifact: artifact
    end
  end

  defp check_completeness(artifact) do
    cond do
      has_stubs?(artifact) -> {:fail, :l3, "Contains stub implementations"}
      has_placeholders?(artifact) -> {:fail, :l3, "Contains placeholder code"}
      has_todos?(artifact) -> {:fail, :l2, "Contains TODO markers"}
      true -> :pass
    end
  end
end
```

## Praktický dopad

Dokumentace platformy v době zápisu uváděla tyto účinky doktríny na metriky kvality:

- **Skóre kvality**: kvalita vynucená doktrínou ve všech 13 oblastech, udržovaná průběžně.
- **Dluh kvality**: 0 [QDP](@/glossary/qdp.md) (bodů dluhu kvality) – úplné odstranění
  nahromaděného dluhu.
- **Kompilace**: nula varování napříč 115 aplikacemi OTP.
- **Statická analýza**: nula porušení Credo, nula porušení Dialyzer.
- **Pokrytí testy**: úplné pokrytí s povinnými regresními testy u každé opravy chyby.
- **Běh**: nula známých vad v aktivní kódové základně.
- **Soulad agentů**: 530 z 530 agentů s povinným blokem vynucení.

Tyto metriky nejsou aspirační cíle – jsou to vynucené invarianty. Každá regrese spouští
okamžitou automatickou reakci prostřednictvím Quality Floor Guardian a pre-commitové ochrany.

## NM/ND ve vývojovém postupu

Typické vývojové sezení pod řízením NM/ND probíhá takto:

1. **Začátek sezení**: založit issue v GitLabu pro sledování. Načíst kontext z předchozího
   sezení.
2. **Šetření (NO DOUBTS)**: přečíst relevantní kód. Pochopit problém. Vytvořit hypotézy.
   Ověřit předpoklady testy a analýzou.
3. **Kontrola důvěry**: dosáhla důvěra 0,95? Projde řešení Trinity Gate? Pokud ne, šetření
   pokračuje.
4. **Implementace (NO MERCY)**: napsat úplný kód připravený do produkce. Zahrnout všechny
   testy. Dosáhnout nuly varování.
5. **Ověření**: spustit `mix quality.gates`. Spustit dotčené testy. Ověřit nulu varování při
   kompilaci.
6. **Commit**: pre-commit hooky ověří soulad. Okamžitě pushnout.
7. **Konec sezení**: zajistit, že jsou pushnuty všechny commity. Uložit kontext sezení.
   Aktualizovat issue v GitLabu.

Postup činí přechod NM/ND výslovným. Kroky 2–3 probíhají pod řízením NO DOUBTS (důkladné
šetření, sběr důkazů). Kroky 4–6 pod řízením NO MERCY (úplná implementace, nulová tolerance).
Přechodem mezi nimi je kontrola důvěry v kroku 3.

## Časté omyly

**„NM/ND zpomaluje vývoj.“** V praxi platí opak. Odstraněním kategorie odložených oprav
a známých problémů NM/ND ruší režii jejich sledování, třídění a konečného opravování. Cena se
platí předem, v době implementace, kdy je kontext čerstvý a oprava nejlevnější.

**„NM/ND se týká jen kvality kódu.“** NM/ND řídí veškerý provoz platformy včetně dokumentace,
správy sezení, definic agentů a nasazovacích procesů. Působnost doktríny se vztahuje na
každý artefakt, který vstupuje do verzovaných repozitářů platformy.

**„NO DOUBTS znamená paralýzu analýzou.“** NO DOUBTS vyžaduje důkladné šetření, ale také
rozhodné jednání, jakmile je důvěra stanovena. Práh důvěry (0,95) a Trinity Gate dávají
výslovný a měřitelný bod přechodu. Jakmile je dosažen, je váhání samo porušením (srov.
[Paralysis by Analysis](@/glossary/paralysis-by-analysis.md)).

**„NM/ND je příliš rigidní pro experimentování.“** Fáze zkoumání NABLA výslovně podporuje
nejistotu, rozpory a více hypotéz. NM/ND platí až poté, co fáze zkoumání dosáhne důvěry.
Experimentuje se pod řízením NABLA, dodává se pod řízením NM/ND.

**„NM/ND vyžaduje nadlidské vývojáře.“** NM/ND se vynucuje nástroji, ne vůlí. Pre-commit
hooky, brány kvality a CI pipeline zajišťují soulad automaticky. Vývojáři si nemusí
pamatovat každé pravidlo – nástroje zachytí porušení dřív, než vstoupí do kódové základny.

## Meze přenosu na lidi

Doktrína se týká artefaktů, jejichž správnost lze strojově ověřit. Kompendium upozorňuje, že
přenesena na lidi by se změnila v opak své epistemické části: zákaz pochybností po
„dosažení prahu“, „žádné výjimky“ a eskalace k nejvyšší autoritě jsou v lidských skupinách
typickými znaky kontroly myšlení (viz [model BITE](@/glossary/bite-model.md), [Thought
Stopping](@/glossary/thought-stopping.md)). U lidí platí opačná zásada knihy: pochybnost
o vlastním poznání má zůstat dovolená vždy (srov. [epistemická
pokora](@/glossary/epistemicka-pokora.md)).

## Související

**Pojmy platformy v tomto glosáři**

- [Doktrína NM/ND](@/glossary/nm-nd.md) – organizační a technický přehled doktríny.
- [Violation Protocol](@/glossary/violation-protocol.md) – úrovně eskalace L1–L4.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec fáze zkoumání.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací brána přechodu z NABLA do NM/ND.
- [AIAD](@/glossary/aiad.md) – standard specifikace agentů s povinným blokem vynucení.
- [Clean Run](@/glossary/clean-run.md) – stav kompilace a testů, který NO MERCY vyžaduje.
- [Regression Test](@/glossary/regression-test.md) – povinný test ke každé opravě chyby.

**Hesla a přehledy platformy mimo tuto knihu**

- [NO MERCY](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-mercy/),
  [NO DOUBTS](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-doubts/),
  [Quality Gates](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/),
  [Confidence Threshold](https://prismatic-reality-com.github.io/prismatic-promo/glossary/confidence-threshold/),
  [Provenance Mandatory](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/) –
  ramena doktríny, pipeline vynucení, práh 0,95 a axiom dohledatelnosti.
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Schopnosti platformy](https://prismatic-reality-com.github.io/prismatic-promo/capabilities/),
  [Aplikace](https://prismatic-reality-com.github.io/prismatic-promo/apps/),
  [Registr agentů](https://prismatic-reality-com.github.io/prismatic-promo/agents/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/) –
  přehledy platformy.

**Kniha**

- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – co
  kniha z platformy přebírá.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
