(function() {

  function splitIntoWords(str) {
    return str.match(/\w+/g);
  }

  function Words(source) {

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

})();

