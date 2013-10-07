defmodule Phone do

  @us_phone_number_length 10
  @area_code_range 0..2
  @prefix_range 3..5
  @line_number_range 6..9

  def number(formatted_number) do
    formatted_number
      |> strip_formatting
      |> strip_country_code
      |> validate
  end

  def pretty(formatted_number) do
    n = number(formatted_number)
    "(#{area_code(n)}) #{prefix(n)}-#{line_number(n)}"
  end

  def area_code(number) do
    segment(number, @area_code_range)
  end

  defp prefix(number) do
    segment(number, @prefix_range)
  end

  defp line_number(number) do
    segment(number, @line_number_range)
  end

  defp strip_formatting(formatted_number) do
    String.replace(formatted_number, %r/[^\d]/, "")
  end

  defp strip_country_code(number) do
    if includes_country_code?(number) do
      String.slice(number, 1, @us_phone_number_length)
    else
      number
    end
  end

  defp includes_country_code?(number) do
    String.length(number) == @us_phone_number_length + 1 &&
      String.starts_with?(number, "1")
  end

  defp validate(number) do
    if String.length(number) == 10, do: number, else: "0000000000"
  end

  defp segment(number, range) do
    String.slice(number, Enum.at(range, 0), Enum.count(range))
  end

end
