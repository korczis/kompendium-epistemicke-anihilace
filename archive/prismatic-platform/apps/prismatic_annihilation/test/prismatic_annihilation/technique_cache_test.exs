defmodule PrismaticAnnihilation.TechniqueCacheTest do
  @moduledoc """
  Tests for the Technique Cache module.

  Validates ETS-based caching for technique patterns and detection data.
  """

  use ExUnit.Case, async: true

  alias PrismaticAnnihilation.TechniqueCache

  setup do
    case GenServer.whereis(TechniqueCache) do
      nil ->
        {:ok, _pid} = TechniqueCache.start_link([])
        Process.sleep(50)
        :ok

      _pid ->
        TechniqueCache.clear()
        :ok
    end

    :ok
  end

  describe "put/4 and get/2" do
    test "stores and retrieves value" do
      technique_id = :test_technique
      key = :patterns
      value = %{data: "test value"}

      :ok = TechniqueCache.put(technique_id, key, value)
      {:ok, retrieved} = TechniqueCache.get(technique_id, key)

      assert retrieved == value
    end

    test "returns miss for missing entry" do
      assert :miss = TechniqueCache.get(:nonexistent, :key)
    end

    test "overwrites existing value" do
      technique_id = :overwrite_test
      key = :patterns

      :ok = TechniqueCache.put(technique_id, key, %{version: 1})
      :ok = TechniqueCache.put(technique_id, key, %{version: 2})

      {:ok, retrieved} = TechniqueCache.get(technique_id, key)
      assert retrieved.version == 2
    end

    test "handles various value types" do
      :ok = TechniqueCache.put(:t1, :string, "test string")
      :ok = TechniqueCache.put(:t2, :int, 42)
      :ok = TechniqueCache.put(:t3, :list, [1, 2, 3])
      :ok = TechniqueCache.put(:t4, :map, %{a: 1, b: 2})
      :ok = TechniqueCache.put(:t5, :tuple, {:ok, "result"})

      {:ok, string} = TechniqueCache.get(:t1, :string)
      {:ok, int} = TechniqueCache.get(:t2, :int)
      {:ok, list} = TechniqueCache.get(:t3, :list)
      {:ok, map} = TechniqueCache.get(:t4, :map)
      {:ok, tuple} = TechniqueCache.get(:t5, :tuple)

      assert string == "test string"
      assert int == 42
      assert list == [1, 2, 3]
      assert map == %{a: 1, b: 2}
      assert tuple == {:ok, "result"}
    end

    test "different keys for same technique are independent" do
      :ok = TechniqueCache.put(:tech, :patterns, "patterns")
      :ok = TechniqueCache.put(:tech, :regex, "regex")
      :ok = TechniqueCache.put(:tech, :signatures, "signatures")

      {:ok, patterns} = TechniqueCache.get(:tech, :patterns)
      {:ok, regex} = TechniqueCache.get(:tech, :regex)
      {:ok, signatures} = TechniqueCache.get(:tech, :signatures)

      assert patterns == "patterns"
      assert regex == "regex"
      assert signatures == "signatures"
    end
  end

  describe "TTL behavior" do
    test "respects custom TTL" do
      technique_id = :short_ttl
      key = :data

      :ok = TechniqueCache.put(technique_id, key, "value", 100)

      {:ok, _} = TechniqueCache.get(technique_id, key)

      # Wait for TTL to expire
      Process.sleep(150)

      assert :miss = TechniqueCache.get(technique_id, key)
    end

    test "uses default TTL when not specified" do
      :ok = TechniqueCache.put(:default_ttl, :data, "value")

      # Should still be available immediately
      {:ok, _} = TechniqueCache.get(:default_ttl, :data)
    end
  end

  describe "invalidate/2" do
    test "removes specific entry" do
      :ok = TechniqueCache.put(:tech, :key1, "value1")
      :ok = TechniqueCache.put(:tech, :key2, "value2")

      {:ok, _} = TechniqueCache.get(:tech, :key1)
      {:ok, _} = TechniqueCache.get(:tech, :key2)

      :ok = TechniqueCache.invalidate(:tech, :key1)

      assert :miss = TechniqueCache.get(:tech, :key1)
      {:ok, _} = TechniqueCache.get(:tech, :key2)
    end

    test "succeeds for nonexistent entry" do
      :ok = TechniqueCache.invalidate(:nonexistent, :key)
    end
  end

  describe "invalidate_technique/1" do
    test "removes all entries for technique" do
      :ok = TechniqueCache.put(:tech1, :key1, "v1")
      :ok = TechniqueCache.put(:tech1, :key2, "v2")
      :ok = TechniqueCache.put(:tech1, :key3, "v3")
      :ok = TechniqueCache.put(:tech2, :key1, "other")

      :ok = TechniqueCache.invalidate_technique(:tech1)

      assert :miss = TechniqueCache.get(:tech1, :key1)
      assert :miss = TechniqueCache.get(:tech1, :key2)
      assert :miss = TechniqueCache.get(:tech1, :key3)

      # Other technique should be unaffected
      {:ok, _} = TechniqueCache.get(:tech2, :key1)
    end
  end

  describe "clear/0" do
    test "removes all entries" do
      :ok = TechniqueCache.put(:t1, :k1, "v1")
      :ok = TechniqueCache.put(:t2, :k2, "v2")
      :ok = TechniqueCache.put(:t3, :k3, "v3")

      :ok = TechniqueCache.clear()

      assert :miss = TechniqueCache.get(:t1, :k1)
      assert :miss = TechniqueCache.get(:t2, :k2)
      assert :miss = TechniqueCache.get(:t3, :k3)
    end

    test "works on empty cache" do
      :ok = TechniqueCache.clear()
    end
  end

  describe "stats/0" do
    test "returns cache statistics" do
      stats = TechniqueCache.stats()

      assert Map.has_key?(stats, :size)
      assert Map.has_key?(stats, :memory_bytes)
      assert Map.has_key?(stats, :table_name)
    end

    test "size reflects number of entries" do
      TechniqueCache.clear()

      stats1 = TechniqueCache.stats()
      assert stats1.size == 0

      :ok = TechniqueCache.put(:t1, :k1, "v1")
      :ok = TechniqueCache.put(:t2, :k2, "v2")

      stats2 = TechniqueCache.stats()
      assert stats2.size == 2
    end

    test "memory_bytes is positive when entries exist" do
      :ok = TechniqueCache.put(:tech, :data, String.duplicate("x", 1000))

      stats = TechniqueCache.stats()
      assert stats.memory_bytes > 0
    end
  end

  describe "concurrent access" do
    test "handles concurrent writes" do
      tasks =
        Enum.map(1..100, fn i ->
          Task.async(fn ->
            TechniqueCache.put(:"tech_#{i}", :data, "value_#{i}")
          end)
        end)

      results = Task.await_many(tasks)

      assert Enum.all?(results, &(&1 == :ok))
    end

    test "handles concurrent reads" do
      :ok = TechniqueCache.put(:shared, :data, "shared_value")

      tasks =
        Enum.map(1..100, fn _i ->
          Task.async(fn ->
            TechniqueCache.get(:shared, :data)
          end)
        end)

      results = Task.await_many(tasks)

      assert Enum.all?(results, &match?({:ok, "shared_value"}, &1))
    end

    test "handles mixed operations" do
      tasks =
        Enum.flat_map(1..20, fn i ->
          [
            Task.async(fn -> TechniqueCache.put(:"mixed_#{i}", :data, "value") end),
            Task.async(fn -> TechniqueCache.get(:"mixed_#{i}", :data) end),
            Task.async(fn -> TechniqueCache.invalidate(:"mixed_#{rem(i, 5)}", :data) end)
          ]
        end)

      # Should complete without errors
      Task.await_many(tasks)
    end
  end

  describe "technique-specific caching" do
    test "caches detection patterns" do
      patterns = ["pattern1", "pattern2", "pattern3"]
      :ok = TechniqueCache.put(:epistemic_imploze, :patterns, patterns)

      {:ok, cached} = TechniqueCache.get(:epistemic_imploze, :patterns)
      assert cached == patterns
    end

    test "caches compiled regex" do
      regex = ~r/epistemic.*collapse/i
      :ok = TechniqueCache.put(:epistemic_imploze, :regex, regex)

      {:ok, cached} = TechniqueCache.get(:epistemic_imploze, :regex)
      assert cached == regex
    end

    test "caches semantic signatures" do
      signatures = %{
        semantic_field: [:knowledge, :collapse, :destruction],
        weight: 0.85
      }

      :ok = TechniqueCache.put(:cognitive_pandemonium, :signatures, signatures)

      {:ok, cached} = TechniqueCache.get(:cognitive_pandemonium, :signatures)
      assert cached == signatures
    end

    test "caches defense mappings" do
      defenses = [:meta_epistemic_firewall, :cognitive_filtering]
      :ok = TechniqueCache.put(:epistemic_imploze, :defenses, defenses)

      {:ok, cached} = TechniqueCache.get(:epistemic_imploze, :defenses)
      assert cached == defenses
    end
  end
end
