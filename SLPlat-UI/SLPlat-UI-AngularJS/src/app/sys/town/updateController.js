/**
 * Created by Administrator on 2018/1/31.
 */
'use strict';
angular.module('app')
    .controller('townUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
        function ($scope, $rootScope, $state, $timeout, toaster) {
            var title = "";
            var defaultAva = $rootScope.defaultAvatar;
            $scope.myImage = '';
            $scope.myCroppedImage = '';
            $scope.param = {};
            if ($state.includes('**.town.update')) {
                title = "编辑乡镇";
                var id = $state.params.id;
                activate(id);
                validate(id);
                loadProvince(id);
            } else if ($state.includes('**.town.create')) {
                title = "添加乡镇";
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
                    $scope.record.countyId = $scope.recordCountyId;
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        url: '/town',
                        data: angular.toJson($scope.record)
                    }).then(callback);
                }
                function callback(result) {
                    if (result.code == 200) {//成功
                        toaster.clear('*');
                        toaster.pop('success', '', "保存成功");
                        $timeout(function () {
                            $state.go('main.sys.town.list');
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
                    url: '/town/read/detail',
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
                    url: '/province/read/list',
                    data: angular.toJson($scope.param)
                }).then(function (result) {
                    $scope.loading = false;
                    if (result.code == 200) {
                        $scope.provinceNames = result.rows;
                        if (id == null) {
                            $scope.recordProvinceId = "0";
                            $scope.recordCityId = "0";
                            $scope.recordCountyId = "0";
                        }
                        if (id != null) {
                            $scope.recordProvinceId = $scope.record.provinceId;
                            $scope.provinceChange();
                            $scope.recordCityId = $scope.record.cityId;
                            $scope.cityChange();
                            $scope.recordCountyId = $scope.record.countyId;
                        }
                    } else {
                        $scope.msg = result.msg;
                    }
                    $scope.$apply();
                });
            }//加载学校信息

            $scope.provinceChange = function () {
                var provinceId = $scope.recordProvinceId;
                $scope.loading = true;
                if (provinceId != null) {
                    $.ajax({
                        type: 'PUT',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        url: '/city/read/listByProvinceId',
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
            };//根据学校Id加载学院

            $scope.cityChange = function () {
                var cityId = $scope.recordCityId;
                $scope.loading = true;
                if (cityId != null) {
                    $.ajax({
                        type: 'PUT',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        url: '/county/read/listByCityId',
                        data: angular.toJson({'cityId': cityId})
                    }).then(function (result) {
                        $scope.loading = false;
                        if (result.code == 200) {
                            $scope.countyNames = result.rows;
                        }
                        else {
                            $scope.msg = result.msg;
                        }
                        $scope.$apply();
                    })
                }
            };//根据学院Id加载专业

            function validate(userId) {
                jQuery('form').validate({
                    rules: {
                        townName: {
                            required: true,
                            stringCheck: [],
                            maxLengthB: [20]
                        },
                        sortNo: {
                            required: true,
                            number: true
                        },
                        provinceId: {
                            provinceId: "provinceId"
                        },
                        cityId: {
                            cityId: "cityId"
                        },
                        countyId: {
                            countyId: "countyId"
                        }
                    },
                    messages: {
                        townName: {
                            required: '请填写乡镇名称',
                            maxLengthB: "乡镇名称不得超过{0}个字符"
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
                }, "请选择一个省会");
                $.validator.addMethod("cityId", function (value) {
                    if (value != null) {
                        return true;
                    }
                }, "请选择一个城市")
                $.validator.addMethod("countyId", function (value) {
                    if (value != null) {
                        return true;
                    }
                }, "请选择一个县城")
            }//表单验证
        }]);