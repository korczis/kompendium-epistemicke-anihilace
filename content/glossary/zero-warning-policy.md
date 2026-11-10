+++
title = "Zero warning policy (politika nulových varování)"
weight = 57
description = "Pravidlo Prismatic Platform: veškerý kód se musí přeložit s přepínačem --warnings-as-errors bez jediného varování; důvody, vynucení a časté chyby."

[taxonomies]
tags = ["glossary", "prismatic", "quality", "doctrine", "architecture"]

[extra]
category = "quality"
related_terms = ["clean-run", "quality-gates", "credo", "dialyzer", "no-mercy"]
author = "Tomas Korcak (korczis)"
reading_time = "7 min"
word_count = 1334
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["Zero", "Warning", "Policy", "--warnings-as-errors", "glossary", "quality", "Prismatic Platform", "Elixir", "Warnings", "Zero Warning"]
quality_score = 77
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Zero warning policy (politika nulových varování) – glosář"
+++

## Definice a přehled

Politika nulových varování (*Zero Warning Policy*) je základní pravidlo vynucování kvality, které
předepisuje, že veškerý kód v Elixiru v Prismatic Platform se musí úspěšně přeložit se zapnutým
přepínačem `--warnings-as-errors`. Podle této politiky se každá diagnostika kompilátoru –
nepoužité proměnné, volání zastaralých funkcí, chybějící návratové hodnoty, nedosažitelný kód,
varování porovnávání se vzorem a všechna další varování kompilátoru – považuje za selhání
kompilace. Sestavení skončí s nenulovým návratovým kódem a zablokuje všechny navazující operace:
testování, nasazení, commit i sloučení.

Politika představuje nejnekompromisnější přístup k diagnostice kompilátoru v softwarovém
inženýrství. Většina projektů toleruje určitou míru varování a spoléhá na úsudek vývojářů, která
varování jsou „skutečné problémy“ a která „přijatelný šum“. Politika nulových varování toto
rozlišení zcela odmítá. Každé varování je možným ukazatelem vady. Každé varování zvyšuje hladinu
šumu, která zakrývá skutečně kritické diagnostiky. Jediný přijatelný počet varování je nula.

Zdůvodnění je praktické i filosofické. Prakticky udržení nuly varování zajišťuje, že každé nové
varování je okamžitě viditelné a přiřaditelné ke konkrétní změně, což umožňuje okamžitě určit
kořenovou příčinu. V kódové základně s 200 existujícími varováními vývojář snadno zavede 201.
varování, aniž by si toho všiml. V kódové základně s nulou varování je každé nové varování
nepřehlédnutelným signálem. Filosoficky politika odpovídá doktríně [NO
MERCY](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-mercy/) (viz [NO MERCY,
NO DOUBTS](@/glossary/no-mercy-no-doubts.md)): neexistují přijatelná porušení kvality, odložené
opravy ani tolerance k „dost dobrému“.

Podle dokumentace platformy se politika v době zápisu vynucovala ve všech 6 652 zdrojových souborech
Elixiru v 90 aplikacích umbrelly (jinde dokumentace uvádí 99 nebo 115 aplikací – čísla odpovídají
různým obdobím) a stav byl **nula varování při kompilaci** v celé kódové základně, udržovaný
disciplinovaným vynucením v každé fázi životního cyklu vývoje.

| Bod vynucení | Příkaz | Blokuje? |
|-------------------|---------|-----------|
| **Lokální kompilace** | `mix compile --warnings-as-errors` | ano – blokuje vývoj |
| **Pre-commit hook** | `.githooks/pre-commit`, fáze 2 | ano – blokuje commit |
| **Brány kvality** | `mix quality.gates` | ano – blokuje sloučení |
| **CI pipeline** | fáze kompilace v GitLab CI | ano – blokuje nasazení |
| **Konfigurace projektu Mix** | `elixirc_options: [warnings_as_errors: true]` | ano – trvale |

