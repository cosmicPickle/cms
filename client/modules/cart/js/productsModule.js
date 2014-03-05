var cartProductsModule = angular.module('cartProductsModule', ['ngAnimate']);

cartProductsModule.animation('.cart-products-listing-root', function() {
    return {
        enter : function(element, done) {
            $(element).hide(0);
            $(element).fadeIn(1000);
        }
    }
});