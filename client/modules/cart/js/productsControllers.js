(function($){
    angular.module('cmsApp').controllerProvider.register('cart.products.listingCtrl',[
        '$scope', '$rootScope', 'ApiDefHttpService', function($scope, $rootScope, ApiDefHttpService) {
               
               $scope.cart.products.listing.displayCurrent = false;
               $scope.cart.products.listing.currentProduct = {};
               
               ApiDefHttpService.init('../server/module/cart.products/products')
                                .get(false,{filter : {
                                        category_id : $scope.cart.products.listing.category
                                     },rel_many : 1})
                                .success(function(resp){
                                    if(resp.success)
                                    {    
                                       $scope.cart.products.listing.items = resp.data.mdata;
                                       $.each($scope.cart.products.listing.items, function(i, item){
                                           $scope.cart.products.listing.items[i].imgMain = $.grep(item.images, function(img){
                                               return img.main == 1;
                                           })[0];
                                       })
                                    }
                                    else
                                       $rootScope.errors = resp.data;
                                });
                                
               $scope.cart.products.listing.showCurrent = function(product){
                   
                   $scope.cart.products.listing.displayCurrent = true;
                   $scope.cart.products.listing.currentProduct = product;
               }
               
               $scope.cart.products.listing.closeCurrent = function(){
                   
                   $scope.cart.products.listing.displayCurrent = false;
                   $scope.cart.products.listing.currentProduct = {};
               }
        }
    ]);
})(jQuery)

