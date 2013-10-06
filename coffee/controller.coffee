class IndexController extends Chaplin.Controller

  beforeAction: ->
    @compose 'structure', ->
      params = collection: mediator.todos
      @header = new HeaderView params
      @footer = new FooterView params

  list: (params) ->
    filterer = params.filterer?.trim() ? 'all'
    @publishEvent 'todos:filter', filterer
    @view = new TodosView collection: mediator.todos, filterer: (model) ->
      switch filterer
        when 'completed' then model.get 'completed'
        when 'active' then not model.get 'completed'
        else true

