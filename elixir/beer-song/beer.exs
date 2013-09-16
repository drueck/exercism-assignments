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
    "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" <>
    "Take one down and pass it around, " <>
    "#{bottles-1} #{pluralize_bottle(bottles-1)} of beer on the wall.\n"
  end

  defp pluralize_bottle(1), do: "bottle"
  defp pluralize_bottle(_), do: "bottles"

  def sing(from, to // 0) when from >= 0 when to >= 0 do
    Enum.map_join(from..to, "\n", verse(&1)) <> "\n"
  end

end
