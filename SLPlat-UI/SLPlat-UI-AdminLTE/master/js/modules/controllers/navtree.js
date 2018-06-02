/**=========================================================
 * Module: access-login.js
 * Demo for login api
 =========================================================*/

App.controller('AbnTestController', ['$scope', '$timeout', '$resource', function($scope, $timeout, $resource) {

  $scope.my_tree_handler = function(branch) {

    $scope.output = "You selected: " + branch.label;

    if (branch.data && branch.data.description) {
      $scope.output += '(' + branch.data.description + ')';
      return $scope.output;
    }
  };

  // onSelect event handlers
  var apple_selected = function(branch) {
    $scope.output = "APPLE! : " + branch.label;
    return $scope.output;
  };

  var treedata_avm = [
    {
      label: 'Animal',
      children: [
        {
          label: 'Dog',
          data: {
            description: "man's best friend"
          }
        }, {
          label: 'Cat',
          data: {
            description: "Felis catus"
          }
        }, {
          label: 'Hippopotamus',
          data: {
            description: "hungry, hungry"
          }
        }, {
          label: 'Chicken',
          children: ['White Leghorn', 'Rhode Island Red', 'Jersey Giant']
        }
      ]
    }, {
      label: 'Vegetable',
      data: {
        definition: "A plant or part of a plant used as food, typically as accompaniment to meat or fish, such as a cabbage, potato, carrot, or bean.",
        data_can_contain_anything: true
      },
      onSelect: function(branch) {
        $scope.output = "Vegetable: " + branch.data.definition;
        return $scope.output;
      },
      children: [
        {
          label: 'Oranges'
        }, {
          label: 'Apples',
          children: [
            {
              label: 'Granny Smith',
              onSelect: apple_selected
            }, {
              label: 'Red Delicous',
              onSelect: apple_selected
            }, {
              label: 'Fuji',
              onSelect: apple_selected
            }
          ]
        }
      ]
    }, {
      label: 'Mineral',
      children: [
        {
          label: 'Rock',
          children: ['Igneous', 'Sedimentary', 'Metamorphic']
        }, {
          label: 'Metal',
          children: ['Aluminum', 'Steel', 'Copper']
        }, {
          label: 'Plastic',
          children: [
            {
              label: 'Thermoplastic',
              children: ['polyethylene', 'polypropylene', 'polystyrene', ' polyvinyl chloride']
            }, {
              label: 'Thermosetting Polymer',
              children: ['polyester', 'polyurethane', 'vulcanized rubber', 'bakelite', 'urea-formaldehyde']
            }
          ]
        }
      ]
    }
  ];
  
  var treedata_geography = [
    {
      label: 'North America',
      children: [
        {
          label: 'Canada',
          children: ['Toronto', 'Vancouver']
        }, {
          label: 'USA',
          children: ['New York', 'Los Angeles']
        }, {
          label: 'Mexico',
          children: ['Mexico City', 'Guadalajara']
        }
      ]
    }, {
      label: 'South America',
      children: [
        {
          label: 'Venezuela',
          children: ['Caracas', 'Maracaibo']
        }, {
          label: 'Brazil',
          children: ['Sao Paulo', 'Rio de Janeiro']
        }, {
          label: 'Argentina',
          children: ['Buenos Aires', 'Cordoba']
        }
      ]
    }
  ];

  $scope.my_data = treedata_avm;
  $scope.try_changing_the_tree_data = function() {
    if ($scope.my_data === treedata_avm) {
      $scope.my_data = treedata_geography;
    } else {
      $scope.my_data = treedata_avm;
    }
    return $scope.my_data;
  };
  
  var tree;
  // This is our API control variable
  $scope.my_tree = tree = {};
  $scope.try_async_load = function() {
    
    $scope.my_data = [];
    $scope.doing_async = true;
    
    // Request tree data via $resource
    var remoteTree = $resource('server/treedata.json');
    
    return remoteTree.get(function(res){
      
      $scope.my_data = res.data;

      $scope.doing_async = false;
    
      return tree.expand_all();
    
    // we must return a promise so the plugin 
    // can watch when it's resolved
    }).$promise;
  };
  
  // Adds a new branch to the tree
  $scope.try_adding_a_branch = function() {
    var b;
    b = tree.get_selected_branch();
    return tree.add_branch(b, {
      label: 'New Branch',
      data: {
        something: 42,
        "else": 43
      }
    });
  };
  
}]);
