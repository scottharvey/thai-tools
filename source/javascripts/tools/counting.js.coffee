class TT.Tools.Counting

  currentStep: null
  currentNumber: null

  template: ->
    """
      <h2>Counting</h2>
      <div class='tool-counting'>
        <div class='tool-counting-number'></div>
        <div class='tool-counting-answer'></div>
      </div>
      <div class='tool-hints'>
        <ul>
          <li>Hit enter to show the next number</li>
        </ul>
      </div>
    """

  constructor: (@$el) ->
    @$el.append @template()
    $(document).on 'keypress.Counting', @handleKeyPress
    @showQuestion()

  close: =>
    $(document).off 'keypress.Counting'

  showQuestion: =>
    @currentStep = 'question'
    @$el.find('.tool-counting-answer').html ''
    power = TT.random(TT.range(0, 6))
    min = Math.pow(10, power)
    max = Math.pow(10, power + 1)
    @currentNumber = Math.floor(Math.random() * (max-min + 1) + min)
    formatted = @currentNumber.toString().replace /(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,"
    @$el.find('.tool-counting-number').html formatted

  showAnswer: =>
    @currentStep = 'answer'
    @$el.find('.tool-counting-answer').html TT.numbers.translate(@currentNumber)

  handleKeyPress: (event) =>
    if @currentStep == 'question'
      @showAnswer()
    else
      @showQuestion()
