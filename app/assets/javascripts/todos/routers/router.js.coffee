# The Router
# ----------

# Router that basically does nothing because this
# is a one-page, no-action app
class App.TodosRouter extends Backbone.Router
  
  # Initialize the router with a list of existing todo items
  initialize: (todos) ->
    @view = new App.TodosAppView(todos)
  
  # List the routes... all routes go to 'index'
  routes:
    '/index': 'index'
    '.*': 'index'
  
  # Do nothing... our view never changes
  index: ->