requirejs.config
  baseUrl: 'js/'
  paths:
    'jquery': '../bower_components/jquery/jquery'
    'underscore': '../bower_components/lodash/dist/lodash'
    'backbone': '../bower_components/backbone/backbone'
    'backbone.localStorage': '../bower_components/backbone.localStorage/backbone.localStorage'
    'chaplin': '../bower_components/chaplin/chaplin'
  shim:
    'underscore':
      exports: '_'
    'backbone':
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    'backbone.localStorage':
      deps: ['backbone']
      exports: 'Backbone.LocalStorage'

require ['chaplin', 'collection'], (Chaplin, Collection) ->
  class Application extends Chaplin.Application
    title: 'Todos'

    initMediator: ->
      mediator = Chaplin.mediator
      mediator.user = null
      mediator.todos = new Collection.Todos()
      mediator.todos.fetch()
      super

  $ ->
    new Application
      controllerSuffix: '-controller'
      pushState: false
      routes: (match) ->
        match ':filterer', 'index#list'
        match '', 'index#list'
