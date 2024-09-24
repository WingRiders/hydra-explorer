import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :hydra_explorer, HydraExplorer.Repo,
  adapter: Ecto.Adapters.SQLite3,
  database: "priv/repo/dev.sqlite3",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hydra_explorer, HydraExplorerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "VrmHLqwcpfkzqOtyCKp2ZPTHNvIEKBulHX6mnqg2xDXhxFmm5DX+MzpL4sVvm5qL",
  server: false

# In test we don't send emails.
config :hydra_explorer, HydraExplorer.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :hydra_explorer, HydraExplorer,
  dry?: true,
  hydra_node_url: "127.0.0.1:4001"
