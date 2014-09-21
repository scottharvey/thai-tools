class TT.Options

  constructor: (@$form) ->
    @$form.on 'submit', @save
    @updateOptions()

  updateOptions: =>
    options = localStorage.getItem 'options'
    if options?
      options = JSON.parse(options)
      @$form.find('#text-to-speech-url').val options.text_to_speech_url
      if options.auto_switch_to_thai
        @$form.find('#auto-switch-to-thai').click()

  save: (event) =>
    event.preventDefault()
    localStorage.setItem 'options', JSON.stringify({
      text_to_speech_url: @$form.find('#text-to-speech-url').val()
      auto_switch_to_thai: @$form.find('#auto-switch-to-thai').is(':checked')
    })
    TT.notice 'Options saved'
