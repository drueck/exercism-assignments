module.exports = function Phone(formattedNumber) {

  var digits = expectedDigits(withoutFormatting(formattedNumber));

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

var US_PHONE_NUMBER_LENGTH = 10;
var US_COUNTRY_CODE = "1";
var INVALID_NUMBER = "0000000000";

function withoutFormatting(formattedNumber) {
  return formattedNumber.replace(/\D/g, '');
}

function expectedDigits(allDigits) {
  var countryCodeLength = US_COUNTRY_CODE.length;
  if(allDigits.length === US_PHONE_NUMBER_LENGTH) {
    return allDigits;
  }
  if(allDigits.length === US_PHONE_NUMBER_LENGTH + countryCodeLength &&
    allDigits.slice(0, countryCodeLength) === US_COUNTRY_CODE) {
    return allDigits.slice(countryCodeLength);
  }
  return INVALID_NUMBER;
}
