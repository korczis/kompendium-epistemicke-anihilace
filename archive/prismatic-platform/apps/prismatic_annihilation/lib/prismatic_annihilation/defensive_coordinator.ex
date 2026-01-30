defmodule PrismaticAnnihilation.DefensiveCoordinator do
  @moduledoc """
  Coordinates Defensive Operations Against Epistemic Attacks.

  Manages:
  - Active defense deployment coordination
  - Multi-layer defense orchestration
  - Defense resource allocation
  - Real-time threat response

  ## Coordination Strategies

  1. **Layered Defense** - Multiple independent defense layers
  2. **Adaptive Response** - Dynamic adjustment based on threat level
  3. **Resource Optimization** - Efficient allocation of defense resources
  4. **Escalation Management** - Graduated response to increasing threats
  """

  use GenServer

  require Logger

  @type state :: %{
          active_defenses: map(),
          threat_level: atom(),
          resources: map(),
          metrics: map()
        }

  # ===========================================================================
  # Client API
  # ===========================================================================

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @doc """
  Activates coordinated defense response.
  """
  @spec activate_defense(atom(), keyword()) :: {:ok, reference()} | {:error, term()}
  def activate_defense(threat_type, opts \\ []) do
    GenServer.call(__MODULE__, {:activate, threat_type, opts})
  end

  @doc """
  Deactivates a specific defense.
  """
  @spec deactivate_defense(reference()) :: :ok | {:error, term()}
  def deactivate_defense(ref) do
    GenServer.call(__MODULE__, {:deactivate, ref})
  end

  @doc """
  Returns current defense status.
  """
  @spec status() :: map()
  def status do
    GenServer.call(__MODULE__, :status)
  end

  @doc """
  Updates threat level and adjusts defenses accordingly.
  """
  @spec set_threat_level(atom()) :: :ok
  def set_threat_level(level) when level in [:minimal, :low, :elevated, :high, :critical] do
    GenServer.cast(__MODULE__, {:set_threat_level, level})
  end

  # ===========================================================================
  # GenServer Implementation
  # ===========================================================================

  @impl true
  def init(_opts) do
    state = %{
      active_defenses: %{},
      threat_level: :minimal,
      resources: initialize_resources(),
      metrics: %{
        defenses_activated: 0,
        threats_blocked: 0,
        started_at: DateTime.utc_now()
      }
    }

    Logger.info("[DefensiveCoordinator] Initialized with threat level: #{state.threat_level}")
    {:ok, state}
  end

  @impl true
  def handle_call({:activate, threat_type, opts}, _from, state) do
    ref = make_ref()

    defense = %{
      ref: ref,
      threat_type: threat_type,
      activated_at: DateTime.utc_now(),
      opts: opts,
      status: :active
    }

    new_state = %{
      state
      | active_defenses: Map.put(state.active_defenses, ref, defense),
        metrics: Map.update!(state.metrics, :defenses_activated, &(&1 + 1))
    }

    Logger.info("[DefensiveCoordinator] Activated defense for #{threat_type}")
    {:reply, {:ok, ref}, new_state}
  end

  @impl true
  def handle_call({:deactivate, ref}, _from, state) do
    case Map.get(state.active_defenses, ref) do
      nil ->
        {:reply, {:error, :not_found}, state}

      _defense ->
        new_state = %{
          state
          | active_defenses: Map.delete(state.active_defenses, ref)
        }

        Logger.info("[DefensiveCoordinator] Deactivated defense: #{inspect(ref)}")
        {:reply, :ok, new_state}
    end
  end

  @impl true
  def handle_call(:status, _from, state) do
    status = %{
      threat_level: state.threat_level,
      active_defense_count: map_size(state.active_defenses),
      active_defenses:
        Enum.map(state.active_defenses, fn {ref, d} ->
          %{ref: ref, threat_type: d.threat_type, activated_at: d.activated_at}
        end),
      resources: state.resources,
      metrics: state.metrics
    }

    {:reply, status, state}
  end

  @impl true
  def handle_cast({:set_threat_level, level}, state) do
    Logger.info("[DefensiveCoordinator] Threat level changed: #{state.threat_level} -> #{level}")
    {:noreply, %{state | threat_level: level}}
  end

  # ===========================================================================
  # Private Functions
  # ===========================================================================

  defp initialize_resources do
    %{
      cpu_allocation: 1.0,
      memory_allocation: 1.0,
      network_capacity: 1.0,
      available_engines: [:singularity, :metatranscendental, :hypertransformative, :paradoxical, :transconceptual]
    }
  end
end
