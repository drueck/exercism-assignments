defmodule DNA do

  def count(strand, nucleotide) do
    Enum.count(strand, &1 == nucleotide)
  end

  def nucleotide_counts(strand) do
    HashDict.new(nucleotides, fn n -> { n, count(strand, n) } end)
  end

  defp nucleotides do
    [ ?A, ?T, ?C, ?G ]
  end

end
