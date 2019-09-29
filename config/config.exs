# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :movie_api,
  ecto_repos: [MovieApi.Repo]

# Configures the endpoint
config :movie_api, MovieApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZekgFA72rOrZwqdaIiNZZSkA3n0K1cCHv1dX6a6s278pW3rooyn99dNgxNPoUbI/",
  render_errors: [view: MovieApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MovieApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
