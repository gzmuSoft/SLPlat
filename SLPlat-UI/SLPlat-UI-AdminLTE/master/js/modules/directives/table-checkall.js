/**=========================================================
 * Module: table-checkall.js
 * Tables check all checkbox
 =========================================================*/

App.directive('checkAll', function() {
  'use strict';
  
  return {
    restrict: 'A',
    controller: ["$scope", "$element", function($scope, $element){
      
      $element.on('change', function() {
        var $this = $(this),
            index= $this.index() + 1,
            checkbox = $this.find('input[type="checkbox"]'),
            table = $this.parents('table');
        // Make sure to affect only the correct checkbox column
        table.find('tbody > tr > td:nth-child('+index+') input[type="checkbox"]')
          .prop('checked', checkbox[0].checked);

      });
    }]
  };

});