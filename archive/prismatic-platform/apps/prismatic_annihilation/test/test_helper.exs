# Start the Taxonomy GenServer for tests that need it
{:ok, _} = Application.ensure_all_started(:prismatic_annihilation)

# Start Taxonomy GenServer if not already running
case GenServer.whereis(PrismaticAnnihilation.Taxonomy) do
  nil ->
    {:ok, _pid} = PrismaticAnnihilation.Taxonomy.start_link([])

  _pid ->
    :ok
end

ExUnit.start()
