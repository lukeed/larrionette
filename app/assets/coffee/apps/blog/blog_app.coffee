@SampleApp.module "BlogApp", (BlogApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class BlogApp.Router extends Marionette.AppRouter
    appRoutes:
      "blog"      : "list"
      "blog/:id"  : "show"

  API =
    list: ->
      new BlogApp.List.Controller
        region: App.mainRegion
    show: (id) ->
      new BlogApp.Show.Controller
        id: id
        region: App.mainRegion

  # BlogApp.on "start", ->
  #   API.show()

  App.vent.on "blog:list", ->
    App.navigate "blog"
    API.list()
  App.vent.on "blog:show", (id) ->
    App.navigate "blog/:id"
    API.show id
  
  App.addInitializer ->
    new BlogApp.Router
      controller: API

