class TT.Tools.ReadingPractice

  words: []

  template: ->
    """
      <h2>Reading</h2>
      <div class='tool-reading-practice'>
        <div class='tool-reading-practice-thai'>
        </div>
      </div>
    """

  wordsURL: -> '/words.txt'

  constructor: (@$el) ->
    @$el.append @template()
    @fetchWords @showWord
    $(document).on 'keypress.thaiReading', @handleKeyPress

  close: =>
    $(document).off 'keypress.thaiReading'

  fetchWords: (callback) =>
    $.get @wordsURL(), (data) =>
      @words = data.split('\n')
      callback()

  showWord: =>
    word = @words[Math.floor(Math.random() * @words.length)]
    @$el.find('.tool-reading-practice-thai').html word

  handleKeyPress: (event) =>
    key = event.which
    if key == 13
      @showWord()
