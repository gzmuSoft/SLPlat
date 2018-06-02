/**=========================================================
 * Module: flot.js
 * Initializes the Flot chart plugin and handles data refresh
 =========================================================*/

App.directive('flot', ['$http', '$timeout', function($http, $timeout) {
  'use strict';
  return {
    restrict: 'EA',
    template: '<div></div>',
    scope: {
      dataset: '=?',
      options: '=',
      series: '=',
      callback: '=',
      src: '='
    },
    link: linkFunction
  };
  
  function linkFunction(scope, element, attributes) {
    var height, plot, plotArea, width;
    var heightDefault = 220;

    plot = null;

    width = attributes.width || '100%';
    height = attributes.height || heightDefault;

    plotArea = $(element.children()[0]);
    plotArea.css({
      width: width,
      height: height
    });

    function init() {
      var plotObj;
      if(!scope.dataset || !scope.options) return;
      plotObj = $.plot(plotArea, scope.dataset, scope.options);
      scope.$emit('plotReady', plotObj);
      if (scope.callback) {
        scope.callback(plotObj, scope);
      }

      return plotObj;
    }

    function onDatasetChanged(dataset) {
      if (plot) {
        plot.setData(dataset);
        plot.setupGrid();
        return plot.draw();
      } else {
        plot = init();
        onSerieToggled(scope.series);
        return plot;
      }
    }
    scope.$watchCollection('dataset', onDatasetChanged, true);

    function onSerieToggled (series) {
      if( !plot || !series ) return;
      var someData = plot.getData();
      for(var sName in series) {
        angular.forEach(series[sName], toggleFor(sName));
      }
      
      plot.setData(someData);
      plot.draw();
      
      function toggleFor(sName) {
        return function (s, i){
          if(someData[i] && someData[i][sName])
            someData[i][sName].show = s;
        };
      }
    }
    scope.$watch('series', onSerieToggled, true);
    
    function onSrcChanged(src) {

      if( src ) {

        $http.get(src)
          .success(function (data) {

            $timeout(function(){
              scope.dataset = data;
            });

        }).error(function(){
          $.error('Flot chart: Bad request.');
        });
        
      }
    }
    scope.$watch('src', onSrcChanged);
  }

}]);
