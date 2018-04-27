'use strict';

angular.module('app')
    .controller('repasswordController',[ '$rootScope', '$scope', '$http', '$state', function($rootScope, $scope, $http, $state) {
        $scope.user = {};
        $scope.repassword = function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType:'application/json;charset=UTF-8',
                url : '/repassword',
                data: angular.toJson($scope.user)
            }).then(function () {
            })
            console.log($scope.user)
        }

    } ]);