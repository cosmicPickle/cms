var uiMenuModule = angular.module('uiMenuModule', ['ngAnimate']);

uiMenuModule.animation('.ui-menu-custom-root', function() {
    return {
        enter : function(element, done) {
            $(element).hide(0);
            $(element).fadeIn(1000);
        }
    }
});