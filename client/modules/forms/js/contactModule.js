var formsContactModule = angular.module('formsContactModule', []);

formsContactModule.controller('forms.contact.contactCtrl',['$scope', 'ApiDefHttpService', function($scope , ApiDefHttpService) {
     
     $scope.forms.contact.sendForm = function() {
         var data = angular.extend({}, $scope.forms.contact.data, {
             sender : $scope.forms.contact.data.email,
             subject : 'Client Query'
         });
         ApiDefHttpService.init('../server/process/sendmail')
                          .post(data)
                          .success(function(resp){
                              console.log(resp);
                          });
     }
}]);
