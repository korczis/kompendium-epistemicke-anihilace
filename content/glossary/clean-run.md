+++
title = "Clean Run (čistý běh)"
weight = 5
description = "Standard Prismatic Platform: nula varování za běhu, žádné zbytečné ladicí logy a kompilace s --warnings-as-errors v celé platformě, aby skutečná varování nezanikla v šumu."

[taxonomies]
tags = ["glossary", "doctrine", "clean-run", "prismatic", "quality"]

[extra]
category = "doctrine"
related_terms = ["cascade", "cascade-pattern", "qdp", "dialyzer", "typespec", "autoevolve", "autoheal", "code-coverage", "property-based-testing", "mix", "supervisor"]
platform_relevance = "critical"
complexity = "intermediate"
domain = "quality-enforcement"
layer = "compilation-and-runtime"
paradigm = "zero-tolerance"
doctrine = "no-mercy-no-doubts"
enforcement_level = "absolute"
prismatic_usage = "compilation-standard, ci-gate, pre-commit-enforcement"
quality_impact = "foundational"
safety_level = "p0-absolute"
documentation_required = true
testing_strategy = "compile-time-and-runtime-validation"
current_status = "100-percent-compliant"
quality_score = "doctrine-enforced"
quality_domains_clean = "13/13"
compiler_warnings = "0"
credo_violations = "0"
dialyzer_violations = "0"
related_apps = ["prismatic_safety", "prismatic_claude", "prismatic"]
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-10"
+++

## Definice

**Clean Run** (čistý běh) je povinný standard kompilace a běhu Prismatic Platform: nula
varování, žádný nadbytečný informativní ani ladicí výstup v logu a úspěšná kompilace
s přepínačem `--warnings-as-errors` v celé platformě. Do kódu platformy se nesmí dostat
žádné varování za běhu, žádný informační šum v logu ani žádné varování kompilátoru. Standard
zajišťuje, že skutečná varování, která ukazují na skutečné problémy, nikdy nezapadnou
v šumu, a udržuje v celém kódu co nejvyšší poměr signálu k šumu.

Standard řeší rozšířený problém velkých softwarových systémů: **únavu z varování**. Když kód
při kompilaci vypisuje desítky nebo stovky varování, vývojáři je přestanou číst. Kritická
varování o nesouladu typů, nepoužitých proměnných, které prozrazují logickou chybu, nebo
o zastaralých funkcích se ztratí v moři šumu. Absolutní nula varování zajišťuje, že každé
varování, které se objeví, je okamžitě vidět, okamžitě prošetřeno a okamžitě vyřešeno.
Neexistuje základní hladina šumu, na kterou by si člověk zvykl.

Clean Run není jen preferencí kvality, ale strukturálním vynucením zabudovaným do procesu
kompilace, háčků před commitem, bran kvality v CI/CD a nepřetržitého sledování. Kód, který
vytváří varování, nelze zkompilovat v produkčním režimu, neprojde validací před commitem,
nelze jej sloučit do hlavní větve a nelze jej nasadit. Vynucení je absolutní a nelze jej
obejít; řídí se doktrínou NO MERCY (viz [NM/ND](@/glossary/nm-nd.md) a [Zero Warning
Policy](@/glossary/zero-warning-policy.md)).

**Vztah ke knize:** Clean Run patří do kontextu platformy, z níž Kompendium vzešlo. Problém,
který řeší – návyk na šum, v němž zanikne skutečný signál –, kniha popisuje u lidí: zahlcení
informacemi otupuje pozornost a usnadňuje manipulaci (viz [EA-1.1.2 Informační
přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) a [Firehose of
Falsehood](@/glossary/firehose-of-falsehood.md)). Lidskou obdobou „čistého běhu“ je vědomá
péče o pozornost (viz [Řízení pozornosti](@/kompendium/self-defense-guides/9-attention-management.md)).

## Historický kontext a motivace

