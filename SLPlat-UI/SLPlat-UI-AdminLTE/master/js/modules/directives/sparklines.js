/**=========================================================
 * Module: sparkline.js
 * SparkLines Mini Charts
 =========================================================*/
 
App.directive('sparkline', ['$timeout', '$window', function($timeout, $window){

  'use strict';

  return {
    restrict: 'EA',
    controller: ["$scope", "$element", function ($scope, $element) {
      var runSL = function(){
        initSparLine($element);
      };

      $timeout(runSL);
    }]
  };

  function initSparLine($element) {
    var options = $element.data();

    options.type = options.type || 'bar'; // default chart is bar
    options.disableHiddenCheck = true;

    $element.sparkline('html', options);

    if(options.resize) {
      $(window).resize(function(){
        $element.sparkline('html', options);
      });
    }
  }

}]);
