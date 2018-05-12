'use strict';

angular.module('app')
    .controller('chapterAndSectionsUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
        function($scope, $rootScope, $state, $timeout, toaster) {
            var title = "";
            $scope.param = {};
            if($state.includes('**.chapterAndSections.update')){
                title="编辑章节";
                var id = $state.params.id;
                activate(id);
                validate(id);
                loadParent(id);
            }else if($state.includes('**.chapterAndSections.create')){
                title="添加章节";
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
                    $scope.record.courseId = $scope.recordCourseId;
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType:'application/json;charset=UTF-8',
                        url : '/chapterAndSections',
                        data: angular.toJson($scope.record)
                    }).then(callback);
                }
                function callback(result) {
                    if(result.code ==200){//成功
                        toaster.clear('*');
                        toaster.pop('success', '', "保存成功");
                        $timeout(function(){
                            $state.go('main.baseInfo.chapterAndSections.list');
                        },2000);
                    }else{
                        toaster.clear('*');
                        toaster.pop('error', '', result.msg);
                        $scope.isDisabled = false;
                    }
                }
            }

            //加载上级课程信息
            function loadParent(id) {
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
                        $scope.courseNames = result.rows;
                        var i = 0;
                        if(id != null) {
                            for (var item in $scope.courseNames) {
                                if ($scope.record.courseId != null && item == $scope.record.courseId) {
                                    $scope.recordCourseId = item;
                                    break;
                                }
                                i++;
                            }
                        }
                        if(i == $scope.courseNames.length || id == null)$scope.recordCourseId="0";
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
                    url : '/chapterAndSections/read/detail',
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
                            required: '请填写章节名称',
                            maxLengthB:"章节名称不得超过{0}个字符"
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