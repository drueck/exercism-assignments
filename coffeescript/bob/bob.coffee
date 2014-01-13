class Bob

  hey: (msg) ->
    mood = new MessageMood(msg)
    switch
      when mood.isSilence() then "Fine. Be that way!"
      when mood.isShouting() then "Woah, chill out!"
      when mood.isAsking() then "Sure."
      else "Whatever."


class MessageMood

  constructor: (@msg) ->

  isSilence: -> @msg.trim() == ""
  isShouting: -> !this.isSilence() && @msg.toUpperCase() == @msg
  isAsking: -> @msg.slice(-1) == "?"


module.exports = Bob
