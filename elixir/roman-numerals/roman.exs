defmodule Roman do

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t

  def numerals(number) do
    server = NumeralServer.start_link
    numerals(number, "", server)
  end

  defp numerals(0, numerals, _), do: numerals
  defp numerals(number, numerals, server) do
    { value, chars } = NumeralServer.next_numeral_pair(server, number)
    numerals(number - value, numerals <> chars, server)
  end

end

defmodule NumeralServer do

  use GenServer.Behaviour

  @numerals [
    { 1000, "M" },
    { 900, "CM" },
    { 500, "D" },
    { 400, "CD" },
    { 100, "C" },
    { 90, "XC" },
    { 50, "L" },
    { 40, "XL" },
    { 10, "X" },
    { 9, "IX" },
    { 5, "V" },
    { 4, "IV" },
    { 1, "I" }
  ]

  def start_link(numeral_pairs // @numerals) do
    { :ok, server } = :gen_server.start_link NumeralServer, numeral_pairs, []
    server
  end

  def next_numeral_pair(server, number) do
    :gen_server.call(server, { :next, number })
  end

  def init(numeral_pairs) do
    { :ok, numeral_pairs }
  end

  def handle_call({ :next, number }, _from, numeral_pairs) do
    { value, chars } = Enum.find(numeral_pairs, fn({ value, _ }) -> value <= number end)
    { :reply, { value, chars }, remove_excess_pairs(numeral_pairs, number - value) }
  end

  defp remove_excess_pairs(numeral_pairs, number) do
    Enum.drop_while(numeral_pairs, fn({ value, _ }) -> value > number end)
  end

end
