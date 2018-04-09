'use strict';

    angular.module('app')
        .controller('paramUpdateController', ['$scope', '$rootScope', '$state', '$timeout', 'toaster',
                                             function($scope, $rootScope, $state, $timeout, toaster) {
        var title = "";
        if($state.includes('**.param.update')){
            title="编辑参数";
            var id = $state.params.id;
            activate(id);
            validate(id);
        }else if($state.includes('**.param.create')){
            title="添加参数";
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
    				url : '/param',
    				data: angular.toJson($scope.record)
    			}).then(callback);
            }
            function callback(result) {
                if(result.code ==200){//成功
                    toaster.clear('*');
                    toaster.pop('success', '', "保存成功");
                    $timeout(function(){
                        $state.go('main.sys.param.list');
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
				url : '/param/read/detail',
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
                    paramKey: {
                        required: true,
                        stringCheck:[],
                        maxLengthB:[20]
                    },
                    paramValue: {
                        required: true,
                        stringCheck:[],
                        maxLengthB:[20]
                    }
                },
                messages: {
                    paramKey: {
                        required: '请填写参数键名',
                        maxLengthB:"参数键名不得超过{0}个字符"
                    },
                    paramValue: {
                        required: '请填写参数键值',
                        maxLengthB:"参数键值不得超过{0}个字符"
                    }
                },
                submitHandler: function() {
                    $scope.submit();
                }
            });
        }

    }]);