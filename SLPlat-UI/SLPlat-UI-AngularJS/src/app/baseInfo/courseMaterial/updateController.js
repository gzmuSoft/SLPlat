'use strict';

angular.module('app')
    .controller('courseMaterialUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
        function($scope, $rootScope, $state, $timeout, toaster) {
            var title = "";
            $scope.param = {};
            if($state.includes('**.courseMaterial.update')){
                title="编辑课程教材";
                var id = $state.params.id;
                activate(id);
                validate(id);
                loadParent1(id);
            }else if($state.includes('**.courseMaterial.create')){
                title="添加课程教材";
                validate(null);
                loadParent1(null);
            }
            $scope.title = $rootScope.title = title;
            $scope.loading = true;

            //初始化验证
            //validate($scope);
            $scope.submit= function(){
                var m = $scope.record;
                if(m){
                    $scope.isDisabled = true;//提交disabled
                    $scope.record.publisherId = $scope.recordPublisherId;
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType:'application/json;charset=UTF-8',
                        url : '/courseMaterial',
                        data: angular.toJson($scope.record)
                    }).then(callback);
                }
                function callback(result) {
                    if(result.code ==200){//成功
                        toaster.clear('*');
                        toaster.pop('success', '', "保存成功");
                        $timeout(function(){
                            $state.go('main.baseInfo.courseMaterial.list');
                        },2000);
                    }else{
                        toaster.clear('*');
                        toaster.pop('error', '', result.msg);
                        $scope.isDisabled = false;
                    }
                }
            }

            // 初始化页面
            function activate(id) {
                $scope.loading = true;
                $.ajax({
                    type: 'PUT',
                    dataType: 'json',
                    contentType:'application/json;charset=UTF-8',
                    url : '/courseMaterial/read/detail',
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

            //加载所属出版社信息
            function loadParent1(id) {
                $scope.loading = true;
                $.ajax({
                    type: 'PUT',
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    url: '/publisher/read/page',
                    data: angular.toJson($scope.param)
                }).then(function (result) {
                    $scope.loading = false;
                    if (result.code == 200) {
                        $scope.publisherNames = result.rows;
                        console.log($scope.publisherNames );
                        var i = 0;
                        if (id != null) {
                            for (var item in $scope.publisherNames) {
                                if ($scope.record.publisherId != null && item == $scope.record.publisherId) {
                                    $scope.recordPublisherId = item;
                                    console.log($scope.record.publisherId);
                                    break;
                                }
                                i++;
                            }
                        }
                        if (i == $scope.publisherNames.length || id == null) $scope.recordPublisherId = "0";
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
                            maxLengthB:[20]
                        },
                        sortNo: {
                            required: true
                        }
                    },
                    messages: {
                        name: {
                            required: '请填写课程名称',
                            maxLengthB:"课程类型名称不得超过{0}个字符"
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