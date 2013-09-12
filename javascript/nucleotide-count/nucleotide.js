function DNA(sequence) {

  var ALL_NUCLEOTIDES = [ "A", "T", "C", "G", "U" ];

  return {
    count: count,
    nucleotideCounts: {
      A: count("A"),
      T: count("T"),
      C: count("C"),
      G: count("G")
    },
  };

  function count(nucleotide) {
    validateNucleotide(nucleotide);
    return nucleotides().filter(function(n) {
      return n === nucleotide;
    }).length;
  }

  function validateNucleotide(letter) {
    if(!isValidNucleotide(letter)) {
      throw new Error("Invalid Nucleotide");
    }
  }

  function isValidNucleotide(letter) {
    return ALL_NUCLEOTIDES.some(function(n) {
      return n === letter;
    });
  }

  function nucleotides() {
    return sequence.split("");
  }

}

module.exports = DNA;
