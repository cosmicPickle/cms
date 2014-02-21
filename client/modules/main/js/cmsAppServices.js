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
                        load_modules : 1,
                        parse :1
                    }
                });
            }
        }
    }]);
})()
