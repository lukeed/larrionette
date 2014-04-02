@SampleApp.module "BlogApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->
      # console.log "HERE AT BLOG List CONTROLLER"
      listView = @getListView()
      @show listView
    
    getListView: ->
      new List.Blog