@SampleApp.module "AboutApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->
      aboutView = @getAboutView()
      @show aboutView
    
    getAboutView: ->
      new List.About