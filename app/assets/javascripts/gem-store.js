//=require_self
//=require_tree ./store_app
  var app = angular.module('gemStore', ['ngRoute', 'ngCookies']);
  app.config(['$httpProvider', function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]')
    .attr('content');
    $httpProvider.defaults.headers.common.Accept = 'application/json';
  }]);

  app.config(['$routeProvider', function($routeProvider) {
    $routeProvider
      .when('/products', {
        controller: 'StoreController',
        templateUrl: '/apiv1/products'
      })
      .when('/users', {
        controller: 'UsersCtrl',
        templateUrl: 'users_view.html'
      })
      .otherwise({
        redirectTo: '/users'
      });
  }])

  app.run([ '$rootScope', '$cookies', function($rootScope, $cookies) {

    $rootScope.currentUser = function() {
      return $cookies.current_user;
    };

    $rootScope.isLoggedIn = function() {
      var currentUser = $rootScope.currentUser();
      return (typeof(currentUser) !== 'undefined' && currentUser !== '');
    };

    $rootScope.logOut = function() {
      $http({
        method: 'DELETE',
        url: '/users/sign_out'
      })
      .success(function() {
        $cookies.current_user = '';
      })
      .error(function() {
        console.log('could not log out');
      })
    };
  }]);