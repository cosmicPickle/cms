var app = angular.module('app', ['ngRoute', 'ngAnimate']);

app.animation('.my-view',function(){
    return {
        enter : function(element, done)
        {
            element.css({ 'display': 'none'})
            jQuery(element).fadeIn(500);
        },
        leave : function(element, done)
        {
            jQuery(element).fadeOut(500);
        }
    }
})
app.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
        when('/phones', {
            templateUrl: 'views/view1.html',
            controller: 'AppController'
        }).
        when('/phones/:phoneId', {
            templateUrl: 'views/view2.html',
            controller: 'AppController'
        }).
        otherwise({
            redirectTo: '/phones'
    });
}]);

app.controller("AppController", function($scope){
    $scope.test = "This is a test";
});
