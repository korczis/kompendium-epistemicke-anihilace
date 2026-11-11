+++
title = "Quality debt (dluh kvality)"
weight = 53
description = "Dluh kvality v Prismatic Platform: body dluhu kvality (QDP) se sledují, měří a systematicky odstraňují; prevence místo dodatečné nápravy."

[taxonomies]
tags = ["glossary", "prismatic", "quality", "architecture", "doctrine"]

[extra]
category = "quality"
subcategory = "debt_management"
difficulty = "advanced"
technology_type = "quality_system"
platform_component = "quality_assurance"
measurement_approach = "quantitative"
detection_strategy = "automated"
remediation_approach = "systematic"
prevention_mechanism = "pre_commit_gates"
elimination_status = "complete"
current_count = "zero"
historical_peak = "905_qdp"
abbreviation = "QDP"
prerequisite_concepts = ["quality_gates", "static_analysis", "automated_testing", "technical_debt"]
use_cases = ["quality_measurement", "debt_tracking", "systematic_improvement", "prevention_automation"]
benefits = ["objective_measurement", "systematic_elimination", "automated_prevention", "quality_transparency"]
implementation_patterns = ["cascade_elimination", "domain_classification", "automated_detection", "prevention_gates"]
quality_metrics = ["total_qdp_count", "domain_distribution", "elimination_velocity", "prevention_effectiveness"]
integration_points = ["pre_commit_hooks", "ci_pipeline", "quality_gates", "static_analysis"]
related_disciplines = ["software_quality", "technical_debt_management", "static_analysis", "process_improvement"]
measurement_precision = "single_point_granularity"
related_terms = ["quality-gates", "quality-floor-guardian", "quality-dna", "cascade-pattern", "zero-warning-policy", "static-analysis", "automated-prevention", "technical-debt", "code-quality"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["Quality", "Debt", "Points", "glossary", "Prismatic Platform", "Custom", "Dialyzer", "CASCADE"]
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Quality debt (dluh kvality) – glosář"
+++

## Definice a přehled

Dluh kvality (*quality debt*), měřený v bodech dluhu kvality ([QDP](@/glossary/qdp.md),
*Quality Debt Points*), je kvantitativní systém metrik, který každé odchylce od standardů
kvality platformy přiřazuje diskrétní číselnou hodnotu. Na rozdíl od volně vymezeného pojmu
„technický dluh“, běžného v softwarovém inženýrství, je QDP přesně specifikován: každý typ
porušení má stanovenou bodovou hodnotu, každé porušení se automaticky odhalí a celkový počet
QDP slouží jako jediné kanonické měřítko zdraví kvality platformy. Základní zásadou je, že
kvalitu nelze řídit, nelze-li ji měřit, a QDP toto měření poskytuje přesně.

Dluh kvality zahrnuje širokou taxonomii porušení napříč několika oblastmi: chybějící typové
specifikace, varování statické analýzy Credo, typové chyby Dialyzeru, varování při kompilaci,
užití antivzorců (např. `length() > 0` místo porovnávání se vzorem), nebezpečné vzory přístupu
do map, chybějící anotace `@impl`, volání `Process.sleep` mimo testovací kód a jakoukoli další
odchylku od kodifikovaných standardů kvality platformy. Každé porušení se zařadí podle oblasti,
závažnosti a složitosti nápravy.

Podle dokumentace platformy bylo v době zápisu dosaženo úplného odstranění QDP – 0 QDP ve všech
13 oblastech kvality u všech aplikací umbrelly (na tomto místě se uvádí 90 aplikací, jinde 115;
čísla se v dokumentaci liší podle doby zápisu). Nešlo o postupné snižování, ale o systematickou
kampaň, která pomocí specializovaných vzorů CASCADE odstranila 905 QDP, a následnou
automatizovanou prevenci pre-commit hooky, které zablokují každý commit zavádějící nové QDP.
Platforma nyní pracuje v ustáleném stavu bez dluhu, v němž prevence nahradila nápravu jako
hlavní strategii kvality.

Pro Kompendium je dluh kvality pojmem z kontextu platformy. Kniha se s ním potkává nepřímo:
i obsah knihy má svůj „dluh“ (stránky bez diakritiky, bez odkazů, s nejistými zdroji), který
se eviduje kontrolami informační architektury a odstraňuje po vlnách, nikoli zamlčuje.

## Technický rozbor

### Taxonomie QDP

Body dluhu kvality se třídí do 13 samostatných oblastí kvality, z nichž každá má vlastní
detekční mechanismus, vážení závažnosti a přístup k nápravě:

| Oblast | Nástroj detekce | Váha QDP | Aktuální počet |
|--------|---------------|------------|---------------|
| Dialyzer | `mix dialyzer` | 3 za porušení | 0 |
| Credo | `mix credo --strict` | 1–2 za porušení | 0 |
| Kompilace | `--warnings-as-errors` | 2 za varování | 0 |
| Přesnost DateTime | vlastní analyzátor | 1 za porušení | 0 |
| Guard funkce | vlastní analyzátor | 1 za porušení | 0 |
| Pokrytí @impl | vlastní analyzátor | 1 za chybějící | 0 |
| Paměťová bezpečnost | vlastní analyzátor | 3 za porušení | 0 |
| Výkon | Benchee + vlastní | 2 za porušení | 0 |
| Prevence regresí | kontrola pokrytí testy | 3 za chybějící test | 0 |
| Časové vzory | vlastní analyzátor | 2 za porušení | 0 |
| Správa TODO | vlastní skener | 1 za zastaralé TODO | 0 |
| Pokrytí typespecy | vlastní analyzátor | 1 za chybějící spec | 0 |
| Nebezpečný přístup do mapy | vlastní analyzátor | 2 za porušení | 0 |

Váhy v této tabulce se liší od stupnice závažnosti v hesle [QDP](@/glossary/qdp.md) (1–5 bodů
podle P0–P3); obě podoby pocházejí z různých verzí dokumentace platformy.

### Detekční pipeline QDP

Detekční pipeline běží v několika integračních bodech, aby se porušení zachytila co nejdříve:

```elixir
defmodule Prismatic.Quality.DebtDetector do
  @moduledoc """
  Detects and quantifies quality debt across all domains.
  Returns a structured report of QDP by domain, file, and severity.
  """

  @type qdp_violation :: %{
    domain: atom(),
    file: String.t(),
    line: non_neg_integer(),
    message: String.t(),
    weight: pos_integer(),
    auto_fixable: boolean()
  }

  @type qdp_report :: %{
    total_qdp: non_neg_integer(),
    by_domain: %{atom() => non_neg_integer()},
    violations: [qdp_violation()],
    timestamp: DateTime.t()
  }

  @spec scan_all() :: qdp_report()
  def scan_all do
    domains = [
      :dialyzer, :credo, :compilation, :datetime_precision,
      :guard_functions, :impl_coverage, :memory_safety,
      :performance, :regression, :timing, :todo,
      :typespec_coverage, :unsafe_map_access
    ]

    violations =
      domains
      |> Task.async_stream(&scan_domain/1, max_concurrency: System.schedulers_online())
      |> Enum.flat_map(fn {:ok, result} -> result end)

    %{
      total_qdp: Enum.sum(Enum.map(violations, & &1.weight)),
      by_domain: group_by_domain(violations),
      violations: violations,
      timestamp: DateTime.utc_now()
    }
  end

  @spec scan_domain(atom()) :: [qdp_violation()]
  def scan_domain(:unsafe_map_access) do
    # Detect map[:key] patterns that should use Map.get/3 or pattern matching
    scan_files_for_pattern(~r/\w+\[:[a-z_]+\]/, :unsafe_map_access, 2)
  end

  def scan_domain(:typespec_coverage) do
    # Detect public functions without @spec annotations
    find_unspecced_public_functions()
  end

  def scan_domain(:memory_safety) do
    # Detect potentially unsafe memory patterns
    violations = []
    violations = violations ++ scan_for_spawn_link_without_trap()
    violations = violations ++ scan_for_large_binary_copies()
    violations = violations ++ scan_for_unbounded_recursion()
    violations
  end

  def scan_domain(:performance) do
    # Detect performance anti-patterns
    violations = []
    violations = violations ++ scan_for_length_comparisons()
    violations = violations ++ scan_for_inefficient_enum_operations()
    violations = violations ++ scan_for_n_plus_one_queries()
    violations
  end

  defp scan_for_length_comparisons do
    # Detect length(list) > 0 instead of pattern matching
    scan_files_for_pattern(~r/length\([^)]+\)\s*[><!]=?\s*0/, :inefficient_length_check, 1)
  end

  defp scan_for_n_plus_one_queries do
    # Detect potential N+1 query patterns in contexts
    scan_files_for_pattern(~r/Enum\.map\([^]+,\s*fn[^}]*Repo\.(get|all)/, :potential_n_plus_one, 3)
  end

  defp find_unspecced_public_functions do
    Application.get_env(:prismatic, :apps, [])
    |> Enum.flat_map(fn app ->
      app_path = "apps/#{app}/lib"
      if File.exists?(app_path) do
        find_public_functions_without_specs(app_path)
      else
        []
      end
    end)
  end

  defp find_public_functions_without_specs(path) do
    Path.wildcard("#{path}/**/*.ex")
    |> Enum.flat_map(&analyze_file_for_missing_specs/1)
  end

  defp analyze_file_for_missing_specs(file_path) do
    try do
      content = File.read!(file_path)
      {:ok, ast} = Code.string_to_quoted(content, file: file_path)

      analyze_ast_for_specs(ast, file_path, content)
    rescue
      _ -> []
    end
  end

  defp analyze_ast_for_specs(ast, file_path, content) do
    lines = String.split(content, "\n")

    {_acc, violations} = Macro.prewalk(ast, [], fn
      {:defmodule, meta, _} = node, acc ->
        # Track current module for context
        {node, acc}

      {:def, meta, [{function_name, _, args} | _]} = node, acc when is_atom(function_name) ->
        line_number = meta[:line] || 1

        # Check if this is a public function (doesn't start with underscore)
        if not String.starts_with?(to_string(function_name), "_") and
           not has_spec_before_line(lines, line_number) do

          violation = %{
            domain: :typespec_coverage,
            file: file_path,
            line: line_number,
            message: "Public function #{function_name}/#{length(args || [])} missing @spec",
            weight: 1,
            auto_fixable: false
          }

          {node, [violation | acc]}
        else
          {node, acc}
        end

      node, acc ->
        {node, acc}
    end)

    violations
  end

  defp has_spec_before_line(lines, function_line) do
    # Look for @spec annotation in the few lines before the function
    start_line = max(0, function_line - 5)
    end_line = function_line - 2

    Enum.slice(lines, start_line, end_line - start_line + 1)
    |> Enum.any?(fn line -> String.contains?(String.trim(line), "@spec") end)
  end
end

defmodule Prismatic.Quality.CascadeEliminator do
  @moduledoc """
  Implements CASCADE patterns for systematic QDP elimination.
  CASCADE = Categorize, Analyze, Systematize, Coordinate, Automate, Deploy, Eliminate
  """

  @type cascade_strategy :: :domain_sweep | :file_focused | :severity_prioritized | :auto_fixable_first

  @spec eliminate_qdp_with_cascade(cascade_strategy()) :: {:ok, map()} | {:error, term()}
  def eliminate_qdp_with_cascade(strategy \\ :domain_sweep) do
    initial_report = Prismatic.Quality.DebtDetector.scan_all()

    if initial_report.total_qdp == 0 do
      {:ok, %{message: "No QDP found - platform is debt-free", report: initial_report}}
    else
      execute_cascade_strategy(strategy, initial_report)
    end
  end

  defp execute_cascade_strategy(:domain_sweep, report) do
    # Categorize: Group violations by domain
    domain_groups = Enum.group_by(report.violations, & &1.domain)

    # Analyze: Determine elimination order by impact/effort ratio
    ordered_domains = prioritize_domains_by_impact(domain_groups)

    # Systematize: Create domain-specific elimination plans
    elimination_plans = Enum.map(ordered_domains, fn {domain, violations} ->
      create_domain_elimination_plan(domain, violations)
    end)

    # Coordinate: Execute plans in sequence with validation
    results = execute_elimination_plans(elimination_plans)

    # Automate: Generate prevention rules for eliminated violations
    generate_prevention_automation(results)

    # Deploy: Update pre-commit hooks and CI gates
    deploy_prevention_measures(results)

    # Eliminate: Verify zero QDP state
    final_report = Prismatic.Quality.DebtDetector.scan_all()

    {:ok, %{
      initial_qdp: report.total_qdp,
      final_qdp: final_report.total_qdp,
      eliminated: report.total_qdp - final_report.total_qdp,
      strategies_used: elimination_plans
    }}
  end

  defp execute_cascade_strategy(:auto_fixable_first, report) do
    # Focus on violations that can be automatically fixed
    {auto_fixable, manual_fix_required} = Enum.split_with(report.violations, & &1.auto_fixable)

    # Apply automatic fixes first
    auto_fix_results = apply_automatic_fixes(auto_fixable)

    # Generate manual fix guidance for remaining violations
    manual_guidance = generate_manual_fix_guidance(manual_fix_required)

    {:ok, %{
      auto_fixed: length(auto_fixable),
      manual_remaining: length(manual_fix_required),
      auto_fix_results: auto_fix_results,
      manual_guidance: manual_guidance
    }}
  end

  defp prioritize_domains_by_impact(domain_groups) do
    # Prioritize domains by business impact and remediation complexity
    domain_priorities = %{
      memory_safety: %{priority: 1, impact: :critical},
      dialyzer: %{priority: 2, impact: :high},
      compilation: %{priority: 3, impact: :high},
      performance: %{priority: 4, impact: :medium},
      regression: %{priority: 5, impact: :high},
      unsafe_map_access: %{priority: 6, impact: :medium},
      typespec_coverage: %{priority: 7, impact: :low},
      impl_coverage: %{priority: 8, impact: :low},
      credo: %{priority: 9, impact: :low},
      timing: %{priority: 10, impact: :low},
      guard_functions: %{priority: 11, impact: :low},
      datetime_precision: %{priority: 12, impact: :low},
      todo: %{priority: 13, impact: :very_low}
    }

    domain_groups
    |> Enum.map(fn {domain, violations} ->
      priority_info = Map.get(domain_priorities, domain, %{priority: 999, impact: :unknown})
      {domain, violations, priority_info}
    end)
    |> Enum.sort_by(fn {_domain, _violations, %{priority: priority}} -> priority end)
    |> Enum.map(fn {domain, violations, _priority} -> {domain, violations} end)
  end

  defp create_domain_elimination_plan(domain, violations) do
    case domain do
      :unsafe_map_access ->
        create_map_access_elimination_plan(violations)

      :typespec_coverage ->
        create_typespec_elimination_plan(violations)

      :length_antipattern ->
        create_length_pattern_elimination_plan(violations)

      :memory_safety ->
        create_memory_safety_elimination_plan(violations)

      _ ->
        create_generic_elimination_plan(domain, violations)
    end
  end

  defp create_map_access_elimination_plan(violations) do
    %{
      domain: :unsafe_map_access,
      violation_count: length(violations),
      strategy: :pattern_replacement,
      steps: [
        {:scan, "Identify all map[:key] patterns"},
        {:analyze, "Determine appropriate replacement (Map.get/3 or pattern matching)"},
        {:transform, "Apply AST transformations to replace patterns"},
        {:test, "Run test suite to ensure no regressions"},
        {:validate, "Confirm elimination with scanner"}
      ],
      automation: %{
        auto_fixable: true,
        fix_command: "mix quality.fix_map_access",
        validation_command: "mix quality.scan_domain unsafe_map_access"
      },
      prevention: %{
        pre_commit_hook: "Block commits containing map[:key] patterns",
        credo_rule: "Create custom Credo rule for detection",
        documentation: "Update style guide with Map.get/3 guidance"
      }
    }
  end

  defp create_typespec_elimination_plan(violations) do
    files_affected = violations |> Enum.map(& &1.file) |> Enum.uniq()

    %{
      domain: :typespec_coverage,
      violation_count: length(violations),
      files_affected: length(files_affected),
      strategy: :systematic_annotation,
      steps: [
        {:inventory, "Group violations by module and function complexity"},
        {:generate, "Use Dialyzer success typing to infer @spec annotations"},
        {:apply, "Add @spec annotations with appropriate type information"},
        {:refine, "Review and refine generated specs for accuracy"},
        {:validate, "Ensure all public functions have appropriate specs"}
      ],
      automation: %{
        auto_fixable: false,  # Requires human review for type accuracy
        generation_command: "mix quality.generate_specs",
        validation_command: "mix quality.scan_domain typespec_coverage"
      },
      prevention: %{
        pre_commit_hook: "Block commits with unspecced public functions",
        mix_task: "mix quality.enforce_specs",
        template_update: "Update function templates to include @spec"
      }
    }
  end

  defp apply_automatic_fixes(auto_fixable_violations) do
    Enum.map(auto_fixable_violations, fn violation ->
      case violation.domain do
        :unsafe_map_access ->
          apply_map_access_fix(violation)

        :length_antipattern ->
          apply_length_pattern_fix(violation)

        :guard_functions ->
          apply_guard_function_fix(violation)

        _ ->
          {:skipped, "No automatic fix available for #{violation.domain}"}
      end
    end)
  end

  defp apply_map_access_fix(violation) do
    file_content = File.read!(violation.file)

    # Replace map[:key] with Map.get(map, :key) or appropriate pattern
    updated_content = String.replace(file_content, ~r/(\w+)\[:([a-z_]+)\]/, "Map.get(\\1, :\\2)")

    File.write!(violation.file, updated_content)

    {:fixed, %{
      file: violation.file,
      line: violation.line,
      transformation: "map[:key] -> Map.get(map, :key)"
    }}
  end

  defp generate_prevention_automation(elimination_results) do
    eliminated_domains = Enum.map(elimination_results, & &1.domain) |> Enum.uniq()

    prevention_rules = Enum.map(eliminated_domains, fn domain ->
      case domain do
        :unsafe_map_access ->
          """
          # Pre-commit hook rule for unsafe map access
          if git diff --cached --name-only | grep -E '\\.(ex|exs)$' | xargs grep -l 'map\\[:' > /dev/null; then
            echo "❌ Commit blocked: unsafe map access pattern detected"
            echo "Use Map.get/3 or pattern matching instead of map[:key]"
            exit 1
          fi
          """

        :typespec_coverage ->
          """
          # Pre-commit hook rule for missing typespecs
          if git diff --cached --name-only | grep -E '\\.ex$' | xargs -I {} sh -c 'mix quality.check_specs {}' | grep -q 'missing'; then
            echo "❌ Commit blocked: public functions missing @spec annotations"
            exit 1
          fi
          """

        _ ->
          "# Generic prevention rule for #{domain}"
      end
    end)

    File.write!(".githooks/pre-commit-qdp-prevention", Enum.join(prevention_rules, "\n\n"))

    {:ok, %{rules_generated: length(prevention_rules), domains_covered: eliminated_domains}}
  end
end

defmodule Prismatic.Quality.DebtMetrics do
  @moduledoc """
  Provides comprehensive metrics and analytics for Quality Debt management.
  """

  @spec calculate_debt_metrics() :: map()
  def calculate_debt_metrics do
    current_report = Prismatic.Quality.DebtDetector.scan_all()
    historical_data = load_historical_debt_data()

    %{
      current_state: analyze_current_state(current_report),
      trends: analyze_debt_trends(historical_data),
      domain_analysis: analyze_domain_distribution(current_report),
      elimination_efficiency: calculate_elimination_efficiency(historical_data),
      prevention_effectiveness: measure_prevention_effectiveness(),
      quality_score: calculate_overall_quality_score(current_report)
    }
  end

  defp analyze_current_state(report) do
    %{
      total_qdp: report.total_qdp,
      debt_free: report.total_qdp == 0,
      domains_affected: map_size(report.by_domain),
      files_affected: report.violations |> Enum.map(& &1.file) |> Enum.uniq() |> length(),
      auto_fixable_percentage: calculate_auto_fixable_percentage(report.violations),
      severity_distribution: analyze_severity_distribution(report.violations)
    }
  end

  defp analyze_debt_trends(historical_data) do
    if length(historical_data) < 2 do
      %{trend: :insufficient_data}
    else
      sorted_data = Enum.sort_by(historical_data, & &1.timestamp, DateTime)
      recent_data = Enum.take(sorted_data, -30)  # Last 30 data points

      %{
        trend_direction: determine_trend_direction(recent_data),
        elimination_velocity: calculate_elimination_velocity(recent_data),
        peak_debt: Enum.max_by(sorted_data, & &1.total_qdp).total_qdp,
        debt_free_date: find_debt_free_achievement_date(sorted_data),
        improvement_rate: calculate_improvement_rate(sorted_data)
      }
    end
  end

  defp calculate_elimination_efficiency(historical_data) do
    if length(historical_data) < 10 do
      %{efficiency: :insufficient_data}
    else
      elimination_events = identify_elimination_events(historical_data)

      %{
        total_elimination_events: length(elimination_events),
        average_qdp_per_event: calculate_average_elimination_size(elimination_events),
        most_effective_strategy: identify_most_effective_strategy(elimination_events),
        time_to_eliminate_by_domain: calculate_domain_elimination_times(elimination_events)
      }
    end
  end

  defp measure_prevention_effectiveness do
    # Analyze how effectively pre-commit hooks prevent QDP introduction
    recent_commits = get_recent_commit_attempts(days: 30)

    blocked_commits = Enum.count(recent_commits, & &1.blocked_by_quality_gate)
    total_attempts = length(recent_commits)

    prevention_rate = if total_attempts > 0, do: blocked_commits / total_attempts, else: 0

    %{
      total_commit_attempts: total_attempts,
      blocked_by_quality_gates: blocked_commits,
      prevention_rate: prevention_rate,
      most_common_blocked_violations: analyze_blocked_violation_types(recent_commits),
      false_positive_rate: calculate_false_positive_rate(recent_commits)
    }
  end

  defp calculate_overall_quality_score(report) do
    base_score = 100

    # Deduct points for various types of violations
    deductions = %{
      critical_violations: report.violations |> Enum.count(&(&1.weight >= 3)) |> Kernel.*(5),
      medium_violations: report.violations |> Enum.count(&(&1.weight == 2)) |> Kernel.*(2),
      minor_violations: report.violations |> Enum.count(&(&1.weight == 1)) |> Kernel.*(1)
    }

    total_deductions = deductions.critical_violations + deductions.medium_violations + deductions.minor_violations

    final_score = max(0, base_score - total_deductions)

    %{
      score: final_score,
      grade: score_to_grade(final_score),
      deductions: deductions,
      perfect_score: final_score == 100
    }
  end

  defp score_to_grade(score) when score >= 95, do: :A_plus
  defp score_to_grade(score) when score >= 90, do: :A
  defp score_to_grade(score) when score >= 85, do: :B_plus
  defp score_to_grade(score) when score >= 80, do: :B
  defp score_to_grade(score) when score >= 75, do: :C_plus
  defp score_to_grade(score) when score >= 70, do: :C
  defp score_to_grade(score) when score >= 65, do: :D_plus
  defp score_to_grade(score) when score >= 60, do: :D
  defp score_to_grade(_score), do: :F

  # Helper functions for historical analysis
  defp load_historical_debt_data do
    # Load from persistent storage (ETS, database, files, etc.)
    case File.read(".claude/quality-dna/debt-history.json") do
      {:ok, content} ->
        Jason.decode!(content, keys: :atoms)
      {:error, _} ->
        []
    end
  end

  defp determine_trend_direction(data) do
    if length(data) < 2 do
      :stable
    else
      first_half = Enum.take(data, div(length(data), 2))
      second_half = Enum.drop(data, div(length(data), 2))

      avg_first = Enum.sum(Enum.map(first_half, & &1.total_qdp)) / length(first_half)
      avg_second = Enum.sum(Enum.map(second_half, & &1.total_qdp)) / length(second_half)

      cond do
        avg_second < avg_first * 0.9 -> :improving
        avg_second > avg_first * 1.1 -> :degrading
        true -> :stable
      end
    end
  end

  defp find_debt_free_achievement_date(sorted_data) do
    Enum.find(sorted_data, fn data -> data.total_qdp == 0 end)
    |> case do
      nil -> :not_achieved
      %{timestamp: timestamp} -> timestamp
    end
  end
end

  defp group_by_domain(violations) do
    violations
    |> Enum.group_by(& &1.domain)
    |> Map.new(fn {domain, vs} -> {domain, Enum.sum(Enum.map(vs, & &1.weight))} end)
  end
end
```

### Odstraňování vzory CASCADE

Odstranění 905 QDP se podařilo vzory CASCADE – hromadnými opravnými strategiemi, které řeší
celé kategorie porušení najednou, místo oprav jednotlivých výskytů:

```elixir
defmodule Prismatic.Quality.CascadeEliminator do
  @moduledoc """
  Applies CASCADE patterns for bulk QDP elimination.
  Each pattern targets a specific violation category for mass remediation.
  """

  @type cascade_pattern ::
    :type_mismatch
    | :dead_code
    | :empty_check
    | :timer_replacement
    | :nuclear_cache

  @spec apply_cascade(cascade_pattern(), keyword()) :: {:ok, non_neg_integer()} | {:error, term()}
  def apply_cascade(:type_mismatch, opts) do
    # Fix all @spec mismatches detected by Dialyzer
    files = Keyword.get(opts, :files, all_elixir_files())

    fixed_count =
      files
      |> Enum.map(&fix_type_mismatches/1)
      |> Enum.sum()

    {:ok, fixed_count}
  end

  def apply_cascade(:empty_check, opts) do
    # Replace length() > 0 with pattern matching or Enum.any?
    files = Keyword.get(opts, :files, all_elixir_files())

    fixed_count =
      files
      |> Enum.map(&replace_empty_checks/1)
      |> Enum.sum()

    {:ok, fixed_count}
  end

  def apply_cascade(:timer_replacement, opts) do
    # Replace Process.sleep with :timer or test-safe alternatives
    files = Keyword.get(opts, :files, all_elixir_files())

    fixed_count =
      files
      |> Enum.map(&replace_process_sleep/1)
      |> Enum.sum()

    {:ok, fixed_count}
  end
end
```

### Oprava „Nuclear Cache“

Jedním z nejdůležitějších vzorů CASCADE je oprava Nuclear Cache, používaná, když se poškodí
cache Dialyzeru nebo kompilace a vznikají fantomová QDP, která neodpovídají skutečným problémům
v kódu:

```bash
# Nuclear Cache Fix - eliminates phantom QDP from corrupted caches
rm -rf _build/dev/lib/prismatic_claude/ebin && rm -rf priv/plts/dialyzer.plt

# Then rebuild cleanly
mix compile --force && mix dialyzer --plt
```

## Architektura a implementace

### Architektura prevence QDP

Architektura „prevence na prvním místě“ zajišťuje udržení nulového QDP několika vrstvami
vynucení:

```
Code Change
    |
    v
Pre-Commit Hook (Phase 1: Compilation warnings)
    |
    v
Pre-Commit Hook (Phase 2: Credo strict)
    |
    v
Pre-Commit Hook (Phase 3: QDP scan)
    |
    v
Pre-Commit Hook (Phase 4: Quality Gates)
    |
    v
CI Pipeline (Full QDP scan + Dialyzer)
    |
    v
Quality Floor Guardian (Continuous monitoring)
    |
    v
Quality DNA (Persistent state recording)
```

Každá vrstva zachytí jiné kategorie QDP; dřívější vrstvy dávají rychlejší zpětnou vazbu
u běžných porušení, pozdější provádějí hlubší analýzu.

### Napojení na Quality DNA

Každý výsledek skenu QDP se ukládá do [Quality
DNA](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-dna/) pro sledování
napříč sezeními:

```elixir
defmodule Prismatic.Quality.DNARecorder do
  @moduledoc """
  Records QDP scan results to Quality DNA for historical tracking.
  """

  @dna_path ".claude/quality-dna/current-state.json"

  @spec record_scan(Prismatic.Quality.DebtDetector.qdp_report()) :: :ok
  def record_scan(report) do
    current_dna = load_dna()

    updated_dna =
      current_dna
      |> Map.put(:latest_scan, report)
      |> Map.update(:history, [report], fn history -> [report | Enum.take(history, 99)] end)
      |> Map.put(:trend, calculate_trend(current_dna, report))

    save_dna(updated_dna)
  end

  defp calculate_trend(previous_dna, current_report) do
    previous_total = get_in(previous_dna, [:latest_scan, :total_qdp]) || 0
    current_total = current_report.total_qdp

    cond do
      current_total < previous_total -> :improving
      current_total > previous_total -> :regressing
      true -> :stable
    end
  end
end
```

## Užití v Prismatic Platform

### Běžné příkazy

```bash
# Full QDP scan across all domains
mix quality.gates

# Quick QDP check (fast subset for pre-commit)
mix quality.gates.check --fast

# Domain-specific scanning
mix credo --strict
mix dialyzer
mix compile --warnings-as-errors --force

# CASCADE elimination (when QDP exists)
mix quality.cascade --pattern=type_mismatch --apply
mix quality.cascade --pattern=empty_check --dry-run

# Quality enforcement standard
mix quality.enforce_standard
mix quality.enforce_standard --fix
```

### Výklad zprávy QDP

Zpráva QDP poskytuje použitelné informace pro nápravu:

| Pole | Popis | Akce |
|-------|-------------|--------|
| `total_qdp` | součet všech vážených porušení | pro commit musí být 0 |
| `by_domain` | rozpad QDP podle oblastí kvality | upřednostnit oblasti s nejvyšší váhou |
| `violations` | podrobnosti jednotlivých porušení | opravovat od automaticky opravitelných |
| `auto_fixable` | zda to CASCADE dokáže opravit | nejdřív uplatnit vzory CASCADE |

## Osvědčené postupy

1. **Řešit QDP okamžitě po vzniku.** Pre-commit hook blokuje commity s nenulovým QDP, ale
   narazíte-li na QDP během vývoje, opravte je dřív než cokoli jiného. Necháte-li QDP
   hromadit, rychle se úročí.
2. **Pro hromadné odstranění používat vzory CASCADE.** Při více porušeních téhož typu je
   neopravujte jednotlivě. Uplatněte příslušný vzor CASCADE a odstraňte celou kategorii najednou.
3. **Při fantomových QDP spustit opravu Nuclear Cache.** Hlásí-li skener QDP porušení, která
   neodpovídají viditelným problémům v kódu, jsou pravděpodobnou příčinou poškozené artefakty
   sestavení.
4. **Sledovat trendy QDP v Quality DNA.** I při nulovém QDP sledujte frekvenci skenů a zdraví
   oblastí v čase. Náhlé výkyvy v trvání skenu nebo varování v konkrétní oblasti mohou ukázat
   na vznikající problémy dřív, než se projeví jako QDP.
5. **Správně vážit porušení.** Ne všechna QDP jsou stejná. Porušení Dialyzeru (váha 3) ukazuje
   na možnou běhovou chybu, zatímco neuklizené TODO (váha 1) je kosmetické. Upřednostněte
   oblasti s vysokou váhou.

## Časté chyby

- **Zaměňovat QDP s technickým dluhem**: technický dluh je subjektivní hodnocení kvality návrhu.
  QDP je objektivní, měřený počet konkrétních, kodifikovaných porušení. Překrývají se, ale
  nejsou totožné.
- **Přehlížet automaticky opravitelná porušení**: mnoho QDP lze odstranit automaticky vzory
  CASCADE. Ruční opravy porušení, pro která existuje automatizované řešení, plýtvají časem
  vývojářů.
- **Vypínat pre-commit hooky kvůli obejití kontrol QDP**: platforma výslovně zakazuje přepínač
  `--no-verify` (viz [Session Discipline](@/glossary/session-discipline.md)). Obcházení
  prevence QDP vytváří falešný dojem pokroku a zhoršuje kvalitu.
- **Brát nulové QDP jako konečný cíl**: nulové QDP znamená, že platforma splňuje *současné*
  standardy kvality. Standardy se mají v čase vyvíjet – přidávat nové oblasti a zpřísňovat prahy,
  jak platforma dozrává.
- **Hromadné opravy QDP ve velkých commitech**: každá oprava QDP má být atomickým commitem kvůli
  dohledatelnosti. Sloučení 50 oprav do jednoho commitu znehodnotí `git blame` pro pochopení,
  proč byly konkrétní změny provedeny.

## Dluh kvality a doktrína platformy

Odstraňování dluhu kvality je praktickým výrazem doktríny [NO MERCY, NO
DOUBTS](@/glossary/no-mercy-no-doubts.md): nic se neodkládá „na později“. Navazují na něj
[politika nulových varování](@/glossary/zero-warning-policy.md), požadavek [čistého
běhu](@/glossary/clean-run.md) a povinné [regresní testy](@/glossary/regression-test.md),
které brání návratu jednou opravených vad. Automatickou nápravu zajišťují
[AutoHeal](@/glossary/autoheal.md) a [AutoEvolve](@/glossary/autoevolve.md).

## Související

**Pojmy platformy v tomto glosáři**

- [QDP](@/glossary/qdp.md) – metrika a metodika skórování podrobně.
- [Zero Warning Policy](@/glossary/zero-warning-policy.md) – standard kompilace, který brání
  QDP typu varování.
- [Clean Run](@/glossary/clean-run.md) – stav bez varování a šumu.
- [Regression Test](@/glossary/regression-test.md) – prevence návratu opravených vad.
- [NO MERCY, NO DOUBTS](@/glossary/no-mercy-no-doubts.md) – doktrína, z níž nulová tolerance
  k dluhu vychází.

**Hesla a přehledy platformy mimo tuto knihu**

- [Quality Gates](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/),
  [Quality Floor Guardian](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-floor-guardian/),
  [Quality DNA](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-dna/),
  [CASCADE Pattern](https://prismatic-reality-com.github.io/prismatic-promo/glossary/cascade-pattern/) –
  pipeline prevence, autonomní monitorování, historie QDP a hromadné opravné vzory.
- [Credo](https://prismatic-reality-com.github.io/prismatic-promo/glossary/credo/),
  [Dialyzer](https://prismatic-reality-com.github.io/prismatic-promo/glossary/dialyzer/),
  [Pre-Commit Hooks](https://prismatic-reality-com.github.io/prismatic-promo/glossary/pre-commit-hooks/) –
  nástroje detekce a první bod vynucení.
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Příkazy](https://prismatic-reality-com.github.io/prismatic-promo/commands/) – přehledy platformy.

**Kniha**

- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – co
  kniha z platformy přebírá.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: quality-debt](@/kompendium/glossary-bridges/bridge-quality-debt.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
