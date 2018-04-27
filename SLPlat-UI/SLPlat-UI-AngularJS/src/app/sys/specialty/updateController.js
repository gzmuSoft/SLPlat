'use strict';
angular.module('app')
    .controller('specialtyUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
        function ($scope, $rootScope, $state, $timeout, toaster) {
            var title = "";
            var defaultAva = $rootScope.defaultAvatar;
            $scope.myImage = '';
            $scope.myCroppedImage = '';
            $scope.param = {};
            if ($state.includes('**.specialty.update')) {
                title = "编辑专业";
                var id = $state.params.id;
                activate(id);
                validate(id);
                loadSchool(id);
            } else if ($state.includes('**.specialty.create')) {
                title = "添加专业";
                validate(null);
                loadSchool(null);
                setTimeout(function () {
                    $scope.myCroppedImage = defaultAva;
                    !$rootScope.$$phase && $scope.$apply();
                }, 300);

            }//调用的函数块

            $scope.title = $rootScope.title = title;
            $scope.loading = true;

            $scope.submit = function () {
                var m = $scope.record;
                if (m) {
                    $scope.isDisabled = true;//提交disabled
                    $scope.record.schoolId = $scope.recordSchoolId;
                    $scope.record.collegeId = $scope.recordCollegeId;
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        url: '/specialty',
                        data: angular.toJson($scope.record)
                    }).then(callback);
                }
                function callback(result) {
                    if (result.code == 200) {//成功
                        toaster.clear('*');
                        toaster.pop('success', '', "保存成功");
                        $timeout(function () {
                            $state.go('main.student.specialty.list');
                        }, 2000);
                    } else {
                        toaster.clear('*');
                        toaster.pop('error', '', result.msg);
                        $scope.isDisabled = false;
                    }
                }
            };//初始化验证

            function activate(id) {
                $scope.loading = true;
                $.ajax({
                    type: 'PUT',
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    url: '/specialty/read/detail',
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
            }// 初始化页面

            function loadSchool(id) {
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
                        if (id == null) {
                            $scope.recordSchoolId = "0";
                            $scope.recordCollegeId = "0";
                        }
                        if (id != null) {
                            $scope.recordSchoolId = $scope.record.schoolId;
                            $scope.schoolChange();
                            $scope.recordCollegeId = $scope.record.collegeId;
                        }
                        console.log($scope.recordSchoolId);
                    } else {
                        $scope.msg = result.msg;
                    }
                    $scope.$apply();
                });
            }//加载学校信息

            $scope.schoolChange = function () {
                var schoolId = $scope.recordSchoolId;
                $scope.loading = true;
                if (schoolId != null) {
                    $.ajax({
                        type: 'PUT',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        url: '/college/read/page',
                        data: angular.toJson($scope.param)
                    }).then(function (result) {
                        $scope.loading = false;
                        if (result.code == 200) {
                            $scope.collegeNames = result.rows;
                        }
                        else {
                            $scope.msg = result.msg;
                        }
                        $scope.$apply();
                    })
                }
            };//加载学院信息

            function validate(userId) {
                jQuery('form').validate({
                    rules: {
                        name: {
                            required: true,
                            stringCheck: [],
                            maxLengthB: [20]
                        },
                        sortNo: {
                            required: true,
                            number: true
                        },
                        schoolId: {
                            schoolId: "schoolId"
                        },
                        collegeId: {
                            collegeId: "collegeId"
                        }
                    },
                    messages: {
                        name: {
                            required: '你填写专业名称',
                            maxLengthB: "专业名称不得超过{0}个字符"
                        },
                        sortNo: {
                            required: '请填写排序',
                            number: '小伙子，排序必须为数字~'
                        }
                    },
                    submitHandler: function () {
                        $scope.submit();
                    }
                });
                $.validator.addMethod("schoolId", function (value) {
                    if (value != null) {
                        return true;
                    }
                }, "请选择一个学校");
                $.validator.addMethod("collegeId", function (value) {
                    if (value != null) {
                        return true;
                    }
                }, "请选择一个学院")
            }//表单验证

        }]);