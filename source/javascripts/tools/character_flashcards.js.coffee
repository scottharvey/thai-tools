class TT.Tools.CharacterFlashcards

  currentStep: null
  currentLetter: null

  template: ->
    """
      <h2>Character Flashcards</h2>
      <div class='tool-character-flashcards'>
        <div class='tool-character-flashcards-character'></div>
        <div class='tool-character-flashcards-character-romanisation'>pronounced<span></span></div>
        <div class='tool-character-flashcards-word'>word<span></span></div>
        <div class='tool-character-flashcards-word-romanisation'>word pronounced<span></span></div>
        <div class='tool-character-flashcards-word-translation'>translation<span></span></div>
        <div class='tool-character-flashcards-class'>class<span></span></div>
      </div>
      <div class='tool-hints'>
        <ul>
          <li>Hit enter to continue</li>
        </ul>
      </div>
    """

  constructor: (@$el) ->
    @$el.append @template()
    @$thai = @$el.find('.tool-character-flashcards-thai')
    @$english = @$el.find('.tool-character-flashcards-english')
    @$wrapper = @$el.find('.tool-character-flashcards')
    $(document).on 'keypress.TimePractice', @handleKeyPress
    @showQuestion()

  close: =>

  showQuestion: =>
    @currentStep = 'question'
    @currentLetter = TT.alphabet.randomLetter()
    @$wrapper.addClass 'question'
    @$wrapper.removeClass 'answer'
    @$wrapper.toggleClass 'vowel', @currentLetter.type == 'vowel'
    @$el.find('.tool-character-flashcards-character').html @currentLetter.character
    @$el.find('.tool-character-flashcards-word span').html @currentLetter.word
    @$el.find('.tool-character-flashcards-character-romanisation span').html @currentLetter.character_romanisation
    @$el.find('.tool-character-flashcards-word-romanisation span').html @currentLetter.word_romanisation
    @$el.find('.tool-character-flashcards-word-translation span').html @currentLetter.word_translation
    @$el.find('.tool-character-flashcards-class span').html @currentLetter.character_class

  showAnswer: =>
    @currentStep = 'answer'
    @$wrapper.removeClass 'question'
    @$wrapper.addClass 'answer'

  handleKeyPress: =>
    if event.which == 13
      if @currentStep == 'question'
        @showAnswer()
      else
        @showQuestion()
