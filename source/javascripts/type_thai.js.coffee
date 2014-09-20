class TT.TypeThai

  constructor: (@$el) ->
    @$el.on 'keypress', @catchAndReplace
    window.keys = []

  catchAndReplace: (event) =>
    thaiChar = TT.characters.byKeyCode(event.charCode)
    if thaiChar?
      event.preventDefault()
      target = event.target
      $target = $(target)

      if target.selectionStart? == '0'
        $target.val thaiChar + $target.val()
      else if target.selectionStart?
        start = target.selectionStart
        end = target.selectionEnd
        before = $target.val().substring(0, start)
        after = $target.val().substring(end, $target.val().length)
        $target.val before + thaiChar + after
        target.selectionStart = start + 1
        target.selectionEnd = start + 1
      else
        $target.val $target.val() + thaiChar
