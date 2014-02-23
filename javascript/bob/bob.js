function Bob() {}

Bob.prototype.hey = function(msg) {

  var mood = new MessageMood(msg);
  var response;

  if(mood.isSilence()) {
    response = "Fine. Be that way!";
  } else if(mood.isShouting()) {
    response = "Woah, chill out!";
  } else if (mood.isAsking()) {
    response = "Sure.";
  } else {
    response = "Whatever.";
  }

  return response;

};

module.exports = Bob;


function MessageMood(msg) {
  this.msg = msg;
}

MessageMood.prototype.isShouting = function() {
  return this.msg === this.msg.toUpperCase() &&
    this.msg !== this.msg.toLowerCase();
};

MessageMood.prototype.isAsking = function() {
  return this.msg.slice(-1) === "?";
};

MessageMood.prototype.isSilence = function() {
  return this.msg.trim() === "";
};
