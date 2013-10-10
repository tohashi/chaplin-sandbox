define [
  'handlebars'
  'chaplin'
  'lib/utils'
], (Handlebars, Chaplin, utils) ->
  'use strict'

  Handlebars.registerHelper 'url', (routeName, params..., options) ->
    Chaplin.helpers.reverse routeName, params

  null