Pro Kompendium je politika nulových varování pojmem z kontextu platformy. Kniha z ní přebírá
obecný postřeh o *hladině šumu*: kde se toleruje mnoho drobných „varování“, přestane být vidět to
podstatné. Totéž platí u varovných signálů ve vztazích a organizacích, které se postupně
normalizují (srov. [detekční signaturu Akcelerace
izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md)). U lidí ovšem
kniha nepožaduje „nulovou toleranci“, ale pozornost k vzorci.

## Technický rozbor

### Varování kompilátoru Elixiru

Kompilátor Elixiru vytváří několik kategorií varování, z nichž každá představuje jinou třídu
možného problému:

**Varování o nepoužité proměnné** vzniká, když je proměnná navázána, ale nikdy se na ni
neodkazuje. Zdánlivě neškodné nepoužité proměnné často ukazují na neúplné implementace, chyby
z kopírování nebo zapomenuté ladicí příkazy. Idiomatickou opravou v Elixiru je dát nepoužité
proměnné předponu podtržítka (`_unused`), která výslovně vyjadřuje záměrné nepoužití.

**Varování o zastaralé funkci** signalizuje použití funkcí, které budou v budoucích verzích
Elixiru odstraněny. Přehlížení těchto varování vytváří časovanou bombu: kód se dnes přeloží, ale
při příští aktualizaci Elixiru se rozbije. Politika nulových varování vynucuje okamžitý přechod na
doporučené alternativy.

**Varování o nedosažitelném kódu** ukazuje na logiku, která se nikdy nemůže provést – mrtvé větve
v příkazech case, kód za nepodmíněným návratem nebo vzory, které pokrývají dřívější klauzule.
Nedosažitelný kód silně naznačuje logické chyby nebo nepochopený tok řízení.

**Varování o chybějící návratové hodnotě** označuje výrazy, jejichž návratové hodnoty se ignorují.
V Elixiru, kde funkce sdělují výsledky návratovými hodnotami, ignorování návratové hodnoty často
znamená ignorování chybového stavu.

**Varování porovnávání se vzorem** zahrnují neúplné porovnání a překrývající se vzory. Mohou
ukazovat na neošetřené hraniční případy nebo nadbytečnou logiku.

### Problém hromadění varování

Základním argumentem pro politiku nulových varování je problém hromadění varování. V kódových
základnách, které varování tolerují, sleduje jejich počet předvídatelnou trajektorii:

```
Week 1:   3 warnings  - "We'll fix these soon"
Month 1:  15 warnings - "Most are harmless"
Month 3:  47 warnings - "Too many to fix, we have features to ship"
Month 6:  120 warnings - "Nobody looks at warnings anymore"
Month 12: 300+ warnings - "Is that a real problem or just a warning?"
```

Při 300 varováních je diagnostický systém fakticky vypnutý. Skutečné problémy – typové neshody,
zastaralá API, logické chyby – jsou v šumu neviditelné. Politika nulových varování tuto trajektorii
nedovolí vůbec zahájit, protože udržuje počet přesně na nule.

### Souhra s dalšími nástroji kvality

Politika nulových varování působí vedle dalších nástrojů vynucování kvality, z nichž každý pokrývá
jinou dimenzi kvality:

```
Compiler Warnings (Zero Warning Policy)
    |
    +--> Covers: unused vars, deprecated calls, unreachable code, type mismatches
    |
Credo (Static Analysis)
    |
    +--> Covers: code style, complexity, naming, design patterns
    |
Dialyzer (Type Analysis)
    |
    +--> Covers: type specification violations, unreachable code (deeper), contract violations
    |
ExUnit (Testing)
    |
    +--> Covers: behavioral correctness, edge cases, regressions
```

## Architektura a implementace

### Konfigurace projektu Mix

Každá aplikace umbrelly v Prismatic Platform má v konfiguraci `mix.exs` přepínač `warnings_as_errors`:

```elixir
defmodule PrismaticWeb.MixProject do
  use Mix.Project

  def project do
    [
      app: :prismatic_web,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixirc_options: [warnings_as_errors: true],
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      test_coverage: [threshold: 80]
    ]
  end
end
```

