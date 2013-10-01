class Application extends Chaplin.Application
  title: 'Todos'

  initMediator: ->
    mediator = Chaplin.mediator
    mediator.user = null
    mediator.todos = new Todos()
    mediator.todos.fetch()
    super


$ ->
  new Application
    controllerSuffix: '-controller'
    pushState: false
    routes: (match) ->
      match ':filterer', 'index#list'
      match '', 'index#list'
