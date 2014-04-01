@SampleApp.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  _remove = Marionette.View::remove

  _.extend Marionette.View::,

    setInstancePropertiesFor: (args...) ->
      return null if not @options
      for key, val of _.pick(@options, args...)
        @[key] = val

    remove: (args...) ->
      console.info "removing view", @ if App.environment is "local"
      _remove.apply @, args

#    if @model?.isDestroyed()
#      @$el.fadeOut 400, =>
#        _remove.apply @, args
#    else
#      _remove.apply @, arg

  # _.extend Marionette.View::,

  #   templateHelpers: ->
  #     currentUser:
  #       App.request("get:current:user").toJSON()
