defmodule Allergies do

  use Bitwise, only_operators: true

  @allergy_flags [
    { 128, "cats" },
    { 64, "pollen" },
    { 32, "chocolate" },
    { 16, "tomatoes" },
    { 8, "strawberries" },
    { 4, "shellfish" },
    { 2, "peanuts" },
    { 1, "eggs" }
  ]

  @allergy_dict HashDict.new(@allergy_flags, fn({ f, a }) -> { a, f } end)

  @doc """
  List the allergies for which the corresponding flag bit is true.

  Allergies should be ordered, starting with the allergy with the least
  significant bit ("eggs").
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(score) do
    Enum.reduce(@allergy_flags, [], fn({ flag, allergy }, allergies) ->
      if flag_set?(score, flag), do: [ allergy | allergies ], else: allergies
    end)
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
