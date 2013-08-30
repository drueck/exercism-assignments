module.exports = {

  verse: verse,

  sing: function sing(from_bottles, to_bottles) {

    to_bottles = to_bottles || 0;

    if(from_bottles === to_bottles) {
      return verse(from_bottles);
    }

    return verse(from_bottles) + "\n" + sing(from_bottles - 1, to_bottles);

  }

};

function verse(bottles) {

  if(bottles === 0) {
    return "No more bottles of beer on the wall, no more bottles of beer.\n" +
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n";
  }

  if(bottles === 1) {
    return "1 bottle of beer on the wall, 1 bottle of beer.\n" +
      "Take it down and pass it around, no more bottles of beer on the wall.\n";
  }

  var bottles_remaining = bottles - 1;

  return bottles + " bottles of beer on the wall, " + bottles + " bottles of beer.\n" +
    "Take one down and pass it around, " +
    bottles_remaining + " " + pluralize_bottles(bottles_remaining) + " of beer on the wall.\n";

}

function pluralize_bottles(bottles) {
  return bottles === 1 ? "bottle" : "bottles";
}

