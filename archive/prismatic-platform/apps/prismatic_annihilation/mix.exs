defmodule PrismaticAnnihilation.MixProject do
  use Mix.Project

  def project do
    [
      app: :prismatic_annihilation,
      version: "1.0.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.17",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.html": :test
      ],
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
        plt_add_apps: [:mix, :ex_unit]
      ],
      docs: [
        main: "PrismaticAnnihilation",
        extras: ["README.md", "CLAUDE.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {PrismaticAnnihilation.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      # Platform dependencies
      {:prismatic_core, in_umbrella: true},
      {:prismatic_nabla, in_umbrella: true},
      {:prismatic_evil, in_umbrella: true},
      {:prismatic_algorithms, in_umbrella: true},
      {:prismatic_safety, in_umbrella: true},
      {:prismatic_blackboard, in_umbrella: true},

      # Core dependencies
      {:jason, "~> 1.4"},
      {:nimble_pool, "~> 1.0"},
      {:telemetry, "~> 1.2"},
      {:telemetry_metrics, "~> 1.0"},

      # Graph operations
      {:libgraph, "~> 0.16"},

      # Development and testing
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.31", only: :dev, runtime: false},
      {:excoveralls, "~> 0.18", only: :test},
      {:stream_data, "~> 1.0", only: [:dev, :test]},
      {:benchee, "~> 1.3", only: [:dev, :test]}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get"],
      test: ["test"],
      "test.detection": ["test --only detection"],
      "test.defense": ["test --only defense"],
      "test.integration": ["test --only integration"],
      "test.property": ["test --only property"],
      quality: ["format --check-formatted", "credo --strict", "dialyzer"]
    ]
  end
end
