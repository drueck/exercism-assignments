defmodule DNA do

  def hamming_distance(strand1, strand2) do
    homologous_pairs(strand1, strand2)
      |> Enum.count(&mutation?(&1))
  end

  defp homologous_pairs(strand1, strand2) do
    [shorter, longer] = Enum.sort([strand1, strand2], &(Enum.count(&1) < Enum.count(&2)))
    Enum.zip(shorter, longer)
  end

  defp mutation?({n1, n2}), do: n1 != n2

end
