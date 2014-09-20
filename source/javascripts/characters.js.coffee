class TT.Characters

  characters: []
  charactersURL: -> '/characters.json'
  allCharacters: []
  allCharactersByKeyCode: {}

  constructor: ->
    $.get @charactersURL(), (data) =>
      @characters = data
      $.each @characters, (index, attrs) =>
        @allCharacters.push attrs["character"]
        @allCharactersByKeyCode[attrs["keyCode"]] = attrs["character"]

  forRow: (row, shift) ->
    @byRow ||= {}
    @byRow["#{row}-#{shift}"] ||= @charactersForRow(row, shift)

  charactersForRow: (row, shift) ->
    result = []
    for attrs in @characters
      if attrs["row"] == row && attrs["shift"] == shift
        result.push attrs["character"]
    result

  byKeyCode: (keyCode) -> @allCharactersByKeyCode[keyCode]

  randomCharacter: -> @random(@allCharacters)

  random: (array) -> array[Math.floor(Math.random() * array.length)]
