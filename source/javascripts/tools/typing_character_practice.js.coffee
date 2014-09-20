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
            <label class="checkbox"><input checked="checked" type="checkbox" value="number" /><span></span></label>
          </div>
          <div class='fourth with-checkbox'>
            <label class="checkbox"><input checked="checked" type="checkbox" value="number-shift" /><span></span></label>
          </div>
        </div>
        <div class='row'>
          <div class='half'>Top row</div>
          <div class='fourth with-checkbox'>
            <label class="checkbox"><input checked="checked" type="checkbox" value="top" /><span></span></label>
          </div>
          <div class='fourth with-checkbox'>
            <label class="checkbox"><input checked="checked" type="checkbox" value="top-shift" /><span></span></label>
          </div>
        </div>
        <div class='row'>
          <div class='half'>Middle row</div>
          <div class='fourth with-checkbox'>
            <label class="checkbox"><input checked="checked" type="checkbox" value="middle" /><span></span></label>
          </div>
          <div class='fourth with-checkbox'>
            <label class="checkbox"><input checked="checked" type="checkbox" value="middle-shift" /><span></span></label>
          </div>
        </div>
        <div class='row'>
          <div class='half'>Bottom row</div>
          <div class='fourth with-checkbox'>
            <label class="checkbox"><input checked="checked" type="checkbox" value="bottom" /><span></span></label>
          </div>
          <div class='fourth with-checkbox'>
            <label class="checkbox"><input checked="checked" type="checkbox" value="bottom-shift" /><span></span></label>
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
    @$input.on 'focus', @showNewCharacter
    @$input.focus()
    $(document).on 'keyup.TypingCharacterPractice', @checkAnswer

  close: =>
    $(document).off 'keyup.TypingCharacterPractice'

  showNewCharacter: =>
    @$input.val('').removeClass('error')
    values = []
    @$el.find("input[type='checkbox']:checked").each (index, element) =>
      values.push $(element).val()

    characters = []
    for value in values
      shift = value.match(/shift/)?
      row = value.replace("-shift", "")
      characters.push(character) for character in TT.characters.forRow(row, shift)

    @$thai.html TT.characters.random(characters)

  checkAnswer: (event) =>
    question = @$thai.html()
    answer = @$input.val()
    if question.slice(-1) == answer.slice(-1)
      @showNewCharacter()
    else
      @$input.addClass('error')
