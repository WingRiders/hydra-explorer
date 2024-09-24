defmodule HydraExplorer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HydraExplorerWeb.Telemetry,
      # Start the Ecto repository
      HydraExplorer.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: HydraExplorer.PubSub},
      # Start Finch
      {Finch, name: HydraExplorer.Finch},
      # Start the Endpoint (http/https)
      HydraExplorerWeb.Endpoint,
      {HydraExplorer.ProtocolParams, url: "http://127.0.0.1:4001"},
      {HydraExplorer.MessageStore, %{}},
      {HydraExplorer.Head, %{}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: HydraExplorer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HydraExplorerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
