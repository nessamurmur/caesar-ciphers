defmodule Caesar do
  def encipher(string, key) do
    { m, s } = key
    cipher(string, cipher_func(m, s))
  end

  def cipher(string, func) do
    string |> String.downcase
           |> String.to_char_list
           |> Enum.map(func)
           |> List.to_string
  end

  def cipher_func(m, s) do
    fn(c) -> rem((c * m + s), 25) end
  end
end
