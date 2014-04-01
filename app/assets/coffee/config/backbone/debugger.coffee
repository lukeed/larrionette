# Backbone events debugger
#
# example setup
# var model = new Backbone.Model()
# model.debugEvents()
# model.trigger('change', 'foo', 'bar')

Backbone.Collection::debugEvents =
Backbone.Model::debugEvents =
Backbone.View::debugEvents =
Backbone.Router::debugEvents = ->
   @on "all", (eventName) ->
     console.log "[debug event] --> ", eventName, Array::slice.call(arguments, 1)
