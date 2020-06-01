use Mix.Config

config :secret_app, env: Mix.env()

config(:gcp_secret_provider, service_account: nil)

config :secret_app, :app_token, {"GAE_SECRET", :string, "APP_TOKEN"}
config :secret_app, :db_user, {"GAE_SECRET", :string, "DB_USER"}
config :secret_app, :db_password, {"GAE_SECRET", :string, "DB_PASSWORD"}

import_config "#{Mix.env()}.exs"
