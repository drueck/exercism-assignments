defmodule Words do

  def count(phrase) do
    words = split_into_words(phrase)
    HashDict.new words, fn (word) -> { word, occurrences(words, word) } end
  end

  defp split_into_words(phrase) do
    String.downcase(phrase) |> String.split(%r/\W+/) |> Enum.reject(&(&1 == ""))
  end

  defp occurrences(words, word) do
    Enum.count(words, &(&1 == word))
  end

end
