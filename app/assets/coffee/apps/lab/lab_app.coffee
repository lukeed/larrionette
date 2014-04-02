@SampleApp.module "LabApp", (LabApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class LabApp.Router extends Marionette.AppRouter
    appRoutes:
      "lab"     : "list"
      "lab/:id" : "show"

  API =
    list: ->
      new LabApp.List.Controller
        region: App.mainRegion
    show: (id, lab) ->
      new LabApp.Show.Controller
        id: id
        lab: lab
        region: App.mainRegion

  # LabApp.on "start", ->
  #   API.show()

  App.vent.on "lab:list", ->
    App.navigate "lab"
    API.list()

  App.vent.on "lab:show", (id) ->
    App.navigate "lab/:id"
    API.edit id, lab
  
  App.addInitializer ->
    new LabApp.Router
      controller: API

