defmodule Words do

  # Not a solution!
  # Just getting it up on github so I can continue at home
  def count(source) do
    words = String.split(source, %r/\W+/)
    HashDict.new words, { &1, 1 }
  end

end
