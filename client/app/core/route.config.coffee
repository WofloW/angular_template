RouteConfiguration = ($locationProvider, $stateProvider, $urlRouterProvider) ->
  $locationProvider.html5Mode true
  $stateProvider.state 'home',
    url: '/'
    template: require '../home/home.jade'
    controller: 'HomeController'
    controllerAs: 'vm'
  $urlRouterProvider.otherwise '/'

RouteConfiguration.$inject = [
  '$locationProvider'
  '$stateProvider'
  '$urlRouterProvider'
]
module.exports = RouteConfiguration