'use strict';

angular.module('app')
    .controller('courseUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
        function($scope, $rootScope, $state, $timeout, toaster) {
            var title = "";
            $scope.param = {};
            if($state.includes('**.course.update')){
                title="编辑课程";
                var id = $state.params.id;
                activate(id);
                validate(id);
                loadParent(id);
                loadParent1(id);
            }else if($state.includes('**.course.create')){
                title="添加课程";
                validate(null);
                loadParent(null);
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
                    $scope.record.specialtyId = $scope.recordSpecialtyId;
                    $scope.record.typeId = $scope.recordTypeId;
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType:'application/json;charset=UTF-8',
                        url : '/course',
                        data: angular.toJson($scope.record)
                    }).then(callback);
                }
                function callback(result) {
                    if(result.code ==200){//成功
                        toaster.clear('*');
                        toaster.pop('success', '', "保存成功");
                        $timeout(function(){
                            $state.go('main.message.course.list');
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
                    url : '/course/read/detail',
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

            //加载所属专业信息
            function loadParent1(id) {
                $scope.loading = true;
                $.ajax({
                    type: 'PUT',
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    url: '/specialty/read/page',
                    data: angular.toJson($scope.param)
                }).then(function (result) {
                    $scope.loading = false;
                    if (result.code == 200) {
                        $scope.specialtyNames = result.rows;
                        console.log($scope.specialtyNames );
                        var i = 0;
                        if (id != null) {
                            for (var item in $scope.specialtyNames) {
                                if ($scope.record.specialtyId != null && item == $scope.record.specialtyId) {
                                    $scope.recordSpecialtyId = item;
                                    console.log($scope.record.specialtyId);
                                    break;
                                }
                                i++;
                            }
                        }
                        if (i == $scope.specialtyNames.length || id == null) $scope.recordSpecialtyId = "0";
                    } else {
                        $scope.msg = result.msg;
                    }
                    $scope.$apply();
                });
            }

            //加载课程类型信息
            function loadParent(id) {
                $scope.loading = true;
                $.ajax({
                    type: 'PUT',
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    url: '/courseType/read/page',
                    data: angular.toJson($scope.param)
                }).then(function (result) {
                    $scope.loading = false;
                    if (result.code == 200) {
                        $scope.typeNames = result.rows;
                        console.log($scope.typeNames );
                        var i = 0;
                        if (id != null) {
                            for (var item in $scope.typeNames) {
                                if ($scope.record.typeId != null && item == $scope.record.typeId) {
                                    $scope.recordTypeId = item;
                                    console.log($scope.record.typeId);
                                    break;
                                }
                                i++;
                            }
                        }
                        if (i == $scope.typeNames.length || id == null) $scope.recordTypeId = "0";
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