defmodule Allergies do

  use Bitwise, only_operators: true

  @allergy_flags [
    { "eggs", 1 },
    { "peanuts", 2 },
    { "shellfish", 4 },
    { "strawberries", 8 },
    { "tomatoes", 16 },
    { "chocolate", 32 },
    { "pollen", 64 },
    { "cats", 128 }
  ]

  @allergy_dict HashDict.new @allergy_flags

  @doc """
  List the allergies for which the corresponding flag bit is true.

  Allergies should be ordered, starting with the allergy with the least
  significant bit ("eggs").
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(score) do
    @allergy_flags
      |> Stream.filter(fn({ _, flag }) -> flag_set?(score, flag) end)
      |> Enum.map(fn({ item, _ }) -> item end)
  end

  @doc """
  Returns whether the corresponding flag bit in 'score' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(score, item) do
    flag = Dict.get(@allergy_dict, item, 0)
    flag_set?(score, flag)
  end

  defp flag_set?(value, flag), do: (value &&& flag) == flag

end
