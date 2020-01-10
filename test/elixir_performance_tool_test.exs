defmodule ElixirPerformanceToolTest do
  use ExUnit.Case
  doctest ElixirPerformanceTool

  test "greets the world" do
    assert ElixirPerformanceTool.hello() == :world
  end
end
