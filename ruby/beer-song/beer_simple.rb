class Beer

  def verse(verse_number)
    case verse_number
    when 0 then zeroth_verse
    when 1 then first_verse
    when 2 then second_verse
    when 3..99 then standard_verse(verse_number)
    end
  end

  # Which do you all think is more readable, this version or the recursive
  # version below? Suggestions on improving either one?
  def sing_loop(starting_verse, ending_verse=0)
    starting_verse.downto(ending_verse).inject("") do |song, verse_number|
      song << verse(verse_number) + "\n"
    end
  end

  def sing(starting_verse, ending_verse=0)
    if starting_verse == ending_verse
      verse(ending_verse) + "\n"
    else
      verse(starting_verse) + "\n" + sing(starting_verse-1, ending_verse)
    end
  end

  def zeroth_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def first_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def second_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def standard_verse(n)
    "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
    "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
  end

end
