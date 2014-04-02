@SampleApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.HeaderModel extends App.Entities.Model
    defaults:
      name: ''
      url: ''
      trigger: ''

  class Entities.HeaderCollection extends App.Entities.Collection
    model: Entities.HeaderModel