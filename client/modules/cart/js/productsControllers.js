angular.module('cmsApp').controllerProvider.register('products.listingCtrl',[
    '$scope', '$routeParams', 'products.httpService', function($scope, $routeParams, pdsHttpService) {
           
           pdsHttpService.getProducts({id : 1}).success(function(data){
               console.log(data);
           })
    }
]);

