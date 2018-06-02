/**=========================================================
 * Module: carousel.js
 * Controller for ChartJs
 =========================================================*/

App.controller('ChartJSController', ["$scope", "colors", function($scope, colors) {

  // random values for demo
  var rFactor = function(){ return Math.round(Math.random()*100); };


// Line chart
// ----------------------------------- 

  $scope.lineData = {
      labels : ['January','February','March','April','May','June','July'],
      datasets : [
        {
          label: 'My First dataset',
          fillColor : 'rgba(114,102,186,0.2)',
          strokeColor : 'rgba(114,102,186,1)',
          pointColor : 'rgba(114,102,186,1)',
          pointStrokeColor : '#fff',
          pointHighlightFill : '#fff',
          pointHighlightStroke : 'rgba(114,102,186,1)',
          data : [rFactor(),rFactor(),rFactor(),rFactor(),rFactor(),rFactor(),rFactor()]
        },
        {
          label: 'My Second dataset',
          fillColor : 'rgba(35,183,229,0.2)',
          strokeColor : 'rgba(35,183,229,1)',
          pointColor : 'rgba(35,183,229,1)',
          pointStrokeColor : '#fff',
          pointHighlightFill : '#fff',
          pointHighlightStroke : 'rgba(35,183,229,1)',
          data : [rFactor(),rFactor(),rFactor(),rFactor(),rFactor(),rFactor(),rFactor()]
        }
      ]
    };


  $scope.lineOptions = {
    scaleShowGridLines : true,
    scaleGridLineColor : 'rgba(0,0,0,.05)',
    scaleGridLineWidth : 1,
    bezierCurve : true,
    bezierCurveTension : 0.4,
    pointDot : true,
    pointDotRadius : 4,
    pointDotStrokeWidth : 1,
    pointHitDetectionRadius : 20,
    datasetStroke : true,
    datasetStrokeWidth : 2,
    datasetFill : true,
  };


// Bar chart
// ----------------------------------- 

  $scope.barData = {
      labels : ['January','February','March','April','May','June','July'],
      datasets : [
        {
          fillColor : colors.byName('info'),
          strokeColor : colors.byName('info'),
          highlightFill: colors.byName('info'),
          highlightStroke: colors.byName('info'),
          data : [rFactor(),rFactor(),rFactor(),rFactor(),rFactor(),rFactor(),rFactor()]
        },
        {
          fillColor : colors.byName('primary'),
          strokeColor : colors.byName('primary'),
          highlightFill : colors.byName('primary'),
          highlightStroke : colors.byName('primary'),
          data : [rFactor(),rFactor(),rFactor(),rFactor(),rFactor(),rFactor(),rFactor()]
        }
      ]
  };
  
  $scope.barOptions = {
    scaleBeginAtZero : true,
    scaleShowGridLines : true,
    scaleGridLineColor : 'rgba(0,0,0,.05)',
    scaleGridLineWidth : 1,
    barShowStroke : true,
    barStrokeWidth : 2,
    barValueSpacing : 5,
    barDatasetSpacing : 1,
  };


//  Doughnut chart
// ----------------------------------- 
  
  $scope.doughnutData = [
        {
          value: 300,
          color: colors.byName('purple'),
          highlight: colors.byName('purple'),
          label: 'Purple'
        },
        {
          value: 50,
          color: colors.byName('info'),
          highlight: colors.byName('info'),
          label: 'Info'
        },
        {
          value: 100,
          color: colors.byName('yellow'),
          highlight: colors.byName('yellow'),
          label: 'Yellow'
        }
      ];

  $scope.doughnutOptions = {
    segmentShowStroke : true,
    segmentStrokeColor : '#fff',
    segmentStrokeWidth : 2,
    percentageInnerCutout : 85,
    animationSteps : 100,
    animationEasing : 'easeOutBounce',
    animateRotate : true,
    animateScale : false
  };

// Pie chart
// ----------------------------------- 

  $scope.pieData =[
        {
          value: 300,
          color: colors.byName('purple'),
          highlight: colors.byName('purple'),
          label: 'Purple'
        },
        {
          value: 40,
          color: colors.byName('yellow'),
          highlight: colors.byName('yellow'),
          label: 'Yellow'
        },
        {
          value: 120,
          color: colors.byName('info'),
          highlight: colors.byName('info'),
          label: 'Info'
        }
      ];

  $scope.pieOptions = {
    segmentShowStroke : true,
    segmentStrokeColor : '#fff',
    segmentStrokeWidth : 2,
    percentageInnerCutout : 0, // Setting this to zero convert a doughnut into a Pie
    animationSteps : 100,
    animationEasing : 'easeOutBounce',
    animateRotate : true,
    animateScale : false
  };

// Polar chart
// ----------------------------------- 
  
  $scope.polarData = [
        {
          value: 300,
          color: colors.byName('pink'),
          highlight: colors.byName('pink'),
          label: 'Red'
        },
        {
          value: 50,
          color: colors.byName('purple'),
          highlight: colors.byName('purple'),
          label: 'Green'
        },
        {
          value: 100,
          color: colors.byName('pink'),
          highlight: colors.byName('pink'),
          label: 'Yellow'
        },
        {
          value: 140,
          color: colors.byName('purple'),
          highlight: colors.byName('purple'),
          label: 'Grey'
        },
      ];

  $scope.polarOptions = {
    scaleShowLabelBackdrop : true,
    scaleBackdropColor : 'rgba(255,255,255,0.75)',
    scaleBeginAtZero : true,
    scaleBackdropPaddingY : 1,
    scaleBackdropPaddingX : 1,
    scaleShowLine : true,
    segmentShowStroke : true,
    segmentStrokeColor : '#fff',
    segmentStrokeWidth : 2,
    animationSteps : 100,
    animationEasing : 'easeOutBounce',
    animateRotate : true,
    animateScale : false
  };


// Radar chart
// ----------------------------------- 

  $scope.radarData = {
    labels: ['Eating', 'Drinking', 'Sleeping', 'Designing', 'Coding', 'Cycling', 'Running'],
    datasets: [
      {
        label: 'My First dataset',
        fillColor: 'rgba(114,102,186,0.2)',
        strokeColor: 'rgba(114,102,186,1)',
        pointColor: 'rgba(114,102,186,1)',
        pointStrokeColor: '#fff',
        pointHighlightFill: '#fff',
        pointHighlightStroke: 'rgba(114,102,186,1)',
        data: [65,59,90,81,56,55,40]
      },
      {
        label: 'My Second dataset',
        fillColor: 'rgba(151,187,205,0.2)',
        strokeColor: 'rgba(151,187,205,1)',
        pointColor: 'rgba(151,187,205,1)',
        pointStrokeColor: '#fff',
        pointHighlightFill: '#fff',
        pointHighlightStroke: 'rgba(151,187,205,1)',
        data: [28,48,40,19,96,27,100]
      }
    ]
  };

  $scope.radarOptions = {
    scaleShowLine : true,
    angleShowLineOut : true,
    scaleShowLabels : false,
    scaleBeginAtZero : true,
    angleLineColor : 'rgba(0,0,0,.1)',
    angleLineWidth : 1,
    pointLabelFontFamily : "'Arial'",
    pointLabelFontStyle : 'bold',
    pointLabelFontSize : 10,
    pointLabelFontColor : '#565656',
    pointDot : true,
    pointDotRadius : 3,
    pointDotStrokeWidth : 1,
    pointHitDetectionRadius : 20,
    datasetStroke : true,
    datasetStrokeWidth : 2,
    datasetFill : true
  };



}]);
