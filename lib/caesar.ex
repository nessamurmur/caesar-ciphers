defmodule Caesar do
  def encipher(string, key) do
    case key do
    { m, s } ->
      cipher(string, cipher_func(m, s))
    _ ->
      cipher(string, weak_cipher_func(key))
    end
  end

  def cipher(string, func) do
    string |> String.downcase
           |> String.to_char_list
           |> Enum.map(func)
           |> List.to_string
  end

  def weak_cipher_func(key) do
    fn(c) -> rem(c + key, 127) end
  end

  def cipher_func(m, s) do
    fn(c) -> rem((c * m + s), 127) end
  end
end
