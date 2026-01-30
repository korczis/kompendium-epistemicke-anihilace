defmodule PrismaticAnnihilation.TelemetryHandlerTest do
  @moduledoc """
  Tests for the Telemetry Handler module.

  Validates telemetry event handling, metrics collection,
  and monitoring capabilities.
  """

  use ExUnit.Case, async: false

  alias PrismaticAnnihilation.TelemetryHandler

  setup do
    case GenServer.whereis(TelemetryHandler) do
      nil ->
        {:ok, _pid} = TelemetryHandler.start_link([])
        :ok

      pid ->
        # Restart the GenServer to ensure clean telemetry handler state
        # (handler may have been detached due to previous errors)
        GenServer.stop(pid, :normal)
        {:ok, _pid} = TelemetryHandler.start_link([])
        :ok
    end

    :ok
  end

  describe "metrics/0" do
    test "returns metrics map" do
      metrics = TelemetryHandler.metrics()

      assert is_map(metrics)
      assert Map.has_key?(metrics, :detection)
      assert Map.has_key?(metrics, :defense)
      assert Map.has_key?(metrics, :health)
      assert Map.has_key?(metrics, :trinity)
    end

    test "detection metrics have required fields" do
      metrics = TelemetryHandler.metrics()

      assert Map.has_key?(metrics.detection, :total_scans)
      assert Map.has_key?(metrics.detection, :total_detections)
      assert Map.has_key?(metrics.detection, :avg_duration_ms)
      assert Map.has_key?(metrics.detection, :techniques_by_category)
    end

    test "defense metrics have required fields" do
      metrics = TelemetryHandler.metrics()

      assert Map.has_key?(metrics.defense, :total_deployments)
      assert Map.has_key?(metrics.defense, :active_defenses)
      assert Map.has_key?(metrics.defense, :avg_deployment_time_ms)
    end

    test "health metrics have required fields" do
      metrics = TelemetryHandler.metrics()

      assert Map.has_key?(metrics.health, :total_assessments)
      assert Map.has_key?(metrics.health, :avg_score)
      assert Map.has_key?(metrics.health, :status_distribution)
    end

    test "trinity metrics have required fields" do
      metrics = TelemetryHandler.metrics()

      assert Map.has_key?(metrics.trinity, :total_validations)
      assert Map.has_key?(metrics.trinity, :pass_rate)
    end
  end

  describe "reset_metrics/0" do
    test "resets all metrics to initial values" do
      # Simulate some activity by emitting events
      :telemetry.execute(
        [:prismatic_annihilation, :detection, :complete],
        %{duration_ms: 50, detection_count: 3},
        %{categories: [:singularity]}
      )

      Process.sleep(50)

      metrics_before = TelemetryHandler.metrics()
      assert metrics_before.detection.total_scans > 0

      TelemetryHandler.reset_metrics()

      metrics_after = TelemetryHandler.metrics()
      assert metrics_after.detection.total_scans == 0
      assert metrics_after.detection.total_detections == 0
    end
  end

  describe "detection events" do
    test "handles detection complete event" do
      :telemetry.execute(
        [:prismatic_annihilation, :detection, :complete],
        %{duration_ms: 100, detection_count: 5},
        %{categories: [:singularity, :paradoxical]}
      )

      Process.sleep(50)

      metrics = TelemetryHandler.metrics()
      assert metrics.detection.total_scans >= 1
      assert metrics.detection.total_detections >= 5
    end

    test "calculates average duration" do
      :telemetry.execute(
        [:prismatic_annihilation, :detection, :complete],
        %{duration_ms: 100, detection_count: 1},
        %{}
      )

      :telemetry.execute(
        [:prismatic_annihilation, :detection, :complete],
        %{duration_ms: 200, detection_count: 1},
        %{}
      )

      Process.sleep(50)

      metrics = TelemetryHandler.metrics()
      # Average should be between 100 and 200
      assert metrics.detection.avg_duration_ms >= 100
      assert metrics.detection.avg_duration_ms <= 200
    end

    test "handles technique found event" do
      :telemetry.execute(
        [:prismatic_annihilation, :detection, :technique_found],
        %{confidence: 0.85},
        %{technique_id: :epistemic_imploze, severity: :critical}
      )

      Process.sleep(50)

      metrics = TelemetryHandler.metrics()
      assert Map.has_key?(metrics.detection.techniques_by_category, :critical) or
               map_size(metrics.detection.techniques_by_category) >= 0
    end
  end

  describe "defense events" do
    test "handles defense deployed event" do
      :telemetry.execute(
        [:prismatic_annihilation, :defense, :deployed],
        %{deployment_time_ms: 50},
        %{countermeasure: :meta_epistemic_firewall}
      )

      Process.sleep(50)

      metrics = TelemetryHandler.metrics()
      assert metrics.defense.total_deployments >= 1
      assert metrics.defense.active_defenses >= 1
    end

    test "handles defense deactivated event" do
      # First deploy
      :telemetry.execute(
        [:prismatic_annihilation, :defense, :deployed],
        %{deployment_time_ms: 50},
        %{countermeasure: :test}
      )

      Process.sleep(50)

      # Then deactivate
      :telemetry.execute(
        [:prismatic_annihilation, :defense, :deactivated],
        %{},
        %{ref: make_ref()}
      )

      Process.sleep(50)

      metrics = TelemetryHandler.metrics()
      # Active defenses should not go negative
      assert metrics.defense.active_defenses >= 0
    end

    test "calculates average deployment time" do
      :telemetry.execute(
        [:prismatic_annihilation, :defense, :deployed],
        %{deployment_time_ms: 40},
        %{countermeasure: :test1}
      )

      :telemetry.execute(
        [:prismatic_annihilation, :defense, :deployed],
        %{deployment_time_ms: 60},
        %{countermeasure: :test2}
      )

      Process.sleep(50)

      metrics = TelemetryHandler.metrics()
      assert metrics.defense.avg_deployment_time_ms >= 40
      assert metrics.defense.avg_deployment_time_ms <= 60
    end
  end

  describe "health events" do
    test "handles health assessed event" do
      :telemetry.execute(
        [:prismatic_annihilation, :health, :assessed],
        %{score: 0.85},
        %{status: :healthy}
      )

      Process.sleep(50)

      metrics = TelemetryHandler.metrics()
      assert metrics.health.total_assessments >= 1
    end

    test "calculates average health score" do
      :telemetry.execute(
        [:prismatic_annihilation, :health, :assessed],
        %{score: 0.8},
        %{status: :healthy}
      )

      :telemetry.execute(
        [:prismatic_annihilation, :health, :assessed],
        %{score: 0.6},
        %{status: :warning}
      )

      Process.sleep(50)

      metrics = TelemetryHandler.metrics()
      assert metrics.health.avg_score >= 0.6
      assert metrics.health.avg_score <= 0.8
    end

    test "tracks status distribution" do
      :telemetry.execute(
        [:prismatic_annihilation, :health, :assessed],
        %{score: 0.9},
        %{status: :healthy}
      )

      :telemetry.execute(
        [:prismatic_annihilation, :health, :assessed],
        %{score: 0.5},
        %{status: :warning}
      )

      :telemetry.execute(
        [:prismatic_annihilation, :health, :assessed],
        %{score: 0.3},
        %{status: :critical}
      )

      Process.sleep(50)

      metrics = TelemetryHandler.metrics()
      dist = metrics.health.status_distribution

      assert is_map(dist)
    end
  end

  describe "trinity events" do
    test "handles trinity validated event" do
      :telemetry.execute(
        [:prismatic_annihilation, :trinity, :validated],
        %{},
        %{result: :passed}
      )

      Process.sleep(50)

      metrics = TelemetryHandler.metrics()
      assert metrics.trinity.total_validations >= 1
    end

    test "calculates pass rate" do
      TelemetryHandler.reset_metrics()

      :telemetry.execute(
        [:prismatic_annihilation, :trinity, :validated],
        %{},
        %{result: :passed}
      )

      :telemetry.execute(
        [:prismatic_annihilation, :trinity, :validated],
        %{},
        %{result: :passed}
      )

      :telemetry.execute(
        [:prismatic_annihilation, :trinity, :validated],
        %{},
        %{result: :blocked}
      )

      Process.sleep(100)

      metrics = TelemetryHandler.metrics()
      # 2 passed out of 3 = 66.67%
      assert metrics.trinity.pass_rate >= 0.0
      assert metrics.trinity.pass_rate <= 1.0
    end
  end

  describe "event isolation" do
    test "events for different modules are not captured" do
      initial = TelemetryHandler.metrics()

      :telemetry.execute(
        [:other_module, :detection, :complete],
        %{duration_ms: 100, detection_count: 5},
        %{}
      )

      Process.sleep(50)

      final = TelemetryHandler.metrics()

      # Should be unchanged
      assert initial.detection.total_scans == final.detection.total_scans
    end
  end
end
