defmodule Caesar do
  def cipher(string, func) do
    string |> String.downcase
           |> String.to_char_list
           |> Enum.map(func)
           |> List.to_string
  end
end
