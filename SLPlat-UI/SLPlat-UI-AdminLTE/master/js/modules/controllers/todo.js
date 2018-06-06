App.controller("TodoController", ['$scope', '$filter', function($scope, $filter) {
  
  $scope.items = [
    {
      todo: {title: "Meeting with Mark at 7am.", description: "Pellentesque convallis mauris eu elit imperdiet quis eleifend quam aliquet. "},
      complete: true
    },
    {
      todo: {title: "Call Sonya. Talk about the new project.", description: ""},
      complete: false
    },
    {
      todo: {title: "Find a new place for vacations", description: ""},
      complete: false
    }
    ];
  
  $scope.editingTodo = false;
  $scope.todo = {};

  $scope.addTodo = function() {
    
    if( $scope.todo.title === "" ) return;
    if( !$scope.todo.description ) $scope.todo.description = "";
    
    if( $scope.editingTodo ) {
      $scope.todo = {};
      $scope.editingTodo = false;
    }
    else {
      $scope.items.push({todo: angular.copy($scope.todo), complete: false});
      $scope.todo.title = "";
      $scope.todo.description = "";
    }
  };
  
  $scope.editTodo = function(index, $event) {
    $event.preventDefault();
    $event.stopPropagation();
    $scope.todo = $scope.items[index].todo;
    $scope.editingTodo = true;
  };

  $scope.removeTodo = function(index, $event) {
    $scope.items.splice(index, 1);
  };
  
  $scope.clearAll = function() {
    $scope.items = [];
  };

  $scope.totalCompleted = function() {
    return $filter("filter")($scope.items, function(item){
      return item.complete;
    }).length;
  };

  $scope.totalPending = function() {
    return $filter("filter")($scope.items, function(item){
      return !item.complete;
    }).length;
  };
}]);