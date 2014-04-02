@SampleApp.module "BlogApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: ->
      console.log "HERE AT BLOG SHOW CONTROLLER"