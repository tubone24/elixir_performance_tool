defmodule ElixirPerformanceToolTest do
  use ExUnit.Case
  doctest ElixirPerformanceTool

  test "run stop" do
    assert ElixirPerformanceTool.run(10,10,10)
  end
end