Standard vznikl z bolestné zkušenosti s hromaděním varování ve velkých umbrella projektech
v Elixiru. Před jeho zavedením nesla platforma stovky varování kompilátoru – nepoužité
proměnné, volání zastaralých funkcí, nedosažitelné klauzule porovnání vzorů, chybějící
typové specifikace. Jednotlivě byla bezvýznamná, dohromady katastrofální. Skutečné varování
o nesouladu typů v kritickém bezpečnostním modulu bylo mezi stovkami neškodných varování
o nepoužitých importech neviditelné.

Zlom přišel při posouzení kvality, které v kódu zjistilo 905 bodů dluhu kvality
([QDP](@/glossary/qdp.md), viz [Quality Debt](@/glossary/quality-debt.md)). Metodika CASCADE
vznikla právě k soustavnému odstranění tohoto dluhu a Clean Run byl zaveden jako standard,
který brání jeho opětovnému nahromadění. Kampaň trvala více sezení a zasáhla každou
aplikaci umbrella projektu, výsledkem však byla platforma, v níž je každé hlášení
kompilátoru smysluplné a každé varování vyžaduje okamžitou pozornost.

Rozhodnutí rozšířit standard z kompilace i na běh vyšlo z podobného pozorování: šum v logech
produkčních systémů otupuje stejně jako šum varování kompilátoru. Když každý požadavek
vytváří informativní výstup, operátoři přestanou logy sledovat, a když se objeví skutečná
chyba, utone v šumu. Požadavek na „ticho za běhu“ vyhrazuje výstup logu událostem, které si
žádají lidskou pozornost.

Standard se inspiruje i obory s regulovaným vývojem softwaru – letectvím (norma DO-178C pro
palubní software) a zdravotnickými prostředky (IEC 62304) –, kde je přísná kontrola kvality
kódu běžnou součástí certifikace. Platforma uplatňuje obdobnou přísnost na software pro
kybernetickou bezpečnost s odůvodněním, že bezpečnostní nástroje s nedostatky kvality jsou
horší než žádné, protože dávají falešnou jistotu.

## Vrstvy vynucení

Clean Run je vynucován na několika nezávislých vrstvách, které vytvářejí vícevrstvou obranu
proti zavlečení varování.

### Vrstva 1: kompilátor

Přepínač `--warnings-as-errors` kompilátoru Elixiru převádí všechna varování na chyby
kompilace. Je-li aktivní, jakékoli varování – nepoužitá proměnná, volání zastaralé funkce,
nedosažitelná klauzule, chybějící návratový typ – způsobí selhání celé kompilace.

```bash
# Clean Run compilation command
mix compile --warnings-as-errors --force

# Common warnings that become errors:
# - warning: variable "x" is unused (Elixir.SomeModule)
# - warning: function foo/1 is unused
# - warning: module SomeModule is not available or is being defined
# - warning: Enum.uniq/2 is deprecated, use Enum.uniq_by/2
```
Přepínač `--force` zajišťuje úplnou rekompilaci, aby zastaralé artefakty nezakryly nová
varování. To je důležité zejména u vzoru CASCADE Nuclear Cache, kdy inkrementální kompilace
může dávat nekonzistentní výsledky.

### Vrstva 2: statická analýza (Credo)

Credo v přísném režimu vynucuje konzistenci, čitelnost a pravidla návrhu kódu. Clean Run
vyžaduje nulu porušení Credo.

```bash
# Clean Run Credo check
mix credo --strict

# Credo categories enforced:
# - Consistency: naming, spacing, module structure
# - Readability: function complexity, nesting depth
# - Refactoring: code duplication, long parameter lists
# - Design: alias organization, module dependencies
# - Warning: IO.inspect left in code, dbg() calls
```
Přísný režim zapíná všechny volitelné kontroly a snižuje prahy varování o složitosti. Zachytí
tak nejen chyby, ale i problémy kvality, které by časem zhoršovaly udržovatelnost.

### Vrstva 3: typová analýza (Dialyzer)

