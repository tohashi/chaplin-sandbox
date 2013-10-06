define ['chaplin'], (Chaplin) ->

  class Base extends Chaplin.View
    getTemplateFunction: -> @template

  class BaseCollection extends Chaplin.CollectionView
    getTemplateFunction: View::getTemplateFunction
    useCssAnimation: true

  class Todo extends Base
    events:
      'click .toggle': 'toggle'
      'dblclick label': 'edit'
      'keypress .edit': 'save'
      'blur .edit': 'save'
      'click .destroy': 'destroy'

    listen:
      'change model': 'render'

    template: template

    tagName: 'li'

    destroy: =>
      @model.destroy()

    toggle: =>
      @model.toggle().save()

    edit: =>
      @$el.addClass 'editing'
      @$('.edit').focus()

    save: (event) =>
      ENTER_KEY = 13
      title = $(event.currentTarget).val().trim()
      return @model.destroy() unless title
      return if event.type is 'keypress' and event.keyCode isnt ENTER_KEY
      @model.save {title}
      @$el.removeClass 'editing'

  class Todos extends BaseCollection
    container: '#main'

    events:
      'click #toggle-all': 'toggleCompleted'

    itemView: TodoView

    listSelector: '#todo-list'

    listen:
      'all collection': 'renderCheckbox'
      'todos:clear mediator': 'clear'

    template: template

    render: =>
      super
      @renderCheckBox()

    renderCheckBox: =>
      @$('#toggle-all').prop 'checked', @collection.allAreCompleted()
      @$el.toggle @collection.length isnt 0

    toggleCompleted: (event) =>
      isChecked = event.currentTarget.checked
      @collection.each (todo) -> todo.save completed: isChecked

    clear: ->
      @collection.getCompleted().forEach (model) ->
        model.destroy()

  {Base, BaseCollection, Todo, Todos}
