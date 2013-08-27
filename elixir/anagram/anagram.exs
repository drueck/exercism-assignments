defmodule Anagram do

  def match(word, candidates) do
    Enum.filter(candidates, fn(candidate) -> anagrams?(word, candidate) end)
  end

  defp anagrams?(word1, word2) do
    word1 != word2 && sort_letters(word1) == sort_letters(word2)
  end

  defp sort_letters(word) do
    String.downcase(word) |> String.codepoints |> Enum.sort |> Enum.join
  end

end
