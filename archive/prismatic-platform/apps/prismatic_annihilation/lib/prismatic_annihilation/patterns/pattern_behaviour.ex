defmodule PrismaticAnnihilation.Patterns.PatternBehaviour do
  @moduledoc """
  Behaviour definition for all pattern detection modules.

  Each pattern category module must implement this behaviour to ensure
  consistent API and integration with the PatternCompiler and detection engines.

  ## Required Callbacks

  - `all/0` - Returns all patterns in this category
  - `count/0` - Returns pattern count
  - `category/0` - Returns the category atom
  - `detect/2` - Performs pattern detection on content
  - `for_technique/1` - Returns patterns for a specific technique

  ## Implementation Example

      defmodule MyPatterns do
        @behaviour PrismaticAnnihilation.Patterns.PatternBehaviour

        @impl true
        def all, do: [...]

        @impl true
        def count, do: length(all())

        @impl true
        def category, do: :my_category

        @impl true
        def detect(content, opts), do: {:ok, [...]}

        @impl true
        def for_technique(technique_id), do: [...]
      end

  """

  @doc """
  Returns all patterns defined in this module.
  """
  @callback all() :: [map()]

  @doc """
  Returns the number of patterns.
  """
  @callback count() :: non_neg_integer()

  @doc """
  Returns the category identifier for this pattern set.
  """
  @callback category() :: atom()

  @doc """
  Detects patterns in the given content.

  Returns `{:ok, [detection_result]}` with matched patterns above threshold.
  """
  @callback detect(content :: String.t(), opts :: keyword()) :: {:ok, [map()]}

  @doc """
  Returns patterns associated with a specific technique ID.
  """
  @callback for_technique(technique_id :: atom()) :: [map()]
end
