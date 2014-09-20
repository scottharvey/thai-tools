#= require_tree ./vendor
#= require namespaces
#= require alphabet
#= require keys
#= require numbers
#= require tool_navigation
#= require type_thai
#= require_tree ./tools
#= require_self

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

$ ->
  TT.keys = new TT.Keys()
  TT.alphabet = new TT.Alaphbet()
  TT.numbers = new TT.Numbers()
  new TT.ToolNavigation($('.tool-list'))
