class TT.ToolNavigation

  constructor: (@$el) ->
    @$el.find('a[data-tool-name]').each (index, element) =>
      $element = $(element)
      $element.on 'click', (event) =>
        event.preventDefault()
        @showTool $element.attr('data-tool-name')

  showTool: (name) =>
    $container = $('.container')
    $container.append("<div class='tool sheet'><div class='sheet-close'>X</div></div>")
    $container.find('.sheet-close').on 'click', @closeTool
    new TT.Tools[name]($container.find('.sheet'))

  closeTool: (event) ->
    $('.tool').remove()