Dialyzer provádí analýzu *success typing* napříč všemi moduly a odhaluje typové
nekonzistence, které kompilátor nezachytí. Clean Run vyžaduje nulu porušení Dialyzeru.

```bash
# Clean Run Dialyzer check
mix dialyzer

# Dialyzer detects:
# - Type mismatches between @spec and implementation
# - Unreachable code branches due to type constraints
# - Pattern match failures guaranteed by types
# - Invalid function calls (wrong argument types)
```
Analýza Dialyzerem je výpočetně náročná (minuty pro celou platformu), ale systém
[AutoHeal](@/glossary/autoheal.md) udržuje PLT (*Persistent Lookup Table*) inkrementálně, aby
doba kontrol během vývoje zůstala přijatelná.

### Vrstva 4: háčky před commitem

Háčky před commitem spouštějí podmnožinu kontrol nad připravenými soubory dřív, než povolí
commit. Běží automaticky a nelze je obejít (přepínač `--no-verify` je podle doktríny
platformy absolutně zakázán).

```elixir
defmodule PrismaticSafety.PreCommitValidator do
  @moduledoc """
  Validates staged changes against Clean Run standards before
  allowing commits. Executes compilation, Credo, and pattern
  checks on modified files only for fast feedback.
  """

  @spec validate_staged_changes() :: :ok | {:error, [violation()]}
  def validate_staged_changes do
    with :ok <- compile_check(),
         :ok <- credo_check(),
         :ok <- cascade_pattern_check(),
         :ok <- runtime_noise_check() do
      :ok
    end
  end

  defp compile_check do
    case System.cmd("mix", ["compile", "--warnings-as-errors"]) do
      {_, 0} -> :ok
      {output, _} -> {:error, {:compilation_warnings, output}}
    end
  end

  defp runtime_noise_check do
    staged_files = get_staged_files()

    violations =
      staged_files
      |> Enum.flat_map(&scan_for_noise_patterns/1)

    case violations do
      [] -> :ok
      found -> {:error, {:runtime_noise, found}}
    end
  end

  defp scan_for_noise_patterns(file) do
    patterns = [
      {~r/IO\.inspect/, "IO.inspect residue"},
      {~r/IO\.puts/, "IO.puts debug output"},
      {~r/dbg\(/, "dbg() macro"},
      {~r/Logger\.debug\(/, "Ungated debug logging"},
      {~r/Logger\.info\("Processing/, "Routine info logging noise"}
    ]

    file
    |> File.read!()
    |> String.split("\n")
    |> Enum.with_index(1)
    |> Enum.flat_map(fn {line, num} ->
      Enum.filter(patterns, fn {pattern, _desc} -> Regex.match?(pattern, line) end)
      |> Enum.map(fn {_pattern, desc} -> %{file: file, line: num, violation: desc} end)
    end)
  end
end
```
### Vrstva 5: brány kvality v CI/CD

Proces GitLab CI spouští při každém push úplnou validaci: plnou kompilaci, úplnou analýzu
Credo, plný běh Dialyzeru a sadu testů. Zachytí tak porušení, která mohla kvůli rozdílům
prostředí uniknout lokálním háčkům.

### Vrstva 6: strážce minimální kvality

Strážce minimální kvality (*Quality Floor Guardian*) nepřetržitě sleduje metriky kvality
platformy včetně souladu s Clean Run. Zjistí-li regresi, spustí zásah [AutoHeal](@/glossary/autoheal.md)
a eskaluje podle závažnosti.

| Skóre kvality | Úroveň | Reakce |
|---------------|-------|----------|
| 100–99 % | OPTIMAL | jen sledování |
| 98–99 % | WARNING | výstraha a šetření |
| 95–98 % | CRITICAL | spuštění automatické evoluce |
| < 95 % | EMERGENCY | blokace commitů a eskalace |

## Ticho za běhu

Clean Run se netýká jen kompilace, ale i chování za běhu. Standard vyžaduje, aby aplikační
kód při běžném provozu nevytvářel nadbytečný výstup logu:

