defmodule ETL do

  @doc """
  Transform an index into an inverted index.

  ## Examples
  iex> ETL.transform(HashDict.new [{"a", ["ABILITY", "AARDVARK"]}, {"b", ["BALLAST", "BEAUTY"]}])
  HashDict.new [{"aardvark", "a"}, {"ability", "a"}, {"ballast", "b"}, {"beauty", "b"}]
  """
  @spec transform(Dict.t) :: HashDict.t
  def transform(input) do
    Enum.flat_map(input, &invert_index/1) |> HashDict.new
  end

  defp invert_index({ letter, words }) do
    Enum.map words, &{ String.downcase(&1), letter }
  end

end
