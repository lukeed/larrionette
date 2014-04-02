@SampleApp.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    
    links = new Backbone.Collection([
      {name: 'About',     url: 'about',     trigger: 'about:list'}
      {name: 'Blog',      url: 'blog',      trigger: 'blog:list'}
      {name: 'Clients',   url: 'clients',   trigger: 'clients:list'}
      {name: 'Lab',       url: 'lab',       trigger: 'lab:list'}
      {name: 'Portfolio', url: 'portfolio', trigger: 'portfolio:list'}
      {name: 'Themes',    url: 'themes',    trigger: 'themes:list'}
    ])

    initialize: ->
      listView = @getLayoutView links

      @listenTo listView, "childview:header:item:clicked", (child, model) ->
        console.log model.get('name') + " was clicked"
        # Broadcast the page change request
        trigger = model.get('trigger')
        App.vent.trigger trigger

        # strip to just what i need to send
        # App.vent.trigger "header:item:clicked", item.model.attributes 
        # @setActiveLink args.model

      @show listView

    getLayoutView: (collection) ->
      new List.Headers
        collection: collection

    setActiveLink: (model) ->
      window.links = links
      window.model = model
      