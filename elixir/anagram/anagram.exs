defmodule Anagram do

  def match(word, candidates) do
    Enum.filter(candidates, anagrams?(&1, word))
  end

  defp anagrams?(word1, word2) do
    word1 != word2 && sort_letters(word1) == sort_letters(word2)
  end

  defp sort_letters(word) do
    String.downcase(word) |> String.codepoints |> Enum.sort
  end

end
