defmodule HydraExplorer.Repo do
  use Ecto.Repo,
    otp_app: :hydra_explorer,
    adapter: Ecto.Adapters.SQLite3
end
