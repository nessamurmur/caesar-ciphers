defmodule CaesarTest do
  use ExUnit.Case

  test "cipher" do
    assert Caesar.cipher("hi", fn(c) -> c + 3 end) == "kl"
    assert Caesar.cipher("kl", fn(c) -> c - 3 end) == "hi"
  end
end
