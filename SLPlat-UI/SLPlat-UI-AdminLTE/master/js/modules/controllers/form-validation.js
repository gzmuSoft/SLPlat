/**=========================================================
 * Module: FormValidationController
 * Input validation with UI Validate
 =========================================================*/

App.controller('FormValidationController', ["$scope", function ($scope) {
  'use strict';
  
  $scope.notBlackListed = function(value) {
    var blacklist = ['some@mail.com','another@email.com'];
    return blacklist.indexOf(value) === -1;
  };

  $scope.words = function(value) {
    return value && value.split(' ').length;
  };

  $scope.submitted = false;
  $scope.validateInput = function(name, type) {
    var input = $scope.formValidate[name];
    return (input.$dirty || $scope.submitted) && input.$error[type];
  };

  // Submit form
  $scope.submitForm = function() {
    $scope.submitted = true;
    if ($scope.formValidate.$valid) {
      console.log('Submitted!!');
    } else {
      console.log('Not valid!!');
      return false;
    }
  };

}]);
