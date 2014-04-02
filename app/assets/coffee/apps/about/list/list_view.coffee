@SampleApp.module "AboutApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  class List.About extends App.Views.ItemView
    template: 'about/list/static'
    # template: 'header/list/list'
    # tagName: 'li'

    # events:
      # "click a": "navigate"

    # navigate: (e) ->
      # e.preventDefault()
      # @trigger "header:item:clicked", @model