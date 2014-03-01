var formsContactModule = angular.module('formsContactModule', []);

formsContactModule.controller('forms.contact.contactCtrl',['$scope', 'ApiDefHttpService', function($scope , ApiDefHttpService) {
     
     $scope.forms.contact.sendForm = function() {
         ApiDefHttpService.init('../server/process/contactmail')
                          .post($scope.forms.contact.data)
                          .success(function(data){
                              console.log(data);
                          });
     }
}]);