- **žádné ladicí logy v produkčním kódu** – ladicí logování musí být výslovně podmíněno
  konfiguračním přepínačem;
- **žádný informační šum** – běžné operace nemají vytvářet výstup na úrovni info; ta je
  vyhrazena významným změnám stavu;
- **žádné zbytky `IO.inspect`** – ladicí volání z vývoje se musí před commitem odstranit;
- **žádná volání `dbg()`** – ladicí makro Elixiru se v zapsaném kódu nesmí objevit;
- **jen záměrné logování** – každý příkaz logu musí mít zdokumentovaný účel na přiměřené
  úrovni.

```elixir
# VIOLATION: Runtime noise
def process(data) do
  IO.inspect(data, label: "processing")  # Debug residue
  Logger.info("Processing data")          # Noise: routine operation
  Logger.debug("Data: #{inspect(data)}")  # Ungated debug output
  do_work(data)
end

# CLEAN: Intentional logging only
def process(data) do
  case do_work(data) do
    {:ok, result} ->
      {:ok, result}

    {:error, reason} ->
      Logger.warning("Processing failed: #{inspect(reason)}", module: __MODULE__)
      {:error, reason}
  end
end
```
Ticho za běhu zajišťuje, že když se výstup logu objeví, signalizuje skutečnou událost hodnou
prošetření – ne rutinní provozní šum, který se ignoruje.

## Podrobnosti implementace

### Oprava Nuclear Cache

Jednou z nejdůležitějších stránek udržení Clean Run ve velkém umbrella projektu je práce se
zastaralými artefakty kompilace. Inkrementální kompilace Elixiru může někdy dávat falešně
pozitivní výsledky (varování ze zastaralého kódu) nebo falešně negativní (zakrytí varování
artefakty z mezipaměti). Oprava Nuclear Cache to řeší úplným odstraněním artefaktů.

```bash
# Nuclear Cache Fix - use when incremental compilation produces inconsistent results
rm -rf _build/dev/lib/prismatic_claude/ebin && rm -rf priv/plts/dialyzer.plt
mix compile --warnings-as-errors --force
```
Operace je nákladná (úplná rekompilace celého umbrella projektu), ale zaručuje přesnou
detekci varování. Systém [AutoHeal](@/glossary/autoheal.md) ji spouští automaticky, když
zjistí nekonzistentní výsledky kompilace.

### Automatická validace Clean Run

```elixir
defmodule PrismaticSafety.CleanRunValidator do
  @moduledoc """
  Comprehensive Clean Run validation combining all enforcement
  layers into a single verification pipeline. Used by quality
  gates, CI/CD, and the Quality Floor Guardian.
  """

  @type validation_result :: %{
    compilation: :pass | :fail,
    credo: :pass | :fail,
    dialyzer: :pass | :fail,
    runtime_noise: :pass | :fail,
    overall: :pass | :fail,
    violations: [violation()],
    duration_ms: non_neg_integer()
  }

  @spec validate() :: {:ok, validation_result()} | {:error, validation_result()}
  def validate do
    start = System.monotonic_time(:millisecond)

    results = %{
      compilation: run_compilation_check(),
      credo: run_credo_check(),
      dialyzer: run_dialyzer_check(),
      runtime_noise: run_noise_scan()
    }

    violations = collect_violations(results)
    overall = if Enum.empty?(violations), do: :pass, else: :fail
    duration = System.monotonic_time(:millisecond) - start

    result = Map.merge(results, %{
      overall: overall,
      violations: violations,
      duration_ms: duration
    })

    case overall do
      :pass -> {:ok, result}
      :fail -> {:error, result}
    end
  end

  defp run_compilation_check do
    case System.cmd("mix", ["compile", "--warnings-as-errors", "--force"],
           stderr_to_stdout: true) do
      {_, 0} -> :pass
      _ -> :fail
    end
  end
end
```
## Rozsah a měřítko

