(function($){
    
    var cmsAppDirectives = angular.module('cmsAppDirectives', []);
    
    cmsAppDirectives.directive('cmsErrors',function(){
        return {
            restrict : 'E',
            scope : {
                errors : '='
            },
            templateUrl : 'modules/main/views/errors.html'
        };
    });
    
    cmsAppDirectives.directive('cmsPage',['$compile', function($compile){
        
        var link = function(scope, elem, attrs) {
        
            scope.$watch(attrs.page,function(page, oldPage){

                if(page == oldPage)
                    return;

                if(page.id)
                {
                    elem.html(page.content);
                    $compile(elem.contents())(scope);
                }
                else
                {    
                    elem.html('');
                    $compile(elem.contents())(scope);
                }
                
            });
        };
        
        return {
            restrict : 'E',
            link : link,
        }
    }])
})(jQuery);