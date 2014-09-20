class TT.Tools.CharacterFlashcards

  currentStep: null
  currentWord: null

  template: ->
    """
      <h2>Character Flashcards</h2>
      <div class='tool-character-flashcards'>
        <div class='tool-character-flashcards-thai'></div>
        <div class='tool-character-flashcards-english'></div>
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
    $(document).on 'keypress.TimePractice', @handleKeyPress
    @showQuestion()

  close: =>

  showQuestion: =>
    @currentStep = 'question'
    @currentWord = TT.random TT.characters.characters
    @$thai.html @currentWord.character

  showAnswer: =>
    @currentStep = 'answer'

  handleKeyPress: =>
    if event.which == 13
      if @currentStep == 'question'
        @showAnswer()
      else
        @showQuestion()
