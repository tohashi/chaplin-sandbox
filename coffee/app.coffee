requirejs.config
  baseUrl: './js/'
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

require ['chaplin'], (Chaplin) ->
  class Application extends Chaplin.Application
    title: 'chaplin-sandbox'

  new Application
    routes: (match) ->
      match '', 'hello#show'
    controllerSuffix: '-controller'
