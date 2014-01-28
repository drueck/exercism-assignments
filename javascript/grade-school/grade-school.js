function School(name) {
  this.db = {};
}

School.prototype.add = function(student, grade) {
  if(this.db[grade]) {
    this.db[grade].push(student);
  } else {
    this.db[grade] = [student];
  }
};

School.prototype.grade = function(level) {
  return this.db[level] || [];
};

School.prototype.sort = function() {
  var self = this;
  return sortedGrades(self.db).reduce(function(sorted, grade) {
    sorted[grade] = clone(self.db[grade]).sort();
    return sorted;
  }, {});
};

module.exports = School;

function sortedGrades(db) {
  return Object.keys(db).sort();
}

function clone(array) {
  return array.slice();
}
