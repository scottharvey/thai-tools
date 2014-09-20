class TT.Alaphbet

  alphabet: []
  alphabetURL: -> '/alphabet.json'
  allCharacters: []

  constructor: ->
    $.get @alphabetURL(), (data) =>
      @alphabet = data
      $.each @alphabet, (index, attrs) =>
        @allCharacters.push attrs['character']

  randomLetter: -> TT.random(@alphabet)
