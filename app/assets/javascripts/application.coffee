#= require jquery

#= require angular
#= require angular-ui-router
#= require angular-route
#= require angular-resource
#= require angular-rails-templates


#= require ui-bootstrap-0.13.0.min
#= require ui-bootstrap-tpls-0.9.0

#= require sugar.min

#= require modules

#= require_tree ./services
#= require_tree ./constants
#= require_tree ./controllers
#= require_tree ./templates
#= require_tree ./directives

config = ($httpProvider, $stateProvider, $urlRouterProvider) ->

  $httpProvider.defaults.headers.common["Accept"] = 'application/json'

  $urlRouterProvider.when('', '/index').when('/', '/index').otherwise('/index')

  $stateProvider
    .state 'main',
      abstract: true
      url: ''
      views:
        'navbar@':
          templateUrl: 'navbar.html'
          controller: 'NavbarCtl'

    .state 'main.index',
      url: '/index'
      views:
        'content@':
          templateUrl: 'index.html'
          controller: 'IndexCtl'
      onEnter: ($rootScope) ->
        $rootScope.title = 'Добро пожаловать!'

    .state 'main.meetings',
      abstract: true
      url: '/meetings'

    .state 'main.meetings.index',
      url: '/index'
      views:
        'content@':
          templateUrl: 'meetings/index.html'
          controller: 'MeetingsIndexCtl'
      onEnter: ($rootScope) ->
        $rootScope.title = 'Встречи'


angular.module('gaga_test').config(config)
