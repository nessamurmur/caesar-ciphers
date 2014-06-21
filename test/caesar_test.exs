defmodule CaesarTest do
  use ExUnit.Case

  test "cipher" do
    assert Caesar.cipher("hi", fn(c) -> c + 3 end) == "kl"
    assert Caesar.cipher("kl", fn(c) -> c - 3 end) == "hi"
  end

  test "encipher" do
    assert Caesar.encipher("hi", 3) == "kl"
    assert Caesar.encipher("hi", { 3, 5 }) == "?B"
  end

  test "encipher thows an exception for a tuple including an invalid first element" do
    assert_raise InvalidKey, fn ->
      Caesar.encipher("hi", {4, 2})
    end
  end

  def test "encipher throws an exception for a non-number, non-tuple value" do
    assert_raise InvalidKey, fn ->
      Caesar.encipher("hi", "there")
    end

    assert_raise InvalidKey, fn ->
      Caesar.encipher("hi", <<1, 2>>)
    end
  end

  test "decipher" do
    assert Caesar.decipher("kl", 3) == "hi"
  end
end
