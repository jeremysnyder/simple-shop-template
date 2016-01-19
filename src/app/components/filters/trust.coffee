do (app = @sstApp) ->
  trust = ($sce) -> $sce.trustAsResourceUrl

  app.filter 'trust', ['$sce', trust]
