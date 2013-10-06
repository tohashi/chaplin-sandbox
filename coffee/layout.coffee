define ['view'], (View) ->

  class Header extends View.Base
    autoRender: true

    el: '#header'

    events:
      'keypress #new-todo': 'createOnEnter'

    template: template

    createOnEnter: (event) =>
      ENTER_KEY = 13
      title = $(event.currentTarget).val().trim()
      return if event.keyCode isnt ENTER_KEY or not title
      @collection.create {title}
      @$('#new-todo').val ''

  class Footer extends View
    autoRender: true

    el: '#footer'

    events:
      'click #clear-completed': 'clearCompleted'

    listen:
      'todos:filter mediator': 'updateFilterer'
      'all collection': 'renderCounter'

    render: ->
      super
      @renderCounter()

    updateFilterer: (filterer) ->
      filterer = '' if filterer is 'all'
      @$('#filters a')
        .remoeClass('selected')
        .filter("[href='#/#{filterer}']")
        .addClass('selected')

    renderCounter: ->
      total = @collection.length
      active = @collection.getActive().length
      completed = @collection

      @$('#todo-count > strong').html active
      countDescription = if active is 1 then 'item' else 'items'
      @$('.todo-count-title').text countDescription

      @$('#completed-count').html "(#{completed})"
      @$('#clear-completed').toggle (completed > 0)
      @$el.toggle(total > 0)

    clearCompleted: ->
      @publishEvent 'todos:clear'

  {Header, Footer}
