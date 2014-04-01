@SampleApp = do (Backbone, Marionette) ->

  App = new Backbone.Marionette.Application()

  App.on "initialize:before", (options) ->
    App.environment = $('meta[name=env]').attr("content")
    App.csrfToken = $("meta[name='token']").attr('content')

  App.addRegions
    headerRegion: "header"
    mainRegion: "#main-content"
    footerRegion: "footer"
    dialogRegion: Marionette.Region.Dialog.extend(el: "#dialog")

  App.addInitializer ->
    App.module("HeaderApp").start()

  App.reqres.setHandler "default:region", ->
    App.mainRegion

  App.commands.setHandler "register:instance", (instance, id) ->
    App.register instance, id if App.environment is "local"

  App.commands.setHandler "unregister:instance", (instance, id) ->
    App.unregister instance, id if App.environment is "local"

  App.on "initialize:after", ->
    @startHistory()

  App