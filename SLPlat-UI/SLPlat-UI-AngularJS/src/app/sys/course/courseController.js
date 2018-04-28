'use strict';

angular.module('app')
    .controller('courseController', [ '$rootScope', '$scope', '$http', '$state',
        function($rootScope, $scope, $http, $state) {
            $scope.title = '课程管理';
            $scope.param = { };
            $scope.loading = false;

            $scope.search = function () {
                $scope.loading = true;
                $.ajax({
                    type: 'PUT',
                    dataType: 'json',
                    contentType:'application/json;charset=UTF-8',
                    url : '/course/read/page',
                    data: angular.toJson($scope.param)
                }).then(function(result) {
                    $scope.loading = false;
                    if (result.code == 200) {
                        $scope.pageInfo = result;
                        console.log($scope.pageInfo.rows);
                    } else {
                        $scope.msg = result.msg;
                    }
                    $scope.$apply();
                });
            }

            $scope.search();

            $scope.clearSearch = function() {
                $scope.param.keyword= null;
                $scope.search();
            }

            $scope.disableItem = function(id, enable) {
                this.item.enable = enable;
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    url: '/course',
                    data: angular.toJson(this.item)
                }).then(function (result) {
                    if (result.code == 200) {
                        $state.reload();
                    } else {
                        //不执行任何操作
                    }
                });
            }

            // 翻页
            $scope.pagination = function (page) {
                $scope.param.pageNumber=page;
                $scope.search();
            };
        } ]);