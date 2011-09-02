$ ->
  # The main application view
  class App.TodosAppView extends Backbone.View
  
    # Instead of generating an element, use the given existing one
    el: $ '#todos'
  
    # Grab the template for rendering stats
    stats_template: JST["todos/templates/stats"]
  
    # Wire up some events
    events:
      'keypress #new-todo': 'create'
      'click #todo-stats .clear_tasks': 'clear_done'
    
    # Initialize with a list of existing items
    initialize: (todos) ->
      @todos = new App.TodosCollection
      @input = @$ '#new-todo'
      @stats = @$ '#todo-stats'
      @list = @$ '#todo-list'
      @todos.bind 'add', @add_one, this
      @todos.bind 'reset', @add_all, this
      @todos.bind 'all', @render, this
      @todos.reset todos
  
    # The todo items render themselves, so all we have to render
    # is the stats.
    render: ->
      @stats.html @stats_template(
        total: @todos.length
        done: @todos.done().length
        remaining: @todos.remaining().length
      )
  
    # Add a single todo item
    add_one: (todo) ->
      view = new App.TodoView(model: todo)
      @list.append view.render().el
  
    # Add each item from the collection
    add_all: ->
      @todos.each (todo) => @add_one todo
  
    # Create a new todo item when 'enter' is presesd
    create: (e) ->
      text = @input.val()
      return unless text && e.keyCode == 13
      @todos.create text: text
      @input.val ''

    # Remove completed tasks
    clear_done: ->
      _.each @todos.done(), (todo) -> todo.destroy()
      false