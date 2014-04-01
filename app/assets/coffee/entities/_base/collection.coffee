@SampleApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Collection extends Backbone.Collection
    initialize: (attributes, options) ->
      options or (options = {})
      @bind "error", @defaultErrorHandler
      @init and @init(attributes, options)

    # If an error happens check the status and then show the proper message.
    defaultErrorHandler: (model, error) ->
      alert(error.status)

    sync: (method, model, options) ->
      options.headers = _.extend(
        "X-CSRF-Token": App.csrfToken
      , options.headers)
      Backbone.sync method, model, options
