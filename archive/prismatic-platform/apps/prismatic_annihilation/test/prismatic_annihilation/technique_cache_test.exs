defmodule PrismaticAnnihilation.TechniqueCacheTest do
  @moduledoc """
  Tests for the Technique Cache module.

  Validates ETS-based caching with TTL and automatic cleanup.
  """

  use ExUnit.Case, async: false

  alias PrismaticAnnihilation.TechniqueCache

  setup do
    case GenServer.whereis(TechniqueCache) do
      nil ->
        {:ok, _pid} = TechniqueCache.start_link([])
        # Wait for ETS table to be ready
        Process.sleep(50)
        :ok

      _pid ->
        # Clear existing cache
        TechniqueCache.clear()
        :ok
    end

    :ok
  end

  describe "put/3 and get/1" do
    test "stores and retrieves value" do
      key = :test_key
      value = %{data: "test value"}

      :ok = TechniqueCache.put(key, value)
      {:ok, retrieved} = TechniqueCache.get(key)

      assert retrieved == value
    end

    test "returns error for missing key" do
      {:error, :not_found} = TechniqueCache.get(:nonexistent_key)
    end

    test "overwrites existing value" do
      key = :overwrite_test
      :ok = TechniqueCache.put(key, %{version: 1})
      :ok = TechniqueCache.put(key, %{version: 2})

      {:ok, retrieved} = TechniqueCache.get(key)
      assert retrieved.version == 2
    end

    test "handles various value types" do
      :ok = TechniqueCache.put(:string_val, "test string")
      :ok = TechniqueCache.put(:int_val, 42)
      :ok = TechniqueCache.put(:list_val, [1, 2, 3])
      :ok = TechniqueCache.put(:map_val, %{a: 1, b: 2})
      :ok = TechniqueCache.put(:tuple_val, {:ok, "result"})

      {:ok, string} = TechniqueCache.get(:string_val)
      {:ok, int} = TechniqueCache.get(:int_val)
      {:ok, list} = TechniqueCache.get(:list_val)
      {:ok, map} = TechniqueCache.get(:map_val)
      {:ok, tuple} = TechniqueCache.get(:tuple_val)

      assert string == "test string"
      assert int == 42
      assert list == [1, 2, 3]
      assert map == %{a: 1, b: 2}
      assert tuple == {:ok, "result"}
    end
  end

  describe "put/3 with TTL" do
    test "respects custom TTL" do
      key = :short_ttl_key
      :ok = TechniqueCache.put(key, "value", ttl: 100)

      {:ok, _} = TechniqueCache.get(key)

      # Wait for TTL to expire
      Process.sleep(150)

      {:error, :not_found} = TechniqueCache.get(key)
    end

    test "uses default TTL when not specified" do
      key = :default_ttl_key
      :ok = TechniqueCache.put(key, "value")

      # Should still be available immediately
      {:ok, _} = TechniqueCache.get(key)
    end
  end

  describe "delete/1" do
    test "removes key from cache" do
      key = :delete_test
      :ok = TechniqueCache.put(key, "value")
      {:ok, _} = TechniqueCache.get(key)

      :ok = TechniqueCache.delete(key)
      {:error, :not_found} = TechniqueCache.get(key)
    end

    test "succeeds for nonexistent key" do
      :ok = TechniqueCache.delete(:nonexistent)
    end
  end

  describe "clear/0" do
    test "removes all entries" do
      :ok = TechniqueCache.put(:key1, "value1")
      :ok = TechniqueCache.put(:key2, "value2")
      :ok = TechniqueCache.put(:key3, "value3")

      :ok = TechniqueCache.clear()

      {:error, :not_found} = TechniqueCache.get(:key1)
      {:error, :not_found} = TechniqueCache.get(:key2)
      {:error, :not_found} = TechniqueCache.get(:key3)
    end

    test "works on empty cache" do
      :ok = TechniqueCache.clear()
    end
  end

  describe "size/0" do
    test "returns number of entries" do
      :ok = TechniqueCache.clear()

      assert TechniqueCache.size() == 0

      :ok = TechniqueCache.put(:key1, "v1")
      assert TechniqueCache.size() == 1

      :ok = TechniqueCache.put(:key2, "v2")
      assert TechniqueCache.size() == 2

      :ok = TechniqueCache.put(:key3, "v3")
      assert TechniqueCache.size() == 3
    end

    test "decreases after delete" do
      :ok = TechniqueCache.clear()
      :ok = TechniqueCache.put(:key1, "v1")
      :ok = TechniqueCache.put(:key2, "v2")

      assert TechniqueCache.size() == 2

      :ok = TechniqueCache.delete(:key1)
      assert TechniqueCache.size() == 1
    end
  end

  describe "stats/0" do
    test "returns cache statistics" do
      stats = TechniqueCache.stats()

      assert Map.has_key?(stats, :size)
      assert Map.has_key?(stats, :memory)
      assert Map.has_key?(stats, :hits)
      assert Map.has_key?(stats, :misses)
    end

    test "tracks hits and misses" do
      :ok = TechniqueCache.clear()
      :ok = TechniqueCache.put(:existing, "value")

      # Generate some hits
      TechniqueCache.get(:existing)
      TechniqueCache.get(:existing)

      # Generate some misses
      TechniqueCache.get(:missing1)
      TechniqueCache.get(:missing2)

      stats = TechniqueCache.stats()

      assert stats.hits >= 2
      assert stats.misses >= 2
    end
  end

  describe "get_or_compute/3" do
    test "returns cached value if exists" do
      key = :compute_test
      :ok = TechniqueCache.put(key, "cached_value")

      {:ok, result} = TechniqueCache.get_or_compute(key, fn -> "computed_value" end)

      assert result == "cached_value"
    end

    test "computes and caches if missing" do
      key = :compute_missing
      TechniqueCache.delete(key)

      {:ok, result} = TechniqueCache.get_or_compute(key, fn -> "computed_value" end)

      assert result == "computed_value"

      # Verify it was cached
      {:ok, cached} = TechniqueCache.get(key)
      assert cached == "computed_value"
    end

    test "passes options to put" do
      key = :compute_with_ttl
      TechniqueCache.delete(key)

      {:ok, _} = TechniqueCache.get_or_compute(key, fn -> "value" end, ttl: 100)

      # Should be available immediately
      {:ok, _} = TechniqueCache.get(key)

      # Wait for TTL
      Process.sleep(150)

      # Should be expired
      {:error, :not_found} = TechniqueCache.get(key)
    end
  end

  describe "concurrent access" do
    test "handles concurrent writes" do
      tasks =
        Enum.map(1..100, fn i ->
          Task.async(fn ->
            TechniqueCache.put("key_#{i}", "value_#{i}")
          end)
        end)

      results = Task.await_many(tasks)

      assert Enum.all?(results, &(&1 == :ok))
    end

    test "handles concurrent reads" do
      :ok = TechniqueCache.put(:shared_key, "shared_value")

      tasks =
        Enum.map(1..100, fn _i ->
          Task.async(fn ->
            TechniqueCache.get(:shared_key)
          end)
        end)

      results = Task.await_many(tasks)

      assert Enum.all?(results, &match?({:ok, "shared_value"}, &1))
    end

    test "handles mixed operations" do
      tasks =
        Enum.flat_map(1..20, fn i ->
          [
            Task.async(fn -> TechniqueCache.put("mixed_#{i}", "value_#{i}") end),
            Task.async(fn -> TechniqueCache.get("mixed_#{i}") end),
            Task.async(fn -> TechniqueCache.delete("mixed_#{rem(i, 5)}") end)
          ]
        end)

      # Should complete without errors
      Task.await_many(tasks)
    end
  end
end
