defmodule Rendezvous.Mixfile do
  use Mix.Project

  def project do
    [app: :rendezvous,
     version: "0.0.1",
     description: "Implementation of the Rendezvous or Highest Random Weight (HRW) hashing algorithm",
     elixir: "~> 1.0",
     package: package,
     deps: deps,
     test_coverage: [tool: ExCoveralls]
    ]
  end

  defp deps do
    [{:excoveralls, "~> 0.3", only: [:dev, :test]},{:fitex, "~> 0.0.1"}]
  end

  defp package do
    [files: ["lib", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     contributors: ["Tim de Putter"],
     licenses: ["The MIT License"],
     links: %{"GitHub" => "https://github.com/Puddah/Rendezvous"}]
  end
end
