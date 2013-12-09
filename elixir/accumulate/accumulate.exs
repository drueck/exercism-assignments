defmodule Accumulate do

  @doc """
  Returns a collection after applying a given function to every element in a
  provided collection.

  For the purpose of the exercise, implemented without list comprehensions or
  Enum functions besides to_list.
  """

  @spec accumulate(Enum.t, (any -> as_boolean(term))) :: list
  def accumulate(collection, function) do
    reduce(Enum.to_list(collection), [], function)
      |> reduce([], fn(x) -> x end)
  end

  defp reduce([], result, function), do: result

  defp reduce([head | tail], result, function) do
    reduce(tail, [function.(head) | result], function)
  end

end
