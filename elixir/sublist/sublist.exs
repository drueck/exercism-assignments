defmodule Sublist do

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b) when length(a) == length(b), do: :unequal

  def compare(a, b) when length(a) > length(b) do
    if contains(a, b), do: :superlist, else: :unequal
  end

  def compare(a, b) when length(a) < length(b) do
    if contains(b, a), do: :sublist, else: :unequal
  end

  defp contains(_, []), do: true
  defp contains(haystack, needle) do
    Stream.chunk(haystack, length(needle), 1) |> Enum.any? &(&1 === needle)
  end

end
