uiMenuModule.directive('customMenu',['$animate', 'ApiDefHttpService', function($animate, ApiDefHttpService){
        
    var link = function(scope, elem, attrs){
        
        scope.timeout;
        
        scope.showSub = function(){
            clearTimeout(scope.timeout);
            
            $animate.removeClass(elem, 'opacity-down');
            elem.find('.level2').slideDown(500);
        };
        
        scope.removeSub = function() { 
            scope.timeout = setTimeout(function(){
                $animate.addClass(elem, 'opacity-down');
                elem.find('.level2').stop();
                elem.find('.level2').slideUp(500);
            },500)
        };
        
        
        ApiDefHttpService.init('../server/module/ui.menu/menus').get(scope.menuid,{
                   rel_many : 1
             }).success(function(resp){
                 if(resp.success)
                 {    
                    scope.menu = resp.data.mdata[0];
                    scope.menu.alias = scope.menu.alias.split('-');
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
