# Collection of todo items, sorted by their position
class App.TodosCollection extends Backbone.Collection
  model: App.Todo
  url: '/todos'
  
  comparator: (todo) -> todo.get('position')
  
  done: ->
    @filter (todo) -> todo.get('done')
  
  remaining: ->
    @without.apply this, @done()
  