App.controller('FormDemoCtrl', ["$scope", "$resource", function($scope, $resource) {
  'use strict';

  // the following allow to request array $resource instead of object (default)
  var actions = {'get': {method: 'GET', isArray: true}};
  
  // Tags inputs
  // ----------------------------------- 
  var Cities = $resource('server/cities.json', {}, actions);

  Cities.get(function(data){

      $scope.cities = data;

  });
  // for non ajax form just fill the scope variable
  // $scope.cities = ['Amsterdam','Washington','Sydney','Beijing','Cairo'];

  // Slider demo values
  $scope.slider1 = 5;
  $scope.slider2 = 10;
  $scope.slider3 = 15;
  $scope.slider4 = 20;
  $scope.slider5 = 25;
  $scope.slider6 = 30;
  $scope.slider7 = 10;
  $scope.slider8 = [250,750];

  // Chosen data
  // ----------------------------------- 

  var States = $resource('server/chosen-states.json', {},  {'query':    {method:'GET', isArray:true} });

  $scope.states = States.query();


  $scope.alertSubmit = function(){
    alert('Form submitted!');
    return false;
  };

  // Angular wysiwyg 
  // ----------------------------------- 

  $scope.wysiwygContent = '<p> Write something here.. </p>';

  // Text Angular (wysiwyg)
  // ----------------------------------- 
  
  $scope.htmlContent = '<h2>Try me!</h2><p>textAngular is a super cool WYSIWYG Text Editor directive for AngularJS</p><p><b>Features:</b></p><ol><li>Automatic Seamless Two-Way-Binding</li><li style="color: blue;">Super Easy <b>Theming</b> Options</li><li>Simple Editor Instance Creation</li><li>Safely Parses Html for Custom Toolbar Icons</li><li>Doesn&apos;t Use an iFrame</li><li>Works with Firefox, Chrome, and IE8+</li></ol><p><a href="https://github.com/fraywing/textAngular">Source</a> </p>';


}]);