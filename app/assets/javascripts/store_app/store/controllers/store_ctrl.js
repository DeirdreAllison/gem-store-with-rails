var app = angular.module('gemStore');

  app.controller('StoreController', [ '$http', "$scope", function($http, $scope){
    $scope.products = [];

    $scope.errors = [];

    $scope.index = function() {
      $http.get('/apiv1/products')
        .success(function(data) {
          $scope.products = data;
        })
          .error(function(data, status) {
            $scope.errors.push(data);
            console.log(data);
            console.log(status);
          });
    };

    $scope.create = function(product) {
      $http.post('/apiv1/products', {product: product})
        .success(function(data) {
          $scope.products.push(data);
        })
        .error(function(data, status) {
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        })
    };

    $scope.update = function(product) {
      $http({
        method: 'PATCH',
        url: '/apiv1/products/' + product.id,
        data: product
      })
        .success(function() {
          product.editing = false;
        })
        .error(function(data, status) {
          $scope.errors += data;
          console.log(data);
          console.log(status);
        })
    };

    $scope.destroy = function(product) {
      $http({
        method: 'DELETE',
        url: '/apiv1/products/' + product.id
      })
        .success(function() {
          product.deleteConfirm = false;
          $scope.products.splice($scope.products.indexOf(product), 1);
        })
        .error(function() {
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        });
    };
} ]);