'use strict';
angular.module('app')
    .controller('classUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
        function ($scope, $rootScope, $state, $timeout, toaster) {
            var title = "";
            $scope.param = {};
            if ($state.includes('**.class.update')) {
                title = "编辑班级";
                var id = $state.params.id;
                activate(id);
                validate(id);
            } else if ($state.includes('**.class.create')) {
                title = "添加班级";
                validate(null);
                loadSchool(null);
            }//调用的函数块

            $scope.title = $rootScope.title = title;
            $scope.loading = true;

            $scope.submit = function () {
                var m = $scope.record;
                if (m) {
                    $scope.isDisabled = true;//提交disabled
                    $scope.record.collegeId = $scope.recordCollegeId;
                    $scope.record.specialtyId = $scope.recordSpecialtyId;
                    $scope.record.schoolId = $scope.recordSchoolId;
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        url: '/class',
                        data: angular.toJson($scope.record)
                    }).then(callback);
                }
                function callback(result) {
                    if (result.code == 200) {//成功
                        toaster.clear('*');
                        toaster.pop('success', '', "保存成功");
                        $timeout(function () {
                            $state.go('main.baseInfo.class.list');
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
                    url: '/class/read/infoOne',
                    data: angular.toJson({'id': id})
                }).then(function (result) {
                    $scope.loading = false;
                    if (result.code == 200) {
                        $scope.record = result.data;
                        $scope.record.collegeId = $scope.record.specialty.collegeId;
                        $scope.record.schoolId = $scope.record.specialty.college.schoolId;
                        loadSchool($scope.record.schoolId);
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
                    url: '/specialty/read/hierarchy',
                    data: angular.toJson($scope.param)
                }).then(function (result) {
                    $scope.loading = false;
                    if (result.code == 200) {
                        $scope.schoolNames = result.rows;
                        if (id == null) {
                            $scope.recordSchoolId = "0";
                            $scope.recordCollegeId = "0";
                            $scope.recordSpecialtyId = "0";
                        }else{
                            $scope.recordSchoolId = $scope.record.schoolId;
                            $scope.schoolChange();
                            $scope.recordCollegeId = $scope.record.collegeId;
                            $scope.collegeChange();
                            $scope.recordSpecialtyId = $scope.record.specialtyId;
                        }
                    } else {
                        $scope.msg = result.msg;
                    }
                    $scope.$apply();
                });
            }//加载学校信息

            $scope.schoolChange = function () {
                $scope.collegeNames = null;
                $scope.specialtyNames = null;
                var schoolId = $scope.recordSchoolId;
                $scope.schoolNames.every(function (school) {
                    if (school.id == schoolId && school.collegeList[0].name !== ''){
                        $scope.collegeNames = school.collegeList;
                        return false;
                    }
                    return true;
                });
                $scope.recordCollegeId = "0";
                $scope.recordSpecialtyId = "0";
            };//根据学校Id加载学院

            $scope.collegeChange = function () {
                $scope.specialtyNames = null;
                var collegeId = $scope.recordCollegeId;
                $scope.collegeNames.every(function (college) {
                    if (collegeId == college.id && college.specialtyList[0].name !== ''){
                        $scope.specialtyNames = college.specialtyList;
                        return false;
                    }
                    return true;
                });
                $scope.recordSpecialtyId = "0";
            };//根据学院Id加载专业

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
                        },
                        specialtyId: {
                            specialtyId: "specialtyId"
                        }
                    },
                    messages: {
                        name: {
                            required: '请填写班级名称',
                            maxLengthB: "专业名称不得超过{0}个字符"
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
                $.validator.addMethod("specialtyId", function (value) {
                    if (value != null) {
                        return true;
                    }
                }, "请选择一个专业")
            }//表单验证
        }]);