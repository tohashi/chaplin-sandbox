define ['chaplin', 'model', 'backbone.localStorage'], (Chaplin, Model) ->

  class Todos extends Chaplin.Collection

    model: Model.Todo

    localStorage: new Backbone.LocalStorage 'todos'

    allAreCompleted: ->
      @getCompleted().length is @length

    getCompleted: ->
      @where completed: yes

    getActive: ->
      @where completed: no

    comparator: (todo) ->
      todo.get 'created'

  {Todos}
