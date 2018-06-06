/**=========================================================
 * Module: calendar-ui.js
 * This script handle the calendar demo with draggable 
 * events and events creations
 =========================================================*/

App.controller('InfiniteScrollController', ["$scope", "$timeout", function($scope, $timeout) {

  $scope.images = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  $scope.loadMore = function() {
    var last = $scope.images[$scope.images.length - 1];
    for(var i = 1; i <= 10; i++) {
      $scope.images.push(last + i);
    }
  };

}]).factory('datasource', [
    '$log', '$timeout', function(console, $timeout) {
        'use strict';

        var get = function(index, count, success) {
            return $timeout(function() {
                var i, result, _i, _ref;
                result = [];
                for (i = _i = index, _ref = index + count - 1; index <= _ref ? _i <= _ref : _i >= _ref; i = index <= _ref ? ++_i : --_i) {
                    result.push('item #' + i);
                }
                return success(result);
            }, 100);
        };
        return {
            get: get
        };
    }]);