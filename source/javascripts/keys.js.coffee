class TT.Keys

  keys: []
  keysURL: -> '/keys.json'
  allCharacters: []
  allCharactersByKeyCode: {}

  constructor: ->
    $.get @keysURL(), (data) =>
      # @keys = JSON.parse(data)
      @keys = data
      $.each @keys, (index, attrs) =>
        @allCharacters.push attrs['character']
        @allCharactersByKeyCode[attrs['keyCode']] = attrs['character']

  forRow: (row, shift) ->
    @byRow ||= {}
    @byRow["#{row}-#{shift}"] ||= @keysForRow(row, shift)

  keysForRow: (row, shift) ->
    result = []
    for attrs in @keys
      if attrs['row'] == row && attrs['shift'] == shift
        result.push attrs['character']
    result

  byKeyCode: (keyCode) -> @allCharactersByKeyCode[keyCode]

  randomKey: -> TT.random(@allkeys)
