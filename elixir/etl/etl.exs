defmodule ETL do

  @doc """
  Transform an index into an inverted index.

  ## Examples
  iex> ETL.transform(HashDict.new [{"a", ["ABILITY", "AARDVARK"]}, {"b", ["BALLAST", "BEAUTY"]}])
  HashDict.new [{"aardvark", "a"}, {"ability", "a"}, {"ballast", "b"}, {"beauty", "b"}]
  """
  @spec transform(Dict.t) :: HashDict.t
  def transform(input) do
    Enum.to_list(input) |> invert_index |> HashDict.new
  end

  defp invert_index(list) do
    lc { letter, words } inlist list, word inlist words do
      { String.downcase(word), letter }
    end
  end

end
