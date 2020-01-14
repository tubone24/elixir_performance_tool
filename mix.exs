defmodule ElixirPerformanceTool.MixProject do
  use Mix.Project

  @description """
    Checking TAT benchmark test tools for Parallel HTTP requests by Elixir.
  """

  def project do
    [
      app: :elixir_performance_tool,
      version: "0.1.0",
      elixir: "~> 1.9",
      name: "ElixirPerformanceTool",
      description: @description,
      package: package(),
      source_url: "https://github.com/tubone24/elixir_performance_tool",
      homepage_url: "https://github.com/tubone24/elixir_performance_tool",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        main: "readme",
        logo: "elixir_perfomance_logo.png",
        extras: [
          "README.md"
        ]
      ],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      { :httpoison, "~> 0.7.4"},
      {:poison, "~> 3.1"},
      {:csv, "~> 2.3"},
      {:earmark, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.18", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["tubone24"],
      licenses: ["MIT"],
      links: %{
        GitHub: "https://github.com/tubone24/elixir_performance_tool"
      }
    ]
  end
end
