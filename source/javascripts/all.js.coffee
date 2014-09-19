#= require_tree ./vendor
#= require namespaces
#= require tool_navigation
#= require_tree ./tools
#= require_self

$ ->
  new TT.ToolNavigation($('.tool-list'))
