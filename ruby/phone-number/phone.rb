class Phone

  # super ugly version, first to pass tests, not ready to submit
  # just getting it up on github so I can keep working on it

  def initialize(number)
    @unsanitized = number
  end

  def number
    sanitized = strip_formatting(unsanitized)
    trimmed = trim_leading_one(sanitized)
    validated = validate(trimmed)
    validated
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{prefix}-#{line_number}"
  end

  private

  attr_reader :unsanitized

  def prefix
    number[3..5]
  end

  def line_number
    number[6..10]
  end

  def strip_formatting(unsanitized_number)
    unsanitized_number.gsub(/\D/,"")
  end

  def trim_leading_one(sanitized_number)
    if sanitized_number.start_with?("1") && sanitized_number.length == 11
      sanitized_number.slice(1,10)
    else
      sanitized_number
    end
  end

  def validate(trimmed)
    trimmed.length == 10 ? trimmed : "0000000000"
  end

end
