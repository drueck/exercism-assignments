module.exports = function Phone(formattedNumber) {

  function stripFormatting(formattedNumber) {
    return formattedNumber.replace(/\D/g, '');
  }

  function validate(cleanNumber) {
    if(cleanNumber.length === 10) {
      return cleanNumber;
    }
    if(cleanNumber.length === 11 && cleanNumber.charAt(0) === '1') {
      return cleanNumber.substr(1);
    }
    return "0000000000";
  }

  var validatedNumber = validate(stripFormatting(formattedNumber));

  return {

    number: function number() {
      return validatedNumber;
    },

    areaCode: function areaCode() {
      return validatedNumber.substr(0, 3);
    },

    prefix: function prefix() {
      return validatedNumber.substr(3, 3);
    },

    lineNumber: function lineNumber() {
      return validatedNumber.substr(6, 4);
    },

    toString: function toString() {
      return '(' + this.areaCode() + ') ' + this.prefix() + '-' + this.lineNumber();
    }

  };

};
