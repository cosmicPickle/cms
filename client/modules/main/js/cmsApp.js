(function(){
    
    var cmsApp = angular.module('cmsApp', ['ngRoute', 'cmsAppControllers']);
    
    //Configuration area
    
    //Variable configuration
    cmsApp.constant('homePage', 'home-page');
    
    //Module configuration
    cmsApp.config(['$routeProvider', '$controllerProvider', '$compileProvider', '$filterProvider', '$provide', 'homePage',
        function($routeProvider, $controllerProvider, $compileProvider, $filterProvider, $provide, homePage)
        {
            cmsApp.controllerProvider = $controllerProvider;
            cmsApp.compileProvider    = $compileProvider;
            cmsApp.routeProvider      = $routeProvider;
            cmsApp.filterProvider     = $filterProvider;
            cmsApp.provide            = $provide;
            
            $routeProvider.when('/:page', {
                controller : 'pageCtrl',
                templateUrl : 'modules/main/views/main.html'
            }).otherwise({
                redirectTo : homePage
            });
        }]);
})();
