defmodule SecretApplication do
  use Application
  require Logger

  def start(_type, _args) do
    port = Application.get_env(:secret_app, "PORT", 3002)
    env = Application.get_env(:secret_app, :env)

    children = [
      {
        Plug.Cowboy,
        scheme: :http,
        plug: Router,
        options: [
          port: port
        ]
      }
    ]

    opts = [strategy: :one_for_one, name: Supervisor]

    Logger.info("Starting application... on port #{port}")
    Logger.info("Running as #{env}")

    Supervisor.start_link(children, opts)
  end
end
