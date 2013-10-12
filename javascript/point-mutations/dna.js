module.exports = function DNA(strand) {

  return {

    hammingDistance: function(otherStrand) {
      var mutations = 0;
      var comparableLength = Math.min(strand.length, otherStrand.length);
      for (i = 0; i < comparableLength; i++) {
        if (strand[i] !== otherStrand[i]) {
          mutations++;
        }
      }
      return mutations;
    }

  };

};
