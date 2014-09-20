class TT.TypeThai

  constructor: (@$el) ->
    @$el.on 'keypress', @catchAndReplace
    window.keys = []

  catchAndReplace: (event) =>
    thaiChar = TT.characters.byKeyCode(event.charCode)
    if thaiChar?
      event.preventDefault()
      $target = $(event.target)
      $target.val $target.val() + thaiChar
