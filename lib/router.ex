defmodule Router do
  use Plug.Router
  use Plug.ErrorHandler
  plug(CORSPlug)

  plug(Plug.Parsers, parsers: [:json], pass: ["application/json"], json_decoder: Poison)
  plug(:match)
  plug(:dispatch)

  get "/" do
    secrets = %{
      foo: "bar",
      app_token: Application.fetch_env!(:secret_app, :app_token),
      db_user: Application.fetch_env!(:secret_app, :db_user),
      db_password: Application.fetch_env!(:secret_app, :db_password),
    }

    send_resp(conn, 200, Poison.encode!(secrets))
  end

  match _ do
    send_resp(conn, 404, Poison.encode!(%{error: "NOT FOUND"}))
  end
end
