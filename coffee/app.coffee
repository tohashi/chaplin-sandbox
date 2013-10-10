requirejs.config
  baseUrl: './js/'
  paths:
    jquery: '../bower_components/jquery/jquery'
    underscore: '../bower_components/lodash/dist/lodash'
    backbone: '../bower_components/backbone/backbone'
    handlebars: '../bower_components/handlebars/handlebars',
    text: '../bower_components/requirejs-text/text',
    chaplin: '../bower_components/chaplin/chaplin'
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'

require ['chaplin'], (Chaplin) ->
  class Application extends Chaplin.Application
    title: 'chaplin-sandbox'

  new Application
    routes: (match) ->
      match '', 'hello#show'
    controllerSuffix: '-controller'
