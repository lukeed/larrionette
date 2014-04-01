do (Backbone, Marionette) ->

  class Marionette.Region.Dialog extends Marionette.Region

    constructor: ->
      _.extend @, Backbone.Events

    onShow: (view) ->
      @setupBindings view
      # The options are set as a dialog object in the view
      options = @getDefaultOptions _.result(view, "dialog")

      # Listen for the close callback.
      @$el.on "hidden", =>
        @closeDialog()
      @$el.on "shown", =>
        Snappy.execute "dialog:shown", view

      @$el.modal options

    getDefaultOptions: (options = {}) ->
      _.defaults options,
        backdrop: true
        keyboard: true
        show: true
        remote: false
        shown: null
        modalOverflow: true
        consumeTab: true

    setupBindings: (view) ->
      @listenTo view, "dialog:close", @closeDialog

    closeDialog: ->
      @stopListening()
      @close()
      @$el.modal("hide")
