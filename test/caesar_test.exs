defmodule CaesarTest do
  use ExUnit.Case

  test "cipher" do
    assert Caesar.cipher("hi", fn(c) -> c + 3 end) == "kl"
    assert Caesar.cipher("kl", fn(c) -> c - 3 end) == "hi"
  end

  test "encipher" do
    assert Caesar.encipher("hi", { 3, 2 }) == <<14, 17>>
  end
end
