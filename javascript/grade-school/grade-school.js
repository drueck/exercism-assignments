module.exports = function School() {

  var db = {};

  function add(student, grade) {
    if (db.hasOwnProperty(grade)) {
      db[grade].push(student);
    } else {
      db[grade] = [student];
    }
  }

  function studentsInGrade(grade) {
    return db.hasOwnProperty(grade) ? clone(db[grade]).sort() : [];
  }

  function roster() {
    return sortedGrades(db).reduce(function(sortedRoster, grade) {
      sortedRoster[grade] = studentsInGrade(grade);
      return sortedRoster;
    }, {});
  }

  return {
    add: add,
    grade: studentsInGrade,
    roster: roster
  };

};

function sortedGrades(db) {
  return Object.keys(db).sort();
}

function clone(array) {
  return array.slice();
}
