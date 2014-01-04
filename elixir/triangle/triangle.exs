defmodule Triangle do

  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }

  def kind(a, b, c) do
    cond do
      any_non_positive?([a, b, c]) ->
        { :error, "all side lengths must be positive" }
      violates_triangle_inequality?(a, b, c) ->
        { :error, "side lengths violate triangle inequality" }
      true ->
        { :ok, triangle_type([a, b, c]) }
    end
  end

  defp any_non_positive?(sides) do
    Enum.any?(sides, &1 <= 0)
  end

  defp violates_triangle_inequality?(a, b, c) do
    a + b <= c || a + c <= b || b + c <= a
  end

  defp triangle_type(sides) do
    case unique_sides(sides) do
      1 -> :equilateral
      2 -> :isosceles
      3 -> :scalene
    end
  end

  defp unique_sides(sides) do
    HashSet.new(sides) |> Set.size
  end

end
