class TT.Tools.TimePractice

  currentStep: null
  currentTime:
    hour: null
    minute: null
    ampm: null

  template: ->
    """
      <h2>Telling The Time Practice</h2>
      <div class='tool-time-practice'>
        <div class='tool-time-practice-clock'>
        </div>
        <div class='tool-time-practice-thai'>
        </div>
      </div>
      <div class='tool-hints'>
        <ul>
          <li>Hit enter to continue</li>
        </ul>
      </div>
    """

  constructor: (@$el) ->
    @$el.append @template()
    @$clock = @$el.find('.tool-time-practice-clock')
    @$thai = @$el.find('.tool-time-practice-thai')
    $(document).on 'keypress.TimePractice', @handleKeyPress
    @showQuestion()

  showQuestion: =>
    @currentStep = 'question'
    @currentTime.hour = TT.random TT.range(1, 12)
    @currentTime.minute = TT.random TT.range(0, 59)
    @currentTime.minute = "0#{@currentTime.minute}" if @currentTime.minute < 10
    @currentTime.ampm = TT.random ['am', 'pm']
    @$clock.html "#{@currentTime.hour}:#{@currentTime.minute}#{@currentTime.ampm}"

  showAnswer: =>
    @currentStep = 'answer'
    console.log @currentTime
    thaiHour = @thaiWord @currentTime.hour
    thaiMinute = @thaiWord @currentTime.minute
    # if @currentTime.hour < 6 && @currentTime.ampm == 'am'
    answer = "ตี#{thaiHour}#{thaiMinute}นาที"
    @$thai.html answer

  close: =>
    $(document).off 'keypress.TimePractice', @handleKeyPress

  handleKeyPress: =>
    if event.which == 13
      if @currentStep == 'question'
        @showAnswer()
      else
        @showQuestion()
