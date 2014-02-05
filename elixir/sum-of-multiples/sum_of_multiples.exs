defmodule SumOfMultiples do

  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.

  The default factors are 3 and 5.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors // [3, 5]) do
    Stream.filter(1..(limit - 1), &multiple_of_any?(&1, factors))
      |> Enum.reduce(0, &(&1 + &2))
  end

  defp multiple_of_any?(number, factors) do
    Enum.any?(factors, &(rem(number, &1) == 0))
  end

end
