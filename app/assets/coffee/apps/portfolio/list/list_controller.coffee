@SampleApp.module "PortfolioApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->
      console.log "HERE AT PORTFOLIO LIST CONTROLLER"