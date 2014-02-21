(function(){
    
    var cmsAppControllers = angular.module('cmsAppControllers', ['ngRoute', 'cmsAppServices', 'cmsAppDirectives']);
    
    cmsAppControllers.controller('cmsCtrl', ['$scope',
        function($scope){
            $scope.page = {}
     }]);
 
    cmsAppControllers.controller('pageCtrl', ['$scope', '$routeParams', 'cmsPage', 
        function($scope, $routeParams, cmsPage){
            var pageId = $routeParams.page;
            
            cmsPage.get(pageId).success(function(page){
                
                if(!page.success)
                {
                   $scope.errors = page.data;
                   $scope.$parent.page = {};
                }
                else
                {
                    $scope.$parent.page = page.data[0];
                }
            });
    }]);
})();