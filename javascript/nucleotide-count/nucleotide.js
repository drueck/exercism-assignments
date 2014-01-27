var DNA_NUCLEOTIDES = "ATCG";
var ALL_NUCLEOTIDES = DNA_NUCLEOTIDES + "U";
var reduce = Array.prototype.reduce;


function DNA(sequence) {
  this.nucleotideCounts = nucleotideCounts(sequence);
}

DNA.prototype.count = function(nucleotide) {
  validateNucleotide(nucleotide);
  return this.nucleotideCounts[nucleotide] || 0;
};

module.exports = DNA;


function nucleotideCounts(sequence) {
  return reduce.call(sequence, function(counts, nucleotide) {
    if(counts[nucleotide] >= 0) {
      counts[nucleotide]++;
    }
    return counts;
  }, initialCounts());
}

function initialCounts() {
  return reduce.call(DNA_NUCLEOTIDES, function(counts, nucleotide) {
    counts[nucleotide] = 0;
    return counts;
  }, {});
}

function validateNucleotide(letter) {
  if(!isValidNucleotide(letter)) {
    throw new Error("Invalid Nucleotide");
  }
}

function isValidNucleotide(letter) {
  return ALL_NUCLEOTIDES.indexOf(letter) != -1;
}
