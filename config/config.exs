# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :phoenix_exrethinkdb_chat, PhoenixExrethinkdbChat.Endpoint,
  url: [host: "localhost"],
  root: Path.expand("..", __DIR__),
  secret_key_base: "XrRb6bLKYI1SxI2uRPD1tBh4lmZVI/w3xZYc5k9Uu6LJeoMubAcu7JCHoWZ1VzI5",
  debug_errors: false,
  pubsub: [name: PhoenixExrethinkdbChat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
