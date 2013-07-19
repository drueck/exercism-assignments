defmodule Teenager do

  def hey(msg) do
    cond do
      silent?(msg) -> "Fine. Be that way."
      shouting?(msg) -> "Woah, chill out!"
      asking?(msg) -> "Sure."
      true -> "Whatever."
    end
  end

  defp silent?(msg) do
    msg == ""
  end

  defp shouting?(msg) do
    msg == String.upcase(msg)
  end

  defp asking?(msg) do
    String.ends_with?(msg, "?")
  end

end
