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
    { _ , roman } = Enum.reduce(@numeral_pairs, { arabic, "" }, &append_chars/2)
    iolist_to_binary(roman)
  end

  defp append_chars({ value, chars }, { arabic, roman }) do
    case arabic < value do
      true -> { arabic, roman }
      false -> append_chars({ value, chars }, { arabic - value, [roman | chars] })
    end
  end

end
