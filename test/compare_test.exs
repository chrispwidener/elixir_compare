defmodule CompareTest do
  use ExUnit.Case
  doctest Compare

  test "greets the world" do
    assert Compare.hello() == :world
  end
end
