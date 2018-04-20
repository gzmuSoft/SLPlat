/**
 * Created by Administrator on 2018/1/30.
 */
'use strict';

angular.module('app')
    .controller('provinceUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
        function($scope, $rootScope, $state, $timeout, toaster) {
            var title = "";
            var defaultAva = $rootScope.defaultAvatar;
            $scope.myImage='';
            // $scope.myCroppedImage=$scope.myCroppedImage ;
            $scope.myCroppedImage = '';
            $scope.param = {};
            if($state.includes('**.province.update')){
                title="编辑省会";
                var id = $state.params.id;
                activate(id);
                validate(id);
            }else if($state.includes('**.province.create')){
                title="添加省会";
                validate(null);
                setTimeout(function(){
                    $scope.myCroppedImage = defaultAva;
                    !$rootScope.$$phase && $scope.$apply();
                },300);

            }
            $scope.title = $rootScope.title = title;
            $scope.loading = true;
            //初始化验证
            //validate($scope);
            $scope.submit= function(){
                var m = $scope.record;
                if(m){
                    $scope.isDisabled = true;//提交disabled
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType:'application/json;charset=UTF-8',
                        url : '/province',
                        data: angular.toJson($scope.record)
                    }).then(callback);
                }
                function callback(result) {
                    if(result.code ==200){//成功
                        toaster.clear('*');
                        toaster.pop('success', '', "保存成功");
                        $timeout(function(){
                            $state.go('main.sys.province.list');
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
                    url : '/province/read/detail',
                    data: angular.toJson({'id': id})
                }).then(function(result) {
                    if (result.code == 200) {
                        $scope.record = result.data;
                        $scope.$apply();
                    } else {
                        $scope.msg = result.msg;
                    }
                });
            }

            //表单验证
            function validate(userId){
                jQuery('form').validate({
                    rules: {
                        provinceName: {
                            required: true,
                            stringCheck:[],
                            maxLengthB:[20]
                        },
                        sortNo: {
                            required: true
                        }
                    },
                    messages: {
                        provinceName: {
                            required: '请填写学校名称',
                            maxLengthB:"学校名称不得超过{0}个字符"
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