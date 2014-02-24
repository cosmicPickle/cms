angular.module('cmsApp').provide.service('products.httpService', ['$http', function($http){
        
      var apiUrl = '../server/module/products/products/';
      
      return {
          getProducts : function(params) {
               
               if(params.id)
                   return $http.get(apiUrl + params.id);
          }
      }
      
}]);

