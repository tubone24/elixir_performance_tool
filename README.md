# Ebook Homebrew: ElixirPerformanceTool

![logo](docs/images/elixir_perfomance_logo.png)

[![license](https://img.shields.io/github/license/tubone24/elixir_performance_tool.svg)](LICENSE)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

Checking TAT benchmark test tools for Parallel HTTP requests by Elixir.

## Table of Contents

- [Background](#background)
- [Install](#install)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Background

## Install

### Preconditions

#### Dependencies

Install dependencies by Mix.

```bash
mix deps.get
```

### Installation for another modules

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

## Usage

### Run the test by IEx.

Run the test by IEx.

```
iex -S mix

iex(1)> ElixirPerformanceTool.run(10, 10)
```

Function `ElixirPerformanceTool.run` set 2 args, first one is parallel task number, second one is repeating times.

## Contributing

See [the contributing file](CONTRIBUTING.md)!

PRs accepted.

Small note: If editing the Readme, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

[MIT © tubone.](LICENSE)
