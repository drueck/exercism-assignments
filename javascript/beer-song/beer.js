module.exports = {
  verse: verse,
  sing: sing
};

function sing(fromBottles, toBottles) {
  toBottles = toBottles || 0;
  if(fromBottles === toBottles) {
    return verse(fromBottles);
  }
  return verse(fromBottles) + "\n" + sing(fromBottles - 1, toBottles);
}

function verse(bottles) {
  var remainingBottles = bottles - 1;
  if (remainingBottles === -1) { remainingBottles = 99; }

  return capitalized(soMany(bottles)) + " of beer on the wall, " +
    soMany(bottles) + " of beer.\n" +
    drinkOrBuyMore(bottles) + ", " +
    soMany(remainingBottles) + " of beer on the wall.\n";
}

function soMany(bottles) {
  if (bottles === 0) { return "no more bottles"; }
  if (bottles === 1) { return "1 bottle"; }
  return bottles + " bottles";
}

function drinkOrBuyMore(bottles) {
  if (bottles === 0) { return "Go to the store and buy some more"; }
  return take(bottles) + " down and pass it around";
}

function take(bottles) {
  if (bottles === 1) { return "Take it"; }
  return "Take one";
}

function capitalized(s) {
  return s[0].toUpperCase() + s.slice(1);
}
