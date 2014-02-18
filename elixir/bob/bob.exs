defmodule Teenager do

  def hey(msg) do
    cond do
      silent?(msg) -> "Fine. Be that way!"
      shouting?(msg) -> "Woah, chill out!"
      asking?(msg) -> "Sure."
      true -> "Whatever."
    end
  end

  defp silent?(msg) do
    String.strip(msg) == ""
  end

  defp shouting?(msg) do
    msg == String.upcase(msg) && msg != String.downcase(msg)
  end

  defp asking?(msg) do
    String.ends_with?(msg, "?")
  end

end
