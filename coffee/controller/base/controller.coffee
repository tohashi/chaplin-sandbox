define ['chaplin', 'views/site-view'], (Chaplin, SiteView) ->
  'use strict'

  class Controller extends Chaplin.Controller
    beforeAction: ->
      @compose 'site', SiteView
