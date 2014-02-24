angular.module('cmsApp').provide.service('products.httpService', ['$http', function($http){
        
      var apiUrl = '../server/module/cart.products/products/';
      
      return {
          getProducts : function(params) {
              
               if(params.id)
                   return $http.get(apiUrl + params.id);
               else
                  return  $http({
                     url : apiUrl,
                     params : params,
                     method : 'GET'
                  });
          }
      }
      
}]);

