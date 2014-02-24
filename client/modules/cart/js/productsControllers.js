angular.module('cmsApp').controllerProvider.register('products.listingCtrl',[
    '$scope', '$routeParams', 'products.httpService', function($scope, $routeParams, pdsHttpService) {
           
           var data = {
               filter : {
                   category_id : $scope.cart.products.category
               },
               rel_one : 1,
               rel_many : 1
           }
           
           pdsHttpService.getProducts(data).success(function(data){
               console.log(data);
           })
    }
]);

