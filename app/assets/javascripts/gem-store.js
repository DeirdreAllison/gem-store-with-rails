//=require_self
//=require_tree ./store_app
  var app = angular.module('gemStore', []);

  app.controller('StoreController', [ '$http', "$scope", function($http, $scope){
    $scope.products = [];

    $http.get('/products/store-products.json').success(function(data){
      $scope.products = data;
    });
} ]);

  app.controller('ReviewController', function() {
    this.review = {};

    this.addReview = function(product) {
      product.reviews.push(this.review);

      this.review = {};
    };
  });
