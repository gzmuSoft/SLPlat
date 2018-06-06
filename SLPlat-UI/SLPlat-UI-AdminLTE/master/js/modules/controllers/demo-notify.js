/**=========================================================
 * Module: demo-notify.js
 * Provides a simple demo for notify
 =========================================================*/

App.controller('NotifyDemoCtrl', ['$scope', 'Notify', '$timeout', function AlertDemoCtrl($scope, Notify, $timeout) {

  $scope.msgHtml = "<em class='fa fa-check'></em> Message with icon..";

  $scope.notifyMsg = "Some messages here..";
  $scope.notifyOpts = {
    status: 'danger',
    pos: 'bottom-center'
  };

  // Service usage example
  $timeout(function(){
    
    Notify.alert( 
        'This is a custom message from notify..', 
        {status: 'success'}
    );
  
  }, 500);



}]);