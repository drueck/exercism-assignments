defmodule Raindrops do

  @sounds [
    { 3, "Pling" },
    { 5, "Plang" },
    { 7, "Plong" }
  ]

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    sounds = factor_sounds(number)
    if sounds != "", do: sounds, else: integer_to_binary(number)
  end

  defp factor_sounds(number) do
    Enum.reduce(@sounds, [], fn({factor, sound}, string) ->
      if rem(number, factor) == 0, do: [ string | sound ], else: string
    end) |> iolist_to_binary
  end

end
