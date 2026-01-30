defmodule PrismaticAnnihilation.Application do
  @moduledoc """
  OTP Application for Prismatic Annihilation - Epistemic Defense System.

  Manages supervised processes for:
  - Detection engines (5 category-specific GenServers)
  - Defensive coordinators
  - Compendium data loaders
  - Telemetry and monitoring

  ## Supervision Tree

  ```
  PrismaticAnnihilation.Supervisor (one_for_one)
  ├── Registry (TechniqueRegistry)
  ├── Registry (MonitorRegistry)
  ├── PrismaticAnnihilation.TechniqueCache (ETS-based cache)
  ├── PrismaticAnnihilation.CompendiumLoader (GenServer)
  ├── PrismaticAnnihilation.DetectionCoordinator (DynamicSupervisor)
  │   ├── Engines.Singularity
  │   ├── Engines.Metatranscendental
  │   ├── Engines.Hypertransformative
  │   ├── Engines.Paradoxical
  │   └── Engines.Transconceptual
  ├── PrismaticAnnihilation.DefensiveCoordinator (GenServer)
  ├── PrismaticAnnihilation.TelemetryHandler (GenServer)
  └── Task.Supervisor (AnalysisSupervisor)
  ```

  ## Startup Sequence

  1. Start registries for technique and monitor tracking
  2. Initialize ETS-based technique cache
  3. Load compendium data from priv/data/
  4. Start detection engines (pooled GenServers)
  5. Initialize defensive coordinator
  6. Attach telemetry handlers
  7. Start task supervisor for async analysis
  """

  use Application

  require Logger

  @impl true
  def start(_type, _args) do
    Logger.info("[PrismaticAnnihilation] Starting epistemic defense system")

    children = [
      # Registries
      {Registry, keys: :unique, name: PrismaticAnnihilation.TechniqueRegistry},
      {Registry, keys: :duplicate, name: PrismaticAnnihilation.MonitorRegistry},

      # Technique Cache (ETS)
      PrismaticAnnihilation.TechniqueCache,

      # Compendium Data Loader
      PrismaticAnnihilation.CompendiumLoader,

      # Detection Engine Supervisor
      {DynamicSupervisor,
       name: PrismaticAnnihilation.DetectionCoordinator, strategy: :one_for_one},

      # Defensive Coordinator
      PrismaticAnnihilation.DefensiveCoordinator,

      # Telemetry Handler
      PrismaticAnnihilation.TelemetryHandler,

      # Task Supervisor for async analysis
      {Task.Supervisor, name: PrismaticAnnihilation.AnalysisSupervisor}
    ]

    opts = [strategy: :one_for_one, name: PrismaticAnnihilation.Supervisor]

    case Supervisor.start_link(children, opts) do
      {:ok, pid} ->
        # Start detection engines after supervisor is up
        start_detection_engines()
        Logger.info("[PrismaticAnnihilation] Epistemic defense system ready")
        {:ok, pid}

      error ->
        Logger.error("[PrismaticAnnihilation] Failed to start: #{inspect(error)}")
        error
    end
  end

  @impl true
  def stop(_state) do
    Logger.info("[PrismaticAnnihilation] Shutting down epistemic defense system")
    :ok
  end

  # ---------------------------------------------------------------------------
  # Private: Engine Startup
  # ---------------------------------------------------------------------------

  defp start_detection_engines do
    engines = [
      PrismaticAnnihilation.Engines.Singularity,
      PrismaticAnnihilation.Engines.Metatranscendental,
      PrismaticAnnihilation.Engines.Hypertransformative,
      PrismaticAnnihilation.Engines.Paradoxical,
      PrismaticAnnihilation.Engines.Transconceptual
    ]

    pool_size = Application.get_env(:prismatic_annihilation, :engine_pool_size, 3)

    for engine <- engines, _n <- 1..pool_size do
      case DynamicSupervisor.start_child(
             PrismaticAnnihilation.DetectionCoordinator,
             {engine, []}
           ) do
        {:ok, _pid} ->
          :ok

        {:error, reason} ->
          Logger.warning(
            "[PrismaticAnnihilation] Failed to start #{inspect(engine)}: #{inspect(reason)}"
          )
      end
    end
  end
end
