do ($) ->
  # Fill the form with the JSON
  $.fn.fillJSON = (json) ->
    $el = $(this)
    for key, val of json
      return @ if key is "active" # Special case for post radios
      $el.find("[name='#{key}']").val(val)

Array::insertAt = (index, item) ->
  @splice(index, 0, item)
  @