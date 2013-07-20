function Words(source) {

  function splitIntoWords(str) {
    // get rid of non-word characters at the beginning or end
    // of the string before splitting to avoid empty string word
    return str.replace(/^\W+|\W+$/g, '').split(/\W+/);
  }

  var words = splitIntoWords(source.toLowerCase());
  var counts = {};

  words.forEach(function(word) {
    if(counts[word] === undefined) {
      counts[word] = 0;
    }
    counts[word] = counts[word] + 1;
  });

  return { count: counts };

}

global.Words = Words;
