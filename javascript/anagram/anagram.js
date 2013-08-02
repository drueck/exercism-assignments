function Anagram(word) {
  this.letters = this.sortLetters(word);
}

Anagram.prototype.match = function(words) {
  return words.filter(this.isAnagram, this);
};

Anagram.prototype.sortLetters = function(word) {
  return word.split("").sort().join("");
};

Anagram.prototype.isAnagram = function(word) {
  return this.sortLetters(word) === this.letters;
};

module.exports = Anagram;
