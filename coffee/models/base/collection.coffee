define [
  'chaplin'
  'models/base/model'
], (Chaplin, Model) ->

  class Collection extends Chaplin.Collection
    model: Model
