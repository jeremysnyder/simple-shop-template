do (ng = angular) ->

  Database = ['$http', '$q', ($http, $q) ->
    load = (type) ->
      $http({method: 'GET', url: "assets/data/database.json"}).then (response) ->
        $q.when(response.data)

    {} =
      load: load
  ]

  ng.module 'simpleShopTemplate'
    .factory 'Database', Database
