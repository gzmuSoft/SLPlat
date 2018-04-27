'use strict';
angular.module('app')
    .controller('countyUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
        function ($scope, $rootScope, $state, $timeout, toaster) {
            var title = "";
            var defaultAva = $rootScope.defaultAvatar;
            $scope.myImage = '';
            $scope.myCroppedImage = '';
            $scope.param = {};
            if ($state.includes('**.county.update')) {
                title = "编辑县城";
                var id = $state.params.id;
                activate(id);
                validate(id);
                loadProvince(id);
            } else if ($state.includes('**.county.create')) {
                title = "添加县城";
                validate(null);
                loadProvince(null);
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
                    $scope.record.provinceId = $scope.recordProvinceId;
                    $scope.record.cityId = $scope.recordCityId;
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        url: '/county',
                        data: angular.toJson($scope.record)
                    }).then(callback);
                }
                function callback(result) {
                    if (result.code == 200) {//成功
                        toaster.clear('*');
                        toaster.pop('success', '', "保存成功");
                        $timeout(function () {
                            $state.go('main.site.county.list');
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
                    url: '/county/read/detail',
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
                    url: '/province/read/page',
                    data: angular.toJson($scope.param)
                }).then(function (result) {
                    $scope.loading = false;
                    if (result.code == 200) {
                        $scope.provinceNames = result.rows;
                        console.log($scope.provinceNames);
                        if (id == null) {
                            $scope.recordProvinceId = "0";
                            $scope.recordCityId = "0";
                        }else {
                            $scope.recordProvinceId = $scope.record.provinceId;
                            $scope.provinceChange();
                            $scope.recordCityId = $scope.record.cityId;
                        }
                    } else {
                        $scope.msg = result.msg;
                    }
                    $scope.$apply();
                });
            }//加载省会信息

            $scope.provinceChange = function () {
                var provinceId = $scope.recordProvinceId;
                $scope.loading = true;
                if (provinceId != null) {
                    $.ajax({
                        type: 'PUT',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        url: '/city/read/page',
                        data: angular.toJson({'provinceId': provinceId})
                    }).then(function (result) {
                        $scope.loading = false;
                        if (result.code == 200) {
                            $scope.cityNames = result.rows;
                        }
                        else {
                            $scope.msg = result.msg;
                        }
                        $scope.$apply();
                    })
                }
            };//根据省会Id获取城市名称

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
                        provinceId: {
                            schoolId: "provinceId"
                        },
                        cityId: {
                            collegeId: "cityId"
                        }
                    },
                    messages: {
                        name: {
                            required: '你填写县城名称',
                            maxLengthB: "县城名称不得超过{0}个字符"
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
                $.validator.addMethod("provinceId", function (value) {
                    if (value != null) {
                        return true;
                    }
                }, "请选择一个学校");
                $.validator.addMethod("cityId", function (value) {
                    if (value != null) {
                        return true;
                    }
                }, "请选择一个学院")
            }//表单验证

        }]);