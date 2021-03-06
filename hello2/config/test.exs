use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hello2, Hello2Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :hello2, Hello2.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "damianspain",
  password: "postgres",
  database: "hello2_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
