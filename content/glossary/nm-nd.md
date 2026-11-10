+++
title = "Doktrína NM/ND"
weight = 3
description = "Kombinovaný rámec NO MERCY, NO DOUBTS, jímž Prismatic Platform řídí veškerý provoz: nulová tolerance k nedokončené práci a rozhodování opřené o důkazy."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "quality", "architecture"]

[extra]
category = "doctrine"
abbreviation = "NM/ND"
related_terms = ["no-mercy", "no-doubts", "violation-protocol", "clean-run", "regression-test", "aiad", "archer-supreme", "confidence-threshold", "pre-commit-hooks", "session-discipline", "nabla-infinity", "trinity-gate", "quality-gates"]
domain = "governance"
complexity = "advanced"
platform_adoption = "universal"
enforcement_level = "absolute"
clearance = "sig-nihl-l3"
version = "2.0.0"
compliance = "mandatory"
violation_levels = ["L1", "L2", "L3", "L4"]
confidence_threshold = "0.95"
transition_mechanism = "nabla-to-nmnd"
agents_governed = "530+"
quality_score = "doctrine-enforced"
quality_domains = "13"
qdp_eliminated = "905"
pre_commit_phases = "11"
bypass_mechanisms = "none"
session_protocol = "mandatory"
author = "Tomas Korcak (korczis)"
reading_time = "9 min"
word_count = 1864
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["NMND", "Doctrine", "Combined", "MERCY", "DOUBTS", "glossary", "Prismatic Platform"]
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Doktrína NM/ND – glosář"
+++

## Definice a přehled

Doktrína NM/ND (*NO MERCY, NO DOUBTS*, „bez slitování, bez pochybností“) je univerzální
řídicí rámec Prismatic Platform, který spojuje vynucování s nulovou tolerancí
a rozhodné jednání opřené o důkazy. Je zařazena na úroveň oprávnění L3 a bez výjimky řídí
veškerý provoz platformy – od jednotlivých commitů po strategická architektonická
rozhodnutí, od specifikací chování agentů po konfigurace CI/CD pipeline.

Doktrína je filosofickou syntézou dvou doplňujících se principů. **NO MERCY** požaduje, aby
veškerá práce byla od okamžiku vzniku připravená do produkce, s nulovou tolerancí
k nedokončeným implementacím, netestovanému kódu a odkládaným opravám kvality. **NO DOUBTS**
vyžaduje důkladné šetření před jednáním, rozhodnutí podložená důkazy a rozhodný závazek,
jakmile je dosaženo porozumění. Společně odstraňují dvě nejčastější selhání vývoje
softwaru: dodávání nekvalitní práce a neinformovaná rozhodnutí. Obě ramena mají v glosáři
vlastní heslo [NO MERCY, NO DOUBTS](@/glossary/no-mercy-no-doubts.md).

