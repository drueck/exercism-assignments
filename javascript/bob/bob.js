function MessageMood(msg) {
  this.msg = msg;
}

MessageMood.prototype.isShouting = function() {
  return this.msg === this.msg.toUpperCase();
};

MessageMood.prototype.isAsking = function() {
  return this.msg.charAt(this.msg.length - 1) === "?";
};

MessageMood.prototype.isSilence = function() {
  return this.msg === "";
};


function Bob() {}

Bob.prototype.hey = function(msg) {

  var mood = new MessageMood(msg);
  var response;

  if(mood.isSilence()) {
    response = "Fine, be that way.";
  } else if(mood.isShouting()) {
    response = "Woah, chill out!";
  } else if (mood.isAsking()) {
    response = "Sure";
  } else {
    response = "Whatever";
  }

  return response;

};

global.Bob = Bob;

