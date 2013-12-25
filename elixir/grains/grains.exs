defmodule Grains do

  use Bitwise

  @doc """
  Calculate two to the power of the input minus one.
  """

  @spec square(pos_integer) :: pos_integer
  def square(number), do: two_to_the_power_of(number - 1)

  @doc """
  Adds square of each number from 1 to 64.
  """

  @spec total :: pos_integer
  def total, do: do_total(64)

  defp do_total(1), do: square(1)
  defp do_total(n), do: square(n) + do_total(n - 1)

  defp two_to_the_power_of(number), do: 1 <<< number

end
