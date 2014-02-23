module.exports = function Anagram(word) {

  var sortedWord = sorted(word.toLowerCase());

  function match(words) {
    return words.filter(isAnagram);
  }

  function isAnagram(otherWord) {
    otherWord = otherWord.toLowerCase();
    return word !== otherWord && sortedWord == sorted(otherWord);
  }

  function sorted(word) {
    return word.split("").sort().join("");
  }

  return {
    match: match
  };

};
