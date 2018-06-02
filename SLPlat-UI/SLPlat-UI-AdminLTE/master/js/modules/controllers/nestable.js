/**=========================================================
 * Module: nestable.js
 * Nestable controller
 =========================================================*/

App.controller('NestableController', ['$scope', function($scope) {
  
  'use strict';

  $scope.items =  [
    {
      item: {text: 'a'},
      children: []
    },
    {
      item: {text: 'b'},
      children: [
        {
          item: {text: 'c'},
          children: []
        },
        {
          item: {text: 'd'},
          children: []
        }
      ]
    },
    {
      item: {text: 'e'},
      children: []
    },
    {
      item: {text: 'f'},
      children: []
    }
  ];

  $scope.items2 =  [
    {
      item: {text: '1'},
      children: []
    },
    {
      item: {text: '2'},
      children: [
        {
          item: {text: '3'},
          children: []
        },
        {
          item: {text: '4'},
          children: []
        }
      ]
    },
    {
      item: {text: '5'},
      children: []
    },
    {
      item: {text: '6'},
      children: []
    }
  ]


}]);
