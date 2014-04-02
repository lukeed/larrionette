@SampleApp.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Header extends App.Views.ItemView
    template: 'header/list/item'
    tagName: 'li'

    events:
      "click a": "navigate"

    navigate: (e) ->
      e.preventDefault()
      @trigger "header:item:clicked", @model

  class List.Headers extends App.Views.CompositeView
    template: 'header/list/list'
    tagName: 'nav'
    className: 'navbar navbar-default navbar-fixed-top'
    attributes: ->
      'role':'navigation'
    itemView: List.Header
    itemViewContainer: 'ul'

  