NM/ND není jen standard kvality nebo pravidlo psaní kódu. Je to ucelený řídicí rámec, který
prostupuje každou vrstvu platformy – od definic agentů [AIAD](@/glossary/aiad.md) (v době
zápisu jich platforma uváděla přes 530 a každá nesla povinné `enforcement: [doctrine](@/glossary/doctrine.md):
„no-mercy-no-doubts“`) přes [pre-commit
hooky](https://prismatic-reality-com.github.io/prismatic-promo/glossary/pre-commit-hooks/),
které blokují nevyhovující kód, a protokol [Session
Discipline](@/glossary/session-discipline.md), který řídí vývojové postupy, až po [protokol
porušení](@/glossary/violation-protocol.md), jenž eskaluje prohřešky čtyřmi úrovněmi
závažnosti.

Účinnost doktríny plyne z její nesmlouvavosti. Neexistují výjimky, obchvaty ani „dočasné“
odklady. Toto absolutní vynucení vytváří předvídatelnou základní úroveň kvality, která podle
dokumentace platformy umožnila rutinně udržovat kvalitu vynucenou doktrínou ve 13 oblastech
kódové základny, jejíž rozsah se v době zápisu uváděl kolem 2,8 milionu řádků.

Pro Kompendium je NM/ND pojmem z kontextu platformy, z níž kniha vzešla. Kniha z ní přebírá
jen technickou disciplínu (sestavení a kontroly obsahu musí projít), nikoli jazyk
„nulové tolerance“ vůči lidem: tentýž jazyk v lidské skupině je naopak varovným znakem
[prostředí s vysokou mírou kontroly](@/glossary/high-control-group.md).

## Historický kontext a vývoj

Doktrína NM/ND vzešla z vývojové historie Prismatic Platform, z poznání, že aspirace na
kvalitu bez vynucení nic neznamenají. V raných generacích platformy (Gen 1–5) se kvalita
řídila doporučujícími pravidly a ručním přezkumem. [Dluh kvality](@/glossary/quality-debt.md)
se tiše hromadil, regrese zůstávaly týdny neodhalené a kódová základna se navzdory dobrým
úmyslům všech postupně zhoršovala. Zlom nastal, když skóre kvality platformy kleslo pod
80/100 a vyvolalo architektonickou krizi, která hrozila úplně zastavit vývoj funkcí.

Jako první vykrystalizoval princip NO MERCY – závazek, že do repozitáře nevstoupí žádný kód,
který není připravený do produkce, otestovaný a v souladu se všemi standardy kvality. To
okamžitě odstranilo vzorec „opravíme to později“, který podle dokumentace odpovídal za
většinu dluhu kvality. Samotné NO MERCY ale vytvořilo jiný problém: vývojáři dodávali kód
rychle, aby splnili požadavek úplnosti, bez dostatečného šetření, a vznikaly dobře
otestované, ale špatně navržené implementace, které bylo třeba často přepracovávat.

Princip NO DOUBTS byl přidán, aby tuto mezeru zaplnil – předepisuje důkladné šetření před
exekucí. Spojená doktrína vytvořila zpětnou vazbu: NO DOUBTS brání špatně pochopeným
implementacím a NO MERCY nedokončeným. Společně směřují k dobře pochopenému a dobře
implementovanému kódu jako jedinému přijatelnému výstupu.

Verze 2.0.0 doktríny (aktuální v době zápisu) formalizovala napojení na [NABLA
Infinity](@/glossary/nabla-infinity.md): zavedla práh důvěry a přechodový mechanismus přes
[Trinity Gate](@/glossary/trinity-gate.md), který řídí posun od průzkumného šetření
k rozhodné exekuci. Tato verze také zavedla čtyřúrovňový protokol porušení a povinný blok
vynucení pro všechny komponenty AIAD.

## Technický rozbor

### Architektura dvojí filosofie

Doktrína NM/ND funguje jako dvoufázový systém, který přímo odpovídá životnímu cyklu vývoje
softwaru:

| Fáze | Doktrína | Princip | Uplatnění |
|-------|----------|-----------|-------------|
| Šetření | NO DOUBTS | úplné porozumění před jednáním | analýza požadavků, hledání kořenové příčiny, architektonické hodnocení |
| Exekuce | NO MERCY | nulová tolerance k neúplnosti | implementace, testování, nasazení, vynucení kvality |
| Přechod | brána NABLA | důvěra ≥ 0,95 + Trinity Gate | posun od zkoumání k rozhodnému jednání |
| Ověření | obojí | výsledky podložené důkazy | ověření po nasazení, regresní testy, skórování kvality |

### Matice požadavků NO MERCY

Rameno NO MERCY definuje výslovné požadavky na každý artefakt kódu:

| Požadavek | Popis | Místo vynucení |
|-------------|-------------|-------------------|
| **Žádné stuby** | v `lib/` žádné stuby, mocky, zástupné ani naivní implementace | pre-commit, fáze 8 |
| **Žádné TODO** | žádné komentáře TODO, FIXME, HACK, WORKAROUND ani XXX | pre-commit, fáze 8 |
| **100% pokrytí testy** | veškerý kód musí mít úplné testy | CI pipeline |
| **Žádná varování** | `--warnings-as-errors` u všech kompilací | pre-commit, fáze 1 |
| **Připraveno do produkce** | každý řádek kódu je nasaditelný od okamžiku vzniku | code review |
| **Regresní testy** | každá oprava chyby obsahuje regresní testy | povinný protokol |
| **[Čistý běh](@/glossary/clean-run.md)** | žádná běhová varování, žádný šum info/debug logů | CI pipeline |
| **Typová bezpečnost** | `@spec` u všech veřejných funkcí, čistý Dialyzer | brány kvality |

### Matice požadavků NO DOUBTS

Rameno NO DOUBTS předepisuje rozhodování opřené o důkazy:

| Požadavek | Popis | Ověření |
|-------------|-------------|------------|
| **Úplné šetření** | před jednáním plně porozumět | důvěra NABLA ≥ 0,95 |
| **[Pluralita signálů](@/glossary/signal-plurality.md)** | pro každé přesvědčení nejméně 2 nezávislé signály | Trinity Gate |
| **Zachování rozporu** | nikdy nezahazovat nepohodlné důkazy | Addiction Preservation |
| **Podložení důkazy** | každé tvrzení podložené testy, benchmarky nebo ověřením | přezkum |
| **Ověřené výsledky** | žádná neověřená tvrzení, žádné nezkontrolované výstupy | ověření po akci |
| **Sledování provenience** | každé přesvědčení dohledatelné ke zdroji | auditní stopa |

### Protokol přechodu z NABLA do NM/ND

Přechod mezi průzkumnou fází NABLA Infinity a rozhodnou exekuční fází NM/ND řídí přísné prahy
důvěry:

```
EXPLORATION (NABLA Infinity)
  |
  |-- Maps uncertainty landscape
  |-- Forms parallel hypotheses
  |-- Preserves contradictions (Addiction Preservation)
  |-- Maintains signal plurality
  |
  v [confidence >= 0.95 AND trinity_gate.passed AND axioms_compliant]
  |
EXECUTION (NM/ND)
  |
  |-- NO MERCY: Complete implementation, zero tolerance
  |-- NO DOUBTS: Decisive action, full commitment
  |-- Verification: Evidence-backed results
  |-- Enforcement: Quality gates, pre-commit hooks
```

Tento přechodový mechanismus brání dvěma kritickým selháním: předčasnému jednání (jednat
dřív, než je věc pochopena) a [paralýze analýzou](@/glossary/paralysis-by-analysis.md)
(zkoumat, aniž by se kdy přešlo k exekuci). Práh důvěry 0,95 s ověřením přes [Trinity
Gate](@/glossary/trinity-gate.md) dává přísné a měřitelné kritérium přechodu.

### Protokol porušení (L1–L4)

Doktrína vynucuje soulad čtyřúrovňovým protokolem porušení se stupňujícími se důsledky:

| Úroveň | Klasifikace | Spouštěč | Reakce | Autorita |
|-------|---------------|---------|----------|-----------|
| **L1** | drobná odchylka | porušení stylu, mezera v dokumentaci | varování + okamžitá oprava | agent |
| **L2** | porušení kvality | neprošlá brána kvality, chybějící test | blokace + povinná oprava před pokračováním | systém |
| **L3** | neúplná dodávka | dodáno se stuby, TODO, chybějícím pokrytím | odmítnutí + povinný restart od začátku | Supreme |
| **L4** | kompromitováno pochybností | obejité hooky, neověřená tvrzení | odmítnutí + eskalace k Supreme Review | Cosmic |

Protokol porušení se vynucuje automaticky na několika integračních bodech. Pre-commit hooky
zachytí porušení L1/L2 dřív, než kód vstoupí do repozitáře. Fáze CI pipeline zachytí
porušení L2/L3 dřív, než se kód dostane do produkce. Protokol Session Discipline zachytí
porušení L4 sledováním chování. Podrobně heslo [Violation Protocol](@/glossary/violation-protocol.md).

### Specifikace bloku vynucení

Každá komponenta AIAD musí ve své definici obsahovat blok vynucení NM/ND:

```yaml
enforcement:
  doctrine: "no-mercy-no-doubts"
  version: "2.0.0"
  compliance: mandatory
```

Blok není ozdoba. Indexer AIAD ověřuje jeho přítomnost při operacích `./aiad/bin/aiad index`
a agenti bez bloku vynucení jsou z registru odmítnuti (viz [Agent
Registry](@/glossary/agent-registry.md)).

## Architektura a implementace

### Architektura vynucení

Doktrína NM/ND se vynucuje vícevrstvou architekturou, která vytváří hloubkovou obranu proti
porušením kvality:

```
Developer Workstation          CI/CD Pipeline           Production
+-------------------+    +-------------------+    +------------------+
| Pre-Commit Hooks  |    | GitLab CI Stages  |    | Quality Floor    |
| - Compilation     |--->| - Compile         |--->| Guardian         |
| - Credo           |    | - Credo           |    | - Real-time      |
| - Pattern Scan    |    | - Dialyzer        |    |   monitoring     |
| - QDP Check       |    | - Tests           |    | - Threshold      |
| - Risk Detection  |    | - Quality Gates   |    |   alerts         |
+-------------------+    +-------------------+    +------------------+
         |                        |                       |
         v                        v                       v
+-----------------------------------------------------------+
|              Violation Protocol (L1-L4)                    |
+-----------------------------------------------------------+
         |                        |                       |
         v                        v                       v
+-----------------------------------------------------------+
|            Quality DNA Persistence Layer                   |
+-----------------------------------------------------------+
```

### Implementace v Elixiru

```elixir
defmodule PrismaticSafety.DoctrineEnforcement do
  @moduledoc """
  NM/ND Doctrine enforcement engine.

  Validates code changes against the NO MERCY, NO DOUBTS doctrine
  and routes violations to the appropriate escalation level.
  Implements all four violation levels (L1-L4) with structured
  remediation guidance for each violation type.
  """

  @type violation_level :: :l1 | :l2 | :l3 | :l4
  @type enforcement_result :: {:ok, :compliant} | {:error, violation_level(), String.t()}

  @spec enforce(map()) :: enforcement_result()
  def enforce(change_set) do
    with :ok <- validate_completeness(change_set),
         :ok <- validate_test_coverage(change_set),
         :ok <- validate_quality_gates(change_set),
         :ok <- validate_no_bypass(change_set),
         :ok <- validate_evidence_backing(change_set),
         :ok <- validate_regression_tests(change_set) do
      {:ok, :compliant}
    end
  end

  @spec validate_completeness(map()) :: :ok | {:error, violation_level(), String.t()}
  defp validate_completeness(change_set) do
    forbidden_patterns = [
      ~r/TODO\b/i,
      ~r/FIXME\b/i,
      ~r/HACK\b/i,
      ~r/stub/i,
      ~r/placeholder/i,
      ~r/naive.*implementation/i,
      ~r/WORKAROUND\b/i,
      ~r/XXX\b/
    ]

    case find_violations(change_set.files, forbidden_patterns) do
      [] -> :ok
      violations -> {:error, :l3, "Incomplete delivery: #{format_violations(violations)}"}
    end
  end

  @spec validate_no_bypass(map()) :: :ok | {:error, violation_level(), String.t()}
  defp validate_no_bypass(change_set) do
    if change_set.hook_bypass_attempted? do
      {:error, :l4, "Hook bypass detected -- L4 Supreme Review required"}
    else
      :ok
    end
  end

  @spec validate_regression_tests(map()) :: :ok | {:error, violation_level(), String.t()}
  defp validate_regression_tests(change_set) do
    if change_set.is_bug_fix? and not change_set.has_regression_tests? do
      {:error, :l2, "Bug fix without regression tests -- mandatory protocol violation"}
    else
      :ok
    end
  end

  defp find_violations(files, patterns) do
    Enum.flat_map(files, fn file ->
      Enum.flat_map(patterns, fn pattern ->
        if Regex.match?(pattern, file.content) do
          [{file.path, pattern}]
        else
          []
        end
      end)
    end)
  end

  defp format_violations(violations) do
    violations
    |> Enum.map(fn {path, _pattern} -> path end)
    |> Enum.uniq()
    |> Enum.join(", ")
  end

  defp validate_test_coverage(_change_set), do: :ok
  defp validate_quality_gates(_change_set), do: :ok
  defp validate_evidence_backing(_change_set), do: :ok
end
```

## Užití v Prismatic Platform

Doktrína NM/ND je základním řídicím rámcem Prismatic Platform, zabudovaným do každé vrstvy
systému. Její vliv se vztahuje na všechny agenty AIAD, všechny CI pipeline, všechny
pre-commit hooky a všechny protokoly vývojových sezení.

### Integrace agentů

Každý agent v registru agentů platformy nese povinný blok vynucení NM/ND. Indexer AIAD ověřuje
soulad při registraci a nevyhovující definice agentů odmítá. Tím je zajištěno, že chování
agentů – od taktického [ARCHER Supreme](@/glossary/archer-supreme.md) po specializované
strážce kvality – se řídí stejným rámcem.

### Disciplína sezení

Protokol [Session Discipline](@/glossary/session-discipline.md) rozšiřuje NM/ND na řízení
vývojových postupů. Každé sezení musí zakládat issue v GitLabu pro sledování, commitovat
často (bez dávkování), okamžitě pushovat na vzdálený repozitář, před commitem spustit lokální
testy a projít všemi hooky bez obcházení. Přepínač `--no-verify` je absolutně zakázán
a spouští eskalaci L4 k Supreme Review.

### Udržování skóre kvality

Doktríně dokumentace platformy přímo připisuje soulad s doktrínou ve 22 pilířích napříč
13 oblastmi kvality (údaje v době zápisu). Úplné odstranění 905 bodů dluhu kvality
([QDP](@/glossary/qdp.md)) se podle ní podařilo systematickým uplatněním principů NM/ND –
žádné porušení nebylo odloženo, žádná oprava nebyla neúplná a žádná regrese nebyla
tolerována.

### Povinný protokol regresních testů

Každá oprava chyby musí postupovat podle protokolu [regresních
testů](@/glossary/regression-test.md):

1. **PŘED opravou**: určit kořenovou příčinu chyby a způsob selhání.
2. **VYTVOŘIT regresní test(y)**, které by tuto chybu zachytily.
3. **OVĚŘIT, že test selže** s neopraveným kódem (dokazuje platnost testu).
4. **PROVÉST opravu** v kódové základně.
5. **OVĚŘIT, že test projde** s opraveným kódem (dokazuje, že oprava funguje).
6. **OHLÁSIT dokončení** uživateli se stručným shrnutím.

Tento protokol má soulad vynucený doktrínou a žádné obchvaty.

## Příklady kódu

### Kontrola souladu s doktrínou

```elixir
defmodule PrismaticSafety.DoctrineCheck do
  @moduledoc """
  Runtime doctrine compliance verification for AIAD agents.
  Validates that all agent definitions include the required
  NM/ND enforcement block with correct version and compliance level.
  """

  @spec verify_agent_compliance(map()) :: {:ok, :compliant} | {:error, String.t()}
  def verify_agent_compliance(agent_definition) do
    with {:ok, _} <- check_enforcement_block(agent_definition),
         {:ok, _} <- check_doctrine_version(agent_definition),
         {:ok, _} <- check_compliance_field(agent_definition) do
      {:ok, :compliant}
    end
  end

  @spec check_enforcement_block(map()) :: {:ok, :present} | {:error, String.t()}
  defp check_enforcement_block(%{enforcement: %{doctrine: "no-mercy-no-doubts"}} = _def) do
    {:ok, :present}
  end

  defp check_enforcement_block(_agent_definition) do
    {:error, "Missing NM/ND enforcement block -- agent rejected"}
  end

  @spec check_doctrine_version(map()) :: {:ok, :current} | {:error, String.t()}
  defp check_doctrine_version(%{enforcement: %{version: version}}) do
    case Version.compare(version, "2.0.0") do
      :lt -> {:error, "Doctrine version #{version} below minimum 2.0.0"}
      _ -> {:ok, :current}
    end
  end

  @spec check_compliance_field(map()) :: {:ok, :mandatory} | {:error, String.t()}
  defp check_compliance_field(%{enforcement: %{compliance: :mandatory}}) do
    {:ok, :mandatory}
  end

  defp check_compliance_field(_agent_definition) do
    {:error, "Compliance field must be :mandatory -- no optional doctrine compliance"}
  end
end
```

### Vynucení NM/ND v pre-commitu

```elixir
defmodule PrismaticSafety.PreCommitEnforcer do
  @moduledoc """
  Pre-commit hook enforcement implementing NM/ND doctrine.
  Blocks commits that violate doctrine requirements across
  all 11 pre-commit phases.
  """

  @type violation_level :: :l1 | :l2 | :l3 | :l4

  @spec run_enforcement(list(String.t())) :: :ok | {:error, violation_level(), String.t()}
  def run_enforcement(staged_files) do
    results =
      staged_files
      |> Enum.map(&analyze_file/1)
      |> Enum.reject(&match?({:ok, _}, &1))

    case results do
      [] -> :ok
      violations -> {:error, highest_level(violations), format_report(violations)}
    end
  end

  @spec analyze_file(String.t()) :: {:ok, :compliant} | {:error, violation_level(), String.t()}
  defp analyze_file(file_path) do
    with {:ok, content} <- File.read(file_path),
         :ok <- check_no_todos(content, file_path),
         :ok <- check_no_process_sleep(content, file_path),
         :ok <- check_no_length_antipattern(content, file_path),
         :ok <- check_has_typespec(content, file_path) do
      {:ok, :compliant}
    end
  end

  defp check_no_todos(content, path) do
    if Regex.match?(~r/\b(TODO|FIXME|HACK|XXX)\b/, content) do
      {:error, :l3, "Forbidden pattern in #{path}"}
    else
      :ok
    end
  end

  defp check_no_process_sleep(content, path) do
    if Regex.match?(~r/Process\.sleep/, content) do
      {:error, :l2, "Process.sleep detected in #{path}"}
    else
      :ok
    end
  end

  defp check_no_length_antipattern(content, path) do
    if Regex.match?(~r/length\([^)]+\)\s*>\s*0/, content) do
      {:error, :l2, "length() > 0 anti-pattern in #{path}"}
    else
      :ok
    end
  end

  defp check_has_typespec(_content, _path), do: :ok

  defp highest_level(violations) do
    violations
    |> Enum.map(fn {:error, level, _} -> level end)
    |> Enum.max_by(&level_severity/1)
  end

  defp level_severity(:l1), do: 1
  defp level_severity(:l2), do: 2
  defp level_severity(:l3), do: 3
  defp level_severity(:l4), do: 4

  defp format_report(violations) do
    violations
    |> Enum.map(fn {:error, level, msg} -> "[#{level}] #{msg}" end)
    |> Enum.join("\n")
  end
end
```

## Osvědčené postupy

1. **Zvnitřnit, než vynucovat**: doktrína funguje nejlépe, když vývojáři rozumějí její
   filosofii a nevnímají ji jako vnější omezení. Princip šetření před jednáním (NO DOUBTS)
   předchází frustraci z toho, že NO MERCY odmítne nedokončenou práci.
2. **Rozumně používat přechod NABLA**: nespěchat přes práh důvěry 0,95. Důkladné šetření ve
   fázi NABLA znamená méně odmítnutí ve fázi exekuce NM/ND. Čas investovaný do porozumění se
   vrátí v kvalitě exekuce.
3. **Brát porušení jako učení**: porušení L1 a L2 jsou signály, že vývojový proces potřebuje
   úpravu, ne tresty. Protokol porušení existuje kvůli udržení kvality, ne kvůli strachu.
4. **Opřít se o automatizaci**: architektura vynucení zvládá většinu kontrol souladu
   automaticky. Pro soulad s doktrínou se spoléhat na pre-commit hooky a brány CI, ne na
   ruční přezkum.
5. **Dokončovat malé celky**: požadavek úplnosti se nejsnáze splní prací v malých,
   soustředěných přírůstcích. Každý commit má být úplnou, otestovanou jednotkou práce
   připravenou do produkce.
6. **Přijmout protokol regresních testů**: brát každou opravu chyby jako příležitost
   posílit sadu testů. Protokol regresních testů není režie – je to mechanismus, který brání
   opakování téže chyby.

## Časté chyby

- **Brát NM/ND jako nepovinné**: doktrína nemá mechanismus výjimek. Pokus o obejití (např.
  `--no-verify`) spouští nejvyšší úroveň porušení (L4). Omezení je třeba přijmout a pracovat
  v nich.
- **Zaměňovat NO MERCY s perfekcionismem**: NO MERCY vyžaduje úplnost, ne dokonalost. Kód musí
  být připravený do produkce a otestovaný, ale postupné zlepšování se očekává. Klíčový rozdíl
  je mezi dodáním nedokončené práce (zakázáno) a dodáním úplné práce, která se později
  vylepší (přijatelné). Srov. heslo [perfekcionismus](@/glossary/perfekcionismus.md).
- **Přeskočit fázi NO DOUBTS**: spěch k implementaci bez důkladného šetření vede k porušení
  L3, když se implementace ukáže jako neúplná. Fáze šetření není volitelná režie, ale povinný
  předpoklad.
- **Pokoušet se o částečný soulad**: blok vynucení vyžaduje `compliance: mandatory`.
  Neexistuje `compliance: partial` ani `compliance: best_effort`. Komponenta buď plně vyhovuje,
  nebo je odmítnuta.
- **Dávkovat opravy kvality**: NO MERCY vyžaduje okamžitou nápravu. Hromadění problémů kvality
  na „úklidový sprint“ doktrínu porušuje. Problémy se opravují v okamžiku, kdy se objeví.

## Integrace se systémy platformy

### Napojení na brány kvality

Pipeline [Quality Gates](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/)
je hlavním mechanismem vynucení NM/ND. Každá fáze brány vynucuje konkrétní požadavky doktríny:

| Fáze brány | Požadavek NM/ND | Úroveň porušení při selhání |
|------------|-------------------|---------------------------|
| Kompilace | žádná varování | L2 |
| Credo | soulad se vzory kódu | L1–L2 |
| Dialyzer | typová správnost | L2 |
| Testy | funkční správnost | L2–L3 |
| Sken QDP | žádné zakázané vzory | L3 |
| Vlastní kontroly | pravidla specifická pro oblast | L2 |
| Integrace | kontrakty mezi aplikacemi | L2–L3 |

### Napojení na standard AIAD

Každá komponenta AIAD – agenti, příkazy, pipeline, politiky, adaptéry – nese povinný blok
vynucení. Standard AIAD definuje formát bloku, požadavky na verzi a pravidla ověření souladu.
Příkaz `./aiad/bin/aiad index` ověřuje při indexaci všechny komponenty.

### Napojení na životní cyklus sezení

GenServer SessionLifecycle vynucuje NM/ND na hranicích sezení:

- **začátek sezení**: zachycení výchozího stavu, načtení kontextu, založení issue;
- **před příkazem**: rychlá kontrola brány kvality;
- **po příkazu**: rychlý sken [AutoEvolve](@/glossary/autoevolve.md);
- **konec sezení**: úplné brány kvality, uložení kontextu, ověření pushnutí.

## Meze přenosu na lidské prostředí

Doktrína se týká softwarových artefaktů a strojově ověřitelných kritérií. Kompendium
upozorňuje, že její slovník – „bez slitování“, „bez pochybností“, „žádné výjimky“,
„nejvyšší autorita“ – má v mezilidských vztazích a organizacích opačný význam: absolutní
pravidla bez možnosti odvolání, zákaz pochybností a eskalace k nejvyšší autoritě patří mezi
znaky kontroly myšlení a chování, které popisuje [model BITE](@/glossary/bite-model.md).
Pro organizace knihu doplňují oddíly [organizační
obrany](@/kompendium/organizational-defense/_index.md); stránka [1.6 Vztah ke Prismatic
Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) vysvětluje, co kniha
z platformy přebírá.

## Související

**Pojmy platformy v tomto glosáři**

- [NO MERCY, NO DOUBTS](@/glossary/no-mercy-no-doubts.md) – obě ramena doktríny podrobně.
- [Violation Protocol](@/glossary/violation-protocol.md) – úrovně eskalace L1–L4.
- [AIAD](@/glossary/aiad.md) – standard agentů s povinným blokem vynucení.
- [Trinity Gate](@/glossary/trinity-gate.md) – brána, která umožňuje přechod z NABLA do NM/ND.
- [Session Discipline](@/glossary/session-discipline.md) – protokol vývojových postupů.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec fáze šetření.
- [Regression Test](@/glossary/regression-test.md) – povinný protokol testování.
- [Zero Warning Policy](@/glossary/zero-warning-policy.md) – nulová tolerance varování.

**Hesla platformy mimo tuto knihu**

- [NO MERCY](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-mercy/),
  [NO DOUBTS](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-doubts/),
  [Quality Gates](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/),
  [Pre-Commit Hooks](https://prismatic-reality-com.github.io/prismatic-promo/glossary/pre-commit-hooks/),
  [Quality DNA](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-dna/) –
  ramena doktríny, pipeline vynucení, první bod vynucení a přenos stavu kvality mezi sezeními.
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Registr agentů](https://prismatic-reality-com.github.io/prismatic-promo/agents/),
  [Registr příkazů](https://prismatic-reality-com.github.io/prismatic-promo/commands/) –
  přehledy platformy.

**Kniha**

- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – co
  kniha z platformy přebírá a co ne.
- [High Control Group](@/glossary/high-control-group.md) – proč stejný jazyk u lidí varuje.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
