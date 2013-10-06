define ['chaplin'], (Chaplin) ->

  class Todo extends Chaplin.Model
    defaults:
      title: ''
      completed: no

    initialize: ->
      super
      @set completed: not @get 'completed'

    isVisible: ->
      isCompleted = @get 'completed'

  {Todo}
