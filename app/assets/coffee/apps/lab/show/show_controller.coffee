@SampleApp.module "LabApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: ->
      console.log "HERE AT Lab CONTROLLER"