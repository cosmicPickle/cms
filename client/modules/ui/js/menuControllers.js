angular.module('cmsApp').controllerProvider.register('ui.menu.menuCtrl',[
    '$scope', '$rootScope', 'ApiDefHttpService', function($scope, $rootScope, ApiDefHttpService) {
        
        $scope.init = function(view){

             ApiDefHttpService.init('../server/module/ui.menu/menu_items').get(false,{
                filter : {
                   mid : $scope.ui.menu[view].id 
                }
             }).success(function(resp){
                 if(resp.success)
                 {    
                    $scope.ui.menu[view].data = resp.data.mdata;
                 }
                 else
                    $rootScope.errors = resp.data;
            });
        }    
        
        $scope.reload = function(href) {
            console.log(href);
        }
    }
]);