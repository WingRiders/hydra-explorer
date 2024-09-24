defmodule HydraExplorerWeb.Router do
  use HydraExplorerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HydraExplorerWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HydraExplorerWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/protocol_params", ProtocolParams
    live "/committed", Committed
    live "/log", Log
    live "/peers", Peers
    live "/snapshots", Snapshots
    live "/transactions", Transactions
  end

  # Other scopes may use custom stacks.
  scope "/api", HydraExplorerWeb do
    pipe_through :api
    get "/messages", ApiController, :messages
    get "/protocol-parameters", ApiController, :protocol_parameters
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:hydra_explorer, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: HydraExplorerWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
