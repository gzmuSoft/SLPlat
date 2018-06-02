'use strict';
angular.module('app')
    .controller('programUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
        function ($scope, $rootScope, $state, $timeout, toaster) {
            var title = "";
            $scope.param = {};
            if ($state.includes('**.program.update')) {
                title = "编辑题目";
                var id = $state.params.id;
                activate(id);
                validate(id);
                loadProvince(id);
            } else if ($state.includes('**.program.create')) {
                title = "添加题目";
                validate(null);
                loadProvince(null);
            }//调用的函数块

            $scope.title = $rootScope.title = title;
            $scope.loading = true;

            $scope.submit = function () {
                var m = $scope.record;
                if (m) {
                    $scope.isDisabled = true;//提交disabled
                    $scope.record.courseId = $scope.recordCourseId;
                    $scope.record.sectionId = $scope.recordSctionId;
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        url: '/program',
                        data: angular.toJson($scope.record)
                    }).then(callback);
                }
                function callback(result) {
                    if (result.code == 200) {//成功
                        toaster.clear('*');
                        toaster.pop('success', '', "保存成功");
                        $timeout(function () {
                            $state.go('main.baseInfo.program.list');
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
                    url: '/program/read/detail',
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

            function loadProvince(id) {
                $scope.loading = true;
                $.ajax({
                    type: 'PUT',
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    url: '/course/read/page',
                    data: angular.toJson($scope.param)
                }).then(function (result) {
                    $scope.loading = false;
                    if (result.code == 200) {
                        $scope.courseNames = result.rows;
                        console.log($scope.courseNames);
                        if (id == null) {
                            $scope.recordCourseId = "0";
                            $scope.recordSectionId = "0";
                        }else {
                            $scope.recordCourseId = $scope.record.courseId;
                            $scope.courseChange();
                            $scope.recordSectionId = $scope.record.sectionId;
                        }
                    } else {
                        $scope.msg = result.msg;
                    }
                    $scope.$apply();
                });
            }//加载省信息

            $scope.courseChange = function () {
                var courseId = $scope.recordCourseId;
                $scope.loading = true;
                if (courseId != null) {
                    $.ajax({
                        type: 'PUT',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        url: '/section/read/page',
                        data: angular.toJson($scope.param)
                    }).then(function (result) {
                        $scope.loading = false;
                        if (result.code == 200) {
                            $scope.sectionNames = result.rows;
                        }
                        else {
                            $scope.msg = result.msg;
                        }
                        $scope.$apply();
                    })
                }
            };//根据省Id获取市名称

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
                        courseId: {
                            schoolId: "courseId"
                        },
                        sectionId: {
                            collegeId: "sectionId"
                        }
                    },
                    messages: {
                        name: {
                            required: '你填写区/县名称',
                            maxLengthB: "区/县名称不得超过{0}个字符"
                        },
                        sortNo: {
                            required: '请填写排序',
                            number: '排序必须为数字~'
                        }
                    },
                    submitHandler: function () {
                        $scope.submit();
                    }
                });
                $.validator.addMethod("courseId", function (value) {
                    if (value != null) {
                        return true;
                    }
                }, "请选择一门课程");
                $.validator.addMethod("sectionId", function (value) {
                    if (value != null) {
                        return true;
                    }
                }, "请选择一个章节")
            }//表单验证

        }]);