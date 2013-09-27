defmodule DNA do

  def hamming_distance(strand1, strand2) do
    homologous_pairs(strand1, strand2)
      |> Enum.count(&mutation?(&1))
  end

  defp homologous_pairs(strand1, strand2) do
    List.zip([strand1, strand2])
  end

  defp mutation?({n1, n2}), do: n1 != n2

end
