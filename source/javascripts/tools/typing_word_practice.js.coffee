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
          <li>Press command + enter to skip the word</li>
        </ul>
      </div>
    """

  constructor: (@$el) ->
    @$el.append @template()
    @$input = @$el.find('.tool-typing-word-practice-input')
    @$thai = @$el.find('.tool-typing-word-practice-thai')
    @$input.on 'focus', @showWord
    @fetchWords =>
      @showWord()
      @$input.focus()
    $(document).on 'keydown.thaiTypingWordPractice', @handleKeyPress

  close: =>
    $(document).off 'keydown.thaiTypingWordPractice'

  fetchWords: (callback) =>
    $.get @wordsURL(), (data) =>
      @words = data.split('\n')
      callback()

  showWord: =>
    word = @words[Math.floor(Math.random() * @words.length)]
    @$input.val('').removeClass('error')
    @$thai.html word

  checkAnswer: (event) =>
    event.preventDefault()
    answer = @$thai.html()
    guess = @$input.val()
    if $.trim(answer) == $.trim(guess)
      @showWord()
    else
      @$input.addClass('error')

  handleKeyPress: (event) =>
    key = event.which
    if (event.metaKey || event.ctrlKey) && key == 13
      @showWord()
    else if key == 13
      @checkAnswer(event)
