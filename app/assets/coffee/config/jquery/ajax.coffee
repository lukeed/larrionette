$.ajaxPrefilter (options, originalOptions, jqXHR) ->
  hasCSRF = false
  if options.headers?
    _.each _.keys(options.headers), (item) ->
      hasCSRF = true if item is "X-CSRF-Token"

  if hasCSRF is false
    jqXHR.setRequestHeader "X-CSRF-Token", Snappy.csrfToken
