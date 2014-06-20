defmodule Caesar do
  def encipher(string, key) do
    case key do
    { m, s } ->
      cipher(string, cipher_func(m, s))
    _ ->
      cipher(string, weak_cipher_func(key))
    end
  end

  def decipher(string, key) do
    cipher(string, weak_cipher_func(-key))
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

  def valid_primes do
  [
    2, 3, 5, 7, 11, 13, 17, 19, 23, 29,
    31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
    73, 79, 83, 89, 97, 101, 103, 107, 109, 113
  ]
  end
end
