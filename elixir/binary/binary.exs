defmodule ExtendedEnum do

  @doc """
  Invokes `fun` for each element in the collection passing that element, the
  accumulator `acc`, and the 0-based index of the item in the sequence as
  arguments. `fun`'s return value is stored in `acc`.
  Returns the accumulator.

  ## Examples

  iex> ExtendedEnum.reduce_with_index([1, 2, 3], 0, fn(x, acc, index) -> acc + (x * index) end)
  8
  iex> ExtendedEnum.reduce_with_index(10..19, 0, fn(_, acc, index) -> index + 1 end)
  10

  """
  @type acc :: any
  @spec reduce_with_index(Enum.t, acc, (any, acc, non_neg_integer -> any)) :: any
  def reduce_with_index(list, acc, fun) do
    { acc, _ } = Enum.reduce(list, { acc, 0 }, fn(x, { acc, index }) ->
      { fun.(x, acc, index), index + 1 }
    end)
    acc
  end

end

defmodule Binary do
  use Bitwise, only: :operators

  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    digits = String.codepoints(string) |> Enum.reverse
    ExtendedEnum.reduce_with_index(digits, 0, fn(digit, decimal, place) ->
      decimal + binary_value(digit, place)
    end)
  end

  defp binary_value("1", place), do: 1 <<< place
  defp binary_value(_, _), do: 0

end
