defmodule Roman do

  @numerals [
    { 1000, "M" },
    { 900, "CM" },
    { 500, "D" },
    { 400, "CD" },
    { 100, "C" },
    { 90, "XC" },
    { 50, "L" },
    { 40, "XL" },
    { 10, "X" },
    { 9, "IX" },
    { 5, "V" },
    { 4, "IV" },
    { 1, "I" }
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    numerals(number, "")
  end

  defp numerals(0, numerals), do: numerals
  defp numerals(number, numerals) do
    { value, chars } = next_numeral_pair(number)
    numerals(number - value, numerals <> chars)
  end

  defp next_numeral_pair(number) do
    Enum.find(@numerals, fn({ value, _ }) -> number >= value end)
  end

end
