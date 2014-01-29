module.exports = (binary) ->

  toDecimal: ->
    digits = binary.split("").reverse()
    digits.reduce (decimal, digit, place) ->
      return decimal unless digit == "1"
      decimal + Math.pow(2, place)
    , 0
