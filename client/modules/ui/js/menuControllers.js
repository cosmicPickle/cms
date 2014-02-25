angular.module('cmsApp').controllerProvider.register('ui.menu.menuCtrl',[
    '$scope', '$routeParams', 'ApiDefHttpService', function($scope, $routeParams, ApiDefHttpService) {
           
           ApiDefHttpService.init('../server/module/ui.menu/menu_items/').get(false,{
               filter : {
                  mid : $scope.ui.menu.id 
               }
           }).success(function(resp){
               $scope.ui.menu.data = resp.data.mdata;
           })
    }
]);