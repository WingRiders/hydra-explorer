defmodule HydraExplorer.Repo do
  use Ecto.Repo,
    otp_app: :hydra_explorer,
    adapter: Ecto.Adapters.Postgres
end
