defmodule Binary do
  use Bitwise, only: :operators

  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.

  ## Examples

    iex> Binary.to_decimal("101010")
    42

  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    digits = String.codepoints(string) |> Enum.reverse
    Stream.with_index(digits) |> Enum.reduce(0, fn({digit, place}, decimal) ->
      decimal + binary_value(digit, place)
    end)
  end

  defp binary_value("1", place), do: 1 <<< place
  defp binary_value(_, _), do: 0
end