Tato konfigurace zajišťuje, že politiku nulových varování vynucuje i `mix compile` bez výslovných
přepínačů. V prostředí CI se přidává přepínač `--force`, aby úplná rekompilace zachytila varování
ve všech souborech, ne jen ve změněných.

### Napojení na pre-commit hook

Skript `.githooks/pre-commit` vynucuje nulu varování dřív, než se jakýkoli commit dostane do
repozitáře:

```elixir
defmodule PrismaticSafety.PreCommit.CompilationCheck do
  @moduledoc """
  Pre-commit compilation check enforcing zero warnings policy.
  Runs `mix compile --warnings-as-errors --force` and blocks
  commit on any warning.
  """

  @spec check(list(String.t())) :: :pass | {:fail, list(String.t())}
  def check(staged_files) do
    elixir_files = Enum.filter(staged_files, &String.ends_with?(&1, ".ex"))

    if Enum.empty?(elixir_files) do
      :pass
    else
      case System.cmd("mix", ["compile", "--warnings-as-errors", "--force"],
             stderr_to_stdout: true) do
        {_output, 0} -> :pass
        {output, _exit_code} -> {:fail, extract_warnings(output)}
      end
    end
  end

  defp extract_warnings(output) do
    output
    |> String.split("\n")
    |> Enum.filter(&String.contains?(&1, "warning:"))
  end
end
```

### Napojení na brány kvality

Úloha `mix quality.gates` zahrnuje kompilaci jako první kontrolu, takže všechny následující kontroly
(Credo, Dialyzer, testy) pracují nad kódem bez varování:

```elixir
defmodule Mix.Tasks.Quality.Gates do
  @moduledoc """
  Multi-phase quality gate enforcement.
  Phase 1: Zero Warning Compilation (BLOCKING)
  """

  use Mix.Task

  @spec run(list(String.t())) :: :ok | no_return()
  def run(_args) do
    Mix.shell().info("Phase 1: Zero Warning Compilation Check")

    case Mix.Task.run("compile", ["--warnings-as-errors", "--force"]) do
      :ok ->
        Mix.shell().info("PASS: Zero warnings")
        run_remaining_phases()

      {:error, _} ->
        Mix.shell().error("FAIL: Compilation warnings detected")
        Mix.shell().error("Fix all warnings before proceeding")
        System.halt(1)
    end
  end
end
```

### Detekce vzorů vedoucích k varováním

Platforma zahrnuje proaktivní detekci vzorů, o nichž je známo, že vytvářejí varování, a zachytí
problémy ještě před kompilací:

```elixir
defmodule PrismaticSafety.WarningPatternDetector do
  @moduledoc """
  Proactive detection of code patterns that will generate
  compiler warnings. Catches issues before compilation.
  """

  @warning_patterns [
    {~r/\b([a-z_][a-z0-9_]*)\s*=.*\n(?!.*\b\1\b)/, :unused_variable},
    {~r/\bIO\.inspect\b/, :debug_statement},
    {~r/\bProcess\.sleep\b/, :process_sleep},
    {~r/\b:timer\.sleep\b/, :timer_sleep}
  ]

  @spec scan_file(String.t()) :: list(warning_pattern())
  def scan_file(file_path) do
    content = File.read!(file_path)

    @warning_patterns
    |> Enum.flat_map(fn {pattern, type} ->
      case Regex.scan(pattern, content) do
        [] -> []
        matches -> Enum.map(matches, fn _match -> {file_path, type} end)
      end
    end)
  end
end
```

## Užití v Prismatic Platform

### Každodenní vývojový postup

Vývojáři Prismatic Platform se s politikou nulových varování setkávají v několika bodech
každodenního postupu:

1. **Psaní kódu**: integrace do IDE (ElixirLS) ukazuje varování v reálném čase při psaní kódu.
2. **Lokální kompilace**: `mix compile` v projektu vynucuje `warnings_as_errors: true` přes `mix.exs`.
3. **Spouštění testů**: `mix test` rekompiluje změněné soubory a spouští detekci varování.
4. **Commit**: pre-commit hook spouští úplnou kompilaci s `--warnings-as-errors --force`.
5. **Push**: pre-push hook spouští brány kvality včetně kontroly kompilace.
6. **CI pipeline**: GitLab CI spouští úplnou kompilaci jako první fázi pipeline.

