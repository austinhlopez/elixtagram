defmodule Elixtagram.Mixfile do
  use Mix.Project

  def project do
    [app: :elixtagram,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     test_coverage: [tool: ExCoveralls],
     deps: deps]
  end

  def application do
    [applications: app_list(Mix.env)]
  end

  defp app_list(:dev), do: [:dotenv | app_list]
  defp app_list(:test), do: [:dotenv | app_list]
  defp app_list(_), do: app_list
  defp app_list, do: [:logger, :httpoison, :oauth2]

  defp deps do
    [
      {:httpoison, "~> 0.7.4"},
      {:poison, "~> 1.5"},
      {:oauth2, "~> 0.3"},
      {:exvcr, "~> 0.3", only: [:dev, :test]},
      {:ex_doc, github: "elixir-lang/ex_doc", only: [:dev, :docs]},
      {:excoveralls, "~> 0.3", only: [:dev, :test]},
      {:inch_ex, "~> 0.4.0", only: [:dev, :docs]},
      {:dotenv, "~> 1.0.0"}
    ]
  end

  defp description do
    """
    Instagram client library for Elixir.
    """
  end

  defp package do
    [ contributors: ["zensavona"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/zensavona/elixtagram"} ]
  end
end
