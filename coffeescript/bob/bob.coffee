class Bob

  hey: (msg) ->
    mood = new MessageMood(msg)
    if mood.isSilence()
      "Fine. Be that way!"
    else if mood.isShouting()
      "Woah, chill out!"
    else if mood.isAsking()
      "Sure."
    else
      "Whatever."

class MessageMood

  constructor: (@msg) ->

  isSilence: ->
    @msg.trim() == ""

  isShouting: ->
    @msg.toUpperCase() == @msg

  isAsking: ->
    @msg.slice(-1) == "?"

module.exports = Bob