### Běžné situace a opravy

| Varování | Kořenová příčina | Oprava |
|---------|-----------|-----|
| `variable "x" is unused` | navázáno, ale nepoužito | předpona `_` nebo odstranit |
| `function is deprecated` | použití zastaralého API | přejít na doporučenou alternativu |
| `this clause cannot match` | nedosažitelný vzor | odstranit mrtvou klauzuli nebo opravit vzor |
| `missing @impl true` | callback bez anotace | přidat anotaci `@impl true` |
| `module attribute @foo was set but never used` | nepoužitý atribut modulu | odstranit nebo atribut použít |

### Standardizace

Úloha `mix quality.standardize_mix` byla použita k současnému vynucení `warnings_as_errors: true`
ve všech 99 aplikacích umbrelly. Tato standardizace byla podle dokumentace jednou z 321 transformací
provedených při zavádění Universal Quality Standard a zajistila jednotné vynucení v celé kódové
základně.

## Příklady kódu

### Oprava běžných varování

```elixir
# WARNING: variable "result" is unused
defmodule Example.Before do
  def process(data) do
    result = transform(data)  # Warning: result is unused
    :ok
  end
end

# FIXED: Either use the variable or prefix with underscore
defmodule Example.After do
  def process(data) do
    _result = transform(data)  # Explicitly unused
    :ok
  end

  # Or better: use the result
  def process_v2(data) do
    result = transform(data)
    {:ok, result}
  end
end
```

```elixir
# WARNING: this clause cannot match because a previous clause always matches
defmodule Router.Before do
  def route(path) do
    case path do
      "/" <> _rest -> handle_path(path)  # Always matches
      "/api" <> _rest -> handle_api(path)  # Unreachable!
    end
  end
end

# FIXED: Order clauses from specific to general
defmodule Router.After do
  def route(path) do
    case path do
      "/api" <> _rest -> handle_api(path)  # Specific first
      "/" <> _rest -> handle_path(path)     # General last
    end
  end
end
```

### Automatizovaná prevence varování

```elixir
defmodule PrismaticSafety.WarningPrevention do
  @moduledoc """
  Utilities for preventing common warning patterns
  in new code generation and templates.
  """

  @spec safe_variable_bind(String.t(), any()) :: String.t()
  def safe_variable_bind(name, value) when is_binary(name) do
    # Generate code that avoids unused variable warnings
    if value_used?(name) do
      "#{name} = #{inspect(value)}"
    else
      "_#{name} = #{inspect(value)}"
    end
  end

  @spec check_deprecations(module()) :: list({atom(), String.t()})
  def check_deprecations(module) do
    # Check all function calls in module for deprecated APIs
    module
    |> Module.definitions_in()
    |> Enum.flat_map(fn {function, arity} ->
      module
      |> Module.get_definition({function, arity})
      |> extract_called_functions()
      |> Enum.filter(&deprecated?/1)
      |> Enum.map(fn dep -> {function, "Calls deprecated #{inspect(dep)}"} end)
    end)
  end
end
```

## Osvědčené postupy

1. **Zapnout v `mix.exs`, ne jen přepínači v příkazové řádce**: nastavení `elixirc_options:
   [warnings_as_errors: true]` v konfiguraci projektu zajišťuje vynucení bez ohledu na to, jak se
   kompilace spustí. Přepínače lze zapomenout, konfigurace projektu je trvalá.
2. **V CI používat `--force`**: inkrementální kompilace kontroluje jen změněné soubory. V prostředí
   CI používat `mix compile --warnings-as-errors --force`, aby úplná rekompilace zachytila varování
   ve všech souborech včetně těch, které ovlivnily změny závislostí.
3. **Opravovat varování okamžitě**: když se při vývoji objeví varování, opravit ho dřív než cokoli
   jiného. Odkládání oprav varování porušuje politiku nulových varování a hrozí odmítnutím commitu.
