#= require_tree ./vendor
#= require namespaces
#= require characters
#= require tool_navigation
#= require_tree ./tools
#= require_self

$ ->
  TT.characters = new TT.Characters()
  new TT.ToolNavigation($('.tool-list'))
