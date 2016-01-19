@sstApp.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'vm'

    $urlRouterProvider.otherwise '/'
  ]
