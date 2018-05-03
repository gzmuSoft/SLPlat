'use strict';

    angular.module('app')
        .controller('ceeAnnualScoreUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
                                             function($scope, $rootScope, $state, $timeout, toaster) {
        var title = "";
        $scope.param = {};
        if($state.includes('**.ceeAnnualScore.update')){
            title="编辑历年分数线";
            var id = $state.params.id;
            activate(id);
            validate(id);
        }else if($state.includes('**.ceeAnnualScore.create')){
            title="添加历年分数线";
            validate(null);
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
    				url : '/ceeAnnualScore',
    				data: angular.toJson($scope.record)
    			}).then(callback);
            }
            function callback(result) {
                if(result.code ==200){//成功
                    toaster.clear('*');
                    toaster.pop('success', '', "保存成功");
                    $timeout(function(){
                        $state.go('main.baseInfo.ceeAnnualScore.list');
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
				url : '/ceeAnnualScore/read/detail',
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
                    ceeAnnualScoreName: {
                        required: true,
                        stringCheck:[],
                        maxLengthB:[20]
                    },
                    sortNo: {
                        required: true
                    }
                },
                messages: {
                    ceeAnnualScoreName: {
                        required: '请填写历年分数线名称',
                        maxLengthB:"历年分数线名称不得超过{0}个字符"
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