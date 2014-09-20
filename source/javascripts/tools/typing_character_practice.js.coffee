class TT.Tools.TypingCharacterPractice

  template: ->
    """
      <h2>Typing Character Practice</h2>
      <div class='tool-typing-character-practice'>
        <div class='tool-typing-character-practice-thai'>
        </div>
        <input type='text' class='tool-typing-character-practice-input' />
      </div>
      <div class='tool-typing-character-practice-options options'>
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
      <div class='tool-hints'>
        <ul>
        </ul>
      </div>
    """

  constructor: (@$el) ->
    @$el.append @template()
    @$input = @$el.find('.tool-typing-character-practice-input')
    @$thai = @$el.find('.tool-typing-character-practice-thai')
    @$input.on 'focus', @showCharacter
    @$input.focus()
    $(document).on 'keyup.thaiTypingCharacterPractice', @checkAnswer

  close: =>
    $(document).off 'keyup.thaiTypingCharacterPractice'

  showCharacter: =>
    @$input.val('').removeClass('error')
    @$thai.html TT.characters.randomCharacter()

  checkAnswer: (event) =>
    answer = @$thai.html()
    guess = @$input.val()
    if answer.slice(-1) == guess.slice(-1)
      @showCharacter()
    else
      @$input.addClass('error')
