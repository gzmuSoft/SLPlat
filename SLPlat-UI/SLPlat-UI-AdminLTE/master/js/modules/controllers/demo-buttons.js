/**=========================================================
 * Module: demo-buttons.js
 * Provides a simple demo for buttons actions
 =========================================================*/

App.controller('ButtonsCtrl', ['$scope', function ($scope) {

  $scope.singleModel = 1;

  $scope.radioModel = 'Middle';

  $scope.checkModel = {
    left: false,
    middle: true,
    right: false
  };

}]);