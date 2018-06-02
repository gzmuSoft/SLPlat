/**=========================================================
 * Module: access-login.js
 * Demo for login api
 =========================================================*/

App.controller('LoginFormController', ['$scope', '$http', '$state', function($scope, $http, $state) {

  // bind here all data from the form
  $scope.account = {};
  // place the message if something goes wrong
  $scope.authMsg = '';

  $scope.login = function() {
    $scope.authMsg = '';

      if($scope.loginForm.$valid) {
		$scope.login = function () {
			$.ajax({
				type: 'POST',
	            dataType:"json",
				contentType:'application/json;charset=UTF-8',
				url : '/login',
				data : angular.toJson($scope.user)
			}).then(function(result) {
				console.log(result);
				if (result.code == 200) {
					$state.go('app.dashboard');
				} else {
					$scope.authMsg = 'Incorrect credentials.';
				}
		    });
		};

      }
      else {
          // set as dirty if the user click directly to login so we show the validation messages
          $scope.loginForm.account_email.$dirty = true;
          $scope.loginForm.account_password.$dirty = true;
      }
  };

}]);
