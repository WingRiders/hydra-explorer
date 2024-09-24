defmodule HydraExplorer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    config = Application.get_env(:hydra_explorer, HydraExplorer)
    dry? = Keyword.get(config, :dry?)
    hydra_node_url = Keyword.get(config, :hydra_node_url)
    hydra_node_url_ws = "ws://" <> hydra_node_url
    hydra_node_url_http = "http://" <> hydra_node_url

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
      {HydraExplorer.ProtocolParams, dry?: dry?, url: dbg(hydra_node_url_http)},
      {HydraExplorer.MessageStore, dry?: dry?},
      {HydraExplorer.Head, dry?: dry?, url: hydra_node_url_ws}
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
