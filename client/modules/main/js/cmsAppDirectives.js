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
                    //We are gonna parse the modules here
                    $.each(page.modules,function(i,mod){
                       
                       //Fucked up regular expression, I know. Matches {{module:view[(params)]}}.
                       var pattern = '\\{\\{' + mod.alias + '(:([a-zA-Z0-9\\-\\._]+)){0,1}(\\(([a-zA-Z0-9_,=]+)\\)){0,1}\\}\\}';
                       var re = new RegExp(pattern, 'g');
                       
                       //Let's get the matches
                       var matches = re.exec(page.content);
                       
                       //This constructs the ngInclude directive to add our module to the scope
                       var replacement = '<div ng-include="\'modules/'
                                         + mod.bundle + '/views/' + mod.alias 
                                         + matches[2].charAt(0).toUpperCase() 
                                         + matches[2].slice(1) + '.html\'"></div>';
                       
                       //The actual replacement
                       page.content = page.content.replace(re, replacement);  
                       
                       //One last thing. We need to add the params to the scope, namespaced to bundle.alias.para,
                       //so that they can be used in modules
                       if(matches[4])
                       {
                           var params = matches[4].split(',');
                           
                           //Initializing scope variables;
                           if(!scope[mod.bundle])
                                scope[mod.bundle] = {};
                           if(!scope[mod.bundle][mod.alias])
                                scope[mod.bundle][mod.alias] = {};
                           
                           //Looping through the params
                           $.each(params, function(i, p){
                              
                               p = p.split('=');
                               if(p[0] && p[1])
                                   scope[mod.bundle][mod.alias][p[0]] = p[1];
                           });
                       }
                    });
                    
                    //Adding the element to the DOM
                    elem.html(page.content);
                    
                    //Binding it to the scope
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