class DNA

  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(other_sequence)
    pairs_with_mutations(other_sequence).length
  end

  private

  attr_reader :sequence

  def pairs_with_mutations(other_sequence)
    nucleotide_pairs(other_sequence).select do |n1, n2|
      mutation?(n1, n2)
    end
  end

  def nucleotide_pairs(other_sequence)
    max_common_length = [sequence.length, other_sequence.length].min
    sequence.chars.zip(other_sequence.chars).take(max_common_length)
  end

  def mutation?(n1, n2)
    n1 != n2
  end

end
