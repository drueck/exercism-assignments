(function() {

  var MIN_LETTER_CODE = "A".charCodeAt(0);
  var MAX_LETTER_CODE = "Z".charCodeAt(0);
  var MIN_NUMBER = 0;
  var MAX_NUMBER = 999;

  var firstLetterCode = MIN_LETTER_CODE;
  var secondLetterCode = MIN_LETTER_CODE;
  var number = 0;

  module.exports = function Robot() {
    this.name = nextName();
    this.reset = function() {
      this.name = nextName();
    };
  };

  function nextName() {
    var name = alphaPortion() + numericPortion();
    incrementNameComponents();
    return name;
  }

  function alphaPortion() {
    return String.fromCharCode(firstLetterCode, secondLetterCode);
  }

  function numericPortion() {
    return threeDigitString(number);
  }

  function threeDigitString(number) {
    var s = "000" + number;
    return s.substr(s.length - 3);
  }

  function incrementNameComponents() {
    if(number === MAX_NUMBER) {
      incrementLetters();
    }
    incrementNumber();
  }

  function incrementLetters() {
    if(secondLetterCode < MAX_LETTER_CODE) {
      secondLetterCode++;
    } else {
      incrementFirstLetter();
      secondLetterCode = MIN_LETTER_CODE;
    }
  }

  function incrementFirstLetter() {
    if(firstLetterCode < MAX_LETTER_CODE) {
      firstLetterCode++;
    } else {
      firstLetterCode = MIN_LETTER_CODE;
    }
  }

  function incrementNumber() {
    number = number < MAX_NUMBER ? number + 1 : MIN_NUMBER;
  }

})();
