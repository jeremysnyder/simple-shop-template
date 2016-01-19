@sstApp.run ($log, $rootScope, Database) ->
    'ngInject'
    Database.load().then (data) ->
      $rootScope.title = data.companyName || 'Set a Title'
