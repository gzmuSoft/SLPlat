/**=========================================================
 * Module: datatable,js
 * Angular Datatable controller
 =========================================================*/

App.controller('DataTableController', ['$scope', '$resource', 'DTOptionsBuilder', 'DTColumnDefBuilder',
  function($scope, $resource, DTOptionsBuilder, DTColumnDefBuilder) {
  'use strict';

  // Ajax

  $resource('server/datatable.json').query().$promise.then(function(persons) {
      $scope.persons = persons;
  });

  // Changing data

  $scope.heroes = [{
      "id": 860,
      "firstName": "Superman",
      "lastName": "Yoda"
    }, {
      "id": 870,
      "firstName": "Ace",
      "lastName": "Ventura"
    }, {
      "id": 590,
      "firstName": "Flash",
      "lastName": "Gordon"
    }, {
      "id": 803,
      "firstName": "Luke",
      "lastName": "Skywalker"
    }
  ];

  $scope.dtOptions = DTOptionsBuilder.newOptions().withPaginationType('full_numbers');
  $scope.dtColumnDefs = [
      DTColumnDefBuilder.newColumnDef(0),
      DTColumnDefBuilder.newColumnDef(1),
      DTColumnDefBuilder.newColumnDef(2),
      DTColumnDefBuilder.newColumnDef(3).notSortable()
  ];
  $scope.person2Add = _buildPerson2Add(1);
  $scope.addPerson = addPerson;
  $scope.modifyPerson = modifyPerson;
  $scope.removePerson = removePerson;

  function _buildPerson2Add(id) {
      return {
          id: id,
          firstName: 'Foo' + id,
          lastName: 'Bar' + id
      };
  }
  function addPerson() {
      $scope.heroes.push(angular.copy($scope.person2Add));
      $scope.person2Add = _buildPerson2Add($scope.person2Add.id + 1);
  }
  function modifyPerson(index) {
      $scope.heroes.splice(index, 1, angular.copy($scope.person2Add));
      $scope.person2Add = _buildPerson2Add($scope.person2Add.id + 1);
  }
  function removePerson(index) {
      $scope.heroes.splice(index, 1);
  }

}]);