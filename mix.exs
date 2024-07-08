defmodule Gmail.Mixfile do
  use Mix.Project

  def project do
    [app: :gmail,
     version: "0.1.20",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test],
     description: "A simple Gmail REST API client for Elixir",
     package: package()]
  end

  def application do
    [extra_applications: [:logger],
      mod: {Gmail, []}]
  end

  defp deps do
    [
      {:poolboy, "~> 1.5.0"},
      {:httpoison, "~> 1.8.0"},
      {:poison, "~> 2.1 or ~> 3.1 or ~> 4.0"},
      {:mock, "~> 0.3.8", only: :test},
      {:excoveralls, "~> 0.18", only: :test},
      {:earmark, "~> 1.4.0", only: :dev},
      {:ex_doc, "~> 0.34", only: :dev},
      {:dialyxir, "~> 1.4.0", only: :dev},
      {:credo, "~> 1.0.0", only: :dev},
      {:bypass, "~> 2.0", only: :test},
      {:inch_ex, "~> 2.0", only: :docs},
      {:mix_test_watch, "~> 1.2.0", only: :dev}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      maintainers: ["Craig Paterson"],
      links: %{"Github" => "https://github.com/craigp/elixir-gmail"}
    ]
  end

end