4. **Pochopit varování před opravou**: neumlčovat varování naslepo podtržítky. Varování o nepoužité
   proměnné může ukazovat na logickou chybu (zapomenuté použití spočítaného výsledku), ne na
   záměrné nepoužití. Před volbou opravy pochopit kořenovou příčinu.
5. **Sledovat kategorie varování**: sledovat, které typy varování se objevují nejčastěji. Nárůst
   varování o nepoužitých proměnných může ukazovat na kopírování kódu. Nárůst varování o zastaralých
   funkcích může signalizovat blížící se závislost na nové verzi Elixiru.
6. **Kombinovat s Credo a Dialyzerem**: kompilátor zachytí jen část problémů kvality kódu.
   [Credo](https://prismatic-reality-com.github.io/prismatic-promo/glossary/credo/) pokrývá styl
   a návrhové vzory, [Dialyzer](https://prismatic-reality-com.github.io/prismatic-promo/glossary/dialyzer/)
   typovou analýzu. Všechny tři společně dávají úplné pokrytí statickou analýzou.

## Časté chyby

- **Potlačovat varování bez pochopení**: předpona `_` u proměnných kvůli umlčení varování
  o nepoužité proměnné bez zjištění, proč proměnná není použita, může skrýt skutečné chyby. Vždy
  nejdřív pochopit kořenovou příčinu.
- **Vypínat pro konkrétní soubory**: některé projekty používají potlačení varování po souborech
  nebo modulech. To vytváří nejednotnost a otevírá cestu k hromadění varování. Prismatic Platform
  potlačení po souborech nepodporuje.
- **Zapomínat `--force` v CI**: bez `--force` nemusí inkrementální kompilace rekompilovat soubory
  ovlivněné změnami proti proudu. Modul, který se včera přeložil čistě, může dnes kvůli změně
  závislosti vytvářet varování. V CI vždy vynutit úplnou rekompilaci.
- **Chápat warnings-as-errors jako nepovinné**: není-li politika vynucena v každé bráně (IDE,
  kompilace, pre-commit, CI), vývojáři se naučí, které brány jsou měkké, a obejdou je. Jednotné
  vynucení ve všech bodech je nezbytné.
- **Neaktualizovat zastaralý kód včas**: varování o zastaralých funkcích jsou časované bomby. Dnes
  se přeloží, ale při příští aktualizaci Elixiru selžou. Mají mít stejnou naléhavost jako problémy
  správnosti.

## Související

**Pojmy platformy v tomto glosáři**

- [Clean Run](@/glossary/clean-run.md) – rozšířená politika čisté kompilace nad rámec varování.
- [Quality Debt](@/glossary/quality-debt.md) – varování sledovaná jako QDP před odstraněním.
- [QDP](@/glossary/qdp.md) – metrika dluhu kvality.
- [Violation Protocol](@/glossary/violation-protocol.md) – úrovně eskalace při porušení politiky.
- [NM/ND](@/glossary/nm-nd.md) – řídicí doktrína nulové tolerance.
- [Session Discipline](@/glossary/session-discipline.md) – kontrola před každým commitem.

**Hesla a přehledy platformy mimo tuto knihu**

- [Quality Gates](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/),
  [Pre-Commit Hooks](https://prismatic-reality-com.github.io/prismatic-promo/glossary/pre-commit-hooks/),
  [NO MERCY](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-mercy/),
  [Credo](https://prismatic-reality-com.github.io/prismatic-promo/glossary/credo/),
  [Dialyzer](https://prismatic-reality-com.github.io/prismatic-promo/glossary/dialyzer/),
  [Mix Task](https://prismatic-reality-com.github.io/prismatic-promo/glossary/mix-task/).
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Aplikace](https://prismatic-reality-com.github.io/prismatic-promo/apps/),
  [Příkazy](https://prismatic-reality-com.github.io/prismatic-promo/commands/).

**Kniha**

- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – co kniha
  z platformy přebírá.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: zero-warning-policy](@/kompendium/glossary-bridges/bridge-zero-warning-policy.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
