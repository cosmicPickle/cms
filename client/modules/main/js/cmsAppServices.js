(function(){
   
    var cmsAppServices = angular.module('cmsAppServices', []);
    
    cmsAppServices.factory('cmsPage', ['$http', function($http){
            
        var apiUrl = '../server/page/';
        
        return {
            get : function(page){
                return $http({
                    url : apiUrl + page, 
                    method : "GET",
                    params : {
                        load_modules : 1
                    }
                });
            }
        }
    }]);
    
    
    cmsAppServices.factory('ApiDefHttpService', ['$http', function($http){
            return {
                apiUrl : false,
                init : function(url) {
                   this.apiUrl = url;
                   return this;
                },
                get : function(id, params) {
                     if(!this.apiUrl)
                         return false;
                     
                     if(id)
                         return $http({
                             url : this.apiUrl + ((this.apiUrl.slice(-1) != '/') ? '/' : '') + id,
                             params : params,
                             method : 'GET'
                         });
                     else
                        return  $http({
                           url : this.apiUrl,
                           params : params,
                           method : 'GET'
                        });
                },
                post : function(data) {
                    return $http({
                        method : 'POST',
                        url : this.apiUrl,
                        data : $.param(data),
                        headers : {'Content-Type': 'application/x-www-form-urlencoded'}
                    });
                }
            }
    }]);
})()
