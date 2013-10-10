define [
  'chaplin'
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class HelloWorld extends Model
    defaults:
      message: 'Hello World!'
