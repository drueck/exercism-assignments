module.exports = function words(source) {

  return lowercaseWords(source).reduce(function(counts, word) {
    counts[word] = counts.hasOwnProperty(word) ? counts[word] + 1 : 1;
    return counts;
  }, {});

};

function lowercaseWords(str) {
  return str.toLowerCase().match(/\w+/g);
}
