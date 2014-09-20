class TT.Tools.ReadingPractice

  words: []

  wordsURL: -> '/words.txt'

  template: ->
    """
      <h2>Reading</h2>
      <div class='tool-reading-practice'>
        <div class='tool-reading-practice-thai'>
        </div>
      </div>
      <div class='tool-hints'>
        <ul>
          <li>Hit enter to show the next word</li>
        </ul>
      </div>
    """

  constructor: (@$el) ->
    @$el.append @template()
    @fetchWords @showWord
    $(document).on 'keypress.ReadingPractice', @handleKeyPress

  close: =>
    $(document).off 'keypress.ReadingPractice'

  fetchWords: (callback) =>
    $.get @wordsURL(), (data) =>
      @words = data.split('\n')
      callback()

  showWord: =>
    @$el.find('.tool-reading-practice-thai').html TT.characters.random(@words)

  handleKeyPress: (event) =>
    @showWord() if event.which == 13
