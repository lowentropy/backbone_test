# The Model
# ---------

# Model for a single todo item.
class App.Todo extends Backbone.Model
  
  # Provide defaults for new models
  defaults: ->
    text: ''
    position: @default_position()
  
  # The default collection is the one on the global router
  default_collection: ->
    @collection ? window?.router?.view?.todos
  
  # The default position is one past the position of the last
  # item in the collection. If there are none, it defaults to 1.
  default_position: ->
    (@default_collection()?.last()?.get('position') ? 0) + 1