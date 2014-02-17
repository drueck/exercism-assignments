function Year(year) {

  this.isLeapYear = multipleOf(4) &&
    (!multipleOf(100) || multipleOf(400));

  function multipleOf(interval) {
    return year % interval === 0;
  }

}

module.exports = function isLeapYear(year) {
  return new Year(year).isLeapYear;
};
