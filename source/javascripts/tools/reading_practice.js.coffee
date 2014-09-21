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
          <li>Hit space to listen to the word</li>
        </ul>
      </div>
    """

  constructor: (@$el) ->
    @$el.append @template()
    @fetchWords @showNewWord
    @$thai = @$el.find('.tool-reading-practice-thai')
    $(document).on 'keypress.ReadingPractice', @handleKeyPress

  close: =>
    $(document).off 'keypress.ReadingPractice'

  fetchWords: (callback) =>
    $.get @wordsURL(), (data) =>
      @words = data.split('\n')
      callback()

  showNewWord: =>
    @$thai.html TT.random(@words)

  sayWord: =>
    TT.sayWord @$thai.text()

  handleKeyPress: (event) =>
    @showNewWord() if event.which == 13
    @sayWord() if event.which == 32
