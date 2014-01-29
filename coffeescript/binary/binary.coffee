module.exports = (binary) ->

  toDecimal: ->
    digits = binary.split("").reverse()
    digits.reduce (decimal, digit, place) ->
      if digit == "1"
        return decimal + Math.pow(2, place)
      decimal
    , 0
