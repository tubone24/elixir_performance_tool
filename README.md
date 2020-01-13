# Ebook Homebrew: ElixirPerformanceTool

Checking TAT benchmark test tools for Parallel HTTP requests by Elixir.

## Preconditions

### Dependencies

Install dependencies by Mix.

```bash
mix deps.get
```

### Run the test by IEx.

Run the test by IEx.

```
iex -S mix

iex(1)> ElixirPerformanceTool.run(10, 10)
```

Function `ElixirPerformanceTool.run` set 2 args, first one is parallel task number, second one is repeating times.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_performance_tool` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_performance_tool, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elixir_performance_tool](https://hexdocs.pm/elixir_performance_tool).
