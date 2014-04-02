@SampleApp.module "PortfolioApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (opts) ->
      { port, id } = opts
      # port or= App.request "crew:entity", id
      console.log "HERE AT PORTFOLIO CONTROLLER"
      console.log id
      console.log port
      console.log opts