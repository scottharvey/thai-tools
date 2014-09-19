class TT.Tools.TypingPractice

  words: []

  wordsURL: -> '/words.txt'

  template: ->
    """
      <h2>Typing Practice</h2>
      <div class='tool-typing-practice'>
        <div class='tool-typing-practice-thai'>
        </div>
        <input type='text' class='tool-typing-practice-input' />
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
    @$input = @$el.find('.tool-typing-practice-input')
    @$thai = @$el.find('.tool-typing-practice-thai')
    @fetchWords @showWord
    $(document).on 'keydown.thaiTypingPractice', @handleKeyPress

  close: =>
    $(document).off 'keydown.thaiTypingPractice'

  fetchWords: (callback) =>
    $.get @wordsURL(), (data) =>
      @words = data.split('\n')
      callback()

  showWord: =>
    word = @words[Math.floor(Math.random() * @words.length)]
    @$input.removeClass('error')
    @$thai.html word
    @$input.focus().val ''

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
