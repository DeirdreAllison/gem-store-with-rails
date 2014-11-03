(function() {
  var app = angular.module('gemStore');
  app.controller('UsersCtrl', ['$scope', '$http', '$cookies', '$location', function($scope, $http, $cookies, $location) {
    $scope.create = function(user) {
      $http({
        method: 'POST',
        url: '/users',
        data: {user: user}
      })
        .success(function(data) {
          $scope.newUser = null;
          $cookies.current_user = data['email'];
          $location.path('/apiv1/products');
          console.log('created users');
        })
        .error(function(data, status) {
          console.log(data);
          console.log(status);
        });
    };

    $scope.signIn = function(user) {
      $http({
        method: 'POST',
        url: '/users/sign_in',
        data: {user: user}
      })
      .success(function(data) {
        $scope.user = null;
        $cookies.current_user = data['email'];
        $location.path('/apiv1/products');
      })
      .error(function(data, status) {
        console.log(data);
        console.log(status);
      });
    }
  }]);
})()