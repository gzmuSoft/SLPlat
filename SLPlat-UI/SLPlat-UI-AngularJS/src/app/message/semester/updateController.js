'use strict';

    angular.module('app')
        .controller('semesterUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
                                             function($scope, $rootScope, $state, $timeout, toaster) {
        var title = "";
        $scope.param = {};
        if($state.includes('**.semester.update')){
            title="编辑学期";
            var id = $state.params.id;
            activate(id);
            validate(id);
        }else if($state.includes('**.semester.create')){
            title="添加学期";
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
    				url : '/semester',
    				data: angular.toJson($scope.record)
    			}).then(callback);
            }
            function callback(result) {
                if(result.code ==200){//成功
                    toaster.clear('*');
                    toaster.pop('success', '', "保存成功");
                    $timeout(function(){
                        $state.go('main.message.semester.list');
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
				url : '/semester/read/detail',
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
                    semesterName: {
                        required: true,
                        stringCheck:[],
                        maxLengthB:[20]
                    },
                    sortNo: {
                        required: true
                    }
                },
                messages: {
                    semesterName: {
                        required: '请填写学期名称',
                        maxLengthB:"学期名称不得超过{0}个字符"
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