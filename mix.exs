defmodule SecretApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :secret_app,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases(),
    ]
  end

  def application do
    [
      mod: {SecretApplication, []},
      extra_applications: [:logger]
    ]
  end

  def releases() do
    [
      prod: [
        config_providers: [{GcpSecretProvider, %{project: "344858649797"}}],
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:gcp_secret_provider, "~> 0.1.2"},
      {:plug_cowboy, "~> 2.0"},
      {:cors_plug, "~> 2.0"},
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.6"},
    ]
  end
end
