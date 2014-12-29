class TT.Alphabet

  alphabet: []
  alphabetURL: -> '/alphabet.json'
  allCharacters: []

  constructor: ->
    $.get @alphabetURL(), (data) =>
      # @alphabet = JSON.parse(data)
      @alphabet = data
      $.each @alphabet, (index, attrs) =>
        @allCharacters.push attrs['character']

  randomLetter: -> TT.random(@alphabet)
