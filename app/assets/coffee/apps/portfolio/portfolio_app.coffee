@SampleApp.module "PortfolioApp", (PortfolioApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class PortfolioApp.Router extends Marionette.AppRouter
    appRoutes:
      "portfolio" : "list"
      "portfolio/:id" : "show"

  API =
    list: ->
      new PortfolioApp.List.Controller
        region: App.mainRegion
        
    show: (id, port) ->
      new PortfolioApp.Show.Controller
        id: id
        port: port
        region: App.mainRegion

  App.vent.on "portfolio:list", ->
    App.navigate "portfolio"
    API.list()
  App.vent.on "portfolio:show", (id) ->
    console.log id
    App.navigate "portfolio/:id"
    API.show() 
  
  App.addInitializer ->
    new PortfolioApp.Router
      controller: API

