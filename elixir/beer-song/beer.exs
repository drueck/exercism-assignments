defmodule Beer do

  def verse(0) do
    "No more bottles of beer on the wall, no more bottles of beer.\n" <>
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def verse(1) do
    "1 bottle of beer on the wall, 1 bottle of beer.\n" <>
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def verse(bottles) do
    remaining_bottles = bottles - 1
    "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" <>
    "Take one down and pass it around, " <>
    "#{remaining_bottles} #{pluralize_bottle(remaining_bottles)} of beer on the wall.\n"
  end

  defp pluralize_bottle(1), do: "bottle"
  defp pluralize_bottle(_), do: "bottles"

  def sing(from, from), do: verse(from) <> "\n"
  def sing(from, to // 0), do: verse(from) <> "\n" <> sing(from - 1, to)

end
