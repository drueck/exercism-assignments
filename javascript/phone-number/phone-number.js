module.exports = function Phone(formattedNumber) {

  var EXPECTED_LENGTH = 10;
  var INVALID_NUMBER = "0000000000";

  function withoutFormatting(formattedNumber) {
    return formattedNumber.replace(/\D/g, '');
  }

  function tenDigits(allDigits) {
    if(allDigits.length === EXPECTED_LENGTH) {
      return allDigits;
    }
    if(allDigits.length === EXPECTED_LENGTH + 1 && allDigits[0] === '1') {
      return allDigits.substr(1);
    }
    return INVALID_NUMBER;
  }

  var digits = tenDigits(withoutFormatting(formattedNumber));

  return {

    number: function number() {
      return digits;
    },

    areaCode: function areaCode() {
      return digits.substr(0, 3);
    },

    prefix: function prefix() {
      return digits.substr(3, 3);
    },

    lineNumber: function lineNumber() {
      return digits.substr(6, 4);
    },

    toString: function toString() {
      return '(' + this.areaCode() + ') ' + this.prefix() + '-' + this.lineNumber();
    }

  };

};
