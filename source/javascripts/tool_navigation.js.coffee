class TT.ToolNavigation

  currentTool: null

  constructor: (@$el) ->
    @$el.find('a[data-tool-name]').each (index, element) =>
      $element = $(element)
      $element.on 'click', (event) =>
        event.preventDefault()
        @showTool $element.attr('data-tool-name')
    $(document).on 'keyup.thaiNavigation', @handleKeyPress

  showTool: (name) =>
    @closeTool() if @currentTool
    $container = $('.container')
    $container.append("<div class='overlay'></div>")
    $container.append("<div class='tool sheet'><div class='sheet-close'>X</div></div>")
    $container.find('.sheet-close').on 'click', @closeTool
    @currentTool = new TT.Tools[name]($container.find('.sheet'))

  closeTool: (event) =>
    @currentTool.close()
    $('.tool, .overlay').remove()

  handleKeyPress: (event) =>
    key = event.which
    if key == 27 && @currentTool?
      @closeTool()
