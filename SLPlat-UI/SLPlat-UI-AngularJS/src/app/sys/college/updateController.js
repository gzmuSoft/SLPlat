'use strict';

angular.module('app')
    .controller('collegeUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
        function ($scope, $rootScope, $state, $timeout, toaster) {
            var title = "";
            var defaultAva = $rootScope.defaultAvatar;
            $scope.myImage = '';
            $scope.myCroppedImage = '';
            $scope.param = {};
            if ($state.includes('**.college.update')) {
                title = "编辑学院";
                var id = $state.params.id;
                activate(id);
                validate(id);
                loadParent(id);
            } else if ($state.includes('**.college.create')) {
                title = "添加学院";
                validate(null);
                loadParent(null);
                setTimeout(function () {
                    $scope.myCroppedImage = defaultAva;
                    !$rootScope.$$phase && $scope.$apply();
                }, 300);
            }
            $scope.title = $rootScope.title = title;
            $scope.loading = true;

            //初始化验证
            //validate($scope);
            $scope.submit = function () {
                var m = $scope.record;
                if (m) {
                    $scope.isDisabled = true;//提交disabled
                    $scope.record.schoolId = $scope.recordSchoolId;
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        url: '/college',
                        data: angular.toJson($scope.record)
                    }).then(callback);
                }
                function callback(result) {
                    if (result.code == 200) {//成功
                        toaster.clear('*');
                        toaster.pop('success', '', "保存成功");
                        $timeout(function () {
                            $state.go('main.student.college.list');
                        }, 2000);
                    } else {
                        toaster.clear('*');
                        toaster.pop('error', '', result.msg);
                        $scope.isDisabled = false;
                    }
                }
            }

            //加载所属学校信息
            function loadParent(id) {
                $scope.loading = true;
                $.ajax({
                    type: 'PUT',
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    url: '/school/read/page',
                    data: angular.toJson($scope.param)
                }).then(function (result) {
                    $scope.loading = false;
                    if (result.code == 200) {
                        $scope.schoolNames = result.rows;
                        console.log($scope.schoolNames );
                        var i = 0;
                        if (id != null) {
                            for (var item in $scope.schoolNames) {
                                if ($scope.record.schoolId != null && item == $scope.record.schoolId) {
                                    $scope.recordSchoolId = item;
                                    console.log($scope.record.schoolId);
                                    break;
                                }
                                i++;
                            }
                        }/**
                         * 编辑学院
                         */
                        if (i == $scope.schoolNames.length || id == null) $scope.recordSchoolId = "0";
                    } else {
                        $scope.msg = result.msg;
                    }
                    $scope.$apply();
                });
            }

            // 初始化页面
            function activate(id) {
                $scope.loading = true;
                $.ajax({
                    type: 'PUT',
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    url: '/college/read/detail',
                    data: angular.toJson({'id': id})
                }).then(function (result) {
                    $scope.loading = false;
                    if (result.code == 200) {
                        $scope.record = result.data;
                    } else {
                        $scope.msg = result.msg;
                    }
                    $scope.$apply();
                });
            }

            //表单验证
            function validate(userId) {
                jQuery('form').validate({
                    rules: {
                        name: {
                            required: true,
                            stringCheck: [],
                            maxLengthB: [50]
                        },
                        sortNo: {
                            required: true
                        }
                    },
                    messages: {
                        name: {
                            required: '请填写学院名称',
                            maxLengthB: "学院名称不得超过{0}个字符"
                        },
                        sortNo: {
                            required: '请填写排序'
                        }
                    },
                    submitHandler: function () {
                        $scope.submit();
                    }
                });
            }

        }]);