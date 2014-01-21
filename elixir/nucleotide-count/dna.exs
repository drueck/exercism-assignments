defmodule DNA do

  @nucleotides [ ?A, ?T, ?C, ?G ]

  def count(strand, nucleotide) do
    Enum.count strand, &(&1 == nucleotide)
  end

  def nucleotide_counts(strand) do
    HashDict.new @nucleotides, &{ &1, count(strand, &1) }
  end

end
