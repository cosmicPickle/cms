(function($){
    
    var cmsAppDirectives = angular.module('cmsAppDirectives', []);
    
    cmsAppDirectives.directive('cmsErrors',function(){
        return {
            restrict : 'AE',
            templateUrl : 'modules/main/views/errors.html',
            replace : true
        };
    });
    
    cmsAppDirectives.directive('cmsPage',['$compile', '$location', function($compile, $location){
        
        var link = function(scope, elem, attrs) {
            
            scope.$watch(attrs.page,function(page, oldPage){

                if(page == oldPage)
                    return;

                if(page.id)
                {
                    //We are gonna parse the modules here
                    $.each(page.modules,function(i,mod){
                       
                       //Fucked up regular expression, I know. Matches {{module:view[(params)]}}.
                       var pattern = '\\{\\{' + mod.alias + '(:([a-zA-Z0-9\\-\\._]+))(\\(([a-zA-Z0-9_,=]+)\\)){0,1}\\}\\}';
                       var re = new RegExp(pattern, 'g');
                       
                       //Let's get the matches
                       var modTempls = page.layout.match(re);
                       
                       //If we don't have matches continue
                       if(!modTempls)
                            return true;
                        
                       //Otherwise we procede to parse each match
                       $.each(modTempls, function(i, templ){
                            var re = new RegExp(pattern);
                            var matches = re.exec(templ);
                           
                            //We need to have our module's settings available through the app
                            //Initializing scope variables;
                            if(!scope[mod.bundle])
                                 scope[mod.bundle] = {};
                            if(!scope[mod.bundle][mod.alias])
                                 scope[mod.bundle][mod.alias] = {};
                             
                            scope[mod.bundle][mod.alias][matches[2]] = {};
                            
                            //One last thing. We need to add the params to the scope, namespaced to bundle.alias.para,
                            //so that they can be used in modules
                            if(matches[4])
                            {
                                var params = matches[4].split(',');


                                //Looping through the params
                                $.each(params, function(i, p){

                                    p = p.split('=');
                                    if(p[0] && p[1])
                                        scope[mod.bundle][mod.alias][matches[2]][p[0]] = p[1];

                                    var path = [mod.bundle,mod.alias,matches[2],p[0]];
                                    var getOverwrite = $location.search()[path.join('.')];

                                    if(getOverwrite)
                                        scope[mod.bundle][mod.alias][matches[2]][p[0]] = getOverwrite;
                                });
                            }
                            
                            //This constructs the ngInclude directive to add our module to the scope
                            var replacement = '<div ng-include="\'modules/'
                                              + mod.bundle + '/views/' + mod.alias 
                                              + matches[2].charAt(0).toUpperCase() 
                                              + matches[2].slice(1) + '.html\'"></div>';
                           //The actual replacement
                           page.layout = page.layout.replace(re, replacement); 
                       });
                       
                       
                       //Loading any scripts needed for the execution of the module
                       $.each($.parseJSON(mod.scripts), function(i,script){
                           var script = "modules/" + mod.bundle + '/js/' + script;
                           page.layout += "<script type='text/javascript' src='" + script + "'></script>";  
                       })
                      
                    });
                    
                    //Finally replacing the static HTML in the layout
                    var ct_re = /<content>/;
                    page.layout = page.layout.replace(ct_re, page.content);
                    
                    //Adding the element to the DOM
                    elem.html(page.layout);
                    
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
            restrict : 'AE',
            link : link,
            replace : true
        }
    }])
})(jQuery);