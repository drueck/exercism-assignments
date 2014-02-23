module.exports = function words(source) {
  return lowercaseWords(source).reduce(function(counts, word) {
    counts[word] = (counts[word] || 0) + 1;
    return counts;
  }, Object.create(null));
};

function lowercaseWords(str) {
  return str.toLowerCase().match(/\w+/g);
}
