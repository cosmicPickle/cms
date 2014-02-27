angular.module('cmsApp').compileProvider.directive('customMenu',['ApiDefHttpService', function(ApiDefHttpService){
        
    var link = function(scope, elem, attrs){
        
        ApiDefHttpService.init('../server/module/ui.menu/menu_items').get(false,{
                filter : {
                   mid : scope.menuid
                }
             }).success(function(resp){
                 if(resp.success)
                 {    
                    scope.menu = {};
                    scope.menu.items = resp.data.mdata;
                 }
            });
    };
    
    return {
        link : link,
        restrict : 'AE',
        scope : {
            'menuid' : '='
        },
        templateUrl : 'modules/ui/views/menuCustomDirective.html',
        replace : true
    }    
}]);
