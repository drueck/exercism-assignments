defmodule Accumulate do

  @doc """
  Returns a collection after applying a given function to every element in a provided collection.

  Try to do this exercise without using map!
  """

  @spec accumulate(Enum.t, (any -> as_boolean(term))) :: list
  def accumulate(collection, function) do
    reduce(Enum.to_list(collection), function, [])
      |> reduce(fn(x) -> x end, [])
  end

  defp reduce([], function, result), do: result

  defp reduce([head | tail], function, result) do
    reduce(tail, function, [function.(head) | result])
  end

end
