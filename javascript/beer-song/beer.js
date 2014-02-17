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
  return capitalized(soMany(bottles)) + " of beer on the wall, " +
    soMany(bottles) + " of beer.\n" +
    drinkOrBuyMore(bottles) + ", " +
    soMany(remaining(bottles)) + " of beer on the wall.\n";
}

function soMany(bottles) {
  if (bottles === 0) { return "no more bottles"; }
  if (bottles === 1) { return "1 bottle"; }
  return bottles + " bottles";
}

function remaining(bottles) {
  var remainingBottles = bottles - 1;
  return remainingBottles < 0 ? 99 : remainingBottles;
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
