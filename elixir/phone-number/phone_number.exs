defmodule Phone do

  @number_length 10
  @area_code_range 0..2
  @prefix_range 3..5
  @line_number_range 6..9

  def number(formatted_number) do
    formatted_number
      |> strip_formatting
      |> validate
  end

  def area_code(number) do
    segment(number, @area_code_range)
  end

  def pretty(formatted_number) do
    n = number(formatted_number)
    "(#{area_code(n)}) #{prefix(n)}-#{line_number(n)}"
  end

  defp strip_formatting(formatted_number) do
    String.replace(formatted_number, %r/\D/, "")
  end

  defp validate(<< ?1, number :: [binary, size(@number_length)]>>), do: number
  defp validate(<< number :: [binary, size(@number_length)]>>), do: number
  defp validate(_), do: "0000000000"

  defp prefix(number) do
    segment(number, @prefix_range)
  end

  defp line_number(number) do
    segment(number, @line_number_range)
  end

  defp segment(number, range) do
    String.slice(number, Enum.at(range, 0), Enum.count(range))
  end

end
