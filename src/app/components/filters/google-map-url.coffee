do (app = @sstApp) ->
  googleMapUrl = ($window) ->
    (address) ->
      "https://maps.google.com/maps?f=q&q=#{$window.encodeURIComponent(address)}&z=14&output=embed"

  app.filter 'googleMapUrl', ['$window', googleMapUrl]
