# patterns/ -- Detection Pattern Modules

> Parent: [lib/prismatic_annihilation/](../README.md) | Project: [apps/prismatic_annihilation/](../../../README.md)

---

## Overview

Detection patterns define the rules, keywords, regex, and confidence weights used to identify epistemic annihilation techniques in content. This directory contains the behaviour definition, compiler/registry, and four category-specific pattern modules.

---

## Architecture

```
PatternBehaviour (callback contract)
       |
       v
PatternCompiler (compilation, ETS indexes, O(1) lookup, detection orchestration)
       |
       +-- GravitationalPatterns   (collapse/singularity patterns)
       +-- InfectionPatterns       (contamination/spread patterns)
       +-- ParadoxPatterns         (self-reference/loop patterns)
       +-- CollapsePatterns        (structural failure patterns)
```

---

## Modules

### PatternBehaviour

**`pattern_behaviour.ex`** -- Behaviour (callback) definition that all pattern modules must implement.

```elixir
@callback all() :: [map()]                                    # All patterns in category
@callback count() :: non_neg_integer()                        # Pattern count
@callback category() :: atom()                                # Category identifier
@callback detect(String.t(), keyword()) :: {:ok, [map()]}     # Run detection
@callback for_technique(atom()) :: [map()]                    # Patterns for technique
```

**Implementation example**:

```elixir
defmodule MyPatterns do
  @behaviour PrismaticAnnihilation.Patterns.PatternBehaviour

  @impl true
  def all, do: [%{id: :my_pattern, name: "My Pattern", category: :custom, ...}]

  @impl true
  def count, do: length(all())

  @impl true
  def category, do: :custom

  @impl true
  def detect(content, opts) do
    threshold = Keyword.get(opts, :threshold, 0.6)
    # ... detection logic ...
    {:ok, matches}
  end

  @impl true
  def for_technique(technique_id) do
    Enum.filter(all(), fn p -> technique_id in p.associated_techniques end)
  end
end
```

---

### PatternCompiler

**`pattern_compiler.ex`** -- Central compiler, indexer, and detection orchestrator.

**Responsibilities**:
1. Compile patterns to optimized forms (regex, keyword indexes)
2. Build ETS indexes for O(1) lookup by technique, category, severity, pattern ID
3. Cache compiled regular expressions
4. Calculate and normalize confidence weights
5. Resolve pattern overlaps between categories

**ETS Tables**:

| Table | Purpose | Key |
|-------|---------|-----|
| `:pattern_compiler_cache` | Compiled regex objects | regex string |
| `:annihilation_pattern_index` | Pattern by ID | pattern_id |
| `:annihilation_technique_index` | Patterns by technique | technique_id |
| `:annihilation_category_index` | Patterns by category | category |
| `:annihilation_severity_index` | Patterns by severity | severity |

**API**:

```elixir
# Compile all patterns and build indexes (idempotent)
{:ok, state} = PatternCompiler.compile_all()
# => %{total_patterns: 200, categories: [...], compiled_at: ...}

# O(1) lookups
{:ok, pattern} = PatternCompiler.get_pattern(:gravitational_collapse_01)
{:ok, patterns} = PatternCompiler.patterns_for_technique(:epistemic_imploze)
{:ok, patterns} = PatternCompiler.patterns_for_category(:gravitational)
{:ok, patterns} = PatternCompiler.patterns_by_severity(:critical)

# Full detection across all categories
{:ok, results} = PatternCompiler.detect_all(content,
  threshold: 0.6,
  categories: :all,
  max_results: 100,
  resolve_overlaps: true
)

# Regex cache management
PatternCompiler.cache_compiled_regex("pattern_str", compiled_regex)
{:ok, regex} = PatternCompiler.get_compiled_regex("pattern_str")
PatternCompiler.cache_size()

# Analysis
PatternCompiler.confidence_weights()    # Per-category weight summary
PatternCompiler.validate_patterns()     # Structural validation
PatternCompiler.stats()                 # Index and memory statistics
```

**Performance**:
- O(1) lookup by any index
- Compiled regex cached in ETS (no recompilation)
- Memory target: <100MB for all patterns
- Thread-safe concurrent reads via ETS public tables
- Lazy initialization (indexes built on first access)

---

### Category Modules

Each implements `PatternBehaviour` and defines patterns specific to an attack vector class.

| Module | File | Category | Focus |
|--------|------|----------|-------|
| `GravitationalPatterns` | `gravitational_patterns.ex` | `:gravitational` | Collapse, implosion, singularity, black hole patterns |
| `InfectionPatterns` | `infection_patterns.ex` | `:infection` | Contamination, viral spread, semiotic infection |
| `ParadoxPatterns` | `paradox_patterns.ex` | `:paradox` | Self-reference loops, logical oscillation, truth instability |
| `CollapsePatterns` | `collapse_patterns.ex` | `:collapse` | Structural failure, cascading breakdown, foundation erosion |

**Pattern Structure**:

Each pattern is a map with:

```elixir
%{
  id: :pattern_id,                          # Unique identifier
  name: "Human-readable name",              # Display name
  category: :gravitational,                 # Category atom
  severity: :critical,                      # Severity level
  confidence_weight: 0.85,                  # Base confidence (0.0-1.0)
  detection_type: :regex,                   # :regex | :keyword | :semantic
  keywords: ["keyword1", "keyword2"],       # Keyword triggers
  regex: "pattern_string",                  # Optional regex
  associated_techniques: [:technique_id],   # Linked technique IDs
  description: "What this pattern detects"  # Documentation
}
```

---

## Detection Pipeline

```
1. Content enters PatternCompiler.detect_all()
2. Category modules selected (all or filtered)
3. Each module's detect/2 called with content + threshold
4. Results collected across all modules
5. Overlaps resolved (max 3 per technique)
6. Sorted by confidence descending
7. Truncated to max_results
8. Telemetry emitted
```

---

## Relationship to Data Files

The Elixir pattern modules in this directory work in parallel with the JSON pattern files in `priv/data/patterns/`. The JSON files (65 files) provide additional detection rules loaded by the `CompendiumLoader`, while these Elixir modules provide compiled, high-performance pattern matching.

---

## Navigation

| Target | Path |
|--------|------|
| Parent | [../README.md](../README.md) |
| Project Root | [../../../README.md](../../../README.md) |
| Pattern Data (JSON) | [../../../priv/data/patterns/README.md](../../../priv/data/patterns/README.md) |
| Compendium Pipeline | [../compendium/README.md](../compendium/README.md) |
| Taxonomy | [../taxonomy/README.md](../taxonomy/README.md) |
| Tests | [../../../test/README.md](../../../test/README.md) |

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Developer Portal](/developers/) | [Architecture](/architecture/) | [Meet the Creator](/about/author/)
