module.exports = function transform(lettersByScore) {
  scoresByLetter = {};
  scores(lettersByScore).forEach(function(score) {
    lettersByScore[score].forEach(function(letter) {
      scoresByLetter[letter.toLowerCase()] = parseInt(score, 10);
    });
  });
  return scoresByLetter;
};

function scores(lettersByScore) {
  return Object.keys(lettersByScore);
}
