@SampleApp.module "AboutApp", (AboutApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class AboutApp.Router extends Marionette.AppRouter
    appRoutes:
      "about" : "list"

  API =
    list: ->
      new AboutApp.List.Controller

  App.vent.on "about:list", ->
    App.navigate "about"
    API.list()
  
  App.addInitializer ->
    new AboutApp.Router
      controller: API