Clean Run se vynucuje jednotně v celé platformě. Údaje odpovídají stavu v době zápisu
(jiná hesla uvádějí odlišné, starší počty aplikací):

| Metrika | Hodnota |
|--------|-------|
| **aplikace umbrella projektu** | 115 (všechny v souladu) |
| **zdrojové soubory Elixiru** | 6 652+ souborů `.ex` |
| **všechny soubory Elixiru** | 13 223+ (včetně `.exs`) |
| **varování kompilátoru** | 0 |
| **porušení Credo** | 0 |
| **porušení Dialyzeru** | 0 |
| **skóre kvality** | vynucené doktrínou |
| **čisté domény kvality** | 13/13 |
| **řádky kódu** | ~2,8 milionu |
| **QDP** | 0 |

Udržet nulu varování v takovém měřítku není triviální. Každý nový modul, každá aktualizace
závislosti a každý refaktoring musí standard zachovat. Metodika CASCADE a systém
[AutoEvolve](@/glossary/autoevolve.md) spolupracují na tom, aby se varování odhalovala
a odstraňovala hned při vzniku, automaticky, ne ruční bdělostí.

## Vztah k QDP

Soulad s Clean Run přímo souvisí s metrikou [QDP](@/glossary/qdp.md). Každé varování
kompilátoru, porušení Credo nebo chyba Dialyzeru přispívá k hromadění QDP. Metodika CASCADE
odstranila 905 QDP a dovedla platformu ke stavu 0 QDP; vynucení Clean Run brání novému
hromadění.

Vztah je obousměrný: vynucení Clean Run brání vzniku QDP a odstranění QDP (přes CASCADE) je
nutnou podmínkou dosažení Clean Run. Kód s nahromaděným dluhem kvality nemůže stavu Clean
Run dosáhnout, dokud se dluh soustavně neodstraní.

## Vztah k doktríně NO MERCY

Clean Run je jedním z hlavních mechanismů vynucení požadavků doktríny NO MERCY na kvalitu
(viz [No Mercy, No Doubts](@/glossary/no-mercy-no-doubts.md)). Doktrína požaduje nulovou
toleranci k neúplným implementacím, průchod všemi branami kvality před jakýmkoli sloučením,
žádné výmluvy pro odložené opravy a připravenost každého řádku kódu na produkci od okamžiku
vzniku.

Clean Run tyto principy převádí do praxe na úrovni kompilace a statické analýzy. Varování je
neúplná implementace. Porušení Credo je selhání brány kvality. Šum v logu za běhu je
odložený úklid. Clean Run mění principy doktríny v automatické vynucení, které pracuje bez
lidského úsudku a zásahu.

## Integrace se systémy platformy

### Integrace s AutoHeal

[AutoHeal](@/glossary/autoheal.md) sleduje stav Clean Run a při regresi automaticky zasahuje.
Udržuje PLT Dialyzeru inkrementálně, podle potřeby spouští opravu Nuclear Cache a vytváří
návrhy oprav pro běžné vzory varování.

### Integrace s AutoEvolve

[AutoEvolve](@/glossary/autoevolve.md) používá Clean Run jako základní ukazatel kvality. Když
se platforma vyvíjí (nové moduly, refaktorovaný kód, aktualizované závislosti), ověřuje, že
evoluce soulad zachovává, a při porušení spouští nápravu.

### Perzistence Quality DNA

Stav Clean Run se zaznamenává do souboru Quality DNA každé aplikace
(`.claude/quality-dna/current-state.json`), což zajišťuje kontinuitu mezi sezeními. Nové
sezení s Claude tak může okamžitě ověřit, zda se stav od posledního sezení změnil.

## Osvědčené postupy

1. **Zapnout brzy:** aktivovat `--warnings-as-errors` od začátku projektu, ne dodatečně.
   Dodatečné zavedení nulové tolerance do kódu se stovkami varování vyžaduje zvláštní kampaň.
