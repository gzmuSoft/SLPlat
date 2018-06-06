/**=========================================================
 * Module: morris.js
 =========================================================*/

App.controller('ChartMorrisController', ['$scope', '$timeout', 'colors', function ($scope, $timeout, colors) {

  $scope.chartdata = [
      { y: "2006", a: 100, b: 90 },
      { y: "2007", a: 75,  b: 65 },
      { y: "2008", a: 50,  b: 40 },
      { y: "2009", a: 75,  b: 65 },
      { y: "2010", a: 50,  b: 40 },
      { y: "2011", a: 75,  b: 65 },
      { y: "2012", a: 100, b: 90 }
  ];

  /* test data update
  $timeout(function(){
    $scope.chartdata[0].a = 50;
    $scope.chartdata[0].b = 50;
  }, 3000); */

  $scope.donutdata = [
    {label: "Download Sales", value: 12},
    {label: "In-Store Sales",value: 30},
    {label: "Mail-Order Sales", value: 20}
  ];

  $scope.donutOptions = {
    colors: [ colors.byName('danger'), colors.byName('yellow'), colors.byName('warning') ],
    resize: true
  };

  $scope.barOptions = {
    xkey: 'y',
    ykeys: ["a", "b"],
    labels: ["Series A", "Series B"],
    xLabelMargin: 2,
    barColors: [ colors.byName('info'), colors.byName('danger') ],
    resize: true
  };

  $scope.lineOptions = {
    xkey: 'y',
    ykeys: ["a", "b"],
    labels: ["Serie A", "Serie B"],
    lineColors: ["#31C0BE", "#7a92a3"],
    resize: true
  };

  $scope.areaOptions = {
    xkey: 'y',
    ykeys: ["a", "b"],
    labels: ["Serie A", "Serie B"],
    lineColors: [ colors.byName('purple'), colors.byName('info') ],
    resize: true
  };

}]);
