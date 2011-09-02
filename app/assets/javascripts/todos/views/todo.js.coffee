# The View
# --------

# View for a single Todo item
class App.TodoView extends Backbone.View
  
  # Enclose the contents of render() in a <li> tag
  tagName: 'li'
  
  # The template for rendering the todo item
  template: Brace('todos/templates/todo')
  
  # Bind the jQuery events
  events:
    'click .delete-todo': 'destroy'
    'click input:checkbox': 'toggle'
  
  # Create a new view, and bind data changes from the model to
  # our rendering functions.
  initialize: ->
    @model.bind 'change', @render, this
    @model.bind 'destroy', @remove, this
  
  # Render the todo item in its template
  render: ->
    $(@el).html @template(@model)
    this
  
  # Remove the todo item view from the list
  remove: ->
    $(@el).remove()
  
  # Delete the model
  destroy: ->
    @model.destroy()
    
  # Toggle the done state of the model
  toggle: ->
    @model.save done: !@model.get('done')

