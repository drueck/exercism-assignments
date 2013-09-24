module.exports = function DNA(strand) {

  var URACIL = "U";
  var THYMIDINE = "T";
  var ALL_THYMIDINES = new RegExp(THYMIDINE, "g");

  return {
    toRNA: function toRNA() {
      return strand.replace(ALL_THYMIDINES, URACIL);
    }
  };

};
