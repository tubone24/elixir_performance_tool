defmodule ElixirPerformanceToolTest do
  use ExUnit.Case
  # doctest ElixirPerformanceTool

  test "convert imagefile to base64" do
    image = File.read!("./test.png")
    encoded_png = :base64.encode(image)
    assert ElixirPerformanceTool.create_base64png("./test.png") == encoded_png
  end
end
