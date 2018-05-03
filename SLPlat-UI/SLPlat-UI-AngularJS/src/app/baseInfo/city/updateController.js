'use strict';

angular.module('app')
    .controller('cityUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
        function($scope, $rootScope, $state, $timeout, toaster) {
            var title = "";
            $scope.param = {};
            if($state.includes('**.city.update')){
                title="编辑市";
                var id = $state.params.id;
                activate(id);
                validate(id);
                loadParent(id);
            }else if($state.includes('**.city.create')){
                title="添加市";
                validate(null);
                loadParent(null);
            }
            $scope.title = $rootScope.title = title;
            $scope.loading = true;

            //初始化验证
            //validate($scope);
            $scope.submit= function(){
                var m = $scope.record;
                if(m){
                    $scope.isDisabled = true;//提交disabled
                    $scope.record.provinceId = $scope.recordProvinceId;
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType:'application/json;charset=UTF-8',
                        url : '/city',
                        data: angular.toJson($scope.record)
                    }).then(callback);
                }
                function callback(result) {
                    if(result.code ==200){//成功
                        toaster.clear('*');
                        toaster.pop('success', '', "保存成功");
                        $timeout(function(){
                            $state.go('main.baseInfo.city.list');
                        },2000);
                    }else{
                        toaster.clear('*');
                        toaster.pop('error', '', result.msg);
                        $scope.isDisabled = false;
                    }
                }
            }

            //加载上级省信息
            function loadParent(id) {
                $scope.loading = true;
                $.ajax({
                    type: 'PUT',
                    dataType: 'json',
                    contentType:'application/json;charset=UTF-8',
                    url : '/province/read/page',
                    data: angular.toJson($scope.param)
                }).then(function(result) {
                    $scope.loading = false;
                    if (result.code == 200) {
                        $scope.provinceNames = result.rows;
                        var i = 0;
                        if(id != null) {
                            for (var item in $scope.provinceNames) {
                                if ($scope.record.provinceId != null && item == $scope.record.provinceId) {
                                    $scope.recordProvinceId = item;
                                    break;
                                }
                                i++;
                            }
                        }
                        if(i == $scope.provinceNames.length || id == null)$scope.recordProvinceId="0";
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
                    contentType:'application/json;charset=UTF-8',
                    url : '/city/read/detail',
                    data: angular.toJson({'id': id})
                }).then(function(result) {
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
            function validate(userId){
                jQuery('form').validate({
                    rules: {
                        name: {
                            required: true,
                            stringCheck:[],
                            maxLengthB:[50]
                        },
                        sortNo: {
                            required: true
                        }
                    },
                    messages: {
                        name: {
                            required: '请填写市名称',
                            maxLengthB:"市名称不得超过{0}个字符"
                        },
                        sortNo: {
                            required: '请填写排序'
                        }
                    },
                    submitHandler: function() {
                        $scope.submit();
                    }
                });
            }

        }]);