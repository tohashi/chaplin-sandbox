define [
  'views/base/view'
  'text!templates/hello-world.hbs'
], (View, template) ->
  'use strict'

  class HelloWorldView extends View
    autoRender: true
    className: 'hello-world'

    template: template
    template = null
