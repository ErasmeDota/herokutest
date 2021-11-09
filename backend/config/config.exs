# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :app,
  namespace: Timemachine,
  ecto_repos: [Timemachine.Repo]

# Configures the endpoint
config :app, TimemachineWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "63RjrP+XC8qPD3xupJ7RUp4ngPA766RnLlmXxUDIA4CibCrPSF9Nurw8S6F8ziVT",
  render_errors: [view: TimemachineWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Timemachine.PubSub,
  live_view: [signing_salt: "x/OcHgYt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
