defmodule DNA do

  @thymidine ?T
  @uracil ?U

  def to_rna(dna_sequence) do
    lc nucleotide inlist dna_sequence, do: rna_counterpart(nucleotide)
  end

  defp rna_counterpart(@thymidine), do: @uracil
  defp rna_counterpart(nucleotide), do: nucleotide

end
