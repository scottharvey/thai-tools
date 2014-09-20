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
    @$thai.html ''

  showAnswer: =>
    @currentStep = 'answer'
    thaiHour = TT.numbers.inThai @currentTime.hour
    thaiMinute = TT.numbers.inThai @currentTime.minute
    minutes = "นาที"
    if @currentTime.ampm == 'am'
      if @currentTime.hour == 12
        answer = "เที่ยงคืน#{thaiMinute}#{minutes}"
      else if @currentTime.hour < 6
        answer = "ตี#{thaiHour}#{thaiMinute}#{minutes}"
      else if @currentTime.hour == 6
        answer = "หกโมงเช้า#{thaiMinute}#{minutes}"
      else if @currentTime.hour > 6 && @currentTime.hour < 12
        answer = "#{thaiHour}โม#{thaiMinute}#{minutes}"
    else
      if @currentTime.hour == 12
        answer = "เที่ยง#{thaiMinute}#{minutes}"
      else if @currentTime.hour < 6
        answer = "บ่าย#{thaiHour}โมง#{thaiMinute}#{minutes}"
      else if @currentTime.hour == 6
        answer = "หกโมงเย็น#{thaiMinute}#{minutes}"
      else if @currentTime.hour > 6 && @currentTime.hour < 12
        thaiHour = TT.numbers.inThai(@currentTime.hour - 6)
        answer = "#{thaiHour}ทุ่ม#{thaiMinute}#{minutes}"
    @$thai.html answer

  close: =>
    $(document).off 'keypress.TimePractice', @handleKeyPress

  handleKeyPress: =>
    if event.which == 13
      if @currentStep == 'question'
        @showAnswer()
      else
        @showQuestion()
