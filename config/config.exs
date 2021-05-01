# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenixapi,
  ecto_repos: [Phoenixapi.Repo]

# create a new config to set identity column to use UUID
config :phoenixapi, Phoenixapi.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Set Phoenixapi to use Bamboo
config :phoenixapi, Phoenixapi.Mailer, adapter: Bamboo.LocalAdapter

# Configures the endpoint
config :phoenixapi, PhoenixapiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FHDJX4ZCozdz0piYBGlEkpEAd3liTaBl2ahzBWuRZExNFi47nNX2GdvOzE6qcoa7",
  render_errors: [view: PhoenixapiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Phoenixapi.PubSub,
  live_view: [signing_salt: "SL8frntI"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
