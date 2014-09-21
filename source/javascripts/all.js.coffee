#= require_tree ./vendor
#= require namespaces
#= require alphabet
#= require keys
#= require numbers
#= require options
#= require tool_navigation
#= require type_thai
#= require_tree ./tools
#= require_self

TT.notice = (text) ->
  $('body').prepend "<div class='notice'>Options saved</div>"
  setTimeout =>
    $('body').find('.notice').remove()
  , 2000

TT.random = (array) -> array[Math.floor(Math.random() * array.length)]

TT.range = (start, stop) ->
  length = stop - start
  range = Array(length)
  index = 0
  while index <= length
    range[index] = start
    start = start + 1
    index = index + 1
  range

TT.options = (name) ->
  options = localStorage.getItem 'options'
  JSON.parse(options)[name] if options?

TT.sayWord = (text) ->
  url = TT.options('text_to_speech_url')
  new Audio("#{url}#{text}").play() if url.length > 0

$ ->
  TT.keys = new TT.Keys()
  TT.alphabet = new TT.Alaphbet()
  TT.numbers = new TT.Numbers()
  new TT.ToolNavigation $('.tool-list')
  new TT.Options $('#options')
