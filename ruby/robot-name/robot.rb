class Robot

  def name
    @name ||= generate_name
  end

  def reset
    @name = nil
  end

  private

  def generate_name
    "#{alpha_portion}#{numeric_portion}"
  end

  ALPHA_LENGTH = 2
  NUMERIC_LENGTH = 3

  def alpha_portion
    (1..ALPHA_LENGTH).each_with_object("") do |_, alpha|
      alpha << capital_letters.sample
    end
  end

  def numeric_portion
    "%0#{NUMERIC_LENGTH}d" % rand(10 ** NUMERIC_LENGTH - 1)
  end

  def capital_letters
    ('A'..'Z').to_a
  end

end
