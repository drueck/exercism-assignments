defmodule ListOps do

  @spec count(list) :: non_neg_integer
  def count(l) do
    reduce(l, 0, fn(_, acc) -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce(l, [], fn(x, acc) -> [x | acc] end)
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    reduce(l, [], fn(x, acc) -> [f.(x) | acc] end)
    |> reverse
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reduce(l, [], fn(x, acc) ->
      if f.(x) do [x | acc] else acc end
    end)
    |> reverse
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([h | t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    reduce(reverse(a), b, fn(x, acc) -> [x | acc] end)
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reduce(reverse(ll), [], fn(l, acc) -> append(l, acc) end)
  end

end
