defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    do_primes(Enum.to_list(2..limit), []) |> Enum.reverse
  end

  defp do_primes([], primes), do: primes
  defp do_primes([ candidate | rest ], primes) do
    if is_prime?(candidate, primes) do
      candidates = Enum.reject(rest, &(rem(&1, candidate) == 0))
      do_primes(candidates, [ candidate | primes ])
    else
      do_primes(rest, primes)
    end
  end

  @doc """
  Checks if a given number is prime based on a given list of known primes.
  """
  @spec is_prime?(non_neg_integer, [non_neg_integer]) :: boolean
  defp is_prime?(number, primes) do
    Enum.all?(primes, &(number == &1 || rem(number, &1) != 0))
  end

end
