cartProductsModule.directive('product', function(ApiDefHttpService){
    
    var link = function(scope, elem, attrs){
        
    };
    
    return {
        link : link,
        restrict : 'AE',
        scope : true,
        transclude : true,
        templateUrl : 'modules/cart/views/productDisplayDirective.html',
        replace : true
    }    
});
