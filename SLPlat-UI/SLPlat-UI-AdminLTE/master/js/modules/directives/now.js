/**=========================================================
 * Module: now.js
 * Provides a simple way to display the current time formatted
 =========================================================*/

App.directive("now", ['dateFilter', '$interval', function(dateFilter, $interval){
    return {
      restrict: 'E',
      link: function(scope, element, attrs){
        
        var format = attrs.format;

        function updateTime() {
          var dt = dateFilter(new Date(), format);
          element.text(dt);
        }

        updateTime();
        $interval(updateTime, 1000);
      }
    };
}]);