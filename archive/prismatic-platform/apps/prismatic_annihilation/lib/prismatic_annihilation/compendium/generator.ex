defmodule PrismaticAnnihilation.Compendium.Generator do
  @moduledoc """
  Generates data files, schemas, and relationship graphs from transformed techniques.

  Produces the complete data directory structure:
  - `priv/data/taxonomy/` - Individual technique JSON files (178 files)
  - `priv/data/patterns/` - Detection patterns organized by category
  - `priv/data/relationships/` - Technique interconnection graphs
  - `priv/data/schemas/` - JSON Schema validation files

  ## Pipeline Position

  Extractor -> Transformer -> Generator
  """

  alias PrismaticAnnihilation.Compendium.{Transformer, Extractor}

  require Logger

  @type generation_result :: %{
          files_written: non_neg_integer(),
          taxonomy_files: [String.t()],
          pattern_files: [String.t()],
          relationship_files: [String.t()],
          schema_files: [String.t()],
          generation_timestamp: DateTime.t()
        }

  @priv_dir :code.priv_dir(:prismatic_annihilation)

  @doc """
  Generates all data files from transformed technique data.

  Creates:
  1. Individual technique JSON files in `taxonomy/`
  2. Category-organized pattern files in `patterns/`
  3. Relationship graph files in `relationships/`
  4. JSON Schema validation files in `schemas/`
  5. Master index file with all techniques
  6. Statistics and metadata files

  ## Options
  - `:output_dir` - Override output directory (default: priv/data)
  - `:pretty` - Pretty-print JSON (default: true)
  """
  @spec generate_all(Transformer.transform_result(), keyword()) ::
          {:ok, generation_result()} | {:error, term()}
  def generate_all(transform_result, opts \\ []) do
    output_dir = Keyword.get(opts, :output_dir, Path.join(@priv_dir, "data"))
    pretty = Keyword.get(opts, :pretty, true)

    Logger.info(
      "[Compendium.Generator] Generating files for #{length(transform_result.techniques)} techniques"
    )

    ensure_directories(output_dir)

    taxonomy_files = generate_taxonomy_files(transform_result.techniques, output_dir, pretty)
    pattern_files = generate_pattern_files(transform_result.techniques, output_dir, pretty)
    relationship_files = generate_relationship_files(transform_result, output_dir, pretty)
    schema_files = generate_schema_files(output_dir, pretty)
    index_files = generate_index_files(transform_result, output_dir, pretty)

    all_files = taxonomy_files ++ pattern_files ++ relationship_files ++ schema_files ++ index_files

    result = %{
      files_written: length(all_files),
      taxonomy_files: taxonomy_files,
      pattern_files: pattern_files,
      relationship_files: relationship_files,
      schema_files: schema_files,
      generation_timestamp: DateTime.utc_now()
    }

    Logger.info("[Compendium.Generator] Generated #{result.files_written} files")

    {:ok, result}
  end

  # --- Directory Setup ---

  defp ensure_directories(output_dir) do
    Enum.each(
      ["taxonomy", "patterns", "relationships", "schemas"],
      fn subdir ->
        dir = Path.join(output_dir, subdir)
        File.mkdir_p!(dir)
      end
    )
  end

  # --- Taxonomy File Generation ---

  defp generate_taxonomy_files(techniques, output_dir, pretty) do
    taxonomy_dir = Path.join(output_dir, "taxonomy")

    techniques
    |> Enum.map(fn technique ->
      filename = "#{technique.id}.json"
      path = Path.join(taxonomy_dir, filename)

      data = %{
        "$schema" => "../schemas/technique.schema.json",
        "id" => technique.id,
        "name" => %{
          "cs" => technique.name_cs,
          "en" => technique.name_en
        },
        "category" => technique.category,
        "subcategory" => technique.subcategory,
        "severity" => %{
          "level" => technique.severity,
          "score" => technique.severity_score
        },
        "domain" => technique.domain,
        "temporal_profile" => technique.temporal_profile,
        "reversibility" => %{
          "level" => technique.reversibility,
          "score" => technique.reversibility_score
        },
        "typical_manifestations" => technique.typical_manifestations,
        "defense_strategies" => technique.defense_strategies,
        "description" => %{
          "cs" => technique.description_cs,
          "en" => technique.description_en
        },
        "example" => %{
          "cs" => technique.example_cs
        },
        "cross_references" => technique.cross_references,
        "detection_patterns" => technique.detection_patterns,
        "page_number" => technique.page_number,
        "metadata" => technique.metadata
      }

      write_json(path, data, pretty)
      path
    end)
  end

  # --- Pattern File Generation ---

  defp generate_pattern_files(techniques, output_dir, pretty) do
    patterns_dir = Path.join(output_dir, "patterns")

    category_files =
      techniques
      |> Enum.group_by(& &1.category)
      |> Enum.map(fn {category, techs} ->
        filename = "#{category}.json"
        path = Path.join(patterns_dir, filename)

        data = %{
          "$schema" => "../schemas/pattern_category.schema.json",
          "category" => category,
          "technique_count" => length(techs),
          "patterns" =>
            Enum.map(techs, fn t ->
              %{
                "technique_id" => t.id,
                "name_cs" => t.name_cs,
                "name_en" => t.name_en,
                "severity_score" => t.severity_score,
                "detection_patterns" => t.detection_patterns,
                "manifestations" => t.typical_manifestations,
                "defense_strategies" => t.defense_strategies
              }
            end),
          "aggregate_severity" =>
            techs |> Enum.map(& &1.severity_score) |> then(&(Enum.sum(&1) / max(length(&1), 1))),
          "aggregate_reversibility" =>
            techs
            |> Enum.map(& &1.reversibility_score)
            |> then(&(Enum.sum(&1) / max(length(&1), 1)))
        }

        write_json(path, data, pretty)
        path
      end)

    master_path = Path.join(patterns_dir, "_all_detection_patterns.json")

    all_patterns =
      techniques
      |> Enum.flat_map(fn t ->
        Enum.map(t.detection_patterns, fn pattern ->
          %{
            "pattern" => pattern,
            "technique_id" => t.id,
            "category" => t.category,
            "severity_score" => t.severity_score
          }
        end)
      end)

    write_json(
      master_path,
      %{
        "$schema" => "../schemas/detection_patterns.schema.json",
        "total_patterns" => length(all_patterns),
        "patterns" => all_patterns
      },
      pretty
    )

    category_files ++ [master_path]
  end

  # --- Relationship Graph Generation ---

  defp generate_relationship_files(transform_result, output_dir, pretty) do
    relationships_dir = Path.join(output_dir, "relationships")
    techniques = transform_result.techniques

    cross_ref_path = Path.join(relationships_dir, "cross_references.json")
    cross_ref_graph = build_cross_reference_graph(techniques)
    write_json(cross_ref_path, cross_ref_graph, pretty)

    category_path = Path.join(relationships_dir, "category_hierarchy.json")
    category_graph = build_category_hierarchy(transform_result.categories)
    write_json(category_path, category_graph, pretty)

    severity_path = Path.join(relationships_dir, "severity_network.json")
    severity_network = build_severity_network(techniques)
    write_json(severity_path, severity_network, pretty)

    cooccurrence_path = Path.join(relationships_dir, "cooccurrence_matrix.json")
    cooccurrence = build_cooccurrence_matrix(techniques)
    write_json(cooccurrence_path, cooccurrence, pretty)

    [cross_ref_path, category_path, severity_path, cooccurrence_path]
  end

  defp build_cross_reference_graph(techniques) do
    slug_to_id =
      techniques
      |> Enum.flat_map(fn t ->
        slugs =
          [
            Extractor.slugify(t.name_cs),
            t.metadata.anchor
          ]
          |> Enum.reject(&is_nil/1)
          |> Enum.uniq()

        Enum.map(slugs, &{&1, t.id})
      end)
      |> Map.new()

    nodes =
      Enum.map(techniques, fn t ->
        %{
          "id" => t.id,
          "name_cs" => t.name_cs,
          "name_en" => t.name_en,
          "category" => t.category,
          "severity_score" => t.severity_score
        }
      end)

    edges =
      techniques
      |> Enum.flat_map(fn t ->
        t.cross_references
        |> Enum.map(fn ref ->
          target_id = Map.get(slug_to_id, ref, "unresolved:#{ref}")

          %{
            "source" => t.id,
            "target" => target_id,
            "type" => "cross_reference"
          }
        end)
      end)

    %{
      "$schema" => "../schemas/relationship_graph.schema.json",
      "graph_type" => "cross_reference",
      "node_count" => length(nodes),
      "edge_count" => length(edges),
      "nodes" => nodes,
      "edges" => edges
    }
  end

  defp build_category_hierarchy(categories) do
    nodes =
      Enum.flat_map(categories, fn {cat, info} ->
        cat_node = %{
          "id" => "cat:#{cat}",
          "type" => "category",
          "name" => cat,
          "technique_count" => info.count
        }

        subcat_nodes =
          Enum.map(info.subcategories, fn {subcat, technique_ids} ->
            %{
              "id" => "subcat:#{cat}:#{subcat}",
              "type" => "subcategory",
              "name" => subcat,
              "parent" => "cat:#{cat}",
              "technique_ids" => technique_ids,
              "technique_count" => length(technique_ids)
            }
          end)

        [cat_node | subcat_nodes]
      end)

    edges =
      Enum.flat_map(categories, fn {cat, info} ->
        Enum.map(Map.keys(info.subcategories), fn subcat ->
          %{
            "source" => "cat:#{cat}",
            "target" => "subcat:#{cat}:#{subcat}",
            "type" => "contains"
          }
        end)
      end)

    %{
      "$schema" => "../schemas/relationship_graph.schema.json",
      "graph_type" => "category_hierarchy",
      "node_count" => length(nodes),
      "edge_count" => length(edges),
      "nodes" => nodes,
      "edges" => edges
    }
  end

  defp build_severity_network(techniques) do
    tiers =
      techniques
      |> Enum.group_by(& &1.severity)
      |> Enum.map(fn {severity, techs} ->
        %{
          "severity" => severity,
          "technique_count" => length(techs),
          "technique_ids" => Enum.map(techs, & &1.id),
          "average_reversibility" =>
            techs
            |> Enum.map(& &1.reversibility_score)
            |> then(&(Enum.sum(&1) / max(length(&1), 1)))
        }
      end)

    %{
      "$schema" => "../schemas/severity_network.schema.json",
      "network_type" => "severity_tiers",
      "tiers" => tiers,
      "total_techniques" => length(techniques)
    }
  end

  defp build_cooccurrence_matrix(techniques) do
    category_groups =
      techniques
      |> Enum.group_by(& &1.category)
      |> Enum.map(fn {cat, techs} ->
        {cat, Enum.map(techs, & &1.id)}
      end)
      |> Map.new()

    %{
      "matrix_type" => "category_cooccurrence",
      "categories" => category_groups,
      "category_count" => map_size(category_groups),
      "technique_count" => length(techniques)
    }
  end

  # --- Schema Generation ---

  defp generate_schema_files(output_dir, pretty) do
    schemas_dir = Path.join(output_dir, "schemas")

    technique_schema = build_technique_schema()
    technique_path = Path.join(schemas_dir, "technique.schema.json")
    write_json(technique_path, technique_schema, pretty)

    pattern_schema = build_pattern_category_schema()
    pattern_path = Path.join(schemas_dir, "pattern_category.schema.json")
    write_json(pattern_path, pattern_schema, pretty)

    relationship_schema = build_relationship_graph_schema()
    relationship_path = Path.join(schemas_dir, "relationship_graph.schema.json")
    write_json(relationship_path, relationship_schema, pretty)

    detection_schema = build_detection_patterns_schema()
    detection_path = Path.join(schemas_dir, "detection_patterns.schema.json")
    write_json(detection_path, detection_schema, pretty)

    index_schema = build_index_schema()
    index_path = Path.join(schemas_dir, "technique_index.schema.json")
    write_json(index_path, index_schema, pretty)

    severity_schema = build_severity_network_schema()
    severity_path = Path.join(schemas_dir, "severity_network.schema.json")
    write_json(severity_path, severity_schema, pretty)

    [technique_path, pattern_path, relationship_path, detection_path, index_path, severity_path]
  end

  defp build_technique_schema do
    %{
      "$schema" => "https://json-schema.org/draft/2020-12/schema",
      "$id" => "technique.schema.json",
      "title" => "Epistemic Annihilation Technique",
      "description" =>
        "Schema for individual epistemic/cognitive annihilation technique from the compendium",
      "type" => "object",
      "required" => ["id", "name", "category", "severity"],
      "properties" => %{
        "id" => %{
          "type" => "string",
          "pattern" => "^EA-\\d{3}-.+$",
          "description" => "Unique technique identifier"
        },
        "name" => %{
          "type" => "object",
          "required" => ["cs"],
          "properties" => %{
            "cs" => %{"type" => "string", "description" => "Czech name"},
            "en" => %{"type" => ["string", "null"], "description" => "English translation"}
          }
        },
        "category" => %{"type" => "string", "description" => "Primary category classification"},
        "subcategory" => %{
          "type" => ["string", "null"],
          "description" => "Subcategory within primary category"
        },
        "severity" => %{
          "type" => "object",
          "required" => ["level", "score"],
          "properties" => %{
            "level" => %{
              "type" => "string",
              "enum" => ["extreme", "critical", "high", "medium_high", "medium", "low", "unknown"]
            },
            "score" => %{"type" => "number", "minimum" => 0.0, "maximum" => 1.0}
          }
        },
        "domain" => %{"type" => "string"},
        "temporal_profile" => %{"type" => "string"},
        "reversibility" => %{
          "type" => "object",
          "required" => ["level", "score"],
          "properties" => %{
            "level" => %{
              "type" => "string",
              "enum" => [
                "practically_irreversible",
                "very_difficult",
                "difficult",
                "highly_resistant",
                "moderately_difficult",
                "partially_reversible",
                "low_reversibility",
                "irreversible",
                "very_low",
                "unknown"
              ]
            },
            "score" => %{"type" => "number", "minimum" => 0.0, "maximum" => 1.0}
          }
        },
        "typical_manifestations" => %{"type" => "array", "items" => %{"type" => "string"}},
        "defense_strategies" => %{"type" => "array", "items" => %{"type" => "string"}},
        "description" => %{
          "type" => "object",
          "properties" => %{
            "cs" => %{"type" => ["string", "null"]},
            "en" => %{"type" => ["string", "null"]}
          }
        },
        "example" => %{
          "type" => "object",
          "properties" => %{"cs" => %{"type" => ["string", "null"]}}
        },
        "cross_references" => %{"type" => "array", "items" => %{"type" => "string"}},
        "detection_patterns" => %{"type" => "array", "items" => %{"type" => "string"}},
        "page_number" => %{"type" => ["integer", "null"]},
        "metadata" => %{"type" => "object"}
      }
    }
  end

  defp build_pattern_category_schema do
    %{
      "$schema" => "https://json-schema.org/draft/2020-12/schema",
      "$id" => "pattern_category.schema.json",
      "title" => "Detection Pattern Category",
      "type" => "object",
      "required" => ["category", "technique_count", "patterns"],
      "properties" => %{
        "category" => %{"type" => "string"},
        "technique_count" => %{"type" => "integer"},
        "patterns" => %{
          "type" => "array",
          "items" => %{
            "type" => "object",
            "required" => ["technique_id", "name_cs", "severity_score"],
            "properties" => %{
              "technique_id" => %{"type" => "string"},
              "name_cs" => %{"type" => "string"},
              "name_en" => %{"type" => "string"},
              "severity_score" => %{"type" => "number"},
              "detection_patterns" => %{"type" => "array", "items" => %{"type" => "string"}},
              "manifestations" => %{"type" => "array", "items" => %{"type" => "string"}},
              "defense_strategies" => %{"type" => "array", "items" => %{"type" => "string"}}
            }
          }
        },
        "aggregate_severity" => %{"type" => "number"},
        "aggregate_reversibility" => %{"type" => "number"}
      }
    }
  end

  defp build_relationship_graph_schema do
    %{
      "$schema" => "https://json-schema.org/draft/2020-12/schema",
      "$id" => "relationship_graph.schema.json",
      "title" => "Technique Relationship Graph",
      "type" => "object",
      "required" => ["graph_type", "nodes", "edges"],
      "properties" => %{
        "graph_type" => %{
          "type" => "string",
          "enum" => ["cross_reference", "category_hierarchy", "severity_tiers"]
        },
        "node_count" => %{"type" => "integer"},
        "edge_count" => %{"type" => "integer"},
        "nodes" => %{"type" => "array", "items" => %{"type" => "object", "required" => ["id"]}},
        "edges" => %{
          "type" => "array",
          "items" => %{"type" => "object", "required" => ["source", "target", "type"]}
        }
      }
    }
  end

  defp build_detection_patterns_schema do
    %{
      "$schema" => "https://json-schema.org/draft/2020-12/schema",
      "$id" => "detection_patterns.schema.json",
      "title" => "All Detection Patterns",
      "type" => "object",
      "required" => ["total_patterns", "patterns"],
      "properties" => %{
        "total_patterns" => %{"type" => "integer"},
        "patterns" => %{
          "type" => "array",
          "items" => %{
            "type" => "object",
            "required" => ["pattern", "technique_id"],
            "properties" => %{
              "pattern" => %{"type" => "string"},
              "technique_id" => %{"type" => "string"},
              "category" => %{"type" => "string"},
              "severity_score" => %{"type" => "number"}
            }
          }
        }
      }
    }
  end

  defp build_index_schema do
    %{
      "$schema" => "https://json-schema.org/draft/2020-12/schema",
      "$id" => "technique_index.schema.json",
      "title" => "Technique Master Index",
      "type" => "object",
      "required" => ["version", "total_techniques", "techniques"],
      "properties" => %{
        "version" => %{"type" => "string"},
        "total_techniques" => %{"type" => "integer"},
        "generated_at" => %{"type" => "string", "format" => "date-time"},
        "techniques" => %{
          "type" => "array",
          "items" => %{
            "type" => "object",
            "required" => ["id", "name_cs", "category", "severity_score"]
          }
        },
        "categories" => %{"type" => "object"},
        "statistics" => %{"type" => "object"},
        "translation_map" => %{"type" => "object"}
      }
    }
  end

  defp build_severity_network_schema do
    %{
      "$schema" => "https://json-schema.org/draft/2020-12/schema",
      "$id" => "severity_network.schema.json",
      "title" => "Severity Network",
      "type" => "object",
      "required" => ["network_type", "tiers"],
      "properties" => %{
        "network_type" => %{"type" => "string"},
        "tiers" => %{
          "type" => "array",
          "items" => %{
            "type" => "object",
            "required" => ["severity", "technique_count", "technique_ids"]
          }
        },
        "total_techniques" => %{"type" => "integer"}
      }
    }
  end

  # --- Index File Generation ---

  defp generate_index_files(transform_result, output_dir, pretty) do
    index_path = Path.join(output_dir, "technique_index.json")

    index_data = %{
      "$schema" => "schemas/technique_index.schema.json",
      "version" => "1.0.0",
      "total_techniques" => length(transform_result.techniques),
      "generated_at" => DateTime.to_iso8601(DateTime.utc_now()),
      "techniques" =>
        Enum.map(transform_result.techniques, fn t ->
          %{
            "id" => t.id,
            "name_cs" => t.name_cs,
            "name_en" => t.name_en,
            "category" => t.category,
            "subcategory" => t.subcategory,
            "severity_score" => t.severity_score,
            "reversibility_score" => t.reversibility_score,
            "page_number" => t.page_number
          }
        end),
      "categories" => transform_result.categories,
      "statistics" => transform_result.statistics,
      "translation_map" => transform_result.translation_map
    }

    write_json(index_path, index_data, pretty)

    translation_path = Path.join(output_dir, "translations_cs_en.json")

    translation_data = %{
      "version" => "1.0.0",
      "language_pair" => %{"source" => "cs", "target" => "en"},
      "total_entries" => map_size(transform_result.translation_map),
      "translations" => transform_result.translation_map
    }

    write_json(translation_path, translation_data, pretty)

    [index_path, translation_path]
  end

  # --- JSON Writing ---

  defp write_json(path, data, pretty) do
    json =
      if pretty do
        Jason.encode!(data, pretty: true)
      else
        Jason.encode!(data)
      end

    File.write!(path, json)
  end
end
