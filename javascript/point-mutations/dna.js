module.exports = function DNA(strand) {

  function comparableLength(strand, otherStrand) {
    if (strand.length < otherStrand.length) {
      return strand.length;
    } else {
      return otherStrand.length;
    }
  }

  return {

    hammingDistance: function(otherStrand) {
      var mutations = 0;
      var commonLength = comparableLength(strand, otherStrand);
      for (i=0; i < commonLength; i++) {
        if (strand[i] !== otherStrand[i]) {
          mutations++;
        }
      }
      return mutations;
    }

  };

};
