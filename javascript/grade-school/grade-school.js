module.exports = function School(name) {

  var db = {};

  function add(student, grade) {
    if(db[grade]) {
      db[grade].push(student);
    } else {
      db[grade] = [student];
    }
  }

  function grade(level) {
    return db[level] || [];
  }

  function grades() {
    return Object.keys(db).sort();
  }

  function sort() {
    var sortedDb = {};
    grades().forEach(function(grade) {
      sortedDb[grade] = db[grade].sort();
    });
    return sortedDb;
  }

  return {
    db: db,
    add: add,
    grade: grade,
    sort: sort
  };

};
