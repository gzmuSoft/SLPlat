/**=========================================================
 * Module: sortable.js
 * Sortable controller
 =========================================================*/

App.controller('SortableController', ['$scope', function($scope) {
  'use strict';

  // Single List
  $scope.data1 = [
    { id: 1, name: 'Donald Hoffman' },
    { id: 2, name: 'Wallace Barrett' },
    { id: 3, name: 'Marsha Hicks' },
    { id: 4, name: 'Roland Brown' }
  ];

  $scope.add = function () {
    $scope.data1.push({id: $scope.data1.length + 1, name: 'Earl Knight'});
  };

  $scope.sortableCallback = function (sourceModel, destModel, start, end) {
    console.log(start + ' -> ' + end);
  };
  
  $scope.sortableOptions = {
      placeholder: '<div class="box-placeholder p0 m0"><div></div></div>',
      forcePlaceholderSize: true
  };

}]);
