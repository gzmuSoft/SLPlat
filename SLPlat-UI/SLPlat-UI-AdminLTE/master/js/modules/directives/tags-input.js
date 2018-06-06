/**=========================================================
 * Module: tags-input.js
 * Initializes the tag inputs plugin
 =========================================================*/

App.directive('tagsinput', ["$timeout", function($timeout) {
  return {
    restrict: 'A',
    require: 'ngModel',
    link: function(scope, element, attrs, ngModel) {

      element.on('itemAdded itemRemoved', function(){
        // check if view value is not empty and is a string
        // and update the view from string to an array of tags
        if(ngModel.$viewValue && ngModel.$viewValue.split) {
          ngModel.$setViewValue( ngModel.$viewValue.split(',') );
          ngModel.$render();
        }
      });

      $timeout(function(){
        element.tagsinput();
      });

    }
  };
}]);
