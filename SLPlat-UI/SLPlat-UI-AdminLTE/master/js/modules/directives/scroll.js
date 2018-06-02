/**=========================================================
 * Module: scroll.js
 * Make a content box scrollable
 =========================================================*/

App.directive('scrollable', function(){
  return {
    restrict: 'EA',
    link: function(scope, elem, attrs) {
      var defaultHeight = 250;
      elem.slimScroll({
          height: (attrs.height || defaultHeight)
      });
    }
  };
});