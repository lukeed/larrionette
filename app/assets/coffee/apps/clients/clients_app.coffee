@SampleApp.module "ClientsApp", (ClientsApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class ClientsApp.Router extends Marionette.AppRouter
    appRoutes:
      "clients" : "list"

  API =
    list: ->
      new ClientsApp.List.Controller
        region: App.mainRegion

  # ClientsApp.on "start", ->
  #   API.list()

  App.vent.on "clients:list", ->
    App.navigate "clients"
    API.list()
  
  App.addInitializer ->
    new ClientsApp.Router
      controller: API

