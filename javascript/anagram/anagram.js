function letters(word) {
  return word.split("").sort().join("");
}

function Anagram(word) {
  this.letters = letters(word);
}

Anagram.prototype.match = function(words) {
  return words.filter(function(word) {
    return letters(word) === this.letters;
  }, this);
}

module.exports = Anagram;
