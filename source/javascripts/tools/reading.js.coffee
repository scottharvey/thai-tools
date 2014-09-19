class TT.Tools.Reading

  words: []

  template: ->
    """
      <h2>Reading</h2>
      <div class='tool-reading'>
        <div class='tool-reading-thai'>
        </div>
      </div>
    """

  wordsURL: -> '/words.txt'

  constructor: (@$el) ->
    @$el.append @template()
    @fetchWords @showWord
    $(document).on 'keypress', @handleKeyPress

  fetchWords: (callback) =>
    $.get @wordsURL(), (data) =>
      @words = data.split('\n')
      callback()

  showWord: =>
    word = @words[Math.floor(Math.random() * @words.length)]
    @$el.find('.tool-reading-thai').html word

  handleKeyPress: (event) =>
    key = event.which
    if key == 13
      @showWord()
