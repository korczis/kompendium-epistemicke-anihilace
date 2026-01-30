defmodule PrismaticAnnihilation.TelemetryHandler do
  @moduledoc """
  Telemetry Event Handler for Epistemic Defense Monitoring.

  Captures and processes telemetry events from:
  - Detection engines
  - Defense deployments
  - Health assessments
  - Integration bridges

  ## Events Handled

  - `[:prismatic_annihilation, :detection, :complete]`
  - `[:prismatic_annihilation, :detection, :technique_found]`
  - `[:prismatic_annihilation, :defense, :deployed]`
  - `[:prismatic_annihilation, :defense, :deactivated]`
  - `[:prismatic_annihilation, :health, :assessed]`
  - `[:prismatic_annihilation, :trinity, :validated]`
  """

  use GenServer

  require Logger

  @events [
    [:prismatic_annihilation, :detection, :complete],
    [:prismatic_annihilation, :detection, :technique_found],
    [:prismatic_annihilation, :defense, :deployed],
    [:prismatic_annihilation, :defense, :deactivated],
    [:prismatic_annihilation, :health, :assessed],
    [:prismatic_annihilation, :trinity, :validated]
  ]

  # ===========================================================================
  # Client API
  # ===========================================================================

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @doc """
  Returns collected metrics.
  """
  @spec metrics() :: map()
  def metrics do
    GenServer.call(__MODULE__, :metrics)
  end

  @doc """
  Resets all metrics.
  """
  @spec reset_metrics() :: :ok
  def reset_metrics do
    GenServer.cast(__MODULE__, :reset)
  end

  # ===========================================================================
  # GenServer Implementation
  # ===========================================================================

  @impl true
  def init(_opts) do
    # Attach telemetry handlers
    :telemetry.attach_many(
      "prismatic-annihilation-handler",
      @events,
      &handle_event/4,
      nil
    )

    state = %{
      metrics: initial_metrics(),
      started_at: DateTime.utc_now()
    }

    Logger.info("[TelemetryHandler] Attached handlers for #{length(@events)} event types")
    {:ok, state}
  end

  @impl true
  def handle_call(:metrics, _from, state) do
    {:reply, state.metrics, state}
  end

  @impl true
  def handle_cast(:reset, state) do
    {:noreply, %{state | metrics: initial_metrics()}}
  end

  @impl true
  def handle_cast({:update_metrics, event_type, measurements}, state) do
    new_metrics = update_metrics(state.metrics, event_type, measurements)
    {:noreply, %{state | metrics: new_metrics}}
  end

  @impl true
  def terminate(_reason, _state) do
    :telemetry.detach("prismatic-annihilation-handler")
    :ok
  end

  # ===========================================================================
  # Telemetry Event Handler
  # ===========================================================================

  defp handle_event([:prismatic_annihilation, :detection, :complete], measurements, metadata, _config) do
    Logger.debug("[Telemetry] Detection complete: #{measurements.duration_ms}ms, #{measurements.detection_count} detections")

    GenServer.cast(__MODULE__, {:update_metrics, :detection_complete, %{
      duration_ms: measurements.duration_ms,
      detection_count: measurements.detection_count,
      categories: metadata[:categories]
    }})
  end

  defp handle_event([:prismatic_annihilation, :detection, :technique_found], measurements, metadata, _config) do
    Logger.info("[Telemetry] Technique detected: #{metadata[:technique_id]}, confidence: #{measurements.confidence}")

    GenServer.cast(__MODULE__, {:update_metrics, :technique_found, %{
      technique_id: metadata[:technique_id],
      confidence: measurements.confidence,
      severity: metadata[:severity]
    }})
  end

  defp handle_event([:prismatic_annihilation, :defense, :deployed], measurements, metadata, _config) do
    Logger.info("[Telemetry] Defense deployed: #{metadata[:countermeasure]}, duration: #{measurements.deployment_time_ms}ms")

    GenServer.cast(__MODULE__, {:update_metrics, :defense_deployed, %{
      countermeasure: metadata[:countermeasure],
      deployment_time_ms: measurements.deployment_time_ms
    }})
  end

  defp handle_event([:prismatic_annihilation, :defense, :deactivated], _measurements, metadata, _config) do
    Logger.debug("[Telemetry] Defense deactivated: #{metadata[:ref]}")

    GenServer.cast(__MODULE__, {:update_metrics, :defense_deactivated, %{
      ref: metadata[:ref]
    }})
  end

  defp handle_event([:prismatic_annihilation, :health, :assessed], measurements, metadata, _config) do
    Logger.debug("[Telemetry] Health assessed: score=#{measurements.score}, status=#{metadata[:status]}")

    GenServer.cast(__MODULE__, {:update_metrics, :health_assessed, %{
      score: measurements.score,
      status: metadata[:status]
    }})
  end

  defp handle_event([:prismatic_annihilation, :trinity, :validated], _measurements, metadata, _config) do
    Logger.debug("[Telemetry] Trinity validation: #{metadata[:result]}")

    GenServer.cast(__MODULE__, {:update_metrics, :trinity_validated, %{
      result: metadata[:result]
    }})
  end

  defp handle_event(event, measurements, metadata, _config) do
    Logger.debug("[Telemetry] Unhandled event: #{inspect(event)}, #{inspect(measurements)}, #{inspect(metadata)}")
  end

  # ===========================================================================
  # Private Functions
  # ===========================================================================

  defp initial_metrics do
    %{
      detection: %{
        total_scans: 0,
        total_detections: 0,
        avg_duration_ms: 0.0,
        techniques_by_category: %{}
      },
      defense: %{
        total_deployments: 0,
        active_defenses: 0,
        avg_deployment_time_ms: 0.0
      },
      health: %{
        total_assessments: 0,
        avg_score: 0.0,
        status_distribution: %{}
      },
      trinity: %{
        total_validations: 0,
        pass_rate: 0.0
      }
    }
  end

  defp update_metrics(metrics, :detection_complete, data) do
    detection = metrics.detection
    new_total = detection.total_scans + 1
    new_detections = detection.total_detections + data.detection_count
    new_avg = (detection.avg_duration_ms * detection.total_scans + data.duration_ms) / new_total

    %{metrics | detection: %{
      detection |
      total_scans: new_total,
      total_detections: new_detections,
      avg_duration_ms: new_avg
    }}
  end

  defp update_metrics(metrics, :technique_found, data) do
    detection = metrics.detection
    category = data[:severity] || :unknown
    by_category = Map.update(detection.techniques_by_category, category, 1, &(&1 + 1))

    %{metrics | detection: %{detection | techniques_by_category: by_category}}
  end

  defp update_metrics(metrics, :defense_deployed, data) do
    defense = metrics.defense
    new_total = defense.total_deployments + 1
    new_active = defense.active_defenses + 1
    new_avg = (defense.avg_deployment_time_ms * defense.total_deployments + data.deployment_time_ms) / new_total

    %{metrics | defense: %{
      defense |
      total_deployments: new_total,
      active_defenses: new_active,
      avg_deployment_time_ms: new_avg
    }}
  end

  defp update_metrics(metrics, :defense_deactivated, _data) do
    defense = metrics.defense
    %{metrics | defense: %{defense | active_defenses: max(0, defense.active_defenses - 1)}}
  end

  defp update_metrics(metrics, :health_assessed, data) do
    health = metrics.health
    new_total = health.total_assessments + 1
    new_avg = (health.avg_score * health.total_assessments + data.score) / new_total
    status_dist = Map.update(health.status_distribution, data.status, 1, &(&1 + 1))

    %{metrics | health: %{
      health |
      total_assessments: new_total,
      avg_score: new_avg,
      status_distribution: status_dist
    }}
  end

  defp update_metrics(metrics, :trinity_validated, data) do
    trinity = metrics.trinity
    new_total = trinity.total_validations + 1
    passed = if data.result == :passed, do: 1, else: 0
    new_rate = (trinity.pass_rate * trinity.total_validations + passed) / new_total

    %{metrics | trinity: %{trinity | total_validations: new_total, pass_rate: new_rate}}
  end

  defp update_metrics(metrics, _event_type, _data), do: metrics
end
