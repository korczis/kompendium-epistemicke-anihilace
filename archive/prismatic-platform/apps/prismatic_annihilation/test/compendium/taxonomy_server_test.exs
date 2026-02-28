defmodule PrismaticAnnihilation.Compendium.TaxonomyServerTest do
  use ExUnit.Case, async: false

  alias PrismaticAnnihilation.Compendium.{Pipeline, TaxonomyServer}

  @project_root Path.expand("../../../../", __DIR__)

  setup_all do
    # Generate data to a temp directory and start TaxonomyServer against it
    tmp_dir = Path.join(System.tmp_dir!(), "taxonomy_test_#{System.unique_integer([:positive])}")
    File.mkdir_p!(tmp_dir)

    {:ok, _result} =
      Pipeline.run(
        base_path: @project_root,
        output_dir: tmp_dir,
        reload_taxonomy: false,
        pretty: true
      )

    # Start a test instance of TaxonomyServer
    {:ok, pid} = TaxonomyServer.start_link(name: :taxonomy_server_test, data_dir: tmp_dir)

    on_exit(fn ->
      if Process.alive?(pid), do: GenServer.stop(pid)
      File.rm_rf!(tmp_dir)
    end)

    %{tmp_dir: tmp_dir, taxonomy_pid: pid}
  end

  describe "TaxonomyServer GenServer" do
    test "loads techniques from generated files" do
      count = GenServer.call(:taxonomy_server_test, :count)
      assert count > 0
    end

    test "get_technique returns technique by ID" do
      # Get all techniques first
      all = GenServer.call(:taxonomy_server_test, :all)
      assert length(all) > 0

      # Get first technique by ID
      first = List.first(all)
      id = Map.get(first, "id")

      {:ok, technique} = GenServer.call(:taxonomy_server_test, {:get_technique, id})
      assert Map.get(technique, "id") == id
    end

    test "get_technique returns error for unknown ID" do
      result = GenServer.call(:taxonomy_server_test, {:get_technique, "EA-999-nonexistent"})
      assert result == {:error, :not_found}
    end

    test "by_category returns techniques for valid category" do
      # Get categories first
      categories = GenServer.call(:taxonomy_server_test, :categories)
      assert map_size(categories) > 0

      # Get first category
      {category, _count} = Enum.at(categories, 0)
      techniques = GenServer.call(:taxonomy_server_test, {:by_category, category})
      assert length(techniques) > 0
    end

    test "search finds techniques by name" do
      results = GenServer.call(:taxonomy_server_test, {:search, "epistemick", []})
      assert length(results) > 0
    end

    test "categories returns all categories with counts" do
      categories = GenServer.call(:taxonomy_server_test, :categories)
      assert map_size(categories) > 0

      Enum.each(categories, fn {cat, count} ->
        assert is_binary(cat)
        assert is_integer(count)
        assert count > 0
      end)
    end

    test "statistics returns valid statistics" do
      stats = GenServer.call(:taxonomy_server_test, :statistics)

      assert stats.technique_count > 0
      assert stats.category_count > 0
      assert %DateTime{} = stats.loaded_at
    end

    test "reload reloads data" do
      result = GenServer.call(:taxonomy_server_test, :reload)
      assert result == :ok
    end
  end
end
