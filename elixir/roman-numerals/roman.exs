defmodule Roman do

  @numeral_pairs [
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

  def numerals(arabic) do
    numerals(arabic, "", @numeral_pairs)
  end

  defp numerals(0, roman, _), do: roman
  defp numerals(arabic, roman, numeral_pairs) do
    { value, chars, remaining_pairs } = next_numeral_pair(arabic, numeral_pairs)
    numerals(arabic - value, roman <> chars, remaining_pairs)
  end

  defp next_numeral_pair(arabic, numeral_pairs) do
    { value, chars } = Enum.find(numeral_pairs, fn({ value, _ }) -> value <= arabic end)
    { value, chars, relevant_pairs(numeral_pairs, arabic - value) }
  end

  defp relevant_pairs(numeral_pairs, number) do
    Enum.drop_while(numeral_pairs, fn({ value, _ }) -> value > number end)
  end

end
