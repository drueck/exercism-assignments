module.exports = (text) ->

  words = -> text.toLowerCase().match(/\w+/g)

  count = words().reduce (counts, word) ->
    counts[word] = (counts[word] || 0) + 1
    counts
  , {}

  count: count
