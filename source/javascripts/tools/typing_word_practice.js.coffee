class TT.Tools.TypingWordPractice

  words: []

  wordsURL: -> '/words.txt'

  template: ->
    """
      <h2>Typing Practice</h2>
      <div class='tool-typing-word-practice'>
        <div class='tool-typing-word-practice-thai'>
        </div>
        <input type='text' class='tool-typing-word-practice-input' />
      </div>
      <div class='tool-hints'>
        <ul>
          <li>Hit enter once you have typed in the word</li>
          <li>Press command+enter to skip the word</li>
        </ul>
      </div>
    """

  constructor: (@$el) ->
    @$el.append @template()
    @$input = @$el.find('.tool-typing-word-practice-input')
    @$thai = @$el.find('.tool-typing-word-practice-thai')
    new TT.TypeThai(@$input)
    @$input.on 'focus', @showNewWord
    @fetchWords =>
      @showNewWord()
      @$input.focus()
    $(document).on 'keydown.TypingWordPractice', @handleKeyPress

  close: =>
    $(document).off 'keydown.TypingWordPractice'

  fetchWords: (callback) =>
    $.get @wordsURL(), (data) =>
      @words = data.split('\n')
      callback()

  showNewWord: =>
    @$input.val('').removeClass('error')
    @$thai.html TT.characters.random(@words)

  checkAnswer: (event) =>
    question = @$thai.html()
    answer = @$input.val()
    if $.trim(question) == $.trim(answer)
      @showNewWord()
    else
      @$input.addClass('error')

  handleKeyPress: (event) =>
    key = event.which
    if (event.metaKey || event.ctrlKey) && key == 13
      @showNewWord()
    else if key == 13
      @checkAnswer(event)
