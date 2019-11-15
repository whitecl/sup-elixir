defmodule SupResovler do
  use Mix.Project

  def project do
    [
      app: :sup_resolver,
      version: "0.0.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies
  defp deps do
    [{:mock, "~> 0.3.0", only: :test}, {:poison, "~> 4.0"}]
  end
end
