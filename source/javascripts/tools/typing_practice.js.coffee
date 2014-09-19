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
      <div class='tool-typing-practice-options options'>
        <label class="radio">
          <input type="radio" name="word-or-character" value='word' checked=checked>
          <span>Words</span>
        </label>
        <label class="radio">
          <input type="radio" name="word-or-character" value='character'>
          <span>Characters</span>
        </label>
        <div class='tool-typing-practice-character-options'>
          <div class='row'>
            <div class='half'></div>
            <div class='fourth'>Without shift</div>
            <div class='fourth'>With Shift</div>
          </div>
          <div class='row'>
            <div class='half'>Numbers row</div>
            <div class='fourth with-checkbox'>
              <label class="checkbox"><input type="checkbox"><span></span></label>
            </div>
            <div class='fourth with-checkbox'>
              <label class="checkbox"><input type="checkbox"><span></span></label>
            </div>
          </div>
          <div class='row'>
            <div class='half'>Top row</div>
            <div class='fourth with-checkbox'>
              <label class="checkbox"><input type="checkbox"><span></span></label>
            </div>
            <div class='fourth with-checkbox'>
              <label class="checkbox"><input type="checkbox"><span></span></label>
            </div>
          </div>
          <div class='row'>
            <div class='half'>Middle row</div>
            <div class='fourth with-checkbox'>
              <label class="checkbox"><input type="checkbox"><span></span></label>
            </div>
            <div class='fourth with-checkbox'>
              <label class="checkbox"><input type="checkbox"><span></span></label>
            </div>
          </div>
          <div class='row'>
            <div class='half'>Bottom row</div>
            <div class='fourth with-checkbox'>
              <label class="checkbox"><input type="checkbox"><span></span></label>
            </div>
            <div class='fourth with-checkbox'>
              <label class="checkbox"><input type="checkbox"><span></span></label>
            </div>
          </div>
        </div>
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
    window.keys = []
    @$input.on 'keyup', @log

  log: (e) ->
    keys.push @value[@value.length - 1]
    console.log  keys.length


    # @$thai = @$el.find('.tool-typing-practice-thai')
    # @$input.on 'focus', @showWord
    # @fetchWords @showWord
    # $(document).on 'keydown.thaiTypingPractice', @handleKeyPress
    # @$el.find('input[name="word-or-character"]').change @wordOrCharacter

  close: =>
    $(document).off 'keydown.thaiTypingPractice'

  fetchWords: (callback) =>
    $.get @wordsURL(), (data) =>
      @words = data.split('\n')
      callback()

  showWord: =>
    word = @words[Math.floor(Math.random() * @words.length)]
    @$input.val('').removeClass('error')
    @$thai.html word
    @$input.focus().val ''

  checkAnswer: (event) =>
    event.preventDefault()
    # answer = @$thai.html()
    # guess = @$input.val()
    # if $.trim(answer) == $.trim(guess)
      # @showWord()
    # else
      # @$input.addClass('error')

  wordOrCharacter: =>
    checked = @$el.find('input[name="word-or-character"]:checked')
    characterOptions = @$el.find('.tool-typing-practice-character-options')
    if checked.val() == 'word'
      characterOptions.hide()
    else
      characterOptions.show()

  handleKeyPress: (event) =>
    key = event.which
    if (event.metaKey || event.ctrlKey) && key == 13
      @showWord()
    else if key == 13
      @checkAnswer(event)
