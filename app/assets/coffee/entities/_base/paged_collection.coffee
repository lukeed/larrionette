@SampleApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.PagedCollection extends Backbone.Collection
    constructor: (options) ->
      @init_pagination options
      super

    url: ->
      @baseUrl + '?' + $.param
        page: @page
        per_page: @perPage
        q: @query

    init_pagination: (options = {}) ->
      _.defaults options,
        query: null
        page: 1
        perPage: 20
        totalRecords: 0

      @query = options.query
      @page = options.page
      @perPage = options.perPage
      @totalRecords = options.totalRecords

    info: ->
      info =
        totalRecords: @totalRecords
        page: @page
        perPage: @perPage
        totalItems: @length
        totalPages: Math.ceil(@totalRecords / @perPage)
        prev: false
        next: false

      max = Math.min(@totalRecords, @page * @perPage)
      max = @totalRecords if @totalRecords is @totalPages * @perPage

      info.range = [(@page - 1) * @perPage + 1, max]
      info.prev = @page - 1 if @page > 1
      info.next = @page + 1 if @page < info.totalPages
      info

    getNextPage: ->
      return false if not @info().next
      @page = @page + 1
      @fetch
        update: true
        remove: false

    parse: (resp) ->
      @totalRecords = resp.meta.total
      resp.data
