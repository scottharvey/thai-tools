class TT.Tools.TypingPractice

  words: []

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

  wordsURL: -> '/words.txt'

  constructor: (@$el) ->
    @$el.append @template()
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
    @$el.find('.tool-typing-practice-input').removeClass('error')
    @$el.find('.tool-typing-practice-thai').html word
    @$el.find('.tool-typing-practice-input').focus().val ''

  checkAnswer: (event) =>
    event.preventDefault()
    answer = @$el.find('.tool-typing-practice-thai').html()
    guess = @$el.find('.tool-typing-practice-input').val()
    if $.trim(answer) == $.trim(guess)
      @showWord()
    else
      @$el.find('.tool-typing-practice-input').addClass('error')

  handleKeyPress: (event) =>
    key = event.which
    if (event.metaKey || event.ctrlKey) && key == 13
      @showWord()
    else if key == 13
      @checkAnswer(event)
