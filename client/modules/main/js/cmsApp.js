(function(){
    
    //Dependancy configuration
    var dependancies = ['ngRoute', 'cmsAppControllers', 'uiMenuModule', 'cartProductsModule', 'formsContactModule'];
    
    var cmsApp = angular.module('cmsApp', dependancies);
    
    //Configuration area
    
    //Variable configuration
    cmsApp.constant('homePage', 'home-page');
    
    //Module configuration
    cmsApp.config(['$routeProvider', 'homePage',
        function($routeProvider, homePage)
        {
            
            $routeProvider.when('/:page', {
                controller : 'pageCtrl',
                templateUrl : 'modules/main/views/main.html'
            }).otherwise({
                redirectTo : homePage
            });
        }]);
})();
