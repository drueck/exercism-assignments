defmodule DNA do

  def count(strand, nucleotide) do
    Enum.count(strand, &1 == nucleotide)
  end

  def nucleotide_counts(strand) do
    HashDict.new [
      {?A, count(strand, ?A)},
      {?T, count(strand, ?T)},
      {?C, count(strand, ?C)},
      {?G, count(strand, ?G)}
    ]
  end

end
