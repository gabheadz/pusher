defmodule Pushxer.Mixfile do
  use Mix.Project

  @description """
    Pusher HTTP client
  """

  def project do
    [
      app: :pushxer,
      version: "0.0.1",
      elixir: "~> 1.7",
      name: "Pushxer",
      description: @description,
      package: package(),
      source_url: "https://github.com/gabheadz/pushxer.git",
      deps: deps(),
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:signaturex, "~> 1.3.0"},
      {:jason, "~> 1.2"},
      {:mimic, "~> 1.4", only: :test},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Gabriel Martinez"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/gabheadz/pushxer.git"}
    ]
  end
end
