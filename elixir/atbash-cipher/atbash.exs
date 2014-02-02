defmodule Atbash do

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    String.downcase(plaintext)
      |> String.replace(%r/[^a-z0-9]/, "")
      |> String.to_char_list!
      |> Enum.map(&translate/1)
      |> Enum.chunk(5, 5, [])
      |> Enum.map_join(" ", &(String.from_char_list!(&1)))
  end

  defp translate(char) when char >= ?1 and char <= ?9, do: char
  defp translate(char), do: ?z - (char - ?a)

end
