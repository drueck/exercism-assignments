defmodule ListOps do

  @spec count(list) :: non_neg_integer
  def count(l) do
    reduce(l, 0, fn(acc, _) -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce(l, [], fn(acc, x) -> [x | acc] end)
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    reduce(l, [], fn(acc, x) -> [f.(x) | acc] end)
    |> reverse
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reduce(l, [], fn(acc, x) ->
      if f.(x) do [x | acc] else acc end
    end)
    |> reverse
  end

  @type acc :: any
  @spec reduce(list, acc, ((acc, any) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([h | t], acc, f) do
    reduce(t, f.(acc, h), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    reduce(reverse(a), b, fn(acc, x) -> [x | acc] end)
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reduce(reverse(ll), [], fn(acc, l) -> append(l, acc) end)
  end

end