2. **Vynutit úplnou rekompilaci:** pravidelně (zejména před commity) spouštět
   `mix compile --warnings-as-errors --force`, aby se zachytila varování, která inkrementální
   kompilace kvůli zastaralým artefaktům přehlédne.
3. **Zacházet s testy stejně:** uplatňovat stejný standard na testovací soubory jako na
   produkční kód. Testovací kód s varováními časem chátrá a ztrácí spolehlivost.
4. **Sledovat nepřetržitě:** strážce minimální kvality odhalí regrese mezi výslovnými
   kontrolami rychleji než periodické ruční kontroly.
5. **Logovat na přiměřené úrovni:** `Logger.warning` vyhradit stavům, které vyžadují pozornost
   operátora, `Logger.error` selháním a rutinní volání `Logger.info`, která vytvářejí
   provozní šum, odstranit.
6. **V pochybnostech oprava Nuclear Cache:** když se výsledky kompilace zdají nekonzistentní,
   odstranit artefakty a zkompilovat znovu. Cena čisté rekompilace je vždy nižší než cena
   ladění falešného poplachu nebo přehlédnutého skutečného varování.

## Časté chyby

- **Potlačovat varování místo opravy:** použití `@dialyzer {:nowarn_function, ...}` nebo
  `# credo:disable-for-next-line` k umlčení varování bez řešení příčiny popírá smysl
  standardu.
- **Varování ze závislostí:** závislosti třetích stran mohou vytvářet varování, která
  platforma opravit nemůže. Řeší se aktualizací závislostí, forky s opravou nebo
  zdokumentovanými výjimkami se sledovaným issue.
- **Falešně negativní výsledky inkrementální kompilace:** spoléhat při validaci jen na
  inkrementální kompilaci. Zastaralé artefakty mohou varování zakrýt; pro autoritativní
  kontroly vždy `--force`.
- **Varování jen v testech:** ignorovat varování v testech, protože „jsou to jen testy“.
  Kvalita testovacího kódu přímo ovlivňuje spolehlivost a udržovatelnost testů.

## Případy užití

- **validace před commitem** – nula varování dřív, než kód vstoupí do repozitáře;
- **brány kvality v CI/CD** – blokace sloučení, která přinášejí varování, porušení Credo
  nebo chyby Dialyzeru;
- **skóre kvality platformy** – příspěvek k souladu s doktrínou ve 22 pilířích a 13 doménách
  kvality;
- **důvěra v nasazení** – produkční vydání se sestavují z kódu bez varování;
- **vývojářská kázeň** – kultura, v níž se varování berou jako chyby (srov. [Session
  Discipline](@/glossary/session-discipline.md));
- **provozní jasnost** – produkční logy obsahují jen skutečné události, které si žádají
  pozornost.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *CASCADE* a *CASCADE Pattern* (metodika a antivzory,
jejichž odstranění vedlo ke Clean Run), *Dialyzer*, *Credo*, *Typespec*, *Mix*, *Code
Coverage*, *Property-Based Testing* a *Quality Gates*.

## Související

**Platforma**

- [QDP](@/glossary/qdp.md) – body dluhu kvality, jejichž vzniku Clean Run brání.
- [Zero Warning Policy](@/glossary/zero-warning-policy.md) – zásada nulových varování.
- [AutoEvolve](@/glossary/autoevolve.md) – evoluční systém, který standard udržuje.
- [AutoHeal](@/glossary/autoheal.md) – samooprava spouštěná regresemi.
- [No Mercy, No Doubts](@/glossary/no-mercy-no-doubts.md) – doktrína, kterou standard
  uskutečňuje.

**Kompendium**

- [EA-1.1.2 Informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md)
  – lidská podoba šumu, v němž zaniká signál.
- [Řízení pozornosti](@/kompendium/self-defense-guides/9-attention-management.md) – péče
  o poměr signálu a šumu v každodenním životě.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: clean-run](@/kompendium/glossary-bridges/bridge-clean-run.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
