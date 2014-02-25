angular.module('cmsApp').controllerProvider.register('cart.products.listingCtrl',[
    '$scope', '$routeParams', 'ApiDefHttpService', function($scope, $routeParams, ApiDefHttpService) {
           
           var data = {
               filter : {
                   category_id : $scope.cart.products.category
               },
               rel_one : 1,
               rel_many : 1
           }
           
           ApiDefHttpService.init('../server/module/cart.products/products/').get(data).success(function(data){
               console.log(data);
           })
    }
]);

